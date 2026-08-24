# ff-critique

*A `frame-first` workflow — Blocking quality gate for draft captions, hooks, and scripts. Runs before anything is posted.*

The gate. Returns one of three verdicts and withholds approval until the work earns it.

## Verdicts

**SHIP** · **FIX** · **KILL**. Three states, never a score.

Numeric scales collapse toward the middle and drift with prompt order; a caption rated 7/10
ships anyway. A ternary verdict forces a commitment that can be defended.

**KILL** is available and is meant to be used: some premises do not earn a post. Say what would
have to change.

## Stage 1 — deterministic, and optional

Where you can run commands, write the draft to a file and run:

```bash
scripts/slop-check.sh <draft-file>
```

Exit 0 = surface clean · 1 = hard hit on the creator's own deny-list · 2 = two or more soft hits.
Report what it found.

**Where you cannot run commands, skip this stage silently and go to Stage 2.** Do not mention the
script, do not ask the creator to run it, and do not treat its absence as a reason to soften the
verdict. Stage 1 only ever proves that no listed phrase appeared; every verdict this gate returns
is earned in Stage 2. A skipped Stage 1 changes nothing about the standard.

This stage catches surface patterns in milliseconds and **misses semantic slop entirely** — a
caption with no flagged phrase can still be pure hedging. Stage 2 always runs.

## Stage 2 — judgment

Compare the draft **against the creator's own work and stated preferences**, not against an
abstract standard. Judging "is this good writing" produces a generic verdict; judging "would this
sit beside their own writing without standing out" produces a useful one.

Sources, in order of authority — later ones override earlier ones:

1. What the creator has said **in this conversation**. Most current, wins ties.
2. `profile/voice.md` → `## Learned from feedback` — accumulated real judgments on real drafts.
3. `profile/voice.md` → the seeded captions and deny-list, if any.
4. `profile/voice.md` → `## What I've rejected` — approaches already ruled out. A draft that
   reaches for one of them is wrong on the creator's own record, not on taste.

With none of the three, fall back to the witness-detail test alone and say the voice read is thin.

Checks, in severity order:

**Showstoppers** — any one of these alone is a FIX:
1. **Witness detail, present and honestly sourced** — could someone who was not there have written
   this? The central test. It is satisfied by a concrete, occasion-specific detail; it does not
   matter whether the creator supplied it or the draft proposed it. What fails is **an invented
   specific that is not declared in the swap list** — that is the thing that puts fiction under the
   creator's name, and it is a FIX on its own.
2. **Deny-list hit** — the creator's own words, so the judgment is already made.
3. **Curiosity opened and abandoned** — a gap the draft never closes.
4. **Abstraction as sentence subject** — is the subject of each sentence a physical thing, a
   person, or an action, or is it a concept (silence, memory, the moment, the feeling)? A concept
   cannot be witnessed. Hand it back with the concrete subject that is already in the line
   (`references/slop-patterns.md`); if there is none, ask for it rather than inventing one.
5. **Redundant pairing** — on-screen text and caption restate each other. Fires only when the
   draft contains both. One idea typed twice wastes the only two written surfaces the post has.
6. **Lyrics quoted or paraphrased** — in caption, on-screen text, or title. The composition is a
   separate copyright from the recording and no length is safe (`references/platform-facts.md`).
   A paraphrase that tracks a lyric's wording or structure is a hit; naming song and artist is not.
7. **Unverified or contested factual claim stated as fact** — a date, a first, an origin, an
   attribution, asserted flat. Either it is sourced, or the dispute is visible, or it goes.
   **Scope: publicly checkable claims only.** A declared sensory detail is not one — the creator
   can see whether the room did that, and the swap list is where they say so.
8. **Self-reference** — does any line require the reader to retrieve their own memory to parse it,
   or does it only describe? A caption the viewer watches is weaker than one they recognize. The
   test and the evidence are in `references/relatability.md`; the failure to avoid is the line so
   general that everyone qualifies — "we've all been there" is the absence of a referent, not a
   referent. **The creator is behind the camera, not the subject:** a post that is only about them
   gives the viewer nothing to recognize.

**Gaps** — two or more together warrant a FIX:
9. **The send test** — who forwards this, and what does forwarding it say about them?
   Self-relevance and social relevance are what predict a share (`references/relatability.md`).
10. **Visible tactic** — anything a reader could name as a move ("tag someone", "wait for it").
   Inferred manipulation makes readers judge the *author* less trustworthy and share less, so this
   costs more than it returns.
11. **Satisfaction** — would someone who watched to the end feel it was worth their time?
12. **Voice drift** — rhythm, sentence length, and punctuation **against the samples for the named
   register only**, never the whole pool. A draft that reads as a blend of two registers is voice
   drift even if each half matches something in the file.
13. **Hook repetition** — check `profile/hooks-used.md` for recently used architectures.
14. **Learn or relate** — the viewer gets something, rather than only watching the creator.
15. **Closing** — does the last line land on a shape (`references/closings.md`), or does it
   trail off, summarize what was just watched, or restate the opening?

**Nice-to-haves** — mention, do not block on: searchable phrasing, hashtag choice, emoji.

## Threshold

Hard hit → **FIX**, always. Two or more Gaps → **FIX**. A single Gap → mention it and **SHIP**.

**Gaps count independently.** Each numbered Gap is its own item — the send test, visible tactic,
and satisfaction are three, not one. Two distinct Gaps of any kind → **FIX**. Any one
Showstopper is a FIX on its own, without a second finding.

The looseness is deliberate. Once a gate blocks work that turns out to be fine, it stops being
read, and a gate nobody reads is worse than no gate.

✅ **Done when** every draft element carries one of SHIP/FIX/KILL, each verdict names the check
that produced it, and anything lacking witness detail is handed back rather than filled in.

## Optional — the persona pass

For posts the creator has said matter, read the draft as: **Scroller** (three seconds, thumb
moving), **Skeptic** (why should I believe you), **Expert** (does the craft claim hold up),
**Editor** (what would you cut). Reserve this — running it on every caption trains the creator
to skip it.

## When a line lacks witness detail

The line is generic — it would sit under any version of this subject. Two ways out, and the
draft picks one:

- **Ask, where asking is still cheap** — before the caption is written, and only once:
  > "This hook works for any version of this subject. What happened at THIS one that didn't happen
  > at the others?"
- **Draft a candidate and declare it**, where the creator has already said to just draft it, or has
  answered as much as they are going to. The caption ships finished; the swap list carries the
  guess.

What is never acceptable is the third option: inventing the detail and saying nothing. That is the
failure this plugin exists to prevent — not the invention itself, but the silence about it.

## Reads / Writes

**Paths:** `references/`, `scripts/`, and `templates/` are siblings of `SKILL.md` in this skill
folder — read them by relative path. `profile/…` means the creator's own files, which live in the
profile directory in local mode and arrive as Project files or in the conversation in context mode.
Check the router's Step 0 before writing to any of them.

- Reads: `profile/voice.md` (including `## What I've rejected`), `profile/positioning.md`,
  `profile/hooks-used.md`, `references/slop-patterns.md`, `references/closings.md`,
  `references/arrrsr.md`, `references/relatability.md`
- Writes: appends overrides to `profile/gate-log.md` — drafts marked FIX that the creator published
  unchanged. This is the only evidence of whether the gate is calibrated.

**Cold start:** with no `profile/voice.md`, run stage 1 and the witness-detail test only. Say once
that voice checks are thin, and carry on — do not push the creator into `ff-init`. Anything they
have said in this conversation about how they write counts as voice data for this session, and
belongs in `## Learned from feedback` afterwards.

## Boundaries

Judges drafts and premises. Writes nothing on the creator's behalf — when a line lacks witness
detail it names the gap and hands it back. Does not research trends, package posts, or log
performance.

## Gotchas

- **The gate rubber-stamps under fatigue.** Approving becomes the default, especially late.
  The verdict is worth the same at 1am as at noon.
- **An over-tuned deny-list eats authentic voice.** Earnest, plain, or unfashionable writing is
  not slop. When `profile/gate-log.md` shows repeated overrides on the same rule, the rule is wrong.
- **Averaging registers is the most likely way this gate damages the work it protects.** A blend
  passes every individual check and matches nothing the creator would write.
- **Stage 1 passing means nothing on its own.** It only proves no listed phrase appeared.
- **Agreeing with the creator is not the job.** They asked for a gate precisely because they will
  want to skip it.
- **Critiquing an idea is cheaper than critiquing a finished post.** Encourage running this at
  the premise stage, before the footage exists.
