<!-- Chapter 7: the prompts that get Claude writing tests, in the order the chapter uses them (ch07:118-235). -->

# Chapter 7: Test Prompts

For AI-generated code the pyramid flips: integration tests first, because Claude generates
whole features rather than individual functions.

**Integration tests** (ch07:130):

```
Write integration tests for the task CRUD operations. Test creating a task, reading the task list, updating a task's status, and deleting a task. Each test should use a real database connection (a test SQLite database), not mocks. Verify both the success path and the error path (missing required fields, invalid status values, unauthorized access).
```

The real-database part matters. Mocked tests tell you your code calls the right functions.
A real database tells you the data actually saves and comes back.

**Unit tests, for the complex bits only** (ch07:136):

```
Write unit tests for any utility functions that have complex logic. Focus on edge cases: empty inputs, null values, dates in the past, negative numbers.
```

**Jest setup** (ch07:150):

```
Configure Jest for this Next.js TypeScript project. Set up a test database that resets before each test suite. Add a test script to package.json.
```

Which adds:

```json
"scripts": {
  "test": "jest --coverage"
}
```

**The edge cases Claude misses on its own** (ch07:224):

```
Write tests for these edge cases: task title with 201 characters (should reject), task with HTML in the title (should sanitize), creating a task when not authenticated (should return 401), updating a task that doesn't exist (should return 404), toggling status on a task belonging to another user (should return 403).
```

Those double as security tests. "Unauthenticated users get a 401" is an auth test. "HTML is
sanitized" is an XSS test.

**Then run them:**

```bash
npm test
```

If Jest fails to *start* rather than failing a test, don't debug the config by hand:

```
jest won't start, fix the Jest config for this Next.js project.
```

## How many is enough

- 3-4 tests per CRUD operation (create, read, update, delete)
- 1-2 tests per authentication scenario (login success, login failure, unauthenticated access)
- 1 test per input validation rule (max length, required fields, sanitization)

Roughly 20-25 tests, running in under 10 seconds. You don't need 100% coverage. You need
100% confidence that creating tasks, authenticating users, and validating inputs work.

If Claude writes tests that do five things at once or have names like "test1", push back:
"Each test should verify one behavior with a descriptive name."
