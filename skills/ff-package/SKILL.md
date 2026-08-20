---
name: ff-package
description: Writes hooks, captions, on-screen text, titles, hashtags, and SEO phrasing tailored per platform. Use when footage is ready and the post needs words, or when adapting one piece of content across Instagram, TikTok, YouTube, and Facebook.
---

# ff-package

Everything that wraps the footage, written natively per platform.

## Step 0 — ground it before drafting

**Read the references before writing a word.** Not optional, and not a web search — the facts are
already verified and local:

- `references/ranking-signals.md` — what the target platform documents that it rewards, the
  hashtag caps, and where searchable phrasing actually earns
- `references/platform-facts.md` — audio and format constraints, including the ones that decide
  whether the post is publishable at all
- `references/hooks.md` — the architecture, checked against `data/hooks-used.md` for repetition

**State which constraint drove each platform's copy.** "Five hashtags because Instagram caps
there" is a checkable claim; "here are some hashtags" is not. Anything asserted about platform
behaviour must trace to one of those files — if it does not, say it is a judgment call.

**Live research is not part of this.** Ranking mechanisms change on the order of months and are
already captured. What is genuinely unretrievable — current trending audio, competitor stats — is
listed as unretrievable in `references/platform-facts.md` and does not become available by trying
harder.

## Output contract

**Captions and scripts — brief with gaps.** Draft the structure, the hook options, and the beats.
Leave the sensory specifics as explicit blanks:

> "The moment the lights dropped, [the specific thing you noticed in the third song]."

Those blanks stay blank. Witness detail is what makes the post work, and the agent was not there;
anything invented to fill the gap is fiction under the creator's name. Marking the gap clearly is
the deliverable.

**Titles, hooks, on-screen text, hashtags — drafted fully**, then handed to `ff-critique`.

## Per platform

Read `references/platform-facts.md` for the audio and monetization constraints that drive these.

- **Instagram / TikTok** — visual-led, library audio. Hook lands in the first frame. Searchable
  phrasing goes in spoken words and on-screen text, where it is actually indexed.
- **YouTube** — the only platform where real concert audio can survive, but **the format decides
  whether it does**: a vertical clip up to three minutes is a Short, and a Short over one minute
  carrying a Content ID claim is blocked. Read `references/platform-facts.md` before promising real
  audio anywhere. Title carries search intent. Length is whatever delivers the value; there is no
  universal optimum.
- **Facebook** — community and shareability framing.

## SEO

Every package includes a phrase someone would type. "Best phone for filming concerts in low
light" earns search traffic; "worth it?" earns none.

## Hashtags

Draft them for **targeting and search**, never for volume. Per `references/ranking-signals.md`,
Instagram caps at five and states that fewer targeted tags outperform many generic ones; TikTok
names hashtags as content information; YouTube calls tags "not important".

**Fill every slot you get, and make each one earn its place.** Instagram's five is a budget to
spend well, not a limit to avoid. Build the set in this order, stopping at the platform's cap:

1. **The specific subject** — the artist, song, tour, or venue. Highest intent; someone searching
   this wants exactly this. `#kodaline`, `#lovewillsetyoufree`, `#farewelltour`
2. **The niche** — what kind of creator work this is. `#concertcinematography`, `#iphonefilmmaking`
3. **The discovery term** — what a stranger who doesn't know the artist would search.
   `#lowlightvideo`, `#concertfootage`
4. **Region, only when targeting one.** `#concertph` narrows to the Philippines — omit it when the
   goal is reach outside PH, since it signals a local audience for a global-English post.

**Rules:** no tag that could sit under any video (`#viral`, `#fyp`, `#instagood`) — those are the
"many generic ones" Instagram names as worse. No tag describing a thing not in the video. On
TikTok, where there is no hard cap, still stop when the tags stop being specific — a generic tag
adds a category, not an audience.

**Where the phrase earns is platform-specific** — see `references/ranking-signals.md`:

- **TikTok** weights content-query match most heavily in search, so spoken words and on-screen
  text are the highest-leverage placement. This is where searchable phrasing pays best.
- **Instagram** is genuinely ambiguous: its transparency page names username, profile name, and
  hashtags as search signals and omits caption text, while its creator guidance tells creators to
  put keywords in the caption. Include them — they cost nothing — but do not promise they will earn
  Instagram search traffic.
- **YouTube** weights title and description. Tags are documented as "not important" — never draft
  them as an SEO play.

✅ **Done when** each platform has native copy, every sensory blank is marked rather than filled,
and one searchable phrase appears in spoken or on-screen text.

## Reads / Writes

**Paths:** everything below is relative to the plugin root, not the open project. Resolve first:
`FF="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$(readlink "$HOME/.claude/skills/ff-init")")")}"; eval "$("$FF/scripts/ff-paths.sh")"`
then read and write via `$FF_DATA`, `$FF_REFS`, `$FF_SCRIPTS`.

- Reads: `data/voice.md`, `data/ideas.md`, `references/hooks.md`, `references/platform-facts.md`,
  `references/ranking-signals.md`
- Writes: appends the hook architecture used to `data/hooks-used.md`

**Cold start:** with no `data/voice.md`, draft anyway using whatever the creator has said in this
conversation, and note once that the voice read is thin. Do not withhold output or push them into
`ff-init`. When they rewrite what you drafted, record it per the router's *Learn from the
correction* — that rewrite is worth more than an interview answer.

## Boundaries

Writes the words around finished footage. Does not approve its own output — every package goes to
`ff-critique`. Does not generate premises (`ff-ideas`) or plan shots (`ff-shotlist`).

## Gotchas

- **One caption pasted to four platforms wastes three of them.** Each has a different reading
  posture. Write natively or admit the cross-post is a compromise.
- **Filling a sensory blank is the failure mode this skill is designed around.** The temptation is
  strongest when the draft reads incomplete — that incompleteness is the point.
- **Hashtags are a targeting and search mechanism, not a reach mechanism.** Instagram caps them at
  five and says fewer targeted ones beat many generic ones. Spend the slots — see Hashtags below.
- **Hook variety matters more than hook quality in aggregate.** Check `data/hooks-used.md`.
