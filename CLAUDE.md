# CLAUDE.md

@AGENTS.md

## Claude Code notes

- `AGENTS.md` (imported above) is the authoritative guide; this file only adds
  Claude Code specifics. Edit shared rules in `AGENTS.md`, not here.
- Project skills live in `.agents/skills/` and are exposed to Claude Code via
  the `.claude/skills` symlink (`rea-tool-design`, `rea-ci-tests-audit`,
  `rea-changelog-update`, `reverse-engineer-anything`).
- In cloud sessions `.claude/hooks/session-start.sh` installs locked
  dependencies. Run `npm run test:prepare` before integration/boundary tests
  that need generated catalogs; `npm run test:local -- PATH...` needs no build.
- Pre-push runs `npm run check:fast` via Husky; run it before pushing.
