# ff-ideas

*A `frame-first` workflow — Turns footage or a blank slate into specific, shootable content premises.*

## Grill first

Do not propose anything until the input is complete. **Complete means you know what was actually
shot or planned, at least one witness detail, the subject, and who it is for.** Whatever of that is
missing, ask for — one question at a time, highest-value gap first, until you could produce the
premises and defend every choice in them. Then restate the premise you are working from and wait
for a yes.

Full method, including the escape hatch, in the router's *Grill before generating*. Two things that
matter most here: **a complete input gets no questions at all**, and *"just draft it"* ends the
grilling immediately — you then name the gaps and leave them blank rather than filling them.

## Step 0 — ground it before proposing

Read `references/platform-facts.md` before offering any premise that depends on a platform behaving
a certain way. A premise that cannot be published as described is worse than none.

**If that file is unavailable, the two conclusions that kill premises are these:** a vertical clip
of one to three minutes carrying claimed music is a YouTube Short and gets blocked outright, so no
premise may promise real recorded music on a Short; and Instagram makes muted, watermarked,
bordered, low-resolution, majority-text, and already-posted reels less visible, so no premise may
depend on any of those. Say the claim is uncited.

Any claim about what a platform rewards traces to `references/ranking-signals.md`, or it is
labelled a judgment call. No live research: what is unretrievable is listed as unretrievable there.

**When premises are built from supplied assets, confirm what each asset actually contains before
building a premise on it.** A filename is a label, not evidence — a sequence assembled from
filenames has produced a real error. If the assets cannot be inspected, say so and leave the
mapping as a blank for the creator rather than assuming the file is what it is called.

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
- **Emotional payload** — one dominant driver, named (see `references/arrrsr.md`, which walks the
  six stages: Attention → Relevance → Retention → Reward → Sharing → Relationship, each a gate
  rather than a score to average)
- **Send test** — who forwards this to one specific person, and why
- **Searchable phrase** — words someone would actually type

✅ **Done when** each premise carries all six, each names a witness detail the creator already
has or knows how to get, and any fully drafted line of copy in the output carries a SHIP/FIX/KILL
verdict from `ff-critique`. Premises, tensions, and searchable phrases are not drafted copy.

## Volume

Five specific premises beat twenty generic ones. Generate fewer and interrogate harder.

## Reads / Writes

**Paths:** `references/`, `scripts/`, and `templates/` are siblings of `SKILL.md` in this skill
folder — read them by relative path. `profile/…` means the creator's own files, which live in the
profile directory in local mode and arrive as Project files or in the conversation in context mode.
Check the router's Step 0 before writing to any of them.

- Reads: `profile/voice.md`, `profile/positioning.md`, `profile/hooks-used.md`, `profile/performance.md`,
  `references/platform-facts.md`
- Writes: appends to `profile/ideas.md` with status `unshot`

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
- **Check `profile/hooks-used.md` before proposing.** Four posts opening the same way trains the
  audience to scroll.
