<!-- Chapter 8: the monthly cleanup routine (ch08:393-420). It applies to every project, every month (ch10:250). -->

# Monthly Cleanup

Twenty-three minutes, first Monday of the month. Put it in your calendar. Skip it three
times and the debt compounds until a cleanup feels like a project instead of a chore
(ch08:422).

1. Run dead code analysis (5 minutes)
2. Check for duplicate utilities (5 minutes)
3. Review file structure (5 minutes)
4. Update CLAUDE.md (5 minutes)
5. Run `npm audit` for security (Chapter 7, 2 minutes)
6. Run the full test suite, `npm test` (1 minute)

Steps 1-4 run as one prompt. Paste this into Claude Code:

```
Monthly cleanup. In order: find and delete confirmed dead code, find
and merge duplicate utilities, check the file structure against the
folders in CLAUDE.md, then update CLAUDE.md. Show me each step's
findings before you change anything.
```

Then close it out yourself:

```
npm audit
npm test
```

**What you should see:** Claude's step-by-step findings, no audit vulnerabilities, all
tests green.
