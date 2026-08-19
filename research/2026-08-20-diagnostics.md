# Diagnostic-table research — 2026-08-20

Research pass only. No skill was changed. Audit target: the `## Diagnose: metric → controllable`
table in `skills/ff-strategy/SKILL.md`, which currently claims its rows are "documented platform
mechanisms, not inference." That claim is **half true**, and the file below separates the halves.

Every page cited was re-fetched **2026-08-20**. Meta and TikTok help pages are JS-rendered and
return an empty shell to `curl` and to plain fetching; all quotes below were read out of a
headless browser (`document.body.innerText`), which is why the previous pass's coverage of
analytics surfaces was thin.

Conventions, extending the ones in `2026-08-20-hardening.md`:

| Term | Meaning |
|---|---|
| **Documented** | A platform-owned page states the causal claim, not merely the underlying signal. URL given. |
| **Partly documented** | The signal is documented; the *diagnostic step* is a short, defensible hop from it. Label the hop. |
| **Third-party supported** | Large-N study with stated sample and method. Correlational. Never promoted to fact. |
| **Inference** | Plausible, no source. Must be labelled a heuristic in the skill, not deleted. |
| **Metric defect** | The row names a number the platform does not report under that name. |

---

## 1. Row-by-row verdict

| # | Row's causal claim | Verdict | Source | What the wording should be |
|---|---|---|---|---|
| 1 | Low watch-through, reach normal → **first seconds / hook / length** | **Documented** for hook; **Inference** for length; **Metric defect** on both "watch-through" and "reach" | TikTok Creator Academy, [Using analytics as a tool to improve video performance](https://www.tiktok.com/creator-academy/en/article/analytics-tool-video-performance) (last updated 2026-08-19): "if the retention rate shows that most of your viewers stopped watching at 00:02, rewatch your video to see what could be going on in that moment, like: **Are you missing a hook?** Is it a messy edit? Is something possibly offensive? Is your video not engaging enough for the average viewer?" Plus [Driving video traffic: The For You feed](https://www.tiktok.com/creator-academy/article/video-traffic-the-for-you-feed): "**Hook viewers in the first three seconds**". YouTube [Audience retention](https://support.google.com/youtube/answer/9314415): a weak Intro means "modify the first 30 seconds" | Keep the row, but say **retention curve**, not "watch-through", and name the platform: this diagnostic only exists on TikTok (retention rate) and YouTube (audience retention). Carry TikTok's full four-item checklist — hook is one candidate cause, not the only one. Drop "length" from the documented claim and label it a heuristic (see §2.4) |
| 2 | Good watch-through, few shares → **the send test; a caption problem, not a footage problem** | **Inference.** The premise is documented; the fix is not | Premise: [Instagram Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained), re-verified verbatim today — "The most important predictions we make are how likely you are to **reshare** a reel, **watch a reel all the way through**, like it, and go to the audio page". Fix: **no platform page anywhere states that captions drive reshares.** Instagram's own reach advice lists original content, Collabs, keywords, Favorites, Account Status — captions appear only under *search*, never under sends | Keep it, labelled: "**Heuristic (no platform source).** Reshare is Instagram's top prediction, so a high-retention / low-share post is worth attacking; the plugin's bet is that what gets forwarded is what says something about the sender, and that this usually lives in the framing, not the footage. Test it against `data/performance.md`, do not assert it" |
| 3 | Low reach on IG, normal on TikTok, same clip → **watermark or repost demotion** | Mechanism **Documented**; the cross-platform diagnostic is **Inference and actively weak** | Mechanism: [Instagram Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained) — "We aim to make certain reels less visible for other reasons, such as low-resolution or **watermarked** reels, reels that are **muted** or contain **borders**, reels that are **majority text**, or reels that have **already been posted on Instagram**." [Helping Creators Find New Audiences](https://creators.instagram.com/blog/recommendations-and-originality) (2024-04-30) — eligible content is content that "is original, does not violate our community guidelines, **has no visible watermarks**". Against the diagnostic: Metricool's 24.3M-post study finds Instagram Reels average ~30% fewer views than TikTok videos *as a baseline*, so "fewer on IG" is the null result, not evidence | Replace the cross-platform comparison with the two surfaces Instagram documents for exactly this question: **Account Status** ("See if your content can't be recommended right now", [Recommendation eligibility on Instagram](https://help.instagram.com/653964212890722)) and the **follower vs non-follower split** in Insights ([Tips for Improving Your Reach](https://creators.instagram.com/blog/tips-for-improving-your-reach)). Also note Instagram is "**experimenting with new notifications** to help creators understand when the reach of their reel may be limited due to a watermark" — that notification, where it appears, is the only direct read-out. Add *muted* and *majority text* to the demotion list; a muted concert clip is demoted for a reason the row never mentions |
| 4 | Views far below own baseline, followers still see it → **TikTok "ineligible for recommendation"** | **Documented** as an action; **Inference** as a signature — and TikTok explicitly warns against the inference | [FYF Eligibility Standards](https://www.tiktok.com/community-guidelines/en/fyf-standards), verbatim: "Even if a video doesn't make it to the FYF, people may still find it **through search or by going to a creator's account**. **If a video isn't getting many views, it also doesn't necessarily mean it broke a rule.** Creators can check TikTok's analytics to see how their videos are performing, **including if there were any made ineligible for recommendation**." Traffic-source breakdown (For You / profile / search) is documented in [Using analytics…](https://www.tiktok.com/creator-academy/en/article/analytics-tool-video-performance) | Invert the row: lead with "**check the flag** — TikTok reports ineligibility directly", then add TikTok's own caution that low views alone prove nothing. Delete the "signature" framing from `references/ranking-signals.md` too (it currently reads "A post with normal follower views and near-zero For You views is the signature"), or mark it as the pattern that *prompts* the check rather than one that establishes the fact |
| 5 | Views high, follows near zero → **positioning, not packaging** | **Inference.** Only the metric is documented | Metric: Instagram [View insights on your Instagram reels](https://help.instagram.com/202865988324236) — "**Follows**: This is how many accounts started following you as a result of viewing your reel." TikTok top posts are "ranked according to views, likes, new viewers, and **new followers gained**" ([Introducing TikTok analytics](https://www.tiktok.com/creator-academy/en/article/tool-analytics-intro)). Causal claim: **no source on any platform.** Working against it, TikTok states "Your follower count and previous high-performing videos are **NOT** direct factors in the recommendation system", and that losing followers after a viral spike "is extremely common" — i.e. the view/follow ratio is noisy by the platform's own account | Keep as an explicitly labelled heuristic, and attach TikTok's variance caution: a single high-view / low-follow post is within normal behaviour. Only treat it as a positioning signal across several posts — which is what the skill's own cold-start rule already demands |
| 6 | Saves high, shares low → fine for craft content; **do not fix into engagement bait** | "Saves are a real signal" **Documented on Instagram, not on TikTok**. "Don't turn it into engagement bait" **Documented**. "Fine for craft content" is a **judgment**, and that is acceptable if it reads as one | Saves on IG: Explore ranks on "information about the post (likes, comments, shares, **saves**)" and recommendations weigh "how many and how quickly other people are liking, commenting, sharing and **saving** a post" ([Tips for Improving Your Reach](https://creators.instagram.com/blog/tips-for-improving-your-reach)). TikTok: saves/favorites are **not named** in [How TikTok recommends content](https://www.tiktok.com/support/faq_detail?id=7655285288050104852) (like, share, comment, watch in full or skip) nor in Creator Academy's engagement definition ("your likes, comments, and shares"). Bait: [Reducing distribution of problematic content](https://transparency.meta.com/enforcement/taking-action/lowering-distribution-of-problematic-content/) and Instagram's recommendation guidelines list "clickbait or engagement bait" as content it avoids recommending | Qualify by platform: "saves are a named ranking input **on Instagram**; TikTok does not name them." Keep the anti-bait clause as documented. Keep "fine for craft content" but write it as the plugin's judgment, not as a finding |

---

## 2. Metric definitions, as the platforms define them

### 2.1 Instagram — and the biggest single defect in the table

[View insights on your Instagram reels](https://help.instagram.com/202865988324236), verbatim, the
complete list of reel metrics Instagram documents:

| Metric | Instagram's definition |
|---|---|
| Views | "The number of times your reel starts to play or replay." |
| Watch time | "The total amount of time your reel was played, including any time spent replaying the reel." |
| Viewers | "The number of unique accounts that have seen your reel on screen at least once, whether or not your reel was played." |
| Average watch time | "The average amount of time spent playing your reel… watch time divided by the number of initial views." |
| Follows | "How many accounts started following you as a result of viewing your reel." |

Account-level ([About Instagram insights](https://help.instagram.com/788388387972460/)): Views,
Viewers, **Interactions** — "likes, comments, **saves and shares**" — Accounts engaged, Total
followers, Content you shared. Post-level adds **Profile activity**: "the number of actions people
take when they visit your profile after engaging with your post."

Three defects follow:

1. **Instagram reports no watch-through percentage, no completion rate, and no retention curve.**
   The nearest available quantity is `average watch time ÷ clip length`, which the creator must
   compute. A row that says "low watch-through" cannot be executed against an Instagram screenshot
   as written.
2. **"Reach" is no longer Instagram's metric name.** It is **Viewers** (unique accounts) and
   **Views** (plays/replays); "accounts reached" survives only in older creator-blog copy. Both are
   flagged "estimated and in-development" by Instagram itself.
3. **Shares/sends are not a documented per-reel line item** — they sit inside *Interactions*. The
   in-app breakdown does display them, so tracking sends as primary (PLAN.md decision 15) is fine;
   the help centre just does not define a standalone "sends" metric, so do not cite one.

### 2.2 TikTok

[Introducing TikTok analytics](https://www.tiktok.com/creator-academy/en/article/tool-analytics-intro),
last updated 2026-08-19, verbatim:

| Metric | TikTok's definition |
|---|---|
| Retention rate | "The percentage of your video that users watched. **Find dropoff points** and determine what might have been the reason for their loss of interest." |
| Average watch time | "The average duration viewers spent watching your content." |
| Watched full video | "Your **finish rate** or the percentage of people who watched your content until the last few seconds. This number **can also fluctuate depending on the total time of your video**." |
| Overview tab | "post views, profile views, likes, comments, **shares**, and estimated rewards" + **Traffic source** + **Search queries** |
| Content tab | Top posts "ranked according to views, likes, **new viewers**, and **new followers gained**" |
| Viewers tab | "unique viewers and returning viewers" |

Defects: TikTok has **no per-post "reach" metric** (views, and account-level unique viewers), and
**does not report saves/favorites** in the analytics surfaces it documents. The table's row 3
therefore compares "reach on IG" against a TikTok number that does not exist under that name.

TikTok's own weighting statement, which the skill should carry: "We highly suggest keeping an eye
on your **retention rate**… The second most important metric to note is your engagement (your
likes, comments, and shares). **While watch time is more heavily weighted**…" Note the ordering is
platform-specific — Instagram puts **reshare** above watch-through, TikTok puts watch time above
engagement. The plugin's single global "shares + watch-through primary" ordering is right on
Instagram and inverted on TikTok. Worth one sentence in the skill.

### 2.3 YouTube

- Long-form: **Average view duration** — "Average minutes watched among those who stayed to watch"
  — plus the audience-retention graph with **Intro**, dips and spikes
  ([Audience retention](https://support.google.com/youtube/answer/9314415)).
- Shorts: **Shown in feed** — "The number of times that your Shorts showed in the Shorts Feed" —
  and **Viewed (vs swiped away)** — "the percentage of times that viewers viewed your Shorts versus
  swiped away" ([Content tab analytics tips — Shorts](https://support.google.com/youtube/answer/12942217)).
  This is the closest first-party analogue to "did the hook hold", and the plugin does not mention it.

### 2.4 The length claim, precisely

No platform says "shorten the clip to fix retention". What is documented and can be assembled:

- YouTube: "**Relative** watch time matters more for short videos" ([Search and discovery](https://support.google.com/youtube/answer/141805)).
- TikTok: finish rate "can also fluctuate depending on the total time of your video."
- Instagram: "**Keep your reels short. In order to be recommended, they must be 3 minutes or less**"
  ([Tips for Improving Your Reach](https://creators.instagram.com/blog/tips-for-improving-your-reach)).
- Against it, TikTok: "Focus on creating high-quality content, meaning well-crafted, engaging, and
  specialized **longer-form** videos" and "Well-crafted, long-form content thrives on the For You feed."

So: percentage-based metrics are mechanically easier to satisfy on a shorter clip (documented), and
Instagram caps recommendable reels at 3 minutes (documented). "Cut to the strongest section rather
than padding" remains the plugin's editorial call. Label it as one — TikTok's own guidance points
the other way.

---

## 3. Platform-published diagnostic guidance that exists

This is the answer to research area B, and it is better than expected — but it is almost entirely
TikTok and YouTube.

| Source | What it actually prescribes |
|---|---|
| [TikTok — Using analytics as a tool to improve video performance](https://www.tiktok.com/creator-academy/en/article/analytics-tool-video-performance) | The retention drop-off checklist quoted in row 1. Traffic sources: "Identify the **search queries** that led viewers to your post and include these in future titles on the same topic." Followers tab as a posting-time guide. FAQ: fluctuations are normal; follower count is not a direct ranking factor; watch time outweighs engagement |
| [TikTok — Driving video traffic: The For You feed](https://www.tiktok.com/creator-academy/article/video-traffic-the-for-you-feed) | "Hook viewers in the first three seconds… with techniques like asking questions, creating suspense, using beautiful visuals" |
| [TikTok — FYF Eligibility Standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) | Analytics reports ineligibility; ineligible content stays findable via search and profile; low views ≠ rule break |
| [TikTok — My posts aren't getting views](https://www.tiktok.com/support/faq_detail?id=7581827173913467448) | **Almost nothing.** "Use our analytics dashboard", plus three caveats (analytics only from enablement, 1–2 day lag, UTC vs local time). Worth knowing so nobody cites it as guidance |
| [YouTube — Audience retention](https://support.google.com/youtube/answer/9314415) | Dips are where viewers "skipped or… stopped watching"; spikes are "rewatched or shared"; a weak Intro → "changing your video thumbnail and title" or "modify the first 30 seconds" |
| [YouTube — Content tab analytics tips (Shorts)](https://support.google.com/youtube/answer/12942217) | Defines *shown in feed* and *viewed vs swiped away*; compares like-for-like formats. **No prescriptive fix** for a low value |
| [Instagram — Tips for Improving Your Reach](https://creators.instagram.com/blog/tips-for-improving-your-reach) (2023-05-31) | Monitor insights and break reach into followers vs non-followers; check Account Status; post original content, avoid reposts and "content with noticeable watermarks"; reels ≤3 min to be recommended; keywords in content, caption, bio, hashtags |
| [Instagram — Recommendation eligibility](https://help.instagram.com/653964212890722) | Account Status shows whether content can be recommended, a sample of the offending content, and an appeal route. "Even if you're not eligible to be recommended, your content **can still show up for your followers**" |
| [Instagram — Rewarding original creators](https://creators.instagram.com/blog/rewarding-original-creators-on-instagram) (2026-04-30) | Originality penalty now covers photos and carousels, not just reels. It is **account-level over a rolling 30 days**, not per-post. Adding "a border, watermark, subtitles, or a credit in the captions" does not make a repost original. "This update does not impact how we show people content from accounts they follow" |

**Instagram publishes no retention-based diagnostic** — consistent with it not reporting retention.
Anything claiming otherwise for Instagram is third-party.

---

## 4. Third-party data — what qualifies, what does not

| Finding | Sample / method | Use |
|---|---|---|
| Instagram Reels average ~30% fewer views than TikTok videos; Reels average watch time 8.5s (doubled YoY); shares on Reels +67.19% YoY; carousels 9× the saves of single images | [Metricool 2026 Instagram study](https://metricool.com/press-release-instagram-study-2026/) — 24.3M posts, 375k accounts, Jan–Feb 2025 vs Jan–Feb 2026 | **Directly kills row 3's diagnostic.** Lower IG numbers than TikTok on the same clip is the population baseline |
| Reels 36% more reach than carousels but 12% less engagement; replying to comments correlates with lift on all six platforms; no universal best posting time | [Buffer, State of Social Media Engagement 2026](https://buffer.com/resources/state-of-social-media-engagement-2026/) — 52M+ posts, 10 platforms, through 2025-12-03, median rates + fixed-effects regression | Background only. Nothing here speaks to any row's causal claim |
| Reels 30–60s show the highest reach rate (5.60%); skip rate 60.5% (100K–1M accounts) vs 65.5% (1–5K) | [Socialinsider, Instagram Reels statistics](https://www.socialinsider.io/blog/instagram-reels-statistics/) — 140K reels, **business pages only**, Jan–Jun 2026 | Weakest of the three. Business-page population, no method statement. Cite only with the caveat attached, and never as a retention benchmark for a creator |

**Rejected outright.** Searching for retention benchmarks returns a stat-aggregator genre repeating
figures such as "ads under 15 seconds achieve 79.4% completion (Nielsen, 18,400 campaigns)",
"59% of short-form videos are watched for 41–80% of their duration", "sends carry 3–5× the weight
of likes", "a 1–2% shares-to-reach ratio is strong", and "reels with 60%+ 3-second hold rates
outperform weak holds by 5–10× in reach". None of these traces to a primary publisher I could
reach; they are the same failure mode as the fabricated "YouTube confirms captioned Shorts rank 23%
higher" claim caught in the previous pass. **Do not adopt any of them, and do not soften them into
"some studies suggest".**

One first-party-sounding claim that is *not* first-party: Adam Mosseri's "**sends per reach**" as
the top Reels signal. It is repeated across dozens of SEO posts, always without a link. Instagram's
own ranking page says "**reshare**" is the top prediction and never uses "sends per reach". Cite the
page's wording, not the blogs'.

---

## 5. Recommended rewrite of the table

Two structural changes: a **Basis** column, so an unlabelled heuristic becomes impossible to write
by accident; and per-platform metric names, so a row can actually be executed against a screenshot.
Nothing is deleted — a labelled heuristic is useful, an unlabelled one is a lie.

> ## Diagnose: metric → controllable
>
> Given a screenshot, do not stop at "views were low". Map the pattern to the specific thing the
> creator can change — and say which basis you are on. **Documented** rows come from a platform
> page (`references/ranking-signals.md` owns the citations). **Heuristic** rows are this plugin's
> working theory; they are worth acting on and are not facts. Never present a heuristic as a
> platform mechanism.
>
> | Pattern in the numbers | What it implicates | The controllable | Basis |
> |---|---|---|---|
> | **Retention drops early** (TikTok retention rate; YouTube audience retention / viewed-vs-swiped-away). Instagram reports no retention — approximate with average watch time ÷ length | The moment of the drop, whatever is at it | Rewatch at the drop point and run TikTok's own checklist: missing hook, messy edit, possibly offensive, not engaging enough for the average viewer | **Documented** — TikTok Creator Academy; TikTok also says hook in the first three seconds |
> | Retention fine but the clip **trails off**, or the cut is padded | Percentage-based metrics get harder as the clip gets longer | Cut to the strongest section. Instagram will not recommend a reel over 3 minutes at all | **Mixed** — the 3-minute cap and "relative watch time matters more for short videos" are documented; "cut rather than pad" is this plugin's call, and TikTok's own advice leans the other way |
> | **Held attention, few sends** | It held attention but said nothing about the viewer. Reshare is Instagram's top-ranked prediction | The send test: who forwards this, and what does sending it say about them? The plugin's bet is that this lives in framing more than footage | **Documented** that reshare ranks first. **Heuristic** that the caption is the fix — no platform says so |
> | **Views far below the creator's own baseline** | Could be nothing. TikTok: "if a video isn't getting many views, it also doesn't necessarily mean it broke a rule" | Check the flag before changing anything: TikTok analytics reports posts made **ineligible for recommendation**; Instagram **Account Status** reports whether content can be recommended. Both leave follower distribution intact, so a follower/non-follower split is the corroborating read | **Documented** — TikTok FYF standards; Instagram recommendation-eligibility help |
> | **Instagram distribution suppressed on a clip that is fine elsewhere** | Demotion, not performance | Instagram makes less visible: watermarked, low-resolution, **muted**, bordered, majority-text, and already-posted reels. Export clean per platform; a muted concert clip is demoted for its own reason. Since 2026-04-30 the aggregator penalty is account-level over a rolling 30 days | **Documented** as a mechanism. **Not** diagnosable by comparing IG views to TikTok views — Reels average ~30% fewer views than TikTok as a baseline (Metricool, 24.3M posts). Use Account Status, the follower/non-follower split, or Instagram's watermark notification where it appears |
> | **Views high, follows near zero** | Nothing gave a reason to come back | Positioning, not packaging | **Heuristic.** Follows-from-post is a documented metric on both platforms; nothing documents this cause. TikTok warns that follower swings after a spike are normal — needs several posts, not one |
> | **Saves high, sends low** | Useful but not identity-bearing | Fine for craft work. Do not "fix" it into engagement bait — Meta names clickbait and engagement bait as demoted | **Documented** that saves rank on Instagram (Explore) and that bait is demoted. **Note:** TikTok does not name saves as a signal and does not report them. "Fine for craft content" is this plugin's judgment |
>
> **Then hand off.** Name the controllable and route to `ff-package` for the rewrite, or `ff-ideas`
> if the premise itself is the problem.
>
> **What a screenshot cannot tell you:** where views came from geographically, whether a specific
> caption word mattered, or why one post beat another when both sit inside normal variance. TikTok
> says it plainly — "Fluctuations are normal!" Say so rather than constructing a story.

Two smaller follow-ons for `references/ranking-signals.md`, both out of scope to fix here:

1. The FYF note reads "A post with normal follower views and near-zero For You views is **the
   signature**." That is the inference TikTok's own page cautions against. Reword to "is the pattern
   that should prompt checking the flag".
2. The Instagram-search consequence ("Instagram's transparency page does **not** name caption text
   as a search signal") is true of the transparency page but sits awkwardly against Instagram's own
   creator blog, which tells creators to "include relevant keywords in your content, your **caption**,
   your bio, and your hashtags". Both are first-party. The file should carry both, not just the one
   that makes the sharper point.

---

## 6. What could NOT be verified

Mandatory section. Everything here is honestly unresolved.

| # | Item | Why it failed |
|---|---|---|
| 1 | That a caption — rather than the footage, the subject, or the premise — is what drives shares/sends | No platform page makes any claim about what causes a reshare. This is row 2's entire load-bearing hop and it has zero sourcing. It stays as a labelled heuristic or it goes |
| 2 | That high views with near-zero follows implicates positioning | Same: no source, on any platform, in either direction |
| 3 | "Sends per reach" as Instagram's stated top signal | Repeated in dozens of third-party posts attributed to Mosseri, never with a link. Instagram's own page says "reshare", not "sends per reach". Could not find a first-party page using the phrase |
| 4 | Any numeric retention benchmark (a "good" completion rate, hold rate, or finish rate) | No platform publishes one. Every number found traces to stat-aggregator blogs — 79.4% completion under 15s "per Nielsen", 59% watched 41–80%, "60%+ 3-second hold rate → 5–10× reach". Could not reach a primary publisher for any of them. Treat as fabricated attribution until one appears |
| 5 | Whether Instagram's **reels** insights currently offer a follower vs non-follower breakdown | The 2023 creators blog describes breaking "Accounts Reached" down that way. The current help centre names the followers/non-followers split only for *Accounts engaged* on **posts, stories and Live** — reels are not listed. Confirming needs a logged-in professional account, which I do not have. Row 3's recommended fix depends on this; verify in-app before shipping it |
| 6 | Whether the Instagram watermark reach-limited **notification** has shipped beyond a test | Instagram's own wording is "We're **experimenting** with new notifications… and plan to expand to more people as we learn what's most effective." No ship announcement found. Do not tell a creator to expect one |
| 7 | Exactly which metrics appear on a TikTok Studio screenshot today | TikTok Studio is login-gated. Everything in §2.2 comes from TikTok's documentation of its analytics, not from the surface itself. Documentation and UI drift |
| 8 | Whether TikTok counts saves/favorites as a recommendation signal | Absence of evidence. Saves appear in neither the recommendation FAQ nor the Creator Academy analytics articles. That is not the same as TikTok stating they do not count |
| 9 | The date and rollout state of Instagram's move from "Reach / Accounts reached" to "Views / Viewers" | The current help pages use Views/Viewers and flag them "estimated and in-development"; older first-party creator pages still say "Accounts Reached". No page dates the change. Both names are live in Meta's own documentation right now |
| 10 | Whether the TikTok Creator Academy pages changed materially, or only their "last updated" stamp | Both key articles read "Last updated: Aug 19, 2026" — one day old. TikTok does not publish diffs. The quotes are what the pages say **today**; I cannot say what they said last month |
| 11 | Any Instagram-published diagnostic tied to a retention or completion number | Searched Instagram's help centre, creators blog and about.instagram.com. Found none — and Instagram reporting no retention metric is a coherent explanation, not proof of absence |
| 12 | Socialinsider's method beyond sample size | The page states 140K reels from business pages, Jan–Jun 2026, and nothing about how reach rate or skip rate were computed. Recorded, not relied on |
