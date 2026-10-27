---
name: iwe-session-open
description: Open a substantive personal IWE work session in Pi using the upstream Open–Work–Close and Work Product Gate concepts. Use before starting planned personal work, creating a work product, or changing personal IWE state, except explicit Day Open, Day Close, Week Open, or Week Close requests. Read-only questions and work under 15 minutes may use the documented ad hoc exception.
disable-model-invocation: false
---

# Open an IWE session in Pi

Day-scale requests are routed separately: “открываем/начинаем день” uses
`iwe-day-open`, while “завершаем/закрываем день” uses `iwe-day-close`.
Week-scale requests use `iwe-week-open` or `iwe-week-close`.

This is the manual Pi subset of `../../../../memory/protocol-open.md`. The upstream
file remains authoritative for the full method; do not execute unsupported
scripts or Claude-only steps from it.

Before planning writes, apply **Shared lifecycle rules** in `../../LIFECYCLE.md` (`adapters/pi/LIFECYCLE.md`, two directories above this skill's directory), resolved from this skill's physical source directory through reviewed deployment symlinks, not from the session cwd. They own contract reuse, personal policy resolution, weekly cadence, planning-projection boundaries, and the archival transaction. A missing or unreadable reference blocks the affected action. Resume work from the approved WP context; this ritual does not require another session or an execution-transfer document.

## 1. Classify the request

After reading the personal policy required by the workspace, classify the request before reconstructing planning state. Treat the request as ad hoc when it is read-only, an emergency, or reasonably expected to stay under 15 minutes. State the exception briefly and proceed directly with the task: skip steps 2–4 and lifecycle-write rules unless the task needs them. Read only task-relevant planning evidence; ad hoc classification does not waive personal policy, repository instructions, or mutation approvals. If work grows beyond the exception or requires planning writes, return to the applicable gate before changing that state.

Otherwise continue with the Work Product Gate. Apply the shared Contract reuse rule; continuation is not a fresh discovery ritual.

## 2. Locate planning state

Work in a project ledger declared by the policy follows **Project ledgers as work carriers** in the reference instead of the WP discovery and gate below.

Use bounded, registry-first discovery for a named WP or subject:

1. Search `DS-strategy/docs/WP-REGISTRY.md` for the identifier or subject; inspect matching rows before searching context bodies. If literal names miss, try a few conceptual subject terms in the registry and supported context filenames before broadening to body search.
2. Resolve the matching WP through the reference's **Work-product context resolution and completion archival** contract, using supported filename discovery in `DS-strategy/inbox/` and `DS-strategy/archive/wp-contexts/`. Preserve missing/duplicate-context checks; never select by recency.
3. Read the selected WP context and task-relevant documents it names. Resolve a bare filename named in the request within the workspace rather than requiring an absolute path. For an umbrella work product marked `agent_scope: open-only`, read only its `pending`, `in_progress`, and `blocked` phases; read archived phases only on explicit owner request.
4. Broaden discovery only if the narrow route misses or leaves a concrete question unresolved. Search explicitly selected directories with bounded output; inspect returned paths to verify exclusions actually worked. Historical weekly archives are not a default fallback; archived WP contexts remain part of required identifier resolution. Read related WP contexts only when the primary WP or named document identifies them as necessary dependencies, review lanes, or scope boundaries.

For non-ad-hoc opening, also read `memory/MEMORY.md`. Resolve the shared **Weekly reconciliation cadence** before any weekly-file discovery. Under weekly-only, use the selected WP/registry and relevant current focus without locating or reading WeekPlan/WeekReport; otherwise apply the reference's **Weekly steps of the Session and Day rituals** for Session Open. Never infer an absent entry from a partial read or truncate a required section to fit an output budget. If no subject is given, use memory's focus pointer to start discovery. Do not preload every related WP or search all planning/context bodies by default.

For an identified WP with unambiguous repository paths, check current dirty state using the shared **Local Git evidence for Session rituals** rule. Report only relevant risks or conflicts; this evidence does not change the Work Product Gate. Do not run synchronization, routing, or other status scripts during the manual pilot.

Use established names for existing work products, sections, documents, and deliverables. When a new artifact lacks a name, propose an artifact-oriented name in the opening draft rather than stopping to ask for one; it remains unapproved until the owner accepts the registration or scope.

## 3. Apply the Work Product Gate

Before proposing operational semantics or recording assumptions in a new WP, follow the selected context's references to the current owning contract and applicable tool help; follow relocation notices rather than treating a historical summary as current authority. Keep unverified choices as questions. Separate independent decisions (for example logical identity, device credential, and provider namespace); do not bundle an optional external change into a local requirement. Repository instructions must be read before edits, including governance instructions before registration. Diagnostic disclosure levels and external operations retain their own approval gates; calling a diagnostic read-only does not waive them.

- If the request belongs to an existing active work product, identify it and use its context to resume the approved work. If the owner explicitly starts a pending WP, preview and record its approved activation in the unique context and registry. Follow personal policy for start-versus-defer intent; weekly baseline membership is not an execution gate. Do not infer activation or implementation approval from a request to save a candidate for later.
- If no work product matches, report that it is absent and propose a concise
  artifact-oriented work-product name, repository, acceptance result, and time
  budget.
- Do not register a new work product until the user explicitly agrees.
- After agreement, create the context under `DS-strategy/inbox/` and register the WP as one reviewed change: in the context and registry, with a memory focus change only when needed, plus the weekly registration step when weekly files are in scope. Registration alone never changes weekly commitments or the frozen commitment baseline.
- Update `memory/MEMORY.md` only when a global context, blocker, or next-focus pointer changes. Do not insert the WP into a DayPlan. A weekly-intent change requires the reference's separate amendment approval gate.

For another WP registration in the same session, reuse the established role, method, and available contracts. Refresh the registry/context collision checks and complete affected destination sections; read other sections only for a concrete change or unresolved question. Batch independent reads. Before writing, briefly name the new artifact/scope, exact affected paths, projection effects, and rollback. An explicit owner request to register the already-reviewed scope satisfies that registration approval; do not ask for the same approval again. Ask only for missing scope/acceptance/budget decisions or new mutation boundaries. Pending estimates may remain explicitly unresolved until activation. This continuation path preserves every Work Product Gate and weekly-baseline safeguard.

## 4. Present the opening contract

Before substantive edits, present:

- **User role:** IWE user or IWE developer, whichever matches the request
- **Pi role:** the function Pi will hold for this session
- **Work:** the concrete subject and scope
- **Work product:** existing identifier with its registry title, proposed work product, or ad hoc; never the number alone
- **Verification class:** trivial, closed-loop, open-loop, or problem-framing
- **Method:** intended approach
- **Estimate:** rough time or size
- **Model:** current Pi model and any recommendation

Apply the shared **Autonomous preparation and consolidated approval** rule: complete read-only preparation and collect material questions and registration proposals in this contract before asking. For a new work product, wait for explicit agreement before registration or implementation. For an existing work product, continue within approved scope without re-asking unless a new boundary or conflicting state requires resolution.

## 5. Enter Work

Name the immediate next step and follow the workspace `AGENTS.md`. Load
`memory/protocol-work.md` only when deeper upstream guidance is needed; apply
only portions compatible with the manual Pi pilot.
