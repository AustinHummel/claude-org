# Design-first: decide before building

For a unit whose hard part is DECIDING — a new process, an automation's
shape, a workspace restructure, a data model, a cross-cutting code feature
— separate the DECIDER from the BUILDER. One fresh-context design agent
produces ONE authoritative design document with an ordered implementation
plan BEFORE any building agent touches anything; builders then execute that
plan in series, treating the doc as binding and escalating deviations back
into it.

## When to use it

- The unit carries genuine, interacting decisions where starting to build
  would bake in a choice you'd regret, AND 2+ building sub-units must stay
  coherent with each other.
- NOT for a bounded change with an obvious home (one new org file, a small
  fix, a routine filing) — that goes straight to one unit. Depth is a cost;
  spend it only when the design is genuinely unsettled.

## The loop

1. FRAME the question list: everything the design must decide, each phrased
   so "decided X" is checkable. This list raises quality more than anything
   else you write; spend your own understanding filling it.
2. SPAWN one design agent, fresh context, strongest available reasoning
   model. READ-ONLY except for exactly ONE design doc (in the relevant org
   area, or a sub-repo's `docs/design/`). The brief carries the question
   list, the binding constraints (the workspace's prime rules, the affected
   invariants, sibling designs by path), and DECISIVENESS: decide
   everything, no option menus — a hedge becomes a hole a builder falls
   into. Genuinely CEO-owned tradeoffs are the one exception: those come
   back as an option set with a recommended default, resolved before
   building.
3. GATE the doc against your question list: every question decided,
   alternatives only as rejected-with-reason, an EDGE-CASE LEDGER, one
   named OWNER for each new piece of state or math, and an IMPLEMENTATION
   PLAN of 1–4 ordered sub-units, each one agent's worth, each with
   starting points and a definition of done. Bounce once if a decision is
   missing or waffles. Commit the doc as its own deliverable.
4. BUILD the sub-units in series, each a fresh agent briefed from ONE
   sub-unit with the doc named as authoritative-and-read-first. Reality
   wins over the doc when they conflict: the builder follows the design's
   INTENT and escalates the delta rather than silently diverging or
   blindly obeying.
5. CLOSE with the seams check (orchestration loop step 5), then fold every
   accepted as-built deviation back into the doc so it never lies.

## Why the decider is not the builder

The agent that will build is the worst judge of what to build: it reasons
through the constraints of the work it is about to do. A separate fresh
agent decides on the merits, one authoritative doc keeps several builders
coherent, and the plan's sub-units each fit one context. The price is one
extra agent and one gate; pay it only when the design is genuinely
unsettled.
