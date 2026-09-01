<!-- Chapter 6: the thirty-second planning step that makes background agents worth using (ch06:103-114). The skill isn't the command, it's splitting the work so two agents never touch the same file. -->

# Parallel Work Map

List what you want to build this session. For each one, write down which files it touches
and what has to exist first. Anything with nothing in the "Depends on" column goes in Round
1, in its own worktree. Everything else waits.

## Your map

| # | Task | Touches | Depends on | Round |
|---|------|---------|------------|-------|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |

Rule of thumb: if two rows share a file, they cannot share a round.

## The book's worked example (ch06:107-114)

| # | Task | Touches | Depends on | Round |
|---|------|---------|------------|-------|
| 1 | Add a task statistics dashboard | new dashboard files | nothing | 1 |
| 2 | Add email notifications for due tasks | notification/cron files | nothing | 1 |
| 3 | Write tests for the statistics dashboard | dashboard test files | Task 1 | 2 |
| 4 | Fix the mobile layout on the task list | layout component | nothing | 1 |

Four tasks, two rounds instead of four. The map takes thirty seconds and saves fifteen
minutes. Do it every session.

Then start each Round 1 task in its own worktree:

```
claude --worktree "statistics-dashboard"
```
