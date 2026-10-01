# Coding projects under an org

How an org grows software — an automation, a product, an adopted existing
repo — without breaking the pattern. Read when a quest is about to produce
code, or when registering a repo the org will maintain.

## The agent-maintainability bar

A repo the org owns must be maintainable by a FRESH agent with no prior
context. Concretely, it carries:

- **An entry contract** (`CLAUDE.md` or `AGENTS.md`): what the system is,
  the hard constraints that void work when violated, how to run it, how to
  verify it.
- **A verification command** an agent can run and read (a test suite, a
  self-test harness, a check script). This is the non-negotiable: a repo
  without one is not agent-maintainable yet, and building it is UNIT ZERO
  of any work there — before features, because every later unit's
  definition of done depends on it.
- **An architecture skill**, once the repo is nontrivial: the design
  philosophy and placement guide, per the template in the
  workspace-stewardship skill's references. Created before the first
  architectural feature; updated in the same round as any change that
  alters the shape; measured by the intuition test (could a stranger place
  the next feature with only this?).
- **The doc-hygiene shape** throughout — docs AND code are read by
  budgeted readers.

## How the org and the repo relate

- **The org keeps a pointer, not a copy.** The owning area holds one file:
  the repo's path/URL, its one-line purpose, how to verify it, where its
  contract lives. Depth stays in the repo; the org map stays honest.
- **Logging is split by altitude.** The org's daily log records repo work
  at outcome level ("the exporter now handles X; suite green"), under the
  dispatching `Having a subagent ...` parent. The repo's own docs carry
  design depth (`docs/design/` for authoritative design docs, per
  design-first).
- **Briefs target the repo's contract.** A unit inside the repo is briefed
  against the repo's `CLAUDE.md` and verification command — not the org's
  contract. The orchestration skill's briefing reference covers the
  workspace-facts section this fills.
- **The repo can become a sub-org.** A codebase with its own work cadence
  is just another rung of the growth ladder: its own quests, its own lanes
  reported up. Same fractal, same discipline.

## Building one

1. The quest states the problem, the process being automated or the
   product intended, and the acceptance criteria.
2. Design-first when the shape is unsettled (orchestration's
   design-first reference): one design agent, one authoritative doc, an
   ordered sub-unit plan.
3. Unit zero: the runnable skeleton WITH its verification command and
   entry contract.
4. Features as orchestrated units in series, each verified from the
   coordinator's seat, each committed; the architecture skill born with
   the first real structure and maintained thereafter.
5. Registration: the pointer file in the owning area, the org map updated,
   the dashboard lane if the project stays live.

## Adopting an existing repo

Audit it against the bar first. Whatever is missing — contract,
verification command, architecture skill — is the first quest, before
feature work: the full path (parallel survey batch, unit-zero
verification, contract and architecture skill derived from the code's own
patterns, stranger validation) is the workspace-stewardship skill's
`references/codebase-adoption.md`. An org that accepts unverifiable repos
inherits unverifiable liabilities.
