---
name: daily-log
description: >-
  Write the org's daily log in rabbit-hole style: hierarchical bullets where
  the structure itself carries the context. Covers the file skeleton (Plan /
  To Do / Notes), the voice grammar (coordinator first-person default, the
  CEO as a named actor, "Having a subagent X" parents gating delegated
  subtrees), the established-context-path invariant and its audit, the
  day-start context rebuild, the To-Do lifecycle and status glyphs, and the
  post-completion refactor. Use whenever appending to, creating, or editing
  a log/<year>/YYYY-MM-DD-*.md file — which is every working session — and
  especially when dispatching a subagent whose outcome will be logged. Not
  needed when only reading logs for context.
---

# Daily log: the org's chronological memory

The daily log is the org's source of truth for WHAT HAPPENED: every session's
actions, findings, decisions, and dead ends, in order, kept by the
coordinator. Quests hold the durable overview of each piece of work; `org/`
holds settled knowledge; the log holds the story. Months later, "why did we
do X?" and "what was that agent doing on the 12th?" are answered here.

## The file

One file per day: `log/<year>/YYYY-MM-DD-ddd.md` (e.g.
`log/2026/2026-07-16-wed.md`). Multiple sessions in one day append to the
same file. Skeleton:

```markdown
# 2026-07-16 (Wed)

## Plan

## To Do

## Notes
```

- **Plan**: the day's intended focus — usually links to the quests being
  advanced. Short; it frames the day, it doesn't track it.
- **To Do**: the day's checklist (lifecycle below). Group items under a
  quest link when they belong to a quest.
- **Notes**: the chronological, hierarchical work log. The heart of the file.

## Voice grammar

The log is written by the coordinator, so the default implicit subject of
any Notes bullet is **the coordinator**, in present participle:

- `Drafting the intake questions for the company snapshot`
- `Filing the formation date under org/company/`
- `Asking the CEO to confirm which bank accounts exist`

Two other actors appear, and both must be explicit:

- **The CEO is always named.** `The CEO reported the LLC was formed in
  2019`, `The CEO approved option A`. Never absorb a CEO statement into the
  default voice — an unattributed fact reads as the coordinator's own
  finding, and provenance is a prime rule. (The CEO's name is in
  `CLAUDE.md`; use it.)
- **`Having a subagent <verb> ...` gates a delegated subtree.** The parent
  names the dispatch; the children are written in the subagent's first-person
  voice (present participle), never third person — the parent already named
  the actor. Log the unit's essentials: key findings, the outcome, and a
  final result line. Link big artifacts instead of pasting them.

```markdown
- Having a subagent survey the state's LLC reinstatement requirements
	- The state marks an LLC delinquent after two missed annual reports
	- Reinstatement needs the back reports plus a $150 fee, filed online
	- Wrote the full requirements to org/company/compliance.md
```

Anti-patterns: referring to yourself in third person ("Claude updated the
dashboard" — wrong; `Updating the dashboard`); attributing your own actions
to the CEO; leaving a delegated subtree ungated (readers can't tell who did
the work).

## Structure: the hierarchy carries the context

The invariant every structural rule serves: reading an entry's **established
context path** — its ancestors root-to-leaf plus the preceding siblings
along that chain — must give a full understanding of what is being done and
why, with nothing imported from your own head, the chat, or another note.
If an entry can't be understood from its path, context is missing, and the
fix is usually structural, not a rewording:

- **Define the referent inline** in an ancestor or preceding sibling — the
  actual finding, the actual decision — never a "see yesterday" pointer.
- **Add a preceding sibling** when it isn't obvious why a child belongs to
  its parent, or when it matters that something came before it.
- **Promote a decision into an activity parent** when the bullets after it
  are really its steps (don't stack the same idea at two altitudes).
- **Anchor work to the quest goal it advances**: group a day's entries under
  a parent named for the acceptance criterion or goal they serve, so every
  entry beneath inherits the "why".
- **Prune entries that earn no place.** An entry earns its place by adding
  forward context or historical insight; a dead-end aside that adds neither
  is removed, even one you just wrote.

Your own wording tells you where context is missing. Scan for the tells:
emphasis on a term (`the HOLD`), definite articles ("the root cause" — was
it introduced?), loaded verbs presupposing prior state ("*re*-running",
"*confirming*"), and unintroduced jargon. Each tell marks a referent; chase
it — if no ancestor or preceding sibling establishes it, fix the structure.

Two rhythm rules: earlier siblings frame what follows; the **last sub-bullet
of each section is the result** — a resolution ("X is done; outcome") or a
handoff ("Can't do X without Y") that flows into the next sibling.

## Rebuilding context at the start of a new day

Each daily file resets the hierarchy, so yesterday's five-deep work loses
its ancestors. Before logging the day's first new action on continuing
work, rebuild the chain: re-create the parents down to where work left off
(typically leading with "Continuing X"), and add a preceding-sibling recap
stating where things stand — the actual prior finding and decision inline,
not a pointer. If understanding today's opening entries would require
opening yesterday's note, the rebuild is incomplete.

```markdown
- [Business snapshot](../../quests/business-snapshot.md)
	- Continuing the compliance research
		- Yesterday established the LLC is delinquent: two missed annual reports, $150 to reinstate
		- Drafting the reinstatement filing checklist
```

## Brevity

- One action per bullet; ~20-word soft target. A 60-word bullet wants to be
  a parent with 2–4 children.
- Present-participle lead; precise verbs (`create` not `file`, `implement`
  not `ship`, `resolve` not `land`).
- Multi-item parenthetical lists become sub-bullets under an umbrella child.
- No em-dash chains ("X — but Y, even though Z"): split.
- No duplicated setup across consecutive bullets: hoist it into a parent.
- Links: markdown links, relative to the log file; external URLs inline.

## Status prefixes

- `⛔` blocked: work cannot proceed until an external dependency clears;
  nest the blocker underneath as the cause.
- `⚠️` waiting: softer — waiting on a person or a response.
- `✔️` To-Do captured: a child stating a surfaced follow-up was parked as a
  To-Do, so nothing mentioned in passing is lost:

```markdown
- Drafting the annual-report filing, not yet submitted
	- ✔️ Adding a to-do to have the CEO review before submission
```

Pending work can also read as a forward-motion activity with the blocker
and a `✔️` capture nested beneath, instead of leading with a stall prefix.

## To-Do lifecycle

To-Dos are pointers to deferred work, not specifications (~10-word soft
target; strip justification and discovery context — that's Notes material).
They execute top-to-bottom; keep them in intended order. Status glyphs:

- `[ ]` not started — valid only on the CURRENT day's note
- `[/]` in progress
- `[>]` forwarded to the next day's note, or parked into a quest
- `[-]` cancelled / no longer required
- `[x]` complete

At the day-start rebuild, carry unfinished items into the new day and mark
the old copies `[>]`. When a quest is being set down for a while, park its
open To-Dos into the quest file instead (quests skill) — same `[>]` on the
daily copy. A To-Do list growing or shrinking is normal and never implies a
quest's acceptance criteria changed.

## Refactor after completion, never during

Work under one `Doing X` parent until X is actually complete — don't
context-switch mid-task to prettify structure. Afterwards, if the subtree
surfaced a permanent change Y in a separate concern that completing X never
implied: rename the parent `Trying to do X`, end its subtree with `Can't do
X without Y`, break out `Doing Y` as a same-level sibling, then `Trying X
again`. Collapsed, the top level then reads as the meaningful work units in
discovery order. Sub-tasks of X — however deep — stay nested; promote only
separate-concern permanent changes, and never promote out of a parent named
for a To-Do (its framing makes everything beneath it part of X).

See [references/worked-examples.md](references/worked-examples.md) for
full before/after examples of the audit, the refactor, and voice fixes.

## When NOT to apply

This skill governs daily log files only. Quest documents follow the quests
skill (durable overview, not chronology); `org/` files are reference
material in plain instructional prose; `DASHBOARD.md` follows the
status-report skill. For those, fall back to the target file's own
conventions.
