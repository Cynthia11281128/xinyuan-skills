#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VALIDATOR="${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py"

found=0
for skill in "$ROOT"/skills/*; do
  [ -d "$skill" ] || continue
  [ -f "$skill/SKILL.md" ] || continue

  if [ -f "$VALIDATOR" ]; then
    python3 "$VALIDATOR" "$skill"
  else
    grep -q '^---$' "$skill/SKILL.md"
    grep -q '^name:' "$skill/SKILL.md"
    grep -q '^description:' "$skill/SKILL.md"
    echo "basic validation passed: $skill"
  fi
  found=1
done

if [ "$found" -eq 0 ]; then
  echo "no skills found under $ROOT/skills"
fi
