# Platform facts

**Last verified: 2026-08-19.** This is the only file in frame-first that carries dated
platform claims. Every skill points here instead of restating them, so there is exactly one
place to re-verify when things change. Re-check anything older than ~3 months before acting.

## Concert footage and copyrighted music

The constraint that shapes the whole strategy.

| Platform | What happens to a clip carrying live copyrighted music |
|---|---|
| TikTok | Audio muted, near-certain. LIVE risks an immediate cut |
| Instagram | Auto-detection demotes reach to followers only, or mutes |
| YouTube | Content ID **claim** — video stays up and monetized, revenue to the rights holder. Not a strike |
| Facebook | Likely claim + shared revenue; policy not publicly documented |

Fair use does not cover concert footage; courts decide case by case.

**Consequence:** library audio on Instagram and TikTok. Real concert audio belongs on YouTube.

## Trend data that can and cannot be retrieved

**Retrievable:** YouTube Data API v3 (`chart=mostPopular`, `regionCode`, ~100 searches/day on
the free quota). Google Trends, fragile — pytrends was archived April 2025 and direct requests
commonly return 429. Curated weekly roundups from HeyOrca, Buffer, Later, Hootsuite —
editorial rather than algorithmic, and stale within about a week.

**Not retrievable by any agent:**

| Source | Why |
|---|---|
| Instagram trending audio | Login-gated in the Professional Dashboard, no API export. Graph API reads owned accounts only |
| Meta Content Library | Requires academic or nonprofit affiliation |
| TikTok trending sounds | Creative Center ToS forbids automated fetching (CAPTCHAs, rate limiting). Research API is academic-only, commercial use barred |
| Facebook Reels trends | No public trend surface exists |
| YouTube Shorts audio | No Shorts-specific audio endpoint |

**Consequence:** `ff-trends` reports the source and date of every claim, and reports a source as
unreachable when it is. The in-app paste checklist covers what no API exposes.

## Monetization for a Philippines-based creator

| Platform | Program | Status |
|---|---|---|
| TikTok | Creator Rewards | **Not available in the Philippines.** PH paths: LIVE gifts, TikTok Shop affiliate |
| Instagram | Gifts, Subscriptions | **Unverified** — PH absent from the named eligible list. Treat as unavailable until the dashboard proves otherwise |
| Facebook | Content Monetization | **Available in PH**, roughly PHP 0.008–0.018 per view |
| YouTube | Partner Program | Available. **RPM follows the viewer's location, not the creator's** — a global-English audience is the single biggest lever on this number |

**Confidence:** these come from secondary sources, not platform help-center pages. Instagram's PH
status, TikTok's PH launch timeline, and exact YouTube PH RPM were all flagged unverified by the
research. Report them as unverified and point the creator at their own dashboard.

**Consequence:** concert footage is audience acquisition. Revenue comes from affiliate gear,
LUTs and presets, client event videography, and brand work. Platform ad revenue is a bonus.
