---
name: question-review
description: >-
  Resolve accumulated open decision-questions by dispatching a fresh,
  independent specialist subagent per question — each grounded in the real
  primary sources (the actual code, not just the design doc), and, for a
  genuinely-open question, kept BLIND to the coordinator's own leaning so it
  forms its own view — then compare each specialist's answer to your own call
  and decide. Use this whenever open questions or pending decisions have piled
  up and the principal asks, in their own words, to "dispatch/send subagents to
  answer the open questions," "get independent takes on these decisions,"
  "resolve the open items," or "have specialists look at [the questions
  channel]" — even when they do not name this skill; and use it autonomously to
  unblock yourself during a build session when the principal is away and open
  questions are gating progress (hand the whole batch to ONE review-coordinator
  that fans each question out to its own specialist and returns a synthesis).
  Also covers getting a second opinion on an already-made call (agree / refine /
  disagree + the strongest counter-argument + a concrete revisit trigger). The
  final decision always stays with the coordinator; resolutions are recorded
  with provenance and are never auto-implemented. NOT for answering a factual
  question already settled in the workspace (status-report), for ordinary task
  delegation where you already know the answer (orchestration), or for absorbing
  a brain-dump of new items that first need triage (intake).
---

# Question review: resolving open decisions through independent specialists

Open decision-questions accumulate — a data-model fork, a tuning constant, an
engineering call already shipped that you are not sure about. This skill resolves
them by handing each to a fresh specialist subagent that reasons independently
from the real evidence, then bringing that reasoning back to the coordinator, who
makes the final call. It is a **named specialization of the orchestration skill**
— the crystallized form of a recurring "have a fresh mind assess this open
question" brief — so it inherits orchestration's loop (brief → verify → integrate
→ log → report) and adds only the machinery specific to resolving *decisions*:
the blindness rule, the two invocation modes, the marking, and the
what-this-can't-settle boundary. Read
[orchestration](../orchestration/SKILL.md) for the loop; this file is the
specialization.

Two failure modes justify the ceremony:

- **The call made through your own blind spots.** The coordinator that has been
  living with a question is the worst-placed to grade its own leaning — it
  reasons through the same assumptions that produced the leaning. A second mind
  that never saw your answer is the cheapest way to find the argument you could
  not see from inside.
- **Open questions that quietly stall the work.** In an autonomous build session
  with the principal away, a pile of unresolved decisions blocks progress and
  tempts the seat to either guess or wait. Neither is necessary: the seat can
  unblock itself rigorously by delegating the whole review.

## When to use, and when the flow can't settle it

Use it when open decision-questions have accumulated and deserve more rigor than
the seat's own take — on the principal's request, or to self-unblock. Before
dispatching, sort each question, because **not every open question is
analyzable**:

- **Analyzable** — the answer turns on evidence, mechanics, or reasoning a
  specialist can run down (which data model is safer, what a constant should be,
  whether a shipped call holds up, what the code actually does). Dispatch a
  specialist to resolve it.
- **Principal-only** — a genuine value or taste judgment no analysis can settle
  (how a thing should *feel*, which of two legitimate directions the product
  takes, a risk only the principal owns). The flow can still produce a
  **recommendation**, but the question stays **flagged as awaiting the
  principal** unless they have explicitly delegated the call. Do not let a
  well-argued specialist opinion launder a taste call into a settled one.

The line is not always clean; when a question has an analyzable core under a
taste shell, resolve the core and surface the shell. Say which bucket each fell
in when you report.

**Not for:** answering a question whose answer already lives in the workspace
(that is [status-report](../status-report/SKILL.md) — orient and cite, do not
convene a panel); ordinary task delegation where you already know the answer and
just need it done ([orchestration](../orchestration/SKILL.md)); absorbing a fresh
influx of items that first need triage ([intake](../intake/SKILL.md)).

## The two invocation modes

**(a) Principal-invoked, on demand.** In a dedicated session the principal asks,
in their own words, to have subagents resolve the open questions. Run the fan-out
yourself from the coordinator seat: one fresh specialist per question, verifying
and integrating each result as it returns. This is the ordinary orchestration
loop, specialized by the rules below.

**(b) Coordinator self-unblock, autonomous.** In a build session with the
principal away, do **not** fan the questions out directly from the root — hand
the *process itself* to ONE subagent, a **review-coordinator**, which breaks the
remaining open questions down and gives each to its own specialist, then returns
one synthesis. This nesting keeps the root's context clean (it receives a
distilled synthesis, not N raw specialist reports) and keeps the root responsive.

The nesting has one load-bearing constraint: **the review-coordinator must run
its per-question fan-out synchronously — in the foreground.** A backgrounded
child's report routes to the *root*, not to the frozen review-coordinator, which
breaks the synthesis and forces a manual relay. Brief the review-coordinator to
dispatch each specialist with the Agent tool and `run_in_background: false`, and
point it at this skill so the rules below hold one level down
([orchestration](../orchestration/SKILL.md), "Hierarchy: subagents that
delegate").

## The blindness rule (load-bearing)

This is the rule that, broken, silently voids the exercise — a leaked answer key
does not make the test easier, it makes the score meaningless. The entire value
of an independent specialist is an **un-anchored** second mind. Tell it your
provisional answer and it will anchor to it: you pay a full dispatch for a rubber
stamp and lose exactly the disconfirmation you convened it to find.

So the posture depends on the question's state:

- **Genuinely-open question → withhold your call.** Give the specialist the
  findings and context it needs, and the crisp question — but **not** your own
  provisional answer or the direction you are leaning. It must form its
  recommendation from the evidence. (This is what lets the flow *overturn* you,
  not just confirm you.)
- **Already-made call under review → disclose it.** Tell the specialist the
  decision is made and give it the full rationale, then ask for an **assessment**:
  agree / refine / disagree, the **strongest counter-argument** to the call, and
  a concrete **revisit trigger** (the observable condition under which the call
  should be reopened).

**Enforce the boundary by who-holds-what** — independence is a property of what
an agent's context holds, not of good intentions. Before dispatching an
open-question specialist, re-read your brief and
confirm it states the findings but not your leaning — a leaked "I'm thinking we
should…" quietly converts an independent review into an echo. One agent never
holds both postures for the same question. If a brief leaked your call, the
independence is void: rewrite and rerun rather than trusting the tainted answer.
(Independent *convergence* — a blind specialist landing on your call via its own
reasoning — is the opposite of a problem; it is the confirmation you wanted.)

## Grounding the specialist

Two inputs decide a specialist's quality: what it is grounded in, and what it is
asked to return.

- **Ground it in the primary sources the question actually turns on — not just
  the design docs.** For an engineering call, point it at the **real code**
  (`file:line`, the relevant module, the actual call sites) and ask it to verify
  claims against the code, not restate the doc; for a research or policy call,
  the authoritative primary sources. Code-grounding is what earns this flow its
  keep — it is how a specialist verifies a safety property in the implementation,
  or catches a factual error in the coordinator's own documentation, instead of
  reasoning from a description that may itself be wrong.
- **Give it a crisp deliverable spec.** Brief per orchestration's
  [briefing.md](../orchestration/references/briefing.md); require the report per
  [report.md](../orchestration/references/report.md). The unit-specific asks:
  - *Open question:* independent recommendation · reasoning · alternatives
    considered · risks and tradeoffs · confidence.
  - *Review of a made call:* agree / refine / disagree · the strongest
    counter-argument · a concrete revisit trigger.
  - *Either, when the answer turns on math past basic arithmetic:* that
    math comes back as a proof or a counterexample, never a confidence,
    and stays UNPROVEN until its own independent mathematician checks it
    ([proof-grade-math.md](../orchestration/references/proof-grade-math.md)).
- **Use the strongest model at full effort**, as this is decision-shaping work
  (orchestration governors).

Two compressed illustrations of the shape (not a script — the questions vary):

- *Open, analyzable:* "Which data model gates feature X?" → specialist, **blind**
  to your leaning, grounded in the real class and its call sites → returns a
  recommendation with the alternative it rejected and why. It may confirm your
  unstated call (independent convergence) or overturn it with an argument you
  did not have.
- *Made call under review:* "This shipped engineering choice — keep it?" →
  specialist **told** it is decided and why → returns keep / change, the
  strongest counter-argument, and the condition that should reopen it —
  occasionally correcting a claim in your own rationale along the way.

## The decision, the mark, and the no-implement rule

- **The final call always rests with the coordinator**, never the specialist.
  Verify the specialist's work from your own seat — its report is testimony, not
  proof, so spot-check the load-bearing code or source claims yourself
  ([verification.md](../orchestration/references/verification.md)) — then compare
  its answer to your own call and decide: adopt, refine, or keep your own, with
  the specialist's reasoning as the record either way.
- **Mark the resolution with the instance's review mark** in the durable decision
  record, meaning "coordinator-decided via specialized-subagent review." The mark
  signals a call that was independently stress-tested, and every such resolution
  **remains principal-overridable** — it is the principal's org.
- **Do not auto-implement from the specialists' feedback.** This flow *decides
  and documents*; it does not build. Capture the go-forward plan (decision record
  + build tracker) so a future session picks it up. When the principal asked for
  review-not-build, this is a hard constraint; treat any implementation as a
  separate, later unit the principal can green-light.

## Documentation duties on resolution

A question resolved through this flow is not closed until all four are done —
otherwise the rigor evaporates with the context that produced it (prime rule 1):

1. **Settle it in the durable decision record**, marked with the review mark and
   carrying provenance: which specialist, whether it was blind or informed, and
   what it found (especially where it changed or corrected your call).
2. **Clear it from the open-questions channel.** If it turned out principal-only,
   move it to *awaiting-principal* with the specialist's recommendation attached,
   rather than marking it resolved.
3. **Bake any go-forward build notes into the build tracker** so the next session
   can act without re-deriving the decision — but do not implement (above).
4. **Log every dispatch** under a `Having a subagent …` parent in today's log
   (orchestration logging), each specialist's essential findings as children in
   its own voice, so the principal can later ask what any specialist did and
   found.

## Instance bindings

This skill speaks in roles so it holds in any workspace. Each instance binds
three of them, once, in the hub of the area that carries open decisions:

- **The open-questions channel** — where open decisions await the principal (a
  dashboard lane, a questions file, a quest's open-items section).
- **The durable decision record** — where settled calls live with provenance and
  whose-call attribution.
- **The review mark** — the glyph or label meaning "resolved via specialist
  review," defined once in the decision record's legend.

A coordinator working an area with accumulated decisions will have oriented via
that area's hub, which names these bindings and links this skill; if an area has
no such channel or record yet, stand them up (workspace-stewardship skill) before
running the flow, so the resolutions have somewhere durable to land.
