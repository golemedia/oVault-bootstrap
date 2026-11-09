---
state: planning
headline: ""
next: ""
waiting-on: ""
flag: ""
state-verified: {{date}}
tags: [project, status]
status: active
related: [[projects/{{name}}/INDEX]]
created: {{date}}
last-updated: {{date}}
---

# {{title}}: status

**The fields above are the only stored copy of this project's current state (R-03).** `core/scripts/board.sh` reads them. Update them the moment something changes (R-04), and set `state-verified` to the date someone actually confirmed the state.

| Field | Holds |
|---|---|
| `state` | One of: `planning` · `active` · `waiting` · `blocked` · `built-unverified` · `done` · `shelved` |
| `headline` | One line: where the project stands |
| `next` | The next concrete step, with its location (R-11) |
| `waiting-on` | Empty, or what the user or someone else has to do before work can continue |
| `flag` | Empty, or a problem that needs attention |
| `state-verified` | The date the state was last confirmed to be true |

`built-unverified` means something has been built but nobody has yet confirmed it works. The board lists these so the agent asks about them (R-16).

## Current detail

Detail the board only summarizes. Read on demand (R-09).
