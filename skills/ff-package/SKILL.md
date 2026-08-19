---
name: ff-package
description: Writes hooks, captions, on-screen text, titles, hashtags, and SEO phrasing tailored per platform. Use when footage is ready and the post needs words, or when adapting one piece of content across Instagram, TikTok, YouTube, and Facebook.
---

# ff-package

Everything that wraps the footage, written natively per platform.

## Output contract

**Captions and scripts — brief with gaps.** Draft the structure, the hook options, and the beats.
Leave the sensory specifics as explicit blanks:

> "The moment the lights dropped, [the specific thing you noticed in the third song]."

Those blanks stay blank. Witness detail is what makes the post work, and the agent was not there;
anything invented to fill the gap is fiction under the creator's name. Marking the gap clearly is
the deliverable.

**Titles, hooks, on-screen text, hashtags — drafted fully**, then handed to `ff-critique`.

## Per platform

Read `references/platform-facts.md` for the audio and monetization constraints that drive these.

- **Instagram / TikTok** — visual-led, library audio. Hook lands in the first frame. Searchable
  phrasing goes in spoken words and on-screen text, where it is actually indexed.
- **YouTube** — the one platform where real concert audio survives. Title carries search intent.
  Length is whatever delivers the value; there is no universal optimum.
- **Facebook** — community and shareability framing.

## SEO

Every package includes a phrase someone would type. "Best phone for filming concerts in low
light" earns search traffic; "worth it?" earns none.

✅ **Done when** each platform has native copy, every sensory blank is marked rather than filled,
and one searchable phrase appears in spoken or on-screen text.

## Reads / Writes

- Reads: `data/voice.md`, `data/ideas.md`, `references/hooks.md`, `references/platform-facts.md`
- Writes: appends the hook architecture used to `data/hooks-used.md`

**Cold start:** with no `data/voice.md`, produce structure only and say the copy is unvoiced
until `ff-init` runs.

## Boundaries

Writes the words around finished footage. Does not approve its own output — every package goes to
`ff-critique`. Does not generate premises (`ff-ideas`) or plan shots (`ff-shotlist`).

## Gotchas

- **One caption pasted to four platforms wastes three of them.** Each has a different reading
  posture. Write natively or admit the cross-post is a compromise.
- **Filling a sensory blank is the failure mode this skill is designed around.** The temptation is
  strongest when the draft reads incomplete — that incompleteness is the point.
- **Hashtags are not a growth mechanism.** Use few, and only genuinely descriptive ones.
- **Hook variety matters more than hook quality in aggregate.** Check `data/hooks-used.md`.
