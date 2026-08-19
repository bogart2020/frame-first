---
name: ff-critique
description: Blocking quality gate for draft captions, hooks, and scripts. Use before posting, when a caption reads generic or AI-written, or when deciding whether an idea is worth making at all.
---

# ff-critique

The gate. Returns one of three verdicts and withholds approval until the work earns it.

## Verdicts

**SHIP** · **FIX** · **KILL**. Three states, never a score.

Numeric scales collapse toward the middle and drift with prompt order; a caption rated 7/10
ships anyway. A ternary verdict forces a commitment that can be defended.

**KILL** is available and is meant to be used: some premises do not earn a post. Say what would
have to change.

## Stage 1 — deterministic

```bash
eval "$("$(dirname "$(dirname "$(readlink -f ~/.claude/skills/ff-init)")")/scripts/ff-paths.sh")"
"$FF_SCRIPTS/slop-check.sh" <draft-file>
```

The resolver line makes this work from any open project — see **Paths** under Reads / Writes.

Exit 0 = surface clean · 1 = hard hit on the creator's own deny-list · 2 = two or more soft hits.

Report what it found. This stage catches surface patterns in milliseconds and **misses semantic
slop entirely** — a caption with no flagged phrase can still be pure hedging. Stage 2 always runs.

## Stage 2 — judgment

Compare the draft **against the creator's real captions** in `data/voice.md`, not against an
abstract standard. Judging "is this good writing" produces a generic verdict; judging "would this
sit beside the creator's own writing without standing out" produces a useful one.

Checks, in severity order:

**Showstoppers** — any one of these alone is a FIX:
1. **Witness detail** — could someone who was not there have written this? The central test.
2. **Deny-list hit** — the creator's own words, so the judgment is already made.
3. **Curiosity opened and abandoned** — a gap the draft never closes.

**Gaps** — two or more together warrant a FIX:
4. **The send test** — who forwards this, and what does forwarding it say about them?
5. **Satisfaction** — would someone who watched to the end feel it was worth their time?
6. **Voice drift** — rhythm, sentence length, and punctuation against the real samples.
7. **Hook repetition** — check `data/hooks-used.md` for recently used architectures.
8. **Learn or relate** — the viewer gets something, rather than only watching the creator.

**Nice-to-haves** — mention, do not block on: searchable phrasing, hashtag choice, emoji.

## Threshold

Hard hit → **FIX**, always. Two or more Gaps → **FIX**. A single Gap → mention it and **SHIP**.

The looseness is deliberate. Once a gate blocks work that turns out to be fine, it stops being
read, and a gate nobody reads is worse than no gate.

## Optional — the persona pass

For posts the creator has said matter, read the draft as: **Scroller** (three seconds, thumb
moving), **Skeptic** (why should I believe you), **Expert** (does the craft claim hold up),
**Editor** (what would you cut). Reserve this — running it on every caption trains the creator
to skip it.

## When a line lacks witness detail

Name what is missing and hand it back:

> "This hook works for any concert. What happened at THIS one that didn't happen at the others?"

Supplying the detail yourself is the failure this plugin exists to prevent — the agent was not
there, so anything it invents is fiction wearing the creator's name.

## Reads / Writes

**Paths:** everything below is relative to the plugin root, not the open project. Resolve first:
`eval "$("$(dirname "$(dirname "$(readlink -f ~/.claude/skills/ff-init)")")/scripts/ff-paths.sh")"`
then read and write via `$FF_DATA`, `$FF_REFS`, `$FF_SCRIPTS`.

- Reads: `data/voice.md`, `data/positioning.md`, `data/hooks-used.md`,
  `references/slop-patterns.md`, `references/arrrsr.md`
- Writes: appends overrides to `data/gate-log.md` — drafts marked FIX that the creator published
  unchanged. This is the only evidence of whether the gate is calibrated.

**Cold start:** with no `data/voice.md`, run stage 1 and the witness-detail test only, and say
plainly that voice checks are unavailable until `ff-init` runs.

## Boundaries

Judges drafts and premises. Writes nothing on the creator's behalf — when a line lacks witness
detail it names the gap and hands it back. Does not research trends, package posts, or log
performance.

## Gotchas

- **The gate rubber-stamps under fatigue.** Approving becomes the default, especially late.
  The verdict is worth the same at 1am as at noon.
- **An over-tuned deny-list eats authentic voice.** Earnest, plain, or unfashionable writing is
  not slop. When `data/gate-log.md` shows repeated overrides on the same rule, the rule is wrong.
- **Stage 1 passing means nothing on its own.** It only proves no listed phrase appeared.
- **Agreeing with the creator is not the job.** They asked for a gate precisely because they will
  want to skip it.
- **Critiquing an idea is cheaper than critiquing a finished post.** Encourage running this at
  the premise stage, before the footage exists.
