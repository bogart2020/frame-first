# Platform facts

**Last verified: 2026-08-20.** This is the only file in frame-first that carries dated
platform claims. Every skill points here instead of restating them, so there is exactly one
place to re-verify when things change. Re-check anything older than ~3 months before acting.

Each row carries its verdict. **Confirmed** means an official page owned by the platform states
it, and the URL is given. **Unverified** means only secondary sourcing or absence-of-evidence —
report those as unverified to the creator rather than as fact. Full re-verification record:
`research/2026-08-20-hardening.md`.

## Copyrighted music in footage

Applies whenever recorded music is audible in the video — a concert, a venue or shop playlist, a
busker, a gym, a soundtrack playing behind a scene. The concert case is the strictest and is used
as the worked example below, but the rules are the same wherever the music comes from.

**When the audio is the creator's own, ambient, or silent-by-design, none of this applies** and
library audio is a choice rather than a requirement.

| Platform | What happens to a clip carrying live copyrighted music | Verdict |
|---|---|---|
| TikTok | Removal is documented **on rightsholder report**. Automatic muting is widely reported but TikTok documents no auto-detection behaviour | **Unverified** — do not tell the creator muting is near-certain |
| Instagram | May **block, mute, remove, or limit**. Meta defines "limited" by example — "blocked, muted or ineligible for Music Revenue Share" — so it is **not** reduced distribution. A copyright-muted reel can still be viewed | **Confirmed** ([Meta Music Guidelines](https://www.facebook.com/legal/music_guidelines)). Filming live performance is **explicitly permitted**: "traditional live music performances (e.g., filming an artist or band performing live) are permitted" |
| YouTube | Content ID **claim**, which is not a strike. What happens next depends on length — see the carve-out below | **Confirmed** ([Content ID claims](https://support.google.com/youtube/answer/6013276)) |
| Facebook | Same Meta Music Guidelines as Instagram — block/mute/remove, live video included, plus ineligibility for Music Revenue Share | **Confirmed** policy; the revenue **split** is undocumented |

### The YouTube Shorts carve-out

This is the row that most affects a vertical short-form creator, and it reverses the obvious
strategy. From [Content ID claims](https://support.google.com/youtube/answer/6013276),
verified 2026-08-20:

> "Shorts longer than one minute that have an active Content ID claim, regardless of the policy,
> will be blocked on YouTube."

The familiar "stays viewable, revenue goes to the rights holder" behaviour applies to **longer-form
video**, not to Shorts. Since 2024-10-15 all vertical video up to three minutes is classified as a
Short.

**Consequence:** library audio on Instagram and TikTok. Real recorded music survives on YouTube
**only** as a horizontal upload or one over three minutes — not as a Short. A vertical 1–3 minute
clip carrying claimed music is the one combination that gets blocked outright.

**Muting is the worst of the options, and the two mechanisms stack.** Meta's copyright "limit"
does not itself reduce distribution — but Instagram's ranking page names **muted** reels as made
less visible regardless of *why* they are silent. So a clip muted to dodge a claim takes a demotion
it did not have to take.

Library audio avoids both, and earns something extra: detected licensed audio adds the reel to that
song's **audio page**, and "go to the audio page" is one of Instagram's four named top Reels
predictions (`references/ranking-signals.md`). Muting forfeits that entirely.

Fair use does not cover concert footage; courts decide case by case.

## Trend data that can and cannot be retrieved

**Retrievable:** YouTube Data API v3 (`chart=mostPopular`, `regionCode`). The free quota allocates
**100 `search.list` calls plus 10,000 units/day for other endpoints**, confirmed at
[YouTube Data API getting started](https://developers.google.com/youtube/v3/getting-started).
Google Trends is fragile — pytrends is archived (confirmed via GitHub API; the commonly cited
"April 2025" date is **unverified**, GitHub exposes no archive timestamp). Curated weekly roundups
from HeyOrca, Buffer, Later, Hootsuite are editorial rather than algorithmic, and stale within
about a week.

**Not retrievable by any agent:**

| Source | Why | Verdict |
|---|---|---|
| Instagram trending audio | Lives in the Professional Dashboard; no trending-audio endpoint exists in the Graph API, which reads owned accounts only | **Unverified by absence** — no Instagram page asserts the negative. Operationally sound; say "no endpoint we could find", not platform intent |
| Meta Content Library | Requires academic or non-profit affiliation, verbatim on the page | **Confirmed** ([Meta Content Library](https://transparency.meta.com/researchtools/meta-content-library/)) |
| TikTok trending sounds | Creative Center returned **HTTP 403 to an automated browser** on 2026-08-20 | **Blocking observed.** The often-repeated "ToS forbids it" is **unverified** — that ToS URL 404s |
| TikTok Research API | "I am a creator, advertiser, or commercial user. Am I eligible…? **No.**" | **Confirmed** ([Research API FAQ](https://developers.tiktok.com/doc/research-api-faq)) |
| Facebook Reels trends | No public trend surface found | **Unverified by absence** |
| YouTube Shorts audio | No Shorts-specific audio endpoint found | **Unverified by absence** |

**Consequence:** `ff-trends` reports the source and date of every claim, and reports a source as
unreachable when it is. The in-app paste checklist covers what no API exposes.

## Monetization for a Philippines-based creator

| Platform | Program | Status | Verdict |
|---|---|---|---|
| TikTok | Creator Rewards | **Not available in the Philippines** — the program lists US, UK, Germany, Japan, South Korea, France, Mexico, Brazil. PH paths: LIVE gifts, TikTok Shop affiliate | **Confirmed** ([eligibility](https://www.tiktok.com/creator-academy/article/eligibility)) |
| Instagram | Gifts | **Not available in PH** — absent at its alphabetical position (Peru, Poland) in the official country list. Pays $0.01 USD per star where available | **Confirmed unavailable** ([Gifts](https://help.instagram.com/738469380549477)) |
| Instagram | Subscriptions | **Not available in PH** — same alphabetical gap | **Confirmed unavailable** ([Subscriptions](https://help.instagram.com/478012211024479)) |
| Facebook | Content Monetization | **Available in PH** | **Confirmed** ([availability](https://www.facebook.com/business/help/267128784014981)) |
| Facebook | In-stream ads for Live | **Ended 2026-06-15.** Any plan routing concert LIVE to Facebook for ad revenue is dead | **Confirmed** (same page) |
| YouTube | Partner Program | Believed available; **not re-checked in the 2026-08-20 pass** | **Unverified this cycle** |

**Rates are not confirmed.** The often-quoted Facebook figure of roughly PHP 0.008–0.018 per view
has **no primary source** — Meta publishes no per-view rate. Report it as unverified, or better,
do not quote it as a number the creator can plan against.

**YouTube RPM follows the viewer's location, not the creator's.** The mechanism is CPM varying by
ad market: "Different locations will have different levels of competition in the ad market, so
CPMs will vary by geography" ([revenue metrics](https://support.google.com/youtube/answer/9314357)).
A global-English audience is the single biggest lever on this number.

**Consequence:** the footage is audience acquisition, not the product. Revenue comes from
affiliate gear, LUTs and presets, client work, and brand deals — the specific lines depend on the
creator's subject, which `data/positioning.md` holds. Platform ad revenue is a bonus.
