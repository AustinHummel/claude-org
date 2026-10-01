# Writing the subagent brief

The subagent cannot see your conversation, your reasoning, or the other
units. The brief is the ONLY channel, so treat it as a context-engineering
exercise: everything the unit needs, nothing it does not. Err toward
precise pointers (paths, section names, grep hints, URLs) over prose; the
subagent can read files, but it cannot read your mind.

## Structure

Every brief carries these sections. Order matters less than completeness.

1. MISSION: one paragraph. What exists now, what should exist when done,
   and why the CEO wants it — the why lets the subagent make sane
   micro-decisions you did not foresee.
2. WORKSPACE FACTS: the workspace root; the contract to read first (the
   workspace `CLAUDE.md`, or the sub-repo's own `CLAUDE.md`/`AGENTS.md` for
   a code unit); the org map (`org/README.md`) when the unit files
   anything; and the hard constraints that void work when violated (naming
   conventions, provenance rule, no pushes, the sub-repo's build rules).
   For a code unit include the ENVIRONMENT DELTAS you established at
   grounding time: the exact verification command as it works on THIS
   machine, and any shared live state. A subagent that must re-derive the
   environment wastes its context on your job.
3. STARTING POINTS: the specific files / sections / sources involved, each
   with a one-line why ("the compliance facts collected so far live
   here"). Grep hints beat directory tours. This section raises quality
   more per word than any other; spend your own knowledge filling it. Two
   rules of honesty: phrase facts you have only INFERRED as checks, not
   claims ("check org/company/ for an accounts list", never a confident
   wrong pointer the unit will follow off a cliff); and when a prior unit
   established a convention worth compounding, name it explicitly so the
   pattern propagates instead of being reinvented.
4. SCOPE FENCE: what is explicitly OUT (neighboring problems, tempting
   reorganizations, the other units in flight). Instruct: an obstacle
   outside the fence is ESCALATED in the report, never absorbed silently
   and never fixed silently.
5. DEFINITION OF DONE: observable outcomes, not activities — the artifact
   at its path, the questions answered with sources, the suite green. For
   research: what claims must be sourced and how fresh the sources must be.
   For math past basic arithmetic: a written proof, never an estimate or a
   confidence; its independent check is a separate unit
   ([proof-grade-math.md](proof-grade-math.md)).
6. GUARDRAILS: no commits unless told (the coordinator integrates); write
   only within the named area; read the companion skills by path
   (doc-hygiene, workspace-stewardship; the daily-log skill only if the
   unit appends to the log, which is normally the coordinator's job).
7. REPORT CONTRACT: point at the orchestration skill's `report.md`, plus
   exactly what evidence you expect: sources with dates, the artifact
   path, suite output tail, before/after behavior.

**One deliberate exception.** A unit that changes the org's OWN
instructions — a skill, a contract, a memory file — inverts rule 3: it
supplies the evidence and leaves the diagnosis open, because the agent that
lived the problem is the wrong one to prescribe the fix. Brief it per
[../../instruction-changes/references/amendment-brief.md](../../instruction-changes/references/amendment-brief.md).

## What to leave out, deliberately

- Your conversation history and the CEO's phrasing quirks. Restate; never
  paste transcript.
- The other units. Awareness of the round tempts a subagent to widen scope.
- Alternatives you already rejected, unless the rejection is itself a
  constraint ("do not propose a second dashboard; one exists by design").
- Praise, urgency, and role-play. They spend tokens on mood, not quality.

## Sizing the unit to one context

A subagent that must read half the workspace before acting was briefed too
wide: split the unit, or spend more of your own time on STARTING POINTS. A
brief that fits in three lines is too thin to verify: it is missing its
definition of done. When you can already tell a unit is too large for one
agent, say so in the brief and point at the orchestration skill so the
subagent runs its own round one level down; require its report to disclose
that delegation.

## Worked example, compressed

    MISSION: The org has no picture of the company's state compliance
    status. Establish it: what filings the state expects from an LLC, which
    the company has missed, and what reinstatement takes. The CEO is
    deciding whether to revive or dissolve; the answer shapes that.
    WORKSPACE FACTS: root <the workspace root>. Read CLAUDE.md first (hard
    rules: facts carry provenance; never guess; markdown links). Filing
    target: org/company/compliance.md (new spoke; add it to the org map).
    STARTING POINTS: org/company/README.md holds the confirmed formation
    facts (state, year); quests/business-snapshot.md section "Intake
    answers" holds what the CEO has confirmed so far; the state's business
    portal is the authoritative source — prefer it over aggregator sites.
    SCOPE FENCE: compliance only — no tax analysis, no bank/EIN work, no
    reorganizing org/company/. Escalate contradictions with filed facts.
    DEFINITION OF DONE: compliance.md exists, states each obligation with
    its deadline/fee and a source link + access date, and ends with a
    "current standing" section; the org map lists the new spoke.
    GUARDRAILS: no commits; write only under org/company/; read
    .claude/skills/doc-hygiene/SKILL.md and honor it.
    REPORT: per the orchestration skill's report.md; evidence = the source
    links and the file path.
