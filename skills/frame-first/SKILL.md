---
name: frame-first
description: Routes content-creation work to the right frame-first skill and loads the creator profile. Use when starting any photography or video content task, planning a post, or unsure which frame-first skill applies.
---

# frame-first

Entry point. Load the creator profile, pick the branch, hand off.

## Step 1 — load the profile

Read `data/voice.md` and `data/positioning.md`. Every downstream skill depends on them.

**When either file is missing or empty:** say so and run `ff-init` first. Everything produced
without a profile is generic — that is the failure this plugin exists to prevent.

**Cold start** — a creator with no captions, no analytics, no shot history. This is normal on
day one. `ff-init` handles it. Do not fabricate profile content to fill the gap.

## Step 2 — route

| The creator is… | Skill |
|---|---|
| Setting up, or their content is drifting generic | `ff-init` |
| Preparing for a shoot or show | `ff-shotlist` |
| Holding footage with no angle, or stuck for ideas | `ff-ideas` |
| Asking what is working now | `ff-trends` |
| Holding a draft caption, hook, or script | `ff-critique` |
| Ready to write the words around finished footage | `ff-package` |
| Reviewing results, planning a cycle, or asking about money | `ff-strategy` |

Two skills can apply in sequence — `ff-ideas` then `ff-package`, or `ff-package` then
`ff-critique`. Run them in order rather than merging them.

## Step 3 — hand off

State which skill you are invoking and why in one line, then invoke it and follow it exactly.

## Boundaries

Routes and loads context. All actual work happens in the specialist skills. When no branch fits,
say so and ask — rather than picking the closest one.

## Shared vocabulary

Terms every frame-first skill uses. Definitions live here only.

- **Witness detail** — a concrete detail only someone who was physically present could supply.
  "15,000 people singing the first line" is a witness detail; "the crowd was amazing" is not.
  This is the plugin's central test.
- **The send test** — would someone forward this to one specific person, and what does sending
  it say about them? Content that survives this travels through relationships.
- **Proof, not product** — concert footage is the credential that earns attention. The craft
  behind it is what the audience actually pays for. See `references/platform-facts.md`.
- **SHIP / FIX / KILL** — the only three verdicts `ff-critique` returns.

## Gotchas

- **The profile gets skipped under time pressure.** A creator in a hurry wants the caption, not
  the interview. Loading the profile is step 1 for a reason; a fast generic caption is worth less
  than no caption.
- **Routing to two skills at once produces mush.** Sequence them.
- **`data/` is gitignored.** Its absence means a fresh clone, not a broken install.
