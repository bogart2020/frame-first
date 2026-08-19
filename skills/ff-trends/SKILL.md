---
name: ff-trends
description: Researches what formats and topics are working now in short-form video, then angles them to phone cinematography. Use when the creator asks what is trending, whether a format is worth trying, or what to post this week.
---

> **STATUS: STUB.** Structure and gotchas are settled; prose to be written.

# ff-trends

Find what is moving, then do the part that matters: discard what does not fit phone
cinematography and angle what does.

## What is reachable

`references/platform-facts.md` holds the current picture of which trend sources can be retrieved
and which cannot. Read it before making any claim about trending data.

The short version: YouTube Data API and curated weekly roundups are fetchable. Instagram and
TikTok trending audio are not reachable by any agent, by design of those platforms.

## Method

1. **Fetch what is fetchable.** YouTube Data API v3 if `YOUTUBE_API_KEY` is set — use
   `regionCode=US` and `GB` alongside `PH`, since the audience is global English. Read the
   curated weekly roundups.
2. **Ask for what is not.** Give a 60-second in-app checklist naming exact screens in order:
   Instagram Professional Dashboard → trending audio; TikTok Creative Center → Trending Sounds
   and Hashtags; TikTok search → the creator's core keywords.
3. **Angle it.** Discard what does not fit. For what remains, state the specific interpretation
   only this creator could produce — a format plus nothing original performs worse than no trend.

✅ **Done when** every finding carries a source and a date, and anything unreachable is reported
as unreachable.

## Weighting

**Format trends over audio trends.** Nobody discovers a concert-cinematography video through its
sound. Hook architectures, micro-story structures, and searchable topic phrases carry more weight
here than trending audio, which is a minor input.

## Reads / Writes

- Reads: `data/positioning.md`, `references/platform-facts.md`
- Writes: dated entries in `data/trends.md`; promising angles to `data/ideas.md`

## Boundaries

Reports and angles what is findable. Does not write posts, and does not have access to Instagram
or TikTok trending audio.

## Gotchas

- **Inventing a trending list is the worst available failure.** Every claim states its source and
  date; a source that cannot be reached is reported as unreachable. A creator who acts on a
  fabricated trend loses a shoot, not just a post.
- **Trend data goes stale in about a week.** Date-stamp everything and flag old entries.
- **Chasing every trend reads as pandering.** A third of consumers find trend-chasing
  embarrassing. Relevance to the niche is the filter.
- **The API quota is small** — roughly 100 searches a day. Spend it on deliberate queries.
