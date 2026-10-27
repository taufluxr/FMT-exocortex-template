---
name: iwe-month-close
description: Close the personal IWE month and hold the monthly strategy session in Pi as a manual fresh-session ritual. Use when the user says “закрываем месяц”, “закрытие месяца”, “подготовь закрытие месяца”, “стратегическая сессия”, “стратегирование на месяц”, or “month close”. Review the month's results and strategic position, choose the next month's results, and keep Week Close and Week Open separate.
disable-model-invocation: false
---

# Close an IWE month in Pi

This is the lightweight manual Pi subset of upstream Month Close (`../../../../memory/protocol-month-close.md`, `../../../../.claude/skills/month-close/SKILL.md`) and the monthly strategy session (`../../../../roles/strategist/prompts/strategy-session-monthly.md`), held as one ritual. The upstream method remains authoritative for concepts; WakaTime and the multiplier, drift, memory-health and behaviour scripts, the R-questionnaire, T-checklist and decommission triage, the decision-log file, the R23 verifier sub-agent, session guards, step-by-step stops and automatic commits are not ported.

Before planning writes, apply **Shared lifecycle rules** in `../../LIFECYCLE.md` (`adapters/pi/LIFECYCLE.md`, two directories above this skill's directory), resolved from this skill's physical source directory through reviewed deployment symlinks, not from the session cwd. A missing or unreadable reference blocks the affected action. Before drafting, follow its **Personal policy resolution** section; use the policy's group labels, meanings and reporting rules.

## 0. Scope guard

- closing the week, even the month's last one → `iwe-week-close` first; Month Close reads its results;
- opening the next week → `iwe-week-open`, which takes the month's handoff;
- reviewing and choosing the month's results, the strategic position and the next month's results → this skill.

Month Close works in a fresh Pi session from files on disk and local Git.

## 1. Establish the month

Determine the local date, then run the shared **Rhythm configuration guard for Day/Week rituals** in `week` mode. If it fails, report why and stop.

The closing month is the current month when the request comes in its last week, otherwise the previous month. A week belongs to the month that contains its Thursday. Report, without stopping, any week of the month whose Week Close is missing; its facts come from its DayPlans and are marked as such.

If `archive/MonthClose YYYY-MM.md` for this month exists with `status: closed`, summarize it and do not close the month again. Under prepared drafts every call goes through **Prepared drafts and short sittings**: without a report, reconstruct, write the draft and show part 1 (or stop when only preparation was asked); with `status: draft`, resume from it.

## 2. Reconstruct the month read-only

Read, when present:

1. the closing month's block in `DS-strategy/docs/Strategy.md` (state, quarter goals, monthly results, weekly review, hypotheses, not-this-month) and the quarter goals;
2. the month's WeekReports and WeekPlans in `DS-strategy/current/` and `DS-strategy/archive/`, their main results and the weekly checkpoints in `Strategy.md`;
3. the month's DayPlan main results only where a week has no WeekReport or the owner's own wording is needed;
4. `DS-strategy/docs/Dissatisfactions.md` and `DS-strategy/docs/Projects.md`;
5. the previous `archive/MonthClose YYYY-MM.md`, for its handoff to this month;
6. entries in project ledgers declared by the policy dated in the month (**Project ledgers as work carriers**);
7. `DS-strategy/docs/WP-REGISTRY.md` rows and contexts of work products accepted, paused or dropped in the month;
8. sources linked from a monthly result when its outcome cannot be judged without them;
9. the month's commits per repository using the shared **Local Git evidence for Day/Week rituals** rule with the month as the period; counts show where time went, not results.

Use read-only file and local Git commands, the shared rhythm guard and the policy-selected `gitrepos` evidence command. Do not run upstream month-close, strategy, drift, memory or setup scripts.

## 3. Prepare the Month Close draft

Prepare the draft under the shared **Reporting style** and, when the policy selects them, **Prepared drafts and short sittings**. Month Close has three parts; each fits one sitting and is approved and written on its own.

**Part 1 — the month's results.**

- **Main result:** the month's main observable result and its value, built from the weeks' main results in the owner's words;
- **Monthly results:** each monthly result — identifier, name — with its outcome (`done`, partly reached with what was reached, moved to the next month with the reason, or dropped), built from the weekly checkpoints and the month's evidence; when the month ends a quarter, the same for each quarter goal;
- **Praise:** what was hard this month and which of the owner's choices overcame it, plus the life side;
- **What was learned:** only under **No empty sections** in **Reporting style**;
- writes: the outcome lines into the closing month's block of `Strategy.md`, and the matching sections of `archive/MonthClose YYYY-MM.md`.

**Part 2 — the strategic position.**

- **Constraint:** whether the month's main constraint held, moved or was released;
- **Hypotheses:** a verdict for each hypothesis of the month (confirmed, refuted, too early, with the fact), and what it changes;
- **Phase and calibre:** only when `Strategy.md` declares them, whether they hold or move, with the signals;
- **Dissatisfactions:** every active entry — still active, resolved, reworded — and any newly voiced; entries unchanged for eight weeks or more need a close, a rewording or a review trigger;
- **Projects:** for each active project in `Projects.md`, one line on whether it moved and whether its status still fits; a project with no movement for the month gets a question, not a verdict;
- writes: the approved changes in `Dissatisfactions.md`, `Projects.md` statuses and the closing month's state section, and the matching sections of the MonthClose report.

**Part 3 — the next month** (the monthly strategy session):

- **Quarter goals:** when the next month opens a quarter, proposed goals per policy-defined group, with the owner's or team's stated objectives kept in their wording;
- **Monthly results:** three to eight proposed results for the next month, each with an identifier, a name, the quarter goal and project it serves, and an observable criterion; results moved from this month say why;
- **Constraint and hypotheses:** the main constraint of the next month and one to three hypotheses, each with a checkable criterion and the result it serves;
- **Not this month:** what is deliberately left out;
- **Handoff:** the proposed focus per group and the first action for the next Week Open;
- **Housekeeping:** under monthly weekly-file archival (**Weekly archival option**), the exact moves of the month's closed WeekPlans and WeekReports to `DS-strategy/archive/week-plans/` and `DS-strategy/archive/week-reports/`, with the live links that change; dirty state that needs the owner's action; captures; each omitted when empty;
- writes: a new `## Фокус: <month> <year>` block in `Strategy.md` above the closing month's, following the closing month's layout; the closing month's heading marked `— закрыт Month Close <date>`; the report's handoff section, `status: closed`; approved archival and captures.

Keep the existing layout and wording of `Strategy.md`; add or replace only the sections named above. Do not rename or renumber earlier months' results.

## 4. Approval gates

Apply the shared **Autonomous preparation and consolidated approval** rule per part. Monthly results, quarter goals, hypotheses and dissatisfactions are the owner's choices: propose, never decide. Without prepared drafts all three parts may be shown and approved together.

## 5. The MonthClose report

`DS-strategy/archive/MonthClose YYYY-MM.md` follows the previous report's layout when there is one, otherwise:

```markdown
---
type: month-close-report
period: YYYY-MM
closed: YYYY-MM-DD
status: draft | closed
coverage: weeks, DayPlans, ledgers and Git period read
---

# Month Close YYYY-MM

## Главное
## Результаты месяца
## Квартал            (only when the month ends a quarter)
## Стратегическая позиция
## Неудовлетворённости
## Проекты
## Что стало понятнее (only with content)
## За что себя похвалить
## Передача в следующий месяц
```

Planning results only: no tool runs, temporary paths or verification log.

## 6. Verify and report

After each part, re-read its changed sections; after the last part, check that:

- every monthly result of the closing month has an outcome, and every quarter goal when the quarter ends;
- the next month's block exists with results, constraint and handoff, and the closing month's heading is marked closed;
- `Strategy.md`, `Dissatisfactions.md`, `Projects.md` and the report agree;
- every approved archival move left no duplicate in `current/` and no broken live link;
- dirty state that needs the owner's action (**Reporting style**) is reported.

After a part that is not the last, report in one or two lines what was saved and which part comes next. After the last part return:

- **Month:** period;
- **Result:** main result, then the monthly results' outcomes;
- **Next month:** its results and constraint;
- **Next:** the first Week Open action;
- **Status:** only when blocked;
- **Git:** only state that needs the owner's action; commit/push only when performed or requested.

Only say **«Месяц закрыт.»** when all three parts are preserved and the checks above pass.
