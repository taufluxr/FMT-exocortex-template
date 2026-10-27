# Pi personal policy

This file is the user-owned policy starter for the experimental manual Pi adapter. It is a **registry of the owner's deviations from the upstream IWE/FMT method**: what was decided, when, and why. Procedures live in the skills and the adapter; the registry only records decisions and points at where each one is implemented.

Review it before exposing the adapter instructions or skills. Replace or refine its choices for your workspace; do not copy another user's private policy. Several rows below are deliberately **not selected** — they are the decision points the adapter reads, left open for the owner.

This file is not a Pi extension and is not loaded automatically. It does not override platform safety requirements, the manual pilot's boundaries, or approval gates. Conflict order: an explicit owner request in session → pilot safety boundaries → target repository instructions → this registry → the adapter and skill method → global tool rules. On conflict, stop the affected action and ask the owner rather than silently reordering rules.

## How to keep this registry

- **PP-00 · Registry format · date of deployment · active · type: addition**
  - **Rule:** every personal deviation from the FMT method — wherever it is implemented (workspace instructions, a skill, configuration, an external workbench) — is declared here as a `PP-NN` row. Implementation may live anywhere; declaration lives in one place.
  - **Format:** `ID · short title · date · status · type`, then the fields **Upstream / Mine / Where implemented**, plus **Why** and **Scope** when needed.
  - **Types:** `option choice` — upstream supports this explicitly; `addition` — upstream is silent; `override` — a divergence from an explicit upstream step, tracked as debt.
  - **Statuses:** `active`, `superseded`, `cancelled`, `not selected`. A row that states a decision point the owner has not yet made is `not selected`, and any action depending on it stops and asks.
  - **Change:** edit the row's text, keep its ID and original date, and add the revision date. Numbers are never reused; a withdrawn decision stays in place with status `cancelled`.
  - **Not allowed here:** procedures, glossaries, prompts, interface descriptions — a decision row links to them instead.
  - **Duplication test:** if deleting a sentence does not change agent behavior, it is a restatement of the method — delete it.
  - **New agreements:** a proposal raised in a session becomes a `PP-NN` row and waits for approval. Personal preferences are not written into workspace instructions or skills.
  - **Starter numbering:** the `PP-01`–`PP-06` rows below ship with this starter and keep their IDs once deployed; new decisions continue from `PP-07`. Another owner's registry uses the same IDs for different decisions — never read a `PP-NN` reference against anything but the registry in the workspace it belongs to.

## Planning and weekly review

- **PP-01 · Planning groups · date on selection · not selected · type: addition**
  - **Upstream:** the method assumes planning groups exist but does not name them.
  - **Mine:** _not selected._ Use the groups already defined by the current Strategy and WeekPlan. If they are absent or conflict, ask the owner to choose them before drafting or changing planning state. Do not invent personal categories or convert protected personal boundaries into backlog items.
  - **Where implemented:** the weekly and daily rituals apply the grouping in reviews and plans.

- **PP-02 · Human WIP reporting · date on selection · not selected · type: addition**
  - **Upstream:** the adapter's week rituals report human WIP using "the policy's human-WIP grouping rules"; the rules themselves are personal.
  - **Mine:** _not selected._ Choose which groups are counted separately, and the target range for each. Until chosen, `iwe-week-open` stops at that step and asks rather than counting registry rows as a workload estimate.
  - **Where implemented:** `iwe-week-open` §3 and its "Human WIP" reporting item, which reference this decision by name.

## Cadence

- **PP-03 · Weekly reconciliation cadence · date on selection · not selected · type: option choice**
  - **Upstream:** the Session and Day rituals locate, read, and pair `WeekPlan`/`WeekReport` on every run.
  - **Mine:** _not selected._ The adapter offers an explicit **weekly-only** alternative, in which Session and Day rituals work from WP contexts and registry state, and weekly reconciliation happens only in an explicitly requested Week Open/Close. Selecting it requires stating it here in those words; silence means the upstream per-ritual behavior stands.
  - **Where implemented:** `FMT-exocortex-template/adapters/pi/LIFECYCLE.md`, §Weekly reconciliation cadence, which resolves this row before discovering weekly files.
  - **Not affected:** work-product verification, owner acceptance, archival approval, and every Git, network, and deployment boundary.

## Language and output

- **PP-04 · Working language · date on selection · not selected · type: addition**
  - **Upstream:** the generated `FMT-exocortex-template/AGENTS.md` may fix a single response language for all agents.
  - **Mine:** _not selected._ Decide separately for **chat** (follow the owner's current message language, or pin one language) and for **documents** (the language of new plans, reports, and WP contexts; and whether editing an existing document preserves its language). If the choice differs from the generated `AGENTS.md`, say so here explicitly — that is what makes it a decision rather than a drift.
  - **Where implemented:** **Personal policy resolution** in `FMT-exocortex-template/adapters/pi/LIFECYCLE.md`, which applies the owner's naming, grouping, language, and reporting conventions to every draft, plan, summary, and chat answer. No separate hook in the skills is needed.

## Launch and external routing

- **PP-05 · Interactive launch · date on selection · not selected · type: addition**
  - **Mine:** _not selected._ Start ordinary Pi sessions at the IWE workspace root so workspace instructions and skills are discoverable. A session started inside a child Git repository may use only a reviewed project-local skill projection. Use another profile, MCP access, a child session, or a subagent only when the owner explicitly approves that execution boundary. Record the chosen workspace-root path here.
  - **Where implemented:** skill discovery and the workspace-resolution rule under **Personal policy resolution** in `FMT-exocortex-template/adapters/pi/LIFECYCLE.md`.

- **PP-06 · GitHub routing · date on selection · not selected · type: addition**
  - **Mine:** _not selected._ Follow the target repository's instructions and the owner's explicitly selected local workflow. Treat issue creation, pull requests, reviews, merges, remote changes, pushes, and publication as separate external-write boundaries. If no workflow or account is selected, stop and ask rather than inferring one.
  - **Where implemented:** the target repository's own instructions; this row only records which workflow and account the owner selected.

## Authority

This policy controls personal planning groups, WIP reporting, reconciliation cadence, working language, interactive launch/profile choices, and GitHub workflow routing. It does not override platform safety, repository instructions, work-product approval gates, or explicit mutation boundaries. Missing, unreadable, ambiguous, unresolved, or conflicting policy requires stopping the affected action and asking the owner. The starter's presence alone is not evidence that its choices were reviewed.
