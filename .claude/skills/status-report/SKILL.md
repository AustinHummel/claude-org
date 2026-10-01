---
name: status-report
description: >-
  Answer "where are things at" from the workspace, and keep the dashboard
  truthful. Use when the CEO asks for status — of everything, one quest,
  one area, or what happened / what agents worked on during some past day —
  and at every session close, when the dashboard lanes are refreshed.
  Covers the source order for building an answer, the answer shape (plain
  outcome first, option sets for decisions, links for drill-down, honest
  staleness), and the dashboard's format and upkeep rules.
---

# Status reporting

Status questions are the workspace proving its worth: the answer must come
from the files, arrive at CEO altitude, and hold up when drilled into.
Never answer status from conversational memory alone — memory is what this
workspace exists to replace.

## Source order

Walk down only as far as the question requires:

1. `DASHBOARD.md` — the at-a-glance answer; often sufficient for
   "where are we at".
2. The named quest file(s) — "Where things stand" is the current state;
   the Log index locates the chronology.
3. Recent daily logs — walk back from today as needed (a week of logs
   usually reconstructs any thread).
4. Org hubs — when the question is about knowledge ("what do we know
   about X?") rather than work.
5. `git log` — last resort, for "when did that change" questions the logs
   don't answer.

For "what were you / the agents doing on <day>": open that day's log; the
session narrative and every `Having a subagent ...` subtree IS the answer.
Summarize at outcome level and link the log for the play-by-play.

## The answer shape (CEO vocabulary)

- **Outcome first.** The first sentence answers the question; background
  follows for whoever wants it.
- **Plain language.** Internal machinery (unit numbers, agent hierarchies,
  file mechanics) stays out unless asked; what happened and what it means
  stays in.
- **One line per item** for multi-item status, each linking its quest or
  file for drill-down. The raw detail is one click away, never pasted.
- **Decisions come as option sets with a recommended default** — never a
  bare open question, and only for genuinely CEO-owned calls (money,
  commitments, direction). Everything else: decide, act, log.
- **Honest staleness.** If a lane hasn't moved, say since when ("untouched
  since 2026-07-16"), not a soft "in progress".
- **Gaps are named, not papered over.** If the workspace can't answer,
  say exactly what's missing and offer to open the quest or To-Do that
  would close the gap.

## The dashboard

`DASHBOARD.md` is the coordinator-owned board the CEO can read cold. Lanes:

- **Open quests** — table: quest link | status | one-liner. One row per
  open quest, no exceptions and no extras.
- **Waiting on <the CEO>** — every item blocked on them, so one glance
  answers "what do you need from me?"
- **Parked** — set-down quests, one line each on what would resume them.
- **Recently completed** — the last ~5 completions with dates; older rows
  drop (git and `quests/completed/` keep the rest).

Upkeep rules:

- Refresh a lane WHENEVER the underlying state changes, and sweep all
  lanes at session close (the CLOSE ritual in CLAUDE.md).
- Stamp `_Last updated: YYYY-MM-DD ..._` on every refresh.
- Rows are pointers, not prose: a one-liner and a link. The moment a row
  wants a second sentence, that content belongs in the quest's "Where
  things stand".
- The dashboard never contradicts a quest file. On conflict, the quest is
  the truth and the dashboard is the bug — fix it in the same breath.
