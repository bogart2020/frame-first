# frame-first — design record

Decided 2026-08-19 through a full grilling pass. Every entry here was chosen deliberately;
none is a default. Change them if reality disagrees, but know what you are overturning.

## Creator context

Philippines-based. iPhone 16 Pro. Concerts and cinematic scenes. **Global English audience**
(not PH-targeted — this is deliberate and drives the YouTube RPM math, since RPM follows the
viewer's location, not the creator's). Primary platforms: Instagram and TikTok. Secondary:
Facebook, YouTube.

## Decisions

| # | Decision | Chosen |
|---|---|---|
| 1 | Architecture | Router + 6 specialist skills; doctrine in `references/`, never inlined |
| 2 | Distribution | Symlinks + `sync.sh` (with `--check`); public GitHub repo; plugin-shaped |
| 3 | Creator state | Full set — voice, positioning, ideas, performance, hooks-used, trends |
| 4 | Audience | English only, maximize reach outside the Philippines |
| 5 | Output shape | Captions/scripts = brief with gaps; titles/hooks/hashtags = drafted then critiqued |
| 6 | Privacy | Plugin public, `data/` gitignored, `*.example.md` templates committed |
| 7 | Trend sourcing | Human-in-the-loop paste + legit auto-fetch; weighted to **format** over audio |
| 8 | Repo | `frame-first`, public, local install until proven |
| 9 | Commands | Skills everywhere + Claude-only slash commands |
| 10 | Gate strength | **Blocking**, names specific failures, may KILL an idea |
| 11 | Strategy | **Concert = proof/hook. Craft = product. Money from affiliate, LUTs, client work** |
| 12 | Naming | `ff-*`; dir name == frontmatter name == symlink name |
| 13 | Voice capture | `ff-init` interview + paste 10 real captions |
| 14 | Doctrine | Split into 4 reference files, rewritten as instructions not prose |
| 15 | Metrics | Screenshot input; **shares + watch-through primary**; likes untracked |
| 16 | YouTube API | Optional — works without a key, uses one if present |

## Verified environment facts

Established by inspection on 2026-08-19, not assumed:

- All three harnesses read `<name>/SKILL.md`: `~/.claude/skills/`, `~/.codex/skills/`, `~/.cline/skills/`
- The creator already runs this pattern — `~/Desktop/playwright_skill/skills/*` symlinked into `~/.claude/skills/`
- Cline symlinks with renamed links, so flat-namespace prefixing works at the link level
- Existing convention keeps **dir name == frontmatter `name:`** — `ff-*` follows it
- Several existing Cline symlinks are already **broken** (mattpocock targets moved into the plugins cache). This is why `sync.sh --check` exists

## Research findings that constrain the build

### Trend data — what cannot be fetched (verified 2026-08-19)

Live Instagram and TikTok trending audio **cannot be retrieved by any agent**:
Instagram's list is login-gated in the Professional Dashboard with no API export; the Graph API
reads owned accounts only; Meta Content Library needs academic affiliation. TikTok Creative
Center forbids automated fetching in its ToS (CAPTCHAs, rate limiting) and its Research API is
academic-only, barring commercial use. Facebook has no public Reels trend surface. YouTube has
no Shorts-audio endpoint.

Works: YouTube Data API v3 (`chart=mostPopular`, `regionCode`, ~100 searches/day free),
Google Trends (fragile — pytrends archived April 2025, 429s common), curated weekly roundups
(HeyOrca Fridays, Buffer, Later, Hootsuite — editorial, stale within a week).

**`ff-trends` must never fabricate a trending list.**

### Monetization — Philippines constraints (verified 2026-08-19, secondary sources)

- **TikTok Creator Rewards: not available in the Philippines.** PH paths are LIVE gifts and TikTok Shop affiliate
- **Instagram Gifts/Subscriptions: PH availability unverified**, PH absent from the named eligible list
- **Facebook Content Monetization: available in PH**, ~PHP 0.008–0.018/view
- **YouTube: available**; RPM follows viewer location, so the global-English audience is the single biggest lever

Flagged **unverified** by the research: Instagram PH status, TikTok PH launch timeline, exact
YouTube PH RPM, stock-footage revenue shares. Confirm against the real dashboard before acting.

### Concert footage + copyrighted music

TikTok mutes (near-certain; LIVE risks instant cut). Instagram demotes to followers or mutes.
YouTube places a Content ID **claim** — video stays up and monetized, revenue to the rights
holder, **no strike**. Facebook likely claim + shared revenue, policy undocumented. Fair use does
not cover concert footage.

**This is why decision 11 exists.** The two primary platforms are the two most hostile to the
primary subject. Library audio on IG/TikTok; real concert audio reserved for YouTube.

## Doctrine source — condensed for writing `references/`

Rewrite as instructions the agent acts on, not prose that persuades a reader.

**Idea over production.** Platforms personalize by predicted viewer satisfaction. The question is
not "does this look professional" but "why would this person care right now". Meta: 75% of US
Instagram recommendations came from original posts in Q4 2025.

**Openings.** YouTube grades Appeal → Engagement → Satisfaction; deliver the title's promise fast.
A hook is not "you won't believe" — it is a specific unresolved question, tension, or recognition.
Strongest shape: tension between two truths.

**Curiosity must be paid off.** Question → tension → exploration → reveal → payoff. Clickbait
opens the gap and refuses to close it.

**Relatability and identity.** People share what says something about them. Discrete emotions —
amusement, sadness, anger — predict sharing; positivity alone does not. A share beats a like
because it travels through a relationship.

**Specificity is the antidote to slop.** "The concert was unforgettable" vs. "the lights went dark
and for a few seconds I couldn't hear anything except 15,000 people singing the first line."
Concrete detail reads as evidence of having been there.

**Human beats perfect.** Polish should serve the idea, not erase the person. Recognizable AI
sameness is the actual problem, not AI involvement.

**Originality is distribution.** Meta deprioritizes duplicative content; captions, speed changes,
and borders on someone else's video are not transformative.

**Trends are templates.** Format + your specific observation. 33% of consumers find brands
chasing viral trends embarrassing.

**Search-first.** Social behaves like search. Put natural topic phrases in titles, spoken words,
and on-screen text — "best optical zoom phone for video in 2026", not "worth it?".

**Retention ≠ satisfaction.** Manufactured retention leaves the viewer feeling robbed.

**Myths to contradict:** no universal cadence; no universal optimal length; more hashtags ≠ more
reach; follower count is decoupled from distribution (only 17% of consumers check it); viral ≠ good.

**The publish test:** *why would someone send this to one specific person?*

## Build order

1. `references/` — everything else reads these ✅ verify: no stub markers remain
2. `ff-init` — nothing works without voice data ✅ verify: dry-run writes both data files
3. `ff-critique` — the gate the others hand off to ✅ verify: KILLs a deliberately generic caption
4. `ff-ideas`, `ff-package` ✅ verify: output carries all six required elements
5. `ff-trends` ✅ verify: refuses to invent trending audio when asked to
6. `ff-strategy` ✅ verify: states "unverified" on the flagged monetization figures
