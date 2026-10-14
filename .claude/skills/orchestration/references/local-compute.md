# Local compute: yield the machine, own every process

Agents run real compute on the principal's own machine: oracles, test
harnesses, exhaustive and random differential sweeps, builds. Two failures
follow from that, and this file prevents both:

- **The machine stops being theirs.** A job that fans out across every core
  at normal priority makes the computer sluggish for the person who owns it.
- **A process outlives its owner.** A tool that cuts long foreground commands
  pushes agents to background them (`nohup`, `&`, a harness's background
  mode), and a background process outlives the agent that started it. When
  that agent wraps (context wall, budget park, a kill), the process runs on
  with nobody who knows what it is, when it ends, or whether it still
  matters.

The rule has three parts: run it low, record it, and never leave it without
an owner.

## When it applies

Any process you start that runs past the command that started it, or that
keeps more than one core busy for more than a few minutes. A command that
finishes inside the tool call (a test run, a build) needs no record or
handoff, but still runs low if it keeps many cores busy for minutes.

## 1. Run it low

- **Below-normal priority, set at launch.** Windows: BelowNormal (Idle is
  also fine); POSIX: `nice` 10 or more. Set it on the process that spawns the
  workers, before it spawns them. Workers inherit their parent's priority at
  creation, and lowering a running parent does not lower workers it already
  started.
- **Leave headroom.** Across every job running at once, use at most three
  quarters of the logical cores, and leave at least two free: on 24 cores, 18
  workers in total. Read the count (`os.cpu_count()` in Python); don't assume
  it.
- This paces the job; it never thins it. A job that runs slower at low
  priority runs every case it was going to run (orchestration skill, "Pace,
  never thin").

Launch methods verified on Windows 11 (Python 3.13, nothing installed):

- **Inside a Python script** (any OS), first thing in `main`, before
  any pool or subprocess:

      def lower_priority():
          if os.name == "nt":
              import ctypes
              k = ctypes.windll.kernel32
              k.GetCurrentProcess.restype = ctypes.c_void_p
              k.SetPriorityClass.argtypes = [ctypes.c_void_p, ctypes.c_uint32]
              if not k.SetPriorityClass(k.GetCurrentProcess(), 0x4000):  # BELOW_NORMAL
                  raise OSError("SetPriorityClass failed")
          else:
              os.nice(10)

  Copy it whole. The usual one-liner,
  `ctypes.windll.kernel32.SetPriorityClass(ctypes.windll.kernel32.GetCurrentProcess(), 0x4000)`,
  lacks the two type declarations: on 64-bit Windows it returns 0 and
  changes nothing, and a `try/except: pass` around it hides that.
- **From Git Bash or any POSIX shell:**
  `nice -n 10 python /abs/path/job.py ... > /abs/path/job.log 2>&1 &`
  (Git Bash maps it to BelowNormal).
- **From PowerShell:** lower the launching shell, then start the job; the job
  inherits:

      (Get-Process -Id $PID).PriorityClass = 'BelowNormal'
      Start-Process python -ArgumentList '/abs/path/job.py', ... -WindowStyle Hidden -PassThru `
        -RedirectStandardOutput /abs/path/job.log -RedirectStandardError /abs/path/job.err

- Don't use `cmd /c start /belownormal` from an agent's shell: it hung
  without launching anything when tested.
- Lowering a job already running: set every one of its processes, workers
  included: `Get-Process -Id <pid>,<pid>,... | ForEach-Object { $_.PriorityClass = 'BelowNormal' }`.
- **Check that it took**, right after launch: the sweep script's `Prio`
  column (section 3), or `(Get-Process -Id <pid>).PriorityClass`, reads
  BelowNormal or Idle for the root and its workers. If not, lower them by
  PID (above) and fix the launch.

Launch with **absolute paths** to the script and its outputs: the sweep
(section 3) finds jobs by the paths in their command lines, and a job
started by a relative path (`python job.py` from its own folder) is
invisible to it.

## 2. Record it

When you launch, write one line where your successors will look: your
report (below), and the run's handoff or today's daily log once the job is
handed to whoever keeps it:

    job <name> · owner <agent> · pid <root pid> · started <time> · expect-end <time> · cmd <command> · out <path> · progress <path>

A job long enough to outlive you writes progress to a file, so whoever owns
it next can see it moving and re-estimate its end.

## 3. Never leave it without an owner

**Before you return or wrap, every process you started is in one of three
states:**

- **Finished**, its output collected (into a durable location, not only a
  scratchpad, when the work depends on it).
- **Killed**, because nothing still needs it. Windows: `taskkill /PID <pid> /T /F`
  ends the process and all its workers (from Git Bash: `taskkill //PID <pid> //T //F`).
  POSIX: kill the process group.
- **Handed off**: your report's STILL RUNNING section ([report.md](report.md))
  carries its job line, and the agent receiving the report now owns it. It
  records the line in the run's resumable state (for a tiered run, the
  handoff) and, at its own wrap, makes the same three-way choice. Ownership
  climbs the chain until someone waits for it or kills it; at the top, the
  coordinator records it as a To-Do in the daily log.

A job is never "left running for later" without a line naming its owner.

**The sweep.** At defined points the agent in charge lists what agents have
launched and settles every process on the list. From the workspace root:

    pwsh -NoProfile -ExecutionPolicy Bypass -File .claude/skills/orchestration/scripts/list-jobs.ps1

([scripts/list-jobs.ps1](../scripts/list-jobs.ps1) lists every process
whose command line names the workspace or the agent harness's temp area,
plus all their workers. It never kills. On macOS/Linux,
`ps -eo pid,ppid,ni,lstart,args` filtered for the same paths.)

- **When to sweep:** an orchestrator, when its last child has returned and
  before it wraps; the coordinator at a run park and at session close.
- **Match the list against the job lines** on record. A recorded job stays
  if it is still wanted, its line is current, and it runs at low priority.
- **A stray** (no line, or its owner is gone): adopt it, by writing its line
  and lowering its priority, if its output is plainly still needed and it is
  making progress. Otherwise kill it.
- **Another session's job** (its paths name a different session's
  scratchpad) may have a live owner: leave it and mention it, unless you
  know that session has ended.
- **Never kill what you can't attribute** to an agent-launched job. The
  harness's own processes, editors, and anything the principal started stay
  untouched; mention them if they look wrong.
