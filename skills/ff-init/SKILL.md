---
name: ff-init
description: Interview the creator once to build their voice profile and creative positioning. Use when setting up frame-first for the first time, when data/voice.md or data/positioning.md is missing or empty, or when the creator says their content is drifting, sounding generic, or no longer sounds like them.
---

> **STATUS: STUB.** Body to be written. Spec below.

## Purpose

Every other frame-first skill reads `data/voice.md` and `data/positioning.md`. If those are empty, the whole plugin produces generic photographer content. This skill is the only thing standing between the creator and AI slop.

## What this skill must do

Run a **one-time interview** (15-20 min), then write two files. Interview, do not template-dump.

Must extract:
1. **Ten captions the creator actually wrote themselves.** Ask for real ones, pasted. Infer rhythm, sentence length, punctuation habits, whether they use emoji, whether they use questions.
2. **Words and phrasings they would never use.** This is the highest-signal input — it is the deny-list every later skill checks against.
3. **What they find embarrassing in other creators' work.** Negative space defines voice faster than positive description.
4. **Their creative identity** — the one sentence that stays true across concerts, streets, and travel (per the "recognizable without being predictable" principle). Push back if they give something generic like "I love capturing moments."
5. **What they are NOT willing to do on camera.** Constrains every format suggestion downstream.
6. **Gear reality** — iPhone 16 Pro, what apps, what they own vs. borrow. Feeds affiliate honesty in `ff-strategy`.

## Writes

- `data/voice.md` — rhythm, vocabulary, deny-list, sample captions, first-person quirks
- `data/positioning.md` — creative identity, subjects in scope, what they will not make

## Rules

- Ask one question at a time. A 20-question wall gets abandoned.
- If an answer is generic, say so and ask again. Generic input here poisons everything downstream.
- Never invent voice traits the creator did not demonstrate. An empty section is better than a fabricated one.
