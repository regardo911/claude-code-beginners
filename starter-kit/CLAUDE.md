<!-- Chapter 10: the CLAUDE.md template from the starter kit (ch10:240). Structure from the mature file at ch08:303-333, with the Task Tracker specifics stripped out. Keep the finished file under 30 lines (ch08:333). -->

# [Project name]

[One sentence: what this app does, and the stack Claude scaffolded for it.]

## Architecture
- [How things render, e.g. server components by default, client components only for interactivity]
- [How data is reached, e.g. all database queries through the ORM, no raw SQL]
- [Where a whole category of code lives, e.g. all server actions in src/actions/]
- [What every query must be scoped to, e.g. always scoped to the authenticated user]

## File Structure
- [src/app/]: [pages, layouts, API routes]
- [src/components/]: [UI components]
- [src/lib/]: [utilities and shared logic]
- [src/types/]: [type definitions]
- [src/actions/]: [server actions]

## Design
Follow design-system.md. [How styling is applied here, e.g. all styling through Tailwind.]

## Rules
- [What has to be true before a change lands, e.g. new features need tests before merge]
- [A recurring maintenance rule, e.g. run npm audit weekly]
- Effort: low for mechanical edits, the default high for features, xhigh or max for architecture
