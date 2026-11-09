# oVault

A starter vault for working with Claude as a long-term partner. It's a folder of plain notes that you and your Claude agent share, with a built-in set of working rules so the agent remembers what matters between sessions, records decisions with their reasons, and keeps everything findable by you as well as by it.

On its first run, your agent offers a tour of what's already built, then walks you through making it yours: its name and personality, how you like to work, and which default rules to keep. Every answer is written into the vault as you go.

## What you need

- [Obsidian](https://obsidian.md) (free), to read and browse your notes.
- The Claude desktop app with Cowork, so your agent can work in a folder on your computer. It works on macOS and Windows. On Windows, Cowork runs in a small virtual machine and needs Windows' *Virtual Machine Platform* feature turned on. Windows Home editions can have trouble with this; Pro, Enterprise and Education work.

## Install

1. **Download the latest release.** On this repository's **Releases** page, open the release marked **Latest** and download its ZIP. Unzip it wherever you'd like your vault to live, and rename the folder if you want. On Windows, pick a folder that's fully on your computer, not one synced through OneDrive (which `Documents` often is), so your agent never hits a file that's only in the cloud. (You can also clone the repo, but the latest release is the tested version; the main branch may be a work in progress.)
2. **Open it in Obsidian.** Install Obsidian if you haven't, and start it. On its start screen, choose **Open folder as vault** and pick the folder you just unzipped. **Never used Obsidian? You don't need to learn it first.** Your agent will offer a short hands-on introduction during setup.
3. **Open it in Claude.** Start a Cowork session with that folder and say anything. Your agent will take it from there.

Setup takes about 15–30 minutes. You can stop at any point; the next session picks up where you left off.

## Your vault is private

This folder becomes your second brain: what you're working on, how you think, what you've decided. **Don't push your filled-in vault to a public repository**, and think about where it gets synced. Your agent will remind you of this before it records anything personal.

## What's inside

| Path | What it is |
|---|---|
| `CLAUDE.md` | Your agent's identity and instructions, plus your changes to the rules |
| `core/` | The rules, setup and tour that come with this release. Your agent never edits it |
| `projects/` | One folder per project |
| `reference/` | Standing facts: about you, your setup, lessons learned, tags |
| `progress/`, `decisions.md`, `inbox.md` | What happened, why, and ideas for later |

Ask your agent for the tour at any time to see what's in your vault and how it works.

The two scripts in `core/scripts/` are run by your agent; you never need to run them yourself. If you'd like to, they need bash: it's built into macOS and Linux, and on Windows you can use Git Bash or WSL.

## Versions and upgrading

Every release is frozen once it's published, and all of them stay available on the **Releases** page. `core/VERSION` shows which one your vault is on.

To move to a newer release, download it into a separate folder (not on top of your vault) and ask your agent to upgrade your vault from it. Each release carries step-by-step upgrade instructions, and your agent backs up your vault, explains what changed, and checks with you before applying anything. Your customizations live outside `core/`, so they carry over.

## License

MIT. See [LICENSE](LICENSE).
