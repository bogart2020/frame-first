# Instagram reach research — 2026-08-20

Research pass only. No skill was changed. Target: **why an Instagram account gets near-zero Reels
reach**, scoped to one real creator, and what Meta documents as the diagnosis and the fix.

Every Meta page below was fetched **2026-08-20**. `help.instagram.com`, `creators.instagram.com`,
`transparency.meta.com` and `facebook.com/legal` are JS-rendered and return an empty shell to plain
fetching; quotes were read out of a headless browser (`document.body.innerText`). Accordions were
clicked open — the professional-account section of the Account Status page is collapsed by default
and is the single most load-bearing paragraph in this file.

## The creator this is scoped to

| Fact | Value |
|---|---|
| Location | Philippines. Target audience **global English, deliberately not PH-local** |
| Device | iPhone 16 Pro |
| Format | Concert clips with **on-screen caption text** |
| Audio | Concert audio is **replaced with library audio or muted** (live music is copyrighted) |
| Platforms | TikTok and Instagram. **TikTok does better; Instagram is near-zero** |
| Size | **~200 followers**, newer account |
| Spend | **100% organic. No boosts, no ads, no paid promotion at all** |

Zero paid distribution means non-follower recommendation eligibility is not one factor among many —
it is the entire reach mechanism. Everything in §1 is ordered with that in mind.

Conventions, extending `2026-08-20-hardening.md` and `2026-08-20-diagnostics.md`:

| Term | Meaning |
|---|---|
| **Documented** | A Meta-owned page states it. URL and wording given. |
| **Partly documented** | The mechanism is documented; the diagnostic hop is short and is labelled as a hop. |
| **Third-party** | Named publisher, stated N and method. Correlational. Never promoted to fact. Isolated in §5. |
| **Unverified** | No reachable first-party or method-stating publisher. Named and left there. |
| **Myth** | Widely claimed, and a Meta page or a large-N study says otherwise. |

---

## 1. Most likely causes for THIS creator, ranked

Ranked by **probability × cheapness to check**. The top three are all free and take under two
minutes each.

### Rank 1 — The format stacks three named demotion criteria at once. **Documented.**

Instagram's own ranking page, verbatim:

> "We aim to make certain reels less visible for other reasons, such as low-resolution or
> watermarked reels, reels that are **muted** or contain **borders**, reels that are **majority
> text**, or reels that have already been posted on Instagram."

Source: [Instagram Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained),
Adam Mosseri, May 31 2023, re-read verbatim 2026-08-20.

This creator's described format can hit **muted**, **borders**, and **majority text**
simultaneously:

- **Muted** — a concert clip posted silent is the literal case the sentence names. This is the one
  to fix first, because it is deliberate and therefore free to stop doing.
- **Borders** — concert footage shot 16:9 or 4:3 and posted to a 9:16 reel arrives letterboxed with
  black bars unless it is reframed. Instagram accepts 1.91:1 to 9:16
  ([Reel size & aspect ratios](https://help.instagram.com/1038071743007909)), so a wide clip is
  *legal* and *demoted* at the same time. Crop or reframe; do not pillarbox.
- **Majority text** — the format is "concert clip with on-screen caption text". **Instagram
  publishes no threshold, no percentage, and no definition of "majority text."** Searched the help
  centre, creators blog, about.instagram.com and the Transparency Center; the phrase appears once,
  in the sentence above, and is never defined. Treat it as a real risk of unknown size: keep text
  off the majority of the frame, and never post a card that is text over a still.

**How to check:** open the reel in-app. Is there an audio track attached (an audio pill at the
bottom)? Are there black bars? Does text cover more than about a third of the frame? All three are
visible in five seconds without any analytics.

### Rank 2 — Account-level recommendation ineligibility. **Documented, and decisive under zero ad spend.**

> "If your account is not eligible to be recommended, **none of your content will be recommended**
> regardless of whether or not all of your content goes against our Recommendations Guidelines…
> Even if you're not eligible to be recommended, your content can still show up for your
> followers."

Source: [Recommendation eligibility on Instagram](https://help.instagram.com/653964212890722).

That is exactly the reported symptom: a 200-follower account whose reach collapses to roughly its
follower count. **Account-level ineligibility is binary and it is checkable.** See §3 for the exact
tap path — and note it requires a **professional (business or creator) account**. A personal
account cannot see the Recommendations Guidelines panel at all, which means a creator on a personal
account is flying blind on the single most important question.

### Rank 3 — Export hygiene: watermark and resolution. **Documented.**

- **Watermark.** Named on the ranking page above, and again in
  [Helping Creators Find New Audiences](https://creators.instagram.com/blog/recommendations-and-originality)
  (Apr 30 2024): eligible content "is original, does not violate our community guidelines, **has no
  visible watermarks**". A TikTok-first workflow that exports through the TikTok save button carries
  a moving watermark. Instagram also says it is "**experimenting** with new notifications to help
  creators understand when the reach of their reel may be limited due to a watermark" — an
  experiment, not a shipped signal; do not wait for it.
- **Resolution — there IS a documented minimum.** "Reels should have a minimum frame rate of 30 FPS
  (frames per second) and **minimum resolution of 720 pixels**."
  ([Reel size & aspect ratios](https://help.instagram.com/1038071743007909)). The same page
  documents an in-app toggle most creators never touch: **Menu → Your app and media → Media quality
  → Upload at highest quality**. On an iPhone 16 Pro shooting 4K, leaving that off is a
  self-inflicted quality loss on every upload, and low resolution is on the demotion list by name.

### Rank 4 — Duplicate detection across a repost workflow. **Documented.**

"Reels that have **already been posted on Instagram**" are made less visible. Separately, the trial
reels help page states it plainly: "**Your trial reel may get limited reach if Instagram detects
that you've previously shared the same content**"
([About Trial Reels](https://help.instagram.com/835643311711702/)).

Posting the same clip to TikTok and to Instagram is not what this names — the named case is the
same content already existing **on Instagram**. Risk here is moderate but real: re-uploading a clip
that underperformed, or posting footage of a concert moment that a hundred other attendees also
filmed and uploaded, both bump into copy detection.

### Rank 5 — Instagram is simply a lower-view surface than TikTok. **Third-party, and it kills the cross-platform diagnostic.**

Instagram Reels average **~30% fewer views and ~14% fewer interactions than TikTok videos**
(Metricool 2026 Instagram Study — **24,364,803 posts from 375,118 accounts**, Jan–Feb 2025 vs
Jan–Feb 2026; [press release](https://metricool.com/press-release-instagram-study-2026/)). "TikTok
does better on the same clip" is therefore the **population baseline, not evidence of a problem.**
It cannot be used as a symptom. Use Account Status and the format audit instead.

### Rank 6 — Originality. **Documented, and this is the reassuring one. Low risk.**

The worry — "does filming someone else's concert count as unoriginal?" — is answered directly on a
Meta-owned page, and the answer is no:

> "Original content is work that you wholly created or reflects your unique perspective… **Photos
> or videos you took — your photography and edits are reflective of your creative vision.**"

And the definition of the failure mode is the mirror image:

> "**Content copied without material edits** — This is content **you didn't produce or film** and
> doesn't contain any material edits."

Source: [Original Content Guidelines](https://creators.instagram.com/original-content-guidelines).

Footage you shot on your own phone at a show is original by Meta's own definition. The originality
policy targets re-uploaders, not documentarians. Meta also separates the two questions explicitly:
"these original content guidelines are **separate from our intellectual property policies**… you
are responsible for obtaining any necessary permissions before using someone else's work." So the
copyright question about the *music* is live; the *originality/aggregator* question about the
*footage* is not.

**One caveat that does apply:** the guidelines warn against additions that are only decoration —
"Add overlaid text that does more than describe what's happening in the photo or video." A caption
that narrates the obvious ("the crowd went crazy") is weaker than one that adds a point of view,
under Instagram's own stated test. That is a craft note, not an eligibility risk, for footage the
creator shot.

### Rank 7 — Account size and age. **Documented as NOT a mechanism, with one exception. Mostly a myth — see §4.**

Instagram, on a Meta-owned page: "creators of all sizes have an **equal chance** of breaking
through and reaching new audiences"
([Finding success on reels in 2025](https://creators.instagram.com/blog/the-latest-with-instagram), Jan 21 2025).

The exception, and it matters at exactly 200 followers: **follower thresholds are documented for
FEATURE ACCESS, not for reach.** Trial reels require "at least **200 followers**" on a professional
account, or **1,000** on a personal account
([About Trial Reels](https://help.instagram.com/835643311711702/)). At ~200 followers this creator
is at the professional-account threshold and below the personal-account one. Switching to a
professional account unlocks both trial reels and the Account Status recommendations panel. That is
the single highest-leverage account change available here.

---

## 2. The documented demotion and eligibility list, verbatim

### 2.1 Instagram Reels — the "less visible" sentence

| Named | Instagram's exact wording | Source |
|---|---|---|
| Low resolution | "low-resolution … reels" | [Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained) |
| Watermarked | "watermarked reels" | same |
| **Muted** | "reels that are **muted** or contain borders" | same |
| Bordered | "reels that … contain **borders**" | same |
| **Majority text** | "reels that are **majority text**" | same |
| Already posted | "reels that have **already been posted on Instagram**" | same |

**Verdict on the prior pass's list: all six confirmed verbatim, on a Meta-owned page.** The
sentence is one sentence; it carries no thresholds, no percentages, and no definitions. Anything
that puts a number on "majority text" or on "low resolution" beyond the 720px spec is not from
Instagram.

**Muted is named — this is not an inference.** The word appears in the list. Two Transparency
Center pages corroborate the direction with named input signals:

- Reels: the prediction "how likely you are to watch less than three seconds of a reel" is informed
  by "**How many times this reel has been viewed with the sound on**"
  ([Instagram Reels Chaining AI system](https://transparency.meta.com/features/explaining-ranking/ig-reels-chaining/), updated Nov 11 2025).
- Feed Recommendations: a prediction "how likely you are to turn on the audio of a video post",
  informed by "**How many times others turned on audio on the post**" and "How many times a viewer
  views a video with sound on in 7 days"
  ([Instagram Feed Recommendations AI system](https://transparency.meta.com/features/explaining-ranking/ig-feed-recommendations/), updated Jun 29 2026).

A silent reel scores structurally badly on signals Meta names. And Instagram tells creators the
opposite of muting, on a Meta-owned page: "**Amplify your content with audio.** Incorporating audio
to reels can bring them to life and grab attention with new audiences"
([Helping creators of all sizes break through](https://creators.instagram.com/blog/helping-creators-of-all-sizes-break-through), Feb 26 2025).

**Minimum resolution: yes, stated.** 720 pixels minimum, 30 FPS minimum
([Reel size & aspect ratios](https://help.instagram.com/1038071743007909)). Aspect ratio 1.91:1 to
9:16. Cover photo 420×654.

### 2.2 The Recommendations Guidelines — the account/post eligibility list

This is the list the prior passes never pulled in full. Verbatim from
[Recommendations on Instagram](https://help.instagram.com/313829416281232):

> "There are three categories of content that are allowed on our platforms, but that **may not be
> eligible for recommendations**."

**Category 1 — safety** (self-harm, violence, sexually suggestive, regulated goods, weight-loss
products) — plus one catch-all that matters: "**Content shared by any non-recommendable account**."

**Category 2 — "low-quality or associated with low-quality publishing", verbatim:**

> - "**Unoriginal content that is largely repurposed from another source with only minor,
>   immaterial edits, without adding material value.**"
> - "**Long captions unrelated to the underlying content** and **coordinated comment networks
>   intended to artificially drive engagement and distribution**."

**Category 3 — false or misleading content** (fact-checked).

**Account-level non-recommendation, verbatim** — "We also try to not recommend accounts that":

> - "Recently violated Instagram's Community Guidelines."
> - "Repeatedly and/or recently shared content we try not to recommend **in the account name,
>   username, profile photo, bio or profile**."
> - "Repeatedly engaged in misleading practices to build followings, such as purchasing 'likes'."
> - "Have been banned from running ads on our platforms."
> - "Recently and repeatedly posted 'False' or 'Altered' information."

Two things fall out of this that are directly useful:

1. **Engagement pods are named.** "Coordinated comment networks intended to artificially drive
   engagement and distribution" is a documented non-recommendation category. Pod advice is not
   merely ineffective; it is a listed reason to be dropped from recommendations. See §4.
2. **Your bio and profile photo can sink the whole account.** The account-level list names the
   profile itself, not just posts. Worth an actual look.

### 2.3 Account-level vs post-level — the distinction, stated

| Level | Wording | Source |
|---|---|---|
| Post-level | "If we believe your content is unoriginal, **it** may be ineligible to appear in recommendations to people who don't already follow you, limiting its reach." | [Original Content Guidelines](https://creators.instagram.com/original-content-guidelines) |
| Account-level | "If your account **primarily** posts unoriginal reels, photos, or carousels you didn't create or edit in a material way, **your account** may not be seen in recommendations to new audiences." | same |
| Account-level is total | "If your account is not eligible to be recommended, **none of your content will be recommended** regardless of whether or not all of your content goes against our Recommendations Guidelines." | [Recommendation eligibility](https://help.instagram.com/653964212890722) |
| Followers unaffected | "Even if you're not eligible to be recommended, your content **can still show up for your followers**." / "Our original content guidelines do not impact how we show people content from accounts they already follow." | both pages |

### 2.4 The rolling-30-day aggregator penalty — **verified**

The prior pass's 2026-04-30 claim is confirmed on two Meta-owned pages, with matching wording.

> "Aggregator accounts that have become ineligible for recommendations can become eligible again
> when **most of their recently posted photos, carousels, and reels are considered original in a 30-day
> period. This is calculated on a rolling basis**, and accounts can always check their standing in
> Account Status."

Source: [Rewarding original creators on Instagram](https://creators.instagram.com/blog/rewarding-original-creators-on-instagram), **April 30, 2026**.
Restated on [Original Content Guidelines](https://creators.instagram.com/original-content-guidelines).
Also verbatim from the same post: "**This update does not impact how we show people content from
accounts they follow**", and the disqualifier list — re-uploading "without adding meaningful
creative input to enhance the original, such as **just adding a border, watermark, subtitles, or a
credit in the captions**."

**A second, older and more specific threshold exists** and the prior pass did not carry it: the
2024 announcement states that accounts posting **10 or more pieces of unmodified content from other
users within 30 days** become ineligible for recommendations
([Helping Creators Find New Audiences](https://creators.instagram.com/blog/recommendations-and-originality), Apr 30 2024).
The 2026 update restates the rule qualitatively ("most … in a 30-day period") and does not repeat
the number. **Both are first-party and they do not agree in precision.** Cite the 2026 "most, rolling
30 days" wording as current; record the 2024 "10 pieces" figure as the older, more specific form.

### 2.5 Meta-wide demotions (Facebook and Instagram)

| Demoted | Wording | Source |
|---|---|---|
| Clickbait / engagement bait | "clickbait" and "engagement bait" | [Reducing distribution of problematic content](https://transparency.meta.com/enforcement/taking-action/lowering-distribution-of-problematic-content/) |
| Limited originality | "**Limited originality content that is principally repurposed from other sources**" | same |
| Low-quality video | "**Low-quality videos that abuse video or live video formats**" | same |
| Named demotion types | "Clickbait Links", "Engagement Bait", "Fact-Checked Misinformation", "Content Likely Violating Our Community Standards" | [Types of content we demote](https://transparency.meta.com/features/approach-to-ranking/types-of-content-we-demote/) |
| Don't-post list for reach | "Clickbait / Engagement bait / **Watchbait** / Links to low quality web experiences / **Low quality video** / Misleading experiences / Misleading content / Inauthentic sharing" | [Best practices for improving reach on Facebook and Instagram](https://www.facebook.com/business/help/1424020861341537) |

Note: `types-of-content-we-demote` does **not** mention watermarks, muting, text-heavy content or
resolution. The reels demotion list lives only on the Instagram ranking blog post. Cite the right
page for the right claim.

---

## 3. Music and copyright — what "limit" actually means

This is where the prior pass left the biggest open question, and it now closes.

**"Limited" is defined by example, and the examples are not reduced distribution.** Meta's Music
Guidelines, verbatim ([facebook.com/legal/music_guidelines](https://www.facebook.com/legal/music_guidelines?locale=en_US),
effective March 26 2024):

> "The greater the density of music in content, the more likely it may be **limited (e.g., blocked,
> muted or ineligible for Music Revenue Share)**"

> "If you post content that contains music owned by someone else, your content may be reviewed by
> the applicable rights owner and your content may be **blocked, muted or removed** if your use of
> that music is not properly authorized."

So: **"limit" = block, mute, or lose Music Revenue Share eligibility. It is not documented as a
ranking or distribution penalty.** The 2020 blog that introduced the phrase promises "(more below on
what we mean by 'limited')" and then never defines it
([Updates and Guidelines for Including Music in Video](https://about.instagram.com/blog/announcements/updates-and-guidelines-for-including-music-in-video), May 20 2020).
The legal page is the only place it is pinned down. Do not upgrade "limited" into "shadowbanned".

**A copyright-muted reel is documented as still viewable.** Verbatim: "**Your reel can still be
viewed even if audio tracks have been muted**"
([Replace muted audio on your Instagram reel](https://help.instagram.com/825171856327681/)); and
"While the audio tracks of your post may be muted, **your post can still be viewed**"
([What audio you can use in your reel](https://help.instagram.com/329208821595430)).

**But the two mechanisms stack, and this is the finding that matters.** Instagram documents no
distribution penalty for a *copyright* mute — and separately documents that *muted reels* are made
less visible. A reel that ends up silent lands on the demotion list **regardless of why it is
silent**. Deliberate muting and enforcement muting arrive at the same place.

**Filming a live performance is explicitly permitted.** Verbatim, from the same 2020 blog:

> "**Music in stories and traditional live music performances (e.g., filming an artist or band
> performing live) are permitted.**"

> "The greater the number of full-length recorded tracks in a video, the more likely it may be
> limited… For that reason, **shorter clips of music are recommended**. There should always be a
> visual component to your video; recorded audio should not be the primary purpose of the video."

> "These guidelines are consistent across live and recorded video on both Facebook and Instagram,
> and **for all types of accounts** — i.e. pages, profiles, verified and unverified accounts."

That last clause answers the account-type question for music *risk*: it does not vary by account
type. Access to the *library* does vary — see below.

**Keeping the concert audio may actively help discovery.** Verbatim:

> "When we detect the audio you recorded or uploaded uses licensed audio, we'll automatically change
> attribution from Original Audio to the artist and song title. **Your reel will be added to the
> audio page for that song, where more people on Instagram may find it.**"
> ([What audio you can use in your reel](https://help.instagram.com/329208821595430))

And "go to the audio page" is one of the four **top-ranked predictions** for Reels
([Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained)).
So a concert clip whose audio is detected and attributed gets a discovery surface a muted clip
cannot have. The risk is a mute or a block; the upside is the audio page. Muting pre-emptively
forfeits the upside and *also* triggers the muted-reel demotion — the worst of both.

**Library music and account type.** Verbatim:

> "The music available in our library is intended for **personal, non-commercial use**… To make sure
> that the music in our licensed library is not used for commercial purposes, **certain business
> accounts and certain types of posts do not have access to the library**. Licensed music may also
> not be available in certain countries or regions. If your account does not have access to the
> licensed music library, then you may be able to use **Meta's Sound Collection**" — "over 14,000
> songs and sounds which are entirely royalty free… can be used for commercial purposes like ads."
> ([Access to the licensed music library on Instagram](https://help.instagram.com/402084904469945/))

**Actionable for this creator:** the narrowed library is documented for "certain **business**
accounts". A **creator** account is not named as restricted. Instagram does not publish the exact
mapping, so verify in-app — but if the music picker looks thin, that is the documented explanation
and the documented answer is a creator account plus Sound Collection. **Nothing on any Meta page
links library access, or library-vs-Sound-Collection choice, to reach.** Any claim that Sound
Collection tracks get less reach than licensed ones is unverified.

---

## 4. The diagnostic surface Instagram documents

### 4.1 Account Status — what it actually reports, and the professional-account gate

The professional-account section of the help page is **collapsed by default**. Opened, verbatim
([Check your Account Status on Instagram](https://help.instagram.com/338481628002750)):

> "If you have a professional account, you can also use Account Status … to see if you've recently
> or repeatedly posted content or have something on your profile (like your profile photo or bio)
> that goes against our Recommendations Guidelines."

> "Tap **Community Standards** to view any content that has been removed… Tap **Recommendations
> Guidelines** to see if your content or something on your profile may be impacting the eligibility
> of **all your content** to be recommended to people who don't follow you. From here, tap **Edit or
> remove content**… If you don't think this content goes against our Recommendations Guidelines, tap
> **Disagree with decision** and our review team will take another look."

The eligibility help page lists the five things Account Status shows
([Recommendation eligibility](https://help.instagram.com/653964212890722)):

> - "See if your content may be eligible to be recommended to people who don't follow you in places
>   like Explore, Search, Suggested Accounts, Reels and Feed Recommendations."
> - "See if something in your profile (like your profile photo or bio) goes against our
>   Recommendations Guidelines."
> - "See if your content **can't be recommended right now**. From here you can view **a sample of the
>   content** … and learn more about which guideline applies."
> - "View any content that has been removed for going against our Community Standards."
> - "Edit or remove content that goes against our Recommendations Guidelines."

With the honest caveat, also verbatim: "**your eligibility for recommendations doesn't guarantee
that your content will be recommended.**"

**Tap path:** Settings → *More info and support* → **Account Status**. (Help page gives the desktop
path: "Click More in the bottom left, then click Settings. Click Account Status below More info and
support.") On a **personal** account you get only Removed content / Features you can't use / Request
a review — **no Recommendations Guidelines panel at all.**

### 4.2 Trial reels — the cleanest non-follower reach test available

[About Trial Reels on Instagram](https://help.instagram.com/835643311711702/), verbatim:

> "Trial reels on Instagram let you experiment with new ideas and get early feedback on whether your
> content resonates by allowing you to **share reels with accounts that don't follow you**."

> "If you have a professional (business or creator) account, you must have **at least 200
> followers**. If you have a personal account, you must have **at least 1,000 followers**."

> "You'll see insights on your trial reel **within 24 hours**… Trial reels may take longer to get
> views because they're being shown to people who don't follow you. **Trial reels are evaluated
> independently in Instagram's ranking and don't impact the performance or ranking of your standard
> reels content.**"

> "Your trial reel **may get limited reach if Instagram detects that you've previously shared the
> same content**." (So test with a *new* cut, not a re-upload.)

Auto-share on good performance is a setting: Trial → **Trial settings** → *Share to everyone
automatically*. Instagram's creators blog dates the auto-share decision to "the views it receives
within the first 72 hours".

**Why this is the highest-value diagnostic for this creator specifically:** it isolates non-follower
distribution from follower distribution with no ad spend and no confound. At ~200 followers on a
professional account, it is available *right at the threshold*. Post the same premise twice — once
muted with heavy text, once with attached audio and lighter text — as two trial reels, and the
difference is the answer.

### 4.3 Insights — including the country breakdown, which answers the region question

[About Instagram insights](https://help.instagram.com/788388387972460/), verbatim:

> "**Viewers**: The number of unique accounts that have seen your content on screen at least once
> and **demographic information on the accounts you've reached, including top countries, top cities,
> top age ranges and gender breakdown**."

> "Audience demographics are available based on viewers data. To view audience demographics, use
> **preset timeframes** and **reach over 100 accounts**."

> "For **posts, stories and Instagram Live**, you can see the Accounts engaged metric broken down
> into followers and non-followers."

Two consequences:

1. **The creator can check whether reach is going to the Philippines or to the global English
   audience they are aiming at** — top countries and top cities, from ~100+ viewers over a preset
   window. That is the one region question that is answerable in-app.
2. **Reels are still not listed for the followers/non-followers split.** Posts, stories and Live are.
   This resolves open item #5 from `2026-08-20-diagnostics.md` in the negative — as documented, the
   split does not cover reels. Instagram's 2023 creators blog still says "you can break down
   Accounts Reached by followers and non-followers"; the current help centre scopes it to posts,
   stories and Live. Both are first-party and they disagree.

**Per-reel metrics, unchanged from the prior pass** ([View insights on your Instagram reels](https://help.instagram.com/202865988324236/)):
Views, Watch time, Viewers, Average watch time, Follows. **No View Rate, no retention curve, no
completion rate on this page** — but see §6, item 3, for a first-party page that names a "View Rate"
metric anyway.

### 4.4 What Instagram documents as the fix

Everything below is Meta-owned. This is the whole of it — there is no "why is my reach down"
troubleshooting article on Instagram's help centre.

| Source | What it prescribes, verbatim or close |
|---|---|
| [Tips for Improving Your Reach](https://creators.instagram.com/blog/tips-for-improving-your-reach) | "Post original content, avoid reposted content." "We're less likely to recommend reposts of a reel that's already on Instagram, content with noticeable watermarks, or accounts that regularly collect and reshare others' content." "Keep your reels short. In order to be recommended, they must be 3 minutes or less." "Check your Account Status." Keywords in "your content, your caption, your bio, and your hashtags". Collabs / Enhanced Tags. "Encourage your top fans to add you to their Favorites" |
| [Helping creators of all sizes break through](https://creators.instagram.com/blog/helping-creators-of-all-sizes-break-through) (Feb 26 2025) | "**Post regularly.**" "**Create content that can stand on its own.** If your goal is to reach new people, your reels should make sense to those who may not know you. **Start with a compelling hook in the first 3 seconds**… monitor your **View Rate** within Insights to understand what percentage of people continue to watch after the first 3 seconds." "**Amplify your content with audio.**" "**Keep experimenting**… through trial reels." "**Embrace unpredictability.** Recommendations make it more difficult to predict the reach of every post" |
| [Finding success on reels in 2025](https://creators.instagram.com/blog/the-latest-with-instagram) (Jan 21 2025) | "creators of all sizes have an equal chance of breaking through." "One of the most effective ways to grow is to **post original content consistently**." Reels up to 3 minutes are recommendable. **Edits** app "allow you to export without a watermark" |
| [Best practices for improving reach](https://www.facebook.com/business/help/1424020861341537) (Meta Business) | "Post more and post consistently." "Improve post quality." Don't post: clickbait, engagement bait, watchbait, low quality video, inauthentic sharing. **"Start advertising."** ← not applicable to this creator; see §5.4 |
| [Original Content Guidelines](https://creators.instagram.com/original-content-guidelines) | "We recommend **regularly checking Account Status** to see if there are any limits to your reach" |

**The documented distribution cascade** — the closest Meta comes to describing a warm-up, and it is
**post-level, not account-level**:

> "When you post a reel on Instagram, it's shown to both followers and non-followers. Among
> non-followers, your reel is **initially recommended and shown to a small audience** of people we
> think will enjoy it. As this initial audience responds to these reels, **the best-performing reels
> are then shown to a slightly wider audience, then the best of those are shown to an even wider
> group, and so on.** This process is designed to level the playing field by **distributing content
> based on its engagement, not just the creator's follower count**."
> ([Helping creators of all sizes break through](https://creators.instagram.com/blog/helping-creators-of-all-sizes-break-through))

Read it carefully: **"not *just* the creator's follower count"** — not "not at all". And the ranking
page names follower count outright as a Reels signal: "Information about the person who posted. We
consider **popularity signals such as number of followers** or level of engagement." Follower count
is a documented input. It is not documented as a gate.

### 4.5 Region and audience targeting — what is and is not documented

| Question | Answer | Basis |
|---|---|---|
| Does country enter recommendation ranking? | **Yes, once, by name.** The prediction "how likely you are to comment on a reel" is informed by "**How much time has viewers from your country spent on this reel**" | [Reels Chaining AI system](https://transparency.meta.com/features/explaining-ranking/ig-reels-chaining/) |
| Can a creator target a country? | **Nothing documented.** No Meta page describes any organic control over viewer geography. Searched help centre, creators, about, Transparency Center | Absence of evidence, stated as such |
| Can a creator *see* viewer geography? | **Yes** — Insights → Viewers → top countries / top cities, at 100+ viewers over a preset window | [About Instagram insights](https://help.instagram.com/788388387972460/) |
| Does language enter it? | **Nothing documented** for organic recommendation. Instagram documents language *settings* and caption *translation*, not language-based distribution | Absence of evidence |
| Does music availability vary by country? | **Yes** — "any music in your content, if it is allowed at all, **may not be available in all countries of the world**" | [Music Guidelines](https://www.facebook.com/legal/music_guidelines?locale=en_US) |
| Does location tagging help? | Named as a Feed signal only — "what location, if any, was attached to it". **Not named for Reels** | [Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained) |

**Honest answer to area G:** there is one named country signal and no documented lever. A
PH-based creator aiming at global English cannot steer geography through any documented control.
The one real influence is indirect and documented only as a signal chain: content that non-PH
viewers watch and reshare gets shown to more non-PH viewers, because the cascade is engagement-fed.
Everything beyond that — VPNs, posting on US time, English-only hashtags "unlocking" a US audience
— is unverified folklore. See §5.

---

## 5. Third-party evidence — clearly separated, never mixed with the above

Every row states publisher, N, method, and whether the sample is organic. None of it is a platform
statement. Where a row **contradicts** a Meta page, the contradiction is named, not resolved.

### 5.1 Qualifying large-N studies

| Finding | Publisher, N, method, sample type | Use |
|---|---|---|
| Instagram Reels average **~30% fewer views** and **~14% fewer interactions** than TikTok videos. Reels average watch time **8.5s**, more than doubled YoY | **Metricool 2026 Instagram Study** — 24,364,803 posts, 375,118 accounts, Jan–Feb 2025 vs Jan–Feb 2026, global. Organic brand/creator accounts; the report does not separate paid, so treat as predominantly-organic rather than certified-organic. [Source](https://metricool.com/press-release-instagram-study-2026/) | **Load-bearing.** Kills "TikTok does better on the same clip" as a diagnostic. Same status as the finding that already overturned row 3 of `ff-strategy`'s table |
| Single-image posts down YoY: reach **−21.96%**, interactions **−25.41%**, engagement **−45.98%**. Carousels 9× the saves of single images and 4.7× the views of TikTok carousels | same study | Background. Argues the still-image/text-card format is the weakest thing this creator could pivot to |
| Posts **with hashtags** show **31.70% fewer views** and **33.89% fewer interactions** than the platform average | same study | **Correlational and probably confounded** (hashtag-heavy accounts skew low-reach). Consistent in direction with Mosseri's "hashtags don't work to increase reach", but do not present it as causal |
| Reels reach **1.36× carousels (+36%)** and **2.25× single images (+125%)**; carousels take the highest median engagement rate (6.90% vs reels 3.31%) | **Buffer, State of Social Media Engagement 2026** — 52M+ posts, 200,000+ accounts, 10 platforms, Jan 2024–Dec 2025; Instagram format cut is 4M+ posts Jan 2022–Oct 2024. **Median** rates, not means, to blunt viral skew. **All organic**, posted through Buffer. [Source](https://buffer.com/resources/state-of-social-media-engagement-2026/) | Background. Reels remain the right format for reach |
| Best Instagram times: **Thu 9am, Wed 12pm and 6pm**. Buffer's own framing: "Timing isn't as critical as it was in the chronological-feed days"; "Content quality still matters most"; "**Think of it as the cherry on top of your strategy, not the cake itself**" | **Buffer** — 9.6M Instagram posts, 200,000+ accounts, Jan 2024–Dec 2025, median engagement rate (likes+comments+shares+saves ÷ followers), organic. [Source](https://buffer.com/resources/when-is-the-best-time-to-post-on-instagram/) | Use **only** with Buffer's own caveat attached, and note it is measured on a global aggregate, which is close to meaningless for a PH-based creator targeting a global-English audience across every timezone |
| Reels reach rate **9.78%** for 1K–5K-follower accounts vs **5.00%** for 100K–1M. Reels 30–60s take the highest reach rate. Reels are the top reach format only up to ~50K followers | **Socialinsider, Instagram Reels statistics 2026** — 140K reels, **business pages only**, Jan–Jun 2026. Reach rate = reach ÷ followers × 100. No further method published. [Source](https://www.socialinsider.io/blog/instagram-reels-statistics/) | **Weakest of the three, and it does not cover this creator.** Business-page population; the smallest bucket starts at 1,000 followers, so it says nothing about a 200-follower account. It does *point the same way* as Instagram's "creators of all sizes" claim — smaller accounts reach a larger share of their audience — but it is a ratio, not absolute reach, and a ratio flatters small accounts arithmetically |

### 5.2 Trade press quoting Instagram directly

| Claim | Source and status | Verdict |
|---|---|---|
| "**The top three signals that matter most for ranking are watch time, likes and sends. So when looking at your insights, pay close attention to average watch time, likes per reach, and sends per reach.**" — attributed to Mosseri, 2025 video series | [Social Media Today, 2025](https://www.socialmediatoday.com/news/instagram-shares-algorithm-insights-2025/738034/); restated in [SMT 2026](https://www.socialmediatoday.com/news/instagram-engagement-rates-provide-insight-into-reach/821170/) — "like rates matter more for your followers, and send rates matter more for those who don't follow you" | **Partial rehabilitation of "sends per reach".** `2026-08-20-diagnostics.md` open item #3 recorded it as untraceable. It now traces to reputable trade press quoting a Mosseri video — but **still to no Meta-owned page**. Label as: reported by Social Media Today as a Mosseri statement; Instagram's own ranking page says "reshare", not "sends per reach". Do not present it as documentation |
| "Likes are slightly more important for **connected** content, and sends are slightly more important for **unconnected** content" | same | **Directly relevant here.** Unconnected = non-followers = this creator's entire reach problem. Same status: trade press quoting Mosseri |
| Mosseri: **no "direct correlation"** between being active on the app when you post and increased reach | [Social Media Today](https://www.socialmediatoday.com/news/instagram-chief-answers-creator-questions/744813/) | Myth-killer for "engage for 30 minutes before posting". Trade press, not a Meta page |
| Mosseri: "**Hashtags are no longer a primary way to increase your reach on Instagram**" | same | Consistent with `references/ranking-signals.md` |
| Instagram says it does **not** reduce the reach of sponsored/branded content; does **not** penalise "link in bio" | [SMT](https://www.socialmediatoday.com/news/instagram-says-does-not-reduce-the-reach-of-sponsored-content/732615/), [SMT](https://www.socialmediatoday.com/news/instagram-doesnt-penalize-posts-that-include-link-in-bio/753899/) | Myth-killers, trade press |
| Instagram is updating ranking to surface more content from smaller, original creators | [TechCrunch, 2024-04-30](https://techcrunch.com/2024/04/30/instagram-is-updating-its-ranking-systems-to-surface-more-content-from-smaller-original-creators/) | Corroborates the Meta-owned Feb 2025 post |

### 5.3 Rejected — the fabricated-attribution genre, extended

Everything below was returned repeatedly by search and **none of it reaches a publisher who states
a method**. Do not adopt, and do not soften into "some studies suggest".

- "**80% of Reels are viewed with the sound on**" / "60% watch with sound on" / "85% watch without
  sound" — attributed variously to "Instagram's internal data" and to nobody. Three mutually
  contradictory figures, zero reachable publishers. **This one is dangerous specifically because it
  looks like it settles the muted-audio question. It does not.**
- "Adding trending music increases total engagement by **27%**."
- "**67%** of Instagram users say trending audio influences whether they watch a Reel fully."
- "Reels with original audio average **3.1%** engagement vs **5.6%** for trending audio."
- Carried over from the prior pass and still unreachable: "23% higher" for captioned Shorts,
  "79.4% completion under 15 seconds (Nielsen, 18,400 campaigns)", "59% watched 41–80%", "a 1–2%
  share-to-reach ratio is strong", "60%+ 3-second hold rate → 5–10× reach".

The Nielsen-style completion figures carry a second disqualifier for this creator: their population
is **advertising campaigns**, not organic posts. Paid placements have different delivery mechanics
and guaranteed impressions. Even if a method appeared, they would not describe organic reach.

### 5.4 The "boost it" escape hatch

Meta's own reach guidance ends with "**Start advertising.** You can also improve your reach by
boosting a post or creating an ad"
([Best practices for improving reach](https://www.facebook.com/business/help/1424020861341537)).
Growth blogs repeat this as "seed the post with $5 to kickstart distribution". **Out of scope: this
creator is 100% organic.** Record it so nobody mistakes its absence for an oversight — and note
that Instagram elsewhere states the opposite premise about needing to pay: "**we don't suppress
content to encourage people to buy ads**"
([Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained)).

---

## 6. Myths — claims no Meta page supports

| Myth | What is actually documented | Verdict |
|---|---|---|
| "You're shadowbanned" | Instagram addresses the term head-on: "there isn't one shared definition… some people use the term to imply that a user's account or content is limited or hidden **without a clear explanation or justification**. When we rank content across Instagram, **that's not our intention**… **If anything makes your content less visible, you should know about it and be able to appeal.** That's why we've built features like Account Status" ([Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained)) | **Reframe, don't dismiss.** Something real exists — recommendation ineligibility — and it has a named, checkable surface. "Shadowban" as an invisible unappealable penalty is not what Instagram documents. Stop guessing and open Account Status |
| "Instagram throttles you to make you buy ads" | "**we don't suppress content to encourage people to buy ads.** It's a better business to make Instagram more engaging overall by growing reach for those who create the most engaging content" (same page) | **Denied on a Meta-owned page.** Not provable either way from outside, but the denial is on the record and no evidence contradicts it |
| "New accounts get a warm-up / probation period" | **Nothing documented.** No Meta page describes account age as a distribution factor. What *is* documented is a **per-post** cascade: "your reel is initially recommended and shown to a small audience… the best-performing reels are then shown to a slightly wider audience" ([Feb 26 2025](https://creators.instagram.com/blog/helping-creators-of-all-sizes-break-through)) | **Myth as stated.** The cascade is real and it is per-post, not per-account. It resets every post. Nothing suggests a new account serves a sentence |
| "You need N followers before the algorithm shows you to anyone" | "**creators of all sizes have an equal chance of breaking through and reaching new audiences**" ([Jan 21 2025](https://creators.instagram.com/blog/the-latest-with-instagram)); "distributing content based on its engagement, **not just** the creator's follower count" | **Myth for reach.** But **not** a myth for features: trial reels require **200 followers (professional)** / **1,000 (personal)** ([help](https://help.instagram.com/835643311711702/)); insights demographics need **100+ viewers**; follower trends need **100+ followers** ([help](https://help.instagram.com/788388387972460/)). Follower thresholds gate tools, not distribution. Also note Instagram *does* name "number of followers" as a Reels popularity signal — an input, not a gate |
| "Engagement pods / comment groups jump-start reach" | Instagram names "**coordinated comment networks intended to artificially drive engagement and distribution**" as content that may not be eligible for recommendations ([Recommendations on Instagram](https://help.instagram.com/313829416281232)). Account-level: "repeatedly engaged in misleading practices to build followings, such as purchasing 'likes'" | **Actively harmful, and documented as such.** This is the strongest myth-kill in the file: pods are on the non-recommendable list by name |
| "Post at 6pm / post at the optimal hour" | Mosseri: **no "direct correlation"** between being active when posting and reach ([SMT](https://www.socialmediatoday.com/news/instagram-chief-answers-creator-questions/744813/)). Buffer, 9.6M posts: "**Think of it as the cherry on top of your strategy, not the cake itself**" | **Overrated, not zero.** For a PH creator targeting global English across every timezone, a global-aggregate "best time" is close to meaningless. Deprioritise it |
| "Long captions with keywords boost reach" | Instagram names "**Long captions unrelated to the underlying content**" as non-recommendable ([Recommendations on Instagram](https://help.instagram.com/313829416281232)). Keywords are advised only for **search** ([Tips for Improving Your Reach](https://creators.instagram.com/blog/tips-for-improving-your-reach)) | Keywords earn in search. Padding a caption to hit a length is on the demotion list |
| "Adding a credit / border / subtitles makes a repost original" | "Re-uploading someone else's work… without adding meaningful creative input… such as **just adding a border, watermark, subtitles, or a credit in the captions**" ([Apr 30 2026](https://creators.instagram.com/blog/rewarding-original-creators-on-instagram)) | **Explicitly denied.** Not this creator's risk — they film their own footage — but it is the most-repeated bad advice in the space |
| "Delete and repost if a reel flops" | "reels that have **already been posted on Instagram**" are made less visible; "your trial reel may get limited reach if Instagram detects that you've previously shared the same content" | **Counterproductive and documented as such** |
| "Filming a concert makes you an aggregator" | "Photos or videos you took — your photography and edits are reflective of your creative vision." "Content copied without material edits — this is content **you didn't produce or film**" ([Original Content Guidelines](https://creators.instagram.com/original-content-guidelines)) | **Myth.** Footage you shot is original by definition. The music is a separate question governed by separate policies, and Meta says so in the same breath |
| "Instagram lets you target a country organically" | Nothing documented anywhere. One country signal is named as a *ranking input*, never as a control | **Myth.** See §4.5 |

---

## 7. The ten-minute in-app checklist

Ordered so the decisive checks come first. No analytics literacy required for steps 1–6.

**Account (2 min)**

1. **Are you on a professional (creator) account?** Settings → Account type and tools. If not,
   switch. Without it you cannot see the Recommendations Guidelines panel, cannot use trial reels,
   and cannot see viewer demographics. At ~200 followers you are exactly at the professional-account
   trial-reels threshold and below the personal-account one.
2. **Settings → More info and support → Account Status.** Read both panels:
   - **Community Standards** — anything removed?
   - **Recommendations Guidelines** (professional accounts only) — does it say your content can't be
     recommended right now? If yes: it shows a **sample of the offending content**. Use *Edit or
     remove content*, or *Disagree with decision*. **This single screen answers whether the account
     is eligible at all — which, with zero ad spend, is the whole question.**
3. **Look at your own profile as a stranger would.** The account-level list names "the account name,
   username, profile photo, bio or profile". A bio or photo can make the *whole account*
   non-recommendable.

**Upload settings (1 min)**

4. **Menu → Your app and media → Media quality → Upload at highest quality: ON.** Documented
   setting; low resolution is on the demotion list; the minimum is 720px / 30fps.

**The last three reels (4 min)**

5. **Is there an audio track attached?** If the reel is silent, it matches "muted" on the demotion
   list — by choice, which means it is free to fix. Attach library audio or Sound Collection audio to
   every reel from now on. If the picker looks thin, that is the documented business-account library
   restriction; Sound Collection is the documented fallback.
6. **Black bars?** A 16:9 concert clip letterboxed into 9:16 matches "contain borders". Reframe or
   crop to fill.
7. **How much of the frame is text?** Instagram publishes no threshold — keep captions to a band,
   never a full-frame card, and never text over a still.
8. **Any watermark?** TikTok save-button exports and some editors burn one in. Export clean per
   platform. Instagram's own **Edits** app is documented as exporting without a watermark.
9. **Has this exact clip been on Instagram before** — from you or from anyone else at the same show?

**Measure (3 min)**

10. **Insights → Viewers → top countries / top cities** (needs 100+ viewers over a preset window
    such as Last 30 days). This is the only documented way to see whether reach is landing in the
    Philippines or in the global-English audience being targeted.
11. **Run a trial reel.** Create a **new** cut — not a re-upload — toggle **Trial** before sharing,
    and read insights within 24 hours. It is shown to non-followers only, is ranked independently,
    and does not affect your normal reels. The cleanest available A/B: one cut with attached audio
    and a light text band, one cut in the current format.

**Do not:** join a pod, delete-and-repost a flop, pad the caption, or chase a posting time. Each is
either documented as demoted or documented as not a factor.

---

## 8. What this changes in the plugin

Out of scope to fix in this pass; recorded so the next one does not re-derive it.

| # | File | Change |
|---|---|---|
| 1 | `references/ranking-signals.md` | "**Follower count is not a named distribution signal on any of these pages**" is **wrong for Instagram**. The ranking page names "popularity signals such as number of followers" under *Information about the person who posted*. Correct to: named as an input, not documented as a gate |
| 2 | `references/ranking-signals.md` | The *Made less visible* row carries only watermarks / low resolution / already posted. Add **muted**, **borders**, **majority text** — all three are in the same sentence and all three hit this creator |
| 3 | `references/ranking-signals.md` | Add the Recommendations Guidelines list (§2.2), especially "coordinated comment networks" and "long captions unrelated to the underlying content" — both are demotion facts the plugin currently treats as taste |
| 4 | `references/platform-facts.md` | Add: minimum 720px / 30fps; aspect 1.91:1–9:16; the *Upload at highest quality* toggle; trial-reel thresholds 200 professional / 1,000 personal; insights demographics need 100+ viewers |
| 5 | `skills/ff-strategy` | Account Status is the **first** step for an Instagram reach complaint, not a corroborating one — under zero ad spend, eligibility is the mechanism. And it needs a professional account, which the skill should ask about before anything else |
| 6 | `skills/ff-strategy` | Add trial reels as the documented non-follower isolation test. It replaces the broken IG-vs-TikTok comparison with something that actually controls the variable |
| 7 | `skills/ff-package` / `ff-shotlist` | A muted export is a documented demotion. The shotlist should plan for audio that survives, and the package step should refuse to ship a silent reel without flagging it |
| 8 | `2026-08-20-diagnostics.md` open item #3 | "Sends per reach" moves from *untraceable* to *trade-press-attributed to Mosseri, still absent from every Meta-owned page*. Record the upgrade; keep the label |
| 9 | `2026-08-20-diagnostics.md` open item #5 | Resolved in the negative: the followers/non-followers split is documented for posts, stories and Live — **not reels** |

---

## 9. What could NOT be verified

Mandatory section. Everything here is honestly unresolved.

| # | Item | Why it failed |
|---|---|---|
| 1 | **What "majority text" means.** Any threshold, percentage, or pixel-coverage definition | The phrase appears exactly once in Meta's documentation — in one sentence on the 2023 ranking blog — and is never defined. Searched help.instagram.com, creators.instagram.com, about.instagram.com and transparency.meta.com. **This matters more than anything else unverified here, because the creator's entire format is on-screen text.** Any number a blog gives you is invented |
| 2 | Whether a **deliberately muted** reel is treated the same as a **copyright-muted** one | Both end at "muted", which is on the demotion list. No Meta page distinguishes the two cases or states whether the demotion is applied at upload, at detection, or at all. The stacking argument in §3 is a short defensible hop, not a documented mechanism — label it as a hop |
| 3 | **"View Rate"** as a live Instagram Insights metric | Instagram's own Feb 26 2025 creators post says "monitor your **View Rate** within Insights to understand what percentage of people continue to watch after the first 3 seconds". The current [reels insights help page](https://help.instagram.com/202865988324236/) lists only Views, Watch time, Viewers, Average watch time, Follows — **no View Rate**. Two first-party pages disagree. Confirming needs a logged-in professional account, which I do not have. **If View Rate is on the screen, it is the retention diagnostic the plugin has been saying Instagram doesn't have** |
| 4 | Which account types lose licensed-music-library access | "Certain business accounts and certain types of posts" is the whole of it. Meta publishes no mapping. Whether a **creator** account keeps full access is unstated — probable, not documented. Verify in-app |
| 5 | Whether library-audio choice affects reach at all | No Meta page connects Sound Collection vs licensed library, or trending vs non-trending audio, to distribution. The claims that do exist are all in the §5.3 rejected genre |
| 6 | The **10-pieces-in-30-days** aggregator threshold's current status | Stated in the Apr 2024 announcement; the Apr 2026 update restates the rule as "most … in a 30-day period" without the number. No page says the number was withdrawn or retained. Both are first-party; they differ in precision |
| 7 | Whether the **watermark reach-limited notification** ever shipped | Instagram's wording is still "we're **experimenting** with new notifications… and plan to expand to more people as we learn what's most effective", on a 2023 page. No ship announcement found in three years. Do not tell a creator to expect one |
| 8 | Any documented lever over **which country** sees a reel | Searched exhaustively. One country signal is named as a ranking *input*; nothing describes organic geographic targeting, and nothing describes language-based distribution. Absence of evidence, stated as absence of evidence |
| 9 | Whether an Instagram account can be non-recommendable **without Account Status saying so** | Instagram asserts the opposite — "if anything makes your content less visible, you should know about it and be able to appeal". That is a commitment, not a proof. Cannot be verified from outside |
| 10 | Anything about **account age** as a distribution factor | Searched every Meta creator surface. Found nothing in either direction. Absence of documentation is not proof there is no such mechanism — but it does mean every "new account warm-up" claim in circulation is unsourced |
| 11 | Reach behaviour **below 1,000 followers** | Socialinsider's smallest bucket starts at 1,000, business pages only. No large-N study found that measures accounts at ~200 followers. The creator's own band is unmeasured by anyone reachable |
| 12 | Whether **silent or low-audio reels** underperform, empirically | No large-N study with a stated method separates muted from unmuted reels. The three "sound-on percentage" figures in circulation contradict each other and none reaches a publisher. The case for attaching audio rests on Meta's own documentation, not on data |
| 13 | Whether Meta's `types-of-content-we-demote` page is meant to be exhaustive | It omits watermarks, muting, borders, majority text and resolution, all of which the Instagram ranking blog names. No page says which is the complete list. Cite each claim to the page that carries it |
| 14 | Metricool's paid/organic split | The 2026 study does not state whether boosted posts are excluded. Treated as predominantly organic; flagged rather than relied on for anything load-bearing |
| 15 | Whether the Account Status **Recommendations Guidelines** panel looks as the help page describes today | Login-gated. Everything in §4.1 comes from Meta's documentation of the surface, not from the surface. Documentation and UI drift |
