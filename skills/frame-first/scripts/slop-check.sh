#!/usr/bin/env bash
# Deterministic first stage of the ff-critique gate.
#
#   ./scripts/slop-check.sh <draft-file>
#
# HARD hits  = phrases from the creator's own deny-list in the profile voice.md. The creator chose
#              these, so a hit is decisive.
# SOFT hits  = universal AI tells from the skill's references/ai-tells.txt, plus structural
#              patterns. One soft hit is a prompt to look. Two or more warrants a FIX.
#
# Exit: 0 clean | 1 hard hit | 2 two or more soft hits
# This stage catches obvious surface patterns only. Semantic slop passes it cleanly,
# which is why ff-critique always runs its judgment pass afterward.
set -uo pipefail

SKILL="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DRAFT="${1:-}"

if [[ -z "$DRAFT" || ! -f "$DRAFT" ]]; then
  echo "usage: slop-check.sh <draft-file>" >&2; exit 64
fi

VOICE="${FRAME_FIRST_DATA:-$HOME/.frame-first}/voice.md"
TELLS="$SKILL/references/ai-tells.txt"
hard=0; soft=0

echo "== slop-check: $(basename "$DRAFT") =="

# ---- HARD: the creator's own deny-list ----
if [[ -f "$VOICE" ]]; then
  denylist="$(awk '/^## Words and phrases I would never use/{f=1;next} /^## /{f=0} f && /^[-*] /{sub(/^[-*] +/,"");gsub(/^"|"$/,"");print}' "$VOICE")"
  if [[ -n "$denylist" ]]; then
    while IFS= read -r phrase; do
      [[ -z "$phrase" ]] && continue
      # An entry may label a literal rather than be one: `em dash (—)`, `"chills" / "goosebumps"`.
      # Match on the parenthetical's contents when present, so the rule actually fires.
      # Deliberately parameter expansion, not [[ =~ ]] — that captures empty on entries without
      # parentheses, and `grep -F ""` matches everything, turning the gate into a total blocker.
      lit="$phrase"
      case "$phrase" in
        *\(*\)) inner="${phrase##*\(}"; inner="${inner%\)}"
                [[ -n "$inner" ]] && lit="$inner" ;;
      esac
      [[ -z "$lit" ]] && continue
      if grep -qiF -- "$lit" "$DRAFT"; then
        echo "HARD  your deny-list: \"$phrase\""; hard=$((hard+1))
      fi
    done <<< "$denylist"
  fi
else
  echo "note  voice.md not found at $VOICE - deny-list not checked."
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
# Each was measured against the creator's real captions for false positives before adoption.
# See research/2026-08-21-ai-slop.md §4. Burstiness, perplexity and hedging density were
# REJECTED: this creator's lowercase register omits terminal punctuation, so sentence
# segmentation fails before the statistic is even computed.

# Antithesis pivot, extended — the old regex missed "wasn't just X. It was Y".
if grep -qiE "(it|this|that) ?(is|was|'s)? ?(not|n'?t) (just |only |merely |about )?[a-z' ]{2,40}[.,] +(it'?s|it was|that'?s|it is)" "$DRAFT" \
   || grep -qiE "not (only|merely|just) [a-z' ]{2,40}(,| ) ?but( also)? " "$DRAFT"; then
  echo "SOFT  structure: antithesis pivot (\"not X, it's Y\" / \"not only X but also Y\")"; soft=$((soft+1))
fi
# Tricolon closing a sentence.
if grep -qE '[A-Za-z]{3,}, +[A-Za-z]{3,}, +[A-Za-z]{3,}[.!?]' "$DRAFT"; then
  echo "SOFT  structure: three-item run closing a sentence (tricolon)"; soft=$((soft+1))
fi
# Sentence-initial discourse markers, count-based.
markers=$(grep -oiE '(^|[.!?][[:space:]]+)(moreover|furthermore|additionally|however|ultimately|overall|in conclusion|in essence|notably|importantly|that said)' "$DRAFT" | wc -l | tr -d ' ')
if (( markers >= 2 )); then
  echo "SOFT  structure: $markers sentence-initial discourse markers"; soft=$((soft+1))
fi
# Anaphora — repeated sentence openers.
anaph=$(awk '{n=split(tolower($0),s,/[.!?]+ */); for(i=1;i<=n;i++){split(s[i],w," "); if(w[1]!="")c[w[1]]++}}
 END{max=0; for(k in c) if(c[k]>max) max=c[k]; print max+0}' "$DRAFT")
if (( anaph >= 3 )); then
  echo "SOFT  structure: $anaph sentences opening with the same word"; soft=$((soft+1))
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
