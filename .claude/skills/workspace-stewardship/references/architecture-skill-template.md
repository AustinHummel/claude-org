# Template: a repo architecture skill

Copy this shape when creating a code sub-repo's architecture skill
(conventionally `.claude/skills/<repo>-architecture/SKILL.md` inside that
repo). Replace every bracketed slot; delete a section that honestly has no
content yet. Keep the first version small: a thin true skill beats a thick
aspirational one.

    ---
    name: [repo]-architecture
    description: >-
      Design philosophy and placement guide for [repo]. Use before
      designing, placing, or reviewing any feature, module, or [domain
      object] in this codebase; covers [the two or three load-bearing
      principles], the extension points, and where new [features / objects
      / surfaces] belong.
    ---

    # [Repo] architecture

    [Two or three sentences: what the system is, and the one organizing
    idea that explains most of its shape.]

    ## Load-bearing principles

    [Three to seven bullets. Each states the rule, then the failure it
    prevents. These are the sentences an agent should be able to recite
    after one read.]

    ## The map, at orientation altitude

    [One short block per layer or major module: what it owns, what it must
    never own. Link each to its detail spoke or primary source file rather
    than describing internals here.]

    ## Extension points

    [For each kind of growth the repo expects (a new object type, a new
    export format, a new command): where it plugs in, the contract it
    implements, and the worked example to copy from.]

    ## Boundaries and non-goals

    [What stays out of which layer; dependencies that must not form; the
    tempting shortcuts this architecture deliberately forbids, each with
    the failure it would cause.]

    ## Verification

    [How an agent proves an architectural change kept the system whole:
    the suite command, what green means, what new coverage is expected.]

## Maintenance notes

- The description must name the concrete trigger moments (designing,
  placing, reviewing) so the skill activates for an agent that does not
  know it exists.
- Spokes (detail files under references/ or docs/) hold module internals;
  the skill body stays at orientation altitude per the doc-hygiene skill.
- Every update should leave the intuition test stronger: reread the skill
  asking "could a stranger place the next feature with only this?"
- The org-side rule (workspace-stewardship): a change that alters the
  repo's shape updates this skill in the same round, and the org's map
  entry for the repo stays one line — depth lives here, not in the org.
