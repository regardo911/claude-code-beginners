# Chapter 2: How Claude Code Actually Works

Two files. `CLAUDE.md.example` is the first CLAUDE.md the book has you write: what the
project is, what stack it uses, and the rules you want followed. `try-it-now.md` is every
"try this now" in the chapter, in order, with the checkpoint that tells you whether it worked.

Start with the first block in `try-it-now.md`: `claude doctor`, then `claude`, then
`what files are in this directory?`. Watch the terminal, not the answer. You want to see it
run a command and read the output before it says anything.

Done when a file you never typed exists on your disk, and when a fresh session in a folder
with a CLAUDE.md answers a question about your stack before you mention the stack.

On your own project: copy `CLAUDE.md.example` into your project root and replace the three
lines with your project, your stack, and one rule you care about. Five minutes, and it pays
for itself on the second conversation. Most people never write it.
