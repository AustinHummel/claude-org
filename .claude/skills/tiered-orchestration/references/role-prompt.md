# The role-prompt skeleton: the anatomy of a deep brief

Every design specialist, decision reasoner, adversarial skeptic, and invariant-
auditor the run stands up is briefed from the **same skeleton.** It is the reusable
anatomy of a brief that manufactures depth instead of hoping for it — the single
most directly transferable artifact in the whole discipline. [design-passes.md](design-passes.md)
(the director model, the two gated lenses), [front-end.md](front-end.md) (the design
lenses), and [mid-run-forks.md](mid-run-forks.md) (the in-flight-decision reasoner)
all point here rather than restating it.

Fill every part; the order matters (identity and stance are set before the material,
so they frame how it is read).

1. **Role injection, discipline-matched** — *"You are a fresh [strongest-model]
   [named expert: interaction designer / data-model assessor / flow specialist /
   search-ranking + UX specialist / security-architecture researcher …]."* The role
   IS the effort-routing lever — it steers the reasoning mode — so match it to the
   question's discipline, and spawn several distinct roles when the problem spans
   disciplines.
2. **Domain identity in the first sentence** — what the product IS and, pointedly,
   what it is NOT (e.g. *"a reference library, not a chat app"*). The negative half
   does as much design work as the positive: knowing what the product refuses to be
   rules out whole classes of wrong design. Deep understanding is **seeded here, not
   discovered** ([design-passes.md](design-passes.md), "Deep understanding is
   manufactured").
3. **Effort clause** — *"Work at full effort: depth and accuracy over speed."* (A
   request in the brief, naming no level: effort inherits from the session, which is
   checked against the required effort before launch — orchestration, "Before a
   long run".)
4. **Action fence / mutation envelope** — *"READ-ONLY" / "design-only, write NO code
   — produce the design artifact and nothing else" / "keep the repo byte-identical."*
   Fence the action-space as tightly as the reasoning-space.
5. **Stance clause — chosen by the question's lifecycle** (this is the load-bearing
   choice):
   - **Open question → BLIND.** *"I have deliberately NOT told you the lead's leaning;
     form your own view. If you find a recommendation in the materials, ignore it and
     reason independently."* Withholding the lead's answer is what lets a specialist
     *correct* the lead — the highest-value outcome a reroute produces, and impossible
     if the agent is anchored. Used by an open **design lens** and an **in-flight-
     decision reasoner**.
   - **Made call under review → SKEPTICAL.** *"This is a design already proposed —
     red-team it: try to find what is WRONG before it is built, do NOT rubber-stamp.
     I have not told you how confident we are."* Used by the **adversarial skeptic**:
     informed of the design, blind to the lead's confidence in it, tasked to break
     not to bless.
   - **Breadth sweep → AUDIT.** *"Sweep these surfaces against this invariant and rank
     any that fight it — you find and rank, you change nothing."* Used by the
     **invariant-audit**, which is a *different shape* from the skeptic: it grounds in
     many surfaces' primary sources, not one design, and its deliverable is a ranked
     list of found violations, not a single found bug. At product scale it may itself
     be a read-only fan-out (one auditor per surface-cluster, reconciled).
6. **Primary-source grounding** — *"Ground every claim in the REAL source (the code,
   the artifact, the measured behaviour), cite it precisely; the source wins over any
   doc; mark [measured] vs [inferred]; pin the version you read."* For an
   **experienced surface**, the REAL source is the surface as experienced — its
   rendered frame in the real running product, on the host/entry path a user actually
   reaches, at the declared viewports — never a proxy for it: a DOM tree, compiled
   styles, a green suite, or a standalone-harness render is supporting evidence, not
   the source ([evidence.md](evidence.md)). Plus:
   - **Supersession markers** — tag which parts of the supplied material are stale
     (*"this section's mechanic STANDS; only its framing is superseded"*) so the agent
     cannot design against wrong material.
   - **Delegation disclosure** — *"the coordinator has already verified X — build on
     it, don't re-verify; spend your reading elsewhere"* — so depth is not re-paid at
     every level of the hierarchy.
7. **Deep-understanding clause** — load the domain philosophy (where the domain has a
   philosophy artifact, make it a required first read and inline its load-bearing
   claims); carry the run's **standing invariants** as constraints
   ([design-passes.md](design-passes.md)).
8. **Deliverable spec** — *"your recommendation · the single strongest counter-
   argument to your own recommendation · the alternatives you rejected and why · risks
   · your confidence · which parts are analyzable (settled by evidence) vs residual
   taste."* The counter-argument-to-your-own-rec and the analyzable-vs-taste split are
   what make the output a *decidable* artifact rather than an opinion. (An audit's
   deliverable is instead its ranked violations; a skeptic's is its verdict —
   BUILD-READY / BUILD-READY-WITH-CONDITIONS / NEEDS-MORE-DESIGN — plus, on an
   experienced surface, the **frame verdict** (the composed artifact reviewed
   **rendered** at the declared viewports), plus, where the unit is grounded in
   the CEO's verbatim, the **literal-reading verdict**
   ([design-passes.md](design-passes.md)) — and the pointed
   question *"is there anything here that genuinely needs the CEO's own decision
   before build — a real product fork, not an engineering detail?"*)

   **Every design-pass deliverable** — experienced surface or not — closes with a
   **FLAGS section** (present even when empty) listing every unresolved self-flag: a
   doubt, a taste concern, a punt. The binding gate reads FLAGS as findings; an
   unrecorded doubt is invisible, and an unresolved recorded one blocks binding. For a
   design pass on an **experienced surface**, the deliverable additionally includes the
   **composed artifact** — the full-frame representation of each affected screen/state
   in the declared acceptance medium, at every declared viewport and theme
   ([design-passes.md](design-passes.md), "The composed artifact").

   **Math is the exception to *your confidence*.** Any claim past basic arithmetic
   that the deliverable rests on comes back as a written proof, a reproducible
   counterexample, or a plain account of what is missing, never a percentage;
   confidence covers only the judgment around the math. The claim stays UNPROVEN
   until the conducting tier has a second mathematician check it, briefed
   blind-first, and the check returns PROOF-VERIFIED
   ([proof-grade-math.md](../../orchestration/references/proof-grade-math.md)).
   Where the run schedules proofs by consequence, also name each claim's kind
   (existential, harm, or refinement) and why, for the conducting tier to confirm.
9. **Final-call reservation** — *"The final decision rests with the **conducting
   tier that stood you up**, who compares your independent answer to its own. Never
   bounce a fork to the CEO — flag it upward."*

Two brief-construction amplifiers ride on top of this skeleton — injecting settled
decisions as binding constraints, and grounding a brief in the CEO's *actual
words* over any paraphrase. They are the director model's, and live with it in
[design-passes.md](design-passes.md), "Two amplifiers the lead must carry."
