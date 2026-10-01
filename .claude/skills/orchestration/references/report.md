# The deliverable report

The report is the upward half of the delegation contract: it compresses a
unit's whole history into what the parent needs in order to verify,
integrate, and avoid paying for the same work twice. A parent should be
able to act on the report without re-deriving the unit. Subagents return it
as their final message; coordinators demand it in every brief. The parent
then logs the essentials under the dispatch's `Having a subagent ...`
parent in the daily log — the report is the source for those children.

## Format

    DELIVERED: what exists now that did not before, in outcome terms.
    CHANGED: files touched, one line each on what and why.
    VERIFIED: exactly what was checked and observed (commands and counts,
      sources and dates — not "looks good"). State what was NOT verified
      just as plainly. A math claim past basic arithmetic is reported by
      its status (PROOF-GRADE, meaning proven and independently checked;
      REFUTED; or UNPROVEN), never by a confidence percentage
      (proof-grade-math.md).
    AFFECTED INTEGRATIONS: the surfaces beyond this unit that the change
      could plausibly disturb, as advice for the parent's checking
      decision. Name the surface and the reason ("the dashboard lane for
      this quest now understates status"; "two org files link the section
      I renamed"). Producing this list is part of the deliverable; ACTING
      on it is not — the parent decides who covers it. In a multi-unit
      round this section has a second consumer: the parent folds it into
      the NEXT unit's brief, so a gap named here becomes explicit work
      instead of a surprise.
    DELEGATION DISCLOSURE: agents you spawned, one line each: the scope you
      gave, what THEY verified, and their affected-integrations advice
      folded upward. Write "none" when you worked alone. This section is
      what lets each level of a hierarchy trust the level below instead of
      re-checking it.
    ESCALATIONS: obstacles outside your scope fence, with just enough
      context for the parent to decide: what you hit, why it blocks or
      degrades the work, your recommendation, and whether you proceeded or
      stopped.
    CAVEATS: known gaps, assumptions made, follow-ups worth a future unit
      (the parent turns these into To-Dos, not you).

## Why the odd division of labor around checking

The maker of a change is the best source of "what could this disturb" and
the worst judge of "does it actually hold up": they know the seams, but
they check through their own assumptions. So the report asks the maker for
the MAP (affected integrations) and reserves the TERRITORY (deep
verification) for the parent, who may hand it to a dedicated adversarial
checker carrying fresh assumptions. Duplicated deep checking at every level
of a hierarchy is the expensive failure this format exists to prevent: the
delegation disclosure shows a parent what was already covered below, so its
own budget goes only to the uncovered seams.

## Escalate early when it changes the plan

The report normally comes at the end. Two situations deserve stopping early
and reporting immediately instead:

- The unit is misconceived: the brief asks for something the facts on the
  ground contradict, and continuing would build on the wrong premise.
- The unit needs a decision that belongs to the parent (or the CEO): a
  structural problem the unit must build on, a constraint the brief did
  not anticipate, a fact that changes the goal.

A cheap early stop beats an elaborate wrong deliverable. When stopping
early, still use the report format; most sections will be short, and
ESCALATIONS will carry the weight.
