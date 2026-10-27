---
name: iwe-week-close
description: Close the personal IWE week in Pi as a manual fresh-session ritual. Use when the user says “закрываем неделю”, “закрываю неделю”, “итоги недели”, “подготовь закрытие недели”, “close the week”, or “week close”. Reconstruct weekly evidence, show a draft before changing planning state, and keep Day Close and Session Close separate.
disable-model-invocation: false
---

# Close an IWE week in Pi

This is the lightweight manual Pi subset of `../../../../memory/protocol-close.md` Week Close and `../../../../.claude/skills/week-close/SKILL.md`. The upstream method remains authoritative, but Claude task tools, ritual scripts, subagents, integrations, automatic Git mutations, backups, notifications, and scheduling are unsupported in the manual Pi pilot.

Before planning writes, apply **Shared lifecycle rules** in `../../LIFECYCLE.md` (`adapters/pi/LIFECYCLE.md`, two directories above this skill's directory), resolved from this skill's physical source directory through reviewed deployment symlinks, not from the session cwd. A missing or unreadable reference blocks the affected action. Read its weekly part `../../WEEKLY.md` too; the planning-projection boundaries and bounded WeekPlan exceptions govern the writes below. Before drafting, follow its **Personal policy resolution** section and load the owner's policy; use its group labels, meanings, and reporting rules rather than built-in personal categories.

## 0. Scope guard

Week Close is not Day Close or Session Close:

- closing a specific work session → `iwe-session-close`;
- closing the whole day or summarizing daily results → `iwe-day-close`;
- reviewing the full weekly period and deciding its unresolved work → this skill.

Week Close must work in a fresh Pi session. Treat files on disk and local Git as evidence; do not require the week's chat history. Week Close does not open the next week.

## 1. Establish the week boundary

Determine the local date first, then run the shared **Rhythm configuration guard for Day/Week rituals** in `week` mode before locating any WeekPlan or WeekReport. If the guard fails, report why and do not search for or mutate planning files.

Use the validated `week_close_day` as the weekly review checkpoint, not the calendar-period boundary: WeekPlans remain ISO Monday–Sunday periods, and a Friday ritual may close and plan them before a protected weekend.

Locate exactly one current `DS-strategy/current/WeekPlan *.md` and its paired `WeekReport *.md`. Determine the period from frontmatter or an explicit period in each document, and require matching week identifier, week-year, period, and reciprocal filename links. If no unambiguous current pair exists, report the drift and ask which pair to close; never infer a period solely from a filename or write facts back into WeekPlan.

Note whether the close is early or late against the configured ritual day. If the plan is already closed, summarize it and do not close it again.

## 2. Reconstruct weekly facts read-only

Read, when present:

1. the WeekPlan and paired WeekReport for the closing period;
2. DayPlans in `DS-strategy/current/` and `DS-strategy/archive/day-plans/` whose dates fall inside that period;
3. `DS-strategy/docs/WP-REGISTRY.md`;
4. `memory/MEMORY.md`;
5. context files for every work product named by the WeekPlan and for material work discovered during the period, resolved through the reference's **Work-product context resolution and completion archival** contract;
6. relevant approved weekly results or next-week decisions already present in the WeekReport;
7. commits during the exact period and current dirty status using the shared **Local Git evidence for Day/Week rituals** rule;
8. the period's entries in project ledgers declared by the policy (**Project ledgers as work carriers**);
9. the current month's results and their checkpoint/review section in `DS-strategy/docs/Strategy.md`, `DS-strategy/docs/Dissatisfactions.md` and `DS-strategy/docs/Session Agenda.md`, when present.

Under prepared drafts every call of this skill goes through **Prepared drafts and short sittings**: without a draft for this week, reconstruct the list above, write the draft and show part 1 (or stop after writing when only preparation was asked); with a draft, resume from it instead of reconstructing.

Under the shared **Weekly reconciliation cadence** weekly-only option, this ritual performs the deferred weekly reconciliation. Do not treat absence from WeekPlan/WeekReport as absence of work. Use registry entries and bounded context metadata/dated-result discovery across supported inbox and archive locations to find WPs started, advanced, or completed in the period; resolve each selected context uniquely before reading its result sections. Use dated WP evidence, not file modification time alone. Include emergent work without retroactively adding it to the frozen baseline. Do not create a separate weekly-sync queue or require Session Close to have updated WeekReport.

Use read-only file and local Git commands, the shared rhythm guard, and the policy-selected `gitrepos` evidence command. Do not run setup, update, migration, synchronization, week-close, backup, notification, MCP, tracker, calendar, hook, or scheduling scripts.

Classify every planned work product as `done`, `partial`, `not started`, or `unknown` (see also **Outcome is the owner's action** in **Reporting style**):

- `done` requires an observable acceptance result, not only activity or a status label;
- `partial` requires a concrete achieved result and a remaining next action;
- `not started` requires no material progress evidence;
- `unknown` is used when evidence conflicts or the user's judgment is required.

Evidence may establish artifacts, commits, and repository state. The user decides subjective outcomes, reasons, lessons, and whether unresolved work should be carried over, paused, or dropped.

Identify missed archival candidates under the reference's archival contract: only a closed registry row resolving uniquely to an inbox context qualifies.

Reconstruct the weekly commitment baseline separately from the end-of-week registry or table. The baseline contains only outcomes selected at Week Open plus later additions that the owner explicitly accepted as dated weekly-plan amendments. Do not treat a work product created, registered, activated, or appended during roadmap decomposition as a weekly commitment by default. Report materially advanced emergent work and future candidates separately. If the authoritative baseline cannot be reconstructed, omit the completion fraction rather than using the end-of-week inventory as its denominator.

## 3. Prepare the Week Close draft

Prepare the draft under the shared **Reporting style** and, when the policy selects them, **Prepared drafts and short sittings**. Week Close has three parts; each fits one sitting and is approved and written on its own.

**Part 1 — the week's results.**

- **Main result:** the week's main observable result and its value, built from the main-result sections of the period's DayPlans in the owner's words where present; the heading names the week and its dates;
- **Results:** split into the policy-defined top-level groups, and within each distinguish baseline commitments, explicitly dated amendments, materially advanced emergent work, and future candidates; the distinction records the origin of intent, not a ranking of value;
- **Praise:** what was hard this week and which of the owner's choices overcame it, plus the life side;
- **What was learned:** only under **No empty sections** in **Reporting style**;
- writes: the weekly-results section of the paired WeekReport, and registry/WP context changes only for approved status transitions.

**Part 2 — unresolved work.**

- each partial or not-started planned item with choices `carry over` (with a day or trigger), `pause` (with a return condition) or `drop`; recommend a disposition and next action when evidence supports one, clearly unapproved; apply **Stalled carry-over**;
- **Not forgotten:** promises, blockers and unresolved unknowns;
- writes: the dispositions in WeekReport and the affected WP contexts.

**Part 3 — the month and the next week** (the weekly strategy session):

- **Strategy checkpoint:** when `Strategy.md` has current monthly results, one line per monthly result that moved this week — identifier, name, movement, with titled work products or ledger IDs — and one line naming the rest; never a bare `0`. If the current month has no checkpoint/review section, include creating one. Report earlier unfilled checkpoints of the month and offer to fill them from their WeekReports;
- **Priorities question:** one question whether anything in the month's priorities changes. If the week's evidence or the owner's answer changes a monthly result, its status or the phase, propose Month Close (`iwe-month-close`) instead of deciding it here;
- **Dissatisfactions:** only entries in `Dissatisfactions.md` resolved or newly voiced this week, or unchanged for eight weeks or more, each with a proposed close, rewording or review trigger; omitted otherwise;
- **Irregular blocks:** only items of `Session Agenda.md` whose trigger applies this week; omitted otherwise;
- **Load:** one question whether the owner keeps the current pace, with the projects that received attention (**Project ledgers as work carriers**);
- **Next week:** the proposed focus per policy-defined group, the main constraint and a first action, for Week Open to confirm;
- **Housekeeping:** dirty state that needs the owner's action (**Reporting style**), separately labeled archival candidates (exact source → destination, acceptance evidence, pointer effects and conflicts) and captures; each omitted when empty;
- writes: the checkpoint entry in `Strategy.md` (creating the section only when approved, other sections untouched), approved `Dissatisfactions.md` changes, the next-week decisions in WeekReport, the WeekReport and WeekPlan lifecycle state set to closed, approved archival and captures.

Use the policy's group meanings and protected-boundary rules consistently; do not replace them with inferred categories.

Do not silently convert all `in_progress` or `pending` items into carry-over. A work product can remain active in the registry without being selected for the next week. Future candidates that were never weekly commitments do not require a Week Close disposition; Week Open may consider them without describing them as missed work.

## 4. Approval gates

Apply the shared **Autonomous preparation and consolidated approval** rule per part: each part's proposal holds its required writes and its separately labeled optional items. Without prepared drafts all three parts may be shown and approved together.

## 5. Preserve the approved close

After each part's approval, make only the writes listed for that part, as direct, reviewable file changes:

- preserve the WeekPlan's frozen commitment baseline; change only its lifecycle state, and record outcomes only in WeekReport;
- update `WP-REGISTRY.md` only on an approved status transition, affected WP contexts only for material factual status/disposition/next-action changes, and `memory/MEMORY.md` only for a global context, blocker, or next-focus change;
- preserve the next-week decisions in WeekReport without creating or activating a new WeekPlan;
- archive only individually approved completion candidates through the reference's archival transaction; leave every unapproved or ambiguous candidate untouched;
- route only separately approved captures to their owning repository.

Do not move unresolved work into a new week automatically. Keep the closed WeekPlan in place; Week Open or, under monthly weekly-file archival, Month Close owns its archival.

## 6. Verify and report

After each part, re-read its changed sections and apply the checks below that concern them; after the last part, all of them:

- the recorded date range matches both the closed WeekPlan and WeekReport;
- every planned work product has exactly one weekly classification;
- every `done` item names an observable acceptance result;
- every unresolved item has an owner-approved disposition and, unless dropped, a concrete next action or trigger;
- WeekPlan intent, WeekReport facts, registry, memory, and affected WP contexts do not contradict one another;
- no next WeekPlan was created or activated;
- the approved strategy-checkpoint entry is present in `Strategy.md`, or its absence or the owner's skip is reported;
- every approved WP archival has one resolved archive context, no inbox duplicate, preserved `done` status, complete marker and resolving approved current pointers;
- dirty state that needs the owner's action (**Reporting style**) is reported;
- no script other than the shared rhythm guard and read-only `gitrepos` evidence command, integration, backup, commit, push, hook, notification, scheduler, or background agent was invoked.

Return:

- **Week:** identifier and date range;
- **Result:** main result and its value, then concise results per policy-defined group;
- **Unresolved:** approved carry-over, pause, and drop decisions;
- **Next:** first Week Open question or action;
- **Status:** only when blocked, with missing items;
- **Git:** only state that needs the owner's action (**Reporting style**); commit/push only when performed or requested;
- **Captures:** written or proposed, only when there are any.

After a part that is not the last, report in one or two lines what was saved and which part comes next. Only say **“Неделя закрыта.”** when the approved result is preserved and all checks above pass.
