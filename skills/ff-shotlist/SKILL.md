---
name: ff-shotlist
description: Plans what to shoot before the moment happens, so the footage carries a premise. Use when preparing for any shoot or event, packing gear, or working out what a planned post needs on camera.
---

# ff-shotlist

The only skill that runs **before** the footage exists. Some moments cannot be reshot — a concert,
a ceremony, a first attempt, weather, a stranger's expression. Plan those hardest.

## What it produces

A shot list where every entry names a **premise it serves**, not just a pretty frame. A list of
nice shots produces footage with no post in it.

Each entry carries:
- **The shot** — framing, timing, where to stand
- **The premise it serves** — what post this footage makes possible
- **The witness detail to watch for** — the specific thing worth noticing when it happens
- **Fallback** — what to get instead when the location, people, or light refuse to cooperate

## Steps

1. Establish the constraints, whatever the subject: where the creator can physically be, the
   light they will get, how long they have, what they can and cannot control, and whether the
   moment repeats. Ask — do not assume a venue, a crowd, or a stage.
2. Draft 5–8 entries covering: establishing, the craft-teaching shot, the witness-detail shot,
   and at least one that works even if everything goes wrong.
3. Add the **teach layer** — for each shot, the technique that makes it the post. Craft is the
   product; the footage is the proof.
4. Note audio. When the subject carries **copyrighted music** — a concert, a venue playlist, a
   busker, a soundtrack in the background — read `references/platform-facts.md` first, since it
   decides what survives on which platform and can force a horizontal or longer take. When the
   audio is the creator's own or ambient, this constraint does not apply and library audio is a
   choice rather than a requirement.

✅ **Done when** every entry names a premise and a fallback, and at least one entry survives bad
lighting and a blocked view.

## Reads / Writes

**Paths:** everything below is relative to the plugin root, not the open project. Resolve first:
`FF="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$(readlink "$HOME/.claude/skills/ff-init")")")}"; eval "$("$FF/scripts/ff-paths.sh")"`
then read and write via `$FF_DATA`, `$FF_REFS`, `$FF_SCRIPTS`.

- Reads: `data/positioning.md`, `data/ideas.md` (unshot ideas that need footage),
  `references/platform-facts.md`
- Writes: `data/shotlists/<date>-<subject>.md`

## Boundaries

Plans footage. Does not write captions (`ff-package`), generate post premises from scratch
(`ff-ideas`), or evaluate footage after the fact.

## Gotchas

- **A shot list of beautiful frames is a trap.** Beautiful footage with no premise becomes a post
  nobody finishes. Every entry earns its place by naming what it makes possible.
- **Reality beats the plan.** People move, the light changes, access is refused, the thing you
  came for does not happen. Fallbacks are the working part of the list.
- **Phone storage and battery end shoots.** Check both before the list is finalized.
- **The obvious subject is rarely the best shot.** At a concert it is faces and hands rather than
  the stage; the same rule holds anywhere — the periphery carries witness detail the main event
  does not, and usually no licensing problem either.
- **Do not assume the subject.** This skill gets used for concerts, but also for travel, street,
  events, food, products, and things nobody has tried yet. Ask what is being shot before
  planning it.
