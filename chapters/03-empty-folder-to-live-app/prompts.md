<!-- Chapter 3: the four prompts that take an empty folder to a deployed app, plus the auth fix (ch03:73, 125, 195, 231, 270). Paste them into a live Claude Code session, one at a time, reviewing between each. Two commands below are marked as ones Claude runs rather than ones you type. -->

# Chapter 3: Prompts

## 1. Scaffold the project (ch03:73)

```
Create a Next.js project with the App Router, TypeScript, and Tailwind CSS. Set up a SQLite database using Prisma. Create a Task model with these fields: id (auto-increment), title (string, required), description (string, optional), status (enum: todo, in_progress, done), createdAt (datetime, auto). Initialize the database and create the first migration.
```

Note what this prompt does not say: which version of Next.js. You don't have to. Claude
scaffolds the current one.

## 2. Build the first feature (ch03:125)

```
Build a task management page at the root URL. It should show a list of all tasks from the database, display each task's title, status, and creation date, have a form at the top to create new tasks with title and description fields, and have a button on each task to cycle its status from todo to in_progress to done. Use server components for the task list and a client component for the form. Style everything with Tailwind.
```

Then `npm run dev` and open `http://localhost:3000`.

If the dev server won't start, the usual one is `Module not found: Can't resolve
@prisma/client`. Give Claude the exact error rather than a guess at the cause:

```
When I run npm run dev, I get 'Module not found: Can't resolve @prisma/client'.
```

**Claude runs this, you don't type it:** the fix is normally `npx prisma generate`, or
reinstalling dependencies. You'll watch it scroll past in the session (ch03:179).

## 3. Add authentication (ch03:195)

```
Add authentication using NextAuth.js with a credentials provider. Users should be able to sign up with an email and password. Hash passwords with bcrypt. Add a userId field to the Task model so each user only sees their own tasks. Create a login page and a signup page. Redirect unauthenticated users to the login page. Update the task list to only show tasks belonging to the logged-in user.
```

Before you log in, set the secrets. See `.env.local.example` in this folder. Generate the
signing secret with:

```
openssl rand -base64 32
```

Then restart the dev server. It only reads `.env.local` at startup.

### Then run the two-account check

Log out. Create a second account. If the new account can see the first account's tasks,
Claude wired up the login but never scoped the queries. One prompt fixes it (ch03:231):

```
Every Prisma task query needs to filter by the logged-in user's id. Read the session in each query, scope every findMany, create, update, and delete to that user's id, and reject the request if there's no session.
```

Re-run the two-account check. Empty list on the new account means it's fixed.

## 4. Deploy (ch03:270)

```
Deploy this app to Vercel. Walk me through the steps I need to do manually (like connecting my GitHub repo), and do everything else automatically.
```

SQLite is a local file and won't survive most cloud platforms, so you'll be switching to a
hosted Postgres:

```
Switch the database from SQLite to a hosted Postgres and set up the connection for deployment.
```

The one thing Claude can't do: create the actual database in your provider's dashboard.
Create it, copy the connection string, paste it into `.env.local`, then:

```
I've set the DATABASE_URL environment variable. Run the migration against the production database.
```

**Claude runs this, you don't type it:** that prompt makes Claude run
`npx prisma migrate deploy`, which is what puts your schema in the cloud database (ch03:288).

Check the current free-tier limits on whichever provider you pick before you lean on it, since
they shift over time (ch03:284).
