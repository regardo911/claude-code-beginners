# The starter kit from Claude Code for Beginners

**Six files you copy into every new project, plus the prompts from all twelve chapters.**

Companion repository to *Claude Code for Beginners: Zero to Shipping in 48 hours*, from
[youcanbuildthings.com](https://youcanbuildthings.com).

In plain English: this is the folder of files the book has you build. You copy them into a new
project so Claude Code knows your rules, your colors and your file layout before you type
anything. You don't need to know what a CLAUDE.md or an effort level is yet. Pick your line
below.

![Five objects rising left to right across the 48 hours: an empty editor at hour 2, a browser showing a deployed task-tracker.app at hour 8, a phone with a polished checklist at hour 14, a paid $19.99 receipt at hour 46, and at hour 48 a folder with the six starter-kit files fanned out of it](docs/images/hero.png)

[Read the disclaimer](DISCLAIMER.md) for the security checklist and the revenue numbers.

## Start here

Pick the line that describes you.

### "I finished the book and I want the kit in my project"

```bash
git clone https://github.com/regardo911/claude-code-beginners.git
cd claude-code-beginners
./install.sh ~/my-project
```

Six files land in your project root and it prints what it wrote. On Windows,
`.\install.ps1 C:\code\my-project`.

Then open `~/my-project/CLAUDE.md`, fill in the brackets, and run `claude` in that folder.
That file is the one that makes Claude Code read your rules before you type anything.

### "I already have a project with its own CLAUDE.md"

Look before you leap:

```bash
./install.sh --dry-run ~/my-project
```

That prints what it would write and what it would leave alone, and changes nothing. Run it
without `--dry-run` when the list looks right. Anything you already have is kept as it is
unless you pass `--force`, so your own CLAUDE.md survives by default.

### "I'm partway through the book and I want one chapter"

```bash
ls chapters/
```

One folder per chapter that has something to do, numbered the way the book is. Open the
number you are on: each folder holds that chapter's prompts, commands and checklists, and a
README saying what to run and what success looks like.

## The 48 hours

The book is a clock. Each chapter is a block of hours with one thing you have at the end of
it, and each block has a folder here.

| Hours | Chapter | What you build | What success looks like |
|---|---|---|---|
| 15 min | [02](chapters/02-how-it-works/) | Your first CLAUDE.md | A fresh session names your stack before you mention it |
| 2-8 | [03](chapters/03-empty-folder-to-live-app/) | A deployed app with auth | A second account can't see the first account's data |
| 9-14 | [04](chapters/04-fix-the-ugly/) | A design system and the screenshot loop | Claude names specific visual problems, not generalities |
| 15-20 | [05](chapters/05-cut-the-token-bill/) | Six fixes and a token worksheet | Your scoped run costs less than your wide run |
| 21-28 | [06](chapters/06-power-features/) | Remote control, agents, voice, LSP, MCP | Two agents finish in separate worktrees without colliding |
| 29-34 | [07](chapters/07-security-and-tests/) | A 20-point audit and a test suite | Second audit run is all PASS or N/A; the XSS test renders as text |
| 35-40 | [08](chapters/08-clean-up-the-mess/) | A leaner tree and a monthly routine | Lower file count, green tests, CLAUDE.md under 30 lines |
| 41-46 | [09](chapters/09-price-tag-and-launch/) | Stripe, a landing page, five launch gates | A test card flips your account to Pro from the webhook |
| 47-48 | [10](chapters/10-your-repeatable-workflow/) | The one-page daily checklist | One full day run against it |
| next | [12](chapters/12-what-comes-next/) | A skill file and your next sprint plan | A project name and a filled-in CLAUDE.md in a new folder |

Chapters 1 and 11 are reading, not building, so they have no folder.

## Where each file goes

| Chapter | In this repo | Where it goes in your project |
|---|---|---|
| 10 | `starter-kit/` (all six) | your project root, via `./install.sh` |
| 2, 3, 8 | `chapters/*/CLAUDE.md*.example` | `CLAUDE.md` |
| 4 | `chapters/04-fix-the-ugly/design-system.md` | `design-system.md` |
| 3, 9 | `chapters/*/.env.local*.example` | `.env.local`, never committed |
| 5 | `chapters/05-cut-the-token-bill/.gitignore` | `.gitignore` |
| 12 | `chapters/12-what-comes-next/SKILL.md.example` | `styling.md` in your skills folder |
| 5, 12 | the two worksheets | anywhere you'll fill them in |
| all | `chapters/*/[prompts, commands, checklists]` | nowhere. You paste them into a session. |

[`appendix/token-cost-reference.md`](appendix/token-cost-reference.md) has the token tables,
the five effort levels, and the monthly budget calculator with the price left as a field you
look up, because it's model-dependent and it moves.

## What you need

To read it: nothing. It's Markdown.

To run the installer: the shell you already have. `sh` on macOS, Linux or WSL, PowerShell on
Windows. No package manager, no runtime, no install step.

To run the prompts: your own Claude Code on a paid plan, Pro or higher, which is the book's
stated prerequisite.

## License

MIT, see [LICENSE](LICENSE). Educational material: no warranty, no earnings guarantee, and
the security checklist is a floor rather than a certification.
