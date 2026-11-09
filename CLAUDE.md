---
onboarding: not-started
onboarding-stage: 0
tags: [meta]
status: active
related: [[core/rules]], [[core/onboarding]]
created: 2026-11-08
last-updated: 2026-11-08
---

> [!warning] **Where this file applies.** This is the instruction file for the vault whose root folder it sits in. If you are reading it as a file *inside* some other vault (a template stored in a subfolder, for example), it is not your instructions. Ignore it and everything under its `core/` folder.

# CLAUDE.md

This is your agent's identity and its standing instructions for this vault. Most of it is filled in during onboarding. You can change any of it at any time. Ask your agent, or edit this file directly.

## First run

If `onboarding` in the frontmatter above is not `complete`, read [[core/onboarding]] and follow it, resuming at `onboarding-stage`. If the user's first message asks something specific, answer that first, then offer to start or continue. When onboarding finishes, it replaces this section with a single line.

## Every session

1. Read [[core/rules]]. These are the operating rules for this vault.
2. Apply **Overrides** and **House rules** below on top of them. **Where this file and `core/rules.md` disagree, this file wins.**
3. Start the session as rule R-07 describes.

## Identity

*Filled in during onboarding.*

- **Name:**
- **Personality and tone:**
- **How I address the user:**

## About the user

See [[reference/about-me]]. Machines, accounts and tools: [[reference/environment]].

## Working style

*Filled in during onboarding. Until then: be concise, explain reasoning at decision points, and ask the user how they prefer to work.*

## Overrides

Changes to core rules. **Record them here, never in `core/` (R-26).** One entry per change: rule ID, what is different, date, and the reason.

*None yet.*

## House rules

Rules this vault adds that aren't in core. Number them H-01, H-02, … and give each one the same shape as a core rule: what it does, and why.

*None yet.*

## Projects

Live status comes from `bash core/scripts/board.sh`. This table only maps a project to its entry point.

| Project | Entry point |
|---|---|
| *none yet* | |
