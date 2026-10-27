---
name: iwe-pack-use
description: Use an existing local IWE PACK-* repository as a read-only source for repository-first questions. Use when the user asks what a Pack says, whether a Pack covers a domain, or wants source-backed IWE/domain guidance from local Packs. Do not use this skill to create, modify, validate, clone, pull, or publish a Pack.
disable-model-invocation: false
---

# Read-only IWE Pack use for Pi

This is the minimal manual Pi workflow for consulting an existing Pack. It does
not port the Claude `/pack-new`, `/pack-creator`, `/ke`, `/apply-captures`, MCP,
semantic-indexing, or background extraction workflows.

Before reporting findings, apply **Contract reuse**, **Personal policy resolution** and **Reporting style** in `../../LIFECYCLE.md` (`adapters/pi/LIFECYCLE.md`, two directories above this skill's directory) — those three subsections only — resolved from this skill's physical source directory through reviewed deployment symlinks, not from the session cwd. The owner's language, naming, and reporting conventions govern the answer shown in chat. This skill remains read-only and owns no planning surface.

## 1. Establish the boundary

Read the workspace `AGENTS.md`. Locate local directories named `PACK-*` without
using the network or changing them.

For each candidate Pack needed for the question, inspect in this order when
present:

1. `AGENTS.md`;
2. `CLAUDE.md`, only as upstream reference compatible with the Pi workspace
   contract;
3. `REPO-TYPE.md`;
4. `README.md`;
5. `pack/*/00-pack-manifest.md`;
6. `pack/*/01-domain-contract/` and `ontology.md`;
7. `pack/*/07-map/` and `pack/*/routing.yaml`.

Confirm that `REPO-TYPE.md` identifies a Pack and note its stated domain and
source-of-truth status. If repository identity is unclear, report that and stop.
Do not run setup, update, generation, validation, migration, Git, or repository
scripts.

## 2. Choose the source

- If the user names a Pack, start there.
- Otherwise compare the question with each Pack's domain contract, ontology,
  manifest summaries, and routing vocabulary.
- Prefer the Pack whose bounded context owns the concept, not the Pack with the
  nearest filename or keyword.
- If no local Pack owns the concept, say so. Do not invent a destination or
  silently fall back to network, MCP, FPF, or SPF.
- Use another local Pack only when the first Pack explicitly points to it or the
  user asks for a cross-Pack comparison.

## 3. Navigate repository-first

Use progressive disclosure rather than scanning every document:

1. Find candidate entity IDs in the manifest or generated map.
2. Open the authoritative entity file for the strongest candidate.
3. Follow its `related`, `see_also`, or explicit in-text references only when
   needed to answer the question.
4. Check the entity's `status`, trust/epistemic metadata, and whether it is
   marked moved, superseded, draft, or generated.
5. Distinguish normative domain statements from implementation examples and
   downstream repository descriptions.

Keyword search is a navigation aid, not evidence. Base the answer on the entity
content itself. If manifest, map, README, and entity content disagree, prefer the
specific entity for its claim and explicitly report the metadata drift.

## 4. Answer with traceability

Return a compact repository-first answer containing:

- **Answer:** the direct conclusion in the user's language;
- **Pack evidence:** entity ID and repository-relative file path for each key
  claim;
- **Status:** active/draft/moved/superseded and material trust caveats;
- **Gap:** what the local Pack does not establish, when relevant.

Use links or clear paths that the user can open locally. Do not present a draft
service clause as an active platform capability. Do not infer that a documented
Claude carrier is available in Pi.

## 5. Preserve the read-only contract

Never, under this skill:

- create or edit Pack entities, manifests, maps, routing, or instructions;
- clone, pull, commit, push, configure hooks, or change remotes;
- call MCP services or create semantic indexes;
- run Pack/SPF/FPF generators, validators, installers, or migration scripts;
- claim that Capture-to-Pack is completed Knowledge Extraction.

When the question reveals reusable knowledge or a correction, offer a capture
and name the proposed Pack destination, but wait for approval. Applying that
capture is a separate mutation boundary and requires checking the target Pack's
instructions, formalization rules, validation method, and repository state.

When the user asks to create or extend a Pack, explain that this read-only skill
cannot do so and propose a separately reviewed workflow rather than improvising
Claude parity.
