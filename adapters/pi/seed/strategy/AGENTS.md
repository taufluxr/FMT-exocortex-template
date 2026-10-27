# DS-strategy — Pi instructions

**Repository type:** `DS/governance` (personal)

This repository is the strategic hub for personal plans, priorities, work-product
contexts, decisions, reviews, drafts, and inbox processing. Pi normally holds the
Strategist role (R1) here. The workspace-level `AGENTS.md` remains authoritative
for safety and the current manual-pilot boundaries. Personal IWE sessions start
at the parent workspace root, as recorded in `docs/PI-PERSONAL-POLICY.md`; the
workspace `.agents/skills` link is the only deployed skill projection.

This repository has no local skill link. Pi stops ancestor skill discovery at a
Git root, so a session started here does not load the IWE skills. If that
happens, do not assume they are loaded and do not create the link automatically:
ask the owner to restart at the workspace root.

Before acting on a request, ensure `docs/PI-PERSONAL-POLICY.md` has been explicitly read relative to this repository root. Reuse that read while its complete content remains available and no change or freshness concern is evidenced; a new user message alone does not require rereading. After compaction, reload it if only a summary or read-file list remains. It is the registry of the owner's `PP-NN` deviations from the upstream method, covering planning groups and WIP reporting, reconciliation cadence, working language, launch/profile choices, and GitHub routing. It does not override platform safety or approval gates. A decision the registry marks `not selected` is unresolved, not permission to pick a default. If the policy is missing, unreadable, ambiguous, or conflicts with applicable instructions, stop the affected action and ask the owner; do not invent defaults or run recovery scripts.

## Sources of truth

- Work-product index: `docs/WP-REGISTRY.md`
- Active work-product details: `inbox/WP-*`
- Current intent: `current/WeekPlan *.md` and any current DayPlan
- Personal strategy: `docs/Strategy.md`
- Dissatisfactions and change drivers: `docs/Dissatisfactions.md`

Do not create a parallel work-plan registry. Keep detail in the work-product
context and use the registry as an index.

## Repository boundaries

- Keep personal planning, coordination, and reflection here.
- Route domain knowledge to an appropriate `PACK-*` repository.
- Route implementation details to the relevant `DS-*` project repository.
- Keep secrets outside Git.
- Preserve the separation among `current/`, `inbox/`, `drafts/`, `docs/`, and
  `archive/`.

## Manual pilot rules

- Do not run repository scripts unless the user explicitly approves the exact
  script invocation.
- Do not install or enable `.githooks/` automatically.
- Do not pull, commit, push, or create a remote unless explicitly requested.
- Update planning files only through the Open–Work–Close method from the
  workspace Pi skills.
- Stage exact paths only when a commit is requested.

`CLAUDE.md` is retained as an upstream reference for Claude Code. For Pi,
`AGENTS.md` is the active repository contract.
