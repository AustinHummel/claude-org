---
name: doc-hygiene
description: >-
  The context-library discipline: keep every document in the workspace
  structured as a hierarchy of small-to-medium files where each file serves
  one altitude and links deeper detail, so a reader can choose how deep to
  go. Use whenever you create or edit any skill, README, org file, quest, or
  contract; whenever ANY file you had to read felt too long or too mixed to
  hold in mind; and whenever planned work would add to a file that is
  already oversized. Covers bloat signals and size thresholds, splitting a
  file into a hub with spokes, the duty to flag deviations without being
  asked, and reorganizing safely.
---

# Doc hygiene: the context library

Every document an agent might read is part of one library, and the library
has a shape: a HIERARCHY of small-to-medium files, each written at one
altitude, each linking downward to detail. A reader (human or agent) enters
at the top and descends exactly as far as the task requires, paying only
for the depth it chose. That choice is the whole point: context windows are
budgets, and a flat 900-line file forces every reader to buy everything to
find anything.

This applies to org files, quests, skills, contracts — and to the code of
any sub-repo the org grows (a source file is also read by budgeted
readers).

Editing an INSTRUCTION file (a skill, a contract, a memory file) carries a
second discipline on top of this one — who is allowed to write the change,
and under what conditions (instruction-changes skill). This skill governs
the shape; that one governs the authorship.

## The shape of a healthy node

- One altitude per file: a file either orients (what exists, where to look)
  or details (how one thing works), not both at once.
- Small to medium: roughly a screenful to a few hundred lines. Around 500
  lines a doc becomes a split candidate; past that, splitting is the
  default and keeping it whole needs a stated reason.
- Links, not inclusions: a hub names each spoke and says when to descend
  ("read compliance.md when a filing or deadline is in play"). A detail
  lives in exactly one spoke; the hub never restates it, because
  restatement is how two copies start to disagree.
- Stable entry points: the top of the hierarchy (CLAUDE.md, org/README.md,
  a skill) changes rarely; churn concentrates in the leaves.

One deliberate exception: **daily logs are chronicles, not library nodes.**
They grow by the day's events and are never split or summarized-in-place;
their discipline is the daily-log skill's bullet structure. Everything else
in the workspace is library.

## Bloat signals (any one is enough to flag)

- You scrolled a file twice looking for the part that mattered.
- A file answers "what is this" and "how does the detail work" in the same
  breath (an org hub that carries a full fee table; a quest whose overview
  buries the acceptance criteria under research notes).
- Editing one concern means scrolling past five others.
- A paragraph restates something another file already owns.
- Appending is the only structure: the file grew by accretion at the bottom.

## The standing duty

Flagging is not a favor; it is part of every task. The CEO will not ask,
because the rot is invisible from outside, so the agents working in the
library are the only maintainers it has. When a file you are working in (or
were forced to read) shows the signals:

1. SAY SO — to the CEO, or to your parent agent via the ESCALATIONS section
   of your deliverable report. Two sentences suffice: the file, the signal,
   the cost it is imposing on the current work.
2. Do not silently restructure mid-task, and do not silently absorb the
   pain either. The decision (fix now, later as its own unit, or not at
   all) belongs one level up, because it trades against work you cannot
   see.
3. The same duty covers deepening a violation: when a requested edit would
   add section eight to a file already showing the signals, flag before
   adding.

## Reorganizing safely

A restructure is its own ISOLATED unit, never mixed into content work:

- One reorganization at a time, committed separately, so a bad move is one
  revert.
- After any move or rename, walk the links: grep the old path across the
  workspace until it returns zero hits, and confirm every touched hub
  still says when to descend.
- Update the maps (org/README.md, the CLAUDE.md map table) in the same
  unit — a stale map actively misleads (workspace-stewardship skill).
- In a code sub-repo, the repo's own verification suite must be green
  before and after; a refactor with no regression check didn't happen.

## Growing the library without bloating it

New knowledge goes to the file that owns its altitude. When no file owns
it, add a spoke and link it from the hub, rather than widening the nearest
file. When a spoke outgrows itself, split it and promote its heading to a
small hub. A library whose links lie is worse than a monolith, because it
teaches readers to stop descending.
