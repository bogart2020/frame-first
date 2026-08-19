---
name: ff-strategy
description: Reads Insights screenshots to diagnose what to change, logs performance, and plans platform and monetization decisions. Use when sharing post metrics or analytics, reviewing results, planning a cycle, or working out how the content earns.
---

# ff-strategy

The loop that makes every other skill improve: record what happened, read it back, decide next.

## Performance logging

Input by **screenshot** of platform Insights; manual paste as fallback.

Track **sends/shares** and **sustained attention** as primary — distribution through a relationship
and held attention are what recommendation systems respond to. Then saves (Instagram only),
follows-from-post, and views. Likes are not tracked; they measure approval, not travel.

**Record the metric the platform actually names**, not a normalized one. Instagram gives Views,
Watch time, Viewers, Average watch time, Follows — and no watch-through percentage. TikTok gives
retention rate and watch time. Logging "watch-through" for an Instagram post means inventing a
number the creator cannot see.

Write to `data/performance.md` with the post, its hook architecture, and one line on what it
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
| **Instagram distribution suppressed on a clip that is fine elsewhere** | Demotion, not performance | Instagram makes less visible: watermarked, low-resolution, **muted**, bordered, majority-text, and already-posted reels. Export clean per platform — a muted concert clip is demoted for its own reason | **Documented** as a mechanism. **Not** diagnosable by comparing IG views to TikTok views — Reels average ~30% fewer views than TikTok as a baseline (Metricool, 24.3M posts). Use Account Status or the follower/non-follower split |
| **Views high, follows near zero** | Nothing gave a reason to come back | Positioning, not packaging | **Heuristic.** The metric is documented on both platforms; nothing documents this cause. TikTok warns follower swings after a spike are normal — needs several posts, not one |
| **Saves high, sends low** | Useful but not identity-bearing | Fine for craft work. Do not "fix" it into engagement bait — Meta names clickbait and engagement bait as demoted | **Documented** that saves rank on Instagram Explore and that bait is demoted. **Note:** TikTok does not name or report saves. "Fine for craft content" is this plugin's judgment |

**Metric names matter.** Instagram reports **no watch-through %, no completion rate, and no
retention curve** — it reports Views, Watch time, Viewers, Average watch time, and Follows. "Reach"
no longer exists on either platform: Instagram renamed it Views/Viewers, and TikTok has no per-post
reach. Ask for what the screen actually shows.

**Signal order is platform-specific.** Instagram ranks reshare above watch-through; TikTok says
watch time is weighted more heavily than engagement. Do not apply one global ordering to both.

**Then hand off.** Name the controllable and route to `ff-package` for the rewrite, or `ff-ideas`
if the premise itself is the problem. Diagnosing is this skill's job; writing the replacement is not.

**What a screenshot cannot tell you:** where views came from geographically, whether a specific
caption word mattered, or why one post beat another when both sit inside normal variance. TikTok
says it plainly — "Fluctuations are normal!" Say so rather than constructing a story.

## Monetization

`references/platform-facts.md` holds the current picture. Report those figures as coming from
secondary sources, flag the ones marked unverified, and point the creator at their own dashboard
before any of it drives a decision.

The strategy those facts produce: concert footage is audience acquisition. Revenue comes from
affiliate gear, LUTs and presets, client event videography, and brand work. Platform ad revenue
is a bonus.

## Reads / Writes

**Paths:** everything below is relative to the plugin root, not the open project. Resolve first:
`FF="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$(readlink "$HOME/.claude/skills/ff-init")")")}"; eval "$("$FF/scripts/ff-paths.sh")"`
then read and write via `$FF_DATA`, `$FF_REFS`, `$FF_SCRIPTS`.

- Reads: `data/performance.md`, `data/positioning.md`, `data/gate-log.md`,
  `references/platform-facts.md`, `references/ranking-signals.md`
- Writes: `data/performance.md`

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
- **Read `data/gate-log.md` during reviews.** Repeated overrides on one rule mean `ff-critique`
  is miscalibrated, not that the creator is undisciplined.
- **A viral post can be a bad post.** It can attract an audience that never returns.
