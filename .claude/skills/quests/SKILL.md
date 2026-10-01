---
name: quests
description: >-
  Structure and maintain quest documents: the durable, problem-driven
  work-tracking files under quests/. Use when creating, advancing, parking,
  or completing a quest; writing its problem statement, approach, acceptance
  criteria, or origination; deciding what belongs in a quest versus the
  daily log; or parking To-Dos when work pauses. Pairs with the daily-log
  skill, which governs the chronological work log the quest links into.
---

# Quests

A quest is the org's unit of problem-driven work: ONE durable document that
frames a problem and tracks the work to resolve it, at `quests/<name>.md`
(kebab-case, no emoji; status lives inside the file, never in the name).
The chronological work itself is logged day by day in the daily log; the
quest is the stable overview a reader opens first.

## Quest vs daily log: the division of labor

- **The quest holds durable, high-level context**: the problem, the chosen
  approach, why it fits, the acceptance criteria, where the quest came
  from, and a current "where things stand". It reads as a stable overview.
- **The daily log holds the chronology**: investigation, dead ends,
  dispatches, findings — everything done to reach the acceptance criteria,
  logged per the daily-log skill, grouped under a link to the quest.
- **The quest indexes the chronology instead of duplicating it.** Each day
  that advances the quest adds one line to the quest's Log index, linking
  the daily note. Never paste the day's bullets into the quest: a detail
  lives in exactly one place, and the log is that place.

Do not write dated investigation logs into the quest body. That is
daily-log content; embedding it bloats the overview and forks the truth.

## Anatomy

```markdown
# Quest: <plain-language name>

Status: active | waiting | parked | complete
Opened: YYYY-MM-DD · Closed: YYYY-MM-DD (when complete)

## Problem
What is wrong, or what needs to exist — stated at a level that holds for
the whole quest.

## Approach
The chosen way to resolve it, and (only if not obvious from the acceptance
criteria) why it addresses the problem.

## Acceptance criteria
The conditions that define done. Stable: they change only when new
information invalidates the approach itself, not as follow-ups accrue.

## Origination
Who raised the problem, who proposed the approach, who green-lit it —
dates and links wherever possible.

## Where things stand
2–6 lines, REPLACED (not appended) each session that advances the quest:
the current state, the next step, and what it's waiting on. Stamped with
the date of last update.

## Log index
- YYYY-MM-DD — one line on what moved — [log](../log/<year>/<file>.md)

## Parked To-Dos
(Only while parked; see below.)
```

## Acceptance criteria vs To-Dos

- **Acceptance criteria** are the stable definition of done. They live here.
- **To-Dos** are transient follow-ups (cleanup, integration, deferred
  verification) surfaced while working. They live in the daily log, execute
  in order, and ride forward day to day (daily-log skill).

A To-Do list that grows or shrinks does not mean the criteria changed.

## Parking a quest

When a quest will be set down for a while, move its open To-Dos from the
daily log into the quest's `## Parked To-Dos` (marking the daily copies
`[>]`), set `Status: parked`, update "Where things stand" with why and what
would resume it, and refresh the dashboard lane. On resume, the parked
To-Dos move back out into the active day's log and the section empties.
This is the one case where transient To-Do content lives in a quest; keep
it visually separate from the stable acceptance criteria.

`Status: waiting` is the softer state: the quest is live but blocked on a
person (usually the CEO); name what it's waiting for in "Where things
stand" and mirror it in the dashboard's waiting lane.

## Completing a quest

When the acceptance criteria are met:

1. Set `Status: complete` with the Closed date; final "Where things stand"
   states the outcome in one or two lines.
2. Make sure durable knowledge the quest produced is filed in `org/` —
   a quest is not an archive of facts; it points to where they were filed.
3. Move the file to `quests/completed/` (create it on first use).
4. Update every inbound link (grep for the old path), refresh the dashboard
   (out of open lanes, into recently-completed), and log the completion in
   today's daily note.

Completion is coordinator work, but it follows the CEO's word when
"done-ness" is a judgment call — when in doubt, present the evidence
against the acceptance criteria and ask.
