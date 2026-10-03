# The front-end: research → design → plan (scaling to the input)

The build relay ([SKILL.md](../SKILL.md)) executes a plan. This spoke governs how
that plan comes to exist — the phase that turns a request **in any form** (one or
more problem statements, a raw brain-dump, a whole document, a wave of UAT changes)
into the relay-ready plan, by **researching** the problem, **designing** a solution,
and **planning** the implementation, all inside the one autonomous invocation. It
is first-class, hierarchical, and self-scaling, so a single invocation runs
research → design → plan → build to completion without the caller pre-digesting
anything.

It **mirrors the build relay's discipline** — depth-3, context-watching,
wrap-at-threshold, resumable shared state, one ledger — with one deliberate difference: the build relay's workers **mutate one shared
tree**, so they run one at a time; front-end branches are **read-only** (each
writes only its own artifact), so what orders them is not contention but the
conducting tier's foreground-serial seat. The build scales by the relay; the
front-end scales by **decomposition** — areas run one at a time beneath the L1,
each a bounded fresh-window pass.

## Decompose and triage first — the routing gate

The front-end's first act is **not** to research everything. It is to **split the
input to its natural units and triage each to the depth it actually needs.** This
is the [routing gate](../SKILL.md) applied in detail — the single highest-leverage
judgment in the whole run, because "a fixed sequence of workers over the whole
input" is the exact anti-pattern to avoid, and because routing a new design problem
to "build" is how a run goes shallow.

Triage each unit into one of four routes:

- **Straight to build** — a clear, bounded **defect** (behavior violates a settled
  spec) or a **settled-spec build item** (the binding design already exists) →
  becomes a build unit directly, no design pass.
- **Research only** — a "verify my assumption / is this even true?" item → a
  read-only investigation; may need nothing built.
- **Design then plan** — a bounded change carrying a real design question (how
  should this look or behave?) → a **design pass**
  ([design-passes.md](design-passes.md)), then a plan.
- **The full arc** — a genuine product- or direction-level question → research →
  design (often several disciplines) → plan.

The classifier's tie-break is **protective**: when a unit plausibly changes what a
surface IS, how it behaves, or introduces a surface that did not exist, route it to
a design pass, not to build. Triage is what makes total work **proportional to the
input** rather than to a fixed template — but a mis-route toward "build" bakes in a
choice someone will regret, so lean toward design when unsure. Record each unit's
route (and, for a design pass, its **stakes tag** — see
[design-passes.md](design-passes.md)) in the decomposition map.

Triage also writes the run's **acceptance-medium declaration** and **journey
inventory** into the decomposition map before any branch is dispatched
([evidence.md](evidence.md)): the medium(s) in which the CEO will experience the
finished work — with the declared viewports and themes where the medium has them, and
the real host/entry path a user actually reaches — plus the composed journeys users
will walk through the changed product. **Plan synthesis refuses to emit a plan while
either is missing** — the same consumer posture as the binding gate. These two blocks
are what every design brief, every DoD, and the walkthrough gate key on; a run that
skips them has no evidence class, and its gates will converge on proxies (Premise 3).

## The arc: research → design → plan

Each unit flows through as much of this arc as its triage assigned. The three
stages are distinct on purpose, and each stage boundary is a **verify-before-
integrate gate** (orchestration): research is checked before design consumes it,
design before planning, the whole plan before the build relay starts.

- **Research** — understand the problem and define the gap, grounded in the
  **primary sources** (the real code, the real artifact, the measured behaviour —
  not a description of them), read-only. It produces evidence and a sharp problem
  statement, nothing more.
- **Design — decide before building.** A fresh **decider** (never the eventual
  builder — the builder is the worst judge of what to build, because it reasons from
  the constraints of the work it is about to do) settles how to bridge the gap and
  produces an authoritative design the build treats as **binding**. This is a
  **design pass** — run it to the depth **[design-passes.md](design-passes.md)**
  prescribes (reroute-don't-answer, the role-prompt skeleton, and — at or above the
  stakes threshold — the two gated lenses that must clear before a design turns
  `binding`). Fan out **as many design disciplines as the problem warrants**; the
  disciplines are the problem's, not the skill's.
- **Plan** — sequence the settled `binding` design into **small, independently-
  committable units** at uniform granularity, each with its files, acceptance
  criteria, and definition of done — the shape the relay consumes.

"Decisions before building" holds **by construction**: design is a stage that
completes, is verified, and is `binding` before any build unit runs. And it means
decisions **resolved, not asked.** A fork with real downside either way is settled
by a blind **in-flight-decision** specialist and the run acts on it
([mid-run-forks.md](mid-run-forks.md)'s derivability test), *not* parked as a menu
for the CEO. Even the narrow residue that turns on the CEO's own
un-recorded vision proceeds on the recommendation, flagged in the **decision
ledger** for their end-of-run read; mid-run they are interrupted only by a scope-fence
change or an outward-facing act ([mid-run-forks.md](mid-run-forks.md)). Producing
a **"decision inventory"** of the design forks — the batch that
turns an autonomous run into a Q&A bottleneck — is the exact anti-pattern this phase
exists to prevent.

## The fan-out: foreground-serial beneath the L1, scaled to the input

The platform fact that shapes the front-end: **a subagent that backgrounds a
child ends its turn** — the child's completion surfaces to the durable top, not
back to the subagent — so nothing below the coordinator can background-and-gather,
and the coordinator's one backgrounded child is the **L1 itself**. The front-end
therefore runs **foreground-serial beneath the L1**:

- **Under full delegation the front-end runs beneath the L1, foreground-serial.**
  The platform fact stands — a subagent that backgrounds a child ends its turn, and
  only the durable top can background-and-gather — so the L1 does not background
  anything: it decomposes the input into areas and runs them **one at a time**, each
  area a foreground sub-coordinator that foregrounds its own specialists, recursion
  bounded by the depth-3 floor. The coordinator's one backgrounded child is the
  **L1 itself**, gathered at each wrap. This trades the old coordinator-parallel
  breadth for altitude purity — a throughput cost, not a depth cost: each pass still
  fires all its lenses at full judgment on a bounded window.
- **Scale by decomposing, not by widening** — unchanged: a single bounded problem is
  one pass; a large document decomposes into areas first, each sub-coordinator
  holding only its slice, returning one distilled relay-ready partial plan.
- **The synchronous-gather rule now lives at the seams**: an orchestrator gathers
  each foreground child before dispatching the next; the coordinator gathers the L1
  at each wrap and hands to a fresh session at a clean gather boundary if its own
  wall approaches first.

Branches write their own corpus artifacts and **return** their ledger line /
invariants / field-notes for the gatherer to serialize — [SKILL.md](../SKILL.md),
'Who writes the shared files'.

Remember the **design-specialist wrap threshold** ([design-passes.md](design-passes.md)):
a design branch wraps far earlier (~25–30%) than a build worker, so size each design
pass to fit one early-wrap window and decompose rather than let a design call slide
into degraded context.

## Plan synthesis: merge, de-conflict, normalize

A pile of branch outputs is not a plan. A **plan-synthesis layer** turns them into
one. (Distinct from the *multi-discipline reconciliation* inside a single design
pass — [design-passes.md](design-passes.md) — which merges design disciplines within
one question; this merges *partial plans across areas*. Same verb, different
altitude — keep them separate.)

- **Merge and normalize** the partial plans into a single coherent plan of
  **uniform** independently-committable units — branches sized their work
  differently, and normalizing that is the synthesizer's job — carrying the
  **scope fence** and the honest **expansion points**
  ([mid-run-forks.md](mid-run-forks.md)), the scheduled **hygiene checkpoints**, and
  a seeded **handoff + field notes** (including the **standing invariants** —
  [design-passes.md](design-passes.md)).
- **De-conflict across branches.** Parallel branches ran **blind to each other**, so
  they collide: two designs re-cutting one surface, a dependency cycle, a capability
  planned twice, an incoherence no single branch could see. Reconciling these — the
  **cross-cutting pass** — is not optional cleanup; it is the reason a parallel
  fan-out is safe to run at all. (Distinct from the invariant-audit's *outbound*
  sweep, which checks the whole existing product against a newly-articulated
  invariant; the cross-cutting pass reconciles only the current fan-out's branches.)
- **Check the journey owners and carry every assignment.** Against the journey
  inventory ([evidence.md](evidence.md)): every surface on every declared journey —
  inherited surfaces the delta newly routes users onto included — maps to a unit, or
  carries an explicit recorded no-change-needed disposition. And every de-confliction
  assignment ("branch X supplies the default name") lands in a named unit's DoD — an
  assignment no unit carries is a synthesis failure the consumer bounces, because a
  seam everyone agreed on and nobody owns ships as a punt. Likewise each proven math
  claim's obligations (its hypotheses to enforce, its oracle and property tests to
  port — [proof-grade-math.md](../../orchestration/references/proof-grade-math.md))
  land in the DoD of the unit that implements it. Where the CEO has scheduled the
  proofs by consequence, each owed claim's proof (and its independent check) is a
  unit of its own: an existential or harm proof is ordered ahead of every unit
  that relies on the claim, existential ones first; a refinement proof is placed
  at the event that makes it due; and each unit names the heavy claims it relies
  on, with their kinds.
- **Tier the synthesis itself when the input is large**, so no single agent — the
  coordinator and the top synthesizer least of all — ever holds every raw branch:
  each area's sub-coordinator synthesizes its own slice into a partial plan, and a
  top synthesizer merges the partial plans. Synthesis is a hierarchy that sees
  summaries, not one desk that sees everything.

## Running to completion: the front-end's resumable state

The front-end runs on the **same backbone** that makes the build relay resumable, so
it too survives any single agent hitting its wall:

- **A decomposition/triage map** — the front-end's checklist: which units are split
  out, their routed depth, their stakes tag, the run's **acceptance-medium
  declaration** and **journey inventory** ([evidence.md](evidence.md)), and which
  have been researched / designed / planned. It is to the front-end what the plan
  is to the build.
- **The growing research/design corpus** — the durable artifacts each branch writes,
  one per unit or area, each carrying its `draft`/`binding` state and (for a design
  pass) its lens deliverables (the skeptic's verdict, the audit's violations). These
  **are** the hand-off between front-end generations: a fresh agent reads the corpus
  to see what is already decided. The corpus is **run-long and appendable** — it is
  not "closed" when the build begins, because a mid-run `design-gap` opens a new
  design pass whose artifacts append here too ([mid-run-forks.md](mid-run-forks.md)),
  where the binding-gate verifier can find them.
- **The shared ledger, field notes, and decision ledger** — the same ones the build
  relay uses; the front-end seeds them (standing invariants included) and appends
  from its first generation ([mid-run-forks.md](mid-run-forks.md) defines the
  decision ledger).

Every front-end agent **watches its own context and wraps past its threshold** at a
clean boundary (a gathered branch, a completed synthesis, a `binding` design),
updates the map and corpus, returns its proposed ledger line in its up-report (the
gatherer serializes — [SKILL.md](../SKILL.md), "Who writes the shared files"), and
reports up — and a fresh front-end agent resumes from committed state. (The
conducting tier itself, wrapping as a relay agent, still appends directly.) Hold
the corpus to [doc-hygiene](../../doc-hygiene/SKILL.md) as it grows — each design at one altitude,
the synthesis a hub over spokes — so the plan it feeds is read from a clean library.

## The seam to the build, the model, and forks

- **The seam.** The front-end's terminal artifact **is** the relay-ready plan the
  build relay consumes. The **conducting L1 verifies the whole plan before the
  build begins** — binding states, every experienced-surface DoD's evidence clause,
  the journey owner check — then **wraps at this seam** (its chartered boundary),
  so the launching coordinator's foundation check runs before any builder
  ([SKILL.md](../SKILL.md), coordinator's loop steps 1–2). The design corpus stays
  **binding** on builders (a builder
  executes the design and escalates a delta rather than silently diverging), and the
  build relay may consume **only a `binding` design** — a `draft` at the seam is a
  gate failure, not a green light. Under a proof schedule by consequence the seam
  does not wait for every proof: the owed proofs cross it as plan units, no unit
  runs before the existential and harm claims it relies on are PROOF-GRADE, and the
  build stays on an internal line no real user relies on. Releasing it to real
  users is an outward-facing act that waits until every existential and harm claim
  the release relies on is PROOF-GRADE
  ([proof-grade-math.md](../../orchestration/references/proof-grade-math.md)).
- **The model.** Every front-end agent — each branch, sub-coordinator, and
  synthesizer — is a **fresh subagent at the planner's-caliber model, explicitly
  selected** (the "same model at every tier" invariant); the plan is only ever
  written by the planner's own caliber of mind, freshly instantiated.
- **Forks.** A design fork with real downside either way is settled **neither by a
  branch guessing nor by batching it to the CEO** — it is a mid-run **in-flight
  decision** ([mid-run-forks.md](mid-run-forks.md)): a dedicated reasoning agent,
  blind to any leaning and grounded in the real evidence and the domain philosophy,
  returns a recommendation the run acts on and the decision ledger records. The
  front-end's own dynamic branching —
  spinning off more research as a problem reveals its size — is **simpler** than a
  build-time expansion pass: it is read-only, so it carries none of the
  never-over-a-live-worker concurrency constraint; branch as the input demands,
  within the scope fence.
