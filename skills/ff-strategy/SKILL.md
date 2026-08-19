---
name: ff-strategy
description: Reads Insights screenshots to diagnose what to change, logs performance, and plans platform and monetization decisions. Use when sharing post metrics or analytics, reviewing results, planning a cycle, or working out how the content earns.
---

# ff-strategy

The loop that makes every other skill improve: record what happened, read it back, decide next.

## Performance logging

Input by **screenshot** of platform Insights; manual paste as fallback.

Track **shares/sends** and **watch-through** as primary — distribution through a relationship and
sustained attention are what recommendation systems respond to. Then saves,
follows-from-post, and views. Likes are not tracked; they measure approval, not travel.

Write to `data/performance.md` with the post, its hook architecture, and one line on what it
suggests. `ff-ideas` and `ff-critique` read this back.

✅ **Done when** the entry names the hook architecture used and one specific inference, rather
than a summary of the numbers.

## Diagnose: metric → controllable

Given a screenshot, do not stop at "views were low". Map the pattern to the specific thing the
creator can change. Signal ownership comes from `references/ranking-signals.md` — these are
documented platform mechanisms, not inference.

| Pattern in the numbers | What it implicates | The controllable |
|---|---|---|
| **Low watch-through**, reach normal | The first seconds. TikTok names "watch in full or skip" an interaction; Instagram names watch-through a top-two prediction | Hook and first frame (`references/hooks.md`), and length — cut to the strongest section rather than padding |
| **Good watch-through, few shares** | It held attention but said nothing about the viewer. Reshare is Instagram's **top** prediction | The send test. Who forwards this, and what does sending it say about them? Usually a caption problem, not a footage problem |
| **Low reach on IG, normal on TikTok, same clip** | Demotion, not performance | A **watermark** or a repost — Instagram explicitly makes watermarked and already-posted reels less visible. Export clean per platform |
| **Views far below the creator's own baseline, followers still see it** | Possibly ineligible for recommendation; TikTok analytics reports this directly | Check the TikTok ineligibility flag before changing anything else. No caption edit fixes this |
| **Views high, follows near zero** | Nothing gave a reason to come back | Positioning, not packaging. It worked as a one-off and taught the audience nothing about who made it |
| **Saves high, shares low** | Useful but not identity-bearing | Fine for craft content — saves are a real signal. Do not "fix" this into engagement bait |

**Then hand off.** Name the controllable and route to `ff-package` for the rewrite, or `ff-ideas`
if the premise itself is the problem. Diagnosing is this skill's job; writing the replacement is not.

**What a screenshot cannot tell you:** where views came from geographically, whether a specific
caption word mattered, or why one post beat another when both sit inside normal variance. Say so
rather than constructing a story.

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
