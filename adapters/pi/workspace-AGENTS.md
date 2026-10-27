# IWE workspace instructions for Pi

This directory is a Personal IWE workspace instantiated from `FMT-exocortex-template`. Pi is the current agent harness and may hold IWE roles; the IWE methods and work products remain harness-independent.

## Precedence

When instructions conflict: the user's explicit in-session request, then the pilot boundaries below, then the instructions of the repository being changed, then the owner's personal decisions in `DS-strategy/docs/PI-PERSONAL-POLICY.md`, then the adapter method in `FMT-exocortex-template/adapters/pi/` and its skills, then global harness instructions. A conflict that this order does not resolve stops the affected action and goes to the owner.

Throughout, missing, ambiguous, or contradictory evidence is reported and blocks only the affected action, not independent preparation. Do not invent facts or infer permissions. Clearly labeled unapproved recommendations are allowed; collect material questions in the draft under the adapter's **Autonomous preparation and consolidated approval** rule. Do not run recovery scripts.

## Repository and ownership model

- `FMT-exocortex-template/` is the L3 Base/Format source for platform methods, protocols, adapters, and seeds. Do not put personal data there.
- `DS-strategy/` is the L4 personal governance repository for strategy, plans, work-product context, decisions, drafts, and inbox items.
- `PACK-*` repositories own domain knowledge; `DS-*` repositories own project implementation or published surfaces.
- Workspace-root `AGENTS.md`, `.agents/skills/`, child-repository skill projections, and platform files in `memory/` are deployment output. Change their source in `FMT-exocortex-template/`, then redeploy deliberately.
- In workspace `memory/`, platform files come from `FMT-exocortex-template/memory/`; the personal files — `MEMORY.md`, `day-rhythm-config.yaml`, `navigation.md` — are user-owned and may be symlinks into `DS-strategy/exocortex/`, where they are versioned. Edit a file at its authoritative location, never by replacing a symlink with a copy: a second editable carrier of the same fact drifts silently.
- `params.yaml`, extensions, `DS-strategy/exocortex/`, and personal repositories are user-owned state.
- The workspace root is not a Git repository, so files written there are unversioned and unignored by default: `.agent-shell/` transcripts, exported `pi-session-*.html`, `.DS_Store`, and editor state accumulate there indefinitely. They are session by-products, not workspace content. Never read them as a source of fact — a transcript records what was said, including what was later corrected — and never cite one in place of the durable surface that owns the fact. Removing them is owner-initiated housekeeping, not part of any ritual.
- The generated `FMT-exocortex-template/AGENTS.md` is a Claude/Kimi/Hermes artifact. It is reference only and never the Pi contract; do not edit it and do not follow its harness-specific rules. Its rule-by-rule disposition is recorded in `FMT-exocortex-template/adapters/pi/agents-md-coverage.md`.

## Current operating phase: manual Pi pilot

Until the user explicitly expands the scope:

- Do not run `setup.sh`, `update.sh`, role installers, migration scripts, or template scripts. Prefer direct file operations over installers.
- Do not create or enable launchd, systemd, cron, GitHub Actions, background agents, notifications, or automatic scheduling.
- Do not configure or call IWE MCP services automatically, and do not enable Git hooks.
- Do not pull, commit, push, create remotes, or create hosted repositories unless the user explicitly requests that Git operation. If a commit is requested, stage exact paths; never `git add .`, `git add -A`, or `git add -u`.
- No ritual, report, or approval to implement implies commit, push, backup, publication, delegation, or background work. Each is a separate explicit boundary.
- Preview every new mutation boundary and preserve a clear rollback.

## Personal decisions

`DS-strategy/docs/PI-PERSONAL-POLICY.md` is the single registry of the owner's deviations from the upstream method, as `PP-NN` decisions. Read it under **Personal policy resolution** in `FMT-exocortex-template/adapters/pi/LIFECYCLE.md`, which also defines reuse after compaction. It owns personal conventions; it does not override the boundaries above.

Planning drafts, results and reviews produced without a skill (a Strategy Session outside Month Close, ad hoc reviews) follow **Reporting style** in `FMT-exocortex-template/adapters/pi/LIFECYCLE.md` and the owner's policy. A Strategy Session follows the dispatcher in `FMT-exocortex-template/.claude/skills/strategy-session/SKILL.md` and the stage table «Этапы сессии» in `roles/strategist/prompts/strategy-session-monthly.md` (with the step files it names), without session-guard, isolated copies, `ds-publish.sh`, `/wp-new` or other scripts; proposed work products stay candidates until the owner approves them and are registered through Session Open, and writes follow the usual approval gate.

Do not add a personal preference to these workspace instructions or to a skill. Propose it as a new `PP-NN` row in the owner's policy, following its `PP-00` format, and wait for approval.

## Session method: Open → Work → Close

Session, Day, Week and Month rituals are separate, and none implies another. Each is a skill under `.agents/skills/`; its `description` defines when it applies, including the owner's Russian and English request phrases:

- `iwe-month-close` — the month's review and the next month's results;
- `iwe-week-open` / `iwe-week-close` — weekly intent and weekly facts;
- `iwe-day-open` / `iwe-day-close` — today's plan and today's results;
- `iwe-session-open` / `iwe-session-close` — substantive work and its preserved result;
- `iwe-note-review`, `iwe-pack-use` — note routing and read-only Pack consultation.

Use the ritual skill even in a fresh session. `iwe-session-open` owns the Work Product Gate and the ad hoc exception for questions, read-only investigation, emergencies, and work expected to stay under 15 minutes; say when that exception is used.

During work:

- Keep the user as decision-maker; Pi proposes rather than silently expanding scope.
- At meaningful milestones, offer useful captures and name their destination. Capture autonomy is manual: write a capture only after approval; it may be a separately labeled item in one consolidated ritual proposal.
- Route domain knowledge to a `PACK-*` repository when one exists, personal planning and coordination to `DS-strategy/`, and implementation details to the relevant `DS-*` repository.
- Work that relies on FPF Library methods: the library is `FPF/`; read `FPF/USING-FPF.md` first and follow it. Use the full pattern text, not a link, title or recollection; if it is unavailable, say so and leave the dependent conclusion open. Cite the FPF revision and pattern IDs. Personal routing, if any, is declared in the owner's policy.
- Before editing a child repository, read its `AGENTS.md`. If it has only `CLAUDE.md`, treat that file as upstream reference and apply only instructions compatible with this Pi contract.
- Pi stops ancestor skill discovery at a Git repository root. For sessions started inside a child repository, use its reviewed `.agents/skills` projection; otherwise start Pi at the workspace root.
- Before an operation expected to take more than about 180 seconds, say what is starting and how long it should take; report progress instead of leaving the user with silence.

## Source references

The upstream methodology remains authoritative for concepts and structure:

- `FMT-exocortex-template/docs/LEARNING-PATH.md`
- `FMT-exocortex-template/memory/protocol-open.md`
- `FMT-exocortex-template/memory/protocol-work.md`
- `FMT-exocortex-template/memory/protocol-close.md`

The Pi skills intentionally implement a small manual subset. Report unsupported upstream steps instead of inventing compatibility or running their scripts.
