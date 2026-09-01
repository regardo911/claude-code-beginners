<!-- Chapter 6: every command in the power-features chapter (ch06:19-270). All of these need your own Claude Code on a paid plan. The slash commands run inside a live session, not at your shell. -->

# Chapter 6: Power Feature Commands

## Remote control

Start a named session with remote control on, from your project folder:

```
claude --remote-control "task-tracker"
```

A `/rc active` link appears in the footer. Select it (down arrow, then Enter), or run
`/remote-control` again, for a status panel with a session URL and a QR code.

```
/remote-control
```
```
/mobile
```
```
/login
```

`/mobile` gives you a download QR for the Claude app. `/login` matters because remote
control runs through your claude.ai login on a paid plan, and a raw API key won't work
(ch06:33).

Three ways to pair: open the session URL in a browser, scan the QR, or pick the session by
name in claude.ai/code or the Claude app.

**Two prompts that work well remotely.** Self-contained, so Claude never stops to ask you
something you'd have to type on a phone keyboard:

```
Build a statistics dashboard showing task counts by status. Put it at /dashboard. Use the existing Tailwind styles.
```

```
Run the full test suite. Generate a coverage report. List every function with no test, grouped by file. Write the list to UNTESTED.md.
```

Drop the effort before you walk away:

```
/effort medium
```

## Background agents

```
claude agents
```
```
claude agents --help
```

The agent view lists your background sessions and their status. The key presses inside it
get refined over time, so follow the view's own prompts rather than memorizing a sequence.

One worktree per task, so two sessions can't fight over the same file:

```
claude --worktree "search-feature"
```

Short form is `-w`. Start with two background tasks, not five.

## Voice mode

```
/voice
```

Push-to-talk: hold a key, speak, release. Local only, so it isn't available in a remote or
headless session (ch06:130). Four spoken prompts worth having:

```
Show me what files changed yesterday. Run the test suite. Tell me if anything is broken.
```
```
The status badge on completed tasks shows blue instead of green. Fix the badge color in the TaskList component.
```
```
What would it take to add drag-and-drop reordering to the task list? Don't build it yet. Just tell me which files would change and roughly how many lines.
```
```
Summarize everything I built today. List the files that changed. Any TODO comments I left to address tomorrow?
```

Transcription mangles technical terms. For anything with variable names or file paths in it,
typing is still more reliable.

## LSP

For TypeScript, install the compiler and Claude Code picks up the language server:

```
npm install -D typescript
```

Ask Claude directly:

```
Is the LSP active for this TypeScript project? If not, tell me what I need to install.
```

Sanity-check it:

```
Where is the deleteTask function defined?
```

**Checkpoint:** an instant `file:line` answer with no visible file-scan means LSP is
working. Python uses `pyright` or `pylsp`, Go uses `gopls`, Rust uses `rust-analyzer`.

## MCP

The clean way to add a server is the CLI, not hand-editing a config file.

```
claude mcp add filesystem -- npx -y @modelcontextprotocol/server-filesystem /Users/you/Downloads
```

Swap the path for your own. The `--` separates the `claude mcp add` options from the command
that launches the server.

```
claude mcp list
```
```
claude mcp get filesystem
```

**Checkpoint:** `claude mcp list` shows a `filesystem` entry, and `claude mcp get filesystem`
reports the directory you scoped it to.

Browser control, which automates the Chapter 4 screenshot loop:

```
claude mcp add playwright -- npx -y @playwright/mcp@latest
```

If a server doesn't show up, re-run the add line and read the error. Usually a typo in the
package name or path. To see your version's options, or to remove one and start over:

```
claude mcp add --help
```
```
claude mcp remove <name>
```

**Before you reach for project scope.** `claude mcp add -s project ...` writes a `.mcp.json`
into the repo, and that file then loads for anyone who opens Claude Code there. Default scope
is local to you, which is what you want.

## Adoption order

| When | Feature | What to do |
|------|---------|-----------|
| First | LSP | Set it up. Forget about it. Almost no learning curve, immediate benefit. |
| Next | Conversation discipline + effort levels | Lock in your Chapter 5 habits before adding complexity. |
| Then | Remote control | Start a long task with `claude --remote-control`, walk away. Approve from your phone. |
| Then | Background agents | Start with 2 parallel tasks in separate worktrees. Build up to 3-4. Output roughly doubles. |
| Then | Voice mode | Use for quick tasks and status checks at your desk. Don't force it on precise work. |
| Later | MCP + coordinated agents | More advanced. Wait until the basics are comfortable. |

Command names move. Confirm syntax against `claude --help` and `code.claude.com`.
