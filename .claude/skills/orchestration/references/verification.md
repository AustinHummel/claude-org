# Verifying a deliverable

You own what you integrate. The subagent's report is testimony, not proof;
verification turns it into something the workspace (and the next unit) can
safely build on.

## The adequacy pass (every unit)

1. Read the report against the brief's DEFINITION OF DONE, line by line. An
   outcome without evidence is not done, however confident the prose.
2. Check the artifact itself, from your own seat:
   - **Research**: spot-check the load-bearing claims against their cited
     sources — open one or two, confirm the source says what the report
     says it says, and that dates/amounts survived transcription. A claim
     with no source fails the provenance rule and bounces.
   - **Drafts / filings**: read the artifact top to bottom once; check it
     against the map (is it where workspace-stewardship predicts?) and
     against doc-hygiene (one altitude, links resolve).
   - **Reorganizations**: walk the links (grep the old paths — zero hits
     means done); confirm hubs still say when to descend.
   - **Code units**: re-run the sub-repo's verification suite yourself even
     though the subagent already did — this catches the two classic
     failures: a suite that was never actually run, and a tree that differs
     from what the report describes. Inspect the diff against CHANGED; an
     edit to an existing test is either called for by the brief or a red
     flag, never skimmed past.
   - **Math past basic arithmetic** (in any unit type): each such claim
     the deliverable rests on is PROOF-GRADE, a written proof plus a
     second mathematician's independent PROOF-VERIFIED
     ([proof-grade-math.md](proof-grade-math.md)). Where the CEO has
     scheduled proofs by consequence, a claim not yet due may instead be
     recorded UNPROVEN with its kind and reason, which you check; nothing
     may present it as settled. Re-run the checker's
     oracle yourself, as you would a suite, and read the proven statement
     against the claim the work relies on: a proof of a narrower statement
     (fewer inputs, an extra hypothesis) is the classic gap. A math verdict
     phrased as a confidence percentage is not a verdict; bounce it.
3. Confirm the scope fence was respected: nothing outside the named area
   moved.

When a deliverable is inadequate: prefer ONE bounce back to the same agent
with the specific gaps named (its context is still warm and the fix is
usually small). Relaunch fresh with a corrected brief when the gaps trace
to the brief itself, or the agent has visibly drifted. More than two
bounces means the unit or the brief is wrong: stop and re-decompose.

A unit's agent can also DIE mid-flight, leaving partial work with no
report. Recovery is not a rerun: assess what exists first (is it coherent,
was it ever checked), then relaunch with a FINISH-THE-ORPHAN brief that
hands over the partial deliverable as inherited input needing validation.
The trap: artifacts the dead agent wrote but never validated carry their
own errors; the finisher re-derives every claim, not trusting the orphan's
classifications.

## Deciding on a dedicated adversarial checker

The maker's own checking covers the unit; the AFFECTED INTEGRATIONS section
of its report maps what sits beyond it. Spin up a separate checker when:

- the map names surfaces where an error has real cost (legal/compliance
  claims, money amounts, anything the CEO will act on, persistence and
  export paths in code), or
- the change rewires something many other things sit on, or
- the reports below disclose that a named surface was never deep-checked by
  anyone.

Math past basic arithmetic is the one case that is not a judgment call: its
independent checker, a second mathematician, is always owed, and you stand
it up yourself rather than letting the maker brief it
([proof-grade-math.md](proof-grade-math.md)).

Keep the checker independent and adversarial: give it the affected
surfaces and the instruction to try to BREAK the deliverable — find the
claim that doesn't hold, the link that lies, the integration that regressed
— not to confirm the maker's story. Withhold the maker's reasoning; fresh
assumptions are the point of a second agent. Its deliverable is the same
report format, where VERIFIED carries the weight.

## What NOT to re-verify

Read the DELEGATION DISCLOSURE before spending anything. Checking already
evidenced at a lower level, with real commands, counts, and sources, is
trusted, not repeated. Your budget goes to the seams a lower level could
not see: the integration between units, and the affected surfaces nobody
below owned.
