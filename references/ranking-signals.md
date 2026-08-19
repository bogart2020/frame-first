# Ranking signals

**Last verified: 2026-08-20.** What each platform *itself documents* about how it ranks and
surfaces content. Every row is first-party — a page owned by the platform, linked. Nothing here
comes from an SEO blog.

This file answers "what does the platform say it rewards", which is stable on the order of months.
It is **not** a trend feed — see `references/platform-facts.md` for what trend data is reachable
at all, and it mostly is not.

Use this to decide structure: what to put in a title, whether to chase a share or a like, whether
a repost will be demoted. Do not use it to predict a specific video's performance.

## Contents

- [Instagram Reels](#instagram-reels)
- [Instagram Explore and Search](#instagram-explore-and-search)
- [Hashtags — what each platform says](#hashtags--what-each-platform-says)
- [TikTok For You and Search](#tiktok-for-you-and-search)
- [YouTube](#youtube)
- [Meta — what gets demoted](#meta--what-gets-demoted)
- [What this file does not tell you](#what-this-file-does-not-tell-you)

## Instagram Reels

| Signal | What Instagram says |
|---|---|
| Top predictions | "how likely you are to **reshare** a reel, **watch a reel all the way through**, like it, and go to the audio page" — in that order |
| Signal order | Your activity → history with the poster → information about the reel (audio, visuals, popularity) → information about the poster |
| Made **less** visible | Reels "that have already been posted on Instagram"; reels with **watermarks** or **low resolution** |

Source: [Instagram Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained)

**Consequence:** reshare and watch-through are the two levers, in that order. This is why
`ff-strategy` tracks shares/sends and watch-through as primary and does not track likes — the
platform names likes third. A TikTok export with a visible watermark is explicitly demoted.

## Instagram Explore and Search

| Surface | Signals, in the order Instagram lists them |
|---|---|
| Explore | Information about the post (likes, comments, shares, saves) → your activity in Explore → history with the poster → information about the poster |
| Search | Similarity between the query and the **account username / profile name**, suggested keywords, and hashtags |

Sources: [Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained),
[Instagram Search AI system](https://transparency.meta.com/features/explaining-ranking/ig-search/)

**Consequence, and it is counter-intuitive:** Instagram's transparency page does **not** name
caption text as a search signal. Username and profile name are named. Searchable phrasing earns
more on TikTok and YouTube than it does in Instagram search.

## Hashtags — what each platform says

| Platform | Position |
|---|---|
| **Instagram** | **Hard cap of five per post**, rolling out gradually. Instagram's own wording: "using fewer (up to 5) **more targeted** hashtags, rather than many generic ones, can improve both your content's performance and people's experience." Mosseri, Feb and May 2025: hashtags "don't work" to increase reach and "don't improve visibility" — they label the topic and connect posts |
| **Instagram Search** | Hashtags **are** a named search signal, alongside username and profile name. So they earn in *search*, not in feed reach |
| **TikTok** | Hashtags are named under **content information**, one of the three For You signal groups. No stated optimum count |
| **YouTube** | Tags are "**not important**… primarily used to help correct for common spelling mistakes" |

Sources: [Instagram hashtag limit and statement](https://www.socialmediatoday.com/news/instagram-implements-new-limits-on-hashtag-use/808309/),
[How TikTok recommends content](https://www.tiktok.com/support/faq_detail?id=7655285288050104852),
[YouTube search and discovery](https://support.google.com/youtube/answer/141805)

**Consequence:** maximizing hashtag count is not available on Instagram and is not supported
anywhere. Targeting is the lever — a hashtag earns its place by naming the topic precisely enough
that someone searching that topic finds it. Five precise tags beat thirty generic ones, and on
Instagram thirty is no longer possible.

## TikTok For You and Search

| Signal group | What TikTok says |
|---|---|
| User interactions | Like, share, comment, **watch in full or skip** |
| Content information | **Sounds, hashtags**, view count, country published |
| User information | Device, language, location, time zone, day |
| Search ranking | "For most users, **content information, which may include how well the content matches the specific term entered, is generally weighted more heavily** than others" |

Sources: [How TikTok recommends content](https://www.tiktok.com/support/faq_detail?id=7655285288050104852),
[FYF Eligibility Standards](https://www.tiktok.com/community-guidelines/en/fyf-standards)

**Consequence:** "watch in full or skip" is a named interaction — completion matters, and a short
clip that loops is easier to complete than a long one that trails off. Content-query match
dominates TikTok search, so spoken words and on-screen text carry real weight here.

**Worth knowing:** content can be made **ineligible for recommendation** while still being findable
through search or a profile visit. Analytics shows whether this happened. A post with normal
follower views and near-zero For You views is the signature.

## YouTube

| Signal | What YouTube says |
|---|---|
| Discovery | How well the **title, description, and video content** match the viewer's search; and what videos drive the most engagement for that search |
| Tags | **"Not important. Tags are primarily used to help correct for common spelling mistakes."** |
| Watch time | **Relative** watch time matters more for short videos; **absolute** watch time for long ones |

Source: [Search and discovery](https://support.google.com/youtube/answer/141805)

**Consequence:** title and description are the levers; tags are close to worthless and no skill
should draft them as an SEO play. For a short clip, percentage watched beats minutes watched —
which argues for cutting to the strongest section rather than padding for duration.

## Meta — what gets demoted

| Demoted | Wording |
|---|---|
| Clickbait / engagement bait | "Low-quality content, such as clickbait and engagement bait" |
| Repurposed content | "limited originality content that is **principally repurposed from other sources**" |

Source: [Reducing distribution of problematic content](https://transparency.meta.com/enforcement/taking-action/lowering-distribution-of-problematic-content/)

**Consequence:** this is the platform's own statement of the doctrine in
`references/slop-patterns.md`. Engagement bait ("tag someone who…", "which would you pick?") is
named as demoted, not merely ineffective. Reposting someone else's clip with your caption on it is
named as demoted.

## What this file does not tell you

- **Nothing here is real-time.** These are documented mechanisms, not current trends. No platform
  publishes a live ranking feed, and the trending surfaces are unreachable — see
  `references/platform-facts.md`.
- **No weights are published.** Order of listing is the only ranking information given; treat it
  as ordinal, never as a formula.
- **Follower count is not a named distribution signal on any of these pages.**
