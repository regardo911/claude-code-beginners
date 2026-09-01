<!-- Chapter 3: install, verify, start (ch03:11-62). These are the book's only stated prerequisites: a terminal, Claude Code, and a paid Claude plan. -->

# Chapter 3: Setup Commands

Install. macOS, Linux or WSL:

```
curl -fsSL https://claude.ai/install.sh | bash
```

Windows PowerShell:

```
irm https://claude.ai/install.ps1 | iex
```

Already living in Node and would rather have it as a global package (Node 18+)? Skip the
`sudo` form: the official docs warn against `sudo npm install -g`.

```
npm install -g @anthropic-ai/claude-code
```

Claude Code requires Pro or higher. The free Claude.ai plan does not include it (ch03:31).

Sanity-check the install:

```
claude --version
```

```
claude doctor
```

Then create the project and start a session:

```
mkdir task-tracker && cd task-tracker
```

```
claude
```

If `claude --version` says "command not found", the install didn't finish or your PATH
hasn't picked up the binary, so close and reopen your terminal. If `claude doctor` flags
something, do what it says. If you log in and get told you don't have access, you're on the
free plan.
