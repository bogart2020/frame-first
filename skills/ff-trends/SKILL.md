---
name: ff-trends
description: Researches what formats and topics are working now in short-form video, then angles them to phone cinematography. Use when the creator asks what is trending, whether a format is worth trying, or what to post this week.
---

# ff-trends

Find what is moving, then do the part that matters: discard what does not fit phone
cinematography and angle what does.

## What is reachable

`references/platform-facts.md` holds the current picture of which trend sources can be retrieved
and which cannot. Read it before making any claim about trending data.

The short version: YouTube Data API and curated weekly roundups are fetchable. Instagram and
TikTok trending audio are not reachable by any agent, by design of those platforms.

## Method

1. **Read the mechanism first.** `references/ranking-signals.md` is what TikTok and Instagram
   themselves publish about ranking. It does not expire weekly the way a trend does, and it
   answers most "what should I do" questions without any trend data at all. Start here.
2. **Run the capture** below for TikTok and Instagram. Nothing about those two is fetchable, so
   this is the only real input.
3. **Fetch what is fetchable.** YouTube Data API v3 if `YOUTUBE_API_KEY` is set — `regionCode=US`
   and `GB` alongside `PH`, since the audience is global English. Treat it as a **cross-platform
   proxy for format**, not as TikTok or Instagram data, and label it that way.
4. **Angle it.** Discard what does not fit. For what remains, state the specific interpretation
   only this creator could produce — a format plus nothing original performs worse than no trend.

## The TikTok / Instagram capture

Neither platform exposes this to an agent, so the creator captures it. Ask for these in order —
it is about five minutes — then do the pattern extraction, which is the part they cannot do.

**TikTok Creative Center** (`ads.tiktok.com/business/creativecenter`)
- Set **Region to the target market, not the Philippines** — US and UK for a global-English
  audience. This is the single most important setting for reach outside PH, and it is the one
  most often left on the home country.
- Top Ads / Trending Hashtags: paste the top 5–10 relevant to the niche.
- Trending Sounds: paste the top 5, but weight them low — see Weighting.

**TikTok search, in-app**
- Search the creator's core keywords. Note the **format** of the top 5 results: length, whether
  text is on screen in the first frame, whether there is a spoken hook.

**Instagram Professional Dashboard**
- Trending audio, if the account has access.
- Then: the creator's own last 10 Reels sorted by **reshares**, not likes. Per
  `references/ranking-signals.md`, reshare and watch-through are Instagram's own top two
  predictions, so this is the only ranking-relevant self-comparison available.

**What to extract** — the creator supplies observations; this skill supplies the pattern:
structure repeated across the top results, the hook shape, where text sits in the frame, length
clustering, and what the top posts have in common that the creator's do not. Name the pattern;
never hand back "do what they did".

✅ **Done when** every finding carries a source and a date, and anything unreachable is reported
as unreachable.

## Weighting

**Format trends over audio trends.** Nobody discovers a concert-cinematography video through its
sound. Hook architectures, micro-story structures, and searchable topic phrases carry more weight
here than trending audio, which is a minor input.

## Reaching outside the Philippines

The audience target is global English (PLAN decision 4). Two documented levers, both from
`references/ranking-signals.md`:

- **TikTok names "country published" as a content signal**, and language and location as user
  signals. English on-screen text and English spoken words are what make a clip legible to a
  non-PH viewer; untranslated Tagalog narrows it. This is a documented signal, not a theory.
- **TikTok search weights content-query match most heavily.** Searchable English phrasing in
  spoken words and on-screen text is the highest-leverage thing available, and it is fully under
  the creator's control — unlike audio trends, which are not even observable.

Set the Creative Center region to the **target market** when capturing. Trends in PH and trends in
the US frequently differ, and capturing the wrong one optimizes for the audience being moved away
from.

**What cannot be done:** no agent can confirm where a given post's views came from, or predict
regional reach. The creator's own analytics is the only source for that.

## Reads / Writes

**Paths:** everything below is relative to the plugin root, not the open project. Resolve first:
`FF="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$(readlink "$HOME/.claude/skills/ff-init")")")}"; eval "$("$FF/scripts/ff-paths.sh")"`
then read and write via `$FF_DATA`, `$FF_REFS`, `$FF_SCRIPTS`.

- Reads: `data/positioning.md`, `references/platform-facts.md`, `references/ranking-signals.md`
- Writes: dated entries in `data/trends.md`; promising angles to `data/ideas.md`

## Boundaries

Reports and angles what is findable. Does not write posts, and does not have access to Instagram
or TikTok trending audio.

## Gotchas

- **Inventing a trending list is the worst available failure.** Every claim states its source and
  date; a source that cannot be reached is reported as unreachable. A creator who acts on a
  fabricated trend loses a shoot, not just a post.
- **Trend data goes stale in about a week.** Date-stamp everything and flag old entries.
- **Chasing every trend reads as pandering.** Relevance to the niche is the filter. What *is*
  documented: Meta demotes "limited originality content that is principally repurposed from other
  sources" (`references/ranking-signals.md`) — so a trend copied without an original angle is
  penalized by the platform, not merely ignored by viewers.
- **The API quota is small** — roughly 100 searches a day. Spend it on deliberate queries.
