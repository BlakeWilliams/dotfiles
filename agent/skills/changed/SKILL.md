---
name: changed
description: A high-level account of what a change touched that something outside it depends on — interfaces, tables, dependencies, boundaries, side effects, visible behaviour — one line each, never the diff. Use on a branch, PR or working tree when the user asks "what changed", "what does this touch", "summarise this diff", or wants a review at the level of contracts and tables rather than lines. Also the format and the check the pair skill uses at the end of its work.
---

# What changed

A diff answers "what is different now" and answers it exhaustively, which is the problem: it has thrown the order away, it never had the reasons, and a signature everything depends on reads exactly like a reflowed comment. This is the rung above the diff — the level at which someone can actually disagree.

## The table

One line per thing that something outside the change depends on. Nothing else qualifies.

```
kind        op      subject                     — what changes for whoever depends on it
contract    modify  Settings.pauseMs            — callers pass ms, not seconds
state       add     table sessions_archive      — migration 0042; nothing reads it yet
dependency  add     zod@3                       — renderer bundle +40kB
boundary    modify  preload → main IPC          — new channel 'archive:list'
effect      add     writes ~/.halon/archive     — on every finished step
behavior    modify  Thread pane                 — finished card shows `next`
```

Six kinds, and the question each answers:

- **contract** — a signature, type, schema or protocol something else calls or parses.
- **state** — durable state added, removed or moved: a table, a column, a file on disk, a key in a store.
- **dependency** — something new to install or upgrade, or a direction of dependence reversed.
- **boundary** — a trust, process or module boundary crossed where it was not before: a new IPC channel, a new endpoint, a package now importing another.
- **effect** — something now happens outside the process: a write, a request, a notification.
- **behavior** — what an observer sees is different.

Three ops: `add`, `remove`, `modify`.

`subject` is a name — a symbol, a file, a table, a channel — precise enough to be found in the diff afterwards. That is what makes a line a claim rather than a mood: "Settings.pauseMs" can be checked, "the settings" cannot.

The last column is one line for a person, not for matching.

Ranked with `state` and `boundary` first: they are the two that should stop a change before it lands. `contract` next. The rest after.

## What is not a change

- Anything internal to one module that nothing outside it names.
- A rename with the old name still exported.
- Reflowed comments, formatting, moved code that does the same thing.
- Test-only edits, unless a test fixture is itself a contract others build on.

A change that lists more than seven or eight lines is doing more than one thing. Say so, and split the table by commit or by step rather than growing it.

## Deriving it from a diff

Read the diff — `git diff <base>...HEAD`, a PR, or the working tree, whichever was asked for — and look in this order, because it is the order of how much each one costs to get wrong:

1. Migrations, schema files, anything under a `db/`, `migrations/` or `store` path → `state`.
2. New channels, routes, handlers, `preload`/`main` or client/server crossings, new imports across package or layer boundaries → `boundary`.
3. Exported signatures, public types, wire formats, config shapes → `contract`.
4. Package manifests and lockfiles → `dependency`.
5. New writes to disk, network calls, notifications, spawned processes → `effect`.
6. Anything a user or operator would notice → `behavior`.

Then write the table and nothing else. No narrative above it, no list of files below it.

## Checking a declaration

If the working tree has a `PLAN.md` with a `## changes` section, that is what the author said the change WOULD do, written before the work. Derive the table from the diff independently — do not read the declaration first — then match the two by `subject`:

```
undeclared: state add table sessions_archive — migration 0042 adds it; PLAN.md does not mention it
unmade: contract modify Settings.pauseMs — declared, but the diff leaves it unchanged
```

`undeclared` is in the diff and not in the plan. `unmade` is in the plan and not in the diff. One line each, or `changes: declared and made agree` when they do. A declaration that matches the diff is the review done; the gaps are the review.
