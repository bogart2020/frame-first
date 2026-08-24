# Documented-signal audit — feasibility research, 2026-08-25

Research pass only. No skill was changed. The question: the creator wants a "predictive scan" that says
a post will rank higher organically. That is not buildable. The proposed honest substitute is a
**documented-signal audit** — a pre-publish checklist scoring a post only against things a platform
states *in writing* that it rewards, demotes, or requires, with a per-item citation and an explicit
refusal to predict performance.

**Answer: buildable, and larger than expected.** 31 pre-publish-checkable items reached Confirmed on a
platform-owned page. The hard limit is that no platform publishes weights, so the audit can never
aggregate its rows into a score or an outcome.

Verification environment: Claude Code CLI, macOS 25.6.0. Pages read on **2026-08-25** via WebFetch,
`curl` + local extraction, and an automated browser where both were blocked.

Conventions, matching `research/2026-08-20-hardening.md`:

| Term | Meaning |
|---|---|
| **Confirmed** | An official page owned by the platform states it. URL given, quote verbatim. |
| **Corrected** | Official page contradicts or materially narrows a claim in `references/ranking-signals.md` or `references/platform-facts.md`. |
| **Unverified** | Only secondary sourcing. Do not treat as fact. |
| **Unverified by absence** | Searched the owning domains, found nothing either way. Named domains and date below. |
| **Unreachable** | The owning page exists but returned no text to automated access. Recorded as such. |

Two further column values used only in §2:

| Term | Meaning |
|---|---|
| **Pre-publish** | Checkable from the file, the draft, and the account settings, before anything is posted. The audit can use it. |
| **Post-publish** | Only observable after the post is live. The audit cannot use it, and must not pretend to. |

---

## 1. The negative case, established first

This section exists to stop the feature over-claiming. Every row is a first-party sentence that
undercuts prediction.

**One finding must be stated plainly before the table: no platform publishes an explicit refusal to
disclose ranking weights.** I searched for one and did not find it (domains and date in §7). What
exists instead is *non-guarantee* language, *fluctuation* language, and *ordinal-only* descriptions of
signal importance. That is weaker than a refusal but sufficient — and the audit's disclaimer should be
written from these sentences rather than from a paraphrase of "platforms don't reveal the algorithm",
which no platform says.

| # | Claim the quote supports | Verbatim quote | Source | Verdict / confidence |
|---|---|---|---|---|
| 1 | Eligibility ≠ outcome | "Note that your eligibility for recommendations doesn't guarantee that your content will be recommended." | [help.instagram.com/653964212890722](https://help.instagram.com/653964212890722) | **Confirmed.** High. The single strongest sentence available for this feature. |
| 2 | Reach moves on its own | "Fluctuations in reach are common, but if you're using a Business or Creator Account you can check your Instagram Insights to monitor trends and content performance." | [creators.instagram.com — recommendations eligibility tips](https://creators.instagram.com/blog/instagram-recommendations-eligibility-tips-creators) | **Confirmed.** High. Note the page is dated 2022-08-30, updated 2023-04-25. |
| 3 | Meta's ranking is not one formula | "Because Feed ranking is personalized, the relative impact of each prediction model on Feed will vary depending on the person and the content, since everyone has different preferences about what they like and how they want to interact with content." | [transparency.meta.com — ranking and content](https://transparency.meta.com/features/ranking-and-content/) | **Confirmed.** Medium-high — read via WebFetch, not re-read in a browser. This is the closest any platform comes to saying "there is no fixed weighting". |
| 4 | The signal set itself changes | "We add and remove signals and predictions over time, working to get better at surfacing what you're interested in." | [about.instagram.com — Instagram Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained) | **Confirmed.** Medium-high — WebFetch. |
| 5 | Recommendation is never guaranteed | "However, not all content is guaranteed to be recommended." | [tiktok.com — FYF Eligibility Standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed.** High. |
| 6 | Low views ≠ penalty | "Even if a video doesn't make it to the FYF, people may still find it through search or by going to a creator's account. If a video isn't getting many views, it also doesn't necessarily mean it broke a rule. Creators can check TikTok's analytics to see how their videos are performing, including if there were any made ineligible for recommendation." | [tiktok.com — FYF Eligibility Standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed.** High. Already quoted in `ranking-signals.md`; re-verified today. |
| 7 | Followers are not a TikTok lever | "While a video is likely to receive more views if posted by an account that has more followers, by virtue of that account having built up a larger follower base, neither follower count nor whether the account has had previous high-performing videos are direct factors in the recommendation system." | [newsroom.tiktok.com — How TikTok recommends videos #ForYou](https://newsroom.tiktok.com/en-us/how-tiktok-recommends-videos-for-you) | **Confirmed.** High. |
| 8 | Weights are described ordinally, never numerically | "A strong indicator of interest, such as whether a user finishes watching a longer video from beginning to end, would receive greater weight than a weak indicator, such as whether the video's viewer and creator are both in the same country." | [newsroom.tiktok.com](https://newsroom.tiktok.com/en-us/how-tiktok-recommends-videos-for-you) | **Confirmed.** High. This is the *most* weight information any platform gives, and it is one comparison with no magnitude. It confirms `ranking-signals.md`: ordinal, never a formula. |
| 9 | Format itself is not favoured | "Our system has no opinion about what type of Shorts you make. It also doesn't favor any particular format." | [support.google.com/youtube/answer/11914225 (Shorts)](https://support.google.com/youtube/answer/11914225?hl=en&co=YOUTUBE._YTVideoType%3Dshorts) | **Confirmed.** High. |
| 10 | Outcome depends on other people's uploads | "Even if you have good metrics on your Short, you may get fewer impressions if Shorts from other channels are performing even better." | [support.google.com/youtube/answer/11914225 (Shorts)](https://support.google.com/youtube/answer/11914225?hl=en&co=YOUTUBE._YTVideoType%3Dshorts) | **Confirmed.** High. The decisive one: a variable that does not exist at publish time determines the result. |
| 11 | Viewership swings for many reasons | "There are many reasons for a channel's viewership to increase and decline over time." | [support.google.com/youtube/answer/141805](https://support.google.com/youtube/answer/141805) | **Confirmed.** Medium-high — WebFetch. |
| 12 | Not everything is eligible anywhere | "Not all content is eligible to be recommended on the YouTube Home page." | [support.google.com/youtube/answer/141805](https://support.google.com/youtube/answer/141805) | **Confirmed.** Medium-high — WebFetch. |
| 13 | Optimising for the system is the wrong frame | "Creators often focus on \"the algorithm\" but what matters is what viewers enjoy. Instead of asking, \"Does the algorithm like my content?,\" creators should focus on their \"audience\" and ask, \"Does my audience like this?\"" | [support.google.com/youtube/answer/16533387](https://support.google.com/youtube/answer/16533387?hl=en) | **Confirmed.** High. |
| 14 | Meta demotion strength is not fixed | "Reduced distribution may vary depending on the number of times the poster or commenter has violated our rules previously, the degree of confidence of our systems' predictions, among other things." | [transparency.meta.com — Types of Content We Demote](https://transparency.meta.com/features/approach-to-ranking/types-of-content-we-demote/) | **Confirmed.** High. Even a *confirmed* demotion has no stated magnitude. |

**What the audit is therefore allowed to say.** That a post satisfies or fails N documented conditions.
Nothing about how it will do. Rows 1, 5, 10 and 14 together are the whole argument: eligibility does not
guarantee recommendation, recommendation is not guaranteed at all, the result depends on uploads that do
not exist yet, and even a confirmed demotion has no published size.

---

## 2. Auditable items, per platform

Split hard. Group A is everything the audit may use. Group B is listed only so the audit can refuse it
by name when the creator asks why retention is not scored.

### 2A — Instagram Reels, pre-publish

| # | Item | Verbatim | Source | Verdict |
|---|---|---|---|---|
| 1 | Vertical, no borders, text not majority | "Optimize your video content to be viewed full-screen and vertically. This means using high-resolution, 9 x 16 vertical videos with no borders, where text does not cover the majority of the screen." | [creators.instagram.com](https://creators.instagram.com/blog/instagram-recommendations-eligibility-tips-creators) | **Confirmed** |
| 2 | Length ceiling for recommendation | "Keep it short. In order to be recommended, your content has to be 3 minutes or less." | [creators.instagram.com](https://creators.instagram.com/blog/instagram-recommendations-eligibility-tips-creators) | **Confirmed.** New — not in `ranking-signals.md`. |
| 3 | No watermark, not blurry | "Avoid visibly recycled content. Don't post reels that contain watermarks, that are blurry or otherwise low quality." | [creators.instagram.com](https://creators.instagram.com/blog/instagram-recommendations-eligibility-tips-creators) | **Confirmed** |
| 4 | Originality | "Post original content: This includes content you filmed yourself or content that hasn't been posted on Instagram before." | [creators.instagram.com](https://creators.instagram.com/blog/instagram-recommendations-eligibility-tips-creators) | **Confirmed** |
| 5 | The made-less-visible list | "We aim to make certain reels less visible for other reasons, such as low-resolution or watermarked reels, reels that are muted or contain borders, reels that are majority text, or reels that have already been posted on Instagram." | [about.instagram.com](https://about.instagram.com/blog/announcements/instagram-ranking-explained) | **Confirmed.** Six separate checks in one sentence — resolution, watermark, muted, borders, majority text, duplicate. |
| 6 | Minimum spec | "Reels should have a minimum frame rate of 30 FPS (frames per second) and minimum resolution of 720 pixels." | [help.instagram.com/1038071743007909](https://help.instagram.com/1038071743007909) | **Confirmed — and re-sourced.** See §6, correction 1. |
| 7 | Aspect-ratio envelope | "You can upload a reel with an aspect ratio between 1.91:1 and 9:16." | [help.instagram.com/1038071743007909](https://help.instagram.com/1038071743007909) | **Confirmed** |
| 8 | Hashtag hard cap | "You can use up to 5 tags on a post. If you include more than 5 tags on a single photo/video, your comment won't post." | [help.instagram.com/351460621611097](https://help.instagram.com/351460621611097) | **Confirmed — upgraded from secondary.** See §6, correction 2. This is a **publish failure**, not a ranking effect. |
| 9 | Hashtag placement | "To have your post found in Search, put these keywords and hashtags in the caption, not the comments." | [creators.instagram.com](https://creators.instagram.com/blog/instagram-recommendations-eligibility-tips-creators) | **Confirmed** |
| 10 | Caption must relate to the video | "Long captions unrelated to the underlying content and coordinated comment networks intended to artificially drive engagement and distribution." — listed under content "that is low-quality or associated with low-quality publishing" and so may not be eligible for recommendation | [help.instagram.com/313829416281232](https://help.instagram.com/313829416281232) | **Confirmed.** New — not in `ranking-signals.md`. Fully checkable from the draft. |
| 11 | Unoriginality, as a recommendation guideline | "Unoriginal content that is largely repurposed from another source with only minor, immaterial edits, without adding material value." | [help.instagram.com/313829416281232](https://help.instagram.com/313829416281232) | **Confirmed** |
| 12 | Account must be public | "We only recommend content from public accounts, so make sure your account is set accordingly." | [creators.instagram.com](https://creators.instagram.com/blog/instagram-recommendations-eligibility-tips-creators) | **Confirmed** |
| 13 | Search-relevant text placement | "Get discovered via Search: Search results are matched by text, so make sure you're including relevant keywords." — with handle, profile name, bio and caption named | [creators.instagram.com](https://creators.instagram.com/blog/instagram-recommendations-eligibility-tips-creators) | **Confirmed.** Note the standing conflict with the transparency page recorded in `ranking-signals.md` — unchanged today. |

### 2B — TikTok, pre-publish

| # | Item | Verbatim | Source | Verdict |
|---|---|---|---|---|
| 14 | Someone else's watermark or logo | "Reused or unoriginal content posted without creative edits, such as clips that show someone else's watermark or logo" | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| 15 | Minimally edited / GIF-only | "Low-quality or minimally edited content, such as short clips made from GIFs only" | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| 16 | Reuse without addition | "Content is also ineligible for the FYF if it includes unoriginal or reused material without anything new." | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| 17 | AI / significant-edit disclosure | "You must label content that uses AI or includes significant edits to show realistic-looking people or scenes. You can add your own clear caption, sticker, or watermark. For AI-generated content, you can also use our AIGC label." | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| 18 | Duplicates are not recommended | "We also don't recommend duplicated content, content you've already seen before, or any content that's considered spam." | [newsroom.tiktok.com](https://newsroom.tiktok.com/en-us/how-tiktok-recommends-videos-for-you) | **Confirmed** |
| 19 | Engagement-manipulation phrasing in the copy | "Misleading claims meant to boost views or popularity" and "\"Like-for-like\" promises", both under content that "isn't eligible for the FYF" | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| 20 | Undisclosed commercial content | "If we find commercial content that hasn't been properly disclosed, we may apply the content disclosure setting or remove it from the FYF." | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| 21 | The metadata TikTok says it reads | "Video information, which might include details like captions, sounds, and hashtags." | [newsroom.tiktok.com](https://newsroom.tiktok.com/en-us/how-tiktok-recommends-videos-for-you) | **Confirmed.** Presence-checkable only. No stated optimum for any of the three. |
| 22 | Caption cap when scheduled through the API | "The maximum length is 2200 in UTF-16 runes" | [developers.tiktok.com — Direct Post](https://developers.tiktok.com/doc/content-posting-api-reference-direct-post/) | **Confirmed** (carried from `platform-facts.md`, verified 2026-08-25 in that file's own pass) |

**No TikTok page states a resolution, frame-rate, aspect-ratio, or duration minimum for FYF
eligibility.** Searched today — domains in §7. **Unverified by absence.** The audit must say so rather
than borrowing Instagram's numbers.

### 2C — YouTube Shorts, pre-publish

| # | Item | Verbatim | Source | Verdict |
|---|---|---|---|---|
| 23 | What makes an upload a Short | "Any videos uploaded on or after this date with a square or vertical aspect ratio up to three minutes in length will be categorized as Shorts" — effective October 15, 2024 | [support.google.com/youtube/answer/15424877](https://support.google.com/youtube/answer/15424877?hl=en) | **Confirmed.** Matches `platform-facts.md`. |
| 24 | The Content ID trap | "Any Short that is over one minute in duration with an active copyright claim of any type, including manual claims, will be blocked globally on YouTube." | [support.google.com/youtube/answer/15424877](https://support.google.com/youtube/answer/15424877?hl=en) | **Confirmed — and broader than the file says.** See §6, correction 5. |
| 25 | Title and description carry search | "How well the title, description, and video content match the viewer's search." | [support.google.com/youtube/answer/141805](https://support.google.com/youtube/answer/141805) | **Confirmed** |
| 26 | Shorts search reads metadata | "These factors include how well the metadata matches the viewers' search and whether or not the viewers click and watch the content." | [support.google.com/youtube/answer/11914225 (Shorts)](https://support.google.com/youtube/answer/11914225?hl=en&co=YOUTUBE._YTVideoType%3Dshorts) | **Confirmed** |
| 27 | Tags are near-worthless | "Not important. Tags are primarily used to help correct for common spelling mistakes." | [support.google.com/youtube/answer/141805](https://support.google.com/youtube/answer/141805) | **Confirmed** |
| 28 | Audio-library sounds reach the sounds page | "Creators leaning into trends that feature popular sounds can increase their chances of appearing on sounds pages by using sounds from the Audio Library." | [support.google.com/youtube/answer/11914225 (Shorts)](https://support.google.com/youtube/answer/11914225?hl=en&co=YOUTUBE._YTVideoType%3Dshorts) | **Confirmed.** Note it says "chances of appearing on sounds pages" — a surface, not a ranking boost. |

### 2D — Facebook, pre-publish

| # | Item | Verbatim | Source | Verdict |
|---|---|---|---|---|
| 29 | The four things to avoid | "Avoid posting Reels that are: Blurry due to low-resolution. Visibly recycled from other apps (i.e. contains watermarks). Uploaded with a border around it. Horizontal (this video format is typically not as easy to recreate)." | [facebook.com/business/help/1708053352711643](https://www.facebook.com/business/help/1708053352711643) | **Confirmed.** Not in `ranking-signals.md` at all. |
| 30 | And what it costs | "For the best results, avoid low video quality reels or content that is visibly recycled from other apps. This kind of low quality content makes the Reels experience less satisfying for audiences and will be less discoverable on the Facebook app." | [facebook.com/business/help/1708053352711643](https://www.facebook.com/business/help/1708053352711643) | **Confirmed** |
| 31 | Technical recommendation | "Recommended format: .mp4", "Recommended resolution: 1080p", "Recommended video codec: H.264, H.265", "Recommended frame rate: 24FPS - 60FPS" | [facebook.com/business/help/1197310377458196](https://www.facebook.com/business/help/1197310377458196) | **Confirmed.** Worded as *recommended*, never as a minimum. The audit must keep that distinction. |
| 32 | The exhaustive unoriginality list | "There are 2 major behaviors that can lead to limited originality flags for your content, Page, or profile: Duplicating content… Minor editorialization… Examples of minor changes include: Superimposing borders / Inserting logos or graphics, including watermarks / Adding only an on-screen text caption or title / Adding background music / Changing a video's speed / Adding subtitle transcripts / Simply describing (in text, on-screen, via voiceover or in the description) what happens in a photo or video with no other meaningful additions / Reaction videos that merely involve watching along or voiceover without added commentary, information, insights, or perspective… / Basic compilations… / Inserting an intro or outro without meaningful changes…" | [facebook.com/business/help/262834734651607](https://www.facebook.com/business/help/262834734651607) | **Confirmed.** The single richest pre-publish list found anywhere. Ten named, checkable behaviours. |
| 33 | And the consequence | "Third-party content that is posted without substantial changes is considered unoriginal and will receive reduced distribution. Posting unoriginal content violates Meta's terms and Partner Monetization Policies and may also lead to additional enforcement actions such as limited or loss of recommendations and monetization abilities." | [facebook.com/business/help/262834734651607](https://www.facebook.com/business/help/262834734651607) | **Confirmed** |

Item 32 is the strongest argument that the audit is worth building. It is the only place any platform
enumerates what "not original enough" concretely means, and every one of the ten is visible in the file
before it is posted.

### 2E — Post-publish only. The audit must refuse these by name.

| Signal | Verbatim | Source |
|---|---|---|
| Reshare, watch-through, like, audio-page visit | "how likely you are to reshare a reel, watch a reel all the way through, like it, and go to the audio page" | [about.instagram.com](https://about.instagram.com/blog/announcements/instagram-ranking-explained) |
| Speed and volume of engagement | "how many and how quickly other people are liking, commenting, sharing and saving a post" | [creators.instagram.com](https://creators.instagram.com/blog/instagram-recommendations-eligibility-tips-creators) |
| Watch completion | "How long you watched a video for, and whether you finished it or moved on to another before it's complete" | [tiktok.com/safety — Making your feed For You](https://www.tiktok.com/safety/en/tools-and-guides/making-your-feed-for-you) |
| Shorts performance triad | "Our systems use the signals for % of viewers who chose to view, avg. view duration and avg. % viewed to inform ranking." | [support.google.com/youtube/answer/11914225 (Shorts)](https://support.google.com/youtube/answer/11914225?hl=en&co=YOUTUBE._YTVideoType%3Dshorts) |
| Post-watch surveys | "we look at whether or not viewers enjoyed the Short using likes and post-watch survey results" | [support.google.com/youtube/answer/11914225 (Shorts)](https://support.google.com/youtube/answer/11914225?hl=en&co=YOUTUBE._YTVideoType%3Dshorts) |
| Relative vs absolute watch time | "Relative watch time is more important for short videos and absolute watch time is more important for longer videos." | [support.google.com/youtube/answer/141805](https://support.google.com/youtube/answer/141805) |
| Competition from other channels | Row 10, §1 | — |

Every named top-ranked signal on Instagram and every performance signal on YouTube Shorts falls in this
group. **That is the honest headline: the things platforms say matter most are exactly the things a
pre-publish audit cannot see.** The audit checks the floor, not the ceiling.

---

## 3. Eligibility and account-level gates

These override every item in §2. A post that passes all 33 checks still goes nowhere if the account is
not recommendable.

| Platform | Gate | Verbatim | Source | Verdict |
|---|---|---|---|---|
| Instagram | Account Status is the authority | "Our Recommendations Guidelines help us decide what content from public accounts is eligible to be recommended on Instagram. If you're using a professional account, you can see if your content may be eligible to be recommended in Account Status." | [help.instagram.com/653964212890722](https://help.instagram.com/653964212890722) | **Confirmed** |
| Instagram | Account-level ban outranks per-post quality | "If your account is not eligible to be recommended, none of your content will be recommended regardless of whether or not all of your content goes against our Recommendations Guidelines." | [help.instagram.com/653964212890722](https://help.instagram.com/653964212890722) | **Confirmed.** Decisive: this is why the audit must open by asking the creator to read Account Status, not by scoring a caption. |
| Instagram | Profile text counts | "See if something in your profile (like your profile photo or bio) goes against our Recommendations Guidelines." | [help.instagram.com/653964212890722](https://help.instagram.com/653964212890722) | **Confirmed** |
| Instagram | Repeat behaviour escalates | "if you repeatedly post content that goes against our Recommendation Guidelines or have something in your profile (like your profile photo or bio) that goes against our Recommendation Guidelines, your entire account may become ineligible for recommendation, and none of your content will be recommended for a period of time" | [creators.instagram.com](https://creators.instagram.com/blog/instagram-recommendations-eligibility-tips-creators) | **Confirmed** |
| Instagram | Followers still see it | "Even if you're not eligible to be recommended, your content can still show up for your followers." | [help.instagram.com/653964212890722](https://help.instagram.com/653964212890722) | **Confirmed.** The pattern to teach: normal follower reach, near-zero non-follower reach. |
| TikTok | FYF ineligibility is the named mechanism | "When we identify content that falls under the \"FYF Ineligible\" standards in our Community Guidelines, it won't be recommended in the FYF." | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| TikTok | It can go account-wide | "In those cases, we may make the account and its content ineligible for the FYF and harder to find." | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| TikTok | And restrict search placement | "Restrict your account, which could include limiting your ability to post new content, appear in top search results, or in the FYF" | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| TikTok | Freshly uploaded content is temporarily out | "videos that have just been uploaded or are under review, and spam content such as videos seeking to artificially increase traffic, also may be ineligible for recommendation into anyone's For You feed" | [newsroom.tiktok.com](https://newsroom.tiktok.com/en-us/how-tiktok-recommends-videos-for-you) | **Confirmed.** Explains the "first hour looks dead" panic without inventing a mechanism. |
| TikTok | Where the creator checks | "Creators can check TikTok's analytics to see how their videos are performing, including if there were any made ineligible for recommendation." | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| YouTube | Shorts + claim = blocked and demonetized | "Any Short that is over one minute in duration with an active copyright claim of any type, including manual claims, will be blocked globally on YouTube." | [support.google.com/youtube/answer/15424877](https://support.google.com/youtube/answer/15424877?hl=en) | **Confirmed** |
| YouTube | Monetization requires policy compliance channel-wide | Channel monetization policies bar "inauthentic content" and "reused content"; content should "Not be mass-produced, generic, repetitive, or manipulative" | [support.google.com/youtube/answer/1311392](https://support.google.com/youtube/answer/1311392?hl=en) | **Confirmed in substance.** WebFetch truncated one sentence mid-quote — see §7. Re-read before quoting in a shipped workflow. |
| YouTube | Recommendation is not universal | "Not all content is eligible to be recommended on the YouTube Home page." | [support.google.com/youtube/answer/141805](https://support.google.com/youtube/answer/141805) | **Confirmed** |
| Facebook | Originality flags hit the Page, not just the post | "can lead to limited originality flags for your content, Page, or profile" | [facebook.com/business/help/262834734651607](https://www.facebook.com/business/help/262834734651607) | **Confirmed** |

---

## 4. Demotion triggers stated in writing

| Platform | Trigger | Verbatim | Source | Verdict |
|---|---|---|---|---|
| Meta | Direct-feedback demotions | "Low-quality content, such as clickbait and engagement bait." · "Links to websites that are covered with ads, slow to load or broken." · "Low-quality comments that are repeatedly copied and pasted." | [transparency.meta.com — Reducing distribution](https://transparency.meta.com/enforcement/taking-action/lowering-distribution-of-problematic-content/) (updated Apr 25, 2025) | **Confirmed**, verbatim, browser-read with the accordions expanded |
| Meta | Publisher-incentive demotions | "Limited originality content that is principally repurposed from other sources." · "Low-quality videos that abuse video or live video formats." · "Misinformation." | same | **Confirmed** |
| Meta | Safety demotions | "Content by creators that repeatedly violate our policies." | same | **Confirmed** |
| Meta | What engagement bait *is* | "Posts that explicitly request engagement (such as votes, shares, comments, tags, likes, or other reactions) for purposes other than a specific call to action (such as seeking help to find missing people or property, raising money, or sharing a petition) on Facebook." | [transparency.meta.com — Engagement Bait](https://transparency.meta.com/features/approach-to-ranking/content-distribution-guidelines/engagement-bait/) | **Confirmed — and narrower than assumed.** Scoped explicitly "on Facebook". See §5. |
| Meta | What clickbait *is* | "Posts that lure people into clicking on an included link by creating misleading expectations about the post or article's content. Some of the ways this can be done are by withholding information or using sensationalist phrasing (such as \"You won't believe...\" or \"You'll never guess…\") and the use of punctuation (such as all capital letters and excessive exclamation marks)." | [transparency.meta.com — Clickbait Links](https://transparency.meta.com/features/approach-to-ranking/content-distribution-guidelines/clickbait-links/) | **Confirmed — and it is about links.** The guideline is titled "Clickbait Links" and defines the harm as luring a click on "an included link". See §5. |
| Meta | Borderline content is personalized down | "we use personalization to reduce the distribution of content that doesn't violate our policies but may get close" | [transparency.meta.com — Types of Content We Demote](https://transparency.meta.com/features/approach-to-ranking/types-of-content-we-demote/) (updated Jul 2, 2025) | **Confirmed** |
| Instagram | Low-quality publishing, as a recommendation guideline | "Unoriginal content that is largely repurposed from another source with only minor, immaterial edits, without adding material value." · "Long captions unrelated to the underlying content and coordinated comment networks intended to artificially drive engagement and distribution." | [help.instagram.com/313829416281232](https://help.instagram.com/313829416281232) | **Confirmed** |
| Instagram | Follow-buying hits the account | "Repeatedly engaged in misleading practices to build followings, such as purchasing 'likes'." | [help.instagram.com/313829416281232](https://help.instagram.com/313829416281232) | **Confirmed** |
| TikTok | Watermarked / reused / GIF-only | Items 14–16, §2B | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| TikTok | Inflated-metric content | "If we detect accounts or content with inauthentic metrics, we'll remove fake likes, followers, or other inflated signals. Content that tries to manipulate people into giving gifts or inflating likes or follows isn't eligible for the FYF." | [tiktok.com — FYF standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | **Confirmed** |
| Facebook | Unoriginal → reduced distribution | Item 33, §2D | [facebook.com/business/help/262834734651607](https://www.facebook.com/business/help/262834734651607) | **Confirmed** |
| YouTube | Inauthentic / reused content → demonetized | §3 | [support.google.com/youtube/answer/1311392](https://support.google.com/youtube/answer/1311392?hl=en) | **Confirmed in substance** |

**A caveat the audit must carry: none of these state a magnitude.** Every demotion is qualitative
("reduced", "less discoverable", "ineligible"), and Meta says outright that the reduction varies (§1
row 14). The audit reports "this is named as demoted", never "this will cost you X%".

---

## 5. What must NOT be in the audit

| Forbidden | Why it fails |
|---|---|
| **A numeric score, out of 10 or 100** | Requires weights. No platform publishes any. The only weight statement found anywhere is TikTok's single ordinal comparison (§1 row 8). A score would be a number the plugin invented, which is exactly what `CLAUDE.md` forbids — and `ff-critique` already rejects scores on independent grounds. |
| **A weighted formula, or any per-item point value** | Same reason. Also, Meta states the relative impact varies by person and content (§1 row 3), so even a correct weighting would not be a constant. |
| **A predicted view count, reach estimate, or range** | Directly refuted: eligibility "doesn't guarantee" recommendation (§1 row 1), and impressions depend on how *other channels'* uploads perform (§1 row 10) — data that does not exist at publish time. |
| **"Post at 7pm" or any timing claim** | Refuted verbatim by YouTube: "The algorithm aims to deliver the right content to viewers whenever they visit YouTube, regardless of upload time. While publishing when your audience is most active might lead to more immediate views, we haven't observed any evidence it affects long-term viewership. This is to say, that publish time is not known to impact a video's long-term performance." ([support.google.com/youtube/answer/16533387](https://support.google.com/youtube/answer/16533387?hl=en)). **The nuance that must survive:** TikTok *does* list "the time it was posted" among factors it assesses ([tiktok.com/safety](https://www.tiktok.com/safety/en/tools-and-guides/making-your-feed-for-you)) and says it is "Prioritizing recent content over older content" — but names no hour, no direction beyond recency, and no magnitude. So the honest position is *recency is named; a clock time is not*, and one platform says publish time does not affect long-term performance at all. |
| **A posting-cadence rule ("3× a week")** | Refuted verbatim: "There is no minimum posting cadence required for your videos to perform well." ([support.google.com/youtube/answer/11914225](https://support.google.com/youtube/answer/11914225?hl=en&co=YOUTUBE._YTVideoType%3Dshorts)). Also "the algorithm doesn't penalize creators for" taking breaks ([16533387](https://support.google.com/youtube/answer/16533387?hl=en)). |
| **A follower-count threshold** | Refuted for TikTok verbatim (§1 row 7). Instagram is the opposite — it names "popularity signals such as number of followers" for Reels — so a cross-platform threshold contradicts a platform no matter which way it is written. |
| **"Your hook is clickbait, Meta will demote it"** | Meta's guideline is titled **Clickbait Links** and defines the harm as luring a click on "an included link". A sensationalist *video hook* with no link is not covered by that guideline. Saying otherwise is over-claiming a real policy — the worst kind of error here, because it sounds sourced. |
| **"Engagement bait is demoted on Instagram"** | The Engagement Bait guideline says "on Facebook". Instagram's route to the same outcome is different — via the Recommendations Guidelines' "coordinated comment networks intended to artificially drive engagement" — and is narrower. Cite the right one per platform. |
| **Anything sourced only to an SEO blog** | The repo rule. See the named cases below. |

### Claims encountered that look authoritative and are not

| Claim | Where it came from | Status |
|---|---|---|
| **"Low reach does not necessarily indicate a penalty"**, attributed to Instagram | Produced by an automated page-summarizer while reading `creators.instagram.com`. A targeted re-read for the strings "penalty" and "penalize" returned **NOT PRESENT**. | **Fabricated.** The page says only "Fluctuations in reach are common". Do not attribute the stronger sentence to Instagram. This is the exact failure the audit is meant to prevent, and it happened during this research. |
| **"Videos uploaded on or after December 8, 2025 … will be categorized as Shorts"** | A web-search result summary. Reading the page itself gives **October 15, 2024**. | **Wrong date.** `platform-facts.md` is correct. |
| **TikTok native-app caption cap of 4,000 characters** | Widely repeated, no TikTok-owned page | **Unverified**, unchanged from `platform-facts.md` |
| **The caption "fold" at ~125 characters** | Widely repeated, no Meta or TikTok page | **Unverified**, unchanged |
| **TikTok penalises hashtags in the first comment** | Marketing publishers only | **Unverified**, unchanged. `ranking-signals.md` already labels this correctly. |
| **A "shadowban" as a named platform state** | Not used by any platform read today | **Unverified by absence.** The documented states are "ineligible for the FYF" (TikTok) and "not eligible to be recommended" (Instagram). Use those words. |

---

## 6. Contradictions and changes since 2026-08-20

| # | Finding | Direction |
|---|---|---|
| 1 | `ranking-signals.md` attributes **"720 pixels, 30 FPS"** and the in-app path *Menu → Your app and media → Media quality → Upload at highest quality* to [Instagram Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained). A targeted string search of that page returns **NOT PRESENT** for "720", "FPS", "frames per second", "resolution", "highest quality" and "Media quality". The claim is **true** and lives at [help.instagram.com/1038071743007909](https://help.instagram.com/1038071743007909) — "Reels should have a minimum frame rate of 30 FPS (frames per second) and minimum resolution of 720 pixels", plus the exact menu path. | **Correction — citation only.** The fact stands; the URL beside it does not support it. |
| 2 | `ranking-signals.md` sources the **five-hashtag cap** to socialmediatoday, the one secondary citation `CLAUDE.md` flags. Instagram's own Help Center now states it: "You can use up to 5 tags on a post. If you include more than 5 tags on a single photo/video, your comment won't post." ([help.instagram.com/351460621611097](https://help.instagram.com/351460621611097)) | **Upgrade: secondary → Confirmed first-party.** Also reframes it: exceeding the cap is a **publish failure**, not a ranking effect. |
| 3 | **Two first-party Meta pages disagree on the hashtag cap.** The developer reference still states "Maximum 2200 characters, 30 hashtags, and 20 @ tags" ([developers.facebook.com — IG User Media](https://developers.facebook.com/docs/instagram-platform/instagram-graph-api/reference/ig-user/media/)), while the Help Center says 5. | **New contradiction, both first-party.** Record both, as `ranking-signals.md` already does for the Search-signals disagreement. Operationally: write to 5. |
| 4 | Meta's **"Types of Content We Demote"** page (updated Jul 2, 2025) now lists only four categories — Clickbait Links, Engagement Bait, Fact-Checked Misinformation, Content Likely Violating Our Community Standards. The repurposed-content and low-quality-video demotions are **absent from it**, though they remain on the "Reducing distribution" page (updated Apr 25, 2025), which is the page `ranking-signals.md` cites. | **No change needed — but worth recording.** The cited page still carries the claim. Two Meta pages now describe the demotion set differently; re-check the Apr 25 page before the next pass. |
| 5 | `platform-facts.md` quotes the Shorts block as applying to "an active **Content ID** claim". The page now reads "an active **copyright claim of any type, including manual claims**". | **Broader than recorded.** Same conclusion, wider trigger. |
| 6 | **Facebook merged Videos into Reels.** "In June 2025, the Videos tab on Facebook was renamed to the Reels tab. All videos posted to Facebook are now shared as reels to simplify the way creators produce and share video content on the platform. Reels can be any length or orientation." ([facebook.com/business/help/1197310377458196](https://www.facebook.com/business/help/1197310377458196)) | **New.** Neither reference file mentions it. Note the internal tension: the same site tells creators to avoid horizontal video in Reels while saying Reels can be any orientation. |
| 7 | TikTok's follower-count position is stronger than "not named": it is **explicitly denied** as a direct factor (§1 row 7). `ranking-signals.md` currently says only that TikTok and YouTube "do not name it". | **Upgrade: absence → explicit denial.** |
| 8 | New Instagram items with no entry in `ranking-signals.md`: the **3-minute recommendation ceiling**, the **9:16 / no-borders / text-not-majority** creator guidance, and **"Long captions unrelated to the underlying content"** as a low-quality signal. | **New, all Confirmed.** |
| 9 | New Facebook items with no entry anywhere in the plugin: the four-item avoid list, the recommended tech spec, and the ten-behaviour **minor-editorialization** list. | **New, all Confirmed.** Facebook is currently the least-documented platform in the plugin and the best-documented on this particular question. |
| 10 | YouTube's **publish-time** and **posting-cadence** statements (§5) are new and are the cleanest first-party refutations of two common creator myths found in this pass. | **New, Confirmed.** |

---

## 7. Search log — what was searched, and what returned nothing

All on **2026-08-25**.

**Unreachable to automated access:**

- `support.tiktok.com/en/using-tiktok/growing-your-audience/my-videos-arent-getting-views` — returned HTTP 200 with an empty DOM to `curl` and to an automated browser after a 3-second wait. **Unreachable.** The equivalent statement was recovered from `tiktok.com/community-guidelines/en/fyf-standards` instead.
- `tiktok.com/support/faq_detail?id=…` — client-rendered from an internal API; no text in the served HTML. **Unreachable.** `ranking-signals.md`'s TikTok signal-group rows could not be re-verified at that URL today; they were corroborated instead at `newsroom.tiktok.com` and `tiktok.com/safety`, which state the same three groups in different words.
- `transparency.meta.com` and `facebook.com/business/help` return HTTP 400 to `curl`; both were read successfully in an automated browser.
- `help.instagram.com` returns HTTP 400 to `curl` and an empty body to WebFetch; read successfully in an automated browser.

**Unverified by absence** — searched, nothing found either way:

| Question | Domains searched | Result |
|---|---|---|
| Does any platform explicitly state it will not publish ranking weights? | about.instagram.com, help.instagram.com, transparency.meta.com, tiktok.com, newsroom.tiktok.com, support.google.com/youtube | **Nothing found.** No refusal-to-disclose sentence exists. The negative case rests on non-guarantee and fluctuation language instead. Say it that way. |
| Does TikTok document a minimum resolution, frame rate, aspect ratio or duration for FYF eligibility? | tiktok.com (community-guidelines, safety, creator-academy, support), newsroom.tiktok.com, developers.tiktok.com | **Nothing found.** Do not import Instagram's numbers. |
| Does TikTok state an optimum hashtag count, or a position on hashtags in the first comment? | same | **Nothing found.** Unchanged from `ranking-signals.md`. |
| Does TikTok document QR codes, on-screen-text density, or muted audio as FYF-ineligible? | tiktok.com/community-guidelines (full page text extracted and grepped) | **Nothing found.** The only quality items are the GIF-only clip and the third-party watermark. |
| Does any platform document where the caption fold falls? | help.instagram.com, about.instagram.com, creators.instagram.com, developers.facebook.com, tiktok.com | **Nothing found.** Unchanged from `platform-facts.md`. |

**Read but not fully verbatim-captured** — flag before shipping any quote from it:

- `support.google.com/youtube/answer/1311392` (channel monetization policies). Read via WebFetch, which truncated the key sentence mid-word: "Not be mass-produced, generic, repetitive, or manipulative. It should be made for the enjoyme…". The substance is Confirmed; the full sentence must be re-read in a browser before it is quoted in a shipped workflow.
- `transparency.meta.com/features/ranking-and-content/` and `about.instagram.com/blog/announcements/instagram-ranking-explained` were read via WebFetch only, with targeted string checks. Confidence medium-high, not high.

---

## 8. Recommendation

### Where it goes: a new workflow file, `workflows/ff-audit.md`

Not a step inside `ff-package`, and not new tiers inside `ff-critique`.

**Why not `ff-critique`.** As of today the on-disk file carries **8 Showstoppers and 7 Gaps** (self-reference was promoted to Showstopper #8 since the brief was written). §2 yields 33 checkable items. Folding even the platform-specific subset in would roughly double the gate and break the property its own doctrine names: *"Once a gate blocks work that turns out to be fine, it stops being read, and a gate nobody reads is worse than no gate."* Beyond size, the two are different instruments:

| | `ff-critique` | `ff-audit` |
|---|---|---|
| Input | the draft text | the video file, its metadata, and account settings |
| Authority | the creator's own record — voice, deny-list, rejected approaches | a platform-owned page, cited per row |
| Failure mode it prevents | slop under the creator's name | a post that is ineligible or demoted for a documented, fixable reason |
| Verdict | one ternary judgment on the whole | per-item, independent, never aggregated |
| Can it be argued with? | no — it holds against pressure | yes — the creator can say "the file is 9:16, you can't see it", and the row becomes **Can't verify** |

That last row is decisive. `ff-critique` must not be talked out of a verdict. `ff-audit` must be, constantly, because the agent cannot open the video file. Putting a check that yields to the creator's word inside a gate that must not yield teaches the gate to yield.

**Why not a step inside `ff-package`.** `ff-package` writes words. Half these items are about the file — borders, watermark, resolution, muting, aspect ratio, duration — and are unknown at drafting time. Bolting a 33-row file check onto the drafting workflow re-creates the toll that `CLAUDE.md` records as having killed `ff-init`: work demanded before the creator has the thing being asked about.

**Wiring.** Three edits, all one line:

1. `ff-package` — add `ff-audit` to the `✅ Done when` chain, after the `ff-critique` verdict.
2. `ff-critique` — under **Nice-to-haves**, redirect "hashtag choice" to `ff-audit`, since the Instagram five-tag cap is now first-party and is a publish failure (§6, item 2), not a matter of taste. This is the one place the two overlap, and it should live in exactly one of them.
3. `SKILL.md` router — one row, triggered by *"is this ready to post"*, *"will this get reach"*, *"why did this flop"*, *"check this before I post"*. The reach question is the one that matters: it is the request this feature exists to redirect.

The router's shared vocabulary rule holds — `ff-audit` uses SHIP/FIX/KILL nowhere and defines nothing.

### Output shape

Per platform, one table. No total, no score, no aggregate verdict.

| Verdict | Meaning |
|---|---|
| **Pass** | The documented condition is met, on the creator's statement or on something visible in the draft. |
| **Fail** | The documented condition is not met. The row names what to change. |
| **Can't verify** | The agent cannot see the file. The creator checks it. **This is the expected value for most file-level rows and must never be silently rendered as Pass.** |
| **Not documented** | The creator asked about something no platform states. Named, cited as absent, and left. |

```
INSTAGRAM — 13 documented conditions

  Fail (2)
    Borders            Reel has letterboxing top and bottom.
                       "reels that ... contain borders" — made less visible.
                       about.instagram.com/blog/announcements/instagram-ranking-explained
    Hashtag count      7 tags in the caption; the cap is 5.
                       "If you include more than 5 tags on a single photo/video,
                       your comment won't post." — help.instagram.com/351460621611097
                       This one does not reduce reach. It stops the post.

  Can't verify (4)    Resolution ≥720px · 30 FPS · audio not muted ·
                      not previously posted to Instagram
                      I can't open the file. Check these yourself.

  Pass (6)            9:16 · under 3 minutes · text under half the frame ·
                      no third-party watermark · tags in caption not comments ·
                      account public

  Not documented (1)  You asked about posting time. Instagram documents nothing
                      about it. TikTok names "the time it was posted" as a
                      factor with no direction or magnitude; YouTube states
                      publish time "is not known to impact a video's long-term
                      performance." No platform names an hour.

  Account gate        Not checkable from here. Open Settings → Account →
                      Account Status. If your account is not eligible to be
                      recommended, "none of your content will be recommended
                      regardless" — and nothing above matters until it is fixed.
                      help.instagram.com/653964212890722
```

And a fixed closing line, non-negotiable, on every run:

> This is not a prediction. It checks 13 conditions Instagram states in writing. It does not
> estimate reach and cannot: Instagram says eligibility "doesn't guarantee that your content will
> be recommended", and YouTube notes you can get fewer impressions purely because other people's
> uploads performed better. The signals the platforms rank hardest on — reshares, watch-through,
> completion — do not exist until the post is live.

### Three rules that keep it honest

1. **Every row carries a URL, or the row does not exist.** A check with no citation is the predictive scan wearing a costume.
2. **Nothing aggregates.** No total, no percentage, no "8 of 13". A count invites the creator to read it as a score, and a score implies weights that no platform publishes.
3. **"Can't verify" is a first-class outcome, and on most runs the largest bucket.** Rendering it as Pass would make the audit lie in exactly the direction the creator wants — which is how it would happen.

### Honest assessment

The strongest material is Facebook's ten-behaviour minor-editorialization list, Instagram's
made-less-visible sentence (six checks in one line), and the fact that both platforms publish an
account-level eligibility surface the creator can open. The hardest limitation is structural and
unfixable: everything the platforms say ranks hardest is post-publish, so this audit checks the floor
and can never speak to the ceiling. It is worth building anyway — a post that is borderless, unmuted,
9:16, unwatermarked, under three minutes and posted from a recommendable account has cleared every
documented obstacle, and that is a real and previously unstated deliverable. It is just not a
prediction, and the workflow should say so in the same breath it hands over the table.
