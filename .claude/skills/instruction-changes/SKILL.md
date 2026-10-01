---
name: instruction-changes
description: >-
  How the org amends its own rules. Two duties: recognize when a request is
  really a standing preference and OFFER to make it permanent, and make
  every change to an instruction file — any skill, CLAUDE.md / AGENTS.md
  contract, memory file, or agent/command definition — through a fresh,
  dedicated, maximally capable subagent instead of editing inline from a
  working seat. Use when the CEO says "from now on", "going forward",
  "always" / "never", or corrects HOW you work rather than what you
  produced; when anyone asks to update, fix, harden, or add a skill or
  contract; and when your own failure suggests the instructions are what
  was wrong. Covers what counts as an instruction file, the hotseat test,
  briefing an amendment without dictating its answer, and keeping mirrored
  copies in sync.
---

# Instruction changes: how the org amends itself

Contracts, skills, and memory are the only artifacts that change how EVERY
future session behaves. Editing one is not a document edit; it is a change
to the org's operating system, and it compounds silently — nobody re-reads
a rule to ask whether it earned its place. Two failure modes justify the
ceremony this skill imposes:

- **The rule that never got written.** The CEO says how they want things
  done, the session complies, and the preference dies with the context.
  They have to say it again next week — or don't, and assume it stuck.
- **The rule written by an invested context.** An agent that just did the
  work is the worst available author of the rule describing it. It writes
  from what it remembers instead of what is true, inherits every blind
  spot the work left it with, and overstates its own confidence: the
  errors it could not see while working are exactly the ones it cannot see
  while writing them down as doctrine.

The discipline answers both: notice and offer, then hand the writing to an
agent with nothing at stake.

## What counts as an instruction file

The test is behavioral: **if an agent's future behavior changes because
the file says so, it is an instruction file.** In practice:

- `.claude/skills/**` — every SKILL.md and every reference under it.
- Any coordinator contract: the root `CLAUDE.md`, a sub-org's `CLAUDE.md`,
  a sub-repo's `CLAUDE.md` or `AGENTS.md`.
- Agent memory files, and any doc a contract makes binding (a coding bar,
  a house style, a philosophy read at bootstrap).
- Agent, command, and hook definitions whose prose a model reads.

Knowledge is not instruction: org files, quests, logs, the dashboard, and
descriptive READMEs record what is TRUE, not what agents must DO. Three
carve-outs keep the rule from swallowing routine work:

- **Recording a fact** in a contract's standing facts or a dashboard lane
  — bookkeeping, not a rule change.
- **Instantiating** a template's placeholders (bootstrap) — creation, not
  amendment.
- **Mechanical repair** — a dead link, a moved path, a typo that changes
  no behavior.

When you cannot tell which side of the line an edit sits on, it is an
amendment. Dispatching costs one subagent; a rule quietly rewritten by a
busy seat costs every session after it.

## 1. Hear the standing preference, and offer

Requests arrive as one-offs and frequently are not one-offs. Listen for
the standing shape:

- Explicit: "from now on", "going forward", "always", "never", "by
  default", "stop doing X".
- Implicit: a correction of your METHOD rather than your output ("you
  should have asked me first"); a preference stated while fixing
  something; the same ask arriving for the third time; approval of a way
  of working, not just a result.

Do both halves. Comply now — and ASK whether they want the instructions
updated so it holds for every future session and every agent, not just
this context. Name what would change in BEHAVIOR, not which files you
would edit: the CEO is deciding whether this is permanent, not reviewing a
diff.

- The answer is theirs. Never amend silently on a hunch, and never let the
  signal evaporate silently either. A "no" makes it a one-off — comply,
  record the decision, and don't re-ask every time it recurs.
- The offer is immediate; the change need not be. If your seat is busy
  (below), offer now and either background the dispatch or capture the
  amendment as a To-Do with its evidence attached while it is fresh.
- Log the offer and the answer. "We decided in July not to make that a
  rule" is worth as much as the rule.

## 2. The hotseat: a busy seat never writes the rules

You are in the hotseat when any of these is true:

- Your context is already carrying a long thread of unrelated work.
- You are mid-round with units in flight, or the CEO is waiting on you.
- You did — or drove — the very work the change would describe. Investment
  is the disqualifier, not fatigue.
- You are being pushed for speed, or the edit feels too small to bother
  delegating. ("It's one line" is how doctrine gets written by accident.)

If you can't state the change without recounting what you were doing, you
are too close to it. The remedy is never to postpone the org's compliance
— it is to delegate, which costs the busy seat almost nothing: background
the dispatch and keep talking (orchestration skill, "Interruptions").

## 3. Dispatch a fresh, dedicated, maximally capable agent

One agent, one amendment, empty context, nothing else in its window.

- **Fresh context** means the change is described to it, not remembered by
  it. Never reuse an agent that already worked on the subject matter.
- **The conversation seat is never the author** — not even early in a
  session when your context feels empty. You will keep talking after the
  edit, and you cannot select your own model. "Always dispatch" is the rule
  precisely because "I'm fresh enough" is not a judgment the seat holding
  the conversation gets to make about itself.
- **Maximum capability, explicitly selected.** Instruction text is the
  highest-leverage prose in the workspace — every future session pays for
  it — so it is the last place to economize. Name the strongest model the
  environment offers rather than accepting a default (in Claude Code, the
  Agent/Task tool's `model` parameter; today `opus`), and where a
  reasoning-effort or thinking budget is exposed, set it to the required
  effort (orchestration skill, "Before a long run"). Give the agent room
  to read the existing instruction set before it writes.
- **No recursion.** An agent whose assigned unit IS the amendment is
  already the fresh dedicated context: it makes the change directly and
  does not re-delegate it. (It may still delegate genuine sub-units —
  research, a large split — but the freshness requirement is satisfied by
  being that agent.)
- **Other agents don't drive-by edit.** A subagent working on anything
  else that discovers an instruction file is wrong, stale, or missing does
  NOT fix it: it ESCALATES in its report (orchestration skill), and the
  parent decides whether that becomes an amendment unit. Rules nobody
  reviewed are how contracts start contradicting each other.

Tooling that helps AUTHOR instructions — a skill-creator assistant, a doc
linter, an eval harness — belongs INSIDE the dispatched unit. Reaching for
one is never a substitute for the dispatch: it improves the craft of the
change, not the independence of the agent making it.

## 4. Brief the change; do not dictate it

An amendment brief is deliberately less prescriptive than any other brief
in the org — it supplies EVIDENCE and leaves the DIAGNOSIS open. Hand over
what the CEO said, what actually happened, and what it cost; let the author
decide which files change, at what altitude, in what words, and whether the
change is warranted at all. Full contents, the anti-patterns, and a worked
example: [references/amendment-brief.md](references/amendment-brief.md).

## 5. Verify, mirror, integrate

The dispatcher still owns the outcome (orchestration skill, "Owning the
deliverable"):

- **Read the diff yourself**, not just the report. Instruction prose that
  reads well can still contradict a rule three files away.
- **Take the tensions seriously.** An amendment author that reports no
  friction with the existing instructions either found none or didn't
  look; the report should say which.
- **Mirror in the same round.** Instruction text that exists in more than
  one place — an upstream pattern repo, a sub-org contract that inherited
  the rule, a sub-repo's own contract — is updated together, or the
  divergence is deliberate and written down where the next agent will see
  it. Silent drift between copies is the failure this bullet exists to
  prevent.
- **Update the indexes**, so a new skill is discoverable from the contract
  and the maps (workspace-stewardship skill).
- **Log the amendment and tell the CEO what changed** in behavior terms,
  with the directive and date that motivated it. A rule whose origin is
  unrecorded cannot be repealed intelligently.

## Amend from evidence, not from imagination

Every added rule is charged to every future context window, forever.
Amend when something OBSERVABLE demands it — the CEO said so, an agent
failed and the instructions are why, the same correction has been made
three times. Do not harden against hypotheticals; a rule invented "just in
case" carries all of the cost and none of the evidence. Removing or
tightening a rule that has proven wrong is as legitimate an amendment as
adding one, and follows the same protocol.
