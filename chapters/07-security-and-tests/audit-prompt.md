<!-- Chapter 7: the one prompt that runs the 20-point audit (ch07:271), plus the five targeted fixes for the places AI-generated code leaks (ch07:25-114). -->

# The Audit Prompt

Paste this into a session with the checklist open beside you:

```
Run through this 20-point security checklist on the Task Tracker. For each point, check the codebase and tell me: PASS (it's secure), FAIL (there's a vulnerability), or N/A (doesn't apply). Fix every FAIL.
```

You'll get a numbered report, one line per point, with the fixes called out. Which lines
come back FAIL depends entirely on your codebase. The book's own filled report at
ch07:275-285 is "an example shape, not a prediction" (ch07:287). Record your own result in
`starter-kit/security-checklist.md`.

Run the audit a second time after the fixes land. Every line PASS or N/A means it's clean.
A FAIL Claude can't fix comes with a reason and a risk. That one's your call.

## The five places it leaks, and the prompt for each

**1. Auth that looks right but isn't** (ch07:35):

```
Review the authentication setup. Check if session cookies are httpOnly. Check if the NEXTAUTH_SECRET is a real random value, not a placeholder. Add rate limiting to the login endpoint: max 5 attempts per minute per IP.
```

**2. Input validation that doesn't exist** (ch07:43):

```
Add input validation to all user inputs. Sanitize HTML from task titles and descriptions. Limit title to 200 characters, description to 2000 characters. Return clear error messages for invalid input.
```

**3. Queries that trust user input** (ch07:49, ch07:53):

```
Search the entire codebase for raw SQL queries. If any exist, convert them to Prisma queries or ensure they use parameterized inputs. Show me every database query and confirm it's using Prisma's built-in parameterization.
```

```
Verify that every database query that fetches a task also checks that the task belongs to the authenticated user. If any query fetches by ID alone without a userId check, add the check.
```

**4. Environment variables that aren't** (ch07:72). Run the scans in
`secret-scan-commands.md` first, then:

```
Move all hardcoded secrets to environment variables and add .env to .gitignore.
```

If `.env` was ever committed, removing the file is not enough. Rotate the actual values.

**5. Dependencies with known vulnerabilities** (ch07:98):

```
Run npm audit and fix any vulnerabilities. For vulnerabilities that can't be auto-fixed, tell me what they are and what the risk is.
```

**Bonus: CORS** (ch07:112):

```
Add CORS headers to the API routes. Allow requests only from the production domain and localhost (for development). Block all other origins.
```

## Before real users touch it (ch07:291-305)

```
Create custom error pages for 404 (not found) and 500 (server error). The pages should show a friendly message, not a stack trace. Include a link back to the homepage.
```

```
Add rate limiting to all API endpoints and server actions. Max 30 requests per minute per user for write operations (create, update, delete). Max 60 requests per minute for read operations.
```

```
Create a database backup script that exports all data to a JSON file. Add it to a cron job that runs daily.
```

```
Create a simple privacy policy page for the Task Tracker. The app collects email addresses for authentication and stores task data. No data is shared with third parties. Users can delete their account and all associated data.
```

```
Add a 'Delete Account' button in the user settings. When clicked, delete the user's account and all their tasks from the database. Require password confirmation before deletion.
```

## Verify the XSS fix yourself (ch07:319)

Enter `<script>alert('test')</script>` as a task title and save it. You should see that
literal text sitting in your task list. You must not see an alert box. If the alert fires,
sanitization failed. Paste the title and the failure back to Claude and tell it to escape
HTML on render.
