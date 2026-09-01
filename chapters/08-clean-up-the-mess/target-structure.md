<!-- Chapter 8: the reorg target (ch08:150-159) and the CLAUDE.md block that keeps future conversations from undoing it (ch08:187-197). This describes the reader's own generated Next.js app. -->

# Target Structure

```
src/
  app/           (pages, layouts, routes)
  components/    (UI components)
    ui/          (generic: Button, Input, Card)
    tasks/       (feature-specific: TaskList, TaskForm, TaskCard)
  lib/           (utilities, helpers, shared logic)
  types/         (TypeScript type definitions)
  actions/       (server actions)
```

Once the files have moved, put the new map in CLAUDE.md so the next conversation doesn't
undo the organization. This block replaces the Chapter 5 file map:

```
## File Structure
- src/app/: pages and layouts only
- src/components/ui/: generic reusable components
- src/components/tasks/: task-specific components
- src/lib/: utilities and shared logic
- src/types/: TypeScript type definitions
- src/actions/: server actions for database operations
```

Ask Claude to "add a button to the task card" in a flat twenty-file folder and it might read
five files to find the right one. In an organized tree it goes straight to
`src/components/tasks/TaskCard.tsx` and stops.

Under 50 files is where cleanup has the biggest percentage impact. Over 150, do this reorg
before anything else, so Claude can work off folder names (ch08:347).
