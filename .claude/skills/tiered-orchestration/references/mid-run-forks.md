# Mid-run forks: decisions, design-gaps, and expansion passes

This spoke governs what a long autonomous run does when it hits a fork the plan
never fully settled. Such forks come in **three kinds**, and this file is the home
for all three — they share one escalation shape and one hard invariant:

- A **bounded decision** — a high-stakes *pick* with real downside either way; a
  dedicated reasoning agent returns a **recommendation** the run acts on. (Wrap-
  reason `blocked`.)
- A **design-gap** — a *new design problem* a build unit surfaced: not a pick, but a
  "how should this look/behave, what should this become" that needs **designing**. It
  re-enters a design pass, then a plan expansion. (Wrap-reason `design-gap`.)
- An **expansion pass** — a plan region that must now be elaborated; a fresh
  expansion planner **appends the concrete units**. (Wrap-reason `expansion-point`.)

**Same shape, one invariant.** In every case a **spawn-capable tier stands up a
fresh dedicated agent at the planner's model**; a **layer-3 worker cannot spawn, so
it wraps at a committed boundary and reports up** for a spawn-capable tier to stand
the agent up. All three obey **the hard proviso below.** Keep them **sharply
distinct**, though: a decision returns a recommendation; a design-gap runs a design
pass; an expansion rewrites the plan.

## The hard proviso (shared invariant, non-negotiable)

Act on a delegated fork only once (a) the **pre-decision state is committed** to
version control, so it stays recoverable, and (b) the **decision and its rationale
are recorded** with provenance — in the plan, the **field notes** (the durable
record; not the handoff, which the next wrap overwrites), the commit message, and
the daily log. A mid-run fork **never permanently deletes** anything: because the
prior state is committed first, a path that proves wrong is always revertible. This
proviso is what licenses the run to act autonomously instead of stalling — every
choice it makes is undoable.

## Bounded decisions: resolving a fork without stalling

A long autonomous run surfaces forks the plan never settled — an added planning
need, a high-priority question, a call with real downside either way. The CEO
is away; the run must neither **stall** on them nor **guess**. It does neither: the
question goes to a **dedicated reasoning agent** — the strongest model, explicitly
selected, at the required effort (a request in the brief), a **leaf that reasons
and returns a recommendation and never touches the work** — and the run then TAKES
that path.

Brief it from the **role-prompt skeleton** ([role-prompt.md](role-prompt.md)) with
the blind stance: blind to any leaning on a genuinely-open question, grounded in the
real evidence and the domain philosophy, returning a recommendation with the
strongest counter-argument to itself and its confidence.
When the fork's subject is an **experienced surface**, the recommendation names
its composition consequence — which frames change, at which declared viewports —
or the reasoner reclassifies the fork as a `design-gap`; a layout pick settled on
argument alone is the condemned channel in miniature.
The run **acts on the recommended path immediately**
instead of parking it for sign-off — a **scoped relaxation** of the usual
"coordinator makes the final call" rule, licensed ONLY by the proviso above (the
change is committed, hence reversible).

**Specialist-resolution is the DEFAULT — direction-level forks included.** The
reasoning agent resolves the fork whether it is a tuning constant or a product-shape
call, as long as its answer can be reasoned to from the **primary sources** — the
real code, the measured behaviour, and the established philosophy. "Decisions before
building" means decisions **resolved by specialists** before building, **not asked of
the CEO** before building.

**The derivability test — who could resolve it.** The test is one question: *could
a fresh strongest-model specialist, given the real evidence and the philosophy,
reason to a defensible answer?* **Yes → the specialist resolves it and the run
acts; do not ask.** No → it is the **residue**: a call that turns on the CEO's own
un-recorded **vision, appetite, or promise** — a "what should the product *become*,
is this worth investing in at all" call (distinct from a scope-fence *change*,
which only the CEO makes — see **The two channels**). What the test is **not**: "it
changes what the product is," "it's high-stakes," "it's direction-level" are not
triggers — in any real product change nearly everything touches what the product is, and
escalating on that recreates the bottleneck. The trigger is non-derivability, not
stakes or surface area. **When in doubt, resolve by specialist** — the proviso makes
every path reversible, so a needless escalation spends the run's autonomy while a
specialist call costs almost nothing. (This whole discipline is
[question-review](../../question-review/SKILL.md) applied autonomously; read it for
how to ground and brief the specialist.)

**Even the residue never stalls the run — and it no longer interrupts it either.**
A residue fork still gets a blind specialist recommendation the run **proceeds on**
(reversible, recorded); the call is **flagged in the decision ledger as a direction
call** — one the CEO can ratify, redirect, or **delegate straight back to a
specialist** at their own cadence, on their end-of-run read — never a blocking batch
and never a mid-run question. Record it in the field notes and the daily log as
usual; the relay keeps moving on every other branch meanwhile. Mid-run, the CEO is
interrupted by the two channels below — residue is not one of them.

**Derivability grows as the record grows — and the streak is the gauge.** Every
ruling the CEO makes, once recorded with provenance, joins the philosophy as a
source the next specialist reasons from: a preference they have already bought once —
depth over cost, one shape over another — is derivable the second time it surfaces
wearing new clothes, and re-asking it re-litigates a settled call. The run that
taught this rule watched them rule substantively in its early rounds, then **select
the recommendation in every later one**; that unanimity was the measurement that
the questions had become derivable from their own accumulated answers. **A streak of
recommendation-ratifications is proof the escalations should have already
stopped** — read it as drift toward the Q&A bottleneck, never as evidence the
asking is working.

**Who stands one up** — any spawn-capable tier: the coordinator, layer 1, or layer 2.
A **layer-3 worker cannot spawn**, so it splits the two cases:

- A **small, local, reversible** judgment call it makes itself — recording the choice
  and why in the handoff and field notes — and moves on.
- A **planning-level or high-priority fork** it ESCALATES to its orchestrator
  ([orchestration](../../orchestration/SKILL.md)'s "hang on" protocol), which stands
  up the decision agent, records the ruling, and proceeds. A worker never guesses at a
  fork above its altitude.

## The decision ledger: every call recorded, none queued

The run keeps a **decision ledger** — a durable, append-only run artifact, seeded
by the front-end beside the field notes (distinct from the **run ledger**, which
records relay topology). **One entry per resolved fork**, written in **plain
product language** — the bar is *"could the CEO read it without a glossary?"*;
unit ids, file paths, and the full reasoning stay in the artifacts the entry
links. Each entry carries five things:

- **the question**, as a product question (*"does the onboarding flow ship in
  this release?"* — never a bare unit id and a table cell);
- **the recommendation**, and the specialist role that made it;
- **what the run did**;
- **reversibility** — how this call is undone, per the hard proviso;
- **where the reasoning lives** — the decision artifact, the commit.

The tier that gathers the specialist's return serializes the entry — the same
write-authority rule as the field notes ([SKILL.md](../SKILL.md), "Who writes the
shared files") — and marks residue entries as **flagged direction calls**. The
ledger is **the CEO's optional read at the end of the run, never a queue put to
them during it**: the closing report names it beside the staged walkthrough
evidence, flagged entries first, so their review of what the run decided on their
behalf runs at their own cadence, exactly like their review of what it built. It
serves the run twice more: settled calls propagate as injected constraints
instead of being re-litigated ([design-passes.md](design-passes.md), the
amplifiers), and reconciliation audits it — every resolved fork has an entry, the
language passes the no-glossary bar, and nothing interrupted the CEO outside the
two channels.

## The two channels: the only calls that interrupt the CEO

Everything above proceeds on a recommendation because the hard proviso makes it
undoable. Exactly **two classes of call cannot be taken reversibly by the run**,
so they are the only two that interrupt the CEO mid-run — carried up through a
wrap at a committed boundary, and put to them in product language:

- **A scope-fence change** — GOAL, IN, or OUT. The fence is immutable to the run,
  so a fork whose every honest answer rewrites it leaves the run nothing it may
  act on (the same channel a failed scope-trace escalates through — see **Scope
  fence + scope-trace**).
- **An outward-facing act on the product** — a push to a shared remote, a deploy,
  a migration against a shared environment: anything whose effects leave the
  run's local custody, where version control no longer guarantees a quiet
  revert.

While a channel escalation waits, **the affected region holds and the run does
not** — the relay keeps moving on every branch the answer cannot invalidate. And
the channels are a floor, not a muzzle: a revisit trigger the CEO personally
installed ("bring this back to me if …") fires to them exactly as they ordered — their
standing instruction, not the run's escalation.

**The test binds the top seat hardest.** Every question reaches the CEO through
the coordinator, so that seat is the last gate a call passes — and the failure it
must not repeat is dripping "one more reasonable question" while every tier below
holds the line. The run that taught this rule applied the derivability test to
its internal forks and never to its own escalations: the top seat rebuilt the
decision inventory one justified-looking round at a time, in implementation
language, its own context swelling on the framings it held. A fork that surfaces
at the top is handed **down** — specialist-resolved and ledgered under the L1;
the coordinator frames no option menus, and what it does carry up (the two
channels, status, the end report) speaks the product's language.

## The design-gap tripwire: routing a new design problem back into design

The routing gate ([SKILL.md](../SKILL.md)) is meant to catch every new design problem
at intake and send it through a design pass. But some units only **reveal** their
design nature once a builder is inside them — the "settled build item" turns out to
carry a real "how should this look/behave?" question. This is the seam where a run
goes shallow: the tempting move is for the worker or the coordinator to answer the
design question in-seat, fast, from its own idea. **The tripwire forbids that.**

- **The worker does not adjudicate.** Its cheap job is only: *a fork above my
  altitude → wrap at a committed boundary, report up.* It need not classify
  decision-vs-design mid-unit; it wraps with a best-guess tag and defaults to
  `design-gap` when it cannot tell (the protective default, since resolving a design
  problem as a quick decision is the failure mode). Never guess at the answer.
- **The spawn-capable tier classifies** — using the same **bucket rule** the director
  model runs on ([design-passes.md](design-passes.md)): a self-contained pick with a
  bounded answer → `blocked` → a decision specialist; anything that ripples or whose
  very *shape* is unknown ("I don't even know the right form of this") → `design-gap`
  → a design pass.
- For a `design-gap` it then **re-enters a design pass**
  ([design-passes.md](design-passes.md)) — reroute-don't-answer, the role-prompt
  skeleton, and, at/above the stakes threshold, the adversarial skeptic and the
  invariant-audit before the design turns `binding` — exactly the front-end's design
  stage, run mid-build, its artifacts appended to the run-long design corpus. **Then
  an expansion pass** (below) re-plans that region against the new `binding` design.

Concurrency: a design pass is **read-only** (it mutates nothing but its own
corpus artifacts), so it needs no quiesce — the worker wraps at its committed
boundary and the conducting tier runs the pass **next, in the foreground**,
before resuming the build relay; only the **expansion pass** that follows mutates
the plan, and it runs at the same serialized point. (Below the durable top,
everything is foreground-serial, so the pass takes its turn in the relay rather
than running beside it — the serial cost of altitude purity, paid mid-run. The
deep design pipeline stays **reachable from inside the build**; a `design-gap` is
never resolved in the build seat.)

## Expansion passes: rolling-wave planning

### What it is

A big up-front plan cannot foresee everything — implementation reveals detail the
planner could not have known. **Rolling-wave planning** (equally, **progressive
elaboration**) is the answer: plan the near horizon in detail, leave later horizons
deliberately un-elaborated, and elaborate each as it approaches. The disciplined
operation that elaborates one such region is an **expansion pass.** It makes
plan-evolution a **first-class operation** instead of leaving the plan over-specified
up front (brittle, wrong once reality diverges) or elaborated inline by improvising
workers (scope creep and plan rot).

### The mechanism

At an expansion point a **fresh expansion planner** consumes whatever the earlier
units produced (e.g. a design spec, or a `design-gap`'s new `binding` design),
elaborates that region into concrete, ordered, **independently-committable units**,
**appends** them under the placeholder header, checks off the expansion-pass unit, and
updates the rolling handoff — so the relay resumes straight into the appended units.
It preserves the plan's **scope** and **doc-hygiene** as it goes (the two rules below).

### The triggers

An expansion pass fires from exactly four sources:

1. **Scheduled** ahead of time in the initial plan — placeholder points deliberately
   left un-elaborated because the detail must emerge from earlier work first (the
   normal case).
2. **By another expansion pass** — a pass may itself schedule a further expansion
   point (nested waves) when its region reveals deeper detail.
3. **By the CEO** mid-run — they ask to expand or redirect a region.
4. **By a mid-run bounded-decision specialist, a design-gap, or the evidence
   discipline** — a decision that concludes "expand here"; a `design-gap` whose
   new `binding` design must now be planned; an **`env-blocked` recovery unit**;
   or **walkthrough flaws routed to build** ([evidence.md](evidence.md)). This is
   the connection point between the other machinery and expansions.

### The fresh-planner-model invariant

Every agent that writes *or elaborates* the plan — the front-end's planning layer
([front-end.md](front-end.md)) **and** every expansion pass — is **always a fresh
subagent at the same model as the initial planner** (the strongest the environment
offers, explicitly selected, never a default or a reused context). The plan is only
ever elaborated by the planner's own caliber of mind, **freshly instantiated** — never
a worker elaborating inline. (This is also what satisfies
[instruction-changes](../../instruction-changes/SKILL.md)'s "fresh, dedicated,
maximally capable" rule when an expansion elaborates instruction-file change units.)

### Who runs it — the depth-3 resolution

A **layer-3 worker cannot spawn**, so reaching an expansion point is a
**wrap-and-report-up boundary**, mirroring the other escalations exactly:

1. The worker **wraps at the last committed boundary**, records the pending expansion
   in the handoff (wrap-reason `expansion-point`) and its ledger line, and **reports
   up**. (The hard proviso applies — the pass acts only on committed, recorded state.)
2. A **spawn-capable tier** stands up the **fresh expansion planner** (planner's
   model), which appends the elaborated units and checks off the expansion unit.
3. **Execution resumes** with a **fresh worker relay** on the expanded plan and the
   updated handoff.

### Concurrency: never over a live worker

An expansion pass **mutates the shared plan** (it appends units, and may split the
plan file), so it must **never run concurrent with execution workers**, who also
mutate the shared tree (mutating work runs in series).

- A **scheduled** expansion point **serializes by construction** — the relay reaches
  it, the worker wraps, the pass runs, the relay resumes.
- A **CEO-, decision-, or design-gap-triggered** expansion arrives
  asynchronously, perhaps while a worker is mid-unit. **Quiesce the relay first:** let
  the in-flight worker reach a committed boundary and wrap; only *then* run the pass;
  then resume.

### Scope fence + scope-trace

This is the machinery that keeps an unattended relay from elaborating its way out of
scope. Three parts:

- **The scope fence** — an **immutable** block at the top of the plan: the run's GOAL
  plus an explicit OUT-OF-SCOPE list, written once by the front-end's planning layer.
  An expansion pass may elaborate **within** the fence but may **NEVER edit it.** Only
  the CEO changes scope.

  ```
  ## Scope fence (immutable — only the CEO changes scope)
  - GOAL: <one-sentence run goal>
  - IN: <the approved facets>
  - OUT OF SCOPE: <explicit exclusions>
  > Expansion passes elaborate WITHIN this fence; they may NEVER edit it.
  ```

- **The scope-trace** — with its appended units, every expansion pass returns a trace
  mapping **each appended unit → the existing item of plan intent it elaborates** (a
  design-spec section, a scheduled placeholder, an existing plan goal). A unit that
  traces to **nothing** is out of scope: the pass does **not** append it — it
  **escalates it to the CEO** as a possible scope change.
  An expansion pass also **updates the journey inventory** ([evidence.md](evidence.md))
  when its appended units add an experienced surface or reroute users onto one — the
  walkthrough gate walks that inventory at the end, and a journey it was never told
  about is a journey nobody walks.
- **Verify before resume** — the spawning tier **verifies the scope-trace before
  resuming the relay;** a failed trace **bounces the pass** (verify before you
  integrate). This gate is the fence's teeth.

### Plan-hygiene rule

An expansion pass is held to the plan's own doc-hygiene:

- Appended units keep the **small, independently-committable** shape (one unit = one
  commit).
- The pass stays **within the fenced scope** — it elaborates, it does not sprawl
  (enforced by the fence + trace above).
- If the plan file itself **bloats past the doc-hygiene threshold** (~500 lines, or
  the bloat signals), the pass **splits it in the same pass** — a hub plan (goal,
  scope fence, phase list, acceptance, handoff pointer) plus per-phase spoke
  checklists — per [doc-hygiene](../../doc-hygiene/SKILL.md), "reorganizing safely."
  This is the reactive-during-expansion counterpart to the scheduled **hygiene
  checkpoints** ([SKILL.md](../SKILL.md)) that guard the org files and run artifacts.

## Delineation — keep the three fork types sharply distinct

They share this spoke, one escalation shape, and the hard proviso, and little else:

- A **bounded decision RETURNS A RECOMMENDATION** — a reasoning leaf hands back a path
  the run then takes; it **touches neither the plan nor the design corpus**.
- A **design-gap RUNS A DESIGN PASS** — it produces a new `binding` design; it decides
  *how something should be*, then hands off to an expansion pass to plan it.
- An **expansion REWRITES THE PLAN** — it appends units; it decides **nothing** about
  direction beyond elaborating already-fenced scope against an existing `binding`
  design.

They connect at defined hand-off points — a decision may *conclude* "expand here"; a
design-gap *produces the design* an expansion then plans — but the agents stay
separate: the decision agent never runs the design pass, the design pass never writes
the plan, the expansion planner never makes the decision. **Different outputs,
different agents — do not blur them.**
