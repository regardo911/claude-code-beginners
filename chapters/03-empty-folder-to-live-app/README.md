# Chapter 3: Empty Folder to Live App

## What you build

A deployed web app with a database, user accounts, and a URL you can text to someone. Four
prompts do the work: scaffold, feature, auth, deploy. Also here: the setup commands that come
first, the Task Tracker's CLAUDE.md as the book prints it, and the three environment
variables NextAuth needs.

## Start here

`setup-commands.md` if Claude Code isn't installed yet, or if `claude doctor` isn't green.
Otherwise open `prompts.md` and paste prompt 1:

```
Create a Next.js project with the App Router, TypeScript, and Tailwind CSS. Set up a SQLite database using Prisma. Create a Task model with these fields: id (auto-increment), title (string, required), description (string, optional), status (enum: todo, in_progress, done), createdAt (datetime, auto). Initialize the database and create the first migration.
```

A full project in one to three minutes. Then work down the file.

## Done when

Two accounts. Log in as the first, create a task, log out, create a second account, look at
its task list. It should be empty. If it isn't, auth is wired but the queries aren't scoped,
and the fix is the one prompt at the bottom of step 3 in `prompts.md`. Sixty seconds, and
it's the difference between "login page exists" and "auth works".

## On your own project

The prompts are shaped for the Task Tracker only in their nouns. Swap the model name and
fields in prompt 1, keep the structure, and the sequence holds: scaffold with a data model,
build one feature end to end, add auth, deploy. Copy `.env.local.example` as-is either way.
Its three lines are NextAuth's, not the Task Tracker's.
