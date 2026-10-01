# Daily-log worked examples

Companion to the daily-log skill: full before/after examples of the rules
in action. Read when writing your first logs in a workspace, or when a rule
in the skill needs its illustration.

## Delegated subtree, done right

The parent names the dispatch; children are the subagent's first-person
findings; the last child is the result.

```markdown
- Having a subagent inventory the company's domain registrations
	- Checked the registrar account named in org/company/accounts.md
	- Three domains registered, one expiring within sixty days
	- Wrote the inventory with renewal dates to org/company/assets.md
```

Wrong — ungated and third-person (who did this?):

```markdown
- The subagent checked the registrar and found three domains
```

## CEO provenance

Wrong — the fact reads as the coordinator's own finding:

```markdown
- The LLC was formed in 2019 in Vermont
```

Right — the source is structural:

```markdown
- The CEO reported the LLC was formed in 2019 in Vermont
	- Filing it under org/company/README.md, marked confirmed-by-owner
```

## Auditing one entry into place

A raw entry written in the flow of work:

```markdown
- Confirming the HOLD on the refiling
```

The tells: `HOLD` (emphasis — a loaded label nothing above defined),
"the refiling" (definite article — never introduced), `Confirming`
(presupposes a prior decision). The fixes are structural, in order:

1. Anchor to the goal: add the quest-goal parent the work advances.
2. Preceding sibling for the prior finding, stated inline.
3. Reword the entry to the activity it actually is.

End state:

```markdown
- [Business snapshot](../../quests/business-snapshot.md)
	- Getting the compliance picture settled
		- Yesterday the CEO decided to wait on refiling until the fee question was answered
		- Verifying the fee schedule against the state's site before unpausing the refiling
```

If, mid-audit, the entry turns out to add neither forward context nor
historical insight, delete it — the audit can end in deletion, not just
enrichment.

## The post-completion refactor

During the work — one nested tree:

```markdown
- Tightening the dashboard's stale lanes
	- Refreshed the two quest rows against their quest files
	- Noticed the dashboard format itself is undocumented
	- Decided to document it permanently in the status-report skill
	- Updated the skill
	- Re-tightened the lanes with the documented format
```

After — `documenting the format` is a permanent change in a separate
concern, so it is promoted; the rest stays nested:

```markdown
- Trying to tighten the dashboard's stale lanes
	- Refreshed the two quest rows against their quest files
	- Can't finish without documenting the lane format permanently
- Documenting the dashboard lane format in the status-report skill
- Tightening the dashboard lanes again
	- Re-tightened with the documented format; lanes match their quests
```

By contrast, a multi-step research detour that was obviously required to
finish the original task stays nested under it — promote only
separate-concern permanent changes.

## Extracting a parenthetical list

Before:

```markdown
- Cross-references in three org files (company/README.md, company/assets.md, company/compliance.md) still describe the pre-snapshot placeholder structure — needs a sweep before the quest closes
```

After:

```markdown
- I noticed cross-references in org files that still describe the placeholder structure
	- Org files:
		- company/README.md
		- company/assets.md
		- company/compliance.md
	- These need a sweep before the quest closes
		- ✔️ Adding a to-do to sweep them
```
