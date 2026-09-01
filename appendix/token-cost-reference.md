<!-- Appendix A: the token cost tables and the budget calculator (appendices:1-70). Rough estimates, close enough for planning. -->

# Token Cost Reference

## Token basics

| Unit | Approximate Tokens |
|------|-------------------|
| 1 English word | 1-2 tokens |
| 1 line of code | 10-20 tokens |
| 1 page of text (250 words) | 250-350 tokens |
| A 100-line source file | 1,000-2,000 tokens |
| A 500-line source file | 5,000-10,000 tokens |

## Cost per action

| Action | Input Tokens | Output Tokens | Relative Cost |
|--------|-------------|---------------|---------------|
| Short prompt (1-2 sentences) | 50-100 | 0 | Minimal |
| Read a small file (50 lines) | 500-1,000 | 0 | Low |
| Read a large file (500 lines) | 5,000-10,000 | 0 | Medium |
| Run a terminal command | 50-200 (command) + output | 0 | Varies with output |
| Generate a component (100 lines) | 0 | 1,000-2,000 | Medium |
| Generate a full feature (300 lines) | 0 | 3,000-6,000 | High |
| Conversation history (20 messages) | 10,000-50,000 | 0 | High (and growing) |

## Effort levels

Five of them, and the default is `high`. If you never touch the lever, every task runs at
high effort, trivial ones included. Switch with `/effort <level>` in a session, or
`--effort <level>` when you launch.

| Effort Level | Thinking Tokens | Best For | Relative Cost |
|-------------|----------------|----------|---------------|
| Low | Minimal | File edits, renames, simple changes | Lowest |
| Medium | Moderate | Small features, quick bug fixes | Low |
| High (default) | Generous | Most feature building, multi-step bug fixes, tests | Moderate |
| Xhigh | Extensive | Architecture decisions, gnarly debugging | High |
| Max | Maximum | Hardest multi-file refactors, deep reasoning | Highest |

## Subscription tiers

| Feature | Pro ($20/mo) | Max ($100/mo) | Max ($200/mo) | API (pay per token) |
|---------|-------------|---------------|---------------|---------------------|
| Rate limits | Moderate | High | Very High | Unlimited (pay per use) |
| Best for | Learning, side projects | Daily building | Heavy production use | Variable/team use |
| Rough monthly headroom | A few million tokens | Several times Pro | Several times Max ($100) | Whatever you use |

"Rough monthly headroom" is a ballpark for sizing your plan, not a published quota. Pick by
how hard you lean on Claude Code each day, then watch your actual usage.

## Monthly budget calculator

Fill this in for your own API usage. Look up the price for line 4 yourself: it's
model-dependent and it moves.

| | Step | Your number |
|---|------|-------------|
| 1 | Features you build per day | ______ |
| 2 | × average tokens per feature (~50,000) | ______ |
| 3 | × working days per month (22) | ______ |
| 4 | × current input token price, per million, look it up | ______ |
| 5 | + 30% for output tokens | ______ |

The book's worked example (appendices:59): 5 features/day × 50,000 tokens × 22 days = 5.5M
tokens/month. At $3 per million input tokens (Sonnet 4.6's rate at the time of writing),
that's about $16.50 input and $5 output, roughly $21.50/month.

## Quick optimization reference

| Problem | Fix | Chapter |
|---------|-----|---------|
| Hitting rate limit by afternoon | Restart conversations every 15-20 messages | 5 |
| High cost per feature | Match effort level to task complexity | 5 |
| Slow Claude responses | Enable LSP, reduce file count | 5, 6, 8 |
| Claude reads wrong files | Add file structure to CLAUDE.md | 2, 5 |
| Bloated context | Use /compact or start fresh | 5 |
| Claude re-reads files | Keep .gitignore tight, use specific file references | 5 |
