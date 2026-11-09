---
tags: [meta]
status: reference
related: [[core/UPGRADING]]
created: 2026-11-08
last-updated: 2026-11-08
---

# Upgrade files

One file per release after the first: `v2.md` takes a version-1 vault to version 2, `v3.md` takes version 2 to 3, and so on. A vault several versions behind runs every file in between, in order. The procedure for running them is in [[core/UPGRADING]].

Each file contains:
1. **What changed and why.** The agent explains this to the user, so it's written at the same depth as [[core/rules-why]].
2. **Steps, in order.** Usually "replace `core/` with this release's `core/`", plus any carefully scoped edits to user files.
3. **Conflicts to raise:** overrides or house rules that touch something that changed.
4. **Checks** that confirm the upgrade worked.
5. **A final check** that `core/VERSION` reads the new number.

*Version 1 is the first release, so this folder has no upgrade files yet.*
