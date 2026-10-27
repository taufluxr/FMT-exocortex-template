# Minimal Pi adapter for IWE

A manual, file-first adapter that lets Pi use selected [IWE methods](../../docs/LEARNING-PATH.md). It provides instructions and nine skills, not an installer, runtime service, or complete port of the upstream automation.

## Contents and ownership

```text
adapters/pi/
├── README.md
├── LIFECYCLE.md
├── WEEKLY.md
├── ARCHIVAL.md
├── workspace-AGENTS.md
├── agents-md-coverage.md
├── skills/
│   └── iwe-*/SKILL.md
└── seed/strategy/
    ├── AGENTS.md
    └── docs/PI-PERSONAL-POLICY.md
```

| Layer | Owner |
|---|---|
| IWE concepts and full methods | Upstream template `memory/`, `roles/`, and `docs/`; referenced, not copied into this adapter |
| Manual Pi rituals, approval gates and planning-write rules | This adapter: [workspace instructions](workspace-AGENTS.md), [skills](skills/), and [shared lifecycle rules](LIFECYCLE.md) |
| What the generated root `AGENTS.md` covers, and what is deliberately not ported | [`agents-md-coverage.md`](agents-md-coverage.md), re-checked after each upstream update |
| Personal plans, decisions, context and conventions | The user's governance repository and `DS-strategy/docs/PI-PERSONAL-POLICY.md` |
| External tools and execution practices | Their own sources; selected through personal policy, not embedded in IWE rituals |

The [governance instruction seed](seed/strategy/AGENTS.md) and [neutral policy starter](seed/strategy/docs/PI-PERSONAL-POLICY.md) live here. They are starting material, not copies of a particular user's configuration. A deployed policy is user-owned and must never be overwritten by an adapter refresh. File presence is not automatic loading: the workspace and governance instructions explicitly require reading it. Policy cannot override platform safety or approval gates.

The adapter contains only a read-only rhythm-configuration guard and its small check; it has no ritual runner or extension. Native Pi sessions and compaction remain Pi's responsibility. Backup, recovery, command-blocking extensions, external integrations, and any future verification tooling require their own reviewed ownership and deployment; none is supplied or activated by these rituals.

## Manual deployment

Use an installed, authenticated Pi with trusted project `AGENTS.md` and `.agents/skills` discovery, a reviewed template checkout, and an IWE workspace containing `DS-strategy/`. Pi/provider installation is separate. Keep personal state out of the template.

Before changing deployment, show exact sources, destinations and existing contents or link targets. Preserve replaced files and links for rollback. Do not run template setup/update, migration or installer scripts.

1. Expose [workspace-AGENTS.md](workspace-AGENTS.md) as workspace `AGENTS.md`, by reviewed symlink or copy.
2. Expose this directory's `skills/` at workspace `.agents/skills`. For a template checkout directly under the workspace, the relative symlink target is `../FMT-exocortex-template/adapters/pi/skills`. A whole-directory link requires an absent destination or an explicitly reviewed existing link; otherwise expose only non-conflicting individual skills and preserve unrelated entries.
3. Start Pi at the workspace root. For this launch mode, the single workspace `.agents/skills` link is sufficient; no skill links inside the template or governance repository are needed. Reading or editing a child repository from that session does not require its own skill projection. Only if the owner later chooses sessions started inside a child Git repository, separately review exposing the skills at `<repo>/.agents/skills` (a direct child can link to `../../.agents/skills`). Pi stops ancestor discovery at a Git root; do not assume workspace skills are discovered from a child start or add those links automatically.
4. For a new governance repository only, review and copy `seed/strategy/AGENTS.md` and `seed/strategy/docs/PI-PERSONAL-POLICY.md` from this directory to the matching paths in `DS-strategy/`. Review personal policy before the first policy-dependent action. For an existing repository, preserve its instructions and policy; any changes need a separate exact preview. Create missing `docs/`, `inbox/`, `current/`, and an empty `docs/WP-REGISTRY.md` only after approval; do not copy someone else's plans or history.
5. Preserve the workspace's platform-memory deployment and user-owned `memory/MEMORY.md`, `memory/day-rhythm-config.yaml`, `params.yaml`, and personal extensions. For a new workspace, select and review the required platform files from template `memory/`; create personal configuration only when absent and approved. Day/Week rituals require a readable, valid rhythm configuration before searching planning files. A missing dependency is a stop, not permission to overwrite personal state or run setup.
6. Verify each selected skill resolves to the intended physical source. All nine skills must resolve `../../LIFECYCLE.md` to this directory's shared rules; upstream relative references must resolve within the reviewed template checkout. Resolve personal policy from the owning workspace, never from the skill source. Inspect project trust and discovered resources in Pi before relying on them.

Keep the adapter in its template-relative layout: `adapters/pi/skills/<name>/SKILL.md` uses `../../LIFECYCLE.md` for shared rules and `../../../../memory/`, `roles/`, or `docs/` for upstream references. Copying isolated skills into a discovery directory breaks that layout and is not a supported standalone deployment. If symlinks are unavailable, preserve the reviewed source layout in a copy and expose its skill paths through Pi's explicit skill configuration; review that deployment separately.

Symlinked source changes are live deployment changes. Coordinate them before edits and do not run lifecycle writes against a partially moved or mixed-version tree. A running session may retain previously loaded text; inspect/reload resources or start a fresh session before relying on changed discovery. Static link checks do not prove runtime loading or model compliance.

### Rollback

Restore only reviewed pre-change files, modes and link targets, checking for newer edits first. Restore source and discovery links together; remove only newly created projections. Never reset the entire workspace or governance repository. Rollback of adapter deployment does not undo planning writes or recreate deleted personal data, session logs, checkpoints, recovery projections or backups.

### After an upstream update

An accepted template update changes the contract, not only the documentation. Before relying on it, inspect what moved and re-establish the layering:

```bash
# <upstream> = the remote for TserenTserenov/FMT-exocortex-template, not your fork
git log --oneline HEAD..<upstream>/main -- AGENTS.md adapters/pi memory
git log -p -- AGENTS.md
```

1. Classify new or changed sections of the generated root `AGENTS.md` in [`agents-md-coverage.md`](agents-md-coverage.md): covered, adapt, or not applicable.
2. Check that removed duplicates did not return: a rule restated in a skill that the shared rules already own, or a personal convention restated in this reusable layer.
3. Check that the owner's personal decisions still resolve and do not silently contradict the updated method.
4. Run one ritual and compare its instruction load with the previous measurement.

## Bootstrap a new workspace

This is a manual first-install recipe for the nine supported workflows, not the whole upstream automated IWE and not a restore procedure for another user's setup. It assumes an installed/authenticated Pi and a reviewed local template checkout at `<workspace>/FMT-exocortex-template/`. Obtaining repositories, Git initialization/identity/encryption, provider access and backup are separate owner actions. The directory layout below does not itself establish a Git repository or durable backup.

Work only in an empty, owner-approved destination. Preview the exact file/link list and personal choices before creating anything. An existing destination turns this into a separately reviewed migration: do not merge, overwrite, or fill gaps silently. The instructions below are not permission to run bootstrap against an existing personal workspace.

### 1. Files and sources

Paths in the destination column are workspace-relative. `adapter` means this directory; `template` means the root of the reviewed FMT checkout. Create only the parent directories needed for these files, including `.agents/`, `memory/`, `DS-strategy/docs/`, `DS-strategy/inbox/`, and the initially empty `DS-strategy/current/`.

| Destination | Source / initial action | Ownership after creation |
|---|---|---|
| `AGENTS.md` | Link to `FMT-exocortex-template/adapters/pi/workspace-AGENTS.md` | Adapter source |
| `.agents/skills` | Link to `../FMT-exocortex-template/adapters/pi/skills` | Adapter source; the only discovery link needed for workspace-root sessions |
| `DS-strategy/AGENTS.md` | Copy adapter [seed/strategy/AGENTS.md](seed/strategy/AGENTS.md) | Governance-owned instructions; review later changes, never blindly refresh |
| `DS-strategy/docs/PI-PERSONAL-POLICY.md` | Copy adapter [policy starter](seed/strategy/docs/PI-PERSONAL-POLICY.md), then review choices below | Personal policy, never overwritten on refresh |
| `memory/protocol-open.md`, `memory/protocol-work.md`, `memory/protocol-close.md` | Copy the three same-named files from template `memory/`, byte-for-byte | Platform reference copies; deliberate source-first refresh only |
| `memory/MEMORY.md` | Create the small personal index described below, not a copy of template `memory/MEMORY.md` | Personal context |
| `memory/day-rhythm-config.yaml`, `params.yaml` | Create the reviewed minimal configuration below | Personal configuration |
| `DS-strategy/docs/WP-REGISTRY.md` | Create the empty index below | Personal lifecycle index |
| `DS-strategy/docs/Strategy.md` | Create a draft with owner-stated goals, horizon, constraints and open questions; mark unknowns explicitly | Personal strategy, not an inferred commitment |
| `DS-strategy/docs/Dissatisfactions.md` | Adapt template [seed/strategy/docs/Dissatisfactions.md](../../seed/strategy/docs/Dissatisfactions.md): set real creation/update dates, remove the sample active row, leave both sections empty until the owner supplies content | Personal change drivers |

Do not copy the template's whole `memory/` or `seed/strategy/` tree. The three protocol copies are upstream references, not additional authority to execute unsupported steps. The skills already resolve their upstream sources from the template checkout. If a deeper upstream read needs another document, consult that source in the checkout or stop at an unavailable dependency; do not silently expand the deployment. Packs and Base repositories are not required for basic file-first planning; Pack Use can only consult separately available, reviewed Packs and must report when none is present.

The upstream [Strategy seed](../../seed/strategy/docs/Strategy.md) is optional structural reference, not a drop-in minimal starter: it includes placeholders, Pack dependencies, Claude workflows and scheduled writers. Do not copy its `active` status or invented targets into a blank personal strategy. For the minimal draft, use `type: strategy`, `status: draft`, real `created`/`updated` dates, and headings `Goals`, `Horizon`, `Constraints`, `Open questions`; fill only owner-confirmed facts. Completing or accepting it is a separate approved work product, not an automatic bootstrap result.

Initial `memory/MEMORY.md` needs only an `Operational memory` heading, a next step such as “Review personal policy and propose the first work product; none registered yet”, and links to `../DS-strategy/docs/WP-REGISTRY.md` and `../DS-strategy/docs/PI-PERSONAL-POLICY.md`. Do not add a sample WP, mirror a portfolio table, or copy Claude-oriented Close/backup instructions from the upstream memory seed.

Create `DS-strategy/docs/WP-REGISTRY.md` with no data rows:

```markdown
# Work-product registry

| # | Name | Status | Repository | Budget |
|---|---|---|---|---|
```

Use numeric WP identifiers and explicit statuses from the closed list in Work-product status vocabulary below, only after the relevant approval. The shared lifecycle rules own registration, status transitions and completion archival. Do not import the upstream registry seed's writer instructions or use archive location as a completion status.

### 2. Personal choices and configuration

Before the first policy-dependent ritual, review the copied policy with the owner and resolve every row it marks `not selected`: planning groups and their meanings, protected boundaries, human-WIP reporting groups/ranges, reconciliation cadence, working language for chat and for documents, the workspace-root launch path, and any needed external-tool routing. A `not selected` row is an unresolved decision that blocks the action depending on it, not a default to fill in silently. Leave unselected external workflows unavailable; never infer accounts, delegation, profiles, or personal priorities. Keep these choices in the personal policy as `PP-NN` rows, following its `PP-00` format, not in the adapter. The starter's presence alone is not evidence that its choices were reviewed.

For `memory/day-rhythm-config.yaml`, confirm the two weekdays with the owner before using this example. Only lower-case `monday` through `sunday` are valid. These are reviewable starter values, not another user's schedule:

```yaml
day_open:
  strategy_day: monday
  week_close_day: sunday
  interactive: true
news:
  enabled: false
video:
  enabled: false
```

The strategy day affects DayPlan creation; the weekly checkpoint does not change ISO Monday–Sunday plan periods. No self-development slot is selected in this minimum; Day Open should report it as absent, not invent one. Missing or invalid rhythm configuration blocks Day/Week rituals even when there are no plans yet.

**Two paths name this one file.** The Pi skills read `memory/day-rhythm-config.yaml`, relative to the workspace root. Upstream `memory/protocol-open.md` resolves it as `${IWE_WORKSPACE}/${IWE_GOVERNANCE_REPO}/exocortex/day-rhythm-config.yaml`, inside the governance repository. Both must reach the same bytes, and one file must be the only editable carrier: keep the configuration at the governance path, where it is versioned and encrypted with the rest of personal state, and make `memory/day-rhythm-config.yaml` a symlink to it. Do not satisfy the two paths with two files — a second editable copy drifts silently, and the ritual that reads the stale one still validates cleanly. If the workspace has no governance-repository `exocortex/` directory, the workspace path may hold the real file, but then the upstream protocol reference is unresolved for this workspace and should be recorded as such rather than left to look satisfied.

Create `params.yaml` with unused upstream integrations disabled rather than copying the broader [params.yaml.example](../../params.yaml.example) unchanged:

```yaml
video_check: false
multiplier_enabled: false
reflection_enabled: false
lesson_rotation: false
auto_verify_code: false
verify_quick_close: false
telegram_notifications: false
capture_autonomy: manual
linear_sync_path: ""
external_tracker:
  adapter: none
```

These values do not install or disable runtime components on the machine; they express the manual configuration. Workspace approval gates remain authoritative. Never place credentials here or treat a later flag change as authorization to invoke a service.

### 3. Notes and drafts, when selected

Before using Note Review, create `DS-strategy/drafts/` and review this additional exact set; do not copy the whole upstream creative pipeline:

| Destination | Initial content / reviewed source |
|---|---|
| `DS-strategy/inbox/fleeting-notes.md` | Use the `Fleeting Notes` heading and new-note convention from [the upstream seed](../../seed/strategy/inbox/fleeting-notes.md): bold entries are new. Omit its scheduled processing and Telegram assumptions; notes start empty and review is manual. |
| `DS-strategy/drafts/README.md` | Copy only the `Формат файла` (file format) section from [the upstream draft guide](../../seed/strategy/drafts/README.md), under a `Drafts` heading. Preserve its `source_notes`, `target`, `created`, and `ttl` fields as a format example, not an actual draft. Add that drafts are private, file names use `D-NNN-<slug>.md`, and review, archival and publication require approval. Choose retention/review dates with the owner rather than adopting an automated TTL writer. |
| `DS-strategy/drafts/draft-list.md` | Create a `Draft list` heading and an empty table with columns `ID`, `Title`, `Source`, `Status`, `Created`, `Review date`, `Next action`. It is a manual draft index; do not copy the upstream seed's automatic Pack-to-post or mandatory pipeline instructions. |

No archive files, draft entries or processed notes are created by bootstrap. The selected ritual previews any later `archive/notes/`, `archive/wp-contexts/`, `archive/day-plans/`, `archive/week-plans/`, or `archive/week-reports/` creation before using it. Existing Packs are read-only sources; bootstrap neither creates nor clones one.

### 4. First session, week and day

1. Compare copied files with their selected sources (or the explicitly reviewed adapted content), inspect the two workspace symlinks, and check skill-relative README/upstream references. Confirm policy is readable from the workspace, rhythm values are valid, the registry has no sample work, and `current/` has no placeholder plans. Start Pi at the workspace root and inspect trusted/discovered resources. This is the bootstrap check, not proof of all ritual behavior.
2. Ask `/skill:iwe-session-open Propose my first work product: an initial personal strategy in DS-strategy/docs/Strategy.md. Ask me for goals, constraints, acceptance criteria and budget. No Git, network or automation.` Review the proposal before registration or substantive changes. With no WeekPlan, expect a missing-projection report, not an invented plan. The draft strategy created above is only a scaffold; it does not imply registration or acceptance.
3. Request Session Close separately when ready to preserve the result. A missing WeekReport remains an explicitly unresolved weekly projection, not permission to create one or claim complete reconciliation. Keep the result in the WP context; review unfinished reconciliation after an approved weekly pair exists.
4. Ask Week Open to propose the first pair. With no previous week, the existing skill proposes the next ISO Monday–Sunday period and reports missing prior context; it may warn that the open is early. Confirm the period and outcomes before approving one `WeekPlan WN.md` and paired `WeekReport WN.md` with the same ISO week-year, period and reciprocal links. Do not copy upstream `current/WeekPlan W1.md`, force a current-week period, or create a retrospective report to make the bootstrap look complete. If work needs a different first-period rule, resolve that separately instead of silently changing the skill.
5. Use Day Open separately when an applicable weekly plan exists; on the selected strategy day it uses weekly intent instead of creating a DayPlan. Start each substantive work block through Session Open. Never infer that approving bootstrap also approves a week, day, work product, capture, Git operation or external workflow.

No fresh-workspace Pi run is claimed by this recipe. An interactive smoke check, if wanted, requires its own approved disposable workspace, synthetic inputs and cleanup. Rollback uses the exact file/link list approved at the start; it does not reset an existing workspace or erase newly authored personal work.

## Use

A **work product (WP)** is an observable artifact with owner-approved scope and acceptance criteria. Its context owns decisions, results and the next action; the registry is only an index.

| Request | Skill |
|---|---|
| Start or resume substantive work | [iwe-session-open](skills/iwe-session-open/SKILL.md) |
| Preserve a session's result | [iwe-session-close](skills/iwe-session-close/SKILL.md) |
| Propose today's plan / review today's results | [iwe-day-open](skills/iwe-day-open/SKILL.md) / [iwe-day-close](skills/iwe-day-close/SKILL.md) |
| Propose weekly intent / review weekly facts | [iwe-week-open](skills/iwe-week-open/SKILL.md) / [iwe-week-close](skills/iwe-week-close/SKILL.md) |
| Review the month and choose the next month's results | [iwe-month-close](skills/iwe-month-close/SKILL.md) |
| Review and route fleeting notes | [iwe-note-review](skills/iwe-note-review/SKILL.md) |
| Consult an existing local Pack read-only | [iwe-pack-use](skills/iwe-pack-use/SKILL.md) |

For example: `/skill:iwe-session-open Resume WP-<number> from its context. Propose the next bounded change; no Git or network operations.` Review the opening contract and proposed writes. When ready to preserve results, request `/skill:iwe-session-close` separately and review its exact changes before approval. Receiving a report or finishing implementation does not itself request Close.

Session, Day and Week rituals remain separate. A missing plan/report is reported rather than invented; Session Open/Close does not create DayPlans or silently change weekly commitments. No ritual implies commit, push, backup, publication, delegation, or background work.

## Shared lifecycle rules

Rules shared by the nine skills live in [LIFECYCLE.md](LIFECYCLE.md), with conditional parts in [WEEKLY.md](WEEKLY.md) and [ARCHIVAL.md](ARCHIVAL.md), so a ritual loads them without the deployment and bootstrap sections of this README.

## Workflow differences and review status

This is a manual subset, not a compatibility guarantee. Session/Day/Week/Month skills refer to upstream Open/Close, Month Close and strategy-session sources; Note Review refers to the strategist's creative pipeline. Pack Use only reads existing local repositories. Claude task tools, hooks, automatic synchronization, complete upstream state-transition gates, Pack creation/validation/publication, calendar services and other runtime integrations are not ported. Report unsupported steps instead of simulating them or invoking setup scripts.

Only the rhythm guard has a small executable check; no ritual acceptance suite or fresh-session acceptance report ships with this minimal adapter. Check source references and discovery after layout changes; verify behavior separately in an owner-approved disposable workspace with synthetic data. Useful outcomes include missing-policy/config refusal, approval before writes, unchanged weekly baseline, facts only in the paired WeekReport, and collision-safe archival. These are verification candidates, not passing results or permission to run scenarios against personal plans. Historical counts for removed tests do not verify this layout.
