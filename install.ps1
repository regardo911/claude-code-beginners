# copy the six starter-kit files into a project you already own.
#   .\install.ps1 C:\code\my-project
# anything already sitting there is left alone and reported as skipped.
# -Force is the only way to overwrite, and you have to type it.
# -DryRun prints what it would do and writes nothing.
param(
	[Parameter(Position = 0)]
	[string]$Target,
	[switch]$Force,
	[switch]$DryRun
)

$ErrorActionPreference = 'Stop'

function Show-Usage {
	Write-Host @'
usage: install.ps1 <target-directory> [-DryRun] [-Force]

copies six files into a project directory you already have:
  CLAUDE.md  design-system.md  .gitignore
  prompts.md  security-checklist.md  monthly-cleanup.md

a file that already exists is left untouched and reported as skipped.
-Force overwrites it instead.
-DryRun shows what it would do and writes nothing.
'@
}

if ([string]::IsNullOrWhiteSpace($Target)) {
	[Console]::Error.WriteLine('install.ps1: name the project directory to install into.')
	Show-Usage
	exit 2
}

$src = Join-Path $PSScriptRoot 'starter-kit'

if (-not (Test-Path -LiteralPath $src -PathType Container)) {
	[Console]::Error.WriteLine("install.ps1: cannot find $src - run this from inside the cloned repo.")
	exit 1
}

if (-not (Test-Path -LiteralPath $Target -PathType Container)) {
	[Console]::Error.WriteLine("install.ps1: $Target is not a directory. create it first, or point at a project you already have.")
	exit 1
}

# installing into the clone drops a .gitignore at the repo root whose .env* line then
# hides both .env.local.example files. nobody wants that, so refuse it outright.
$targetFull = (Resolve-Path -LiteralPath $Target).Path
$repoFull = (Resolve-Path -LiteralPath $PSScriptRoot).Path
if ($targetFull -eq $repoFull) {
	[Console]::Error.WriteLine('install.ps1: that is this repo, not your project. give it the path to a project you own.')
	exit 1
}

if ($DryRun) {
	Write-Host "dry run. this is what installing into $Target would do. nothing is written."
}
else {
	Write-Host "installing the starter kit into $Target"
}
Write-Host ''

$wrote = 0
$skipped = 0
$keptClaudeMd = $false

# the six files ch10:238-252 names. keep this list and the one in install.sh in step.
$files = @(
	'CLAUDE.md',
	'design-system.md',
	'.gitignore',
	'prompts.md',
	'security-checklist.md',
	'monthly-cleanup.md'
)

foreach ($f in $files) {
	$dest = Join-Path $Target $f
	if ((Test-Path -LiteralPath $dest) -and (-not $Force)) {
		if ($DryRun) { Write-Host ('  would skip (already exists)  {0}' -f $f) }
		else { Write-Host ('  skipped (already exists)     {0}' -f $f) }
		$skipped++
		if ($f -eq 'CLAUDE.md') { $keptClaudeMd = $true }
	}
	else {
		if (-not $DryRun) { Copy-Item -LiteralPath (Join-Path $src $f) -Destination $dest -Force }
		if ($DryRun) { Write-Host ('  would write                  {0}' -f $f) }
		else { Write-Host ('  wrote                        {0}' -f $f) }
		$wrote++
	}
}

Write-Host ''

if ($DryRun) {
	Write-Host ('{0} would be written, {1} would be left alone. nothing was written.' -f $wrote, $skipped)
	Write-Host 'run it again without -DryRun when the list looks right.'
	exit 0
}

Write-Host ('{0} wrote, {1} skipped.' -f $wrote, $skipped)

if ($skipped -gt 0) {
	Write-Host 'your own files were not touched. re-run with -Force if you actually want them replaced.'
}

Write-Host ''

# don't send someone to fill in brackets in a file that is still their own.
if ($keptClaudeMd) {
	Write-Host "next: you already have a CLAUDE.md, so keep it. run claude in $Target."
}
else {
	Write-Host "next: open $Target\CLAUDE.md, fill in the brackets, then run claude in that folder."
}
