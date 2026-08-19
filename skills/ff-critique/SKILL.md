---
name: ff-critique
description: Blocking quality gate for draft captions, scripts, hooks, and content ideas. Checks for generic AI phrasing, missing specificity, weak hooks, and stages of the attention model that break. Use before posting anything, when a draft feels off, or when deciding whether an idea is worth making at all.
---

> **STATUS: STUB.** Body to be written. Spec below.

## Purpose

The gate. It has authority to say **do not post this**, and to say **do not make this at all**.

## This skill blocks

It does not produce advice and let the creator decide. It withholds a ship verdict until each flagged failure is fixed. A gate that always passes is not a gate.

Three verdicts only:
- **SHIP** — every stage holds
- **FIX** — specific named failures, each with the question the creator must answer to repair it
- **KILL** — the premise itself does not earn a post; say why, and what would have to change

## What it checks

Run against `references/arrrsr.md` (six stages) and `references/slop-patterns.md`.

Every failure must be **named specifically**, never scored. Not "the hook is weak" but:
> "This hook works for any concert. What happened at THIS one that didn't happen at the others?"

Non-negotiable checks:
1. **Specificity** — could someone who was not there have written this? If yes, FIX. This is the primary test.
2. **The send test** — who sends this to one specific person, and what does sending it say about them? No answer means no shares.
3. **Curiosity paid off** — a gap opened and never closed is clickbait. FIX.
4. **Retention vs. satisfaction** — would a viewer who watched all of it feel it was worth their time? Manufactured retention fails this.
5. **Voice match** — check against `data/voice.md`, especially the deny-list. Any phrase on the deny-list is an automatic FIX.
6. **Hook repetition** — check `data/hooks-used.md`. Reusing a recent shape is a FIX.
7. **Learn or relate** — does the viewer get something, or is this only about the creator?

## Reads

`data/voice.md`, `data/positioning.md`, `data/hooks-used.md`, `references/arrrsr.md`, `references/slop-patterns.md`

## Rules

- Never soften a verdict to be agreeable. The creator asked for this gate precisely because they will want to ignore it at 1am.
- Never rewrite the line yourself when the missing ingredient is lived experience. Name what is missing and hand it back.
