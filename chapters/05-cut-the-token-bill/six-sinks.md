<!-- Chapter 5: the six token sinks and the prompt that plugs each one (ch05:27-232), plus the restart table, batching, and the three-line formula. -->

# Chapter 5: The Six Token Sinks

A token is roughly 4 characters, and the biggest input cost is file reading: a 500-line file
is 5,000-7,000 input tokens.

## Sink 1: Conversations that run too long

Every message includes all previous messages. After 20-30 you're paying more for overhead
than work. One conversation per feature, opened with a handoff:

```
I'm working on the Task Tracker app. I just finished the status toggle. Next: add filtering by status. Relevant files: src/app/page.tsx and src/components/TaskList.tsx.
```

**The result:** Claude opens only the two files you named instead of re-scanning the project.

## Sink 2: Wrong effort level

Claude Code defaults to `high`, so you pay for deep reasoning on a one-line rename. Five
levels: `low`, `medium`, `high`, `xhigh`, `max`.

```
/effort low
```

```
Rename the variable `task` to `taskItem` in src/components/TaskList.tsx.
```

**The payoff:** a few thousand tokens, not tens of thousands. Run `/effort high` before your
next real feature, or `claude --effort low` at launch.

## Sink 3: Claude reading files it doesn't need

Name the files:

```
Add a delete button to the task list in src/components/TaskList.tsx. Wire it to the deleteTask server action in src/app/actions.ts. Don't read other files.
```

Two reads instead of twelve. Make it automatic with the file map in
`CLAUDE.md-file-map.example` in this folder.

## Sink 4: Not using LSP

LSP lets Claude jump to a definition instead of reading file after file to find it. Usually
automatic for TypeScript once the language server is installed.

```
/config
```

Look for the LSP options. Chapter 6 goes deeper on setup.

## Sink 5: Verbose prompts

Write prompts like text messages, not emails. Seventeen words:

```
Add a dropdown filter above the task list. Options: All, Todo, In Progress, Done. Filter the displayed tasks when the user selects an option.
```

## Sink 6: Asking Claude to explain instead of just doing

"Explain how auth works and then suggest improvements" makes Claude write both, and you pay
for both. Ask for changes:

```
Improve the auth system: add rate limiting on login attempts, add password complexity rules, and switch from JWT to httpOnly cookies. Make the edits, don't explain them.
```

## Restart or continue?

| Situation | Restart or continue? |
|-----------|---------------------|
| Finished a feature, starting a new one | Restart |
| Claude's responses getting confused or repetitive | Restart |
| Context bar past 60% | Restart |
| Switching to a different area of the codebase | Restart |
| Claude referencing old decisions that no longer apply | Restart |
| Mid-debug on a specific issue (context matters) | Continue |
| Current task is a continuation of the previous one | Continue |
| Claude just read files it'll need for the next prompt | Continue |
| Iterating on a design with the screenshot loop | Continue |

When in doubt, restart. Mid-feature at 60-70%, use `/compact` instead:

```
/compact
```

## The A/B audit

Run A, a wide prompt at default effort, in a fresh session:

```
Read through the project and understand the architecture, then add a priority field to tasks somewhere it makes sense.
```

Run B, new session, scoped:

```
/effort medium
Add a priority field (low/medium/high) to the Task model. Edit prisma/schema.prisma, run the migration, then update src/components/TaskList.tsx to show a colored dot. Don't read other files.
```

The book's own gap, and it labels this illustrative (ch05:167-172):

```
RUN A (old habits):     ~147,000 input tokens · 14 files read · 45 sec
RUN B (optimized):       ~62,000 input tokens ·  3 files read · 18 sec
```

Write your own two counts into `token-audit-worksheet.md`.

## Task batching

Same files batch, different files split. Sweet spot 2-4 changes per prompt, roughly 2.5x
fewer tokens than three separate ones.

```
Add three fields to the Task model: priority (enum: low, medium, high), dueDate (optional datetime), category (optional string). Create one migration for all three. Update the task form and the task list to handle all three.
```

## The three-line prompt formula

Action, scope, constraint. Under 40 words:

```
Add email notifications when a task's due date is tomorrow.
Edit src/app/actions.ts for the logic; create src/lib/notifications.ts for the sender.
Don't add new dependencies. Use what's already installed.
```

The daily checklist says under 30 words for the same formula. The checklist is the one you
carry, so 30 is the one that bites.

## Ignore what Claude doesn't need

The seven lines are in this folder. Skip `prisma/migrations/` too, but keep
`prisma/schema.prisma` readable or Claude can't see your schema (ch05:232).
