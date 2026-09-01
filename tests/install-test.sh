#!/bin/sh
# the one test in this repo, for the one thing that could damage a reader's project:
# install.sh writes into a folder they already own, so it must never clobber a file
# they wrote themselves.
#
#   sh tests/install-test.sh
#
# no framework. prints one line per assertion and an assertion count at the end,
# so a run that silently matched nothing can't pass.
set -u

repo="$(cd "$(dirname "$0")/.." && pwd)"
installer="$repo/install.sh"
kit='CLAUDE.md design-system.md .gitignore prompts.md security-checklist.md monthly-cleanup.md'

assertions=0
failures=0

ok() {
	assertions=$((assertions + 1))
	printf '  ok    %s\n' "$1"
}

no() {
	assertions=$((assertions + 1))
	failures=$((failures + 1))
	printf '  FAIL  %s\n' "$1"
}

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT INT TERM

# ---------------------------------------------------------------- a clean target
printf '\na clean project directory\n'
mkdir -p "$tmp/clean"

if out="$(sh "$installer" "$tmp/clean" 2>&1)"; then
	ok 'exits 0'
else
	no "exits 0 (got $?)"
	printf '%s\n' "$out"
fi

for f in $kit; do
	if [ -f "$tmp/clean/$f" ]; then
		ok "wrote $f"
	else
		no "did not write $f"
	fi
done

if printf '%s\n' "$out" | grep -q '^6 wrote, 0 skipped\.$'; then
	ok 'reports 6 wrote, 0 skipped'
else
	no 'reports 6 wrote, 0 skipped'
fi

# --------------------------------------------- a target with the reader's own file
printf "\na project that already has the reader's own CLAUDE.md\n"
mkdir -p "$tmp/owned"
mine='# my own rules
never overwrite this line'
printf '%s\n' "$mine" >"$tmp/owned/CLAUDE.md"

out="$(sh "$installer" "$tmp/owned" 2>&1)" || no 'exits 0 when a file is skipped'

if [ "$(cat "$tmp/owned/CLAUDE.md")" = "$mine" ]; then
	ok "the reader's CLAUDE.md is byte-for-byte untouched"
else
	no "the reader's CLAUDE.md was modified"
fi

if printf '%s\n' "$out" | grep -q 'skipped (already exists)  CLAUDE.md'; then
	ok 'reports CLAUDE.md as skipped'
else
	no 'reports CLAUDE.md as skipped'
fi

if printf '%s\n' "$out" | grep -q '^5 wrote, 1 skipped\.$'; then
	ok 'reports 5 wrote, 1 skipped'
else
	no 'reports 5 wrote, 1 skipped'
fi

if [ -f "$tmp/owned/prompts.md" ] && [ -f "$tmp/owned/.gitignore" ]; then
	ok 'the other five still landed'
else
	no 'the other five did not land'
fi

if printf '%s\n' "$out" | grep -q 'fill in the brackets'; then
	no "told the reader to fill in brackets in a CLAUDE.md that is still theirs"
else
	ok 'does not tell the reader to edit a file it just refused to write'
fi

# --force is the only way through, and it has to actually work
sh "$installer" "$tmp/owned" --force >/dev/null 2>&1
if [ "$(cat "$tmp/owned/CLAUDE.md")" != "$mine" ]; then
	ok '--force does overwrite, so the guard above is real and not a no-op'
else
	no '--force did not overwrite'
fi

# ------------------------------- a target where the skipped file is NOT the CLAUDE.md
# different branch of the closing message, and the only case where a file is skipped
# while kept_claude_md stays 0.
printf '\na project that already has its own .gitignore\n'
mkdir -p "$tmp/hasignore"
printf 'node_modules/\n' >"$tmp/hasignore/.gitignore"

out="$(sh "$installer" "$tmp/hasignore" 2>&1)" || no 'exits 0 when only .gitignore is skipped'

if [ "$(cat "$tmp/hasignore/.gitignore")" = "node_modules/" ]; then
	ok "the reader's .gitignore survives"
else
	no "the reader's .gitignore was replaced"
fi

if [ -f "$tmp/hasignore/monthly-cleanup.md" ]; then
	ok 'the loop kept going past the skip and wrote the last file'
else
	no 'the loop stopped at the skip'
fi

# ------------------------------------------------------------ a target that is not there
printf '\na target directory that does not exist\n'
if out="$(sh "$installer" "$tmp/no-such-project" 2>&1)"; then
	no 'should exit non-zero'
else
	ok 'exits non-zero'
fi

if printf '%s\n' "$out" | grep -q 'is not a directory'; then
	ok 'says what is wrong in one sentence'
else
	no "says what is wrong in one sentence (got: $out)"
fi

if printf '%s\n' "$out" | grep -q '^cp:'; then
	no 'leaked a raw cp error at the reader'
else
	ok 'no raw cp error leaked'
fi

# ------------------------------------------------- the clone itself as the target
printf '\nthe repo directory given as the target\n'
if out="$(sh "$installer" "$repo" 2>&1)"; then
	no 'should refuse to install into its own clone'
else
	ok 'refuses to install into its own clone'
fi

if [ ! -e "$repo/CLAUDE.md" ]; then
	ok 'no CLAUDE.md dropped at the repo root'
else
	no 'dropped a CLAUDE.md at the repo root'
fi

if [ ! -e "$repo/.gitignore" ] || ! grep -q '^[^#]*\.env' "$repo/.gitignore"; then
	ok "root .gitignore carries no .env rule, so .env.local.example files stay visible to git"
else
	no 'a root .gitignore now hides the .env.local.example files'
fi

if git -C "$repo" ls-files --error-unmatch \
	chapters/03-empty-folder-to-live-app/.env.local.example \
	chapters/09-price-tag-and-launch/.env.local.stripe.example >/dev/null 2>&1; then
	ok 'both .env.local.example files are still tracked by git'
else
	no 'an .env.local.example file fell out of git'
fi

# ---------------------------------------------------------------- no target at all
printf '\n--dry-run writes nothing\n'
dry="$(mktemp -d)"
printf 'mine\n' >"$dry/CLAUDE.md"
before="$(find "$dry" -mindepth 1 | wc -l | tr -d ' ')"
out="$(sh "$installer" --dry-run "$dry" 2>&1)"
after="$(find "$dry" -mindepth 1 | wc -l | tr -d ' ')"

if [ "$before" = "$after" ]; then
	ok 'leaves the target directory exactly as it was'
else
	no "--dry-run wrote something: $before entries before, $after after"
fi

if printf '%s' "$out" | grep -q 'nothing was written'; then
	ok 'says plainly that nothing was written'
else
	no '--dry-run did not say it wrote nothing'
fi

if printf '%s' "$out" | grep -q 'would skip (already exists)  CLAUDE.md'; then
	ok 'reports the file it would leave alone'
else
	no '--dry-run did not report the pre-existing CLAUDE.md'
fi

if [ "$(cat "$dry/CLAUDE.md")" = 'mine' ]; then
	ok 'the pre-existing CLAUDE.md is byte-identical after a dry run'
else
	no '--dry-run altered an existing file'
fi
rm -rf "$dry"

printf '\nno target directory given\n'
out="$(sh "$installer" 2>&1)" && status=0 || status=$?
if [ "$status" -eq 2 ]; then
	ok 'exits 2'
else
	no "exits 2 (got $status)"
fi

if printf '%s\n' "$out" | grep -q '^usage: install.sh'; then
	ok 'prints usage'
else
	no 'prints usage'
fi

# ---------------------------------------------------------------------------- result
printf '\n%d assertions, %d failures\n' "$assertions" "$failures"

if [ "$assertions" -eq 0 ]; then
	printf 'no assertions ran at all, which is a failure, not a pass\n'
	exit 1
fi

[ "$failures" -eq 0 ] || exit 1
