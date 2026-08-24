# What generic looks like

The primary test, before any checklist: **could someone who was not there have written this?**
If yes, it is generic regardless of how polished it reads. Everything below is a way of applying
that one test.

## Contents

- [Generic vs. specific pairs](#generic-vs-specific-pairs)
- [Abstractions as subjects](#abstractions-as-subjects)
- [Tells of AI prose — what is measured, and what is taste](#tells-of-ai-prose--what-is-measured-and-what-is-taste)
- [Overused hook shapes to refuse](#overused-hook-shapes-to-refuse)
- [Trend misuse](#trend-misuse)
- [Fake engagement bait](#fake-engagement-bait)
- [Polish serves the idea, not the person](#polish-serves-the-idea-not-the-person)

## Generic vs. specific pairs

The left column could sit under any creator's footage. The right column could only sit under
this one, because it names a detail only presence supplies.

| Generic | Specific (witness detail) |
|---|---|
| "The concert was unforgettable." | "The lights went dark and for a few seconds I couldn't hear anything except 15,000 people singing the first line." |
| "The energy in the room was insane." | "Third song in, the lighting guy switched to a single amber wash and the whole pit went orange. I burned my last bar of exposure headroom on it." |
| "Such an amazing night with amazing people." | "The guy next to me had seen this band eleven times and started crying before the first note." |
| "This lens is a game changer for low light." | "At f/1.8 I could still read the drummer's face at the back of the pit; a stop down and he disappears into noise." |
| "You won't believe what happened at this show." | "Security pulled me out of the pit at song four. Everything after that was shot one-handed over a barrier." |

The pattern: the generic line describes a *category* of experience. The specific line describes
*this* occurrence of it, with a detail (a number, a physical action, a named moment) that requires
having been there to know.

**Why this works, stated precisely.** Concrete language is judged *more probably true* than
abstract language making the identical claim, and believability is one of only two levers a
storyteller controls over absorption. It is **not** established that a vivid detail is more
*moving* — the classic vividness and identifiable-victim effects largely failed to replicate. So
argue that witness detail is **believed**, and that its absence marks the writer as someone who was
not there. Do not argue that it moves people. See `references/relatability.md`.

## Abstractions as subjects

**The test, run sentence by sentence:** is the grammatical subject a physical thing, a person, or
an action — or is it a concept? *Silence, memory, the moment, the feeling, time, energy, the
atmosphere, emotion* as the thing doing the verb is the single most reliable marker of writing
produced by someone who was not there. A concept cannot be witnessed, so a sentence built on one
carries no evidence of presence.

**This is a rewrite rule, not a licence to invent.** Every pair below moves the concrete subject
that was *already in the sentence* into the subject position. Nothing is added. If no concrete
subject is present — if the line contains no person, object, or action to promote — then the detail
does not exist yet. Ask the creator for it where asking is still cheap; where it is not, propose a
concrete subject and declare it as proposed (`ff-package.md`, *The swap list*). What is not
available is quietly inventing one and presenting it as observed.

| Abstract subject | Rewritten on what was already there |
|---|---|
| "The silence in the room was heavy." | "Nobody in the room said anything." |
| "The moment carried a weight nobody expected." | "Nobody expected it to land that hard." |
| "Memory has a way of returning to that night." | "I keep going back to that night." |
| "The energy between the band and the crowd was electric." | "The band and the crowd fed off each other." |
| "Time seemed to stop during the last chorus." | "The last chorus went on longer than it should have." |

The right column is not more vivid; it is not meant to be. It is the same claim with a subject that
could have been observed, which is what makes it checkable — and what makes its absence visible.

**Deliberately not implemented in `scripts/slop-check.sh`.** Finding a grammatical subject needs
parsing, and a regex approximation false-positives on this creator's lowercase register for the
same reason burstiness and perplexity were rejected below. It is judged in `ff-critique` Stage 2,
where it is a Showstopper.

## Tells of AI prose — what is measured, and what is taste

Two different problems, and this file keeps them apart. **Detectability** is what a machine scores.
**The feeling** — a reader thinking "a bot wrote this" — is the only one that matters here.

### Measured over-representation

From a study of >15M PubMed abstracts comparing pre- and post-2022 word frequency
(`research/2026-08-21-ai-slop.md` §1). These are elevated in LLM output as a matter of counted fact:

`delve` (47.8×), `underscores` (13.8×), `showcasing` (13.8×), `intricate` (7.4×), `captivating`
(5.09×) — plus `meticulous`, `commendable`, `tapestry`, `realm of`, `boasts`, `garnered`.

`scripts/slop-check.sh` greps these from `references/ai-tells.txt`, which is graded by evidence
tier and dated. Re-review it when models retrain; the list drifts.

### Measured as NOT elevated — do not flag these

`breathtaking` (0.85×, *declining*), `absolutely stunning` (0.94×), `speechless` (0.81×),
`pure magic` (0.96×), `dive deep` (1.1–1.3×), `truly` (0.93×). These read as AI to people who have
read listicles about AI writing; the counts say otherwise. Flagging them costs trust in the gate
and catches nothing.

**The em-dash claim is real** — measured, not folklore — but frequency is the signal, not presence.
One em-dash is punctuation; four in a short caption is a pattern.

### Structural shapes

- **Antithesis pivot** — "it's not X, it's Y", "not only X but also Y". Checked mechanically.
- **Tricolon** — three items closing a sentence. "Bold, cinematic, unforgettable."
- **Sentence-initial discourse markers** — *Moreover, Furthermore, Additionally, Ultimately.* Two
  or more in a short caption is the tell.
- **Anaphora** — three or more sentences opening with the same word.
- **Conclusions that restate the opening** — if the last line could replace the first with no loss,
  nothing was said in between.

**Not implementable, and deliberately not attempted:** burstiness, perplexity, and hedging density.
A lowercase register that omits terminal punctuation breaks sentence segmentation before any
statistic can be computed. A check that cannot run on the creator's real writing is not a check.

### What human readers actually notice

- **Ordinary readers detect AI text at chance** (PNAS 2023, 6 experiments, N≈4,600), and the cues
  they *report* using — first-person pronouns, contractions, personal references — are exactly the
  ones AI text can imitate.
- **Frequent LLM users detect it near-perfectly** (ACL 2025; majority vote misread 1 of 300).
  **Vocabulary is 53.1% of what they cite** — which is why the word list is worth maintaining
  rather than abandoning.
- Two of their cues matter most here: models default to a **hopeful, positive tone**, and they
  **avoid darker material**. For a creator whose strongest work is in a melancholy register, the
  darkness *is* the human signal. A polish pass that softens it does the exact damage this gate
  exists to prevent.

### Do not write for the detector

Commercial detectors misclassify **over 50% of non-native-English essays as AI-written** (*Patterns*
2023, 7 detectors), because they penalise constrained lexical variety. Optimising a caption to
survive a detector pushes a second-language writer toward standardised, native-sounding prose —
away from their own voice, which is the thing worth protecting. **This plugin never treats detector
output as a target.**

## Overused hook shapes to refuse

- **"You won't believe..."** — promises a reveal without naming what kind. Replace with the actual
  tension (`references/hooks.md`).
- **"Here are 5 things..."** — a container, not a premise. If the five things aren't individually
  specific, the format is doing the work the content should.
- **"POV:"** used as a label rather than an actual point of view — nothing in the shot or caption
  actually puts the viewer in a specific position or situation.

These aren't banned outright — a numbered list with five genuinely specific, hard-won items is
fine. The failure is using the shape to imply substance that isn't in the sentences under it.



## Trend misuse

Format + nothing original = a worse post than no trend, because it reads as effort spent copying
rather than effort spent noticing. "Filmed in the trending transition style, no observation
attached" fails; "used the trending whip-pan, timed to the exact moment the drummer's stick
breaks" passes, because the timing *is* the observation. Trends are templates — see
`references/platform-facts.md` for what trend data can even be retrieved before angling anything.

## Fake engagement bait

| Generic | Real |
|---|---|
| "Which would you pick? 😍" under two nearly identical photos | A genuine disagreement someone would actually have an opinion on — "I think the amber version is worse. Convince me I'm wrong." |
| "Let me know your thoughts below!" | Nothing — a question only earns a reply if the piece left something genuinely unresolved for the audience to weigh in on. |
| "Tag someone who needs to see this" | Omit. The send test (`references/arrrsr.md`) already covers whether this travels; asking for it in text reads as a demand, not an invitation. |

## Polish serves the idea, not the person

Bad audio, a shaky frame, or a rough cut is not authenticity by itself — it's just bad quality.
The failure being guarded against here is the opposite one: production polish so smooth it erases
what made the creator's version different from anyone else's. Polish an idea until it's clear;
stop before it sounds like nobody's voice in particular.
