---
tags: [meta, onboarding]
status: reference
related: [[core/onboarding]], [[core/tour]]
created: 2026-11-08
last-updated: 2026-11-08
---

# Obsidian basics

A hands-on introduction for someone who has never used Obsidian. **Read when:** the user says they're new to Obsidian (onboarding Stage 0), asks how to do something in it, or asks what a term means.

**How to use this file:** don't read it out. Walk the user through **Guided first steps** one step at a time. Say what to do and what they should see, and wait for them to try it. Use the shortcuts for their system: **Cmd** on a Mac, **Ctrl** on Windows. Use the glossary when a term comes up for the first time.

## Quick reference

| To do this | Press (Mac / Windows) | Or |
|---|---|---|
| Jump to any note by name | Cmd+O / Ctrl+O | Type part of the name, then press Enter |
| Search inside every note | Cmd+Shift+F / Ctrl+Shift+F | The magnifying glass in the left sidebar |
| Switch between reading and editing | Cmd+E / Ctrl+E | The book or pencil icon at the top right of the note |
| See how notes link to each other | Cmd+G / Ctrl+G | "Open graph view" in the left ribbon |
| Find any command | Cmd+P / Ctrl+P | Type what you want, for example "new note" |
| Go back to the previous note | | The back arrow at the top left of the note |

## What Obsidian is

- **It's a reader and editor for a folder of notes.** Each note is an ordinary text file on your computer. Obsidian shows them nicely and lets you move between them.
- **Your agent doesn't need Obsidian.** The agent reads and writes the same files directly. Obsidian is your window into what's there. It doesn't have to be open while you work with the agent.
- **Everything saves automatically.** There is no Save button.
- **Changes the agent makes appear in Obsidian on their own,** usually within a second or two. Avoid typing in a note at the same moment the agent is changing that same note.

## Glossary

| Term | Plain meaning |
|---|---|
| **Vault** | The folder that holds all your notes. Obsidian calls any folder it opens a vault |
| **Note** | One file in the vault. Its name is the file name |
| **Link** | A clickable reference to another note, written between double square brackets, like `[[inbox]]`. In this vault, links spell out the folders too, like `projects/garden/INDEX`, so they always point at exactly one note |
| **Properties** | The small box of fields at the top of a note (status, tags, dates). Your agent keeps these up to date, so you can leave them alone. Behind the scenes they're called *frontmatter* |
| **Tag** | A label in a note's properties that groups related notes, like `project` or `reference` |
| **Sidebar** | The panels on the left and right. The left one lists your folders and notes |
| **Graph view** | A map of your notes drawn as dots, with lines for the links between them |

## Guided first steps

| # | Ask the user to | They should see | If not |
|---|---|---|---|
| 1 | Look at the left sidebar | A list of folders and notes: `core`, `projects`, `reference`, `inbox`, and others | No sidebar: click the sidebar icon at the very top left, or press Cmd+P / Ctrl+P and type "toggle left sidebar". Something else listed: Obsidian opened a different folder. Use the vault switcher at the bottom left to open this one |
| 2 | Click `inbox` to open it | The inbox note, with a properties box at the top and an **Items** heading | Nothing opens: double-click instead |
| 3 | Click at the end of the page under **Items** and type a line starting with a dash, such as `- try out my new vault` | A bullet point appears. It's already saved | Nothing happens when typing: the note is in reading view. Press Cmd+E / Ctrl+E and try again |
| 4 | Press Cmd+O / Ctrl+O, type `about`, and press Enter | The **About me** note opens | |
| 5 | Open `CLAUDE` and click any link in it, such as `core/rules` | That note opens. The back arrow at the top left returns to `CLAUDE` | |
| 6 | Press Cmd+G / Ctrl+G | A graph of dots and lines, one dot per note | |

Afterwards, tell the user the agent will remove their test line from the inbox when they ask it to work the inbox. They can also delete it themselves.

## Good to know

- **Some files don't show in Obsidian,** such as `core/VERSION` and the scripts in `core/scripts/`. That's normal: Obsidian shows notes, and the agent uses those files directly.
- **Leave `core/` as it is.** The agent never edits it either (R-26). To change how things work, ask the agent.
- **Renaming or moving a note in Obsidian is safe.** This vault is set to update links automatically when you do.
