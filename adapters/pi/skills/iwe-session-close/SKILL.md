---
name: iwe-session-close
description: Close one personal IWE work session in Pi by preserving results, updating the work-product context, proposing captures, and reporting the next action. Use for “закрываем сессию”, “закрывай”, “finish the session”, or “wrap up”. Do not use for Day Close or Week Close requests; use iwe-day-close or iwe-week-close instead.
disable-model-invocation: false
---

# Close an IWE session in Pi

## Scope guard

This skill closes one work session, not a day or week. If the user asks to close
the day or summarize daily results, use `iwe-day-close`. If the user asks to close
the week or summarize weekly results, use `iwe-week-close`.

This is the manual Pi subset of `../../../../memory/protocol-close.md`. It preserves
the upstream Exit Protocol—artifact, status, notification—without Claude hooks,
subagents, scheduling, automatic Git operations, or background work.

Before planning writes, apply **Shared lifecycle rules** in `../../LIFECYCLE.md` (`adapters/pi/LIFECYCLE.md`, two directories above this skill's directory), resolved from this skill's physical source directory through reviewed deployment symlinks, not from the session cwd. They own contract reuse, personal policy resolution, weekly cadence, planning-projection boundaries, and the archival transaction. A missing or unreadable reference blocks the affected action. Only the interactive IWE lifecycle owner performs approved planning writes.

## 1. Establish session facts

Establish what actually happened from the session, relevant files and owner-confirmed evidence, within the approved WP scope. Distinguish attempted work, observed results, unrun checks and owner acceptance. Missing, ambiguous or conflicting evidence blocks the affected status or result claim; mark it unknown and collect the question in the draft rather than inventing completion or pausing unaffected reconstruction. Receiving a report alone does not request Session Close.

Resolve the shared **Weekly reconciliation cadence** before weekly discovery. Under weekly-only, close against the WP, registry, and relevant memory without locating or pairing weekly files, and preserve dated result evidence and next actions in the WP for the weekly review; otherwise apply the reference's **Weekly steps of the Session and Day rituals** for Session Close.

Before writing, apply the shared **Autonomous preparation and consolidated approval** rule: show the exact proposed WP/status/memory changes and any in-scope WeekReport changes together with material questions and separately labeled optional captures and exact archival plans from steps 2–3. Obtain required owner approval once for the listed actions; do not write the core result before presenting the complete proposal. Preserve the result facts and approved reconciliation intent in the WP context before any ancillary registry, memory, or WeekReport projection. Record each required destination path/section, expected prior state, bounded change and observable completion check; explicitly distinguish non-required and unresolved projections.

Verify each required projection before reporting complete reconciliation. If any write fails, preserve the result and report the exact partial state: completed writes, unfinished projections and conflicts. On retry, inspect that state and reuse recorded approval for unfinished writes only when its intent and expected prior state still match; otherwise obtain owner resolution. Never duplicate result facts or already-satisfied projections; apply only approved changes whose expected prior state still matches. Missing intent, changed approval, or conflicting newer state requires owner resolution, not reconstructed permission or overwriting newer facts. Do not discard the result while reconciliation remains incomplete.

Identify:

- the work product or ad hoc task;
- its unique context path through the reference's **Work-product context resolution and completion archival** contract;
- repositories and files touched;
- the observable result;
- unresolved issues and the next concrete action.

A missing or ambiguous context is a stop; do not assume that an active context is flat or under `inbox/`, and do not choose among duplicates by recency or status. Inspect repositories touched by the session using the shared **Local Git evidence for Session rituals** rule. Do not scan or mutate unrelated repositories.

## 2. Preserve the result

For a work-product session, update its uniquely resolved context with:

- what was tried;
- what was learned;
- the observable result and verification limits;
- what remains;
- the next action;
- relevant files, decisions, and blockers.

If the owner accepts an observable result as `done`, keep completion and storage separate. Before any archive move, show the exact source, destination, approved current-pointer updates, expected prior states and completion checks, and obtain explicit archival approval. Then apply the reference's archival transaction directly. Historical catch-up is never implied by closing one WP. Under the reference's **Weekly archival option**, record the accepted `done` and do not propose a move; Week Close owns archival.

For WP-level factual reconciliation, update `WP-REGISTRY.md` only on an approved status transition, and `memory/MEMORY.md` only for a global context, blocker, or next-focus change. When weekly files are in scope, record material weekly facts through the reference's weekly steps for Session Close; under weekly-only the approved WP result completes factual preservation for this session. Do not write the DayPlan.

For work in a declared project ledger, preserve the result through that ledger (**Project ledgers as work carriers**). For ad hoc work, preserve context only if it would otherwise be lost.

## 3. Capture deliberately

Identify any reusable knowledge and propose its destination:

- domain knowledge → matching `PACK-*` repository;
- personal strategy or coordination → `DS-strategy/`;
- implementation knowledge → relevant `DS-*` documentation;
- durable personal lesson → personal memory.

Capture autonomy is manual. Include optional captures as separately labeled items in the consolidated proposal before any writes. One reply may approve them with the core result or leave them unapproved; approval of the core summary alone does not approve captures.

## 4. Handle Git explicitly

Check dirty state in repositories the session touched and report what needs the owner's action (**Reporting style**); do not infer committed or pushed state from a clean tree. A separately approved direct archival move is not approval to stage it: do not use `git mv`, `git add`, or another Git-aware archive helper.

## 5. Report the close

Return a concise report:

- **Work product:** identifier with its registry title, or ad hoc; never the number alone
- **Result:** observable artifact or conclusion
- **Status:** done, in progress, blocked, or ad hoc complete
- **Next action:** what to do next and where context was stored
- **Git:** only state that needs the owner's action (**Reporting style**); commit/push only when performed or requested
- **Captures:** written or proposed, only when there are any
