# Completion archival transaction

> Part of the shared lifecycle rules: start with [LIFECYCLE.md](LIFECYCLE.md); its sections apply here unchanged.

Read only before proposing or performing a completion archival. **Work-product context resolution and completion archival** in LIFECYCLE.md (context resolution, completion vs archival, **Weekly archival option**) applies first.

For an approved Session Close archival:

1. Require the registry row and context to reflect the accepted `done` transition, then resolve one inbox source and derive the destination without changing layout: a flat card keeps its basename; a nested card keeps its whole `WP-N/` directory.
2. Require the destination to be absent. A pre-existing destination, duplicate candidate, symlinked card or destination, mismatched identifier, unreadable context, unaccepted result, or uncertain live reference stops without moving anything.
3. Persist `archival_state: approved`, the exact governance-relative `archival_destination`, and `archival_approved_at` in the context before the move. These fields are durable retry authority for that destination only; do not reconstruct approval from status or chat.
4. Move the exact source directly as a filesystem operation without staging, committing, pushing, invoking the upstream Git-aware archive helper, or broad globbing. This manual adapter step grants no Git authority.
5. Update only the approved current pointers that would otherwise break, such as an applicable global-context pointer in `memory/MEMORY.md`; keep historical plan/report evidence unchanged. Registry rows identify the WP and status rather than a mandatory storage path. When weekly reconciliation is in scope, record a material weekly archival fact only through the paired WeekReport factual-reconciliation gate; otherwise the WP's archival record remains evidence for the weekly review.
6. Verify that the source is absent, the destination is the sole resolved context, its content is preserved, required current pointers resolve, and registry/context status still represents the accepted result. Then set `archival_state: complete` and `archived_at` in the archived context.

Retry from durable state only. `approved` with only the inbox source resumes the exact move after repeating preflight checks. `approved` with only the recorded archive destination resumes outstanding approved pointer checks and the completion marker without importing facts or moving again. `complete` with only the archive destination is idempotently complete. Missing intent, a changed destination, both locations, neither location, a destination collision, changed expected state, or a newer conflicting pointer requires owner resolution. Never overwrite, merge, delete, or select another context to compensate.

Day Close and Week Close may identify missed archival candidates only from closed registry rows whose uniquely resolved context remains in the inbox. They show each exact source and destination, acceptance evidence or its absence, pointer effects, and conflicts. They archive only candidates explicitly approved in that draft through the same transaction above; unresolved, `pending`, `in_progress`, `blocked`, `merged`, `cancelled`, ambiguous, or unaccepted contexts remain untouched. No broad historical catch-up follows from approving one candidate.

The template's `scripts/archive-done-wp.sh` is an upstream Git-aware workflow with different status and staging semantics; the manual Pi adapter does not invoke it. Historical catch-up requires a separately reviewed exact move list, acceptance evidence for every item, link and attachment impact, rollback, and Git/encryption boundary.
