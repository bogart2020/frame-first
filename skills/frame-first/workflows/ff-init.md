# ff-init

*A `frame-first` workflow — Optional quick seed for the creator's voice profile, or a reset when the voice has drifted.*

**Optional, and short.** Two or three questions, not an interview. Every workflow works without this
— the profile fills itself in from feedback as the creator works (see the router's *Learn from the
correction*). It exists for two cases only:

1. The creator wants to seed something deliberately rather than wait for it to accumulate.
2. The voice has drifted and they want to reset it.

**Never block on this.** If the creator would rather just start working, say the profile will build
itself and move on. A refused interview is not a failure state.

## Method

Ask at most three questions, one at a time. Stop early if the answers are thin — what does not
arrive here arrives later through feedback, which is cheaper and more accurate anyway.

1. **Anything you've already posted?** Ask for one or two real captions, pasted. Not ten. One real
   caption is worth more than a description of a style, and zero is fine.
2. **Anything you'd never write?** Two or three phrases. This seeds the deny-list that
   `scripts/slop-check.sh` enforces. It grows on its own from rejections later.
3. **What are you making, and for whom?** One line. Challenge it once if it would fit any creator,
   then take what comes.

Skip any question the creator has already answered in conversation. Write what you have.

✅ **Done when** `profile/voice.md` and `profile/positioning.md` exist with whatever was actually
supplied. Thin is expected and fine — the file is a starting point, not a specification.

## Writes

**Paths:** `references/`, `scripts/`, and `templates/` are siblings of `SKILL.md` in this skill
folder — read them by relative path. `profile/…` means the creator's own files, which live in the
profile directory in local mode and arrive as Project files or in the conversation in context mode.
Check the router's Step 0 before writing to any of them.

- `profile/voice.md` — rhythm, deny-list, any real captions, and the `## Learned from feedback`
  section that later sessions append to
- `profile/positioning.md` — what they make and for whom

Use `templates/voice.example.md` and `templates/positioning.example.md` for structure. Keep the deny-list
heading exactly as written — `scripts/slop-check.sh` parses it.

**Re-running this replaces the seeded sections and leaves `## Learned from feedback` intact.**
That section is the accumulated record; do not discard it on a reset unless asked.

## Boundaries

Seeds or resets the profile. Does not generate ideas, write captions, or research trends.

## Gotchas

- **A section with invented content is worse than an empty one.** An imagined voice trait gets
  enforced by every later workflow. Leave it blank and say what is missing.
- **Do not push for volume.** The old version of this demanded ten captions and held the
  line on it. That friction is why it went unused. Take what is offered.
- **Their stated voice and their actual voice differ.** When the pasted captions contradict the
  self-description, record both and note the gap.
- **Voice drifts, and that is normal.** The learned section is expected to diverge from the seed
  over time. When it does, the learned section is the truer one.
