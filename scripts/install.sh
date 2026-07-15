#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${CODEX_HOME:-$HOME/.codex}/skills"

mkdir -p "$DEST"

found=0
for skill in "$ROOT"/skills/*; do
  [ -d "$skill" ] || continue
  [ -f "$skill/SKILL.md" ] || continue

  name="$(basename "$skill")"
  rsync -a --delete "$skill/" "$DEST/$name/"
  echo "installed $name -> $DEST/$name"
  found=1
done

if [ "$found" -eq 0 ]; then
  echo "no skills found under $ROOT/skills"
fi
