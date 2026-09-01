<!-- Chapter 7: the four commands that find secrets in your own code (ch07:59-70, ch07:87). These run inside YOUR generated app, against its src/ directory. -->

# Secret Scan Commands

Thirty seconds, in your project root.

```bash
# Find hardcoded secrets in source files
grep -r "sk_\|pk_\|password=\|secret=" src/ --include="*.ts" --include="*.tsx"

# Check if .env was ever committed to git
git log --all -- .env .env.local .env.production

# Find API keys or tokens in any file
grep -rn "Bearer \|apiKey\|API_KEY" src/
```

```bash
npm audit
```

Any hits from the first or third command mean secrets are sitting in your source code.

The `git log` one is the nastier check. A file removed from the latest commit is still in
your history, and so is the diff where you swapped a placeholder for a real value. If it was
ever pushed to a public repo, treat those secrets as compromised and rotate them. Deleting
the file does nothing (ch07:74-78).
