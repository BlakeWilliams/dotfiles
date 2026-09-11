---
name: changed
description: High-level walkthrough of a change so a reader understands it without reading every line — before/after model, what it touches, changed and new functions with how callers use them, and tests added. Use on a branch, PR or working tree when the user asks "what changed", "walk me through this", "summarise this PR", or wants to review at the level of contracts rather than lines. Also the end-of-work check in the pair skill.
---

# Changed

Load the `hyperfocus` skill first. Its shape applies to every line here.

## Derive, in this order
- Commit messages and PR body. Intent.
- Tests. They state behaviour.
- Signatures and types. The skeleton.
- Bodies, only to answer what the above left open.
- Callers: `git grep` each changed or new symbol. How it's used matters more than who uses it.

## Output, in this order

### Before → after
- One line each. The model shift, not the file list.

### Why
- One sentence.

### The shape now
- The pieces and how they connect. A trace: who hands what to whom, where state lives.

### What it touches
- One entry per thing outside the change that depends on it. Kinds: `contract`, `state`, `dependency`, `boundary`, `effect`, `behavior`. Ops: `add`, `remove`, `modify`.
- Format: bold `kind/op` + subject, one line why, then code for contracts.

**contract/modify** `diff::render_line`
Gutter width threaded into every row.
```diff
- fn render_line(line: &DiffLine, width: usize) -> Line<'static>
+ fn render_line(line: &DiffLine, width: usize, label: Option<usize>, gutter: usize) -> Line<'static>
```

- Signature only. Never the body.
- Rank: state, boundary, contract, then the rest.
- Say when a kind has nothing.

### Changed functions
- Only those whose behaviour or signature changed meaningfully. Not reflow, not renames.
- Per function: bold name, file, what changed, then how callers use it now — what they hand it, what they do with the result, what that means on screen or in state.

### New functions
- Every one. Signature, file, how it's used.

### Deleted functions
- Every one. Who used it, what replaced it.

### Types
- Structs, enums, classes, traits added, removed, or reshaped. Same treatment. "None" if none.

### Tests added
- Every one, by name, one line on what it holds.
- Then what's not covered.

### Check
- The command that proves it.

## Plan vs diff
- If `PLAN.md` has `## changes`, derive first, read it second, match by subject.
- `plan/missing kind/op: subject` — in the plan, not in the diff.
- `diff/unplanned kind/op: subject` — in the diff, not in the plan.
- Or `plan and diff agree`.

## Not a change
- Internal to one module, nothing outside names it.
- Rename with the old name still exported.
- Reflow, formatting, moved code that does the same thing.
- Test-only edits, unless the fixture is a contract.

## Scope
- Past eight entries in "What it touches", split by commit. The change is doing more than one thing; say so.
- Where it goes: terminal when asked; `gh pr edit --body` when there's a PR.
