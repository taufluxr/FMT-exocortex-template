---
name: iwe-week-open
description: Open the personal IWE week in Pi as a manual fresh-session ritual. Use when the user says “открываем неделю”, “открой неделю”, “начинаем неделю”, “подготовь открытие недели”, “open the week”, or “week open”. Recover the previous weekly results and strategic context, show a draft before creating or activating a WeekPlan, and keep Day Open separate.
disable-model-invocation: false
---

# Open an IWE week in Pi

This is the lightweight manual Pi subset of the upstream weekly session-prep and strategy cycle described in `../../../../roles/strategist/prompts/session-prep.md`, with the Open–Work–Close principles from `../../../../memory/protocol-open.md`. The upstream method remains authoritative, but ritual scripts, Claude task tools, subagents, integrations, automatic Git mutations, notifications, and scheduling are unsupported in the manual Pi pilot.

Before planning writes, apply **Shared lifecycle rules** in `../../LIFECYCLE.md` (`adapters/pi/LIFECYCLE.md`, two directories above this skill's directory), resolved from this skill's physical source directory through reviewed deployment symlinks, not from the session cwd. A missing or unreadable reference blocks the affected action. Read its weekly part `../../WEEKLY.md` too; the planning-projection boundaries and bounded WeekPlan exceptions govern the writes below. Before drafting, follow its **Personal policy resolution** section and load the owner's policy; use its group labels, meanings, and reporting rules rather than built-in personal categories.

## 0. Scope guard

Week Open is not Day Open or Session Open:

- opening the weekly planning period and selecting weekly outcomes → this skill;
- opening today's plan after the week exists → `iwe-day-open`;
- starting substantive work on a selected work product → `iwe-session-open` and its Work Product Gate.

Week Open must work in a fresh Pi session. Treat files on disk and local Git as evidence; do not require a preceding Week Close in the same chat. Week Open does not silently close the previous week.

## 1. Establish the week boundary

Determine the local date first, then run the shared **Rhythm configuration guard for Day/Week rituals** in `week` mode before locating any WeekPlan or WeekReport. If the guard fails, report why and do not search for or mutate planning files.

Use the validated `week_close_day` as the weekly review and planning checkpoint, not the calendar-period boundary: WeekPlans remain ISO Monday–Sunday periods, and a Friday ritual may open the next ISO week before a protected weekend.

When a previous WeekPlan has an unambiguous period, derive the candidate as the immediately following ISO Monday–Sunday week. Otherwise derive the next ISO Monday–Sunday period from the local date and report the missing previous-week context. Use the ISO 8601 week number and week-year of the period as the identifier (`W01`–`W53`, rendered without a leading zero, for example `W36`). The identifier, filename, frontmatter and headings must agree. Do not continue a repository-local sequence such as `W1`, `W2` when it differs from the ISO calendar week.

Locate all `DS-strategy/current/WeekPlan *.md` and `WeekReport *.md` files whose periods overlap the candidate period:

- if an active or draft WeekPlan already covers the period, do not create a competitor; require at most one report with the same week identifier, week-year, and period, use it as the read-only review/revision target and prepare any proposed changes without creating a competitor;
- if the previous WeekPlan is not closed, or its WeekReport is absent, ambiguous, or not closed, report the drift and continue preparing a provisional next-week draft from unambiguous evidence; collect the close-versus-provisional-open decision in its approval proposal. Do not run Week Close or activate the candidate plan implicitly;
- if dates, identifiers, pair links, or periods conflict, stop and ask which pair is authoritative.

Warn when opening before the candidate period begins or after it has begun. A warning does not authorize changing dates silently.

## 2. Recover the weekly results and strategic facts read-only

Read, when present:

1. the approved results, unresolved-work decisions, and next-week decisions from the previous WeekReport in `current/` or `archive/week-reports/`, using its paired WeekPlan only for the frozen intent baseline;
2. an existing draft or active WeekPlan and paired WeekReport for the candidate period;
3. `DS-strategy/docs/Strategy.md` and `DS-strategy/docs/Dissatisfactions.md`;
4. `DS-strategy/docs/Projects.md`, then only the project roadmaps or next-step sources linked there that are needed to interpret the previous week's personal-project results;
5. `DS-strategy/docs/WP-REGISTRY.md`;
6. `memory/MEMORY.md`;
7. contexts for approved carry-over, `in_progress` work products, and relevant `pending` candidates;
8. current DayPlans only to detect conflicting already-approved commitments;
9. previous-period commits and current dirty status using the shared **Local Git evidence for Day/Week rituals** rule; include them in the draft only when they materially clarify prior results or stale status.

Before proposing the next personal-project selection, group the previous week's completed and materially advanced personal-project work products under the durable project names from `Projects.md`. List each work product with its full identifier and name, summarize aggregate progress for each project in one or two sentences, and include the next step from `Projects.md` or its linked roadmap when available. Put work without an unambiguous portfolio-project relationship in a separate unassigned/service-area group rather than silently forcing a classification. Recommendations are advisory and do not amend the weekly baseline without owner approval.

Use read-only file and local Git commands, the shared rhythm guard, and the policy-selected `gitrepos` evidence command. Do not run setup, update, migration, session-prep, week-open, synchronization, routing, calendar, tracker, notification, MCP, hook, or scheduling scripts.

Report contradictions as drift instead of silently repairing them. Evidence can establish artifacts and current state; the user decides weekly intent, capacity, energy, priorities, and acceptance of carry-over.

## 3. Build a realistic candidate week

**Confirmation after Week Close.** When the approved previous WeekReport already holds next-week decisions (focus, constraint, first action), the draft turns them into the plan and stays on one screen: the previous week is one line with its main result and a link, the plan follows those decisions, and at most two questions remain, the policy's own question included. Use the order below only for what those decisions leave open. When the policy selects prepared drafts, every call goes through **Prepared drafts and short sittings** and Week Open is one part.

Use this order:

1. preserve each explicit decision from the approved Week Close; collect unresolved or provisional items in the draft with clearly unapproved recommendations, without re-asking settled decisions;
2. apply the user's stated focus, capacity, deadlines, and constraints for this week;
3. review relevant `in_progress` and `pending` work products against strategy and available human attention;
4. select concrete weekly outcomes rather than scheduling every active work product;
5. place deliberately excluded active work under `Not in focus` so omission is visible;
6. list relevant registered work that is only a future candidate separately and do not imply that registration creates a weekly commitment;
7. identify one immediately executable first planning or work action.

Split selected outcomes into the policy-defined top-level groups without interleaving them. Apply the policy's group meanings and protected-boundary rules. For every selected work product include:

- concrete observable weekly result;
- rough budget or time-box;
- priority or ordering;
- known deadline or trigger;
- repository or owning boundary when material.

Keep human WIP explicit and small. Name the projects and work actually receiving human attention (**Project ledgers as work carriers**: registry counts only where the policy asks for them), state the intended operational ranges and report commitments and protected boundaries using the policy's human-WIP grouping rules. Agent-parallel work may be named separately, but do not treat agent capacity as free human attention. Do not carry unresolved items over automatically, mark work products done, alter their total budgets, or invent calendar availability from weak evidence. The approved selected outcomes form the frozen Week Open commitment baseline. Later work enters that baseline only through an explicit owner-approved amendment recorded with its date; registration, activation, roadmap decomposition, or insertion into an inventory table alone does not amend the weekly plan.

If proposed work exceeds the ad hoc exception and has no registered work product, include only a clearly unapproved registration candidate in the draft, with the Work Product Gate's scope, acceptance result, and budget proposal. Continue the rest of the draft; obtain explicit registration approval before treating it as a selected commitment or starting work.

## 4. Present the Week Open draft

Before changing personal planning state, show a compact draft under the shared **Reporting style**. The draft contains:

- **Boundary:** week identifier, exact date range, and whether opening is on time, early, or late;
- **Previous week:** one line with its main result and a link when its Week Close holds next-week decisions; otherwise its approved main result and value first, then approved results and the explicit carry-over, pause, and drop decisions, split into the policy-defined groups; within Personal Projects, include the project-grouped work-product list, one-to-two-sentence progress summaries, available roadmap next steps, and any unassigned items;
- **Focus:** a concise focus and main constraint for each policy-defined group;
- **Plan:** ordered selected outcomes with observable result and rough budget, split into the policy-defined groups without interleaving;
- **Human WIP:** the projects and work receiving attention and the intended concurrent human-attention range using the policy's human-WIP grouping rules, including commitments and protected boundaries;
- **Not in focus:** relevant active work deliberately excluded;
- **Future candidates:** relevant registered work that is neither selected nor treated as missed work;
- **Requires attention:** unresolved carry-over, strategic drift, conflicting plans, unknown capacity, materially relevant dirty repositories, and blockers;
- **Recommendation:** a short evidence-based suggestion for the next personal-project selection, clearly separated from approved commitments;
- **First action:** one immediately executable next step.

Apply the shared **Autonomous preparation and consolidated approval** rule; new-WP registration proposals join the same proposal. An existing draft WeekPlan still requires approval before activation; an existing active WeekPlan is changed only after approval. Unresolved previous-week closure requires an explicit choice to close separately or approve a provisional open; do not activate on a generic approval while that choice remains unresolved.

## 5. Preserve the approved plan

After explicit approval, make only direct, reviewable file changes:

- if no WeekPlan covers the period, create exactly one `DS-strategy/current/WeekPlan *.md` and one empty paired `WeekReport *.md` following the repository's naming and frontmatter convention; both files must carry the same week identifier, week-year, period, and reciprocal filename links;
- if a draft exists, update and activate that WeekPlan rather than creating another, and create or validate its empty paired WeekReport before activation;
- if an active plan exists, preserve its frozen commitment baseline and append only explicitly approved dated amendments; do not put current facts or historical results there;
- unless the policy selects monthly weekly-file archival (**Weekly archival option**), archive the previous closed WeekPlan and its closed paired WeekReport under `DS-strategy/archive/week-plans/` and `DS-strategy/archive/week-reports/` only when both still occupy `current/` and the new approved pair replaces them;
- record non-empty focus, constraint, a clearly labeled frozen commitment baseline of selected outcomes, budgets, human-WIP limit, `Not in focus`, future candidates, attention items, and first action;
- update registry only on an approved registration/status transition, affected WP contexts only for material factual status/disposition/next-action changes, and `memory/MEMORY.md` only for a global context, blocker, or next-focus change. Selecting an existing WP does not itself change its global status.

Do not archive an unclosed or ambiguous previous WeekPlan. Do not create a DayPlan; Day Open remains separate.

## 6. Verify and report

Re-read the changed sections and check that:

- exactly one current WeekPlan and one paired WeekReport cover the approved period;
- their identifiers, week-years, start dates, end dates, filenames, reciprocal links, and frontmatter agree;
- every selected work product has an observable weekly result and budget;
- every previous unresolved item is selected, paused, dropped, or explicitly left undecided by the user;
- the human-WIP limit, `Not in focus`, and first action are non-empty;
- WeekPlan intent, WeekReport facts, registry, memory, and affected WP contexts do not contradict one another;
- no DayPlan was created;
- dirty state that needs the owner's action (**Reporting style**) is reported;
- no script other than the shared rhythm guard and read-only `gitrepos` evidence command, integration, commit, push, hook, notification, scheduler, or background agent was invoked.

Return:

- **Week:** identifier and date range;
- **Focus:** approved weekly result and main constraint;
- **Plan:** ordered work products and budgets;
- **Human WIP:** approved limit;
- **Deferred:** `Not in focus` items;
- **First action:** immediate next step;
- **Status:** only when blocked;
- **Git:** only state that needs the owner's action (**Reporting style**); commit/push only when performed or requested.

Only say **“Неделя открыта.”** when the approved WeekPlan is preserved and all checks above pass. Opening today's plan is a separate Day Open, and starting the first substantive work item is a separate Session Open unless it is an explicit ad hoc exception.
