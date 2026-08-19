---
name: ff-init
description: Interviews the creator to build their voice profile and creative positioning. Use when setting up frame-first, when data/voice.md is missing or empty, or when the creator says their content sounds generic or no longer sounds like them.
---

# ff-init

A one-time interview, roughly 15–20 minutes. Every other skill reads what it writes, so a thin
profile here produces generic output everywhere else.

## Method

Ask **one question at a time** and wait. A wall of twenty questions gets abandoned at four.

When an answer is generic, say so and ask again with a narrower question. "I love capturing
moments" is a non-answer; "what did you photograph last week that nobody asked you to?" gets a
real one.

## What to extract

1. **Ten captions the creator wrote themselves.** Ask for real ones, pasted. These become the
   comparison set `ff-critique` judges against — the single highest-value input in the interview.
2. **Words and phrasings they would never use.** This becomes the deny-list that
   `scripts/slop-check.sh` enforces mechanically. Push for specifics.
3. **What they find embarrassing in other creators' work.** Negative space defines voice faster
   than positive description.
4. **Their creative identity** — one sentence that stays true across concerts, streets, and
   travel. Challenge anything that would fit any photographer.
5. **What they will not do on camera.** Constrains every format suggestion downstream.
6. **Gear reality** — what they own, what they borrow, what they actually use. Keeps affiliate
   recommendations in `ff-strategy` honest.

✅ **Done when** `data/voice.md` and `data/positioning.md` both exist, the deny-list has at
least five entries, and at least eight real captions are recorded.

## Writes

- `data/voice.md` — rhythm, vocabulary, deny-list, real captions
- `data/positioning.md` — creative identity, subjects in scope, what they will not make

Use `data/voice.example.md` and `data/positioning.example.md` for structure. Keep the deny-list
heading exactly as written — `scripts/slop-check.sh` parses it.

## Boundaries

Builds the profile. Does not generate ideas, write captions, or research trends.

## Gotchas

- **A section with invented content is worse than an empty one.** An imagined voice trait gets
  enforced by every later skill. Leave it blank and say what is missing.
- **The creator will want to skip the ten captions.** It is the slowest question and the one that
  makes the plugin work. Hold the line.
- **Voice drifts.** Re-running this after six months is normal, not a failure.
- **Their stated voice and their actual voice differ.** When the pasted captions contradict the
  self-description, record both and note the gap.
