# The design pass: how depth is manufactured (and gated)

The build relay executes a plan; the front-end decides what to build. A **design
pass** is the unit of deciding — the phase where a new design or preference
question is turned into an authoritative design the build treats as **binding**.
This spoke is *how* a design pass reaches wave-grade depth, and *how* that depth
is made un-skippable. It is the answer to Premise 2 ([SKILL.md](../SKILL.md)): the
deep moves live here, and they live here as **required steps**, not as moves a
lead may choose to make.

Depth is not a single clever agent. It is a **relay of role-injected experts under
an independent-verification bar** — one that *constructs*, one that *breaks*, and a
coordinator that *checks* — with the CEO's decision authority propagated as
constraints. Everything below is that machine.

## The director model: reroute, don't answer

The lead of an autonomous run — you, or any spawn-capable tier standing up a
design pass — replicates the one move that made deep work deep: **when a design or
preference question surfaces, refuse to answer it from your own idea. Route it to
a fresh agent prompted into the right expert role.** A purpose-built expert, given
the role and the real material, out-designs a generalist reasoning from the
constraints of the work it happens to be doing — reliably, and often by
overturning the lead's own leaning with an option the lead could not see from
inside its framing. Answering the question yourself forfeits exactly that.

This is not a reflex to "always spawn an agent." It is a **method with a
discernment and a boundary.**

### The discernment — which questions earn the expensive move

Route by how far the answer *ripples*, not by how hard it feels:

- **Self-contained** — a label, a number, a one-line tweak with no downstream
  consequence → **apply it directly** — with one carve-out: on an **experienced
  surface**, a change to text length, density, or element count is **never
  self-contained by inspection**, because text length is layout (geometric ripple —
  see the stakes threshold; the two uses of *ripples* are one concept). Such a
  change routes to a (small) design pass whose composed artifact shows the frame
  absorbing it; only a change that provably cannot reflow the frame (a value swap
  of identical length and kind) stays in this bucket. A subagent would be more
  ceremony than the change.
- **Ripples** — it changes a computation, touches another surface, or shifts
  behavior → **a fresh specialist.** This is the case the reroute exists for.
- **A clear explanation settles it** — the asker just needs reasoning that is
  already known and recorded → **answer it in place.** Don't reroute what a
  recorded sentence resolves.
- **A design looks over-built** — you can see a specialist has over-engineered →
  the fix is to **simplify, then reroute only the *execution*.** But in an
  autonomous run the lead does **not** perform the simplification in-seat: doing
  design (or re-design) judgment in the coordinator's own context is exactly what
  reroute-don't-answer forbids and what burns the altitude the tiering protects.
  Delegate it — a fresh simplification-checker (a scoped in-flight decision,
  [mid-run-forks.md](mid-run-forks.md)) settles the simpler shape, then an expert
  builds it. (The un-delegated "talk it through and simplify" move is the *human
  CEO's*, who legitimately owns direction — not an autonomous lead's.)

Get this wrong toward "reroute everything" and the run is slow and ceremonial;
wrong toward "answer everything" and it goes shallow. The judgment of which bucket
a question is in is the transferable skill — but note every bucket except the
self-contained tweak routes the *work* to a fresh agent; the lead decides *which
bucket*, never the design.

### The boundary — identity stays, construction reroutes

Hardened into a durable rule under real load: **the CEO owns what the
product IS; expert agents design how it behaves.**

- **CEO owns:** product direction, scope, identity, the *structure* of
  anything consequence-critical, and sign-off on the core. Worked shape: *"how
  should we word this rationale"* → specialist; *"should this feature be
  retired"* → the CEO's call.
- **Specialists own:** wording, voice, tone, interaction, visual, flow — design
  **construction**.

Because the CEO is away, the lead does **not** decide the identity forks
either. It reserves them, resolves everything derivable by specialist, and flags
the non-derivable residue in the decision ledger — proceeding on a recommendation
there too (the derivability test, [mid-run-forks.md](mid-run-forks.md)). The boundary tells
you *which* questions are the CEO's in principle; the derivability test tells
you *which of those* actually have to wait for the CEO versus can be
specialist-resolved now.

### Two amplifiers the lead must carry

- **Decisions become injected constraints.** A fork the CEO (or a
  specialist) has settled is not merely recorded — it is **pasted into every
  downstream brief** as *"a settled decision the design MUST honor — NOT an open
  question."* Rerouting scales only because settled calls propagate as
  load-bearing constraints the rerouted experts respect, rather than being
  silently re-litigated.
- **The reroute reaches even the CEO's own words.** When a design must be
  built on the CEO's own steer or stated principle, route the *faithful
  interpretation* of it to a specialist too — grounded in the primary source (their
  actual words), not the lead's paraphrase. A specialist checking the reading
  against the source catches over-reach the paraphrase introduced. Trusting your
  own restatement of the CEO's intent is itself an anchoring bias to design
  out.

## Deep understanding is manufactured, not hoped for

The single most re-usable — and most droppable — artifact is the **deep-
understanding clause.** The deepest design moves came from agents that genuinely
grasped what the product *is*, what it *isn't*, and how a real person uses it. That
understanding was not luck; it was **seeded in the first sentence of every brief**
and never left to discovery:

- **Identity in the first sentence** — state what the product IS and, pointedly,
  what it is NOT (e.g. *"a reference library, not a chat app"*), before anything
  else. The negative half does as much design work as the positive: knowing what
  the product refuses to be rules out whole classes of wrong design.
- **Point at the domain philosophy** — where the domain has a philosophy artifact
  (a product-philosophy skill, a founding doc), make loading it a required first
  read, and inline its load-bearing claims into the brief so the agent cannot miss
  them.
- **Inject the standing invariants** (below) — the properties the design must
  honor, stated as constraints.

Its likely failure mode under speed is subtle: not omitting the clause outright,
but pointing an agent at a *doc to skim* instead of an *identity to reason from* —
which lets it treat the domain's meaning as decoration rather than as the ground of
every call. Seed the identity; don't hope for it.

## The composed artifact — a design you cannot see is a design nobody reviewed

For any design pass touching an **experienced surface** (one the acceptance-medium
declaration covers — a screen, a terminal interaction, a page a person reads:
[evidence.md](evidence.md)), the deliverable includes, alongside the argument, a
**composed artifact**: a full-frame representation of each affected screen/state *as
the user will experience it*, in the declared medium's representational form (for a
visual surface, a self-contained HTML mockup or equivalent composed rendering; for a
CLI, the full transcript as the terminal will show it; for a document, the composed
page itself), at **every declared viewport and theme.**

Three rules give it teeth:

- **Full frame, never a delta.** The composition includes everything the change
  inherits — the masthead, the chrome, the surrounding flow — because composed-frame
  defects (a repeated header, a contradiction between title and stepper, a collapse at
  phone width) live precisely in the frame a delta description never draws. A
  delta-shaped input still gets full-frame compositions. And the **states composed
  include the states the journey inventory lands users in** — a first user's state
  included — not only the designer's happy path.
- **It is standing, not stakes-gated.** Below-threshold passes skip the two lenses,
  never the composed artifact: on a composed frame even a reword ripples
  geometrically (text length is layout), so the cheap tweaks are exactly the ones that
  must be drawn. The artifact is produced by the designer already in-seat; its cost is
  minutes, and a defect it catches is one that ships otherwise.
- **It enters the binding gate's key — and it is consumed RENDERED.** For a pass on
  an experienced surface, the design may turn `binding` only when the composed
  artifact exists in the corpus, covers the declared viewports and themes, and was
  **viewed rendered**: at stakes, the skeptic reviews it rendered at the declared
  viewports (its frame verdict is part of its lens artifact); at every stakes level,
  the binding-gate consumer **spot-renders** the artifact at those viewports before
  marking `binding` — checking coverage against the rendered frame, never against
  the file's own claims. A mockup verified only by grepping its source is a
  code-space proxy for the composition — the exact class of proxy this discipline
  exists to retire. A corpus with zero composed frames is **un-bindable** — the
  consumer bounces it exactly as it bounces a missing skeptic verdict.

This is the contract that keeps the argument machinery pointed at what a user will
see: the skeptic red-teams the frame, the binding gate refuses designs nobody could
look at, and the builder inherits a drawn target instead of a described one.

## The role-prompt skeleton

Every design lens, decision reasoner, adversarial skeptic, and invariant-auditor is
briefed from the **same nine-part skeleton** — role injection → domain identity in
the first sentence → effort clause → action fence → **stance clause** (blind for an
open question, skeptical for a made-call review, audit-sweep for a breadth check) →
primary-source grounding (with supersession markers and delegation disclosure) →
deep-understanding clause → deliverable spec (recommendation · strongest
counter-argument to itself · alternatives rejected · risks · confidence ·
analyzable-vs-taste) → final-call reservation. It is the reusable anatomy of a deep
brief and is single-sourced in **[role-prompt.md](role-prompt.md)**; every specialist
this spoke describes is built from it.

## Multi-discipline reconciliation (independent-then-reviewed-together)

When a design question spans disciplines or carries real ambiguity, run **several
specialists independently — each blind** to the others' work and (for open
questions) to the lead's leaning — and hold every one until all land.
Design branches are read-only (each writes only its own artifact), dispatched
**foreground-serial by the conducting tier** (the L1, or a sub-coordinator
beneath it), which **gathers every one** before the design is treated as formed
(the synchronous-gather rule, [front-end.md](front-end.md)). Blindness between
branches is what independence means — a later-dispatched lens is never shown an
earlier lens's artifact.

Merging the landed branches into one coherent design — **reconciling** their
overlaps and conflicts — is **judgment**, so when it is more than trivial it is its
own **fresh short-window agent**, not an inline task in the **conducting tier's**
degrading context (a conductor that reconciles in-seat both burns its altitude and
re-injects its own view — the anchoring the fan-out exists to avoid). The
**conducting tier keeps the final call on the design**: it compares the reconciled
recommendation to its own independent read and decides. (The launching
coordinator's seat stays read-only — reconciliation at the end, never design
decisions in-seat.) Reconcile in a fresh seat; decide in yours.

Width **scales to the depth the work needs**: a thin composition question takes a
single lens; a consequence-critical or core change takes several **independent**
lenses reconciled together. Do not run five lenses on a one-line reword, and do not run one
lens on the core.

**Three distinct stances — keep them from collapsing into one.** A deep design pass
uses all three, and they are not substitutes:

- **Construct** — the design lenses *propose* the design.
- **Break** — the adversarial skeptic *red-teams* the proposed design to find what
  is wrong before it is built — blind to how confident the lead is (below).
- **Check** — the coordinator *verifies* the load-bearing claims against the
  primary sources itself, never on testimony.

A run that keeps only "check" (the survivor discipline) still loses "break" — which
is exactly what vanished under speed. All three are required at stakes.

## The two gated lenses — and the binding gate

Two lenses caught what friendly synthesis and coordinator-verification missed, and
they are the two that disappear first under momentum. They are therefore **not
optional moves — they are the design pass's definition of done.**

- **The adversarial skeptic.** A fresh red-team — a **separate agent, never the
  designer reviewing its own work** — whose sole job is *to find what is WRONG
  before it is built, not to rubber-stamp.* It is briefed from the skeleton with the
  **skeptical stance** (informed of the proposed design, **blind to the lead's
  confidence in it**) and delegation disclosure, and returns a verdict —
  **BUILD-READY / BUILD-READY-WITH-CONDITIONS / NEEDS-MORE-DESIGN** — plus the
  pointed question: *is there anything here that genuinely needs the CEO's own
  decision before build (a real product fork, not an engineering detail)?* It has
  caught correctness bugs a friendly synthesis would have shipped; it is the single
  highest-value design discipline to keep firing.
  On an experienced surface its brief **includes the composed artifact(s)**, and its
  deliverable includes a named **frame verdict**: the artifact reviewed **rendered at
  the declared viewports** — what will the user actually see and walk, and where does
  it break — not only the argument (the run has the rendering tools; source-grepping
  a mockup is a code-space proxy). The frame verdict is part of the skeptic's lens
  artifact: on an experienced surface at stakes, a skeptic artifact without one is a
  missing lens artifact, and the binding gate refuses. A skeptic pointed at a spoke
  or a state machine while no one is pointed at the frame is how a run converges
  honestly on designs correct about everything except the pixels (Premise 3).
- **The invariant-audit.** A fresh, **read-only** sweep against the run's standing
  invariants — a **different shape** from the skeptic: the skeptic red-teams *this*
  design; the audit is a **breadth sweep across OTHER surfaces**, grounded in many
  surfaces' primary sources, and its deliverable is a **ranked list of found
  violations**, not a single found bug (so it uses the skeleton's audit stance, not
  the skeptic's). At product scale it may itself be a small **read-only fan-out** —
  one auditor per surface-cluster, dispatched **foreground-serial by the conducting
  tier** and reconciled. It runs in two directions:
  - **Inbound** — *does this design violate any standing invariant?*
  - **Outbound** — when this pass **articulates or strengthens** an invariant,
    *does any OTHER existing surface now violate it?* The outbound sweep is the one
    that vanished — a design pass that sharpens a rule but never checks the rest of
    the product against it leaves violations shipped elsewhere. It ranks what it
    finds; it changes nothing.

Both are read-only and additive — they mutate no product files and produce only
review artifacts (which append to the run-long design corpus,
[front-end.md](front-end.md)), so they cost the doc-hygiene checkpoints nothing (a
design step never makes hygiene worse).

**The binding gate — the mechanism that makes them un-skippable.** A gate the
producer certifies for itself is no gate: under momentum the same lineage that runs
the pass declares it done, and both lenses become a shallow gesture marked
"resolved." So the gate is **consumer-verified and keyed on a recorded artifact** —
the same trick the expansion-pass scope-trace already uses (verify before you
integrate; a failed trace bounces the pass). Concretely:

- **Each lens emits a named, recorded deliverable** into the design corpus — the
  skeptic's verdict + findings, the audit's ranked violations — referenced from the
  unit's row in the decomposition map. No artifact, no credit.
- A design artifact is produced in a **`draft`** state and becomes **`binding`** —
  the state the plan and build relay may consume — **only after**, for a pass at or
  above the stakes threshold, both lens artifacts exist **and** every finding is
  **resolved.** *Resolved* has a protocol, or it is the same proxy: a finding is
  either **(i) fixed** (the design changes — and if the fix ripples, it re-enters
  the pass at depth) or **(ii) accepted with a recorded rationale by a spawn-capable
  tier or an in-flight-decision specialist** — **never waved off by the designer.**
  The pass **converges** when the skeptic returns no blocking finding and every
  finding is fixed-or-recorded-accepted; without that terminator, fix→re-design→
  re-skeptic loops forever and "resolved" means nothing.
  *Findings* include the designer's own recorded FLAGS ([role-prompt.md](role-prompt.md),
  deliverable spec) and the skeptic's **literal-reading verdict** where the unit is
  grounded in the CEO's verbatim: at stakes, the skeptic compares the design's
  treatment against the CEO's actual words and flags any dropped, reinterpreted,
  or imported meaning (escalating to a dedicated verbatim-reading check when the source
  is long or contested) — and a complaint about how something *looks* is answered in
  the looks medium, shown fixed in the composed artifact, never closed by a semantic
  re-diagnosis alone. An unresolved self-flag or literal-reading flag blocks `binding`
  exactly as a lens finding does: fixed, or recorded-accepted above the designer —
  never waved off by the seat that raised it.
- **The consumer enforces it.** The tier that turns the design into build units —
  the planner, backstopped by the coordinator's final verify — **refuses to mark an
  at/above-threshold design `binding`, and bounces it, if the lens artifacts are
  absent or a finding is unresolved.** The build relay may consume **only a
  `binding` design**; a `draft` at the seam is a gate failure, not a green light.
- **Math the design rests on is proven and independently checked** — standing,
  whatever the stakes tag. Each claim past basic arithmetic that the design's
  correctness depends on (e.g. a claim about every case, a bound, an optimum, a
  shortcut claimed to match the full computation), including math carried by a
  settled decision or the CEO's own proposal (a decision settles what to build,
  never whether its math is true), needs two more recorded artifacts in the corpus
  before the design may turn `binding`: a mathematician's written proof and a
  second mathematician's independent check returning PROOF-VERIFIED, which make
  the claim PROOF-GRADE, per orchestration's
  [proof-grade-math.md](../../orchestration/references/proof-grade-math.md). The
  skeptic's argument is not that check: a red-team can find a proof sound while
  it stands on a false premise. A claim that is UNPROVEN or REFUTED is a finding
  only a **fix** resolves (prove it, weaken the claim to one that is proven, or
  narrow the domain and make the product enforce it), never accepted with a
  rationale; the consumer refuses `binding` without both artifacts exactly as it
  refuses a missing lens artifact.

This is what turns the two lenses from "a thorough lead's habit" into a wall the run
cannot pass — the same move that made a drifting verification discipline stick once
it was an unmissable, consumer-checked gate rather than a good intention. (It also
means the discipline could later be lifted into a reusable design skill without
weakening: the gate is keyed on the *artifacts*, not on "did you read the skill.")

## The stakes threshold — gated by opt-out, not opt-in

Running the two lenses on every trivial change would over-ceremony thin work;
skipping them on high-stakes work is how a run ships a costly bug. So they are
gated by stakes — **but the gate is opt-OUT, because an opt-in gate is exactly the
kind that decays under momentum.**

**The lenses fire by default. A skip is the exception — and it must be recorded and
justified.** For any design pass, the two lenses run unless the unit is explicitly
tagged below-threshold with a one-line reason in the decomposition map (*"skip:
no ripple, no new surface, no consequence"*). A recorded skip is auditable by the
consumer and the hygiene checkpoint; a silent skip is not. Making "fire" the
default and "skip" the recorded act is what actually makes the gate un-skippable —
more than any "remember to run it" instruction.

A unit is **at or above the threshold** (lenses fire) when **any** of these holds —
and when in doubt it holds, because the costs are asymmetric: a needless lens pass
is one cheap, fresh, short-window agent, while a missed one ships the exact
correctness bug that sinks a consequence-critical change.

- **Consequence-critical** — the change touches an output a person **relies on for
  a real-world decision, where a wrong answer causes real harm** (e.g. money,
  safety, health, legal standing — examples, not the definition).
- **It ripples** — it changes a computation, touches another surface, or shifts
  behavior beyond its own leaf (the same *ripples* test the bucket-rule discernment
  uses — one concept, not two): it touches a shared core or an invariant other
  surfaces depend on — and on an experienced surface, ripple includes **geometric
  ripple**: a change to text length, density, or element count reflows the composed
  frame at the declared viewports, so "just a reword" is only below-threshold when
  the composed artifact shows the frame absorbing it.
- **New-surface** — it introduces a surface or capability that did not exist before
  (as opposed to restyling or rewording an existing one).

**Below the threshold** — a thin, cosmetic, or leaf change that only rewords,
recolors, or repositions within an already-`binding` design, rippling nowhere and
creating no new surface — the two lenses are skipped (recorded), but the rest of the
discipline still applies: reroute-don't-answer, the role-prompt skeleton, the
deep-understanding clause — **and, on an experienced surface, the composed
artifact** ("The composed artifact"): the lenses are what a thin pass skips, never
the drawn frame. A thin change still gets a real (small) design pass; it
just skips the red-team and the sweep.

**The stakes tag is a monotonic floor.** It is first set when the design pass opens
(at triage for a front-end unit; when the pass is stood up for a mid-run
`design-gap`). Any downstream agent that sees more ripple than the tag assumed
**ratchets it UP** freely — a cheap, encouraged correction. Ratcheting it *down* is
an escalation requiring written justification a spawn-capable tier verifies, never a
throughput convenience. Up-only defeats under-tagging even when the first judge
missed.

## The standing invariants — how deep understanding stays portable

Deep understanding evaporates when every fresh agent must re-derive it. The fix is
a small, **injectable** set of **standing invariants** — the product-level
properties every design must honor, each written as a one-paragraph constraint a
brief can paste in (e.g. *"a suggestion that would harm the user's core interest
must be impossible to emit — safe by default-deny"*). They live in the **field
notes** ([SKILL.md](../SKILL.md)) as a named section, seeded by the front-end and
**appended whenever a design pass articulates a new one** (which then triggers the
outbound invariant-audit). Every design brief injects them; every invariant-audit
checks against them. If the set grows past a comfortable read, graduate it to its
own sibling doc (doc-hygiene). This is the artifact that carries the hardest-to-
rebuild thing — what the product *is* — across every fresh context in the run.
Seed invariants on **every axis the acceptance medium carries** — the experiential
included (composition, responsive behavior, coherence of adjacent surfaces), not only
the semantic: the audit can only sweep the axes the register names, and a register
with no experiential entry makes the sweep structurally blind to the frame.

## Wrapping a design pass — judgment does not relay

A build worker hands off **state** ("12 of 30 units committed"); a design pass
produces an **atomic judgment** that cannot be handed off half-formed — a successor
would either re-derive it (waste, divergent judgment) or ratify a predecessor's
degraded partial (inheriting the very degradation the wrap was meant to avoid). So a
design pass **does not series-relay.** It **scales by decompose-and-reconcile
instead:** a question too big for one pass is really several design questions (by
discipline or by sub-surface), each its own one-window pass, recombined by
multi-discipline reconciliation.

This is why a design specialist wraps **far earlier than a build worker — past
~25–30%** ([SKILL.md](../SKILL.md), Premise 1): its judgment is the deliverable and
degrades first, so the early ceiling keeps each pass **bounded by construction.**
Size each design pass to complete well inside that window — a specialist normally
finishes and returns **`done`** under the ceiling; **an early wrap on `done` is
by-design, not a context-wall failure** (a verifier reading a low wrap-% on a design
agent should not read it as the agent failing). *Reaching* the ~25–30% ceiling
without a binding recommendation IS the decompose signal: the specialist wraps at a
clean boundary (a completed lens, a documented decision), records the over-scope,
and the reconciliation re-cuts — it never pushes a design call into degraded
context. Because each lens (designer, skeptic, auditor, reconciler) is a **separate
fresh short-window agent**, the early threshold multiplies cheap fresh agents rather
than forcing any relay; none eats another's budget.
