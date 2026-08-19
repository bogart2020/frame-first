---
name: ff-trends
description: Research what is currently working in short-form video for phone cinematography, concerts, and craft content, then angle it against the creator's niche. Use when the creator asks what is trending, wants to know if a format is worth trying, or is planning what to post this week. Honest about what cannot be fetched automatically.
---

> **STATUS: STUB.** Body to be written. Spec below.

## Purpose

Find what is moving right now, then do the part that matters: kill the 90% irrelevant to phone-cinematography and angle the rest.

## Hard constraint — read before writing this skill

**Live Instagram and TikTok trending-audio data cannot be fetched.** Verified 2026-08-19:
- Instagram's trending sounds live behind login in the Professional Dashboard; no API exports it. The Graph API reads owned accounts only. Meta Content Library requires academic affiliation.
- TikTok Creative Center is publicly viewable but its ToS forbids automated fetching (CAPTCHAs, rate limiting). The Research API is academic-only and bars commercial use.
- Facebook has no public Reels trend surface. YouTube has no Shorts-audio endpoint.

**This skill must never claim to have fetched data it cannot fetch.** Fabricating a trending-audio list is the single worst failure mode available to it.

## What it fetches automatically

- **YouTube Data API v3** — `videos.list?chart=mostPopular` and `search.list`. Optional: works without a key, uses `YOUTUBE_API_KEY` env var if present. ~100 searches/day on free quota, so spend them deliberately. Use `regionCode=US`/`GB` as well as `PH` — the audience is global English.
- **Curated weekly roundups** — HeyOrca (Fridays), Buffer, Later, Hootsuite blogs. Editorial, not algorithmic. Flag anything older than 7 days as stale.

## What it asks the creator to paste

A **60-second in-app checklist** — name the exact screens, in order:
1. Instagram → Reels → trending audio in the Professional Dashboard
2. TikTok → Creative Center → Trending Sounds / Hashtags
3. TikTok search → the creator's core keywords → what ranks

Then do the real work on what comes back.

## Weighting

Per the settled strategy: **format trends over audio trends.** Nobody finds a concert-cinematography video because of its sound. Prioritize hook architectures, micro-drama structures, searchable topic phrases, and what is winning specifically in phone-videography. Treat audio as a minor input.

## Reads / Writes

- Reads: `data/positioning.md`
- Writes: appends dated findings to `data/trends.md`; promising angles go to `data/ideas.md`

## Rules

- Label every finding with its source and date.
- State plainly when something could not be checked. "I could not verify this" is a valid and required output.
