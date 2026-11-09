---
tags: [meta, rules]
status: reference
related: [[CLAUDE]], [[core/rules-why]]
created: 2026-11-08
last-updated: 2026-11-08
---

# Core rules

The operating rules for this vault. Read them at the start of every session.

Each rule ends with what it guards against. The full reasoning is in [[core/rules-why]], one section per rule. **Read the relevant section when:** giving the tour, the user questions or wants to change a rule, or it's unclear whether or how a rule applies.

**This file belongs to the release and is never edited in place (R-26).** The user changes or drops a rule with an override in [[CLAUDE]] › Overrides, and adds rules under › House rules. Where they conflict, `CLAUDE.md` wins.

---

## Memory and records

### R-01 · The vault is your only memory
Anything that should outlive the current conversation gets written into a vault file *during* the conversation. Nothing important lives only in chat.

*Guards against:* decisions vanishing when a conversation ends or is compacted. [[core/rules-why#R-01|Why]]

### R-02 · Every fact lives in exactly one place
Store a fact once, in the file that owns it. Everywhere else links to it. Never copy a fact into a second file for convenience.

*Guards against:* copies drifting apart until the vault contradicts itself. [[core/rules-why#R-02|Why]]

### R-03 · Current status lives only in status frontmatter
A project's current state is stored in the frontmatter of its `status.md`, in these fields: `state`, `headline`, `next`, `waiting-on`, `flag`, `state-verified`. Nothing else stores current state: not an INDEX table, not the progress log, not a note. `core/scripts/board.sh` builds the overview by reading those fields each time it runs.

*Guards against:* status drifting across files, and projects missing from the board. [[core/rules-why#R-03|Why]]

### R-04 · "Done" gets written down in the same turn
When the user says something is finished, update the vault right then: clear the flag, close the open item, change the status, before moving on.

*Guards against:* the next session treating finished work as still open. [[core/rules-why#R-04|Why]]

### R-05 · Decisions record *why*; the progress log records *what*
When a choice is made, log it in the relevant `decisions.md`: the project's own, or the root [[decisions]] for vault-wide choices. Include the date, the choice, the reasoning, and the alternatives that were rejected. The progress log notes that the decision happened, in one line with a link, and never restates the reasoning.

*Guards against:* good decisions undone, or bad ones kept, because nobody remembers why. [[core/rules-why#R-05|Why]]

### R-06 · Log as you go; close sessions cleanly
[[progress/progress-log]] gets short, dated entries recording what happened, in order. When the user closes a session ("update and close", or however they put it), write every pending update: each touched project's `status.md` frontmatter, plus a progress-log entry.

*Guards against:* losing a whole session's updates when it ends without warning. [[core/rules-why#R-06|Why]]

---

## Sessions

### R-07 · How a session starts depends on how the user opens it
- **Focused start:** the first message is a specific question or task. Answer it. Skip everything below.
- **Open start:** a greeting, "what's next", "let's work". Run `bash core/scripts/board.sh` and read the **most recent** entry of [[progress/progress-log]] only. Then brief the user: the board's summary, anything flagged or waiting on them, the inbox count, and any unconfirmed items (R-16). Then ask where to start.

*Guards against:* spending the session budget on status sweeps nobody asked for. [[core/rules-why#R-07|Why]]

### R-08 · The inbox is read only when asked
[[inbox]] is where the user drops ideas at any time, optionally tagged with a project: `[garden] try drip lines`. Don't read it at startup and don't act on it unprompted. Report only its item count, which `board.sh` shows. When asked to work the inbox: act on what you can, raise what needs the user's input, file each outcome in the right place, and delete the items you've handled.

*Guards against:* an inbox that nags, or one that rots unseen. [[core/rules-why#R-08|Why]]

### R-09 · Read on demand, in order
When work turns to a project, read its `INDEX.md` first, then the body of its `status.md`, then only the specific files the task needs. Never bulk-read a folder.

*Guards against:* filling the session with background reading it didn't need. [[core/rules-why#R-09|Why]]

### R-10 · Other projects stay closed
While working on one project, don't bring up open items from another unless the user asks, or the current work actually depends on them.

*Guards against:* breaking focus with unrelated open items mid-task. [[core/rules-why#R-10|Why]]

---

## Communicating

### R-11 · Every instruction says where
Every flag, next step, instruction, or error report names its location: a wikilink, a file path, a quoted phrase, a line.

*Guards against:* instructions that look complete to the writer but send the reader searching. [[core/rules-why#R-11|Why]]

### R-12 · Correct plainly, once, without keeping score
When something is wrong, say what and where (R-11), in the present tense, with a suggested fix. Don't count repeats ("as I said before", "for the third time") and don't imply carelessness.

*Guards against:* corrections that land as reprimands instead of fixes. [[core/rules-why#R-12|Why]]

### R-13 · Have a recommendation
When there's a choice to make, give an opinion and argue for it. If the user disagrees, engage with their reasoning: don't just give in, and don't dig in either. If something is genuinely risky (legal, financial, safety, data loss), say so plainly.

*Guards against:* handing all the thinking back, or folding when right. [[core/rules-why#R-13|Why]]

---

## Accuracy

### R-14 · Never guess at state
Don't assume how a system, file, device, or situation currently is. Check it, or ask. Record something as verified only when it has been, and date it.

*Guards against:* guesses written down and later treated as facts. [[core/rules-why#R-14|Why]]

### R-15 · Check prerequisites before starting
Before hands-on steps, confirm what they depend on: versions, hardware, access, accounts, compatibility. Ask about anything you can't verify yourself.

*Guards against:* work left half-done by a missing prerequisite. [[core/rules-why#R-15|Why]]

### R-16 · Ask about built-but-unconfirmed items
When the vault records something as built, pending a test, or unconfirmed, ask the user directly when it comes up or at an open start: "Is X working? The vault still has it as pending since [date]." Record the answer with the date it was confirmed.

*Guards against:* working things recorded as "pending" forever. [[core/rules-why#R-16|Why]]

### R-17 · Look up anything that may have changed
Prices, versions, laws, product features, current events, anything time-sensitive: check it with a search before relying on it.

*Guards against:* stale information delivered confidently. [[core/rules-why#R-17|Why]]

---

## Solving problems

### R-18 · Two exchanges without progress: stop and step back
If the same problem has taken more than two exchanges without progress, stop and diagnose. Is it a known limitation? Is there a simpler path? Are you working at the wrong layer? Log the dead end in the project's `failures.md` (what was tried, why it didn't work), then pivot or defer. Before reopening a logged dead end, read its entry.

*Guards against:* sinking more time into an approach that isn't working. [[core/rules-why#R-18|Why]]

### R-19 · When a fix changes nothing, stop editing
If a change produces no change in behavior, the problem is almost certainly somewhere the change didn't touch. Stop modifying and check the layers from the bottom up: power and hardware, connections, each component on its own, then the whole assembly. Take one step at a time, each with a stated expected result. Use tests with unmistakable effects, and compare against something known to work.

*Guards against:* piling changes onto the wrong layer while the real fault stays put. [[core/rules-why#R-19|Why]]

### R-20 · Bank lessons that carry across projects
When solving a problem teaches something general (a platform quirk, a method that works, a trap to avoid), add it to [[reference/lessons-learned]]. Check that file before debugging a kind of problem you've seen before.

*Guards against:* paying for the same mistake twice. [[core/rules-why#R-20|Why]]

---

## Keeping the vault usable

### R-21 · Standing facts live in `reference/`
Facts that stay true belong in `reference/`: machines and specs, accounts and services, recurring constraints, who the user is. Read them there instead of asking the user. When one might be out of date, ask "is this still accurate?", not "what is it?"

*Guards against:* asking the user the same questions every session. [[core/rules-why#R-21|Why]]

### R-22 · Notes follow the conventions
- **Frontmatter on every note:** `tags`, `status`, `related`, `created`, `last-updated`.
- **Wikilinks use the full path from the vault root:** `[[projects/garden/INDEX]]`, never `[[INDEX]]`.
- **Tags come from [[reference/tag-registry]].** Add a tag there before using it for the first time.
- **`status` values:**

| Value | Currently true? | Has a next action? |
|---|---|---|
| `draft` | not yet | yes |
| `active` | yes | yes |
| `reference` | yes | no: correct and static |
| `shelved` | yes | paused, may return |
| `deprecated` | no: superseded | no |
| `archived` | no: history | no |

Use `reference` only for a note someone has actually confirmed is correct, never to make an old note look current.

*Guards against:* ambiguous links, unsearchable notes, and duplicate tags. [[core/rules-why#R-22|Why]]

### R-23 · The user can find things without the agent
Operational notes (procedures, setups, configurations) open with a `## Quick reference` table of paths, commands, and values, before any explanation. Never paste a file's contents into a note as reference; give the file's path instead.

*Guards against:* a vault only the agent can navigate. [[core/rules-why#R-23|Why]]

### R-24 · Shrink without losing facts
When trimming or reorganizing, never delete a figure, date, name, part number, or the reason behind a decision just to save space. Move detail to a less-read file instead.

*Guards against:* facts quietly lost while trimming. [[core/rules-why#R-24|Why]]

### R-25 · Keep often-read files lean
When a file that is read often (`CLAUDE.md`, a project `INDEX.md`, a frequently used reference note) grows, move the detail needed only sometimes into a linked file, and say when to read it.

*Guards against:* every session paying for detail it rarely uses. [[core/rules-why#R-25|Why]]

---

## This vault's system

### R-26 · Never edit `core/`
Files in `core/` come from the bootstrap release and are not changed in place. When the user wants a core rule changed or dropped, record it in [[CLAUDE]] › Overrides: the rule ID, what's different, the date, and the reason. New rules go in › House rules.

*Guards against:* user changes erased by the next upgrade. [[core/rules-why#R-26|Why]]

### R-27 · Upgrades come from the newer release
When asked to upgrade the vault, ask where the newer release was downloaded, then read `core/UPGRADING.md` *in that release* and follow it. This vault's current version is in `core/VERSION`.

*Guards against:* improvised upgrades that skip or misorder steps. [[core/rules-why#R-27|Why]]
