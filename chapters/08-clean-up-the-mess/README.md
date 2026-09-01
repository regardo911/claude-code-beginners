# Chapter 8: Clean Up the Mess

## What you build

A leaner project and a routine that keeps it that way. Claude doesn't remember what it wrote
last week, so it happily builds a second `formatDate` next to the one it already made, and
six chapters of that leaves duplicate helpers, orphaned files and components doing five jobs.

The densest folder in the repo: fifteen prompts, the target file structure, and the mature
CLAUDE.md the whole book has been building toward. The monthly routine those prompts collapse
into lives in `starter-kit/monthly-cleanup.md`.

## The order matters

Dead code, then duplicates, then structure, then component size, then the CLAUDE.md audit.
Reorganize before you delete and you move files you're about to throw away. Split components
before you merge duplicates and you split two copies of the same thing.

Run `npm test` after every step. The reorg rewrites every import in the project, and a broken
test afterwards is almost always one missed path.

## Start here

Count first, so the number at the end means something:

```
find src -name "*.ts" -o -name "*.tsx" | wc -l
```

Then a fresh conversation and the first prompt in `cleanup-prompts.md`. Review the list
before you delete anything: Claude reads dynamically-imported code as dead, and a server
action referenced through a config entry looks unused to a static scan.

## Done when

The file count is lower than your starting number, the tests are green, `ls src` shows
folders instead of a wall of loose files, and CLAUDE.md is under 30 lines with no references
to anything you moved or deleted.

Then measure it: ask for the same small change you asked for before the cleanup, and watch
how many files Claude reads. If the number didn't drop, the reorg didn't take.

## On your own project

The prompts are project-agnostic apart from two paths: `src/lib/utils.ts` in the merge prompt
and the folder names in the reorg. The 100-line threshold and the split-or-leave rule
transfer as they are.

Read `CLAUDE.md.mature.example` before you copy anything. It's the end state a CLAUDE.md
grows into, and its header flags the one line in it the rest of the book contradicts.
