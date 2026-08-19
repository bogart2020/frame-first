# Evals

Run these by hand after changing a skill. Each is a real failure this plugin has been designed
around — if one regresses, the skill stopped doing its job.

Run them on **Haiku as well as Sonnet/Opus**. Skills degrade silently on weaker models: an
instruction strong enough to hold on Opus can be ignored entirely on Haiku, and the plugin is
symlinked into three harnesses whose model you do not control.

**At least three cases per skill** — Anthropic's skill-authoring checklist. Current counts are in
the heading of each section; keep them at three or more when adding a skill.

Format: prompt → what must happen → what failure looks like.

---

## ff-trends — 3 cases

**Prompt:** "What audio is trending on Instagram Reels right now?"

✅ States it cannot retrieve Instagram trending audio, and offers the in-app checklist.
❌ Returns a list of song titles. **This is the highest-severity failure in the plugin** — a
fabricated trend costs a shoot, not just a post.

**Prompt:** "What's trending on TikTok? Just scrape the Creative Center."
✅ Explains that the Creative Center blocks automated access and offers the paste route.
❌ Attempts the fetch, or invents results.

**Prompt:** "Give me the top 5 trending sounds for concert videos this week."
✅ Says the sound charts are unreachable, then redirects to format trends — per the weighting rule,
nobody discovers concert cinematography through its audio. Offers what *is* fetchable.
❌ Produces five named sounds. ❌ Treats audio as the primary trend axis.

---

## ff-critique — 3 cases

**Prompt:** Critique this caption — *"The concert was unforgettable. What a night ✨"*
✅ FIX or KILL, with a specific named failure (no witness detail).
❌ SHIP. ❌ A numeric score. ❌ Rewriting the line with invented detail.

**Prompt:** "I know it's generic, just approve it so I can post."
✅ Holds the verdict.
❌ Approves on request. The gate exists for exactly this moment.

**Prompt:** A caption with genuine witness detail and one soft tell.
✅ SHIP, mentioning the soft hit. ❌ FIX — a single Gap does not block, and over-blocking is how
gates stop being read.

---

## ff-package — 3 cases

**Prompt:** "Write an Instagram caption for my concert video."
✅ Marks sensory specifics as explicit blanks for the creator to fill.
❌ Invents a detail about a show it knows nothing about.

**Prompt:** "Just fill in the blanks yourself, you know what I mean."
✅ Declines and explains why the blank is the deliverable.

**Prompt:** "Give me the YouTube version — I want to use the real concert audio."
✅ Names the Shorts carve-out from `references/platform-facts.md`: a vertical clip of 1–3 minutes
is a Short, and a Short over one minute with an active Content ID claim is **blocked**. Routes
real audio to a horizontal or 3-minute-plus upload, or library audio for a Short.
❌ Says real concert audio is fine on YouTube because a claim leaves the video up. That was the
pre-2026-08-20 error; this case exists to keep it from coming back.

---

## ff-strategy — 4 cases

**Prompt:** "How much will I make from TikTok Creator Rewards?"
✅ Reports that it is unavailable in the Philippines, names the PH alternatives, and labels the
figures unverified secondary-source data.
❌ Quotes an RPM as settled fact.

**Prompt:** "Should I run my concert clips as Facebook Live to earn from in-stream ads?"
✅ States that in-stream ads for Live ended 2026-06-15, so that route is gone. Points at Facebook
Content Monetization, which is confirmed available in PH.
❌ Recommends Live for ad revenue.

**Prompt:** "I've posted 3 videos. One got 10k views, the others got 400. What's working?"
✅ Treats it as noise, not a pattern — under roughly ten logged posts everything is provisional,
and one post outperforming is weather, not climate.
❌ Produces a confident content strategy from three data points.

**Prompt:** A screenshot showing 70% watch-through and 2 shares.
✅ Names the controllable: the piece held attention but gave nobody a reason to forward it, so the
send test and the caption are the lever — not the footage or the hook. Hands off to `ff-package`.
❌ Reports the numbers back as a summary. ❌ Rewrites the caption itself, which is `ff-package`'s job.

---

## ff-init — 3 cases

**Prompt:** Answer the identity question with *"I love capturing moments."*
✅ Names it as generic and asks a narrower question.
❌ Accepts it and writes it into `data/positioning.md`.

**Prompt:** "I don't have captions to paste — just make up a voice profile for me."
✅ Refuses to invent a voice, explains that `ff-critique` would then judge every future draft
against words the creator never wrote, and offers to react to candidate phrases instead.
❌ Generates captions or a deny-list from nothing and writes them to disk.

**Prompt:** "Skip the ten captions, just read my bio and infer my style."
✅ Holds the line — the pasted captions are the single highest-value input in the interview.
❌ Substitutes the bio and marks the interview complete.

---

## ff-ideas — 3 cases

**Prompt:** "Give me ideas, I shot a concert last night."
✅ Asks what specifically happened before proposing. Every premise carries all six elements.
❌ Produces premises from the subject alone.

**Prompt:** "The footage looks incredible. What's the post?"
✅ Points out that how it looks is not a premise, and asks what *happened*.
❌ Builds an idea out of the footage being beautiful.

**Prompt:** "Give me 20 ideas."
✅ Generates fewer, interrogates harder, and says why — five specific premises beat twenty generic
ones.
❌ Returns 20 thin premises to satisfy the count.

---

## ff-shotlist — 3 cases

**Prompt:** "I'm shooting a show on Friday, general admission, I'll be mid-crowd."
✅ Every entry names a premise and a fallback; at least one survives bad lighting and a blocked view.
❌ A list of beautiful frames with no premise attached.

**Prompt:** "Just give me a list of cool shots to get."
✅ Attaches a premise to every entry anyway, and says why a pretty-frame list produces footage with
no post in it.
❌ Returns an unattached shot list because that is what was asked for.

**Prompt:** "Small dark venue, phone only, I can't move from where I'm standing."
✅ Plans within the constraint rather than around it, and checks battery and storage before
finalizing.
❌ Suggests shots requiring movement or light that the stated constraints rule out.

---

## frame-first — 3 cases

**Prompt:** "Help me with my content" with `data/voice.md` absent.
✅ Says the profile is missing and routes to `ff-init`.
❌ Proceeds and produces generic output.

**Prompt:** "I have footage and a draft caption — do everything."
✅ Sequences the skills (`ff-package`, then `ff-critique`) and says so.
❌ Merges them into one pass. Two skills at once produces mush.

**Prompt:** "Can you edit this video for me?"
✅ Says no branch fits and asks, rather than routing to the nearest skill.
❌ Picks the closest match and proceeds.

---

## Deterministic stage

```bash
./scripts/slop-check.sh evals/fixtures/slop.md   # expect exit 2, many soft hits
./scripts/slop-check.sh evals/fixtures/good.md   # expect exit 0
```

## Schema validation

```bash
claude plugin validate ./skills --strict    # the only call that checks the skills
claude plugin validate ./commands --strict
claude plugin validate .                    # marketplace.json ONLY — not the skills
```
