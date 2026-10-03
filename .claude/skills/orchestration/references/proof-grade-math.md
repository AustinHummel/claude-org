# Proof-grade math: proven, independently checked, never estimated

In math, close does not count. A claim that a design, a build, a decision,
or a figure someone will rely on rests upon is either true for every case
it covers or it is not, and a confidence percentage cannot say which. So
any math past basic arithmetic is proven by one mathematician agent and
checked by a second, independent one, and it travels by its proof status,
never by a confidence. Until it is proven, nothing whose failure would
break a promise or harm someone rests on it, and no one is told it holds;
when the rest is due can depend on what its failure would cost
([When each claim is due](#when-each-claim-is-due-by-consequence)). Math
that certifies safety (a limit is never crossed, a deadline is never
missed) is where this matters most: there, a probably-right proof is a
promise the work may break.

**The failure that set this bar.** A design's safety math was red-teamed
by argument, judged sound at ~90% confidence, and bound. A later
specialist, working in exact arithmetic against a brute-force oracle, found
one of the proof's premises false for the most common input, so the design
could have certified unsafe cases as safe; the same oracle showed a
shortcut the CEO had proposed returning a false "safe" in over half its
test cases. That specialist then reported its own verdict
as "≈85%", and the figure rose through every tier to the CEO as if it were
a verdict. Each step followed the instructions of the day: deliverable
specs asked for a confidence, and the binding gate consumed arguments. It
is tiered-orchestration's Premise 3 in small: a gate that consumes
arguments passes math that a computation would refute.

## Where the line falls

**Basic arithmetic** computes a specific result from given numbers (a sum,
a difference, a product, a ratio, a percentage, a rounding, a unit or date
conversion), and redoing the computation confirms it. It needs no proof;
its check is an independent recomputation, the ordinary adequacy pass
([verification.md](verification.md)).

**Heavy math is everything past that.** One question sorts it: *would
redoing computations you can list confirm the claim?* If confirming it
takes an argument about cases nobody computed, or about why the computed
cases are all of them, it is heavy. That includes at least:

- a claim about every case: every input, plan, date, or schedule
  ("always", "never", "forever", "guaranteed");
- a bound or an inequality ("at most", "never below");
- an optimum ("the smallest amount that…", "the best split");
- an equivalence: a closed form, shortcut, cache, or incremental update
  claimed to match the full computation;
- a complexity, termination, or resource bound;
- number theory, periodicity, calendar cycles;
- error analysis: accumulated floating-point or rounding error, or a claim
  that a rounding scheme always errs the safe way;
- probability and statistics, and any estimate offered as a guarantee.

When in doubt it is heavy: proving something easy is cheap, and a wrong
unproven claim ships. Code that only does basic arithmetic stays under its
repo's ordinary bar; code that implements a heavy claim inherits this bar
for that claim.

## Proven

A mathematician agent at the strongest model, role-injected in the claim's
discipline (a combined role is fine: a scheduling engineer who is also a
number theorist), delivers for each heavy claim:

1. **The exact statement**: the domain it covers (the inputs the system
   actually admits, not only the realistic ones), every hypothesis, and
   the precise conclusion. A proof covers its statement and nothing more,
   so the statement must be the claim the work relies on.
2. **The written proof**: every step justified in the deliverable itself
   ("it can be shown" is a gap); standard results cited by name; every
   premise about the real system (the code, the data, the calendar)
   grounded in its primary source at a pinned version; every computational
   step backed by a reproducible script and its recorded output. Exact
   arithmetic (integers, rationals) wherever the claim is exact or sits on
   a knife-edge; floating point only where an error bound is part of the
   proof.
3. **Evidence kept in its place**: tests, fuzzing, brute force on samples,
   and timings corroborate a proof and never replace one. A computation
   proves only by exhaustion, with an argument that the enumeration covers
   the whole domain.
4. **An outcome, never a percentage**: the written proof, a reproducible
   counterexample, or a plain account of what is missing. "Provable" is
   not an outcome; until a proof is written and independently checked,
   the claim is UNPROVEN. A condition is legitimate only as a hypothesis
   of the statement with a named owner who makes it true (the build that
   enforces an input limit, say); a doubt dressed as a condition is a gap.
   Confidence stays available for the judgment around the math (a design
   trade-off, a taste call), reported apart from it.

A proof too large for one agent's window splits into lemmas, each proven
and checked on its own; the assembly is checked too.

## Independently checked

A second mathematician agent checks it: stood up by the dispatcher, never
by the prover (whose brief would carry its framing); fresh; at the
strongest model, explicitly selected, with the required effort requested;
role-injected like the prover; and blind to the prover's confidence, the
lead's leaning, and any earlier verdict. It works in three moves:

1. **Attack before reading.** From the statement, its domain, and the
   primary sources alone, it hunts for a counterexample, at the domain's
   edges and in the cases the claim treats specially, and records that
   attack in its artifact before it opens the proof. A checker that reads
   the proof first tends to verify each step inside the proof's own
   framing; that is how the red-team above judged a proof sound on a false
   premise.
2. **Check every line.** Then it verifies each step of the proof, and each
   premise against its primary source.
3. **Compute independently, where a finite check exists.** It (or a
   separate engineer who wrote neither the proof nor the design) builds an
   oracle from the statement (brute force, exact simulation, or exhaustive
   enumeration) sharing no code with the prover's, since a shared bug
   passes both, and runs it differentially against the prover's figures or
   the implementation: exhaustively where the domain allows, otherwise
   over broad random samples plus the adversarial and boundary classes by
   name. The coverage is stated (how many cases, drawn how and with which
   seeds, from which classes), because five hand-picked cases corroborate
   five cases. Where no finite check exists (a pure asymptotic bound), it
   says so, and the line-by-line check carries the weight.

Its verdict is PROOF-VERIFIED (every step checked, every premise traced,
no counterexample within the stated coverage), GAPS (each step it could
not verify or found false, listed), or REFUTED (a reproducible
counterexample), again with no percentage. GAPS returns to a prover for
repair; the repaired proof goes to a fresh checker, blind to earlier
verdicts, and is re-checked in full, until one returns PROOF-VERIFIED. A
design red-team finding the math "sound" is not this check.

## Nothing rests on an unproven claim

A heavy claim has one of three statuses: **PROOF-GRADE** (a written proof
and a fresh checker's PROOF-VERIFIED), **REFUTED**, or **UNPROVEN**
(everything else, a written but unchecked proof included). Only
PROOF-GRADE is settled. An UNPROVEN claim may be recorded as a conjecture,
and nothing rests on it beyond what its schedule allows (next section): no
decision, figure, or guarantee a person will rely on; no build whose
failure would break a promise or harm someone; and no report, screen, or
message presents it as settled. When a claim resists proof, every remedy
is a fix: prove it; replace it with a weaker claim that is proven (a
certified conservative bound instead of an exact optimum, a finite horizon
instead of "forever");
or narrow the domain to where the proof holds and make the system enforce
that domain. What is never available is proceeding on it with a
confidence or a recorded rationale, the acceptance path other findings
have.

The bar holds whoever proposed the math, a specialist, the lead, or the
CEO: authority settles what to build, and may choose when each proof is
due (next section), never whether a formula is true. And
the label is not the artifact: a math claim labelled "validated", "sound",
or "verified" without the proof and the PROOF-VERIFIED check is UNPROVEN,
whenever it was labelled, and new work that would rest on it first brings
it up to this bar.

## When each claim is due: by consequence

Every heavy claim the finished work relies on is proven and checked to the
bar above, and that never varies. The default is also the simplest
schedule: every claim PROOF-GRADE before anything rests on it. For work
that will go through further design iterations, that default proves math a
later iteration may delete, and it keeps the CEO from using, and so
steering, what is being designed. For such work the CEO may choose instead
to schedule each claim by what its failure would cost. The choice is
recorded where the work's agents read it (a run's charter, a unit's brief):

| Kind | Its failure would… | Proven |
|---|---|---|
| **1 · Existential** | make a promise the work makes impossible to keep | first, before anything that depends on it is built |
| **2 · Harm** | hurt someone relying on the work: a figure shows more than is really there; a limit is reported safe when it is not | before anything that depends on it is built, and every one before any real user relies on the work |
| **3 · Refinement** | only leave the work more cautious, slower, or less polished (exactness, optimality, efficiency, presentation) | once the design it serves stops changing; retired instead if a later iteration removes it |

- **Classify by the worst failure, and record it.** Each claim carries its
  kind and a one-line reason beside its status, and the tier that consumes
  the gate checks the reason. Unsure between two kinds, take the stricter.
- **Kind 3 must earn its label.** "It can only make the work more
  cautious" is itself a claim. Where showing that a failure falls only on
  the safe side takes heavy math, split the claim: its safe-direction half
  ("never less than required") is a kind-2 claim of its own, and only the
  remainder ("never more than needed") is kind 3.
- **Internal builds may run ahead of kind 3, never of kinds 1 and 2.** A
  settled design may be built on an internal line no real user relies on
  while its kind-3 claims are owed, so the CEO can use it and steer
  the next iteration. Nothing, on any line, is built on an UNPROVEN kind-1
  or kind-2 claim. A unit built ahead of a kind-3 proof records that claim
  as UNPROVEN in its definition of done; once the claim is PROOF-GRADE, its
  obligations ([What the build carries](#what-the-build-carries)) land in a
  later unit.
- **Release waits on kinds 1 and 2.** Before real users rely on a release,
  every kind-1 and kind-2 claim it relies on is PROOF-GRADE, the claims in
  inherited code included.
- **Never advertised early.** An owed claim is never presented as proven,
  in a report or in the work itself: copy that calls a figure "exact" or
  "the best" states the claim, and waits on its proof.
- **A refutation is fixed at once, whatever the kind**, before anything
  further relies on the claim; a refuted kind-1 claim reopens the design.
- **The owed list never closes silently.** It lives in a durable register;
  each kind-3 claim names the event that makes it due (the design it
  serves settling), so "still changing" cannot defer it forever; the
  list travels in status reports by kind; and a run that ends with claims
  still owed hands the list forward. A claim leaves it only as
  PROOF-GRADE, or as retired: nothing relies on it any longer, recorded
  with what replaced it.

This is a schedule, never a discount. Every claim the work keeps is proven
and independently checked exactly as above, and only the order moves: no
kind earns a confidence, a lighter check, or a shortcut proof, and nothing
is dropped that the work still relies on. It is not a scope cut.

## What the build carries

A proof protects only the code that honours it. When the claim reaches a
build:

- each hypothesis becomes a named obligation in the implementing unit's
  definition of done (the input limit to enforce, the rounding direction,
  the exact arithmetic);
- the check's oracle and the claim's property tests are ported into the
  product's own test suite and named in that definition of done, so every
  later change re-checks the claim;
- the proof, the check, and every script behind them are filed with the
  work's durable artifacts (the design record, a run's evidence area, the
  repository), never only in a scratchpad or temp directory. A check
  nobody can re-run has become testimony.

## Reporting math

Up the chain and to the CEO, a heavy claim travels by its status:
PROOF-GRADE ("proven and independently checked"), REFUTED, or UNPROVEN
("not yet proven", with what is missing). It never travels as a
confidence percentage, and never as "validated", "sound", or "verified"
short of PROOF-GRADE. An agent that receives a math verdict phrased as a
confidence does not relay the number: it reports the claim as not yet
proven and bounces the deliverable ([verification.md](verification.md)).
Where proofs are scheduled by consequence, a report of the math also
gives the owed claims by kind, so the CEO can see what still stands
between the work and real users.

## Where it is enforced

- **Every delegated unit**: the brief asks for a proof, not an estimate
  ([briefing.md](briefing.md)); the adequacy pass refuses a heavy claim
  that is not PROOF-GRADE when its schedule says it is due
  ([verification.md](verification.md)); the
  report carries the status ([report.md](report.md)).
- **A tiered run**: specialists deliver a proof or a counterexample, never
  a confidence (tiered-orchestration's
  [role-prompt.md](../../tiered-orchestration/references/role-prompt.md),
  part 8); a design whose math lacks both artifacts cannot turn `binding`,
  or, under a schedule by consequence, lacks each claim's statement, kind,
  and status, or has one REFUTED
  ([design-passes.md](../../tiered-orchestration/references/design-passes.md),
  "The binding gate"); plan synthesis carries each proven claim's
  obligations into a unit's definition of done, and orders each owed
  kind-1 or kind-2 proof ahead of every unit that relies on it
  ([front-end.md](../../tiered-orchestration/references/front-end.md)).
- **Question review**: an answer that turns on heavy math returns a proof
  or a counterexample, never a confidence, and gets its own check
  ([question-review](../../question-review/SKILL.md)).
