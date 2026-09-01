<!-- Chapter 10: the prompt library (ch10:142-200). Fill the bracketed slots in when you paste, not here. -->

# Prompt Library

Five templates you copy, paste, and customize. Each one follows the action + scope +
constraints formula from Chapter 5, and each is under 30 words once filled in (ch10:202).

**New feature:**
```
Add [feature description] to [component/page].
Files to modify: [file1], [file2].
Follow the design system. Write tests for the new feature.
```

**Bug fix:**
```
Bug: [what's happening].
Expected: [what should happen].
Relevant file: [file path].
Fix it and run tests.
```

**Code review:**
```
Review [file path] for: unused code, security issues,
TypeScript errors, and performance problems.
List findings with line numbers. Fix critical issues.
```

**Database change:**
```
Add [field name] ([type], [constraints]) to the [Model] model.
Create migration. Update the form at [file] to include the new field.
Update the list at [file] to display it.
```

**Visual polish:**
```
[Paste screenshot]
Fix these issues: [specific visual problems].
Follow the design system.
```

## Filled in, for reference

These are the book's own Task Tracker examples (ch10:184-200), so you can see what a
template looks like once the brackets are gone.

```
# New feature (real example)
Add due date picker to task creation form.
Files: src/components/tasks/TaskForm.tsx, prisma/schema.prisma.
Follow the design system. Write tests.

# Bug fix (real example)
Bug: completed tasks still show in the active list.
Expected: only todo and in_progress tasks in active view.
File: src/components/tasks/TaskList.tsx.
Fix it and run tests.

# Database change (real example)
Add priority (enum: low, medium, high) to the Task model.
Create migration. Update tasks/TaskForm.tsx to include a select.
Update tasks/TaskList.tsx to show a colored dot.
```

## Your own templates

Add them below. A library grows with the project — the Task Tracker had templates for
"add a new task field" and "update the pricing page"; yours will be different (ch10:204).
