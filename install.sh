#!/bin/sh
# copy the six starter-kit files into a project you already own.
#   ./install.sh ~/my-project
# anything already sitting there is left alone and reported as skipped.
# --force is the only way to overwrite, and you have to type it.
# --dry-run prints what it would do and writes nothing.
set -eu

usage() {
	cat <<'USAGE'
usage: install.sh <target-directory> [--dry-run] [--force]

copies six files into a project directory you already have:
  CLAUDE.md  design-system.md  .gitignore
  prompts.md  security-checklist.md  monthly-cleanup.md

a file that already exists is left untouched and reported as skipped.
--force overwrites it instead.
--dry-run shows what it would do and writes nothing.
USAGE
}

force=0
dry=0
target=""

while [ $# -gt 0 ]; do
	case "$1" in
	--force) force=1 ;;
	--dry-run | -n) dry=1 ;;
	-h | --help)
		usage
		exit 0
		;;
	-*)
		printf 'install.sh: unknown option: %s\n\n' "$1" >&2
		usage >&2
		exit 2
		;;
	*)
		if [ -n "$target" ]; then
			printf 'install.sh: one target directory at a time (got "%s" and "%s")\n' "$target" "$1" >&2
			exit 2
		fi
		target="$1"
		;;
	esac
	shift
done

if [ -z "$target" ]; then
	printf 'install.sh: name the project directory to install into.\n\n' >&2
	usage >&2
	exit 2
fi

src="$(cd "$(dirname "$0")" && pwd)/starter-kit"

if [ ! -d "$src" ]; then
	printf 'install.sh: cannot find %s — run this from inside the cloned repo.\n' "$src" >&2
	exit 1
fi

if [ ! -d "$target" ]; then
	printf 'install.sh: %s is not a directory. create it first, or point at a project you already have.\n' "$target" >&2
	exit 1
fi

if [ ! -w "$target" ] && [ "$dry" -eq 0 ]; then
	printf 'install.sh: %s is not writable.\n' "$target" >&2
	exit 1
fi

# installing into the clone drops a .gitignore at the repo root whose `.env*` line then
# hides both .env.local.example files. nobody wants that, so refuse it outright.
if [ "$(cd "$target" && pwd)" = "$(cd "$(dirname "$0")" && pwd)" ]; then
	printf 'install.sh: that is this repo, not your project. give it the path to a project you own.\n' >&2
	exit 1
fi

if [ "$dry" -eq 1 ]; then
	printf 'dry run. this is what installing into %s would do. nothing is written.\n\n' "$target"
else
	printf 'installing the starter kit into %s\n\n' "$target"
fi

wrote=0
skipped=0
kept_claude_md=0

# the six files ch10:238-252 names. keep this list and the one in install.ps1 in step.
for f in CLAUDE.md design-system.md .gitignore prompts.md security-checklist.md monthly-cleanup.md; do
	if [ -e "$target/$f" ] && [ "$force" -eq 0 ]; then
		if [ "$dry" -eq 1 ]; then
			printf '  would skip (already exists)  %s\n' "$f"
		else
			printf '  skipped (already exists)  %s\n' "$f"
		fi
		skipped=$((skipped + 1))
		[ "$f" = "CLAUDE.md" ] && kept_claude_md=1
	else
		if [ "$dry" -eq 1 ]; then
			printf '  would write                  %s\n' "$f"
		else
			cp -f "$src/$f" "$target/$f"
			printf '  wrote                     %s\n' "$f"
		fi
		wrote=$((wrote + 1))
	fi
done

if [ "$dry" -eq 1 ]; then
	printf '\n%d would be written, %d would be left alone. nothing was written.\n' "$wrote" "$skipped"
	printf 'run it again without --dry-run when the list looks right.\n'
	exit 0
fi

printf '\n%d wrote, %d skipped.\n' "$wrote" "$skipped"

if [ "$skipped" -gt 0 ]; then
	printf 'your own files were not touched. re-run with --force if you actually want them replaced.\n'
fi

# don't send someone to fill in brackets in a file that is still their own.
if [ "$kept_claude_md" -eq 1 ]; then
	printf '\nnext: you already have a CLAUDE.md, so keep it. run claude in %s.\n' "$target"
else
	printf '\nnext: open %s/CLAUDE.md, fill in the brackets, then run claude in that folder.\n' "$target"
fi
