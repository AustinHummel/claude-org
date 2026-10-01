# Acceptance evidence: producing and consuming what the CEO will judge by

Premise 3 ([SKILL.md](../SKILL.md)) is the law: a gate only sees the evidence class
it consumes, so a run whose gates consume arguments and code-space measurements will
honestly pass work the CEO condemns at first contact. This spoke is the
machinery that keys the run's gates to the CEO's own evidence class. Five
pieces: a **declaration** made at intake, a **journey inventory** that shapes
coverage, a **composed-artifact contract** on the design side
([design-passes.md](design-passes.md), "The composed artifact"), an **evidence gate**
on the verification side, and a **walkthrough gate** that "done" must pass through.
Each is keyed on a recorded artifact and enforced by a consumer that is not its
producer — the same shape as the binding gate, because a gate the producer certifies
for itself is no gate.

## The acceptance-medium declaration

Before any research or design branch is dispatched, the routing gate writes the
**acceptance-medium declaration** into the decomposition map (and seeds it into the
field notes, where every brief can inject it):

- **The medium(s)** in which the CEO will actually *experience* the finished
  work — rendered screens for an app, the terminal for a CLI, the read page for a
  document library, the response on the wire for an API. The declaration names how
  the CEO experiences the result, **not how the run builds it**: "the code" is
  never an acceptance medium for a product a person uses.
- **The declared viewport set and themes**, where the medium has them. For any
  screen-rendered medium the set includes **at minimum one phone width and one
  desktop width**, and every theme the product ships, unless the declaration records
  why not (a desktop-only internal tool, a single-theme product) — a recorded
  exception is auditable; a silent one is not. Where a dimension does not exist in
  the medium (viewports for a CLI), the declaration says **"n/a"** explicitly.
- **The named host and entry path** the user actually reaches — the real product at
  its real address, walked the way a user arrives, not a harness, a standalone
  component host, or a preview shell. Verifying on a harness while the user lands
  somewhere else is how a run renders everything and still never sees what the
  CEO sees.

The declaration is consumed, with refusal power, by: **plan synthesis** (no
declaration, no plan — [front-end.md](front-end.md)); every **design and lens brief**
(injected as constraints beside the standing invariants —
[role-prompt.md](role-prompt.md)); the **evidence gate** (DoDs cite its media and
viewports); the **walkthrough gate** (it walks them); and the launching
coordinator's **seam check** at the front-end→build boundary
([SKILL.md](../SKILL.md), coordinator's loop). A
run with no experienced surface at all records exactly that — "no experienced
surface; walkthrough scope: none" — as a declared, auditable skip.

## The journey inventory

Coverage keyed to the input ships the input's blind spots: a delta-list yields delta
designs, delta lenses, and delta verification, and nobody owns the seam the user
walks across. So triage also enumerates the **journey inventory**: the composed
journeys the CEO and users will walk through the *changed* product — each a
named, ordered sequence of surfaces, **including inherited surfaces the delta newly
routes users onto** (change the door and the hallway behind it is now on the path,
whether or not any unit touches it). Each journey also lists its **variant
classes** — entry, exit/skip, **interruption/resume** (leave mid-journey and come
back), revisit — or records "none material" per class: a user rarely walks a
journey once, cleanly, forward-only, and the defects that live only in a variant
(state lost on return; a resumed journey restarting from zero) are invisible to an
end-to-end-only walk. Omitting a variant class is a recorded, auditable choice,
never silence. Three consumers give the inventory teeth:

- **Plan synthesis runs the owner check**: every journey surface maps to a unit or
  to an explicit, recorded no-change-needed disposition; an unowned surface bounces
  the plan ([front-end.md](front-end.md)).
- **The walkthrough gate walks it** (below), variants included: the inventory is the
  walk list, so a journey the map never named is a journey nobody walks — which is
  why expansion passes must update the inventory when they add or reroute surfaces
  ([mid-run-forks.md](mid-run-forks.md)).
- **The walker signals its gaps**: because the inventory's producer cannot audit its
  own completeness, the walker is charged to flag any door, path, or state it
  encounters that the inventory never named — the naive fresh walk is the natural
  detector of what triage missed, and its gap-flags are dispositioned like flaws.

## The evidence gate

The binding gate is the design side's "no artifact, no credit"; the **evidence gate**
is the same shape on the verification side. Four rules:

1. **The medium species.** The primary source for any claim about an experienced
   surface is **that surface experienced in the real product** — for a screen, its
   rendered frame in the real running product, on the named host and entry path, at
   the declared viewports and themes; for a CLI, the real invocation's transcript;
   for a document, the page read as filed. A DOM tree, compiled styles, a green test
   suite, or a harness/standalone-host render is **supporting evidence and never
   satisfies a render DoD** — a harness is not the product, and "it rendered in the
   harness" is recorded as harness evidence, never as the real surface's.
2. **The evidence artifact — and what its DoD must say.** Every unit whose DoD
   covers an experienced surface **names its evidence artifact(s)** — the captured
   frames, the transcript, the walked-document notes — in the DoD itself (the
   planner's duty, [front-end.md](front-end.md)), and states acceptance **in the
   frame's own terms**: the rendered result corresponds to the composed artifact
   where one exists, and **nothing visibly broken anywhere in the captured frame**
   — never as a bare capture duty ("frame captured and filed" is evidence that
   exists, not evidence that passes). The conducting tier's pre-build plan
   verification checks that every experienced-surface DoD carries this evidence
   clause — an un-written bar is caught at the seam, not at reconciliation. When a
   unit changes a **shared substrate** (a design token, a shared component or
   stylesheet, a layout primitive other surfaces inherit), its DoD adds a
   **regression sample**: frames of named representative untouched surfaces that
   inherit it, checked unchanged. The worker files all evidence in the run's
   **evidence area** — a location the plan header names, sibling to the design
   corpus, one file-set per unit so leaf writes never contend — and references it
   from the unit's plan row. No artifact, no credit: the checkbox rule
   ([SKILL.md](../SKILL.md), "The done bar") makes an evidence-less check-off a
   falsified plan, not a flagged debt.
3. **Consumption at every relay seam — frame-holistic.** The orchestrator that
   receives a worker's wrap **opens and reads** the evidence for the units that wrap
   claims — the frames, the transcript, against each unit's DoD at the declared
   viewports — **before spawning the next worker**, and bounces any unit whose
   evidence is missing or failing: un-check it, record the bounce in the handoff,
   point the next worker at it first. The consumer reads each frame **as a page,
   not as a checklist**: anything visibly broken in evidence it opens is bounced or
   recorded as a finding, whether or not the DoD names it — a gate that diffs
   frames against DoD text alone is consuming screenshots-about-the-work, the same
   proxy shape one level deeper. Consumption is owed at **every receipt, the
   pre-wrap one included**: an orchestrator whose last child returns as it nears
   its own wall still consumes before wrapping, and a fresh same-tier successor
   inherits any unconsumed backlog as its **first duty**, named in the handoff.
   Consuming evidence is the *verify* half of orchestration, not doing the work.
   The outermost consumer is the launching coordinator at reconciliation
   ([SKILL.md](../SKILL.md)): it spot-opens a sample of unit evidence and personally
   reads the walkthrough's staged evidence — the pixels, not the report about them.
4. **Evidence lives with the run, not the product — and has a lifecycle.** The
   evidence area is a run artifact (hygiene checkpoints watch its growth); nothing
   in it ships, and nothing in it is pruned mid-run — it is the audit trail
   reconciliation reads. The **planner names its location** in the plan header:
   alongside the run artifacts for small or text evidence, a referenced
   outside-the-repo store when bulk binaries would bloat version control. Post-run,
   evidence is **retained through reconciliation and the CEO's staged review**;
   after that, the coordinator's close-out records its disposition — archive with
   the completed work's record, or prune the bulk and keep the walkthrough set —
   per the workspace's stewardship rules.

## `env-blocked`: the environment is part of the contract

When the environment cannot produce evidence a DoD requires — the product will not
run, the stack will not come up, a required tool is absent — the worker wraps
**`env-blocked`** ([SKILL.md](../SKILL.md), wrap-reasons). It never converts the gap
into a carried flag, because environment debt compounds silently: each tier inherits
it one reasonable step at a time until a run is "complete" with its product never
run. The ancestor's action is **stop-the-line for the affected units**: route
environment recovery into the plan — a fresh expansion pass appends the recovery
unit, scope-trace and all ([mid-run-forks.md](mid-run-forks.md)); fixing the
environment is work, and it is usually cheap next to shipping unverified — or, only
when recovery is genuinely beyond the run's autonomous reach, escalate to the CEO
as **blocking residue**. The
run may keep building units whose DoDs the environment *can* evidence, but the
blocked units stay open, and the done bar holds: no closure over an open
`env-blocked`.

## The walkthrough gate: done is staged through the composed experience

Per-unit evidence proves each part; nobody has yet experienced the whole. For any
run whose declaration names an experienced surface, the plan's terminal phase —
placed by the planner, un-removable like any binding DoD — is the **walkthrough**:

- **A fresh walker.** An agent that designed and built nothing in the run walks
  **every journey in the journey inventory — and every declared variant**, probing
  interruption/resume (leave mid-journey, return), revisit, and exit/skip where the
  medium supports them — end-to-end, in the real product on the named host, at the
  declared viewports and themes, on a **first user's state and a representative
  real state** (fresh account and realistic data, where the product has accounts
  and data).
- **Naive-first stance.** The walker is briefed with the product identity, the
  declaration, and the inventory — **not** the design corpus and not the run's
  self-assessment — so it experiences what a user experiences rather than checking
  off what the designs promise. It reports as a first user with a designer's eye:
  what it saw, where it hesitated, what a designer would flag, and whether adjacent
  surfaces contradict each other (the same fact shown two ways on one journey is a
  flaw) — and it **flags any door, path, or state the inventory never named**: the
  inventory's producer cannot audit its own completeness, and the naive walk is the
  natural detector of what triage missed. Gap-flags are dispositioned like flaws.
- **A recorded verdict + staged evidence.** It files the ordered frames/transcript
  of the walk in the evidence area, a walked-journey report, and a verdict:
  **SHIP-READY** or **FLAWS-FOUND** with a ranked list that marks which flaws are
  **ship-blocking**. Flaws route back through the **routing gate**
  ([SKILL.md](../SKILL.md)) — a clear defect to build units an expansion pass
  appends, a design question to a design pass then expansion — and the run **cannot
  close** while the verdict is absent or any flaw is undispositioned.
- **Disposition has a floor.** Every flaw gets exactly one of: **fixed**;
  **accepted** — only for a flaw the walker did NOT rank ship-blocking, with seat
  and rationale recorded where reconciliation audits them; or **named blocking
  residue** — a ship-blocking flaw whose fix lies outside the scope fence
  (inherited, out-of-scope) is never intra-run accepted: it rides to the CEO at the
  top of the closing report, with the staged frames showing it and the scope
  question attached. A ship-blocking flaw that is in-fence is simply fixed. A run
  carrying blocking residue never reports unqualified "done" — the residue is the
  headline, not a footnote; laundering a blocking flaw into carried residue is the
  exact demotion this discipline exists to forbid.
- **Checkpoints on long runs.** Where phases land experienced increments, the
  planner places **walkthrough checkpoints** at those phase boundaries — the same
  walker shape scoped to the journeys the phase touched — so composed-experience
  drift is caught within a phase, not at the end. This restores, autonomously, the
  fresh-eyes cadence long runs otherwise lose.
- **Staged for the CEO.** The walkthrough's evidence and report are named in
  the closing report, so the CEO's own first contact starts from what the run
  already saw — their pass runs on staged evidence at their own cadence, and anything
  their eye catches beyond the walker's routes back in as first-class input, cheap to
  reopen. (Where the CEO directs that their own pass be an in-run hold, it attaches
  exactly here: the run holds at "staged" until they walk it. The default is the
  staged review — the run closes through the walker.)

The walkthrough is not a repeat of per-unit evidence: unit evidence proves each
change in place; the walkthrough proves the **composition** — the seams, the frame,
the journey — with eyes that never saw the arguments.

## Degrading gracefully: the discipline without a screen

The discipline is medium-shaped, not UI-shaped. For a document library, the medium
is the read page: the composed artifact is the document itself (where the
deliverable already *is* the experienced artifact, the duty collapses into the
deliverable — nothing extra is produced), unit evidence is the file read as filed,
and the walkthrough is a fresh reader walking the library the way its consumers will
— hub to spokes, links followed, one altitude per file. For a CLI, the composed
artifact is the designed transcript, evidence is the real invocation's output, and
the walkthrough runs the advertised workflows end-to-end, fresh. For a pure library
or API, the walkthrough exercises the consumer workflows against the real interface.
Only a run with **no experienced surface at all** skips the walkthrough — and says
so in the declaration, where the early check and reconciliation can audit the claim.
What never degrades: evidence in the medium named, consumed by a non-producer,
before done.
