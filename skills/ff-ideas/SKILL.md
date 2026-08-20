---
name: ff-ideas
description: Turns footage or a blank slate into specific, shootable content premises. Use when the creator has footage and no angle, needs post ideas, is stuck on what to make next, or wants angles on a planned shoot.
---

# ff-ideas

## Step 0 — ground it before proposing

Read `references/platform-facts.md` before offering any premise that depends on a platform behaving
a certain way. A premise that cannot be published as described is worse than none — a concert idea
built around real audio runs straight into the YouTube Shorts carve-out and Instagram's demotion
list.

Any claim about what a platform rewards traces to `references/ranking-signals.md`, or it is
labelled a judgment call. No live research: what is unretrievable is listed as unretrievable there.

## Two entry modes

**Footage in hand** — the creator describes what they shot. Interrogate for the specific thing
that happened before proposing anything. The premise lives in the detail, not the subject.

**Blank slate** — generate premises from positioning and the craft angle, and output them as
something the creator can go shoot. Hand off to `ff-shotlist` for execution.

## Every idea carries six things

An idea missing any of these goes back for another pass:

- **Premise** — one sentence: what is this about
- **Tension** — the unresolved thing that holds attention (see `references/hooks.md`)
- **Teachable core** — what the viewer learns. Craft is the product; the footage is the proof
- **Emotional payload** — one dominant driver, named (see `references/arrrsr.md`)
- **Send test** — who forwards this to one specific person, and why
- **Searchable phrase** — words someone would actually type

✅ **Done when** each premise carries all six, and each names a witness detail the creator
already has or knows how to get.

## Volume

Five specific premises beat twenty generic ones. Generate fewer and interrogate harder.

## Reads / Writes

**Paths:** everything below is relative to the plugin root, not the open project. Resolve first:
`FF="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$(readlink "$HOME/.claude/skills/ff-init")")")}"; eval "$("$FF/scripts/ff-paths.sh")"`
then read and write via `$FF_DATA`, `$FF_REFS`, `$FF_SCRIPTS`.

- Reads: `data/voice.md`, `data/positioning.md`, `data/hooks-used.md`, `data/performance.md`,
  `references/platform-facts.md`
- Writes: appends to `data/ideas.md` with status `unshot`

**Cold start:** with no performance history, generate from positioning alone and say the
suggestions are unvalidated by real audience response.

## Boundaries

Produces premises. Does not write captions (`ff-package`), plan camera work (`ff-shotlist`), or
approve its own output (`ff-critique`).

## Gotchas

- **"The footage looks incredible" is not a premise.** Beautiful footage with nothing to say
  produces posts people scroll past. Ask what happened, not what it looked like.
- **The creator's most interesting detail usually arrives third.** The first answer is the
  headline, the second is context, the third is the actual story. Keep asking.
- **Ideas drift toward the creator as subject.** The strongest premises let the viewer learn or
  recognize themselves. Check every idea for who it is really about.
- **Check `data/hooks-used.md` before proposing.** Four posts opening the same way trains the
  audience to scroll.
