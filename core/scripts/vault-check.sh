#!/usr/bin/env bash
# vault-check.sh: checks that the vault follows its conventions (rules R-03, R-22).
#   - every note has frontmatter with tags, status, related, created, last-updated
#   - every status value is one of the six allowed
#   - every tag is listed in reference/tag-registry.md
#   - every wikilink points at a file that exists
#   - every project folder has INDEX.md and status.md
# Reports problems with their location; changes nothing. Exit 0 = clean, 1 = issues found.
# Usage: bash core/scripts/vault-check.sh   (works from any directory)

set -u
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT" || { echo "vault-check.sh: cannot find vault root"; exit 1; }

ISSUES=0
report() { echo "  $1"; ISSUES=$((ISSUES + 1)); }

# Notes to check: every .md except templates, maintainer notes, Obsidian/git internals and the root README
NOTES=()
while IFS= read -r f; do NOTES+=("$f"); done < <(
  find . \( -path ./core/templates -o -path ./_dev -o -path ./.obsidian -o -path ./.trash -o -path ./.git \) -prune \
    -o -name '*.md' -print | sed 's|^\./||' | grep -vx 'README.md' | sort)

# Frontmatter block of a file (without the --- lines); empty if none
frontmatter() { awk 'NR==1 { if ($0 != "---") exit; next } $0 == "---" { exit } { print }' "$1"; }

REGISTERED="$(grep -o '^| `[^`]*`' reference/tag-registry.md 2>/dev/null | sed 's/^| `//; s/`$//')"
ALLOWED_STATUS=" draft active reference shelved deprecated archived "

echo "Frontmatter, status values and tags:"
for f in "${NOTES[@]}"; do
  fmt="$(frontmatter "$f")"
  if [ -z "$fmt" ]; then report "$f: no frontmatter"; continue; fi
  for k in tags status related created last-updated; do
    printf '%s\n' "$fmt" | grep -q "^$k:" || report "$f: frontmatter is missing '$k'"
  done
  st="$(printf '%s\n' "$fmt" | sed -n 's/^status:[[:space:]]*//p' | head -1)"
  if [ -n "$st" ] && [[ "$ALLOWED_STATUS" != *" $st "* ]]; then report "$f: status '$st' is not one of:$ALLOWED_STATUS"; fi
  tagline="$(printf '%s\n' "$fmt" | sed -n 's/^tags:[[:space:]]*//p' | head -1 | tr -d '[]')"
  IFS=',' read -r -a tags <<< "$tagline"
  for t in "${tags[@]}"; do
    t="$(echo "$t" | tr -d '[:space:]')"
    [ -z "$t" ] && continue
    printf '%s\n' "$REGISTERED" | grep -qx "$t" || report "$f: tag '$t' is not in reference/tag-registry.md"
  done
done

echo "Wikilinks:"
for f in "${NOTES[@]}"; do
  # drop fenced code blocks and inline code, then pull out [[targets]]
  awk '/^```/{c=!c; next} !c' "$f" | sed 's/`[^`]*`//g' | grep -o '\[\[[^]]*\]\]' | while IFS= read -r l; do
    t="${l#[[}"; t="${t%]]}"; t="${t%%|*}"; t="${t%%#*}"
    [ -z "$t" ] && continue
    [ -e "$t.md" ] || [ -e "$t" ] || echo "  $f: broken link $l (no file at $t.md)"
  done
done > /tmp/vault-check-links.$$
if [ -s /tmp/vault-check-links.$$ ]; then
  cat /tmp/vault-check-links.$$; ISSUES=$((ISSUES + $(wc -l < /tmp/vault-check-links.$$)))
fi
rm -f /tmp/vault-check-links.$$

echo "Project folders:"
for d in projects/*/; do
  [ -d "$d" ] || continue
  for need in INDEX.md status.md; do
    [ -f "$d$need" ] || report "${d}: missing $need (copy it from core/templates/project/)"
  done
done

echo
if [ "$ISSUES" -eq 0 ]; then echo "vault-check: clean"; exit 0
else echo "vault-check: $ISSUES issue(s)"; exit 1; fi
