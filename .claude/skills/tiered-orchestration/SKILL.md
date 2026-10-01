---
name: tiered-orchestration
description: >-
  Run a large or long-running body of work to completion AUTONOMOUSLY, across as
  many context windows as it takes, WITHOUT losing design depth to throughput
  pressure. Takes input in any form — one or more problem statements, a
  brain-dump, a whole document, or a wave of change/UAT feedback — and drives it
  research → design → plan → build to done, standing up a relay of orchestrators
  beneath you so no agent ever holds the whole job. Its distinguishing rule: a
  change-stream is never a plan, it is an INPUT to a fresh design front-end;
  anything carrying a new design or preference question is routed through a deep,
  GATED design pass (reroute-don't-answer, a role-injected expert per question, a
  blind adversarial skeptic and an invariant-audit at stakes) before a build
  relay is allowed to touch it — because a design discipline that is not an
  encoded, gated step decays into a cheaper ritual under momentum. Use when the
  CEO hands over a big job and wants it driven to done without further
  intervention ("run it to completion," "get this done while I'm away," "don't
  stop until it's finished"); when a raw request must be researched and designed
  before it can be built; when a UAT or change wave arrives and must not be
  shipped shallow; when the work plainly will not fit one agent's usable context;
  or when a normal orchestration round keeps stalling on the context wall. A
  named specialization of the orchestration skill. NOT for small multi-part work
  that fits one session (that is plain orchestration), and not for resolving a
  batch of open decision-questions alone (question-review).
---

# Tiered orchestration: running a long job to completion without going shallow

This is how the org takes a job too big for any single context window — a
large build, a bulk migration, a workspace-wide cleanup, a raw request that must
first be researched and designed, or a wave of UAT changes — from input in any
form all the way to done, **without the CEO babysitting it and without the
work going shallow under speed.** It is a **named specialization of the
[orchestration](../orchestration/SKILL.md) skill**: same loop (brief → verify →
integrate → log → report), same "context scope is a tool" premise, pushed to the
scale where the whole job cannot fit one mind and driven by a relay of fresh
agents that hand off across the context wall.

It exists because a long autonomous run fails in **two** ways, and most schemes
guard only the first:

- **It runs out of context.** One agent cannot hold a large job; past ~50% its
  judgment degrades and the work degrades with it.
- **It goes shallow.** Under throughput pressure the *deepest design moves* — the
  ones that make the difference between work that is merely shipped and work that
  is *right* — quietly stop firing, unless they are encoded as **gated steps** the
  run cannot skip. A run can hit every deadline and still ship shallow.

The relay below is the fix for the first failure; the **routing gate and the
gated design pass** are the fix for the second. Both are load-bearing. A run that
keeps only the relay ships fast and shallow — which is the exact regression this
skill was written to prevent.

Orchestration warns that "depth is a cost — recurse only when a unit cannot fit
one agent's context." Here the whole JOB cannot fit one context, so you recurse
to the depth floor on purpose: the translation loss orchestration cautions about
is the price you knowingly pay for the throughput it buys.

## Premise 1 — the context wall

- A strongest-tier agent begins making mistakes once its session context passes
  **~50% of the window (the proportion is the rule, whatever the window's
  absolute size).** This is the single largest cause of long-task failure, and
  the relay is built around it.
- So **every agent watches its own context** and, once past its threshold, stops
  at a CLEAN boundary (a committed unit, a returned child), finalizes its handoff,
  and reports up. Nobody pushes into the degraded zone to "just finish."
- **Thresholds are proportional and role-dependent.** Workers and orchestrators
  wrap **past ~50%**. The coordinator, holding only thin summaries, may run to
  **~60%**. And **deep-design and decision specialists wrap far earlier — past
  ~25–30%** — because their *judgment is the deliverable* and it is the first thing
  the context wall degrades; a design call made at 55% is exactly the degraded
  judgment this whole scheme exists to avoid. A design specialist's early wrap is
  therefore usually a completed pass returning `done`, **by design, not a
  context-wall failure** — read a low wrap-% on a design agent as success, not a
  stall. (See **Briefing each layer** and
  [references/design-passes.md](references/design-passes.md).)

## Premise 2 — an ungated discipline decays under momentum

The second premise is a law observed under real autonomous load:

> **An encoded discipline survives momentum; a learned-but-unencoded one decays
> into a cheaper proxy that looks like compliance.**

The evidence that named this law: a run whose deepest design lenses existed only
as *moves a lead chose to make* — not as steps the process required — kept its
execution machinery intact but shipped shallow, because under throughput pressure
those un-required lenses simply stopped firing. The verification discipline that
*was* encoded held; the two design lenses that were not encoded vanished at the
first speed boundary. The failure was not laziness — it was **a rigorous ritual
applied to the wrong axis**: the run kept doing something that looked like the
discipline (a fast single-designer pass) in place of the discipline itself (a
rerouted, adversarially-reviewed, invariant-audited design).

The consequence for this skill is structural, not motivational: **you do not
preserve design depth by exhorting agents to be thorough. You preserve it by
making the deep steps gates the run cannot pass without clearing them** — a
routing gate that forces new design problems into a design pass, and a design
pass that cannot be declared *binding* until its stakes-gated lenses have fired.
Everything about design in this skill is built to be un-skippable, because
skippable is the same as absent once the run is moving fast.

## Premise 3 — a gate only sees the evidence class it consumes

The third premise is Premise 2's sharpened edge, learned the same way — from a real
autonomous run:

> **A gate examines only the evidence class it is pointed at. Work can clear every
> gate honestly and still be condemned at first contact, when the CEO judges in
> a class no gate ever consumed.**

The run that named this law had encoded its argument machinery completely — routing,
role-injected design, adversarial skeptics, invariant audits, a consumer-verified
binding gate — and every one of them held under momentum, exactly as Premise 2
promises. It shipped condemned work anyway. Every gate consumed *arguments about the
work* (specs, state machines, invariants) and *code-space measurements* (green suites,
DOM inspection, compiled styles); the CEO experienced *the composed, rendered
result on their own device* — and every condemned defect lived exclusively in the class
no gate examined. Nobody skipped a step and nobody lied. The gates were simply never
pointed at what the CEO would look at.

The structural consequence extends Premise 2's: **it is not enough to encode the deep
steps — you must encode the evidence class the steps consume.** So every run declares
its **acceptance medium** — the form in which the CEO will actually experience
the finished work: rendered screens on a phone and a desktop for an app, the terminal
for a CLI tool, the read page for a document library — and the design and verification
machinery below is keyed to **produce and consume evidence in that medium**, never a
cheaper proxy for it (a description of a screen, a DOM dump, a green test suite, an
argument about a document). The machinery — the declaration, the journey inventory,
the composed-artifact contract, the evidence gate, and the walkthrough gate — is the
**acceptance-evidence discipline**, and it lives in
**[references/evidence.md](references/evidence.md)**; the sections below carry its
hooks where they bite.

## Depth is the multiplier

- An agent that DOES the work fills its context with raw material and reaches its
  wall fast. An agent that ORCHESTRATES holds only its children's summaries, so it
  gets **~10x more** work done before it wraps. Tiering compounds it: roughly
  **~10x per tier.**
- **The depth floor (a platform limit when this was written; re-check it in
  your environment).** Spawned nesting bottoms out at **depth 3**: coordinator →
  layer 1 → layer 2 → layer 3. A layer-3 agent has **no spawn tool** and cannot go
  deeper. So there is a hard maximum of three orchestration tiers below the
  coordinator — which is plenty: three tiers of ~10x is enormous reach.

## The three-tier relay

Roles are fixed by tier, and the discipline lives in keeping them fixed:

- **Layers 1 and 2 orchestrate ONLY.** Each spawns ONE child, points it at the
  shared plan and the latest worker handoff, and drives a relay: when its child
  wraps and reports "still in progress," it spawns a **fresh** child pointed at
  the now-updated handoff, and repeats — until it hits its own ~50%, then reports
  up. It never touches the work itself. (An orchestrator that starts fixing things
  has become a worker, and burns the very context that was buying you 10x.)
- **An orchestrator spawns its child in the FOREGROUND, and stays resident.**
  "Drives a relay" means a **single turn that stays alive** across its children:
  spawn each child as a **blocking/synchronous** call (`run_in_background: false` —
  never the background default), so the child runs inside the orchestrator's own
  turn and reports back
  *to the orchestrator*, which then spawns the next fresh child — all before the
  orchestrator itself wraps. **Never background the child.** An orchestrator that
  backgrounds its only child just **ends its turn** — the child's completion
  surfaces to the durable top instead, the orchestrator is gone, and the tier has
  silently collapsed. Foreground is what keeps it in the driver's seat.
  (Backgrounding a child is the coordinator's alone — see its loop.)
- **Layer 3 does the work.** It reads the plan and the latest handoff to find the
  next unit, does it, **commits** it, **checks it off** in the plan, and
  **updates** the rolling handoff — unit by unit — until it passes ~50%, then
  wraps at a committed boundary, finalizes the handoff, and reports up. Layer 3 is
  the worker tier precisely because it is the one that cannot delegate further.
- **Same model at every tier — the strongest the environment offers, explicitly
  selected on every spawn** (the model is the one lever the spawner holds; never
  accept the default). **Reasoning effort is not a spawn parameter — it inherits
  from the invoking session** — so the required effort (orchestration, "Before a
  long run") reaches an agent only as a request in its brief, and a request
  verifies nothing: the session's actual
  setting is checked before every L1 spawn (the coordinator's loop, step 0). Each
  agent is briefed to watch context and wrap past its threshold.

It is a **sequential relay, not a parallel fan-out**: one worker completes and
hands off, the next fresh worker is pointed at that handoff. Mutating work runs in
series because all tiers share one working tree (orchestration's rule); the relay
is how you obey that rule across many context windows instead of one. (The
coordinator's one backgrounded child is the **L1 itself**; the front-end's
read-only branches run **foreground-serial beneath the L1** — see the spoke.)

## The shared state that makes it resumable

Four artifacts, **global to the run** (one of each, not one per layer), let any
fresh agent pick up exactly where the last one stopped:

- **The plan** — the whole job as a checklist of **small, independently
  committable units**, each checked off the moment it lands. It opens with an
  **immutable scope fence** (goal + out-of-scope list) that only the CEO may
  change ([references/mid-run-forks.md](references/mid-run-forks.md)). A reader
  sees at a glance what is done, what is next, and what is out of bounds.
- **The handoff** — the **latest state only**, overwritten every wrap: what the
  last worker finished, where it stopped, and **what the next worker does first**.
  It answers one question — "where do I start right now?" — and nothing else lives
  here, because everything here is disposable the moment the next worker wraps.
- **The field notes** — the **durable** knowledge the handoff must not carry:
  gotchas, decisions made and why, environment quirks, cross-unit context, and the
  run's **standing invariants** (the injectable product properties every design
  brief must honor and every invariant-audit checks against — see
  [references/design-passes.md](references/design-passes.md)). **Append-only, never
  overwritten** — a sibling file (`…-field-notes.md`). Latest state overwrites (the
  handoff); durable
  knowledge accretes (the field notes).

**Who writes the shared files: relay agents append; gathered branches return.** An
agent in the **mutating relay** (a build worker, an orchestrator wrapping) has sole
custody of the run during its turn, so it appends its own ledger line and
field-notes directly, as its final act — the standing rule, unchanged. A **gathered
branch or specialist** — a front-end area, a design lens, a skeptic, an auditor, a
decision reasoner, the walker: any agent whose completion a conducting tier gathers
— writes its **own dedicated artifacts** directly (its design doc, its lens
artifact, its unit's evidence files; separate files never contend) but does **not**
append to the run's shared files (the ledger; the field notes, standing invariants
included). It **returns** in its up-report: its proposed ledger line(s), any new
standing invariant it articulated (flagged as needing the outbound audit), and any
durable field-note — and the **gathering orchestrator serializes** those into the
shared files as it gathers. This holds whether branches ran parallel (concurrent
appends clobber) or foreground-serial (write-authority for global files stays at
the conducting tier, not scattered across leaves).

- **The run ledger** — the relay's own **topology**, captured cheaply: a
  **dedicated append-only file, sibling to the plan** (for a quest-driven run,
  `quests/<quest>-run-ledger.md`; the front-end names the path and seeds the
  header). Every agent at every tier
  appends **one terse line on wrap/return** — its own generation's summary — as its
  final act before reporting up. (Relay agents append their own line; a **gathered
  branch** returns its proposed line in its up-report and the gatherer appends it —
  see "Who writes the shared files.")

Ledger schema — one line per agent per wrap:

```
<timestamp> · <tier> · gen <n> · model <model> · spawned-by <who> · <units|children covered> · wrap <ctx-%> · reason <wrap-reason>
```

The `model` field records the model each generation actually ran on — the one
thing the spawner explicitly set (effort inherits from the session and cannot be
recorded per-spawn).

Worked example (one run, three wraps up the tiers):

```
2026-08-14 14:32 · layer-3 · gen 4 · model opus · spawned-by L2 gen 2 · units 12–14 · wrap 52% · reason context-wall
2026-08-14 15:10 · layer-2 · gen 2 · model opus · spawned-by L1 gen 1 · children L3 gen 3–5 · wrap 51% · reason context-wall
2026-08-14 16:20 · layer-1 · gen 1 · model opus · spawned-by coordinator · children L2 gen 1–2 · wrap 50% · reason context-wall
```

Workers note the plan **units** they committed; orchestrators
note the **child generations** they relayed; the coordinator appends on its own
hand-off to a fresh session or at run-end. **Append-only — never edit a prior
line.** The relay is sequential (one mutating agent at a time), so single-line
appends never contend — and gathered branches do not append at all: they return
their line for the gatherer to serialize (see "Who writes the shared files"), and
the timestamp + `spawned-by` fields reconstruct the tree whatever the append order.

**It is a ledger, not a narrative — one line, schema fields only: no prose, no
sub-bullets, no multi-line entries.** This rule has teeth because the file is
**append-only, so drift cannot be cleaned from below**: one agent that writes a
paragraph where the schema says a line permanently bloats a file every later
generation must read to resume — and once bloated, agents stop reading it,
defeating the one thing it exists for. So the one-line schema **with a filled
example goes in every orchestrator brief from the first spawn**, not just the
plan. Work detail lives in the plan checkboxes, the handoff, and the field notes;
the ledger stays thin.

**The typed wrap-reason.** The `reason` field is a fixed enum, carried
identically on the ledger line AND in the handoff/up-report, so the ancestor
spawns the *right kind* of successor:

| wrap-reason | what happened | what the ancestor does |
|---|---|---|
| `context-wall` | passed the threshold with work remaining | spawn a **fresh same-tier agent** to continue the relay |
| `budget-park` | the **budget gate** closed with work remaining ([orchestration](../orchestration/SKILL.md), "Before every spawn"): the agent found it closed before its next spawn or next unit, whatever its own child had reported, so it finished the step in hand and started nothing new | spawn **no** successor: finish your step in hand, record the reading in the handoff, and wrap `budget-park` yourself; the **durable top** parks the run and relaunches it from the handoff once the allowance resets |
| `expansion-point` | reached a scheduled or triggered plan-expansion point | a spawn-capable tier stands up a **fresh expansion planner** (planner's model) |
| `blocked` | hit a **bounded decision fork** above the agent's altitude — a choice with real downside either way | a **decision specialist resolves it and the run acts** (the derivability test), and the call lands in the **decision ledger**; mid-run the CEO is interrupted only by a scope-fence change or an outward-facing act ([references/mid-run-forks.md](references/mid-run-forks.md)) |
| `design-gap` | surfaced a **new design problem** — not a bounded pick, but a "how should this look/behave / what should this become" that needs *designing* | a spawn-capable tier re-enters a **design pass** ([references/design-passes.md](references/design-passes.md)), then an **expansion pass** re-plans that region — the build relay does **not** resolve it in-seat |
| `env-blocked` | the **environment cannot produce evidence a DoD requires** — the product will not run, a required stack or tool is absent | **stop-the-line for the affected units**: a spawn-capable tier routes environment recovery into the plan (a fresh expansion pass appends the recovery unit), or — if the environment is genuinely unobtainable autonomously — escalates to the CEO as **blocking residue**; the affected units stay open and the run cannot close over them ([references/evidence.md](references/evidence.md)) |
| `done` | the plan is fully checked off (or this agent's scope is complete) | **verify** — including the walkthrough gate for any run with experienced surfaces ([references/evidence.md](references/evidence.md)) — and close, or report `done` upward |

`blocked` and `design-gap` are the two design-safety reasons, and keeping them
**distinct** is load-bearing: a bounded pick gets a single recommendation and the
run moves on; a new design problem gets a *whole design pass*, because resolving
it as if it were a quick decision — in the build seat, from the coordinator's own
idea — is precisely how a run goes shallow. When a worker is unsure which it is,
it wraps `design-gap` (the protective default) and the spawn-capable tier
reclassifies.

**The done bar: a checkbox is a claim, and debt does not roll.** A unit's checkbox
asserts its DoD met **in full, in the DoD's own medium** — a unit with any clause
unmet stays unchecked, with the blocker recorded in the handoff; checking a box over
an unmet DoD is falsifying the plan, not flagging debt. Flagged verification debt
**blocks phase and run closure at every tier**: `done` may not be declared — by a
worker, an orchestrator, or the coordinator — while any unit carries owed
verification or an open `env-blocked`; there is no "complete except the
verification." And a DoD, once in the binding plan, **binds every tier**:
reinterpreting, waiving, or demoting one mid-run is a plan mutation only an
expansion pass may make (scope-trace and all,
[references/mid-run-forks.md](references/mid-run-forks.md)) — never a wrap-note. The
run that taught this rule demoted its own hard-required render evidence to a flagged
"owed" one reasonable step at a time, at every tier, openly — and declared itself
complete beneath the one gauge that would have caught what the CEO then condemned.

Every orchestrator points its child at ALL FOUR artifacts. A fresh agent at any
tier resumes by reading them — no memory of prior sessions required. This is the
backbone; protect it. As long as the plan, handoff, field notes, and ledger are
current, the run survives any single agent hitting its wall.

## The coordinator's loop

You hold the top. Your job is small and stays small: brief and launch, relay thin,
reconcile and report.

0. **Verify the session before every L1 spawn**, above all the first from a fresh
   session ([orchestration](../orchestration/SKILL.md), "Before a long run"). A
   mismatch is an environment block only the CEO can clear, like an unrecoverable
   `env-blocked` and not decision traffic: don't spawn; put it to the CEO. Every
   spawn at every tier also passes the **budget gate** (orchestration, "Before
   every spawn"); once it closes, the relay parks (the `budget-park` wrap-reason)
   and you relaunch it from the handoff after the allowance resets.
1. **Delegate the whole run to ONE layer-1 orchestrator — front-end included.** Do
   not run the front-end from your own seat. Brief and spawn one L1 pointed at the
   raw INPUT (in whatever form it arrived), this skill, and the CEO's scope intent
   (GOAL + OUT-OF-SCOPE), chartered to drive the entire arc: the **front-end** first
   (its first act is the routing gate — seed the run artifacts, write the
   acceptance-medium declaration and journey inventory, triage; then research → the
   gated design passes → plan synthesis), then the **build relay**, then the
   **walkthrough gate**, then its own end-of-run verify. The full discipline — the
   gated lenses, the binding gate, the evidence gate — fires beneath the L1,
   unchanged, and the L1 is the plan's **pre-build consumer-verifier**: it verifies
   the whole synthesized plan — binding states, DoD evidence clauses, journey
   owners — before any build unit runs. Being a subagent, the L1 runs the design
   fan-out **foreground and serial** (the "below the coordinator: resident,
   foreground" rule — [references/front-end.md](references/front-end.md)); this
   trades parallel breadth for altitude purity — a speed cost, not a depth cost,
   since every pass still fires all its lenses at full judgment. The charter names
   one **scheduled wrap at the front-end→build seam**: when the plan is synthesized
   and verified, the L1 wraps (its chartered scope for that generation complete)
   instead of rolling into the build — so the seam is a deterministic boundary the
   durable top inspects, exactly as a scheduled expansion point serializes by
   construction. Background the L1 and stay responsive to the CEO (you may
   background because you are the **durable top**, re-invoked when it wraps;
   backgrounding a child is yours alone).
2. **Check the foundation at the front-end→build seam.** The scheduled seam wrap
   (step 1) is your deterministic pre-build inspection point — it fires before any
   builder runs, on every run, the degenerate small one included (where the
   producer/consumer split is thinnest and this check matters most). Spot-check —
   read-only, minutes, never redesigning content — that the foundation is sound:
   the scope fence matches the CEO's intent; the routing-gate decomposition is a
   real triage; the **acceptance-medium declaration** and **journey inventory**
   exist and name how the CEO will actually experience the result; the
   standing-invariant register carries every axis the declaration names
   (experiential included) or records why not; the **decision ledger** is seeded;
   and a sample of
   experienced-surface units carry their DoD evidence clauses
   ([references/evidence.md](references/evidence.md)). A poisoned foundation caught
   here costs one bounce; caught at reconciliation it costs the run. Then spawn the
   build-arc L1.
3. **Relay at the top.** At each `context-wall` wrap, spawn a fresh L1 pointed at
   the latest resumable state — the decomposition map + design corpus while the
   front-end is live; the plan + handoff once the build is running — until the L1
   reports the whole run `done`, or until you approach ~60% and hand off to a fresh
   session the same way. Handle what only the top can hold — a **channel
   escalation** (a scope-fence change, an outward-facing act on the product —
   [references/mid-run-forks.md](references/mid-run-forks.md)), an `env-blocked`
   the run cannot recover — by putting it to the CEO in product language or
   standing up the right agent, never by absorbing the work. Any other decision
   question that surfaces to your seat goes back **down** — specialist-resolved
   under the L1 and recorded in the **decision ledger**, never framed into an
   option menu for the CEO from your seat. **If a layer-3 worker completion
   surfaces directly to you, the relay has broken** — re-establish it (spawn a fresh
   L1 pointed at the latest handoff). Do not become the worker tier, and do not
   become the **front-end tier** either: never run the routing gate, a design pass,
   or plan synthesis in-seat — that is reroute-don't-answer applied to your own
   seat.
4. **Reconcile before declaring done — from your own seat, on artifacts, never on
   testimony.** When the L1 reports the whole run `done`, independently reconcile
   its claims (read-only) before anything reaches the CEO:
   - **The build**: spot-check the files, the build, the seams between units, the
     commit trail, and that the scope fence was honored.
   - **The design discipline held**: for every at/above-threshold unit in the
     decomposition map, both lens artifacts exist and every finding — the lenses',
     the designers' recorded FLAGS, the literal-reading verdicts — is resolved; and
     every design a build unit consumed was **binding, not draft**
     ([references/design-passes.md](references/design-passes.md) — this is the
     consumer-verified binding gate applied at the outermost tier).
   - **The evidence discipline held**: the acceptance-medium declaration exists and
     matches what was actually verified; every experienced-surface unit's checkbox
     references its evidence artifact — **spot-open a sample and read it yourself**;
     no owed verification and no open `env-blocked` anywhere; the **walkthrough
     verdict** exists with every flaw dispositioned **within the severity floor** —
     audit each accepted flaw's recorded seat and rationale, and confirm no
     ship-blocking flaw was intra-run accepted (a ship-blocking flaw is fixed, or
     stands as named blocking residue at the top of the report) — and you
     **personally read the
     staged walkthrough evidence** (the frames, the transcript) before reporting
     ([references/evidence.md](references/evidence.md)).
   - **The decision discipline held**: every specialist-resolved fork has its
     **decision-ledger** entry in product language (the no-glossary bar), residue
     entries are flagged as direction calls, and nothing interrupted the CEO
     mid-run outside the two channels
     ([references/mid-run-forks.md](references/mid-run-forks.md)).
   A failed reconciliation **bounces the claim** — the run is not done; point a
   fresh L1 at the gap. Then report to the CEO **with the staged walkthrough
   evidence and the decision ledger named** — flagged entries first — so their own
   first contact starts from what the run already saw, and their review of what it
   decided on their behalf runs at their own cadence.

Ideally you see "done" after a single layer-1 session. The relay exists so that
"not yet" costs you only one more dispatch.

**The degenerate small input.** The single-planner case survives — inside the L1.
When the whole job is one bounded, well-understood change, the L1's front-end is one
planning agent and its relay is short; the front-end still scales to the input.
What does **not** scale down is the delegation itself: even a small input goes
through an L1, because a "small enough to keep in-seat" opt-out is exactly the kind
Premise 2 says decays — under momentum the coordinator will rationalize ever-larger
inputs as small. One thin tier of ceremony on a genuinely small job is the price of
a rule with no judgment-dependent escape hatch. Every front-end agent is still a
**fresh subagent at the planner's model** (the "Same model at every tier"
invariant).

**The altitude litmus.** Does your context contain raw work-material — a design you
are writing, a plan you are synthesizing, files you are editing, a fork you are
framing into options for the CEO? Then you have fallen off altitude. Decision
traffic counts as work-material: a seat holding option tables, measured trade-offs,
and implementation vocabulary on their way to the CEO is doing the work this skill
routes to specialists. You hold the charter, thin L1 summaries, and read-only
verification spot-checks — nothing else. You are not a pass-through: you are the
durable top (you survive every L1's context wall), the independent outer verifier
(a seat that never held the work, so its reconciliation is real), and the CEO
interface (status, the two escalation channels, the staged end review — in the
product's language). That is the residual value; protect it.

## The routing gate: a change-stream is an input, never a plan

The single highest-leverage rule in this skill. The gate is **not** "everything
gets a design pass" — it is *"the front-end triage is mandatory; no path from a raw
change-stream to a build relay may skip it."* Triage then routes each item to the
depth it needs — a clear defect straight to build, a new design problem to a design
pass, and so on ([references/front-end.md](references/front-end.md) carries the
classifier). What the gate forbids is dispatching the *stream itself* to a build
relay unexamined.

**The highest-risk input is one already shaped as a task or defect list** — a UAT
backlog, a "fix these" list. It **looks** relay-ready and has had **zero design
triage**, so a throughput-pressured coordinator is tempted to hand it straight to
the relay — and that one move *is* the shallowness failure: a new design problem
buried in the list gets baked in by a builder reasoning from the constraints of the
work it is about to do. So a pre-shaped list is treated exactly like any other
input: it goes through triage first. The tie-break is **protective** — when an item
plausibly changes what a surface IS, how it behaves, or introduces a surface that
did not exist, route it to a design pass; a mis-route toward "design" costs one
cheap triage step, a mis-route toward "build" costs a shipped regression. The gate
fires at the front (the front-end's first act) **and** again mid-run: a build unit
that only reveals its design nature once you are in it wraps `design-gap` and
re-enters the same path. Two nets for the same fish.

## Briefing each layer

Every brief points at this skill and at
[orchestration](../orchestration/SKILL.md), names the plan, handoff, field-notes,
and ledger paths, and sets the wrap threshold and the budget gate's current
threshold (orchestrators check it before every spawn, workers before each next
unit). Beyond that:

- **An orchestrator brief (layers 1 and 2)** says, in the strongest terms: you
  **orchestrate, you do NOT do the work**. Spawn one child **in the foreground**
  (a blocking/synchronous spawn — `run_in_background: false`, never the background
  default, or your turn ends and the relay collapses beneath you), point it at the
  plan, latest handoff,
  field notes, and ledger, relay a fresh child each time yours wraps, and report
  up when YOU pass ~50%. "Orchestrate only, relay, report up" is the whole job.
  Before relaying the next child, the orchestrator **consumes the evidence** the last
  child's units claim: it opens the artifacts — reads the frames, the transcript —
  checks them against each unit's DoD at the declared viewports, **and reads each
  frame as a page**: anything visibly broken in evidence it opens is bounced or
  recorded as a finding, whether or not the DoD names it. It **bounces** any unit
  whose evidence is missing or failing (un-check it, record the bounce in the
  handoff, point the next worker at it first). Consumption is owed at **every
  receipt, the pre-wrap one included** — and a fresh same-tier successor inherits any
  unconsumed backlog as its first duty, named in the handoff. Consuming evidence is
  the *verify* half of orchestration ([orchestration](../orchestration/SKILL.md),
  "Owning the deliverable"), not doing the work: an orchestrator that relays on
  testimony has skipped its own loop.
  The **layer-1 charter is the whole arc** — front-end (routing gate, declaration,
  journey inventory, design passes, synthesis, pre-build plan verification), the
  scheduled front-end→build seam wrap, the build relay, the walkthrough gate, and
  its own end-of-run verify — not just the build. The charter carries the run's
  **decision authority** with it: every in-run fork is the L1's to route to a
  fresh blind specialist and act on — never to park for the CEO — with the
  **decision ledger** kept current as calls land, and its up-reports to the top
  written in product language
  ([references/mid-run-forks.md](references/mid-run-forks.md)).
- **A worker brief (layer 3)** says: read the plan and the latest handoff, do the
  next unit(s), **commit each, check each off, keep the handoff current**, and
  **append any durable gotcha or decision to the field notes**; wrap at a
  committed boundary once past ~50%. It **wraps-and-reports-up** at an
  `expansion-point`, a `blocked` fork, or a `design-gap` — never resolving a design
  question in-seat. Reaffirm the [doc-hygiene](../doc-hygiene/SKILL.md) flag-duty:
  under relay pressure it still **flags** any bloat it is forced to read or edit
  and never silently restructures mid-unit.
  Where a unit's DoD names experienced-surface evidence, the worker **produces it in
  the DoD's own medium** — the rendered frame on the real product at the declared
  viewports, the real transcript — files it in the run's evidence area, and references
  it from the unit's plan row; a checkbox asserts the **whole** DoD met
  ([references/evidence.md](references/evidence.md)). The moment the environment cannot
  produce required evidence, it wraps **`env-blocked`** — it never converts the gap
  into a flag it carries forward.
- **A design or decision specialist brief** is built from the **role-prompt
  skeleton** ([references/role-prompt.md](references/role-prompt.md)) and set to wrap
  **far earlier (~25–30%)** — a bounded pass at full judgment, not a broad pass at
  degraded judgment. This is where design depth is manufactured; brief it with care.
- **Every relay agent appends its ledger line on wrap** — carrying its **model**
  and its **typed wrap-reason** — as its final act; a gathered branch returns its
  line for the gatherer to serialize ("Who writes the shared files"). Carry the
  one-line schema and a filled example in the brief **from the first spawn** — the
  append-only ledger cannot be de-drifted from below.
- **Log every dispatch** under a `Having a subagent …` parent
  ([daily-log](../daily-log/SKILL.md), orchestration logging). The deepest work is
  self-documenting through the plan and handoff, so up-reports stay thin.

## Hygiene checkpoints: keeping the relay from ravaging the org

An unattended relay edits many files across many context windows; unchecked, it
can bloat the very library it works in. The design steps stay additive and
read-only against the org's files — but the run now accretes an **evidence
area** (frames, transcripts) and a design corpus, and the checkpoints watch
their growth too. Two halves hold the line:

1. **The flag-duty holds under relay pressure.** Every layer-3 worker keeps
   [doc-hygiene](../doc-hygiene/SKILL.md)'s **standing duty**: forced to read or
   edit a file showing bloat signals, it **flags** (records the signal in the
   handoff and its ledger line, reports up) and never silently restructures
   mid-unit nor absorbs the rot.
2. **Scheduled checkpoints at phase/section boundaries** — the planner places
   them, **not** a blind every-N-units cadence. A checkpoint is an **isolated
   unit** (doc-hygiene, "reorganizing safely") that **assesses** rot across **both**
   the mutated org/workspace files **and** the four run artifacts, the design
   corpus, and the **evidence area** (all grow by accretion — assess organization
   and growth; prune nothing mid-run: the corpus and evidence are the audit trail
   reconciliation reads), then **acts only if needed**: fix it in place as this
   unit, or **escalate** if it is too big for one clean unit.

**Who runs it.** An ordinary checkpoint is *work* (assess + a small fix), so a
**layer-3 worker CAN run one** — no spawn. Only a restructure too large for one
clean unit, or one that finds an **instruction file** needs restructuring (itself
an instruction change → [instruction-changes](../instruction-changes/SKILL.md)),
escalates out of the relay.

## Decision authority: what the CEO owns, what specialists own

The run is autonomous, but not sovereign. The line is durable:

- **The CEO owns what the product IS** — direction, scope, identity, the
  structure of anything consequence-critical, and sign-off on the core. Only the
  CEO changes the **scope fence.**
- **Expert agents design how it BEHAVES** — construction, wording, interaction,
  visual, flow. This is the work the run reroutes to fresh role-injected experts
  rather than deciding from its own idea (the director model,
  [references/design-passes.md](references/design-passes.md)).
- **Genuinely-open forks are settled by blind specialists and the run acts on the
  recommendation** — reversible because every change is committed first. Every
  resolved fork lands as one plain-product-language entry in the run's **decision
  ledger**, the CEO's **optional read at the end, never a queue during** — and
  even the narrow residue that turns on their **own un-recorded vision** (not
  derivable by a strongest-model specialist from the real evidence, the
  established philosophy, and their own accumulated rulings) proceeds on the
  recommendation, flagged there for their cadence. Mid-run, exactly **two channels
  interrupt them**: a **scope-fence change**, and an **outward-facing act on their
  product** — the two calls the hard proviso cannot make reversible (the
  derivability test, the ledger, and the channels:
  [references/mid-run-forks.md](references/mid-run-forks.md)).

A run that batches its forks to the CEO as a decision inventory — or drips them
one reasonable-looking round at a time, the same inventory in slow motion — has
turned an autonomous job into a Q&A bottleneck, the exact failure this skill
prevents. The bottleneck forms at the top: every question reaches the CEO through
the coordinator, so the derivability test binds that seat first and hardest. The
gauge is empirical: when the CEO keeps selecting the recommendation, the streak is
the measurement that the calls were derivable — their past answers have joined the
sources — and the asking seat, not the run, is the bottleneck.

**Keep two "high-stakes" axes orthogonal — or you rebuild that bottleneck.** The
**stakes threshold** (does the design pass fire its two lenses?) governs
**quality-gating** and is entirely **autonomous — no human is involved.** The
**derivability test** (does a fork reach the CEO?) governs **who decides.** A
change is routinely consequence-critical (so the lenses fire) *and* fully derivable
(so no one is asked) — the common case. Wiring "consequence-critical → CEO
sign-off" collapses the two axes and recreates the decision-inventory bottleneck.
High-stakes means *audit it hard*, not *ask the CEO*.

**The walkthrough gate is not a Q&A bottleneck — keep the two ideas apart.** Autonomy
governs *who decides*; it has never meant the CEO's first contact with the
finished work goes unrehearsed. The walkthrough gate
([references/evidence.md](references/evidence.md)) asks the CEO nothing and blocks on
no fork: an autonomous walker walks the composed journeys, the run fixes what it
finds, and the staged evidence is what the CEO's own eyes land on first — at their
cadence, after the run has already looked. Staging evidence is verification, not
consultation. A run that declares done without anyone having walked what the
CEO will walk has not preserved autonomy; it has deferred its first real test
to the person it was meant to spare.

## The spokes

Descend to a spoke when the step in front of you needs its depth:

- **[references/front-end.md](references/front-end.md)** — research → design →
  plan, scaling to the input: the routing gate and triage, the research/design/plan
  arc, the parallel-safe fan-out and synchronous gather, plan synthesis and
  de-confliction, and the front-end's own resumable state.
- **[references/design-passes.md](references/design-passes.md)** — how a single
  design pass achieves depth: the reroute-don't-answer director model and its
  discernment, deep-understanding-by-injection, multi-discipline reconciliation, and
  the two **gated lenses** (the adversarial skeptic and the invariant-audit) with the
  opt-out stakes threshold and the consumer-verified binding gate that make them
  un-skippable on high-stakes work and spare thin work.
- **[references/evidence.md](references/evidence.md)** — the acceptance-evidence
  discipline (Premise 3's machinery): the acceptance-medium declaration and journey
  inventory, the evidence gate (real-product evidence artifacts, consumed at every
  relay seam), `env-blocked` and the done bar, and the walkthrough gate that stages
  "done" through the composed experience — with how it all degrades gracefully for
  work with no rendered surface.
- **[references/role-prompt.md](references/role-prompt.md)** — the reusable nine-part
  anatomy of a deep specialist brief (role injection → domain identity → effort →
  action fence → stance → grounding → understanding → deliverable → final-call
  reservation), single-sourced here for every design lens, decision reasoner,
  skeptic, and auditor the run stands up.
- **[references/mid-run-forks.md](references/mid-run-forks.md)** — resolving a fork
  the plan never settled without stalling: in-flight decisions (the derivability
  test, the decision ledger, the two channels that may interrupt the CEO), the
  `design-gap` tripwire, expansion passes (the scope fence and scope-trace), and
  the hard proviso that keeps every path reversible.
