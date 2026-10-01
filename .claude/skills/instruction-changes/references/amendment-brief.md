# Briefing an amendment

Every other brief in the org buys quality by NARROWING: precise pointers,
a tight scope fence, your knowledge spent on STARTING POINTS
(orchestration skill, `references/briefing.md`). An amendment brief keeps
all of that for the FACTS and deliberately loosens it for the ANSWER. The
reason is the same one that sends the work to a fresh agent at all: you
are the context that just lived the problem, so your instinct about which
file to edit and how to word it carries your blind spots with it. Hand
over the evidence and let a clean reader diagnose.

Grounding is not prescribing. Say where things live; don't say what
should end up in them.

## What the brief must carry

1. **THE BEHAVIOR WANTED** — in the CEO's own words, quoted verbatim
   wherever you have them. Paraphrase loses exactly the nuance an author
   needs, and your paraphrase is already an interpretation.
2. **WHY IT MATTERS** — the cost of the current behavior, stated as
   consequence rather than theory.
3. **THE EVIDENCE** — the strongest section, and the one only you can
   write:
   - Your own performance under the CURRENT instructions, concretely: what
     you did, what the instructions said, where the two came apart, what it
     cost to fix. Include the failures. An amendment author writing from a
     sanitized account will harden the wrong thing.
   - Pointers, not retellings: the log entry, the commit, the file, the
     transcript moment. Let the author read the primary source.
   - Feedback from the CEO or a superior agent, attributed and dated.
   - The distinction between what you OBSERVED and what you CONCLUDED,
     kept visible in the wording.
4. **THE TERRAIN** — where the instruction set lives (skills directory,
   contracts, memory files, docs a contract makes binding), and every
   MIRROR that must stay in sync, with what may and may not differ between
   copies. This is fact, so state it firmly.
5. **GUARDRAILS** — the ones that constrain craft, not conclusions: honor
   doc-hygiene; update the maps and indexes; don't commit; report what
   changed, what was deliberately not changed, and every tension found
   with existing rules.
6. **THE MANDATE TO PUSH BACK** — say plainly that the author may conclude
   the behavior is already covered, that a different shape serves better,
   or that the change is a bad idea, and report that instead of
   manufacturing a diff. A brief that can only be obeyed produces doctrine
   nobody stress-tested.

## What must not be in it

- **A drafted diff or your preferred wording.** The author will anchor to
  it and you will have written the rule from the hotseat by proxy.
- **A required file list.** "Edit these three files" forecloses the
  judgment you delegated. Which files change is the deliverable.
- **Your diagnosis stated as fact.** "The orchestration skill is missing a
  section on X" is a hypothesis; write it as one.
- **Your assumptions as constraints.** Restrictions you cannot justify
  from the CEO's directive or observed evidence are noise wearing the
  costume of a requirement.
- **Transcript dumps and mood.** Same as any brief: restate, don't paste;
  urgency and praise spend tokens without buying quality.

## Direction without constraint

Pointing is allowed and often useful — the failure mode is pointing that
can't be refused. Mark every hunch as yours and revocable:

- Yes: "The orchestration skill already covers when a role should
  crystallize; that may be the natural home, or it may want its own skill
  — your call."
- No: "Add a section to the orchestration skill covering this."

## Worked example, compressed

    MISSION: The CEO has issued a standing directive about how this org
    changes its own instructions. Make it durable in the workspace's rules
    — you decide where it belongs and how it is expressed.
    THE DIRECTIVE, VERBATIM: "<quoted, unedited>"
    EVIDENCE FROM MY OWN PERFORMANCE: on <date> I authored <skill> at the
    tail of a long unrelated session and overstated its verification — it
    described an exploration as a live behavioral check. The CEO caught
    it; correcting the record took a full follow-up session (see
    log/<date>.md). Shape of the error: not a factual slip but an inflated
    confidence claim from a context too invested to audit itself.
    TERRAIN: the abstract skills live in <path> and are mirrored in
    <upstream path> — the two must stay byte-identical; anything specific
    to this principal stays out of the upstream copy. Contracts: <paths>.
    GUARDRAILS: honor doc-hygiene (read it; flag what it tells you to
    flag); update the skills index and maps in the same round; no commits.
    OPEN TO YOU: whether this is an edit to existing skills, a new skill,
    contract-level rules, or some combination — including concluding that
    part of it is already covered. Recommend against it if you think so.
    REPORT: per the orchestration skill's report.md, plus what you chose
    NOT to do and any tension you found with existing instructions.
