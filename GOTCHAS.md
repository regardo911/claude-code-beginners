# gotchas

things that actually went wrong putting this together.

## the installer told you to edit a file it had just refused to overwrite

first version printed the same closing line every time: "open CLAUDE.md, fill in the
brackets". fine on a clean install. wrong when your own CLAUDE.md was the file it skipped,
because your file has no brackets in it and you'd go looking for them.

caught it by running it against a directory with a real CLAUDE.md in it and reading the
output, not by reading the script. there's an assertion for it now in
`tests/install-test.sh`: *does not tell the reader to edit a file it just refused to write*.

## `./install.sh .` would have quietly broken the repo's own env examples

if you point the installer at the clone instead of at your project, it drops the
starter-kit `.gitignore` at the repo root. that file has `.env*` in it, which then matches
`chapters/03-empty-folder-to-live-app/.env.local.example` and
`chapters/09-price-tag-and-launch/.env.local.stripe.example`.

git says so plainly once you ask it the right way:

```
$ git check-ignore -v --no-index chapters/03-empty-folder-to-live-app/.env.local.example
.gitignore:9:.env*	chapters/03-empty-folder-to-live-app/.env.local.example
```

it doesn't show up in a plain `git check-ignore` because those two files are already
tracked, and tracking beats gitignore. so the first check said "not ignored" and that was
misleading. the installer now refuses when the target resolves to its own directory.

## there are three .gitignore files in here and only two of them are the same

`starter-kit/.gitignore` and `chapters/05-cut-the-token-bill/.gitignore` are byte-identical.
the book prints the same seven lines in two roles: the thing chapter 5 has you confirm, and
the thing chapter 10 has you keep, so both are here. it looked like something to clean up
and it isn't. nine lines, and neither copy can drift far.

the one at the repo root is a different file with a different job. it holds `.DS_Store` and
nothing else, and it leaves out the `.env*` line the other two carry, for the reason in the
entry above.

## four files got cut for saying the same thing twice

first pass shipped the 20-point checklist in two places, the monthly cleanup routine in two
places, the prompt library in two places, and a resources page whose only two useful URLs
were already sitting in `chapters/06-power-features/commands.md`. 59 files down to 55.

the rule that survived: an artifact lives wherever you actually use it. the checklist, the
cleanup routine and the prompt library all go into every project, so they live in
`starter-kit/` and the chapter README points at them in one clause.
