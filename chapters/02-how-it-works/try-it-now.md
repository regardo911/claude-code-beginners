<!-- Chapter 2: every "try this now" in the chapter, in the book's running order, with the CHECKPOINT that tells you whether it worked (ch02:17-180). These go into a live Claude Code session. -->

# Chapter 2: Try It Now

Typed at your shell or pasted into a running `claude` session. In order the first time.

## Prove it reads, writes and runs (ch02:17-27)

```
claude doctor
```
Green means ready. Fix anything red before you go on.

```
claude
```

```
what files are in this directory?
```
Watch the terminal, not the answer: Claude runs `ls` or similar, reads the output, and only
then tells you what it found.

```
create a file called hello.txt containing the text "it works"
```

Quit the session and check from your own shell:

```
cat hello.txt
```

**Checkpoint:** `it works` prints. You never opened an editor.

## Watch the context window fill and reset (ch02:43-51)

Note the context indicator, then:

```
read every file in this folder and summarize what this project does
```

The number climbs. Now:

```
/compact
```

**Checkpoint:** the number comes down. Past 60%, ask whether to keep going. Past 80% with
`/compact` not buying enough room, start fresh instead.

## Feel the cheap setting against the expensive one (ch02:79-85)

```
/config
```
Find the effort setting. Untouched, it reads `high`.

```
/effort low
```
```
write a Python function that reverses a string
```

```
/effort max
```
```
suggest a folder structure for a Python web app with a database and explain the trade-offs
```

**Checkpoint:** the trivial function barely paused on `low`; the architecture question made
`max` work for it. That extra work is reasoning, and reasoning is what you pay for.

## The four things it actually does (ch02:87-103)

Reads:
```
read every file in this folder and tell me in one sentence what this project does
```
**Checkpoint:** the summary names a real filename or dependency you recognize.

Writes:
```
create a folder called demo with a notes.txt inside it that says hello
```
Then `ls demo` from your own terminal.

Runs:
```
run "date" and tell me the result
```
**Checkpoint:** a chatbot would invent a plausible date. This ran a real command.

Decides:
```
write a Python script that prints the numbers 1 to 10, save it as count.py, run it, and fix it if it errors
```
**Checkpoint:** a run-fix-rerun loop with no prompting from you is a decision, not a response.

## Watch the loop on a real task (ch02:119)

Once you have a project:

```
add a due date field to tasks in the database and show it in the UI
```

Read the terminal instead of waiting for the end: structure, database, UI, plan, execute,
test.

## The five beginner mistakes, felt rather than read (ch02:152-172)

**1. Google-search prompts.** Give it the vague version first:
```
add login
```
Note what it invented. Fresh session, delegated version:
```
add a login page using NextAuth with Google OAuth, use Tailwind, store sessions in Postgres
```

**2. One massive prompt.** One task, only one:
```
create a single-page to-do list app with an input box and a list, in one HTML file
```

**3. Not reviewing between prompts.** Before you ask for anything else:
```
summarize every file you just changed and what each change does
```
**Checkpoint:** a line that surprises you is the bug you would have built three features on.

**4. Fighting instead of resetting.** Quit the stuck session, start fresh, open with the
file plus the goal in one message:
```
here is task.py [paste it]. it should sort the list ascending and it currently does nothing. rewrite it.
```

**5. Never creating a CLAUDE.md.** Copy `CLAUDE.md.example` into a project folder, edit the
three lines, start `claude` there and ask:
```
what stack does this project use and what's my one rule?
```
**Checkpoint:** it answers with the exact stack and rule you wrote, before you mentioned them.
