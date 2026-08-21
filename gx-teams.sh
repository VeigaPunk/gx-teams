#!/usr/bin/env bash
# gx-teams M01 — detached tmux team session, titled panes, hardcap 16, nuke.
set -euo pipefail

HARDCAP=16
STATE_ROOT="${GX_TEAMS_STATE:-$HOME/.gx-teams}"
ID_RE='^[A-Za-z0-9][A-Za-z0-9_-]{0,62}$'

usage() {
  cat <<'EOF'
Usage:
  gx-teams.sh spawn --team <team> --name <name> -- cmd <argv...>
  gx-teams.sh nuke  --team <team>
  gx-teams.sh dm    --team <team> --to <name> --text <text>
EOF
}

die() { printf 'gx-teams: %s\n' "$*" >&2; exit 1; }

# Allowlist: no :, ., /, space, .. — tmux grammar + path safety.
validate_id() {
  local kind="$1" val="$2"
  [[ -n "$val" ]] || die "$kind required"
  [[ "$val" =~ $ID_RE ]] || die "invalid $kind: $val (want $ID_RE)"
}

refuse_operator_team() {
  local team="$1"
  case "$team" in
    0|1) die "refusing operator team name: $team" ;;
  esac
}

session_name() { printf 'gx-teams-%s' "$1"; }

# Exact session target (tmux prefix-matches without =).
starget() { printf '=%s' "$1"; }

pane_count() {
  local s="$1"
  tmux list-panes -s -t "$(starget "$s")" 2>/dev/null | wc -l | tr -d ' '
}

ensure_state_under_root() {
  local team="$1"
  mkdir -p "$STATE_ROOT"
  local root dest
  root=$(realpath "$STATE_ROOT")
  mkdir -p "$STATE_ROOT/$team"
  dest=$(realpath "$STATE_ROOT/$team")
  case "$dest" in
    "$root"|"$root"/*) ;;
    *) die "state path escapes STATE_ROOT: $dest" ;;
  esac
  # refuse if dest is STATE_ROOT itself (team empty/..)
  [[ "$dest" != "$root" ]] || die "state path must be under STATE_ROOT"
  mkdir -p "$STATE_ROOT/$team/inboxes"
}

record_pane() {
  local team="$1" name="$2" pane="$3" pid="$4"
  ensure_state_under_root "$team"
  local dir="$STATE_ROOT/$team"
  local cfg="$dir/config.json"
  if command -v jq >/dev/null 2>&1 && [[ -f "$cfg" ]]; then
    jq --arg n "$name" --arg p "$pane" --arg pid "$pid" \
      '.panes[$n]={pane_id:$p,pane_pid:$pid}' "$cfg" >"$cfg.tmp" && mv "$cfg.tmp" "$cfg"
  else
    printf '{"team":"%s","panes":{"%s":{"pane_id":"%s","pane_pid":"%s"}}}\n' \
      "$team" "$name" "$pane" "$pid" >"$cfg"
  fi
}

cmd_spawn() {
  local team="" name=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --team) team="${2:-}"; shift 2 ;;
      --name) name="${2:-}"; shift 2 ;;
      --) shift; break ;;
      -h|--help) usage; exit 0 ;;
      *) die "unknown spawn arg: $1" ;;
    esac
  done
  validate_id team "$team"
  validate_id name "$name"
  refuse_operator_team "$team"
  [[ $# -gt 0 ]] || die "spawn requires -- <mode> <argv...>"

  local mode="$1"; shift
  case "$mode" in
    cmd) ;;
    claude|TeamCreate)
      die "denied mode: $mode (no wrap / no TeamCreate)" ;;
    *) die "unknown mode: $mode (want: cmd)" ;;
  esac
  [[ $# -gt 0 ]] || die "cmd requires a command"

  # Keep pane alive so capture-pane finds output (scout pattern A).
  local user_cmd inner
  user_cmd=$(printf '%q ' "$@")
  user_cmd=${user_cmd% }
  inner="${user_cmd}; exec sleep infinity"

  local S T
  S=$(session_name "$team")
  T=$(starget "$S")
  local parent=""
  if [[ -n "${TMUX:-}" && -n "${TMUX_PANE:-}" ]]; then
    parent=$(tmux display-message -t "$TMUX_PANE" -p '#{session_name}' 2>/dev/null || true)
  fi
  local id_env=(
    -e "GX_TEAM=$team"
    -e "GX_TEAMMATE_NAME=$name"
    -e "GX_TEAMMATE_ID=${name}@${team}"
    -e "GX_PARENT_SESSION=${parent}"
  )

  local meta pane pid
  if tmux has-session -t "$T" 2>/dev/null; then
    local n
    n=$(pane_count "$S")
    if (( n >= HARDCAP )); then
      die "hardcap $HARDCAP: session $S already has $n panes"
    fi
    meta=$(tmux new-window -t "$T" -d -P \
      -F '#{window_id} #{pane_id} #{pane_pid}' \
      -n "$name" \
      "${id_env[@]}" \
      -- bash -c "$inner")
    pane=$(awk '{print $2}' <<<"$meta")
    pid=$(awk '{print $3}' <<<"$meta")
  else
    # NEVER omit -d. NEVER use new-session -t (session group).
    meta=$(tmux new-session -d -P \
      -F '#{session_name} #{session_id} #{window_id} #{pane_id} #{pane_pid}' \
      -s "$S" -n "$name" -x 80 -y 24 \
      "${id_env[@]}" \
      -- bash -c "$inner")
    pane=$(awk '{print $4}' <<<"$meta")
    pid=$(awk '{print $5}' <<<"$meta")
  fi

  tmux select-pane -t "$pane" -T "$name"
  tmux set-option -t "$pane" remain-on-exit on
  # tmux -e can lag /proc/$pid/environ by a tick; gates read it immediately.
  local _i
  for _i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20; do
    if tr '\0' '\n' < /proc/"$pid"/environ 2>/dev/null | grep -qx "GX_TEAM=${team}"; then
      break
    fi
    sleep 0.05
  done
  record_pane "$team" "$name" "$pane" "$pid"
  printf '%s %s %s\n' "$S" "$pane" "$pid"
}

cmd_nuke() {
  local team=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --team) team="${2:-}"; shift 2 ;;
      -h|--help) usage; exit 0 ;;
      *) die "unknown nuke arg: $1" ;;
    esac
  done
  validate_id team "$team"
  refuse_operator_team "$team"
  local S T
  S=$(session_name "$team")
  T=$(starget "$S")
  # Never kill-server. Never touch operator sessions 0/1.
  if tmux has-session -t "$T" 2>/dev/null; then
    tmux kill-session -t "$T"
  fi
  if [[ -e "$STATE_ROOT/$team" ]]; then
    mkdir -p "$STATE_ROOT"
    local root dest
    root=$(realpath "$STATE_ROOT")
    dest=$(realpath "$STATE_ROOT/$team")
    case "$dest" in
      "$root"/*)
        [[ "$dest" != "$root" ]] || die "refusing rm of STATE_ROOT"
        rm -rf -- "$dest"
        ;;
      *) die "state path escapes STATE_ROOT: $dest" ;;
    esac
  fi
  printf 'nuked %s\n' "$S"
}

cmd_dm() {
  local team="" to="" text=""
  local have_text=0
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --team) team="${2:-}"; shift 2 ;;
      --to) to="${2:-}"; shift 2 ;;
      --text) text="${2:-}"; have_text=1; shift 2 ;;
      -h|--help) usage; exit 0 ;;
      *) die "unknown dm arg: $1" ;;
    esac
  done
  validate_id team "$team"
  validate_id name "$to"
  refuse_operator_team "$team"
  (( have_text )) || die "dm requires --text"
  local inbox_dir="$STATE_ROOT/$team/inboxes"
  # No mkdir here — missing dir must fail (never silent no-op).
  [[ -d "$inbox_dir" ]] || die "missing inboxes dir for team $team"
  local inbox="$inbox_dir/${to}.jsonl"
  local ts id line
  ts=$(date -u +%Y-%m-%dT%H:%M:%SZ)
  if [[ -r /proc/sys/kernel/random/uuid ]]; then
    id=$(< /proc/sys/kernel/random/uuid)
  else
    id="$(date -u +%s)-$$-$RANDOM"
  fi
  if command -v jq >/dev/null 2>&1; then
    line=$(jq -nc --arg ts "$ts" --arg id "$id" --arg to "$to" --arg text "$text" \
      '{ts:$ts,id:$id,from:"lead",to:$to,type:"dm",text:$text}')
  else
    die "jq required for dm JSON encode"
  fi
  # O_APPEND; print sent only if write succeeds
  printf '%s\n' "$line" >>"$inbox" || die "dm write failed: $inbox"
  printf 'sent\n'
}

main() {
  [[ $# -gt 0 ]] || { usage; exit 2; }
  local op="$1"; shift
  case "$op" in
    spawn) cmd_spawn "$@" ;;
    nuke)  cmd_nuke "$@" ;;
    dm)    cmd_dm "$@" ;;
    -h|--help) usage ;;
    *) die "unknown op: $op" ;;
  esac
}

main "$@"
