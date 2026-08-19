---
name: ff-shotlist
description: Plans what to shoot before a concert or scene so the footage carries a premise. Use when preparing for a shoot, heading to a show, packing gear, or working out what a planned post needs on camera.
---

# ff-shotlist

The only skill that runs **before** the footage exists. A concert cannot be reshot.

## What it produces

A shot list where every entry names a **premise it serves**, not just a pretty frame. A list of
nice shots produces footage with no post in it.

Each entry carries:
- **The shot** — framing, timing, where to stand
- **The premise it serves** — what post this footage makes possible
- **The witness detail to watch for** — the specific thing worth noticing when it happens
- **Fallback** — what to get instead when the venue, crowd, or lighting refuses

## Steps

1. Establish the constraints: venue, expected lighting, crowd density, where the creator can
   physically stand, set length, whether they can move between songs.
2. Draft 5–8 entries covering: establishing, the craft-teaching shot, the witness-detail shot,
   and at least one that works even if everything goes wrong.
3. Add the **teach layer** — for each shot, the technique that makes it the post. Per
   `references/platform-facts.md`, craft is the product; the footage is the proof.
4. Note audio: real concert sound belongs on YouTube; Instagram and TikTok cuts need library
   audio. Plan for both from the start rather than discovering it in the edit.

✅ **Done when** every entry names a premise and a fallback, and at least one entry survives bad
lighting and a blocked view.

## Reads / Writes

**Paths:** everything below is relative to the plugin root, not the open project. Resolve first:
`eval "$("$(dirname "$(dirname "$(readlink -f ~/.claude/skills/ff-init)")")/scripts/ff-paths.sh")"`
then read and write via `$FF_DATA`, `$FF_REFS`, `$FF_SCRIPTS`.

- Reads: `data/positioning.md`, `data/ideas.md` (unshot ideas that need footage),
  `references/platform-facts.md`
- Writes: `data/shotlists/<date>-<venue>.md`

## Boundaries

Plans footage. Does not write captions (`ff-package`), generate post premises from scratch
(`ff-ideas`), or evaluate footage after the fact.

## Gotchas

- **A shot list of beautiful frames is a trap.** Beautiful footage with no premise becomes a post
  nobody finishes. Every entry earns its place by naming what it makes possible.
- **Venue reality beats the plan.** Security moves people, the pit fills, the lighting designer
  does something unplanned. Fallbacks are the working part of the list.
- **Phone storage and battery end shoots.** Check both before the list is finalized.
- **The best concert shot is often not the stage.** Faces, hands, the walk out, the merch line.
  These carry witness detail the stage rarely does, and no licensing problem.
