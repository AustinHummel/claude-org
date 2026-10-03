# Bootstrap: instantiating this org

You are running the GENESIS SESSION of a ClaudeOrg workspace. This file
exists only now: follow it top to bottom, and its last step deletes it.
Read `docs/philosophy.md` first if you have not — you are about to become
the coordinator it describes, and every choice below should be made in its
spirit.

## 0. Confirm this is a private copy

Nothing personal gets written until this holds. From the workspace root,
run `git rev-parse --show-prefix`; it says which repository your commits
would land in:

- **It fails** (not a git repository): a plain folder, local and private.
- **It prints a path** (e.g. `my-org/`): the workspace sits INSIDE another
  repository (dotfiles, a project), whose history and remote are not this
  org's. Treat the workspace as a plain folder: ignore the parent's remote,
  and never commit to or push the parent. Tell the principal, and
  recommend moving the folder outside that repository; if they keep it
  there, it gets its own repository at step 4, the parent will list it as
  untracked, and whether the parent ignores it is their call.
- **It prints nothing**: the workspace is its own repository. Run
  `git remote -v`:
  - No remote: local and private.
  - **A remote points at the ClaudeOrg template itself**
    (`AustinHummel/claude-org`): this is the template, or a clone of it,
    not a copy. Stop and make a copy first (README, "Set it up with
    Claude").
  - **Any other remote:** confirm it is private. On GitHub, use `gh repo
    view <owner>/<repo> --json visibility,isFork` if the GitHub CLI is
    signed in; otherwise `curl -sI https://api.github.com/repos/<owner>/<repo>`
    (no sign-in, so it cannot prompt): `200` means public; `404` means
    private or missing, and any other answer settles nothing, so ask the
    principal. On any other host, ask the principal. Don't probe with `git ls-remote` or `git fetch`: they
    can hang on a sign-in prompt. If it is public — a fork of a public
    repo always is — stop and say so: an org holds personal, financial,
    and legal material. The fix is a fresh private copy from the template,
    not this one.

## 1. Interview the principal

Ask, in one message, only what the template cannot know (≤6 questions;
skip any the principal's opening directive already answered):

1. **What is this org for?** One or two sentences of mission — a business,
   a life, a project, a team. Scope it to what is real TODAY: the root is
   provisional by design, and the re-root protocol (workspace-stewardship
   skill) makes zooming out cheap later. Never scaffold for a scale the
   org hasn't reached.
2. **Who are you?** Name, email, and the role term you want (default:
   CEO).
3. **What should it know first?** The 1–3 knowledge areas that matter now.
4. **What's open right now?** The work in flight or overdue that should
   become the first quests.
5. **Any hard rules?** Things this org must always or never do.
6. **Cadence and limits?** The contract's default: commit at every session
   close, push at every close once the org has a remote, and never add a
   remote unasked. Optionally, for long agent runs: a usage line where
   agents stop starting new work (a % of the plan's weekly allowance, or
   "no gate"), and the model and effort those runs need. Unanswered, the
   coordinator asks for each before the first long run and records the
   answer (orchestration skill); it never assumes one.

Every answer is a fact with provenance ("the CEO, at genesis") — file them
as such. Do not invent facts to fill silence; unknowns become the open
questions of a first intake quest (step 3), a perfectly good starting
state.

## 2. Instantiate the contract

- Fill every «placeholder» in `CLAUDE.md` from the interview, and delete
  its UNINITIALIZED banner block.
- Rewrite `README.md` for this instance: what the org is, how to drive it,
  how to read it by hand. (The template's README describes ClaudeOrg
  itself; replace it — this workspace is no longer the template.)
- Keep the license: `LICENSE.md` and `LICENSES/` stay exactly as shipped,
  and the new README ends with this section, verbatim (the license
  requires every copy to carry its terms and the Required Notice line):

  ```markdown
  ## License

  This workspace is built on [ClaudeOrg](https://github.com/AustinHummel/claude-org),
  used under the terms in [LICENSE.md](LICENSE.md).

  Required Notice: Copyright Austin Hummel (https://github.com/AustinHummel/claude-org)
  ```

## 3. Seed the working structure

Create, honestly minimal (structure materializes on first use — seed only
what the interview gave content for):

- `DASHBOARD.md` — lanes per the status-report skill; genesis stamped.
- `org/README.md` — the map: the interview's areas with one-line purposes,
  the filing rules, the growth pointer. An area gets its own folder and
  hub README only where the growth ladder already calls for one
  (workspace-stewardship skill).
- `quests/<name>.md` — one quest per piece of open work from the
  interview, per the quests skill. If ground truth is thin, the first
  quest is an intake/snapshot quest; the questions the principal still
  needs to answer are To-Dos in today's log, as all To-Dos are.
- `log/<year>/YYYY-MM-DD-ddd.md` — today's log, per the daily-log skill,
  recording this genesis session: the directive, the interview's key
  answers, what was built, what's waiting on the principal.

## 4. Commit the genesis

Step 0 found one of two cases:

- **Its own repository** (typically born from the GitHub template, by "Use
  this template" or `gh repo create --template`, with a remote, an initial
  commit, and the template's `.gitignore` and `.gitattributes`): do NOT
  `git init`; the genesis is a normal commit on top.
- **A plain folder**, including one nested in another repository: run
  `git init -b main` in the workspace root (then `git rev-parse
  --show-prefix` prints nothing), and recreate a minimal `.gitignore` (OS
  junk, `scratch/`) only if one is missing.

Check the commit identity: `git config user.name` and `git config
user.email`. If either prints nothing, the commit fails (or git guesses
an identity from the machine). Propose the name and email from the
interview and, on the principal's OK, set them for this repository only:
`git config user.name "<name>"` and `git config user.email "<email>"`,
never `--global`.

Commit everything: `YYYY-MM-DD: genesis — <org name> instantiated from
ClaudeOrg`.

Genesis is the org's first CLOSE, so the contract's push rule applies:
with its own remote (confirmed private at step 0), push once step 5's
deletion is committed, unless the interview set a different cadence. A
plain folder has no remote and stays local until the principal asks for
one.

## 5. Delete this file

Remove `BOOTSTRAP.md` (the contract governs now), commit the deletion with
the genesis commit or immediately after, and close by giving the principal
a first status report: what exists, what the first quests are, and exactly
what is waiting on them.
