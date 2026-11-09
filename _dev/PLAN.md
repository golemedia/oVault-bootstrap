---
tags: [dev, plan]
status: active
related: [[CLAUDE]], [[core/rules]]
created: 2026-11-08
last-updated: 2026-11-08
---

# oVault bootstrap — build plan

> **Maintainer notes, not vault instructions.** `_dev/` is excluded from release downloads (`.gitattributes` → `export-ignore`). A vault agent that finds this folder in a cloned copy should treat it as the bootstrap author's design notes, not as rules.

## Quick reference

| What | Where |
|---|---|
| GitHub repo | `golemedia/oVault-bootstrap` (hyphen). The local folder is `oVault_bootstrap` (underscore); git doesn't care about the folder name |
| Scripts | `core/scripts/board.sh`, `core/scripts/vault-check.sh` |
| Publishing runbook | §11 below |
| License | MIT — `LICENSE` |
| Agent identity skeleton | `CLAUDE.md` |
| Operating rules (R-01…R-27) | `core/rules.md` |
| Reasoning behind each rule | `core/rules-why.md` |
| First-run script | `core/onboarding.md` |
| Tour spec | `core/tour.md` |
| Upgrade procedure | `core/UPGRADING.md` |
| Release version | `core/VERSION` |
| Upgrade files (v2+) | `core/upgrades/v2.md`, `v3.md`, … |

---

## 1. What this is

A starter vault anyone can download, open in Obsidian, add in Claude Cowork, and start talking to. On first run the agent offers a tour of what's already built, then guides the user through setting up their agent: name, personality, how they like to work, which default rules to keep. Every answer is written into the vault as it's given.

**It is not** a copy of Overseer. It ships the *patterns* that make Overseer work. Everything specific to Tim stays out: projects, scripts for his infrastructure, artifact mirroring, the blog process, his origin stories.

## 2. Install (what the README will say)

1. Download the **latest release** ZIP (or clone) into any folder.
2. Open that folder as a vault in Obsidian.
3. In Claude, start a Cowork session with that folder. Say anything.

The tour assumes these steps are done. The README covers install; the agent never does.

## 3. Design principles

**Ownership split.** Every file belongs either to the release or to the user, and never both.

| Owner | Files | When a newer release is applied |
|---|---|---|
| Release | `core/` (everything in it), `README.md`, `LICENSE` | Replaced as a whole |
| User | `CLAUDE.md` and every other file | Never overwritten; changed only by explicit, careful upgrade steps |

- `CLAUDE.md` holds identity, working style, the user's **Overrides** of core rules (by rule ID), and their own **House rules**. Where it conflicts with `core/rules.md`, `CLAUDE.md` wins.
- The agent never edits `core/` (R-26). A requested rule change becomes an override.
- Rules have stable IDs so overrides survive rewording in later releases.

**Load tiers: pay only for what the moment needs.** Anything the agent reads stays in the conversation for every turn after it, so a file read every session is the most expensive thing in the vault. Each file is placed in a tier, and an every-session file links to its detail instead of carrying it.

| Tier | When read | Files |
|---|---|---|
| Every session | Always | `CLAUDE.md` (auto-loaded), `core/rules.md` |
| When triggered | A specific condition | `core/onboarding.md` (until complete), `core/obsidian-basics.md` (user is new to Obsidian, or asks), `core/rules-why.md` (tour, rule questions, unclear cases), a project's `INDEX.md` (when work turns to it) |
| On request | The user asks | `core/tour.md`, `core/UPGRADING.md`, `inbox.md`, the full progress log |

- `core/rules.md` keeps each rule's instruction plus a one-line *guards against*; the full reasoning is in `core/rules-why.md`, one linked section per rule. This halves the every-session cost of the rules.
- When onboarding completes, its section in `CLAUDE.md` shrinks to one line.
- The same principle is a rule for users' own vaults (R-25), so their often-read files stay lean as they grow.

**Tour reflects the vault as it is now.** `core/tour.md` lists what to cover and where to read it. It is not a script. The agent builds the tour from current state: core rules with overrides applied, house rules, projects, folders, and tags. A rerun six months later shows the user their vault, not the starter.

**Onboarding is resumable.** State lives in `CLAUDE.md` frontmatter (`onboarding`, `onboarding-stage`), so it costs no extra read and survives session limits. Each stage writes its results when it ends.

**Assume no prior experience.** A user may have installed Obsidian only because this vault needed it, and may never have used Claude in Cowork. Onboarding asks about both in Stage 0, records the answers in `CLAUDE.md` › Working style, and sets how much it explains by them. The README says up front that no Obsidian knowledge is needed.

**Rules explain themselves.** Each rule states what it does, the failure it prevents, and why that failure is easy to miss. The reasons are generic and contain no maintainer anecdotes.

## 4. Repo layout (v1)

```
CLAUDE.md                     user   identity skeleton + first-run trigger
README.md                     release  human install guide
LICENSE                       release
.gitattributes                release  export-ignore _dev/
.gitignore                    release  Obsidian workspace state, OS junk
.obsidian/app.json            user   absolute-path links on by default
core/
  VERSION                     release
  rules.md                    release  R-01 … R-27, every session
  rules-why.md                release  reasoning per rule, on demand
  onboarding.md               release  stages, questions, write targets
  tour.md                     release  what to cover, where to look
  obsidian-basics.md          release  glossary + hands-on first steps for Obsidian newcomers
  UPGRADING.md                release  how to apply core/upgrades/*
  upgrades/README.md          release  what an upgrade file contains; no vN files in v1
  scripts/board.sh            release  one line per project + inbox count
  scripts/vault-check.sh      release  frontmatter, links, status.md present
  templates/project/          release  INDEX, status, decisions, failures: copied for each new project
  templates/note.md           release  a plain note
inbox.md                      user
decisions.md                  user   vault-wide decisions
progress/progress-log.md      user
reference/about-me.md         user
reference/environment.md      user
reference/lessons-learned.md  user
reference/tag-registry.md     user
projects/                     user   empty; onboarding creates the first
_dev/PLAN.md                  maintainer only, not in release ZIPs
```

## 5. First run and onboarding

The trigger is at the top of `CLAUDE.md`: if `onboarding` isn't `complete`, read `core/onboarding.md` and run it. The agent answers whatever the user's first message asks before offering. When `core/onboarding.md` exists, it is authoritative and this table is just the design.

| Stage | What happens | Written to |
|---|---|---|
| 0 Welcome | What this is; offer the tour (short, full, or skip) | `onboarding-stage` |
| 1 Tour | Folders, rules and why they exist, what's changeable | — |
| 2 Agent identity | Name, personality (presets + freeform), how it addresses the user | `CLAUDE.md` › Identity |
| 3 About you | Name, role, what the vault is for, machines and tools | `reference/about-me.md`, `reference/environment.md` |
| 4 Working style | Answer length; full instructions vs one step at a time; correction style; deadline reminders on/off; ask-first vs act-first; aim-high-then-scale-down vs start-small | `CLAUDE.md` › Working style + `decisions.md` |
| 5 Rules review | Keep, change, or drop each core rule; add house rules | `CLAUDE.md` › Overrides / House rules + `decisions.md` |
| 6 First project | Scaffold one real project from templates | `projects/<name>/` |
| 7 Close | Summary, first progress-log entry, `onboarding: complete` | `progress/`, `CLAUDE.md` |

Commands available afterward: "rerun the tour" and "redo onboarding" (from any stage).

## 6. Releases and upgrades

**Freezing.** A release is a git **tag** (`v1`) plus a GitHub **Release** built on it. GitHub attaches a ZIP of the tagged files automatically. The tag never moves, so the release never changes. Every release stays downloadable on the Releases page; the newest gets the **Latest** badge.

**Workflow.** Build on `main` → tag `v1` and publish the release → keep building on `main` toward v2 → tag `v2`, which becomes Latest. Tags are whole numbers to match `core/VERSION` and the `vN.md` upgrade files; with no patch releases there is never a `v1.1`. The README sends people to **Latest release**, not the Code button, so nobody downloads work in progress.

**No patch releases.** A published version is never changed. Fixes wait for the next version.

**Upgrade files.** `core/upgrades/vN.md` takes a vN−1 vault to vN. A v3 vault going to v9 runs v4 through v9 in order. Each file contains:
1. What changed and why (explained to the user, so same depth as the rules).
2. Steps for the agent, in order. Usually "replace `core/` with this release's `core/`", plus any careful edits to user files.
3. Conflicts to raise: overrides that touch a changed rule.
4. Checks that confirm the upgrade worked.
5. Last step: confirm `core/VERSION` reads N; log a dated decision in the user's `decisions.md`.

**How a user upgrades.** Download the new release anywhere, then tell the agent to upgrade the vault from that folder. R-27 sends it to the new release's `core/UPGRADING.md`. v1 doesn't need to know what v2 contains.

## 7. Out of scope for v1

Vault audits · published artifacts · subagent delegation · automatic update checks · Obsidian Bases board · blog/publishing workflows · sync between machines. Each is a reasonable later version.

## 8. Isolation from Overseer (dev-side, done 2026-11-08)

This repo is developed inside Tim's Overseer vault. To stop either one reading the other as its own:
- Overseer `CLAUDE.md` › Exclusions has a warning callout naming this folder as a template, not instructions.
- `meta/vault-check.sh`, `pending-check.sh`, and `audit-metrics.sh` exclude `./overseer/repos/` (`board.sh` already excluded `*/repos/*`). Backups: `*.bak-20261108`.
- Every wikilink in this repo is relative to *this* repo's root.
- Obsidian → Settings → Files and links → **Excluded files** includes `overseer/repos/`, so these notes stay out of Overseer's search, graph and link suggestions. **Done by Tim, confirmed 2026-11-08.**

## 9. To verify before tagging v1

- ~~Cowork auto-loads root `CLAUDE.md` on a fresh folder.~~ **Confirmed on macOS 2026-11-08:** Tim's test copy started onboarding unprompted. The onboarding flow, including the Obsidian-newcomer additions, was reported working the same day.
- `board.sh` and `vault-check.sh` run in a Cowork session started on a Windows PC (expected to work; see the platform note below).
- ~~Full onboarding run on macOS.~~ **Checked by Tim, 2026-11-08.** **Still open: the same run on a Windows PC** (Tim, later).
- ~~`.gitattributes` export-ignore removes `_dev/` from the download.~~ **Checked by Tim, 2026-11-08: no `_dev/` in the download.**
- `board.sh` and `vault-check.sh` were tested on Linux on 2026-11-08: a clean vault, plus a test project exercising every board section and every check. They also ran clean in Cowork on Tim's Mac the same day.

**Platform note: one set of scripts covers every platform.** The agent runs the scripts, and Cowork runs the agent's commands inside a Linux virtual machine on both macOS and Windows; the user's folder is mounted into it. So the scripts always run under Linux bash, whatever the host is. No PowerShell versions are needed. Windows-specific points:
- **Cowork's VM needs Windows' Virtual Machine Platform feature and hardware virtualization.** Windows Home is reported to fail where Pro, Enterprise and Education work. The README says so.
- **Line endings:** `.gitattributes` pins `*.sh` to LF, so a clone on Windows doesn't break the scripts with CRLF line endings.
- **OneDrive:** Windows often redirects `Documents` to OneDrive, where files can be cloud-only. The README recommends a folder that's fully local.
- **Running the scripts by hand** is optional. Windows has no bash of its own; Git Bash or WSL both work. The README mentions this.

## 10. Build order

- [x] LICENSE
- [x] PLAN.md (this file)
- [x] CLAUDE.md (draft)
- [x] core/rules.md + core/rules-why.md (draft)
- [x] core/onboarding.md (draft)
- [x] core/tour.md (draft)
- [x] core/templates/*, seeded user files
- [x] core/scripts/board.sh, vault-check.sh (tested on Linux)
- [x] core/UPGRADING.md, core/VERSION, core/upgrades/README.md
- [x] README.md, .gitattributes, .gitignore, .obsidian/app.json
- [ ] First push (§11, steps 1–8)
- [ ] §9 checks, then tag `v1` (§11, steps 9–11)

## 11. Publishing runbook

Run these in **Terminal on your Mac**. Git can't run from Claude's side of the link, because it needs to delete its own lock files.

### First push

| # | Do | Expect | If not |
|---|---|---|---|
| 1 | `cd ~/Documents/Overseer/overseer/repos/oVault_bootstrap` | No output | "No such file": check the path in Finder |
| 2 | `git --version` | `git version 2.x` | macOS offers to install Command Line Tools. Accept, then rerun |
| 3 | `git init -b main` | `Initialized empty Git repository in …/oVault_bootstrap/.git/` | "Reinitialized existing": a repo is already there, which is fine. Carry on |
| 4 | `git add -A && git status --short` | About 28 lines starting `A `, including `.obsidian/app.json` and `_dev/PLAN.md`. **No** `.DS_Store` | `.DS_Store` listed: `.gitignore` isn't at the folder root. Check `ls -a` |
| 5 | `git commit -m "oVault v1 draft"` | A line like `[main (root-commit) abc1234] oVault v1 draft`, then about 28 files changed | "Please tell me who you are": run `git config --global user.name "Your Name"` and `git config --global user.email "you@example.com"`, then repeat 5 |
| 6 | `git remote add origin https://github.com/golemedia/oVault-bootstrap.git && git remote -v` | Two `origin` lines (fetch, push) | "remote origin already exists": run `git remote set-url origin` with the same URL |
| 7 | `git push -u origin main` | Ends with `branch 'main' set up to track 'origin/main'` | **Asked for a password, or a 403:** GitHub needs a token, not your password. Run `gh auth login` if you have `gh`, or create a personal access token on GitHub and paste it as the password. **"rejected … fetch first":** the GitHub repo isn't empty (it was created with a README or license). Look at it on github.com. If it holds only those auto-generated files, `git push --force -u origin main` replaces them. That overwrite can't be undone, so only do it if nothing there matters |
| 8 | Open github.com/golemedia/oVault-bootstrap | All the files listed, and the README rendered below them | Files missing: rerun 4 and look for errors |

### Freezing a release (after the §9 checks pass)

| # | Do | Expect | If not |
|---|---|---|---|
| 9 | `git archive --format=zip -o /tmp/ovault-test.zip HEAD && unzip -l /tmp/ovault-test.zip > /tmp/ovault-list.txt; grep -c _dev /tmp/ovault-list.txt` | `0`: maintainer notes are left out of downloads | Anything above 0: `.gitattributes` wasn't committed. Commit it and push before tagging |
| 10 | On github.com: **Releases → Draft a new release → Choose a tag**, type `v1`, choose **Create new tag: v1 on publish**, target `main`. Title: `oVault v1`. Check **Set as the latest release**. Click **Publish** | The Releases page shows `v1` with a **Latest** badge and two Source code downloads | No Latest badge: edit the release and tick it |
| 11 | Download the release ZIP, unzip it somewhere new, open it in Obsidian and in a fresh Cowork session | The agent offers onboarding, and there's no `_dev/` folder | Note what went wrong. Before anyone else has downloaded it, the release and tag can be deleted and redone. After that, the fix waits for v2 |

