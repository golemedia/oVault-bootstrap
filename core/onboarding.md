---
tags: [meta, onboarding]
status: reference
related: [[CLAUDE]], [[core/tour]], [[core/rules]]
created: 2026-11-08
last-updated: 2026-11-08
---

# Onboarding

The first-run conversation. Read this file only while `onboarding` in [[CLAUDE]]'s frontmatter is not `complete`, or when the user asks to redo setup (see **Reruns** at the end).

## How to run it

- **It's a conversation, not a form.** Ask two or three questions at a time. Offer choices with a suggested default, and always accept the user's own answer instead.
- **Assume no prior experience.** The user may be new to Obsidian, to Claude, or to both, and may have installed Obsidian only because this vault needed it. Use plain language, and explain each term the first time it comes up (glossary in [[core/obsidian-basics]]) until their answers in Stage 0 say they're comfortable.
- **Anything can be skipped.** A skipped question keeps its default; say what the default is.
- **Write at the end of every stage** (R-01, R-04). Then set `onboarding-stage` in `CLAUDE.md` to the next stage. If the session ends, the next one resumes from there.
- **When resuming,** say in one line what's already set up and which stage comes next.
- **Log real choices** in [[decisions]] with the date and the user's reason, where they gave one. One entry per stage is enough. Don't log a skipped question as a decision.
- **Before writing anything personal,** remind the user once that this vault is plain files on their computer, and anything synced or shared goes with it. They decide what's recorded.

## Stage 0 · Welcome

Set `onboarding: in-progress`. In a few sentences, explain:
- this vault is a shared memory between the user and their agent
- the agent starts every session blank and knows only what's written here
- setup takes about 15–30 minutes, can stop at any point, and picks up where it left off

Ask how familiar they are with:
- **Obsidian:** never used it · used it a little · comfortable
- **Working with Claude in Cowork:** first time · some · a lot

Write both answers right away as two lines in `CLAUDE.md` › Working style, for example `Obsidian: new`. From here on, set how much you explain by them.

If they're new to Obsidian, offer the hands-on basics first: [[core/obsidian-basics]] › Guided first steps, about 5 minutes. Run it before the tour if they accept.

Offer the tour: **short** (about 2 minutes), **full** (about 10 minutes), or **skip** (it can be run any time later).

## Stage 1 · Tour

Run [[core/tour]] at the chosen depth. Nothing is written in this stage.

## Stage 2 · Your agent

Write the answers to `CLAUDE.md` › Identity.
- **Name.** Anything the user likes. Offer to suggest a few if they'd like ideas.
- **Personality and tone.** Offer these as starting points: *direct and concise* · *warm and encouraging* · *dry wit* · *calm and formal*. Or they can describe their own, or mix two. Then ask one follow-up: is there anything the agent should never sound like?
- **How to address the user:** name, nickname, or nothing in particular.

From this stage on, speak as the agent they've defined.

## Stage 3 · About you

- **Name, what they do, and the two or three main things they want this vault for.** Write these to [[reference/about-me]].
- **Optional:** the computers, devices, accounts, and tools they use most. Write these to [[reference/environment]].

## Stage 4 · How you like to work

Write each answer as one line in `CLAUDE.md` › Working style, and remove the placeholder line. Defaults are in brackets.
1. **Answer length:** brief · [balanced] · thorough
2. **Hands-on tasks:** [the complete set of instructions up front, each step with what to expect, to work through alone] · one step at a time, checking in after each
3. **Explanations:** [reasoning at each decision point] · just the answer unless asked
4. **Ambition:** aim for the most ambitious version, then scale back deliberately · [start small and build up]
5. **Deadlines and pace:** [mention them only when asked] · remind me
6. **Small, reversible actions:** [ask first] · just do them and tell me
7. **Feedback:** [plain and direct] · gentler. R-12 applies either way.
8. **Experience levels** from Stage 0: confirm them, or update them if a few minutes in Obsidian changed the answer.
9. **Anything the agent should never do.** This is open-ended. Each answer becomes a house rule in this stage.

## Stage 5 · The rules

Offer: **walk through them** by group, showing each rule's title and its *guards against* line, or **keep them all** and review them any time later.

When walking through:
- If the user questions a rule or wants to change it, read that rule's section in [[core/rules-why]] and explain it before changing anything.
- A change or drop becomes an entry in `CLAUDE.md` › Overrides (R-26).
- A new rule becomes H-nn under › House rules, in the core shape: what it does, plus why.

## Stage 6 · First project

Ask what they're working on now. Pick one project, or let them skip this stage.
1. Create `projects/<name>/` with `INDEX.md`, `status.md`, `decisions.md`, and `failures.md`, copied from `core/templates/project/`. Replace `{{title}}`, `{{name}}` (the folder name) and `{{date}}`.
2. Fill in `INDEX.md` (what the project is and its key facts) and the `status.md` frontmatter (R-03).
3. Add a row to `CLAUDE.md` › Projects. Add any new tags to [[reference/tag-registry]].
4. Run `bash core/scripts/board.sh` and show them the result: this is what an open session start will look like.

## Stage 7 · Wrap-up

1. Summarize what was set up and where each piece lives, as one line per file.
2. Explain everyday use in a few sentences:
   - Open with a specific task to get straight to work, or with something open-ended ("what's next?") to get a status briefing.
   - Drop ideas into [[inbox]] at any time.
   - Say "update and close" before stopping.
3. Write the first [[progress/progress-log]] entry.
4. Set `onboarding: complete` and remove `onboarding-stage`.
5. Replace the whole `## First run` section of `CLAUDE.md` with this one line:
   `Onboarding complete (YYYY-MM-DD). To rerun the tour or change setup, read [[core/onboarding]] › Reruns.`

## Reruns

- **"Rerun the tour":** run [[core/tour]]. Onboarding state doesn't change.
- **"Redo setup," or a single stage ("redo my working style"):** run that stage. Show the current values first, and change only what the user changes. Nothing is wiped. Log any changes in [[decisions]].
