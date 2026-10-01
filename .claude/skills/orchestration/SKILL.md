---
name: orchestration
description: >-
  Deliver multi-part work by delegating focused units to fresh subagents:
  decompose, brief, verify, integrate, log, report. Use whenever the CEO
  hands over more than one task at once, one directive decomposes into
  stages (research, drafting, filing, building), any single unit needs more
  than a few minutes of focused depth, the CEO interrupts a running round,
  or you are a subagent whose assigned unit turns out to need further
  splitting. Covers context scope as a
  quality tool, unit types for an org workspace, the subagent brief, the
  deliverable report, verifying another agent's work, the proof-grade bar
  any math past basic arithmetic must clear (proven and independently
  checked, never a confidence), logging every dispatch so the CEO can
  later ask what any agent did, the delegation
  disclosure that keeps deep verification from being duplicated at each
  level of an agent hierarchy, and recognizing when a recurring brief
  should crystallize into a permanent role (a skill or a seat).
---

# Orchestration: delivering work through delegated context

You are (or are about to become) a COORDINATOR: an agent that delivers a
body of work by giving each part to a fresh, focused subagent and owning
the quality of what comes back. This file is the loop. The files under
`references/` carry the depth; read one when the step in front of you
demands it:

- [references/briefing.md](references/briefing.md): writing the brief a
  subagent receives.
- [references/report.md](references/report.md): the deliverable report a
  subagent returns.
- [references/verification.md](references/verification.md): judging
  deliverables; dedicated adversarial checkers.
- [references/design-first.md](references/design-first.md): the
  specialization for design-heavy units — a decider agent before builders.
- [references/proof-grade-math.md](references/proof-grade-math.md): any
  unit whose deliverable rests on math past basic arithmetic — proven,
  independently checked, and reported by status before anything rests on it.

## Why delegate: context scope is a tool

An agent's context window is its working memory, and it degrades the way a
person's does: the more it holds, the less attention any one thing gets.
Delegation is how you spend context deliberately:

- The COORDINATOR keeps a high-altitude context: the goal, the unit list,
  and what came back. It never fills with one unit's raw research, drafts,
  and dead ends, so its judgment — ordering, integration, adequacy, what
  this means for the rest of the org — stays sharp all day. An agent that
  coordinates everything becomes an expert AT coordination; that is the
  job, not a limitation.
- Each SUBAGENT starts empty and receives ONLY its unit. Everything in its
  window is relevant; nothing competes with the task. A tight scope with an
  explicit definition of done reliably beats a large context with the same
  task buried inside it.

The craft is subtraction: a brief is good because of what it leaves out,
and a report is good because it compresses a unit's whole history into what
the parent actually needs. Guard the boundary in both directions.

## When to delegate, when not to

Delegate a unit when it is self-contained, worth more than a few minutes of
focused work, and describable without your conversation history. Do it
yourself when:

- The change is trivial: the overhead of a brief exceeds the work.
- The task needs the CEO mid-flight (their answers are the spec). Interview
  first; delegate once the spec is writable.
- You cannot yet write the spec. That gap is itself delegable: send
  READ-ONLY research subagents first and write the spec from their reports.
  Read-only research is the one case where a parallel batch is safe — one
  angle per agent — because nothing shared gets written.
- The unit's hard part is DECIDING, not doing: read
  [references/design-first.md](references/design-first.md) and send a
  design agent before any builder.

## Unit types in an org workspace

- **Research** (read-only): survey a topic, a market, a legal requirement,
  a codebase, the org's own files. Parallel-safe. Deliverable: a report
  with sources.
- **Drafting**: a document, a plan, a letter, a filing. Deliverable: the
  artifact at a named path, plus the report.
- **Filing / reorganization**: bulk moves inside the workspace under the
  workspace-stewardship rules. Series only; links must be walked.
- **Code**: work inside a sub-repo registered in the org map. The sub-repo's
  own CLAUDE.md and verification command govern; the brief must name them.
- **Automation builds**: a repeated manual process becoming a tool — a
  design-first candidate, built as a code unit (workspace-stewardship skill
  covers where it lives).

## The round loop

1. RESTATE the directive as a list of UNITS, each deliverable and
   verifiable on its own; get ambiguity clarified while the CEO is present.
2. ORDER by dependency: keystone units first, independent low-risk items
   early, the riskiest large unit last. MERGE items that are one underlying
   change (say so); SPLIT items with independent parts.
3. GROUND each unit: the workspace facts, starting points, and definition
   of done live in the brief — the subagent should never re-derive what you
   already know. For code units, verify the environment works from your own
   seat once (unit zero) before any unit depends on it.
4. Per unit, in series:
   a. Write the brief (briefing.md), pass the budget gate (below), and
      launch ONE fresh subagent.
   b. Receive its deliverable report (report.md).
   c. VERIFY the deliverable yourself (verification.md). Not adequate:
      bounce it back once, or relaunch with a corrected brief.
   d. INTEGRATE: fold results into the workspace (org files, quest, dash),
      LOG the dispatch and outcome in today's daily note, and commit before
      starting the next unit.
5. For a round whose units layered onto shared surfaces, finish with ONE
   adversarial check agent aimed at the seams BETWEEN units (verification.md).
6. Report the round to the CEO: what was delivered, how it was verified,
   what was escalated, what remains.

Run mutating units IN SERIES, not in parallel: subagents share one working
tree (the workspace, the dashboard, the same sub-repo), and concurrent
edits corrupt each other. Parallelism is for read-only research batches
only. Launch each unit as a FRESH subagent; never resume a previous unit's
agent for new work — its context is full of the last unit, which is exactly
the contamination delegation exists to avoid.

## Before a long run: verify the session

Reasoning effort is not a spawn parameter: every agent inherits the effort
of the session that launches it, so a session left at a lower setting
silently lowers the whole run, and a brief's effort clause is a request,
never a verification. Before launching any long run (hours, or more than
one context window; every tiered run):

- READ the session's actual model and effort. In the Claude desktop app,
  the session tool `get_session` (`session_id: "self"`) reports both;
  `get_usage` reports context and plan limits, not effort. Where nothing
  exposes them, the CEO's confirmation stands in for the reading.
- CHECK them against the CEO's requirement in the contract's standing
  facts; absent one, the strongest model at maximum effort. That
  requirement is the **required effort** every skill and brief means when
  it asks for effort. It can sit below the top setting: a vendor can remap
  what each level means, and a level past what a model handles well can
  churn instead of deepening. Choosing it is the CEO's quality call alone,
  never a precedent for lowering effort to save time or allowance ("Pace,
  never thin", below).
- On a mismatch either way, above the requirement or below it, DON'T
  LAUNCH: flag it. The setting is the CEO's to change, not yours.
- Re-read at EVERY launch (a fresh session need not start on the settings
  of the one it continues), and note what you read in the dispatch's log
  entry.

## Before every spawn: the budget gate

Plan usage is one allowance shared by every agent the org runs, and it
resets on a schedule. Spend past it either kills work mid-flight or bills as
paid overage, so the CEO sets a line, and every agent that spawns (the
coordinator and any subagent coordinating beneath it) checks it before EVERY
spawn:

- READ the meter fresh, never by feel. In the Claude desktop app, load the
  deferred session tool `get_usage` (ToolSearch) and read the plan's
  `Weekly · all models` percent, or whichever window the threshold names;
  the same call reports the reset time and any paid extra usage.
  `not_applicable` means no allowance applies, so there is no gate. An
  unreadable meter is never a pass: the coordinator asks the CEO; any other
  agent treats the gate as closed.
- CHECK it against the CEO's threshold in the contract's standing facts.
  The number is the CEO's alone: absent one, ask before the first long run
  and record the answer; never derive one. Below it, spawn normally: an
  early park on a margin of your own leaves paid-for allowance unused.
- AT OR PAST IT, START NOTHING NEW. Spawn nothing, except an agent whose sole
  job is the handoff or progress tracking that a clean resume after the
  reset needs, never "one more unit". Agents already running finish the
  step in hand, then hand off and report up; an agent working through
  several units without spawning checks before each next unit and, past the
  line, starts none.
- PACE, NEVER THIN. The gate decides when work happens, never how much of it
  or how well: don't lower effort or model, skip or shorten a gated step, or
  trim scope to fit what is left of the allowance. The work waits for the
  reset.
- CARRY the current number in every brief for an agent that spawns or works
  through units.
- REPORT each park: the coordinator tells the CEO, as status rather than a
  question, the reading, the reset time, and whether paid overage moved.
  That is the evidence the threshold gets tuned by.

## Logging the delegation

Every dispatch appears in today's daily log under a
`Having a subagent <verb> ...` parent (daily-log skill): the unit's goal as
the parent, the essential findings as children in the subagent's voice, the
outcome as the last child, artifacts linked rather than pasted. This is
load-bearing: it is how the CEO can ask, weeks later, "what was that agent
doing?" and get an answer. An unlogged dispatch is work that didn't happen.

## Owning the deliverable

You are responsible for what your subagent produces, the way a lead is
responsible for a teammate's merge. The subagent's own testimony is
necessary but not sufficient; verification.md describes the adequacy pass,
what to re-check yourself, and when a unit's blast radius warrants a
dedicated adversarial checker.

## Hierarchy: subagents that delegate

A unit can be too large for one context even after honest decomposition.
The subagent handling it MAY become a coordinator itself: same skill, same
loop, one level down. Point at this file in the brief when you anticipate
it. Likewise, a promoted org area or a sub-repo with its own CLAUDE.md is a
SUB-ORG: brief its units against the child's contract, not this one
(workspace-stewardship skill covers promotion).

- Depth is a cost, not a badge: each level adds translation loss; recurse
  only when a unit genuinely cannot fit one agent's context.
- If the environment does not let a subagent spawn agents, it returns a
  SPLIT PROPOSAL in its report and the parent runs the sub-units.
- Every level disclosed its delegation and verification in its report
  (report.md), so a parent knows what was already checked below and never
  pays for the same verification twice.

## Crystallizing recurring roles

Watch your own dispatch patterns. Around the THIRD time you write the same
kind of brief — the same skillset, the same grounding, a fresh agent
re-deriving the same footing — the org is telling you a permanent role
exists. Crystallize it instead of re-briefing it:

- **Recurring PROCEDURE** (how to do X well, no state of its own) becomes
  a SKILL: the brief's reusable sections move into it, and future briefs
  shrink to the unit's specifics plus a pointer.
- **Recurring OWNERSHIP** (an area with accumulating state — a finance
  desk, a client-relations desk) becomes a SEAT: a sub-org contract with a
  rolling "where things stand" (workspace-stewardship skill, ladder rung
  4). Dispatching to the seat means briefing a fresh agent with the seat's
  contract plus its current state; the agent updates the seat before
  reporting up. Between invocations the role is frozen — memory intact on
  disk, costing nothing, resumable by any fresh agent.

Noticing the pattern and WRITING the role are different jobs. Crystallizing
is an instruction change: the seat that spotted the recurrence is carrying
all the context that produced it, so it dispatches a fresh agent to author
the skill or seat and briefs it with the evidence rather than a draft
(instruction-changes skill).

This is the delegation twin of the automations rule (repeated process →
tool; repeated brief → role). Log the crystallization, register it in the
maps, and let the same rule apply at every level below you — a sub-org's
coordinator watches its own dispatch patterns the same way.

## Interruptions: staying responsive

The coordinator seat is a conversation seat. Work is arranged so that the
principal never has to wait for it:

- **Background by default** for any unit expected to outlast the current
  exchange. Dispatch it, log the dispatch, keep talking; the report
  arrives when it arrives. You are never blocked by your own delegations —
  at worst something is cooking, and you can say what and since when.
- **Never absorb an interrupt into a running unit's scope.** An
  interruption is its own intake (intake skill): capture it, answer it
  from the dashboard if it is a status ask, triage it into the round if it
  is work. The unit in flight keeps its original brief.
- **Checkpoint mutating units; let read-only units run.** When a pivot
  stops a round, a mutating unit either reaches its report or is told to
  stop at a coherent point and report what stands; the coordinator
  integrates or parks that state before the tree changes under it.
  Read-only research finishes on its own and its report keeps its value.
- **The same contract holds down the chain, at report speed.** A child
  converses with its parent through EARLY ESCALATION (report.md: stop and
  report now when something changes the plan) and the parent's
  bounce-backs (verification.md) — a slower conversation than chat, but
  the same shape: surface immediately, never absorb silently. Where the
  platform lets a parent message a running child, use it to redirect
  early rather than paying for a finished wrong deliverable.

## Escalations: the "hang on" protocol

Subagents are instructed (via the brief) to surface obstacles outside their
scope instead of silently absorbing them: a bloated file the unit must
build on, a contradiction between docs and reality, a missing structure.
When an escalation comes back: decide (with the CEO when the tradeoff is
theirs) whether it's fixed now, later as its own unit, or not at all; a
structural fix is its own ISOLATED unit (doc-hygiene skill); then fold the
answer back into the waiting unit's brief and relaunch.
