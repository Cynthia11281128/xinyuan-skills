# xinyuan-skills

Personal Codex skills managed as source files.

## Layout

```text
skills/
  skill-name/
    SKILL.md
    references/
    scripts/
    assets/
scripts/
  install.sh
  validate.sh
```

Edit skills in this repository. Install them into Codex with:

```bash
./scripts/install.sh
```

By default, skills are copied to `${CODEX_HOME:-$HOME/.codex}/skills`.

## Add A Skill

Create a folder under `skills/` with a required `SKILL.md`:

```text
skills/my-skill/SKILL.md
```

Keep each skill's `description` specific. Codex uses the `name` and
`description` frontmatter to decide when a skill should trigger.
