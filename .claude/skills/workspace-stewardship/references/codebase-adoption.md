# Adopting a codebase

The path for absorbing an existing repo the org will own — imported,
inherited, or one that grew in-house without documentation — and bringing
an agent's understanding of it up to the agent-maintainability bar. The
deliverable is not a report; it is a repo a FRESH agent can safely work in.

Adoption is a quest: its acceptance criteria are the bar (entry contract,
verification command, architecture skill, doc-hygiene shape) plus the
stranger validation below.

## The protocol

1. **Register and open the quest.** The pointer file in the owning area
   (canonical URL, one-line purpose, contract location "pending
   adoption"), a dashboard lane, and the quest with the bar as acceptance
   criteria.

2. **Survey with a parallel read-only batch** (orchestration skill — the
   one case where parallel is safe). One angle per agent, each returning
   file:line evidence, not impressions:
   - Purpose, entry points, and how it actually runs.
   - Module map and dependency shape (what owns what; what imports what).
   - The strongest existing patterns — the code's own design philosophy in
     embryo, found where the code is most consistent.
   - Verification reality: what tests exist, whether they run, what green
     currently means, what is flaky or lying.
   - Danger zones: debt, dead code, load-bearing hacks, anything secret-
     or credential-shaped that must not move.
   Safety note: READ before RUN — review scripts, hooks, and build steps
   from a third-party repo before executing anything.

3. **Unit zero: the verification command.** Establish it before touching
   anything else — nothing can be safely changed in a repo where green is
   undefined. Run the existing suite if there is one and record the exact
   command, the environment quirks, and what green means. If there is
   none, BUILD the thinnest honest one (it builds, it starts, one
   end-to-end assertion) as its own unit.

4. **Write the entry contract** (`CLAUDE.md` or `AGENTS.md`): what the
   system is, the hard constraints that void work, how to run it, how to
   verify it. Written from survey evidence, not aspiration — a constraint
   nobody confirmed is a guess wearing a rule's clothes.

5. **Write the architecture skill** from the template
   ([architecture-skill-template.md](architecture-skill-template.md)),
   with the philosophy DERIVED from the code's strongest existing
   patterns — document the design the code already argues for, don't
   impose imported taste. Where the dominant pattern and the actual code
   contradict, the code wins and the tension is recorded as debt, not
   doctrine. Thin and true beats thick and aspirational.

6. **Validate with a stranger.** Dispatch a fresh agent with ONLY the new
   docs and one small real task (a trivial bug, a small additive change).
   It must place and complete the work without spelunking beyond what the
   docs predict. Every place it stumbled is a place the docs failed:
   revise, and re-run the stumble. This is the intuition test, executed
   instead of assumed.

7. **Close.** Pointer file completed, org map updated, the quest closed
   with the org-side one-liner. Depth stays in the repo; the org keeps
   altitude.

## Cautions

- **Adoption documents what IS; it never refactors.** Improvement
  candidates surfaced during the survey are listed in the quest's caveats
  and become their own later quests. Mixing understanding-work with
  changing-work corrupts both.
- **Big repos start as a thin hub.** The first architecture skill covers
  the two or three areas genuinely understood and says so; coverage grows
  as work touches new areas (stewardship's maintain-after rule does the
  rest).
- **Do not trust inherited tests blindly.** A suite that passes may
  encode wrong behavior or skip the paths that matter; unit zero includes
  reading what the tests actually assert, not just running them.
