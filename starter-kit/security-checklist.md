<!-- Chapter 7 / Appendix B: the 20-point audit (ch07:243-269, appendices:74-126). Score it against your own codebase. The checklist is a floor, not a certification: in the book's words, it "does not make your app Fort Knox" (ch07:329). -->

# Security Checklist

Print this. Use it on every project before real users touch the code. It does not change
between projects (ch10:248).

## Authentication (5 points)

- [ ] 1. Passwords hashed with bcrypt or argon2 (never plain text)
- [ ] 2. Session tokens in httpOnly cookies (not accessible by JavaScript)
- [ ] 3. Auth secret is a real random value (not a placeholder or "changeme")
- [ ] 4. Login endpoint rate-limited (max 5 attempts per minute per IP)
- [ ] 5. Password reset tokens expire within 1 hour

## Input Validation (5 points)

- [ ] 6. All inputs validated on the server side (not just client side)
- [ ] 7. HTML sanitized from all text inputs (test: enter `<script>alert(1)</script>`)
- [ ] 8. Input lengths limited (prevent memory exhaustion attacks)
- [ ] 9. File uploads validated for type and size (if applicable)
- [ ] 10. API endpoints reject unexpected parameters

## Data Access (5 points)

- [ ] 11. Every user-data query includes userId check (no IDOR vulnerabilities)
- [ ] 12. No raw SQL queries, or raw SQL uses parameterized inputs
- [ ] 13. API responses don't leak sensitive data (no password hashes in JSON)
- [ ] 14. Admin endpoints require admin role verification (if applicable)
- [ ] 15. Deleted data is actually removed from the database

## Infrastructure (5 points)

- [ ] 16. .env files in .gitignore and never committed to git history
- [ ] 17. No hardcoded secrets in source code (search for "sk_", "key=", "password=")
- [ ] 18. `npm audit` shows zero high/critical vulnerabilities
- [ ] 19. HTTPS enforced on all endpoints
- [ ] 20. CORS configured to allow only your domain

## Quick Test Commands

```bash
# Check for hardcoded secrets
grep -r "sk_\|password=\|secret=" src/ --include="*.ts" --include="*.tsx"

# Check if .env is in git history
git log --all -- .env .env.local .env.production

# Run dependency audit
npm audit

# Test XSS: enter this as input and verify it renders as text
<script>alert('xss')</script>
```

**Score: ___/20. Target: 20/20 before any real user touches the app.**
