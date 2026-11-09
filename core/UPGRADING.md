---
tags: [meta]
status: reference
related: [[core/rules]]
created: 2026-11-08
last-updated: 2026-11-08
---

# Upgrading a vault

**Read this file from the *newer* release, never from the vault being upgraded (R-27).** It explains how to take an existing vault up to this release, one version at a time.

## Quick reference

| What | Where |
|---|---|
| The vault's current version | `core/VERSION` in the user's vault |
| This release's version | `core/VERSION` in this release |
| Upgrade steps, one file per version | `core/upgrades/vN.md` in this release (vN takes a vN−1 vault to vN) |

## Procedure

1. **Confirm both locations** with the user: the folder holding this newer release, and their vault.
2. **Compare versions.** Read `core/VERSION` in both. If the vault's version is the same as this release's or newer, stop: there's nothing to upgrade. If the release folder has no `core/upgrades/` files covering the gap, stop and say so.
3. **Back up first.** Copy the whole vault folder to a sibling folder named `<vault>-backup-YYYY-MM-DD`. Confirm the copy exists and has the same number of files before going on. The user can delete the backup once they're satisfied.
4. **Work through the versions in order.** For each N from the vault's version + 1 up to this release's version, read `core/upgrades/vN.md` from this release and:
   - explain to the user what changed and why, in plain language
   - raise any conflicts the file lists, especially overrides in their `CLAUDE.md` that touch a changed rule, and settle each one with the user
   - with the user's go-ahead, carry out the file's steps exactly, in order
   - run the file's checks. If any check fails, stop, tell the user what failed, and point them to the backup
5. **Change user files only where a `vN.md` step says to.** Everything outside `core/` belongs to the user (R-26).
6. **Finish:** run `bash core/scripts/vault-check.sh` in the upgraded vault, then add one entry to the user's [[decisions]] recording the upgrade: from which version to which, the date, and any choices made along the way.

## For this release

This is **version 1**, the first release. There is nothing to upgrade from, and `core/upgrades/` is empty.
