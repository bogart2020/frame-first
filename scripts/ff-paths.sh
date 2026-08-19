#!/usr/bin/env bash
# Resolve where frame-first's files live, from any working directory.
#
#   eval "$(~/.claude/skills/ff-critique/../../skills/../scripts/ff-paths.sh)"   # awkward
#   eval "$("$(dirname "$(readlink -f ~/.claude/skills/ff-init)")/../../scripts/ff-paths.sh")"
#
# Simplest use — the skills call it by absolute path once FF_HOME is known, but the
# script is self-locating, so this works from anywhere:
#
#   eval "$(/path/to/frame-first/scripts/ff-paths.sh)"
#   echo "$FF_DATA/voice.md"
#
# Prints shell assignments on stdout. FF_DATA honors $FRAME_FIRST_DATA when set,
# so the creator's profile can live outside the repo.
set -uo pipefail

FF_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
FF_DATA="${FRAME_FIRST_DATA:-$FF_HOME/data}"

echo "FF_HOME=$FF_HOME"
echo "FF_DATA=$FF_DATA"
echo "FF_REFS=$FF_HOME/references"
echo "FF_SCRIPTS=$FF_HOME/scripts"
