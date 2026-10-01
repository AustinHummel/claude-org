# The design philosophy

Why a ClaudeOrg has the shape it has. Read at bootstrap, when extending the
pattern, or when a structural decision needs grounding.

## One org for everything

The ambition: a single workspace that holds everything its principal
knows, does, and works on — and that a person can converse with. The
principal talks to ONE agent, the coordinator; the coordinator maintains
the files; the files, not any conversation, are the org. Because the files
are the org, the system survives any session ending, any agent being
replaced, and any model upgrade — the next coordinator reads the contract
and inherits everything, including what its predecessors did and why.

## Three pillars, interlocked

- **The chronicle** (`log/`): rabbit-hole daily notes where the hierarchy
  itself carries the context. The log answers "what happened, and why did
  we do it that way?" for any past day — including what every delegated
  agent was doing, because every dispatch is logged where it happened.
- **The library** (`org/` + `quests/` + `DASHBOARD.md`): current truth,
  shaped for budgeted readers. Knowledge in hubs and spokes at one
  altitude per file; open work as quest documents with stable acceptance
  criteria and a current "where things stand"; the glance answer on the
  dashboard. The library answers "what is true, and where do things
  stand?" without replaying history.
- **The delegation engine** (orchestration): fresh subagents with focused
  briefs for anything deep, verified deliverable reports coming back, and
  disclosure at every level so no layer re-checks what a lower layer
  already evidenced.

The pillars discipline each other. The chronicle keeps the library honest
(every fact has a story and a source); the library keeps the chronicle
useful (you rarely need to read it, because current truth is filed); the
delegation engine feeds both without bloating either (reports compress
into log subtrees and filed facts).

## The coordinator is an expert of coordination

A frontier model given everything becomes mediocre at everything: context
is working memory, and attention divides across whatever it holds. The org
chart is a CONTEXT-ALLOCATION strategy. The coordinator's window holds
goals, unit lists, and reports — so its judgment about ordering, routing,
and meaning stays sharp — while each specialist's window holds exactly one
unit, so its depth is undiluted. The counterintuitive consequence: the top
agent should know the LEAST detail of anyone in the hierarchy, and that is
a feature. Depth of expertise lives one level down, freshly instantiated
per task; expertise IN COORDINATION is what accumulates at the top.

## The fractal law

Every level of the org is the same shape. An area that develops its own
cadence gets its own coordinator contract (a sub-org); a codebase gets its
own repo with its own architecture skill; a sub-org's units can themselves
delegate. Depth is unbounded because the pattern is self-similar — and
traceable at every level, because each level keeps the same discipline:
brief down, report up, log everything, disclose delegation. The principal
can ask the top coordinator what ANY agent at ANY depth was doing on a
given day, and the answer is a walk down the logs.

Two costs keep the fractal honest. Each level adds translation loss, so
depth is spent only when a unit genuinely cannot fit one context. And
structure is promoted only under real pressure (the growth ladder in the
workspace-stewardship skill), never in advance — an org scaffolded for a
scale it hasn't reached is documentation that lies.

## The org chart is discovered, not designed

The root of an org is always provisional. A workspace instantiated for one
project tends to reveal, through use, that the principal's true scope sits
a level above it: the thermostat project turns out to be home improvement;
home improvement spawns a business; the business turns out to be one
department of a life. The pattern does not fight this — it plans for it.
The stewardship skill's re-root protocol lets the org zoom out at any
moment (broaden in place, supersede with a new root, or seed a sibling)
under one invariant: a re-root narrows no one. Every child keeps its
scope, contract, and memory; the root only gains altitude, and its
per-domain knowledge gets thinner as its span widens, because depth
belongs to the children. Start every org small and honest; the ladder up
will be there when the larger picture becomes visible.

Roles emerge the same way, bottom-up. When a coordinator — at any level —
notices it keeps writing the same kind of brief, that recurrence IS the
org chart forming: recurring procedure crystallizes into a skill,
recurring ownership into a seat (orchestration skill, "Crystallizing
recurring roles"). And because every role's memory is text on disk, the
org never needs to scale DOWN: a seat not invoked simply waits, frozen,
its reality intact, costing nothing — there are no layoffs in an org whose
employees are files. The org's true size at any moment is just its active
surface; everything else is potential, perfectly preserved.

## The rules evolve under their own discipline

An org whose instructions can only change by hand stops improving the
moment its principal stops editing files. This pattern expects the
opposite: contracts and skills are living artifacts, amended from evidence
as the org learns what its own rules cost — and repealed the same way when
one proves wrong. What keeps that from becoming drift is that the
instruction layer is subject to the delegation engine like everything
else. A rule change is a UNIT: dispatched to a fresh, maximally capable
agent, briefed with the evidence rather than a draft, never typed in by
the seat that just lived the problem. The agent that did the work knows
the most about it and is the least able to audit it, so the org separates
noticing from authoring — that separation is what makes self-amendment
safe rather than self-justifying (instruction-changes skill).

## Plain files, plain git

Everything is markdown in a git repository. This is deliberate: files are
greppable, diffable, linkable, portable across tools, and readable by
human and agent alike with zero infrastructure. Git gives the chronicle a
second spine — every session close is a commit, so "what changed and when"
has a machine-precise answer beneath the human-readable one. No databases,
no proprietary formats, nothing the principal couldn't read in twenty
years with a text editor.

## The automation horizon

An org that only files notes plateaus; the pattern's final layer is that
the org BUILDS ITS OWN TOOLS. When a manual process repeats enough to have
a shape, the coordinator proposes automating it, designs it first when the
shape is unsettled, and grows it as a code project meeting the
agent-maintainability bar (`docs/coding-projects.md`). The org's software
is subject to the org's own discipline — mapped, verified, logged — so
automation extends the org instead of becoming an unmaintained appendage.

## Lineage

Distilled 2026-07-16 from three working systems built by the pattern's
first principal: a personal daily-note vault (the rabbit-hole logging and
quest vocabulary), a fully agent-maintained codebase (orchestration,
doc-hygiene, architecture stewardship, design-first delegation), and an
Agent Org prototype (the coordinator seat, dashboard lanes, and
plain-vocabulary reporting). The synthesis — one coordinator over
chronicle, library, and delegation — is the layer this template adds.
