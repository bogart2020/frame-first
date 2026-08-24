# Ranking signals

**Last verified: 2026-08-20.** What each platform *itself documents* about how it ranks and
surfaces content. Every row is first-party — a page owned by the platform, linked. Nothing here
comes from an SEO blog, with **one labelled exception**: the TikTok hashtag-placement note, which
is marked as secondary in place and says what it does not establish.

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
| Made **less** visible | Verbatim: "low-resolution or watermarked reels, reels that are **muted** or contain **borders**, reels that are **majority text**, or reels that have already been posted on Instagram" |
| Minimum spec | Verbatim: "Reels should have a **minimum frame rate of 30 FPS** (frames per second) and **minimum resolution of 720 pixels**." In-app: Menu → Your app and media → Media quality → **Upload at highest quality**. **This row is not on the Ranking Explained page** — it is [Instagram reels requirements](https://help.instagram.com/1038071743007909), which carries both the spec and the menu path |
| Popularity | Instagram names "popularity signals such as **number of followers**" for Reels |

Source: [Instagram Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained)

**Consequence:** reshare and watching all the way through are the two levers, in that order. This
is why `ff-strategy` tracks sends and sustained attention as primary and does not track likes — the
platform names likes third. A TikTok export with a visible watermark is explicitly demoted.

**These are the names of ranking predictions, not of metrics you can read.** Instagram's Insights
report Views, Watch time, Viewers, Average watch time, and Follows — there is no watch-through
percentage on the screen. Never ask the creator for a number the app does not show.

## Instagram Explore and Search

| Surface | Signals, in the order Instagram lists them |
|---|---|
| Explore | Information about the post (likes, comments, shares, saves) → your activity in Explore → history with the poster → information about the poster |
| Search | Similarity between the query and the **account username / profile name**, suggested keywords, and hashtags |

Sources: [Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained),
[Instagram Search AI system](https://transparency.meta.com/features/explaining-ranking/ig-search/)

**Two first-party sources disagree here, and both belong on the record:**

- Instagram's **transparency page** names username, profile name, suggested keywords, and hashtags
  as search signals. It does **not** name caption text.
- Instagram's **creator guidance** tells creators to "include relevant keywords in your content,
  your **caption**, your bio, and your hashtags".

Treat the transparency page as the description of the ranking system and the creator guidance as
what Instagram advises. The safe read: keywords in a caption are not proven to drive Instagram
search, and cost nothing. Searchable phrasing still earns more reliably on TikTok, which states
outright that content-query match dominates its search ranking.

## Hashtags — what each platform says

| Platform | Position |
|---|---|
| **Instagram** | **Hard cap of five per post**, rolling out gradually. Instagram's own wording: "using fewer (up to 5) **more targeted** hashtags, rather than many generic ones, can improve both your content's performance and people's experience." Mosseri, Feb and May 2025: hashtags "don't work" to increase reach and "don't improve visibility" — they label the topic and connect posts |
| **Instagram Search** | Hashtags **are** a named search signal, alongside username and profile name. So they earn in *search*, not in feed reach |
| **TikTok** | Hashtags are named under **content information**, one of the three For You signal groups. No stated optimum count |
| **YouTube** | Tags are "**not important**… primarily used to help correct for common spelling mistakes" |
| **Placement — Instagram** | Verbatim: "**For a post to be found in Search, put keywords and hashtags in the caption, not the comments.**" Hashtags in a comment still add the post to the hashtag page; they do not feed Search |
| **Placement — TikTok** | **No official statement found** (checked 2026-08-25). Secondary sources only — see the note below, which is the one place in this file that is not first-party |

Sources: [Breaking down how Instagram Search works](https://about.instagram.com/blog/announcements/break-down-how-instagram-search-works),
[Instagram hashtag limit and statement](https://www.socialmediatoday.com/news/instagram-implements-new-limits-on-hashtag-use/808309/),
[How TikTok recommends content](https://www.tiktok.com/support/faq_detail?id=7655285288050104852),
[YouTube search and discovery](https://support.google.com/youtube/answer/141805)

**Consequence:** maximizing hashtag count is not available on Instagram and is not supported
anywhere. Targeting is the lever — a hashtag earns its place by naming the topic precisely enough
that someone searching that topic finds it. Five precise tags beat thirty generic ones, and on
Instagram thirty is no longer possible.

**On caption vs. first comment.** The common practice of parking tags in the first comment to keep
the caption clean is answered directly on Instagram: tags in a comment do not feed Search. Since
hashtags earn in search rather than in feed reach — the row above — moving them to a comment
removes the one thing they do. **Put them in the caption.** The first comment is therefore not a
place to hide a tag whose audience cost you did not want to pay: if a tag is not worth a caption
slot, it is not worth using.

**On TikTok this is a judgment call, not doctrine.** No TikTok page states a position either way.
Searched 2026-08-25: `support.tiktok.com`, `newsroom.tiktok.com`, and TikTok's own in-app Discover
pages, which return creator videos rather than documentation.

**The secondary evidence, named as secondary** — this is the only claim in this file not sourced to
a platform-owned page, and it is here because the alternative is a silent gap:

- Marketing publishers state that TikTok's search weights the video description above the comment
  section, so tags in a comment are less effective — e.g. [Sprout Social — TikTok
  hashtags](https://sproutsocial.com/insights/tiktok-hashtags/). **No measurement is offered** by
  any of them: no sample, no method, no comparison. They agree with each other and with Instagram's
  documented position, which is weak evidence of the same kind repeated.
- **What the plugin does with that:** put tags in the caption on TikTok too, and call it a
  convergent judgment call rather than a documented mechanism. Do not tell the creator TikTok
  penalises comment hashtags — no source establishes it.

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
follower views and near-zero For You views is the pattern that should prompt **checking the flag** —
not a conclusion on its own. TikTok's own caution: "If a video isn't getting many views, it also
doesn't necessarily mean it broke a rule."

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

**Do not over-claim the clickbait half.** The guidelines this page links are Facebook News Feed
posts — one on reducing clickbait *headlines*, one on fighting engagement bait *on Facebook*. So
the documented mechanism is about luring a click on a link, scoped to Facebook. **A sensationalist
video hook with no link is not covered by it.** Refusing that hook is this plugin's judgment
(`references/slop-patterns.md` owns it) and must be given as judgment, not as a platform rule. The
repurposed-content row above carries no such caveat — it is stated plainly and applies as written.

## What this file does not tell you

- **Nothing here is real-time.** These are documented mechanisms, not current trends. No platform
  publishes a live ranking feed, and the trending surfaces are unreachable — see
  `references/platform-facts.md`.
- **No weights are published.** Order of listing is the only ranking information given; treat it
  as ordinal, never as a formula.
- **Follower count IS named for Instagram Reels** ("popularity signals such as number of
  followers"), correcting an earlier claim in this file that it was named nowhere. TikTok and
  YouTube do not name it.
