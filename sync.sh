#!/usr/bin/env bash
# Link the frame-first skill into Claude, Codex, and Cline.
# Usage: ./sync.sh [--check]
#   (no args)  create/refresh symlinks
#   --check    report broken or missing links, change nothing
set -uo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO/skills"
TARGETS=("$HOME/.claude/skills" "$HOME/.codex/skills" "$HOME/.cline/skills")

check_only=0
[[ "${1:-}" == "--check" ]] && check_only=1

fail=0
for dir in "${TARGETS[@]}"; do
  if [[ ! -d "$dir" ]]; then
    echo "skip  $dir (harness not installed)"
    continue
  fi
  # Prune links left by the old eight-skill layout, or by any skill since removed.
  for link in "$dir"/*; do
    [[ -L "$link" ]] || continue
    target="$(readlink "$link")"
    [[ "$target" == "$REPO"/* ]] || continue
    [[ -e "$target" ]] && continue
    if (( check_only )); then
      echo "STALE    $link -> $target"; fail=1
    else
      rm -f "$link"; echo "pruned   $link (target gone)"
    fi
  done
  for skill in "$SRC"/*; do
    [[ -d "$skill" ]] || continue
    name="$(basename "$skill")"
    link="$dir/$name"
    if (( check_only )); then
      if [[ ! -e "$link" ]]; then
        echo "MISSING  $link"; fail=1
      elif [[ -L "$link" && ! -e "$(readlink "$link")" ]]; then
        echo "BROKEN   $link -> $(readlink "$link")"; fail=1
      else
        echo "ok       $link"
      fi
    else
      rm -f "$link"
      ln -s "$skill" "$link"
      echo "linked   $link -> $skill"
    fi
  done
done

if (( check_only )); then
  (( fail )) && { echo; echo "Some links need repair. Run ./sync.sh to fix."; exit 1; }
  echo; echo "All links healthy."
fi
