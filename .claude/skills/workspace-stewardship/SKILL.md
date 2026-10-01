---
name: workspace-stewardship
description: >-
  Keep the workspace's structure documented as a living map, so a future
  agent can predict where anything belongs — and where anything is — without
  spelunking. Use BEFORE filing any new knowledge or creating any file or
  folder (consult the map and place where it predicts); AFTER any change
  that adds, moves, or retires a structure (update the map in the same
  round); when an area outgrows its container (the growth ladder: section →
  spoke → area → sub-org → repo); when registering a code sub-repo; and
  when a repeated manual process suggests building an automation; and when
  the principal's scope has outgrown the org's stated mission (re-rooting).
  Covers the intuition test for maps, promotion and demotion, the sub-org
  contract and its seat file, what makes a sub-repo agent-maintainable,
  the adoption path for an existing codebase, and the re-root protocol
  that lets the org zoom out without narrowing any child.
---

# Workspace stewardship

A workspace with agents working in it needs maps that transmit the DESIGN:
not what the files are (the files state that), but why the structure has
the shape it has and where the next thing goes. The maps here are
`org/README.md` (the knowledge tree) and the map table in `CLAUDE.md` (the
root). Every agent that files, moves, or creates anything is a steward of
both. Stewardship has two motions: consult before, maintain after.

## Consult before placing

Before filing new knowledge or creating any file/folder, read the map and
let it predict the placement. Three outcomes:

- It predicts cleanly: file there, and say so. A confirmed prediction is
  evidence the map is alive.
- It is silent about your case: place in the spirit of the stated rules,
  then add the missing guidance to the map. Silence is a gap in the map,
  not a license to freestyle.
- It contradicts reality (names a folder that doesn't exist, describes a
  file that moved): reality wins, and the map is now known-wrong — more
  urgent than known-missing, because agents obey a confident document. Fix
  it before building on either version.

## Maintain after changing

Any change that adds, moves, or retires structure updates the maps IN THE
SAME round, by the agent that made the change; coordinators put this in the
definition of done when briefing filing units. Deferred updates do not
happen, and a stale map actively misleads, because nothing about it looks
stale.

## The intuition test

The measure of a map is predictive, not descriptive: could a fresh agent
with NO other context, given only the maps and one new fact or question,
name the right file for it before opening anything? Write toward that
reader. What earns a place in the map: the filing rules, the one-line
purpose of each area, the growth expectations. What does not: inventories
of file contents, history, anything a hub README already owns.

## The growth ladder (how the org scales)

Structure earns its existence; nothing is scaffolded empty. Each rung is a
promotion applied WHEN the pressure is real, never in advance:

1. **A section** in an existing file — the default for any new fact.
2. **A spoke file** when the section outgrows its host or gets its own
   audience (doc-hygiene thresholds). Linked from the area hub.
3. **An area folder** (`org/<area>/` with a README hub) when a topic has
   2–3 spokes or its own open quest. The hub orients; spokes detail.
4. **A sub-org** when an area develops its own work cadence: give it its
   own `CLAUDE.md` (a scoped coordinator contract stating its mission,
   rules inherited from the parent, and what it reports up), and its own
   quests/ or logs/ only when volume demands. The parent keeps: the map
   entry marked "sub-org", a dashboard lane fed by the child's reports,
   and the rule that parent-level sessions brief work against the CHILD's
   contract (orchestration skill, "Hierarchy"). The contract carries the
   seat's rolling "where things stand", so the role is FROZEN between
   invocations — memory intact on disk, resumable by any fresh agent, and
   costing nothing while dormant.
5. **A separate repo** when the thing is a codebase or needs its own
   lifecycle (releases, its own history). The org keeps a pointer file in
   the owning area: the canonical remote URL (a local checkout path is a
   per-machine convenience, never the identity), one-line purpose, how to
   verify it, where its own contract lives. Same fractal rules apply
   inside it.

The topology this produces is FEDERATED, not monorepo: the org is the
coordination-and-knowledge layer, and substantial code lives in its OWN
repos that the org indexes and drives — small single-file automations
(below) are the one in-tree exception. This keeps the org light, lets each
codebase keep its own lifecycle (history, CI, releases, even being
open-sourced independently), and keeps the workspace clean to clone or
template.

How a session REACHES a child from any machine or cloud container: by the
pointer's canonical URL, never by a local path. PEEK shallowly (a depth-1
clone) when you only need a child's dashboard or contract; CLONE fully
only when a unit descends into it, working and pushing through the
child's own contract. The tree does NOT use git submodules: a submodule
pins a SHA, and a living child advances every session — the parent would
either lie about its children or churn with pointer-bump commits — while
clone-on-demand always reads the child's present truth. When whole-tree
convenience is genuinely wanted, an org-sync automation (clone or pull
every registered child into a gitignored folder) provides it without
submodule semantics.

### The ladder runs both ways: re-rooting

The rungs above promote CHILDREN as they grow. The inverse motion is just
as real: the ROOT itself gets outgrown — directives keep arriving that the
mission doesn't contain, two live areas relate only through the principal
rather than through the mission, or the principal names a broader ambition
outright. When you notice those signals, the true org sits a level above
the one that was built. PROPOSE a re-root (it changes what the org IS, so
the decision is the principal's, as an option set); the protocol — re-root
in place, supersede with a new root, or seed a sibling org — lives in
[references/rescoping.md](references/rescoping.md). The invariant that
makes it safe: a re-root narrows no one. Children keep their scope,
contracts, and memory; the root only gains altitude. This is also why
starting small is always correct — the root is provisional by design.

Demotion is real too: an area that went quiet folds back down the ladder
(sub-org contract retired, spokes merged), with the map updated and links
walked. Git preserves the history; the living tree stays honest about what
is actually alive. And a dormant seat is not a demotion: an uninvoked role
costs nothing and loses nothing — it waits, frozen, as text.

## Code sub-repos: the agent-maintainability bar

A repo the org builds or adopts must be maintainable by a fresh agent with
no prior context, which means it carries:

- An entry contract (`CLAUDE.md` or `AGENTS.md`): what it is, the hard
  constraints, how to run it, how to verify it.
- **A verification command an agent can run and read.** A repo without one
  is not agent-maintainable yet; building it is unit zero of any work
  there.
- An architecture skill once the repo is nontrivial: the design philosophy
  and placement guide, per
  [references/architecture-skill-template.md](references/architecture-skill-template.md).
  Created before the first architectural feature, maintained in the same
  round as any change that alters the shape.
- The doc-hygiene shape throughout.

Building such a repo is orchestration work (design-first when the shape is
unsettled); the org's daily log records outcomes at coordination altitude
while the repo's own docs carry the depth.

Adopting an EXISTING codebase — imported, inherited, or one that grew
undocumented — follows
[references/codebase-adoption.md](references/codebase-adoption.md): the
parallel survey batch, unit-zero verification, the contract and
architecture skill derived from the code's own strongest patterns, and
validation by a fresh agent before the adoption quest closes.

## Automations: the org builds its own tools

When a manual process has repeated enough to have a shape (roughly: done
three times, or error-prone enough to hurt once), the coordinator's duty is
to PROPOSE automating it — the CEO decides. The path: a quest stating the
process, its frequency, and the cost of the manual version → design-first
if the shape is unsettled → built as a code unit. Small single-file tools
live in `automations/` (materialized on first use, mapped); anything with
its own lifecycle graduates to a sub-repo per the ladder. Every automation
registers where it lives, what invokes it (a human, a session ritual, a
schedule), and how to verify it still works. An automation nobody can
verify is a liability, not a tool.

## Archive vs delete

Git remembers everything, so DELETE what is truly dead — a superseded
draft, a scaffold that never grew. Move to `archive/` (mirroring the live
path) only what must stay findable without git: a closed area still cited
by quests, a document with reference value. Update inbound links either
way; the map never lists archived content except via the archive rule
itself.
