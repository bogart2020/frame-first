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

### Lyrics in text

**Verified 2026-08-25.** This is about *words*, not audio — a lyric typed into a caption or burned
into on-screen text. The music rules above do not cover it, and platform copyright tools are not
the exposure here; the rightsholder is.

| Claim | Verdict |
|---|---|
| The composition and the recording are **two separate copyrights**, and the composition is the one that carries the words: **"A Musical Composition consists of music, including any accompanying words"**, and **"Copyright in a sound recording is not the same as, or a substitute for, copyright in the underlying musical composition"** | **Confirmed**, verbatim ([U.S. Copyright Office — Musical Compositions and Sound Recordings](https://www.copyright.gov/register/pa-sr.html)) |
| There is **no safe length**: **"There are no legal rules permitting the use of a specific number of words, a certain number of musical notes, or percentage of a work"** | **Confirmed**, verbatim ([U.S. Copyright Office — Fair Use FAQ](https://www.copyright.gov/help/faq/faq-fairuse.html)) |

**Consequence.** Licensing the recording — using library audio, or filming a performance where the
platform permits it — does nothing for the words. Quoting or paraphrasing a lyric in a caption or
in on-screen text is reproducing the composition, and no word count makes it safe. **Name the song
and the artist instead.** A title and a credit are attribution, not reproduction, and they carry
the searchable phrasing anyway.

This is not legal advice and no agent can give it. It is the reason `ff-package` refuses to draft
the line and `ff-critique` treats it as a Showstopper.

## Caption length and the fold

**Verified 2026-08-25.** Two caps and one fold. The caps are documented; the fold is not.

| Claim | Verdict |
|---|---|
| Instagram caption: **"Maximum 2200 characters, 30 hashtags, and 20 @ tags"** | **Confirmed**, verbatim ([Meta — IG User Media reference](https://developers.facebook.com/docs/instagram-platform/instagram-graph-api/reference/ig-user/media)) |
| TikTok **Content Posting API** `title`: **"The maximum length is 2200 in UTF-16 runes"** | **Confirmed**, verbatim ([TikTok — Direct Post reference](https://developers.tiktok.com/doc/content-posting-api-reference-direct-post/)) |
| TikTok **native app** cap of **4,000 characters** | **Unverified.** Widely reported, including on TikTok-hosted creator videos, but no TikTok-owned documentation page states it. `support.tiktok.com` and `newsroom.tiktok.com` searched 2026-08-25, nothing found |
| **Where the fold falls** — Instagram feed and Reels commonly cited at ~125 characters, TikTok at roughly the first line, before "…more" | **Unverified.** No Meta or TikTok page documents a truncation point. `help.instagram.com`, `about.instagram.com`, `creators.instagram.com` and `developers.facebook.com` searched 2026-08-25, nothing found |

**Consequence — the cap.** 2,200 is the binding limit wherever a scheduling tool sits in the path,
even on TikTok where the app itself allows more: the API refuses the rest. Writing to the app's
larger cap and scheduling through a tool is how a caption gets silently truncated at post time.

**Consequence — the fold.** It is real, but its position is undocumented and varies by device and
by app version. So the rule is not a character count: **the first line carries the hook and reads
complete on its own, and nothing after it is assumed read.** Say that is a judgment call resting on
an unverified truncation point — never quote a creator a character number as if the platform
published one.

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
creator's subject, which `profile/positioning.md` holds. Platform ad revenue is a bonus.
