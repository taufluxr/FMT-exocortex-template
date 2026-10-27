---
name: iwe-day-open
description: Open the personal IWE day in Pi as a manual fresh-session ritual. Use when the user says “открываем день”, “открывай день”, “начинаем день”, “open the day”, or “day open”. Recover yesterday's results and current planning state, show a draft before writing a DayPlan, and keep Session Open separate.
disable-model-invocation: false
---

# Open an IWE day in Pi

This is the lightweight manual Pi subset of `../../../../memory/protocol-open.md`
Day Open. The upstream method remains authoritative, but Claude-only task tools,
ritual scripts, subagents, integrations, automatic Git mutations, and scheduling
are unsupported in the manual Pi pilot.

Before planning writes, apply **Shared lifecycle rules** in `../../LIFECYCLE.md` (`adapters/pi/LIFECYCLE.md`, two directories above this skill's directory), resolved from this skill's physical source directory through reviewed deployment symlinks, not from the session cwd. They own contract reuse, personal policy resolution, weekly cadence, planning-projection boundaries, and the archival transaction. A missing or unreadable reference blocks the affected action.

## 0. Scope guard

Day Open is not Session Open:

- opening the whole day or asking for today's focus → this skill;
- opening or planning the whole week → `iwe-week-open`;
- starting substantive work inside the day → `iwe-session-open` and its Work
  Product Gate;
- read-only questions and work under 15 minutes may still use the documented ad
  hoc exception.

Day Open must work in a fresh Pi session. Treat files on disk and local Git as
evidence; do not require yesterday's chat history.

## 1. Establish the day boundary

Determine the local date as the first action, then run the shared **Rhythm configuration guard for Day/Week rituals** in `day` mode before locating any DayPlan, WeekPlan, or WeekReport. If the guard fails, report why and do not search for or mutate planning files.

After that guard passes, resolve the shared **Weekly reconciliation cadence** and read `params.yaml` when present. Under weekly-only, use the normal DayPlan path on every weekday, consult the current WeekPlan read-only for today's focus under that reference, and skip the weekly reconciliation steps. Otherwise locate today's `DS-strategy/current/DayPlan YYYY-MM-DD.md` only on a non-strategy day and apply the reference's **Weekly steps of the Session and Day rituals** for Day Open.

If today's DayPlan already exists, use it as the read-only review/update target. Summarize its current state and prepare any proposed update without a preliminary question; do not overwrite it before approval.

## 2. Recover yesterday and current facts read-only

Read, when present:

1. yesterday's DayPlan under `DS-strategy/archive/day-plans/` or `current/`,
   from its `Итоги дня` heading to the end (find the line with `rg -n`; the morning plan above it is superseded);
   if yesterday was Saturday or Sunday and no DayPlan exists, treat that as
   ordinary absence, not missing work or a required Day Close. Look for the
   most recent available approved Day Close carry-over in preceding workdays
   without assuming that every weekday had a plan; if none is available, say
   that carry-over is unknown, not overdue. A user-provided account of the
   intervening days takes precedence over inferred activity. If the main
   observed result in that close lacks a WP identifier, do not treat it as
   anonymous by default: search the registry titles with a few subject terms
   (`rg -i`), then supported context filenames, and inspect a candidate's relevant
   dated result/acceptance evidence. A match is a candidate, not proof of
   owner acceptance or `done`; report ambiguity rather than assigning it;
2. under weekly-only, read the current WeekPlan intent and paired report metadata
   only as specified by **Weekly reconciliation cadence**; otherwise read the
   applicable weekly files under the full reconciliation steps;
3. `DS-strategy/docs/WP-REGISTRY.md`, selectively under **Contract reuse**;
4. `memory/MEMORY.md`;
5. context files for carry-over, relevant active work products, and any candidate found for yesterday's main result. Start with frontmatter and dated result/next-action sections; read complete additional sections or related contexts when a specific decision needs them. Do not preload every dependency or an entire roadmap to establish a title match;
6. yesterday's local commits and current dirty status, using the shared **Local Git evidence for Day/Week rituals** rule; include them in the draft only when they materially clarify the prior results or require attention.

Use only read-only file and local Git commands, the shared rhythm guard, and the policy-selected `gitrepos` evidence command. Do not run setup, update, synchronization, routing, day-open, calendar, notification, MCP, network, or tracker scripts.

Report contradictions as drift instead of silently repairing them. Evidence can
establish completed artifacts and repository state, but the user decides today's
intent, energy, availability, and priorities.

## 3. Build a realistic candidate plan

Use this order:

1. preserve every explicit carry-over and name yesterday's main observable result, even when it was unplanned or still `pending`. Do not turn yesterday's proposed next step into today's chosen focus when the owner supplies a different intent;
2. apply priorities and constraints stated by the user today;
3. review relevant `in_progress` or `pending` WPs selected from the registry, owner request, and daily carry-over for relevance, deadline, and a concrete result today;
4. include the configured self-development slot when enabled, or call out that
   it is absent;
5. keep the day's load realistic rather than silently scheduling all active work products; registry WIP counts belong to weekly rituals, not the day.

A broad theme such as learning IWE must be grounded in an existing work product,
a concrete artifact, or a time-boxed ad hoc learning block. If proposed work is not registered and exceeds the ad hoc exception, include only a clearly unapproved registration candidate with the Work Product Gate's scope, acceptance result, and budget proposal. Continue drafting; obtain explicit registration approval before treating it as a selected commitment or starting work.

Do not mark work products done, change budgets, or invent calendar availability
from weak evidence. A source you did not or could not check is reported as "not
checked", never as zero, empty, or unavailable.

## 4. Present the Day Open draft

Before changing personal planning state, show a compact draft under the shared **Reporting style**. Do not silently schedule all active work products. Preserve every approved carry-over and material risk even when the visible summary is short; grouping secondary items must not hide an unresolved decision. The draft contains, in this order:

- **Today:** the user's stated main outcome, why it matters, and constraints;
- **First action:** one immediately executable next step and the most important blocker or owner decision, if any;
- **Plan:** ordered supporting work products or blocks, briefly, each with a concrete result and rough time-box;
- **Yesterday:** observable results and every unresolved carry-over, with its disposition in today's plan or explicit deferral; after an unplanned weekend, describe the break and last known carry-over without flagging the absent weekend DayPlan as drift;
- **Not today:** only what the owner would otherwise expect today: carry-over moved to a later day, or new work set aside. Weekly selections without a block today are not listed; the weekly plan holds them. Omitted when there is nothing;
- **Requires attention:** other drift, unknown capacity, dirty repositories, blockers, and decisions needed from the user. Do not bury a material blocker here when it affects the main outcome.

Apply the shared **Autonomous preparation and consolidated approval** rule: prepare the draft in one pass, collecting material questions and recommendations without pausing unaffected work, regardless of `day_open.interactive`. Present required writes, any new-WP registration proposals, and separately labeled optional captures and exact archival plans together for correction or explicit approval. File changes still require approval.

## 5. Preserve the approved plan

After explicit approval, use direct, reviewable file edits only:

- for a normal day, including every weekday under weekly-only, create `DS-strategy/current/DayPlan YYYY-MM-DD.md` with a short context (one line linking the weekly plan and yesterday's results, plus today's known meetings and constraints), main result with the first action, ordered plan, `Not today` when non-empty, and attention items. No retelling of yesterday: each carry-over appears once, as a plan item or under `Not today`. A registration candidate is one plan line (name, budget, "регистрация в Session Open"); its scope and acceptance proposal belong to the Session Open gate;
- when weekly reconciliation is in scope, follow the reference's weekly steps for Day Open instead;
- regardless of weekly cadence, update registry only on an approved registration/status transition, WP contexts only for material factual status/disposition/next-action changes, and `memory/MEMORY.md` only for a global context, blocker, or next-focus change. Appearing in today's plan is not itself a factual status change or weekly commitment.

Never overwrite an existing DayPlan or archive a previous one without showing
that mutation and obtaining approval.

## 6. Verify and report

Re-read the changed sections and check that:

- the DayPlan date is correct; under weekly-only, verify the consulted WeekPlan and available paired report metadata as read-only intent evidence, and under full weekly reconciliation check the pair agreement required by that cadence;
- every planned block has a concrete result or next action;
- carry-over from yesterday is represented or explicitly deferred by the user;
- the first action is non-empty;
- planning files do not contradict factual work-product statuses;
- dirty state that needs the owner's action (**Reporting style**) discovered during recovery is reported.

Return under the shared **Reporting style**, with the first action and any decision blocking it right after the main result:

- **Day:** local date;
- **Focus:** approved main result and why it matters;
- **First action:** the immediate next step and any material blocking decision;
- **Plan:** ordered supporting blocks and time-boxes;
- **Not today:** carry-over moved or new work set aside, when there is any;
- **Status:** only when blocked;
- **Git:** only state that needs the owner's action (**Reporting style**); commit/push only when performed or requested.

Only say **“День открыт.”** when the approved plan is preserved and these checks
pass. Starting the first substantive block is a separate Session Open unless it
is an explicit ad hoc exception.
