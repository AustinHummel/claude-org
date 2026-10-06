# The context meter: how an agent knows where it stands

Premise 1's thresholds ([SKILL.md](../SKILL.md)) are only as good as the reading
they are checked against. An agent cannot feel its own context, and under relay
use, children that "watched their context" reported far below their real use: by
up to 25 points, one at under 3% while at about 43%. Several ran well past their
bound while reporting under it. An overrun costs twice. Its late work is the
degraded-judgment work the wall exists to prevent. And it is the run's most
expensive work, because every turn re-processes the whole window: an agent's
spend is driven more by its context than by its thinking. So the wrap point is a
**measurement against a number the brief states in tokens**, never an estimate.

## Three readings that look like a meter and are not

- **A guess.** An agent does not see its system prompt, its tool definitions, or
  what its tool outputs weigh, and it guesses low. "Estimate conservatively" does
  not fix this.
- **The session usage tool.** In the Claude desktop app, `get_usage`'s `context`
  block reports a SESSION's window. Called from a subagent, it reports the top
  conversation's context, not the subagent's own. It is the right meter only for
  the agent that IS the session: the coordinator.
- **The running counter divided by its own starting figure.** In Claude Code each
  agent sees a running `<total_tokens>N tokens left</total_tokens>` line. Its
  starting figure is a token allowance (15,000,000 when this was written), not
  the context window. Used tokens divided by it under-read about fifteenfold:
  420k used reads as 2.8%.

## What every agent does

1. **The brief states the wrap point in tokens.** The spawner computes it: the
   role's threshold (Premise 1) times the child's context window. It reads the
   window from its own session (in the desktop app, `get_usage`'s
   `contextWindow`) when the child runs the same model. On a 1,000,000-token
   window that is about 250–300k for a design or decision specialist and about
   500k for a worker or orchestrator. The agent never divides.
2. **Used context is the counter's drop.** Note the counter figure shown with your
   brief, before your first tool call. Used = that figure minus the latest one.
   The drop includes the starting prompt (it lands at the first call) and tracks
   the real context closely. One lag: it does not yet include the results of
   your latest tool calls, so add a big read you just made yourself.
3. **No counter shown? Use a conservative proxy.** Add up the characters of
   everything that entered your window (the brief, every file read and tool
   output, everything you wrote). Divide by 3, which reads high on purpose. Then
   add the starting prompt: the spawner's figure if the brief states one, else
   10% of the window.
4. **Check at every boundary and before any large read.** Past the wrap point, start
   no new step: finish the one in hand at a clean boundary, then wrap (Premise 1).
   If a planned read would carry you well past the wrap point, wrap first and
   hand that read to a fresh agent.
5. **Report the reading.** Give your wrap figure in tokens, with the method:
   counter or proxy.

## What the parent checks

A foreground child cannot be watched while it runs, so its own meter is the only
live one. The parent checks at receipt:

- **Read the platform's count of the child**, where the spawn result reports one.
  In Claude Code the Agent result's usage block carries `subagent_tokens`: the
  child's context at its last turn. That figure, as a percent of the window, is
  the `wrap` field on the ledger line the gatherer serializes. A relay agent
  appending its own line uses its counter reading.
- **Compare it with the child's reported figure.** A gap of more than a few
  points means the child's method failed. Name the method again in the next
  child's brief.
- **An overrun is a sizing finding.** If the child ran past its wrap point by
  more than one step, cut the next unit of that kind smaller. For a design or
  decision specialist, this is the decompose signal
  ([design-passes.md](design-passes.md)) arriving late. Verify its deliverable
  knowing its late calls were made past the ceiling. Re-cut any remaining scope;
  don't relay more of it to one agent.
