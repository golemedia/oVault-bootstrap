#!/usr/bin/env bash
# board.sh: every project in one line, plus what needs attention.
# Reads only the frontmatter of projects/*/status.md (rule R-03). Writes nothing.
# Usage: bash core/scripts/board.sh   (works from any directory)

set -u
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT" || { echo "board.sh: cannot find vault root"; exit 1; }
NL=$'\n'

# fm FILE KEY: print KEY's value from FILE's frontmatter (empty if absent)
fm() {
  awk -v k="$2" '
    NR==1 { if ($0 != "---") exit; next }
    $0 == "---" { exit }
    {
      i = index($0, ":")
      if (i > 0 && substr($0, 1, i - 1) == k) {
        v = substr($0, i + 1)
        sub(/^[ \t]+/, "", v); sub(/[ \t]+$/, "", v)
        if (v ~ /^".*"$/) v = substr(v, 2, length(v) - 2)
        print v; exit
      }
    }' "$1"
}

TODAY="$(date +%F)"
CUTOFF="$(date -d '30 days ago' +%F 2>/dev/null || date -v-30d +%F 2>/dev/null || echo '')"
VER="$(tr -d '[:space:]' < core/VERSION 2>/dev/null || echo '?')"

echo "Board: $TODAY (release v$VER)"
echo

FLAGS=""; WAITS=""; UNCONF=""; STALE=""; MISSING=""; COUNT=0
for d in projects/*/; do
  [ -d "$d" ] || continue
  p="$(basename "$d")"
  s="${d}status.md"
  if [ ! -f "$s" ]; then MISSING="${MISSING}  ${p}: no status.md${NL}"; continue; fi
  COUNT=$((COUNT + 1))
  state="$(fm "$s" state)"; head="$(fm "$s" headline)"; next="$(fm "$s" next)"
  wait="$(fm "$s" waiting-on)"; flag="$(fm "$s" flag)"; ver="$(fm "$s" state-verified)"
  printf '%-22s %-17s %s\n' "$p" "${state:-?}" "$head"
  [ -n "$next" ] && printf '%-22s %-17s next: %s\n' "" "" "$next"
  [ -n "$flag" ] && FLAGS="${FLAGS}  ${p}: ${flag}${NL}"
  [ -n "$wait" ] && WAITS="${WAITS}  ${p}: ${wait}${NL}"
  [ "$state" = "built-unverified" ] && UNCONF="${UNCONF}  ${p}: ${head:-built, not yet confirmed}${NL}"
  case "$state" in
    done|shelved) ;;
    *) if [ -z "$ver" ]; then STALE="${STALE}  ${p}: never verified${NL}"
       elif [ -n "$CUTOFF" ] && [[ "$ver" < "$CUTOFF" ]]; then STALE="${STALE}  ${p}: last verified ${ver}${NL}"; fi ;;
  esac
done
[ "$COUNT" -eq 0 ] && echo "No projects yet."

section() { [ -n "$2" ] && { echo; echo "$1"; printf '%s' "$2"; }; }
section "Flagged:" "$FLAGS"
section "Waiting on you:" "$WAITS"
section "Built, not yet confirmed working (ask about these, R-16):" "$UNCONF"
section "Not verified in 30+ days:" "$STALE"
section "Project folders missing status.md (run vault-check.sh):" "$MISSING"

echo
if [ -f inbox.md ]; then
  n="$(awk 'f && /^- /{c++} /^## Items/{f=1} END{print c+0}' inbox.md)"
  m="$(date -r inbox.md +%F 2>/dev/null || echo '?')"
  echo "Inbox: $n item(s), last changed $m"
else
  echo "Inbox: inbox.md not found"
fi
