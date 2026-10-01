# Proof-grade math: proven, independently checked, never estimated

In math, close does not count. A claim that a design, a build, a decision,
or a figure someone will rely on rests upon is either true for every case
it covers or it is not, and a confidence percentage cannot say which. So
any math past basic arithmetic is proven by one mathematician agent and
checked by a second, independent one before anything rests on it, and it
travels by its proof status, never by a confidence. Math that certifies
safety (a limit is never crossed, a deadline is never missed) is where
this matters most: there, a probably-right proof is a promise the work may
break.

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
but nothing may rest on it (no design, build, decision, or figure or
guarantee a person will rely on), and no report may present it as
settled. When a claim resists proof, every remedy is a fix: prove it;
replace it with a weaker claim that is proven (a certified conservative
bound instead of an exact optimum, a finite horizon instead of "forever");
or narrow the domain to where the proof holds and make the system enforce
that domain. What is never available is proceeding on it with a
confidence or a recorded rationale, the acceptance path other findings
have.

The bar holds whoever proposed the math, a specialist, the lead, or the
CEO: authority settles what to build, never whether a formula is true. And
the label is not the artifact: a math claim labelled "validated", "sound",
or "verified" without the proof and the PROOF-VERIFIED check is UNPROVEN,
whenever it was labelled, and new work that would rest on it first brings
it up to this bar.

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

## Where it is enforced

- **Every delegated unit**: the brief asks for a proof, not an estimate
  ([briefing.md](briefing.md)); the adequacy pass refuses a heavy claim
  that is not PROOF-GRADE ([verification.md](verification.md)); the
  report carries the status ([report.md](report.md)).
- **A tiered run**: specialists deliver a proof or a counterexample, never
  a confidence (tiered-orchestration's
  [role-prompt.md](../../tiered-orchestration/references/role-prompt.md),
  part 8); a design whose math lacks both artifacts cannot turn `binding`
  ([design-passes.md](../../tiered-orchestration/references/design-passes.md),
  "The binding gate"); plan synthesis carries each proven claim's
  obligations into a unit's definition of done
  ([front-end.md](../../tiered-orchestration/references/front-end.md)).
- **Question review**: an answer that turns on heavy math returns a proof
  or a counterexample, never a confidence, and gets its own check
  ([question-review](../../question-review/SKILL.md)).
