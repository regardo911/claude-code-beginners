# Chapter 5: Cut the Token Bill

## Where each sink lives

Six ways a session wastes money, and the file in this folder that plugs each one.

| Sink | The fix | Where |
|---|---|---|
| Conversations that run too long | one conversation per feature, opened with a handoff line | `six-sinks.md` |
| Wrong effort level | `/effort low` for mechanical work; the default is already `high` | `six-sinks.md` |
| Reading files it doesn't need | name the files, and keep a file map in CLAUDE.md | `CLAUDE.md-file-map.example` |
| Not using LSP | install the language server; check `/config` | `six-sinks.md` |
| Verbose prompts | action, scope, constraint, under 40 words | `six-sinks.md` |
| Asking for explanations you didn't want | ask for edits, say "don't explain them" | `six-sinks.md` |
| Files Claude should never read | the seven `.gitignore` lines | `.gitignore` |

## Run the A/B

The prompts are in `six-sinks.md`: one wide prompt at default effort, one scoped prompt at
`/effort medium`, same feature, fresh session each time. Write both counts into
`token-audit-worksheet.md`.

That worksheet ships blank until you fill it. The book's own before-and-after numbers are
labelled illustrative where they're printed. Yours will be different.

## Done when

Two numbers of your own in the worksheet, and the second is smaller. Then run a normal day
with all six fixes on and check tomorrow: fewer dollars on API, or a later rate-limit hit on
Pro and Max.

## On your own project

The file map transfers hardest and pays most. Five lines naming what lives where, pasted into
CLAUDE.md, and Claude stops scanning your tree for a file you already knew the name of.
Rewrite it whenever the structure moves. Chapter 8 rewrites it once already.
