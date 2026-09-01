# Chapter 7: Security and Tests

## What you build

A hardened app and a test suite. Claude writes functional code, not secure code: plain-text
passwords if you don't say hash them, no validation if you don't ask, open endpoints if you
don't mention auth.

Three files: the prompt that runs the audit plus the five targeted fixes behind it, the
secret scans you run yourself, and the prompts that get Claude writing tests. The 20 points
are in `starter-kit/security-checklist.md`, blank.

## Start here

```
Run through this 20-point security checklist on the Task Tracker. For each point, check the codebase and tell me: PASS (it's secure), FAIL (there's a vulnerability), or N/A (doesn't apply). Fix every FAIL.
```

About ten minutes. Record your result on the checklist as you go.

## Done when

Every line of the second audit run reads PASS or N/A, the test suite is green, and the XSS
check passes by hand: type `<script>alert('test')</script>` as a task title, save it, and read
that literal text back in your list. An alert box means sanitization failed, whatever the
audit said.

Which lines come back FAIL the first time depends on your codebase. The filled report the
book prints is an example shape, not a prediction.

## On your own project

The checklist transfers whole. The prompts need one edit each, since they name the Task
Tracker and its title and description fields. The scans in `secret-scan-commands.md` run
against `src/` in whatever project you're standing in and need no editing.

Twenty points and a test suite make an app responsible, not bulletproof. Once a breach could
cost a user real money or expose private records, pay someone to review it.
