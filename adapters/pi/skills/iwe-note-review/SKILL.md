---
name: iwe-note-review
description: Review and route personal IWE fleeting notes manually in Pi. Use when the user asks to process notes, triage fleeting-notes.md, turn notes into drafts, or advance the note-to-post pipeline. Always show the proposed routing before changing or archiving notes.
disable-model-invocation: false
---

# Manual IWE Note Review for Pi

This is the manual Pi subset of
`../../../../roles/strategist/prompts/note-review.md` and the creative pipeline in
`../../../../docs/LEARNING-PATH.md` §5.6. The upstream sources remain authoritative
for the full method. Do not execute their Claude-only, headless, scheduling,
commit, or push steps.

Before proposing routing or changing any note, apply **Contract reuse**, **Personal policy resolution** and **Reporting style** in `../../LIFECYCLE.md` (`adapters/pi/LIFECYCLE.md`, two directories above this skill's directory) — those three subsections only — resolved from this skill's physical source directory through reviewed deployment symlinks, not from the session cwd. A missing or unreadable reference blocks the affected action. The owner's naming, language, grouping, and reporting conventions govern the routing preview and every summary shown in chat, not only the files written. This skill is not a lifecycle ritual: it owns no planning surface, and never writes `WeekPlan`, `WeekReport`, `DayPlan`, the work-product registry, or a WP context. Routing a note toward planned work means proposing it to the owner, not recording it there.

## 1. Establish the review boundary

Read the active workspace and governance `AGENTS.md` files. Locate, without
running scripts:

1. `DS-strategy/inbox/fleeting-notes.md`;
2. `DS-strategy/docs/Dissatisfactions.md`;
3. current `DS-strategy/current/WeekPlan *.md` and `DayPlan *.md`;
4. `DS-strategy/docs/Strategy.md`;
5. `memory/MEMORY.md`;
6. `DS-strategy/drafts/draft-list.md` and existing `drafts/D-*.md`.

Treat bold entries in `fleeting-notes.md` without `✅предложено` and without `🔄` as new; a `✅предложено` note is already classified and only shown, a `🔄` note is deferred. If there are none, report that
and stop. Do not mutate or archive anything during this step.

## 2. Classify and check current facts

For every new note, compare its intent with active work products, plans, and
already recorded facts. Use one primary category:

| Category | Test | Proposed destination |
|---|---|---|
| Dissatisfaction | discomfort or desired state change | `docs/Dissatisfactions.md` |
| Task | concrete action or deliverable | matching WP or proposed planning update |
| Hypothesis | falsifiable prediction | propose a hypothesis record; ask if no local log exists |
| Domain knowledge | reusable outside one implementation | matching `PACK-*`, when it exists |
| Implementation knowledge | fact or decision about a specific system | relevant `DS-*` documentation |
| Draft seed | thought that can become a coherent public text | `drafts/D-NNN-<slug>.md` |
| Personal data | contact or private reference | propose a safe personal destination; never place secrets in Git |
| Noise/complete | duplicate, context-free link, or intent already fulfilled | notes archive |

A note can additionally produce a draft seed when it contains a publishable
argument, but do not silently create two outputs. Explain the two proposed
routes.

## 3. Present the review before writing

Return a compact proposal table:

```text
# | Note summary | Category | Existing WP/fact | Proposed destination | Action
```

Then report:

- which notes would become drafts;
- which routes require a missing repository or artifact;
- whether draft guards are healthy: up to 5 normal, 6–10 warning, over 10 no new
  draft;
- exact files that would change;
- what would be archived or remain in the inbox.

Wait for explicit user approval. Approval may cover all rows or selected rows.
Do not treat a request to review notes as approval to route them.

## 4. Apply only approved routes

For approved rows:

- preserve the original wording and source date;
- append proposals rather than rewriting strategy or priorities silently;
- do not create a new work product here: registering one is the Work Product Gate in `../iwe-session-open/SKILL.md` §3, which this skill does not load. Propose the work product to the owner and let Session Open register it;
- write domain knowledge only to an existing matching Pack and only after the
  user approves that destination;
- when creating a draft, choose the next unused `D-NNN`, use the format in
  `DS-strategy/drafts/README.md`, and update `draft-list.md` in the same change;
- never write tokens, passwords, API keys, or other secrets to tracked files;
- archive a processed note only after its approved destination write succeeds.

The default archive is
`DS-strategy/archive/notes/Notes-Archive.md`. If it does not exist, preview its
creation before writing it. Preserve the source note, date, category, route and the owner's decision as `**Разбор:** YYYY-MM-DD — **Решение пилота:** …`; no archive entry without it.
Remove only the exact processed block from `fleeting-notes.md`; leave unapproved
and newly arrived notes untouched.

## 5. Verify and report

Read every changed file and verify:

- each approved note has exactly one primary disposition;
- any additional draft route was explicitly approved;
- draft and draft-list entries agree;
- archived notes are absent from the inbox and present in the archive;
- no unapproved note changed;
- no secrets were introduced.

Report the note counts, created or updated artifacts, unresolved routes, and the
next pipeline action. Do not commit or push unless the user separately requests
that Git operation. Do not claim that publishing or background processing will
continue automatically.
