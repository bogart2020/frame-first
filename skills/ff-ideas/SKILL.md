---
name: ff-ideas
description: Generate content ideas for phone-cinematography and concert/craft video, either from footage the creator just shot or from nothing. Use when the creator needs post ideas, has footage and does not know what to make of it, is stuck for what to post next, or wants angles on a shoot they are planning.
---

> **STATUS: STUB.** Body to be written. Spec below.

## Purpose

Turn either (a) footage the creator already has or (b) a blank slate into specific, shootable content premises that pass the anti-slop bar before they are ever shot.

## Two entry modes

**Mode A — "I shot something."** The creator describes the footage. The skill interrogates for the *specific* thing that happened, then builds premises around it.
**Mode B — "I have nothing."** The skill generates premises from positioning + the craft angle, and outputs them as a shot list the creator can go execute.

## What every generated idea must carry

Refuse to output an idea missing any of these:

- **A premise** stated in one sentence — what is this actually about
- **A tension** — the unresolved thing that makes someone stay (see `references/hooks.md`)
- **The teachable core** — what the viewer *learns*, per the strategy: concert footage is proof, craft is the product
- **An emotional payload** — one dominant driver, named (see `references/arrrsr.md`)
- **The send test** — who would send this to one specific person, and why
- **Searchability** — a natural-language phrase someone might actually type

## Reads / Writes

- Reads: `data/voice.md`, `data/positioning.md`, `data/hooks-used.md` (to avoid repeating hook shapes), `data/performance.md` (what has worked)
- Writes: appends to `data/ideas.md` with status `unshot`

## Rules

- Generate **fewer, better**. Five specific premises beat twenty generic ones.
- Never produce an idea whose only value is that the footage looks nice. "Beautiful shot" is not a premise.
- Cross-check `data/hooks-used.md` — if the last four posts opened the same way, say so and force a different shape.
