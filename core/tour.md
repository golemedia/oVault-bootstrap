---
tags: [meta, onboarding]
status: reference
related: [[core/onboarding]], [[core/rules]], [[core/rules-why]], [[CLAUDE]]
created: 2026-11-08
last-updated: 2026-11-08
---

# The tour

How to show the user what this vault is and how it works. **Read on request only:** during onboarding Stage 1, or whenever the user asks for the tour.

**The tour describes the vault as it is now, not as it shipped.** This file says what to cover and where to look. The content comes from the live vault every time. A user who reruns the tour a year from now should see their own vault: their overrides, their house rules, their projects, and their folders.

## Before you start: gather the current state

Read only what the tour needs (R-09):

| Look at | For |
|---|---|
| `ls` of the vault root, and of `projects/` | The map in section 2, including folders the user added |
| [[CLAUDE]], which is already loaded | Identity, working style, Overrides, House rules, Projects |
| `bash core/scripts/board.sh` | Live project status and the inbox count, for section 6 |
| `core/VERSION` | Which release this vault is on |
| [[core/rules]], which is already loaded | Rule titles and *guards against* lines |
| [[core/rules-why]] | Only the sections you actually explain, or that the user asks about |

If onboarding isn't complete, `CLAUDE.md` is mostly blank. Skip what doesn't exist yet and say it'll be filled in during setup.

## Depth

- **Short (about 2 minutes):** one message of roughly 300 words. Give one or two sentences per section, in the order below, and end by offering the full version for any part.
- **Full (about 10 minutes):** one section per message. After each one, pause for questions before moving on. Don't recite every file. Show the shape, then point to where the detail lives.

In both versions, speak in the agent's own voice and personality once they're set ([[CLAUDE]] › Identity).

## 1 · What this is

- The vault is a folder of plain notes that the user and their agent share.
- The agent starts every session with no memory. It knows only what's written here and what the user says in that session (R-01). That's why it writes things down as it goes.
- The notes are readable by a person, in Obsidian or any text editor. The vault is meant to be useful even when the agent isn't available (R-23).

## 2 · The map

Describe each top-level folder that actually exists. Use the table below for the folders this vault ships with. For any folder or file the user added, read its `INDEX.md` if there is one, and otherwise describe it as their own and say what it appears to hold.

| Folder or file | What it's for |
|---|---|
| `CLAUDE.md` | The agent's identity and standing instructions, plus the user's overrides and house rules |
| `core/` | The rules and setup files that came with this release. **The agent never edits this folder (R-26)** |
| `projects/` | One folder per project, each holding `INDEX.md`, `status.md`, `decisions.md`, and `failures.md` |
| `reference/` | Standing facts: about the user, their environment, lessons learned, the tag list |
| `progress/progress-log.md` | A dated record of what happened, in order |
| `decisions.md` | Vault-wide decisions and the reasons behind them |
| `inbox.md` | A place to drop ideas any time. It's read only when the user asks |

In the full version, also explain how a project folder works: `INDEX.md` is the front door, `status.md` holds the live state, and the board reads it.

## 3 · How a session works

- **Focused start:** open with a specific task and the agent gets straight to it.
- **Open start:** open with something like "what's next?" and the agent gives a short briefing from the board (R-07).
- **The inbox:** add ideas any time. The agent reports only how many items are waiting until the user asks to work through them (R-08).
- **"Update and close"** before stopping: the agent writes down anything still pending (R-06).
- **Finished work is recorded the moment the user says it's done** (R-04).

## 4 · The rules

- Name the groups from [[core/rules]] and say what each group is for, in one line.
- **Short version:** groups only. **Full version:** every rule's title with its *guards against* line, grouped. Explain the reasoning in depth, from [[core/rules-why]], only for a couple of rules that matter most to this user, or for rules the user asks about.
- **Show the vault as it actually runs:** mark any rule that has an override in `CLAUDE.md` and state the override. Then list each house rule (H-nn) with its reason.
- **Make clear that every rule is changeable.** Changing one is a conversation: the agent explains why the rule exists, then records the user's choice as an override.

## 5 · What's yours, and what came with the release

- `core/` belongs to the release. Everything else belongs to the user.
- The user's changes live in `CLAUDE.md`, never in `core/`, so they survive upgrades (R-26).
- This vault is on version `core/VERSION`. To upgrade, download a newer release from the project's GitHub Releases page and ask the agent to apply it (R-27).

## 6 · Your setup

Skip this section, or keep it to one line, if onboarding hasn't reached it.

- **The agent:** name and personality, from › Identity.
- **How the user likes to work:** a one-line summary of › Working style.
- **Projects:** the board's output, summarized. Lead with what's done and moving, not what's at risk.

## 7 · Finding things yourself

- Obsidian: open a note, follow its links, use search and the graph view.
- Operational notes start with a **Quick reference** table (R-23).
- Links always use full paths, such as `projects/name/INDEX`, so they're never ambiguous (R-22).

## 8 · What you can ask for

End the tour with this list:

- "Rerun the tour"
- "Redo setup", or a single part of it ("redo my working style")
- "Work the inbox"
- "Update and close"
- "Why does rule R-nn exist?"
- "Change rule R-nn"
- "Upgrade the vault"
- "Start a new project"
