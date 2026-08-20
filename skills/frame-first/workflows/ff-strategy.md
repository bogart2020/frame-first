# ff-strategy

*A `frame-first` workflow — Reads Insights screenshots to diagnose what to change, logs performance, plans platform and monetization decisions.*

The loop that makes every other workflow improve: record what happened, read it back, decide next.

## Performance logging

Input by **screenshot** of platform Insights; manual paste as fallback.

Track **sends/shares** and **sustained attention** as primary — distribution through a relationship
and held attention are what recommendation systems respond to. Then saves (Instagram only),
follows-from-post, and views. Likes are not tracked; they measure approval, not travel.

**Record the metric the platform actually names**, not a normalized one. Instagram gives Views,
Watch time, Viewers, Average watch time, Follows — and no watch-through percentage. TikTok gives
retention rate and watch time. Logging "watch-through" for an Instagram post means inventing a
number the creator cannot see.

Write to `profile/performance.md` with the post, its hook architecture, and one line on what it
suggests. `ff-ideas` and `ff-critique` read this back.

✅ **Done when** the entry names the hook architecture used and one specific inference, rather
than a summary of the numbers.

## Diagnose: metric → controllable

Given a screenshot, do not stop at "views were low". Map the pattern to the specific thing the
creator can change — and say which basis you are on. **Documented** rows come from a platform page
(`references/ranking-signals.md` owns the citations). **Heuristic** rows are this plugin's working
theory; they are worth acting on and are not facts. Never present a heuristic as a platform
mechanism.

| Pattern in the numbers | What it implicates | The controllable | Basis |
|---|---|---|---|
| **Retention drops early** (TikTok retention rate; YouTube audience retention). Instagram reports no retention — approximate with average watch time ÷ length | The moment of the drop, whatever is at it | Rewatch at the drop point and run TikTok's own checklist: missing hook, messy edit, possibly offensive, not engaging enough | **Documented** — TikTok Creator Academy; hook in the first three seconds |
| Retention fine but the clip **trails off** or the cut is padded | Percentage metrics get harder as the clip lengthens | Cut to the strongest section. Instagram will not recommend a reel over 3 minutes at all | **Mixed** — the 3-minute cap and "relative watch time matters more for short videos" are documented; "cut rather than pad" is this plugin's call, and TikTok's own advice leans the other way |
| **Held attention, few sends** | It held attention but said nothing about the viewer. Reshare is Instagram's top-ranked prediction | The send test: who forwards this, and what does sending it say about them? | **Documented** that reshare ranks first. **Heuristic** that the caption is the fix — no platform says so |
| **Views far below the creator's own baseline** | Could be nothing. TikTok: "if a video isn't getting many views, it also doesn't necessarily mean it broke a rule" | Check the flag before changing anything: TikTok analytics reports posts made **ineligible for recommendation**; Instagram **Account Status** reports whether content can be recommended | **Documented** — TikTok FYF standards; Instagram recommendation-eligibility help |
| **Instagram distribution suppressed on a clip that is fine elsewhere** | Demotion, not performance | Instagram makes less visible: watermarked, low-resolution, **muted**, bordered, majority-text, and already-posted reels. Export clean per platform — a clip muted to dodge a music claim is demoted for its own reason | **Documented** as a mechanism. **Not** diagnosable by comparing IG views to TikTok views — Reels average ~30% fewer views than TikTok as a baseline (Metricool, 24.3M posts). Use Account Status or the follower/non-follower split |
| **Views high, follows near zero** | Nothing gave a reason to come back | Positioning, not packaging | **Heuristic.** The metric is documented on both platforms; nothing documents this cause. TikTok warns follower swings after a spike are normal — needs several posts, not one |
| **Saves high, sends low** | Useful but not identity-bearing | Fine for craft work. Do not "fix" it into engagement bait — Meta names clickbait and engagement bait as demoted | **Documented** that saves rank on Instagram Explore and that bait is demoted. **Note:** TikTok does not name or report saves. "Fine for craft content" is this plugin's judgment |

**Metric names matter.** Instagram reports **no watch-through %, no completion rate, and no
retention curve** — it reports Views, Watch time, Viewers, Average watch time, and Follows. "Reach"
no longer exists on either platform: Instagram renamed it Views/Viewers, and TikTok has no per-post
reach. Ask for what the screen actually shows.

**Signal order is platform-specific.** Instagram ranks reshare above watch-through; TikTok says
watch time is weighted more heavily than engagement. Do not apply one global ordering to both.

**Then hand off.** Name the controllable and route to `ff-package` for the rewrite, or `ff-ideas`
if the premise itself is the problem. Diagnosing is this workflow's job; writing the replacement is not.

**What a screenshot cannot tell you:** where views came from geographically, whether a specific
caption word mattered, or why one post beat another when both sit inside normal variance. TikTok
says it plainly — "Fluctuations are normal!" Say so rather than constructing a story.

## Instagram reach is near zero — run this first

Before diagnosing anything from metrics, rule out the binary causes. All free, ~2 minutes, and they
override every other reading. Sources in `references/ranking-signals.md`.

1. **Is the account eligible to be recommended?** Professional accounts only:
   Settings → Account Status → **Recommendations Guidelines**. It shows a sample of the offending
   content and an appeal button. Instagram: "If your account is not eligible to be recommended,
   **none of your content will be recommended**… your content can still show up for your followers."
   With no ad spend this is the whole reach mechanism — check it before touching a caption.
   A **personal** account cannot see this panel at all; switching to professional is step zero.
2. **Is the reel muted, bordered, or majority text?** All three are named on the demotion list in
   one sentence. Visible in five seconds: is there an audio pill, are there black bars, does text
   cover more than roughly a third of the frame?
3. **Watermark?** A TikTok-export workflow carries one. Named on the same list.
4. **Resolution.** Minimum 720px / 30 FPS, and the in-app toggle Menu → Your app and media →
   **Media quality → Upload at highest quality** is off by default.
5. **Already posted?** Duplicate reels are made less visible.

**Trial reels** are the cheapest non-follower reach test available: 200 followers for a
professional account, shown to non-followers only, ranked independently, insights in 24 hours.

## Monetization

`references/platform-facts.md` holds the current picture. Report those figures as coming from
secondary sources, flag the ones marked unverified, and point the creator at their own dashboard
before any of it drives a decision.

**If that file is unavailable, these are the conclusions it drives.** State them as conclusions,
say they are uncited, and point at `references/platform-facts.md` for the source and the date —
that file owns both, and repeating them here is how the two drift apart:

- **Do not tell the creator TikTok Creator Rewards is open to them.** It is not available in the
  Philippines. Their TikTok paths are LIVE gifts and TikTok Shop affiliate.
- **Instagram Gifts and Subscriptions are not available in PH** either.
- **Facebook Content Monetization is available in PH**, but **in-stream ads for Live have ended** —
  any plan routing LIVE to Facebook for ad revenue is dead.
- **Never give the creator a per-view rate to plan against.** No platform confirms one, and the
  commonly quoted Facebook figure has no primary source.
- **YouTube RPM follows the viewer's location, not the creator's** — a global-English audience is
  the single biggest lever on it.

The strategy those facts produce: the footage is audience acquisition, not the product. Revenue
comes from affiliate gear, LUTs and presets, client work, and brand deals. Platform ad revenue is
a bonus. The specific revenue lines depend on the subject — read `profile/positioning.md` rather than
assuming event videography.

## Reads / Writes

**Paths:** `references/`, `scripts/`, and `templates/` are siblings of `SKILL.md` in this skill
folder — read them by relative path. `profile/…` means the creator's own files, which live in the
profile directory in local mode and arrive as Project files or in the conversation in context mode.
Check the router's Step 0 before writing to any of them.

- Reads: `profile/performance.md`, `profile/positioning.md`, `profile/gate-log.md`,
  `references/platform-facts.md`, `references/ranking-signals.md`
- Writes: `profile/performance.md`

**Cold start:** with fewer than roughly ten logged posts, treat every pattern as provisional and
say so. Three posts is noise.

## Boundaries

Decides where and whether to post, and how the work earns. Does not make content.

## Gotchas

- **Small samples produce confident nonsense.** One post outperforming is weather, not climate.
- **Posting cadence is not a target.** Ten strong pieces with real audience interaction beat
  thirty weak ones; no platform mandates a frequency.
- **Monetization figures age fast and were secondary-sourced.** Say "unverified" rather than
  guessing, every time.
- **Read `profile/gate-log.md` during reviews.** Repeated overrides on one rule mean `ff-critique`
  is miscalibrated, not that the creator is undisciplined.
- **A viral post can be a bad post.** It can attract an audience that never returns.
