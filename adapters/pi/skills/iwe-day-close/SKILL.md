---
name: iwe-day-close
description: Close the personal IWE day in Pi as a manual fresh-session ritual. Use when the user says “завершаем день”, “закрываю/закрываем день”, “итоги дня”, “close the day”, or “day close”. Reconstruct the day from files and Git, show a draft before changing personal state, and keep Session Close separate.
disable-model-invocation: false
---

# Close an IWE day in Pi

This is the lightweight manual Pi subset of `../../../../memory/protocol-close.md`
Day Close. The upstream method remains authoritative, but Claude-only hooks,
subagents, integrations, and automation are unsupported in the manual Pi pilot.

Before planning writes, apply **Shared lifecycle rules** in `../../LIFECYCLE.md` (`adapters/pi/LIFECYCLE.md`, two directories above this skill's directory), resolved from this skill's physical source directory through reviewed deployment symlinks, not from the session cwd. They own contract reuse, personal policy resolution, weekly cadence, planning-projection boundaries, and the archival transaction. A missing or unreadable reference blocks the affected action.

## 0. Scope guard

Day Close is not Session Close:

- closing or finishing a specific work session → `iwe-session-close`;
- closing the whole day, daily results, or “завершаем день” → this skill;
- closing the whole week or summarizing weekly results → `iwe-week-close`.

Day Close is designed to work in a fresh Pi session. Treat files on disk and Git
as evidence; do not require the day's chat history.

## 1. Establish the day boundary

Determine the local date, then run the shared **Rhythm configuration guard for Day/Week rituals** in `day` mode before locating any DayPlan, WeekPlan, or WeekReport. If the guard fails, report why and do not search for or mutate planning files.

After the rhythm guard passes, resolve the shared **Weekly reconciliation cadence**. Under weekly-only, locate today's `DS-strategy/current/DayPlan YYYY-MM-DD.md` on every weekday and skip every weekly step. Otherwise locate today's DayPlan and apply the reference's **Weekly steps of the Session and Day rituals** for Day Close.

If an expected DayPlan or strategy-day pair is missing, report the drift and continue read-only reconstruction as an ad hoc factual draft without a preliminary question. Report the missing preservation destination in the consolidated proposal; do not create a retrospective DayPlan, WeekPlan, or WeekReport without explicit approval of that new boundary, and do not claim a preserved close without a valid destination.

## 2. Reconstruct facts read-only

Read, when present:

1. today's DayPlan;
2. weekly files only when they are in scope under the cadence;
3. `DS-strategy/docs/WP-REGISTRY.md`;
4. `memory/MEMORY.md`;
5. context files for work products named by today's plan, resolved through the reference's **Work-product context resolution and completion archival** contract;
6. today's entries in project ledgers declared by the policy (**Project ledgers as work carriers**);
7. today's commits and current dirty status using the shared **Local Git evidence for Day/Week rituals** rule.

Unless the policy selects the reference's **Weekly archival option**, also identify missed archival candidates under the reference's archival contract: only a closed registry row resolving uniquely to an inbox context qualifies.

Use read-only file and local Git commands, the shared rhythm guard, and the policy-selected `gitrepos` evidence command. Do not run setup, update, migration, day-close, synchronization, notification, MCP, or scheduling scripts.

Classify every planned work item as `done`, `partial`, `not started`, or
`unknown` under **Outcome is the owner's action** in **Reporting style**. Reconcile every repository with substantial commits in today's Git
scan against the DayPlan and WP contexts; include material work not named in
the plan as a separate ad hoc result rather than dropping it because it has no
registered WP. Inspect bounded commit subjects and affected paths as needed to
understand the result, without treating commits as proof of tests, acceptance,
or a push. Distinguish material progress from routine noise under the owner's
policy. Evidence may establish facts, but not the user's subjective result.

## 3. Prepare the close draft

Show the user a compact draft under the shared **Reporting style**. Classify every planned item and preserve each partial item's next action. The draft contains, in this order:

- **Results:** the main observable result first, then supporting work products and ad hoc items with their status and evidence limits;
- **Tomorrow:** the first concrete action and carry-over for each partial item;
- **Not forgotten:** dirty state that needs the owner's action (**Reporting style**), promises, blockers, and unresolved owner decisions; place any blocker affecting the main result prominently;
- **What was learned:** only under **No empty sections** in **Reporting style**;
- **Praise:** what was hard today and which of the owner's choices overcame it, plus the life side, in two or three specific sentences, never generic;
- **Archival candidates:** each eligible completed WP with exact source → destination, acceptance evidence, pointer effects and conflicts; omitted when there are none or under weekly archival;
- **Captures:** optional reusable knowledge with a proposed owning destination.

When the DayPlan contains reflection prompts, surface unanswered material
questions. Keep `multiplier`, video, and optional reflection sections absent when
disabled in `params.yaml` or rhythm config.

## 4. Approval gate

Apply the shared **Autonomous preparation and consolidated approval** rule: present the completed draft, material questions, recommended next actions, and required writes together. Do not edit or archive personal planning state before explicit approval. List optional captures and each exact archival plan as separately labeled approval items in the same proposal; one reply may approve all listed items or selected ones. Approval of the daily summary alone does not approve captures or archival; approving one candidate does not authorize unlisted moves or historical catch-up.

## 5. Preserve the approved result

After approval, make only direct, reviewable file changes:

- complete the daily-results section in today's DayPlan, including a non-empty
  first action for tomorrow;
- when weekly files are in scope, apply the reference's weekly steps for Day Close;
- archive the DayPlan under `DS-strategy/archive/day-plans/` after its results are complete, on every weekday under weekly-only and on non-strategy days otherwise; under weekly archival keep it in `current/`;
- update `WP-REGISTRY.md` only on an approved status transition, WP contexts only for material factual status/disposition/next-action changes, and `memory/MEMORY.md` only for a global context, blocker, or next-focus change;
- archive only individually approved completion candidates through the reference's archival transaction; leave every unapproved or ambiguous candidate untouched;
- route approved captures to their owning repository.

Preserve historical baseline facts rather than treating them as current-status drift.

## 6. Verify and report

Re-read the changed sections and check that:

- the summary and tomorrow's first action are non-empty;
- all partial work has a concrete next action;
- the DayPlan results, registry, memory, and affected WP contexts agree on current facts; compare weekly files only when they are in scope, without treating unchanged historical baseline status as drift;
- the archived DayPlan exists when applicable, or the DayPlan in `current/` holds the results under weekly archival;
- every approved WP archival has one resolved archive context, no inbox duplicate, preserved `done` status, complete marker and resolving approved current pointers;
- dirty state that needs the owner's action (**Reporting style**) is reported.

Return under the shared **Reporting style**:

- **Day:** date;
- **Result:** main observable outcome first, then concise supporting results;
- **Tomorrow:** unfinished work and first action;
- **Status:** only when blocked, with missing items;
- **Git:** only state that needs the owner's action (**Reporting style**); commit/push only when performed or requested;
- **Captures:** written or proposed, only when there are any.

Only say **“День закрыт.”** when the approved result is preserved and the checks
above pass.
