#!/usr/bin/env bash
# Deterministic first stage of the ff-critique gate.
#
#   ./scripts/slop-check.sh <draft-file>
#
# HARD hits  = phrases from the creator's own deny-list in data/voice.md. The creator chose
#              these, so a hit is decisive.
# SOFT hits  = universal AI tells from references/ai-tells.txt, plus structural patterns.
#              One soft hit is a prompt to look. Two or more warrants a FIX.
#
# Exit: 0 clean | 1 hard hit | 2 two or more soft hits
# This stage catches obvious surface patterns only. Semantic slop passes it cleanly,
# which is why ff-critique always runs its judgment pass afterward.
set -uo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DRAFT="${1:-}"

if [[ -z "$DRAFT" || ! -f "$DRAFT" ]]; then
  echo "usage: slop-check.sh <draft-file>" >&2; exit 64
fi

VOICE="$REPO/data/voice.md"
TELLS="$REPO/references/ai-tells.txt"
hard=0; soft=0

echo "== slop-check: $(basename "$DRAFT") =="

# ---- HARD: the creator's own deny-list ----
if [[ -f "$VOICE" ]]; then
  denylist="$(awk '/^## Words and phrases I would never use/{f=1;next} /^## /{f=0} f && /^[-*] /{sub(/^[-*] +/,"");gsub(/^"|"$/,"");print}' "$VOICE")"
  if [[ -n "$denylist" ]]; then
    while IFS= read -r phrase; do
      [[ -z "$phrase" ]] && continue
      if grep -qiF -- "$phrase" "$DRAFT"; then
        echo "HARD  your deny-list: \"$phrase\""; hard=$((hard+1))
      fi
    done <<< "$denylist"
  fi
else
  echo "note  data/voice.md absent - deny-list not checked. Run ff-init."
fi

# ---- SOFT: universal tells ----
if [[ -f "$TELLS" ]]; then
  while IFS= read -r phrase; do
    [[ -z "$phrase" || "$phrase" == \#* ]] && continue
    if grep -qiF -- "$phrase" "$DRAFT"; then
      echo "SOFT  AI tell: \"$phrase\""; soft=$((soft+1))
    fi
  done < "$TELLS"
fi

# ---- SOFT: structural patterns ----
if grep -qiE "it'?s not [a-z' ]{2,40}, it'?s" "$DRAFT"; then
  echo "SOFT  structure: the \"it's not X, it's Y\" pivot"; soft=$((soft+1))
fi
dashes=$(grep -o '—' "$DRAFT" | wc -l | tr -d ' ')
if (( dashes > 3 )); then
  echo "SOFT  structure: $dashes em-dashes"; soft=$((soft+1))
fi
if grep -qE '^[[:space:]]*[-*][[:space:]]+\*\*' "$DRAFT"; then
  echo "SOFT  structure: bold-prefixed bullet list"; soft=$((soft+1))
fi
if grep -qE '\?[[:space:]]*$' "$DRAFT" && grep -qiE '(thoughts|agree|which one|let me know)' "$DRAFT"; then
  echo "SOFT  structure: generic engagement-bait question"; soft=$((soft+1))
fi

echo "-- hard: $hard  soft: $soft --"
(( hard > 0 )) && { echo "VERDICT: hard hit. Replace the flagged phrase."; exit 1; }
(( soft >= 2 )) && { echo "VERDICT: $soft soft hits. Warrants a FIX."; exit 2; }
echo "VERDICT: surface clean. Semantic slop still passes this stage - judge it properly."
exit 0
