# ClaudeOrg

A starting workspace for Claude-centric projects: a fully agent-maintainable
ORG whose core is coordination and knowledge, not application code — though
it grows to own and drive codebases as sub-repos it indexes and coordinates.
Hand Claude this repo's link and ask it to set one up for you (below) — the
agent makes you a private copy, interviews you, instantiates itself as the
org's COORDINATOR, and from then on drives the workspace: organized notes
for everything the org knows, daily rabbit-hole logs of everything that
happens, quest documents for every open piece of work, and focused
subagents for every piece of deep work.

The end state this pattern aims at: one master org for everything a person
knows, does, and works on — infinitely extensible in depth, where even
"what was that agent working on last Tuesday?" is answerable from the
files, months later.

## Set it up with Claude

**For you, the person.** Open Claude Code — in a terminal, the Claude
desktop app, or an IDE extension; anywhere Claude can run commands and
create files — and paste this repo's link with your ask, e.g. *"Hey, I want
to use this to run my design studio. Can you set it up for us?"* Claude
makes your own private copy, interviews you, and builds the org. To do it
by hand instead, see [How to instantiate](#how-to-instantiate).

**For you, Claude, handed this link.** The user's ask is the go-ahead to
set up a copy; these are the steps, and each outward action still gets
their yes.

1. **Check you can act.** This needs a shell, `git`, and file writes. If
   you can't run commands (a plain chat without tools), don't simulate
   it: tell the user this needs Claude Code
   (<https://claude.com/claude-code>) — open it in the folder where they
   keep projects and paste the same link and ask there — or point them to
   How to instantiate below to do it by hand.
2. **Ask before creating anything:** what to call the org (it names the
   repo and folder; kebab-case), where on disk it should live (its own
   folder, not inside another git repository), and whether
   they want a private GitHub repo (recommended: it is the backup and lets
   the org run from other machines) or local-only.
3. **Make a private copy — never fork.** A fork of a public repository
   must stay public, and an org fills up with personal, financial, and
   legal material. Copy from the template instead, and confirm the exact
   command with the user before running it:
   - *GitHub, with the GitHub CLI signed in* (`gh auth status`; if it
     isn't, the user runs `gh auth login` themselves), from the folder
     that will contain it, with `<name>` the org's name:

     ```sh
     gh repo create <name> --template AustinHummel/claude-org --private --clone
     ```
   - *GitHub, without the CLI:* the user clicks **Use this template** →
     **Create a new repository** on this repo's page, picks **Private**,
     and gives you the new repo's URL; `git clone` it into the chosen
     folder (git may ask them to sign in).
   - *Local-only:* clone, then delete the copy's `.git` folder, so it is
     a plain folder with no tie to this repo. `<path>` is the org's new
     folder (e.g. `~/orgs/acme-studio`), which must not exist yet:

     ```sh
     git clone --depth 1 https://github.com/AustinHummel/claude-org.git <path>
     rm -rf <path>/.git
     ```

     In PowerShell the delete is `Remove-Item -Recurse -Force <path>\.git`
     (without `-Force` it fails: git's object files are read-only).

   Confirm the copy contains `BOOTSTRAP.md` before going on.
4. **Bootstrap inside the copy.** Claude Code loads a workspace's contract
   and skills only from the folder a session starts in, so the bootstrap
   belongs in a new session there, as does every session after it. Hand
   the user one line to paste into it that carries what they already told
   you, so nothing is asked twice — e.g. *"Bootstrap this workspace: it's
   for my design studio, Acme Studio; private GitHub repo acme-studio"* —
   and have them open Claude Code in the copy and paste it. If this
   session must carry on instead, switch into the copy and read its
   `CLAUDE.md` and `BOOTSTRAP.md` as files, and each skill's
   `.claude/skills/<skill>/SKILL.md` when a step names it: a session
   started elsewhere never loads them on its own.

## What's inside

| Path | What it is |
|---|---|
| `CLAUDE.md` | The coordinator contract (template; bootstrap fills the placeholders). |
| `BOOTSTRAP.md` | The genesis protocol: interview, instantiate, first commit, self-delete. |
| `.claude/skills/` | The discipline, domain-neutral: daily-log, quests, intake, orchestration, question-review, tiered-orchestration, doc-hygiene, workspace-stewardship, status-report, instruction-changes. |
| `docs/philosophy.md` | Why the system has this shape — read this to understand the design. |
| `docs/coding-projects.md` | The bar a code sub-repo must meet to be agent-maintainable, and how it relates to the org. |
| `docs/running-in-the-cloud.md` | How the org runs beyond one machine: remotes as the bus, clone-on-demand children (no submodules), scheduled seats. |
| `LICENSE.md` | The license summary and required notice (dual-licensed; see License below). |
| `LICENSES/` | The full license texts. |

The working structure (`DASHBOARD.md`, `log/`, `quests/`, `org/`) is
created by bootstrap, not shipped empty: structure materializes on first
use.

## How to instantiate

1. Make your own private copy. On GitHub: **Use this template** →
   **Create a new repository**, choose **Private**, and clone it. Don't
   **Fork**: a fork of this public repo must stay public. For a
   local-only org, use **Code** → **Download ZIP** instead, extract it,
   and rename the extracted `claude-org-main` folder to your org's name.
2. Open Claude Code in the copy.
3. Say what the org is for ("bootstrap this workspace for <X>").
4. Answer the short interview; the agent builds the rest, makes the genesis
   commit, and deletes `BOOTSTRAP.md`.
5. From then on: issue directives, ask questions. Everything is logged,
   filed, and committed.

## What it's been run with (as of October 2026)

The author's experience, not a rule: ClaudeOrg was built and run on Claude
Opus, and for long autonomous runs, what worked best was:

- **Opus 4.8 or earlier:** Max effort.
- **Opus 5.5 or later:** High effort. Since Anthropic changed Opus 5.5's
  effort settings, Max tended to churn in review loops on long runs, while
  High stayed deep without looping.

Setup's interview offers to record which model and effort your long runs
need in your org's contract; left unset, the coordinator assumes the
strongest model at maximum effort. Before any long run, the coordinator
checks the session's model and effort against that requirement (or asks you
to confirm them where it can't read them), and on a mismatch it flags it
instead of launching.

## The shape, in one paragraph

The COORDINATOR is your single point of contact and an expert at exactly
that — coordination. Knowledge lives in the `org/` tree (hubs and spokes,
one altitude per file). Open work lives in `quests/` (problem, approach,
acceptance criteria, where things stand). History lives in `log/` (daily
rabbit-hole notes where the hierarchy itself carries the context, including
what every subagent did). Status lives in `DASHBOARD.md`, at a glance.
Depth is always delegated to fresh subagents with focused briefs, verified
on return, and logged. Structure grows by promotion (section → spoke → area
→ sub-org → repo) only under real pressure, and the maps are maintained in
the same round as any change — so a fresh agent can always predict where
anything belongs, and the org survives any one agent, session, or model.

## Lineage

Distilled 2026-07-16 from three working systems: a personal daily-note
vault (the rabbit-hole logging and quest discipline), a fully
agent-maintained codebase (orchestration, doc-hygiene, architecture
stewardship, design-first delegation), and an Agent Org prototype (the
coordinator seat, dashboard lanes, and CEO-vocabulary reporting).

## License

ClaudeOrg is source-available under your choice of two licenses:
[PolyForm Noncommercial 1.0.0](LICENSES/PolyForm-Noncommercial-1.0.0.md)
(personal, hobby, research, education, charity, and government use) or
[PolyForm Small Business 1.0.0](LICENSES/PolyForm-Small-Business-1.0.0.md)
(companies with fewer than 100 people and under 1,000,000 USD in prior-year
revenue, 2019 dollars adjusted for inflation). Larger commercial use needs a
separate license from the author. See [LICENSE.md](LICENSE.md) for the
summary and the required notice.
