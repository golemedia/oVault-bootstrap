---
tags: [meta, rules]
status: reference
related: [[core/rules]]
created: 2026-11-08
last-updated: 2026-11-08
---

# Why the core rules exist

The reasoning behind each rule in [[core/rules]]. **Read on demand, not every session:** during the tour, when the user questions or wants to change a rule, or when it's unclear whether a rule applies. Rule text lives only in `core/rules.md`; this file holds only the reasons.

## R-01
**The vault is your only memory**

Every session starts blank. The agent knows what the vault tells it and what the user says in that session, and nothing else. Conversations end or get compacted, and whatever was decided in them disappears. Usually nobody notices until a later session works confidently from an older version of the truth. The vault is the only thing that carries forward, so writing to it is part of the work itself, not paperwork done afterward.

## R-02
**Every fact lives in exactly one place**

A fact stored in three places has three chances to go stale. When it changes, someone updates one or two copies, and the vault starts disagreeing with itself with no way to tell which copy is current, because every copy looks equally authoritative. A link costs one extra read. A contradiction costs a wrong decision made confidently.

## R-03
**Current status lives only in status frontmatter**

Status changes more often than anything else in the vault, which makes it the fact most likely to drift when copied (R-02). Keeping it in a fixed set of fields also means a script can read every project in one pass, so the whole picture costs one command instead of opening every folder.

## R-04
**"Done" gets written down in the same turn**

A task finished in conversation but not in the notes is still open as far as the next session knows. That session will raise it again, plan around it, or ask about work already done. The pattern is hard to see because the stale note looks just as authoritative as a current one. Recording completion later, or in a batch at the end, is exactly where things slip. The only reliable moment is the moment the user says it.

## R-05
**Decisions record *why*; the progress log records *what***

Months later, "why is it like this?" is the question that matters, and by then the conversation that answered it is gone. Without the reasoning, a later session or the user may undo a good decision because its purpose isn't visible, or keep a bad one because nobody remembers it was provisional. The reasoning lives in one place for the same reason as R-02: two write-ups of one argument drift apart, and a refined version in one place silently contradicts the other.

## R-06
**Log as you go; close sessions cleanly**

The progress log answers "where was I?" for the next session, which reads only the most recent entry. Sessions can end without warning, from usage limits or interruptions, so a session that saves all its updates for the end can lose every one of them. Writing as you go (R-04, R-05) does most of the work. The close is a safety net, not the main mechanism.

## R-07
**How a session starts depends on how the user opens it**

A status sweep in front of a direct question is noise, and it spends the user's limited session budget on something they didn't ask for. An open start is exactly when they want orientation. Reading only the board and the last log entry keeps that orientation cheap, because the board is built to show the whole picture in one read.

## R-08
**The inbox is read only when asked**

An inbox is a place to put things down without having to deal with them yet. If the agent reads out every item every session, the user stops using it. But an inbox nobody looks at rots, so the count is always visible: noticing is free, and reading happens on request.

## R-09
**Read on demand, in order**

Every file read spends part of the session's budget. A session that fills up on background reading gets compacted or ends early, and loses the context it actually needed. Each `INDEX.md` is written so that most sessions need nothing else.

## R-10
**Other projects stay closed**

The board shows every flag at the start of an open session, and that's enough. Re-raising unrelated items mid-task breaks focus and starts to feel like nagging, which makes the user less willing to record open items at all.

## R-11
**Every instruction says where**

"Fix the typo in the setup note" sends the reader hunting. "Fix 'recieve' in the second paragraph of `projects/garden/setup`" gets it fixed. An instruction without a location looks complete to whoever wrote it, because they know what they meant. To everyone else, including the next session, it's incomplete. Naming the place takes seconds; leaving it out costs a search, and often the correction never lands.

## R-12
**Correct plainly, once, without keeping score**

The point of a correction is to get the thing fixed. Counting misses turns information into a reprimand and adds nothing actionable. It makes people defensive and less willing to share unfinished work, which is the work that most needs a second pair of eyes. Critique of the work helps. Judgement of the person doesn't.

## R-13
**Have a recommendation**

A list of options with no recommendation hands all the thinking back to the user. A partner who folds the moment they're questioned can't be relied on when they happen to be right. The user always makes the call. The agent's job is to make sure they make it with the strongest case on each side in view.

## R-14
**Never guess at state**

In the vault, a confident guess reads exactly like a verified fact. Once a guess is written down, later sessions treat it as true and build on it. Hardware, software, and people's circumstances all change between sessions, so the only safe assumption is that something might have.

## R-15
**Check prerequisites before starting**

Finding a missing prerequisite halfway through leaves things half-changed, which is usually worse than not starting. Questions are cheapest before the first step.

## R-16
**Ask about built-but-unconfirmed items**

Things get built, start working, and go straight into use, and the session that would have recorded the confirmation never happens. The vault keeps the last thing it was told indefinitely, so a working system can stay "pending" forever in notes that are tidy, recent-looking, and wrong. A one-line question fixes it.

## R-17
**Look up anything that may have changed**

The agent's built-in knowledge stops at a cutoff date, and it isn't always obvious which facts have gone stale since then. Outdated information delivered confidently is worse than saying "let me check."

## R-18
**Two exchanges without progress: stop and step back**

The longer a dead end runs, the more it feels like the next attempt will work. Stepping back costs one exchange; another round of the same approach usually costs several. Logging it keeps later sessions from walking into the same hole, since they won't remember it otherwise (R-01).

## R-19
**When a fix changes nothing, stop editing**

"No change" is information: it says the fix is in the wrong layer. Rewriting the same layer anyway piles up changes, any of which can add new problems, while the real fault stays where it was. A subtle test result can be read as either success or failure. An obvious one can't.

## R-20
**Bank lessons that carry across projects**

Paying for the same mistake twice is the expensive part. A project's `failures.md` records what happened in that project; lessons-learned records what applies everywhere.

## R-21
**Standing facts live in `reference/`**

Being asked the same question every session is a tax on the user and a sign the vault isn't doing its job. Re-asking also produces slightly different answers each time, with no record of which one is current.

## R-22
**Notes follow the conventions**

Every project has an `INDEX.md`, so short links are ambiguous and break silently. Consistent frontmatter lets scripts and Obsidian search across the whole vault. A controlled tag list stops near-duplicates ("homelab", "home-lab", "lab") from splitting one topic three ways. The `reference` status exists because some notes are correct and simply static; without it they would look stale forever.

## R-23
**The user can find things without the agent**

The vault is meant to be readable by a person. When the agent isn't available, because of usage limits, being offline, or just wanting a quick check, the user should be able to open a note and find the answer in seconds. A pasted copy of a file is a second home for its contents (R-02), and it goes stale without anyone noticing.

## R-24
**Shrink without losing facts**

Notes get trimmed to stay quick to read, and trimming is where facts quietly disappear, because each cut seems minor at the time. A moved fact can still be found. A deleted fact is gone, and nobody knows to look for it.

## R-25
**Keep often-read files lean**

Everything the agent reads stays in the conversation for the rest of the session, so a file read every session is paid for on every turn of every session. Those files grow quietly, because each addition is small and useful when it's made. Splitting by *when* detail is needed, rather than deleting it, keeps everyday cost low without losing anything (R-24).

## R-26
**Never edit `core/`**

`core/` is replaced as a whole when the vault is upgraded to a newer release, so anything edited inside it would be silently overwritten. Keeping the user's changes in their own file means those changes survive every upgrade, and it gives a clear record of where this vault differs from the defaults and why.

## R-27
**Upgrades come from the newer release**

This vault can't know what future versions contain. Each newer release carries its own upgrade instructions, written for exactly the versions that came before it. Following those instead of improvising means every step is applied, in order, and nothing is skipped.
