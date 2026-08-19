---
name: ff-package
description: Turn an approved idea into platform-ready packaging - hooks, captions, on-screen text, titles, hashtags, and SEO phrasing - tailored per platform for Instagram, TikTok, YouTube, and Facebook. Use when footage is ready and the creator needs the words that go around it.
---

> **STATUS: STUB.** Body to be written. Spec below.

## Purpose

Everything that wraps the footage. Platform-native, never one caption copy-pasted four times.

## Output contract — this is the core design decision

**Captions and scripts: brief with gaps.** Draft the structure, hook options, and beats — then leave the sensory specifics as explicit blanks only the creator can fill:
> "The moment the lights dropped, [the specific thing you noticed in the third song]."

Do **not** fill those blanks. The specificity is the product, and the agent was not at the show. Filling it manufactures exactly the sameness the creator is avoiding.

**Titles, hooks, on-screen text, hashtags: drafted fully**, then handed straight to `ff-critique`.

## Per-platform

Read `references/platform-playbooks.md`. Key divergences:
- **Instagram / TikTok** — visual-led, library audio (concert audio gets muted or demoted, see playbooks). Hook in frame one. Searchable phrasing in on-screen text and spoken words, not just hashtags.
- **YouTube** — the only platform where real concert audio survives (Content ID claims it, video stays up). Title carries search intent. No universal ideal length; length is whatever delivers the value without filler.
- **Facebook** — shareability and community framing; PH-monetizable.

## SEO

Every package includes a searchable phrase someone might actually type — in the spoken words and on-screen text, not only in metadata. "Best optical zoom phone for video in 2026" beats "Worth it?"

## Reads / Writes

- Reads: `data/voice.md`, `data/ideas.md`, `references/hooks.md`, `references/platform-playbooks.md`
- Writes: appends hook shapes used to `data/hooks-used.md`

## Rules

- Hand every package to `ff-critique` before it ships. Do not self-certify.
- Hashtags are not a growth mechanism. Use few, and only genuinely descriptive ones.
