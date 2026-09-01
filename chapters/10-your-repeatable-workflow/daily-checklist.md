<!-- Chapter 10: the one-page checklist, exactly as the book prints it (ch10:72-102). Five sections. Tape it next to your monitor or screenshot it to your phone. Every item traces to a chapter that teaches the why. -->

# The Daily Checklist

```
CLAUDE CODE DAILY CHECKLIST

BEFORE YOU START
□ Fresh conversation for each feature
□ Effort defaults to high; /effort low for edits, up to xhigh/max for architecture
□ Check CLAUDE.md is current

EACH FEATURE
□ Prompt: action + scope + constraints (under 30 words)
□ Review output (read changed files, run app)
□ Run tests
□ Screenshot loop for visual changes
□ New conversation when done

TOKEN MANAGEMENT
□ Restart conversations every 15-20 messages
□ Use /compact if mid-task and context is 60%+
□ Specific file references in prompts
□ .gitignore up to date (Claude Code respects it)

WEEKLY
□ npm audit (security dependencies)
□ Full test suite run
□ Check Anthropic dashboard for spend trends

MONTHLY
□ Dead code cleanup (5 min)
□ Duplicate code check (5 min)
□ File structure review (5 min)
□ CLAUDE.md audit (5 min)
```

## The three prompts the checklist assumes

Morning, on low effort (ch10:29):

```
Run the test suite. Show me any failures. Then show me the last 3 git commits so I know where I left off.
```

Before that, from your own shell (ch10:23):

```
git status
```

End of day (ch10:59):

```
Show me all files that changed today. Summarize what was built.
```

Then commit, and write yourself a one-sentence note for tomorrow: "Next: add email
notifications for due dates." That note is for you, not for Claude, and it saves the five
minutes of "what was I working on?"
