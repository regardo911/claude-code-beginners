<!-- Chapter 5: the A/B token audit, blank (ch05:150-174 and the BUILD STEP at ch05:234-250). Every number is one you read off your own dashboard or your own context bar. -->

# Token Audit Worksheet

Copy this file into your project and fill it in as you go. The prompts for Run A and Run B
are in `six-sinks.md` in this folder.

## Before

Date: ______

| | Your reading |
|---|---|
| Plan (Pro / Max / API) | ______ |
| Today's API spend, if you're on API | ______ |
| Time you first hit the rate limit, if you're on Pro or Max | ______ |
| Dollar cost on Pro or Max | the plan is flat, so use the rate-limit time above |

## Run A: wide prompt, default effort

| | Your reading |
|---|---|
| Input tokens | ______ |
| Files read | ______ |
| Seconds | ______ |

## Run B: `/effort medium`, scoped prompt

| | Your reading |
|---|---|
| Input tokens | ______ |
| Files read | ______ |
| Seconds | ______ |

## The gap

| | Your number |
|---|---|
| A minus B, input tokens | ______ |
| B as a share of A | ______ |

## The six fixes, on or off

- [ ] 1. One conversation per feature, opened with a one-line handoff
- [ ] 2. `/effort low` before mechanical changes, `/effort high` before real features
- [ ] 3. File map in CLAUDE.md, and named files in prompts
- [ ] 4. LSP active (`/config`)
- [ ] 5. Three-line prompts, no preamble
- [ ] 6. Asking for edits, not explanations
- [ ] `/compact` when the context bar passes ~60% mid-feature
- [ ] `.gitignore` has the seven lines

## After a normal day with all six on

Date: ______

| | Your reading |
|---|---|
| Today's API spend, if you're on API | ______ |
| Time you first hit the rate limit, if you're on Pro or Max | ______ |
| Lower than the before-number? | ______ |
