# Evals

Run these by hand after changing the skill. Each is a real failure this plugin has been designed
around — if one regresses, the skill stopped doing its job.

Prompts are given to the `frame-first` skill. Section headings name the **workflow** the router
should reach for; a case that lands in the wrong workflow is itself a failure, since one router
description now does the routing that eight skill descriptions used to do.

Run them on **Haiku as well as Sonnet/Opus**. Skills degrade silently on weaker models: an
instruction strong enough to hold on Opus can be ignored entirely on Haiku, and the plugin runs in
five places whose model you do not control.

**At least three cases per workflow** — Anthropic's skill-authoring checklist. Current counts are
in the heading of each section; keep them at three or more when adding a workflow.

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

## ff-package — 5 cases

**Prompt:** "Write an Instagram caption for my concert video."
✅ **Grills before drafting** — the input names a subject and a platform but no witness detail and
nothing about what the footage shows. One question, not a list. Once the input is complete, marks
any remaining sensory specifics as explicit blanks for the creator to fill.
❌ Drafts immediately. ❌ Invents a detail about a show it knows nothing about.

**Prompt:** "Just fill in the blanks yourself, you know what I mean."
✅ Declines and explains why the blank is the deliverable.

**Prompt:** "Write a caption that people will relate to."
✅ Aims the line at the viewer rather than describing the footage — at least one line the reader
must check against their own memory. Names one emotion. No visible tactic ("tag someone",
"wait for it"). Sensory blanks still left blank.
❌ Produces a line that only describes what happened. ❌ Reaches for engagement bait, which makes
readers trust the author *less* and share less.

**Prompt:** "Give me maximum hashtags to maximize reach."
✅ States Instagram's five-tag cap and its own finding that fewer targeted tags beat many generic
ones, then spends the slots on specific, searchable tags. Refuses `#fyp`/`#viral` style filler.
❌ Produces 20–30 hashtags. ❌ Claims more hashtags increase reach.

**Prompt:** "Give me the YouTube version — I want to use the real concert audio."
✅ Names the Shorts carve-out from `references/platform-facts.md`: a vertical clip of 1–3 minutes
is a Short, and a Short over one minute with an active Content ID claim is **blocked**. Routes
real audio to a horizontal or 3-minute-plus upload, or library audio for a Short.
❌ Says real concert audio is fine on YouTube because a claim leaves the video up. That was the
pre-2026-08-20 error; this case exists to keep it from coming back.

---

## ff-strategy — 5 cases

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

**Prompt:** An Instagram screenshot showing high average watch time and 2 sends.
✅ Names the controllable and **labels its basis**: reshare ranking first is documented; that the
caption is the fix is this plugin's heuristic, said as such. Hands off to `ff-package`.
❌ Presents the heuristic as a platform mechanism. ❌ Asks for a "watch-through %", which Instagram
does not report. ❌ Rewrites the caption itself, which is `ff-package`'s job.

**Prompt:** "My Reels views are way below my TikTok views on the same clip — am I shadowbanned?"
✅ Says that is the population baseline, not a signal — Reels average ~30% fewer views than TikTok
(Metricool, 24.3M posts, labelled third-party). Routes to Account Status and the follower/non-
follower split as the real checks.
❌ Diagnoses demotion from the IG-vs-TikTok gap. **This was the plugin's own error on 2026-08-20.**

---

## ff-init — 3 cases

**Prompt:** Answer the identity question with *"I love capturing moments."*
✅ Challenges it once as generic, then takes what comes. Does not interrogate.
❌ Writes it to `positioning.md` unchallenged. ❌ Refuses to move on until it improves.

**Prompt:** "I don't have captions to paste — just make up a voice profile for me."
✅ Refuses to invent a voice, and says the profile will fill itself in from feedback as they work.
❌ Generates captions or a deny-list from nothing and writes them to disk.

**Prompt:** "I don't want to do this setup, I just want a caption."
✅ Drops it immediately, says the profile builds itself from feedback, and routes to the work.
❌ Insists on the interview, or blocks. **The old skill demanded ten captions and "held the line";
that friction is what this case exists to prevent from returning.**

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
✅ **Grills first** — subject and position are given, but not the light, the time available, or
whether the moment repeats. Asks for those before planning. Then every entry names a premise and a
fallback; at least one survives bad lighting and a blocked view.
❌ Plans against assumed constraints. ❌ A list of beautiful frames with no premise attached.

**Prompt:** "Just give me a list of cool shots to get."
✅ Attaches a premise to every entry anyway, and says why a pretty-frame list produces footage with
no post in it.
❌ Returns an unattached shot list because that is what was asked for.

**Prompt:** "Small dark venue, phone only, I can't move from where I'm standing."
✅ Plans within the constraint rather than around it, and checks battery and storage before
finalizing.
❌ Suggests shots requiring movement or light that the stated constraints rule out.

---

## frame-first — 5 cases

**Prompt:** "Help me with my content" with no profile reachable at all.
✅ Proceeds with the work, noting once that the voice read is thin. Does not block or push `ff-init`.
❌ Refuses until the profile exists. ❌ Fabricates profile content to fill the gap.

**Prompt:** The creator rewrites a drafted line in their own words.
✅ In local mode: appends to `profile/voice.md` → `## Learned from feedback`, one dated line naming
the pattern, and says briefly that it was recorded. In context mode: ends the reply with a
`Profile update → voice.md` block containing exactly those lines, and writes nothing.
❌ Accepts the rewrite silently. ❌ Records a summary too vague to act on later. ❌ Attempts a write
in context mode.

**Prompt:** "I have footage and a draft caption — do everything."
✅ Sequences the skills (`ff-package`, then `ff-critique`) and says so.
❌ Merges them into one pass. Two skills at once produces mush.

**Prompt:** "I filmed my grandmother making pancakes this morning, help me post it."
✅ Works the subject as given — asks what happened, applies witness detail and the send test, and
never steers back toward concerts or music. No copyrighted-music constraint is raised, because
there is no recorded music in the clip.
❌ Treats concerts as the default subject. ❌ Applies the music/audio constraints anyway.
**The plugin was de-scoped from concerts on 2026-08-20; this case guards it.**

**Prompt:** "Can you edit this video for me?"
✅ Says no branch fits and asks, rather than routing to the nearest skill.
❌ Picks the closest match and proceeds.

---

---

## Grill gate — 6 cases

The gate runs in `ff-ideas`, `ff-package`, and `ff-shotlist` only. **Case 2 is the one that
matters most**: an implementation that always grills passes every other case here and is still
wrong, because a toll on every request gets routed around rather than paid.

**Prompt:** "Give me a caption for my video."
✅ Asks one question — the highest-value gap, which here is what the video actually shows. Waits.
❌ Drafts anything. ❌ Asks three questions in one message. ❌ Asks as a numbered list.

**Prompt:** A complete input — subject, a real witness detail, what the footage shows, and the
platform, all supplied unprompted in one message.
✅ **Asks nothing at all** and goes straight to the work.
❌ Grills anyway. ❌ Asks a confirming question it already has the answer to. ❌ Re-asks something
stated earlier in the conversation or present in `profile/positioning.md`.

**Prompt:** Mid-grill — "just draft it, I'm in a hurry."
✅ Stops immediately, drafts, and names the gaps it would have closed — each left as an explicit
blank in the output.
❌ Pushes back or asks once more. ❌ Raises it again later in the session. ❌ Fills the blanks to
make the draft read finished. **This is where the escape hatch and the sensory-blank rule are the
same mechanism; failing either fails both.**

**Prompt:** The frontier empties after several answers.
✅ Restates premise, witness detail, angle, and platform in a few lines and **waits for a yes**.
❌ Generates without restating. ❌ Restates and generates in the same message.

**Prompt:** After a restatement — "no, the angle is wrong, it's about the walk home not the show."
✅ Reopens the frontier from there and continues; does not restart the interview from question one.
❌ Discards the answers already given.

**Prompt:** "Critique this caption: [a real draft]" — a workflow that does **not** grill.
✅ Judges it. Returns SHIP / FIX / KILL.
❌ Interrogates the creator about their own finished draft before ruling on it. `ff-critique`,
`ff-strategy`, `ff-trends`, and `ff-init` never grill.

---

## No-bash pass — the Desktop and mobile guarantee

**Run every section above a second time with no ability to execute commands.** This is the pass
that proves the apps work; without it the portability is a design claim, not a tested one.

The rule: nothing in the output may get worse except a citation. Specifically —

**Prompt:** Critique *"The concert was unforgettable. What a night ✨"*, with no shell available.
✅ Still returns FIX or KILL with a named failure. Stage 1 is skipped **silently**.
❌ Mentions `slop-check.sh`. ❌ Asks the creator to run it. ❌ Softens the verdict because the
deterministic stage did not run. ❌ Reports that it cannot fully check the draft.

**Prompt:** "Give me maximum hashtags", with `references/ranking-signals.md` unreadable.
✅ Still states Instagram's five-tag cap and that fewer targeted tags beat many generic ones, and
still refuses `#fyp`. Says the claim is uncited.
❌ Drops the cap. ❌ Produces 20 tags because the reference was missing. ❌ Invents a different cap.

**Prompt:** "How much will I make from TikTok Creator Rewards?", with `references/platform-facts.md`
unreadable.
✅ Still reports it as unavailable in the Philippines, still names the PH alternatives, still
labels the figures unverified — from the inlined conclusions in `ff-strategy.md`. Says uncited.
❌ Says it cannot answer without the reference file. ❌ Quotes an RPM.

**Prompt:** Anything that would normally write to the profile, in context mode.
✅ Emits a `Profile update → voice.md` block. ❌ Attempts a write. ❌ Reports a write it did not do.

**Prompt:** A thin caption request, with no question UI available (Desktop or mobile).
✅ Grills in prose, still **one question per message**. The delivery changes; the rule does not.
❌ Falls back to a numbered list because there is no popup. ❌ Skips the grill because it cannot
render a UI.

**The failure this pass exists to catch** is a workflow that treats an unavailable file as a reason
to stop. Never tell the creator a task is impossible because a file or a script could not be
opened — say what could not be opened, and give them the answer anyway.

## Deterministic stage

```bash
./skills/frame-first/scripts/slop-check.sh evals/fixtures/slop.md   # expect exit 2, many soft hits
./skills/frame-first/scripts/slop-check.sh evals/fixtures/good.md   # expect exit 0
```

**The false-positive test matters more than the true-positive one.** Paste the creator's own real
captions from the profile's `voice.md` into a file and run it: **expect exit 0 and zero soft hits.** A gate
that flags authentic writing gets ignored, and an ignored gate is worth less than no gate. Two
regressions of exactly this kind were found on 2026-08-21 — `hits different` flagged the creator's
best-performing caption, and their em-dash rule silently never fired at all.

Also confirm a deny-list entry written as a label still fires:

```bash
printf 'the lights went down — and then it started\n' > /tmp/t.md
./skills/frame-first/scripts/slop-check.sh /tmp/t.md   # expect exit 1: "em dash (—)" matched as —
```

## Schema validation

```bash
claude plugin validate ./skills --strict    # the only call that checks the skill
claude plugin validate ./commands --strict
claude plugin validate .                    # marketplace.json ONLY — not the skill
./sync.sh --check                           # links healthy, nothing stale
```

Then confirm the skill is genuinely self-contained — this is the whole portability claim, and it
is one command:

```bash
grep -rn 'CLAUDE_PLUGIN_ROOT\|ff-paths\|readlink\|\.\./\|~/\.claude' skills/frame-first/ \
  | grep -v 'Any other resolution is wrong'   # the SKILL.md deny-mention, not a reference
```

Anything it returns is a path reaching outside the skill folder, and will break on Desktop and
mobile. Expected: nothing.
