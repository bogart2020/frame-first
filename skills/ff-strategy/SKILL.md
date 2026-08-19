---
name: ff-strategy
description: Logs post performance and plans platform and monetization decisions. Use when reviewing results, planning a posting cycle, weighing whether a platform is worth the effort, or working out how the content earns money.
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
