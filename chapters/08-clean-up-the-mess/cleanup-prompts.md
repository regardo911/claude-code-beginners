<!-- Chapter 8: all fifteen cleanup prompts in the chapter's running order (ch08:34-406), with the commands you run between them. Claude has no memory of what it built last week, so this is a standing chore, not a one-off. -->

# Chapter 8: Cleanup Prompts

Count first, so you have a before-number:

```
find src -name "*.ts" -o -name "*.tsx" | wc -l
```

PowerShell:

```
(Get-ChildItem -Path src -Recurse -Include *.ts,*.tsx).Count
```

Expect 25 to 40 if you've followed along since Chapter 3. Write it down.

## Dead code

Start a fresh conversation, then:

```
Scan the entire codebase and identify dead code. Check for: unused
imports in every file, exported functions that nothing imports,
components that no page or layout renders, files that nothing
references. List every instance with the file path and line number.
```

Expect 10-15% dead code, so for the Task Tracker, 3-5 files or functions. Review the list
before deleting anything; Claude misreads dynamically-imported code as dead. When you're not
sure about an item:

```
Is formatDate used anywhere that a static import analysis might miss?
Check server actions, dynamic imports, and config files.
```

Then, and only for what you confirmed:

```
Delete all confirmed dead code. Remove unused imports. Delete the
orphaned files. Do not touch anything I did not confirm.
```

```
npm test
```

## Duplicates

```
Find functions, utilities, or components that do the same thing but
exist in different files. Group them by function. For each group,
recommend which version to keep and which to delete.
```

Single functions with no matching pair aren't duplicates. Act only on the groups.

| Duplicate type | What you'll find | Keep |
|---|---|---|
| API client wrappers | `fetchTasks` (Ch3) and `getTasks` (Ch5), both hit the DB, both return the same data | the more complete one |
| Competing type definitions | `Task` in one file, identical `TaskType` in another, neither imports the other | one canonical `Task` |
| Redundant utilities | string formatters, date parsers, validation helpers, made on demand without checking | one shared version |

```
Merge these duplicate utilities into a single file at src/lib/utils.ts.
Update all imports across the codebase.
```

```
npm test
```

Re-run the file count. A clean project with no duplicates saves roughly 20-30% on token
usage compared to typical Claude-generated redundancy, on top of the Chapter 5 fixes.

## File structure

```
ls -R src
```

The target tree is in `target-structure.md` in this folder.

```
Reorganize the project files into this structure. Move components to
the appropriate subfolder. Move utilities to lib/. Move types to
types/. Update all imports. Don't change any functionality.
```

```
npm test
```
```
ls src
```

A broken test after this is almost always a missed import path. Tell Claude which test
failed and it fixes the path.

## Component bloat

```
find src/components -name "*.tsx" | xargs wc -l | sort -rn | head
```

Anything over 100 lines is a split candidate.

```
Review each component in the project. If any component is over 100
lines, suggest how to split it into smaller, focused components.
Implement the split.
```

Not every large file should be split, though. A cohesive 150-line page cut into four 40-line
pieces costs more than it saves, because now Claude reads four files and tracks their
relationships instead of one.

```
For each component over 100 lines, tell me: is this component doing
multiple unrelated things (suggest splitting), or one complex thing
(leave it alone)?
```

| Component does... | Action |
|---|---|
| multiple unrelated things (render + API + state + animation) | split it |
| one complex thing, naturally cohesive | leave it |

```
npm test
```

## Three refactors Claude runs reliably

```
Find all magic numbers and hardcoded strings. Extract them to named
constants at the top of each file or in a shared constants file.
```

```
Review type annotations. Remove redundant ones where TypeScript can
infer. Add explicit ones to function signatures that currently rely
on implicit any.
```

```
Organize imports in every file. Group by: external packages first,
then local imports, then relative imports. Remove any unused imports.
Use the project's path aliases where available.
```

```
npm test
```

None of the three change functionality, so the risk of breaking something is near zero.

## The CLAUDE.md audit

```
Review the CLAUDE.md file. Remove any rules or references that no
longer apply to the current codebase. Add any architectural patterns
we've established. Keep it concise.
```

Skim it yourself afterwards. You own that file. Under 30 lines is almost always better than
over 60.

## Measure the difference

Same task, before and after, in fresh conversations both times:

```
Add a 'last modified' timestamp to each task card.
```

Watch how many files Claude reads. After the reorg it should go straight to
`src/components/tasks/TaskCard.tsx` instead of scanning five to find the right one. If the
file count didn't drop, the reorg didn't take. Re-run the structure step and check that
imports point at the new folders.

## The monthly sweep

The routine, the one prompt that runs steps 1-4, and the two commands that close it out are
in `starter-kit/monthly-cleanup.md`. It applies to every project, every month (ch10:250).
