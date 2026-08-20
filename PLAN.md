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
| 11 | Strategy | **Footage = proof/hook. Craft = product. Money from affiliate, LUTs, client work.** *Amended 2026-08-20: originally concert-specific; de-scoped to any subject at the creator's request. Principle unchanged* |
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

**Moved.** All dated platform claims — concert-audio handling, what trend data is and is not
retrievable, and Philippines monetization status — now live in `references/platform-facts.md`.
That is the single place they age, and the single place to re-verify. They were previously
restated across seven files, which guaranteed drift.

## Doctrine source — condensed for writing `references/`

Rewrite as instructions the agent acts on, not prose that persuades a reader.

> **Every percentage in this section is unverified** unless `references/` carries it with a
> primary source. See Evidence quality below. These figures were directional input for writing the
> references; they are not facts, and no skill restates them — `references/ranking-signals.md`
> holds the first-party version of these claims. Do not promote one back into a skill.

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

**Trends are templates.** Format + your specific observation. (An oft-quoted "33% of consumers
find brands chasing viral trends embarrassing" was **not verified** — see Evidence quality below,
and do not restate it as fact. The verified version of this point is Meta's own demotion of
content "principally repurposed from other sources", in `references/ranking-signals.md`.)

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

---

# Hardening round — 2026-08-19

Driven by three research passes (GitHub skills survey, Anthropic skill-authoring guidance,
anti-slop prior art) plus a writing-for-agents audit of the scaffold.

## Defects found and fixed

| Defect | Evidence | Fix |
|---|---|---|
| No router, despite decision 1 | `skills/` held 6 flat skills | Built `frame-first` router |
| Descriptions truncated in UI | All 6 were 268–329 chars against a ~250 display limit | All 8 now under 250, "what + when + triggers" formula |
| One meaning in many places | Concert-audio fact in 7 files, monetization in 4 | `references/platform-facts.md` is now the only source |
| Dated facts inside skill bodies | 3 skills carried hard dates, against Anthropic guidance | Moved to the dated reference file |
| Steering by prohibition | 18 "never/do not" across 6 skills | Down to 7, kept only as hard guardrails |
| No Gotchas | 0 of 6 — Anthropic calls this the highest-signal skill content | 8 of 8 |
| Prose-only quality gate | No deterministic layer | `scripts/slop-check.sh` |
| No evals | none | `evals/` with per-skill regressions |
| No cold-start handling | every skill assumed `data/` populated | Explicit fallback in each |
| No boundaries | no skill said what it refuses | Boundaries section in each |

## Hardening decisions

| # | Decision | Chosen |
|---|---|---|
| 17 | Gate architecture | Two-stage: `slop-check.sh` then judgment. Pairwise against the creator's real captions, not an abstract standard. Hard-block on deny-list, FIX on 2+ soft failures, never hair-trigger. Persona pass reserved for posts that matter |
| 18 | Scripts | **Bash only.** `grep` is present everywhere and needs no install. Python stylometrics were declined — they produce exactly the false positives that make a gate untrusted |
| 19 | Roster | Added `ff-shotlist`. Competitor analysis declined: it pulls toward imitation, against the whole strategy |
| 20 | Naming | Kept `ff-*` nouns. **Deliberate departure** from Anthropic's gerund convention — the descriptions carry intent, and ergonomics wins for daily use |
| 21 | Evals | Written test cases, run by hand, across Haiku/Sonnet/Opus |

## Leading words introduced

- **Witness detail** — a detail only someone present could supply. Replaces the weak abstraction
  "specificity", which a model believes it already satisfies.
- **The send test**, **proof not product**, **SHIP/FIX/KILL** — defined once in the router.

## Contradiction resolved

writing-for-agents says negation is a failure mode: prohibitions make the forbidden behavior
*more* available. The voice research says banned-phrase lists are the most effective voice
control available.

Both hold, because they describe different mechanisms. A behavioral steer in prose suffers the
elephant problem; a phrase deny-list is a **lookup**. So the deny-list moved into
`scripts/slop-check.sh` where `grep` enforces it mechanically, and the prose switched to positive
targets. Neither technique is compromised.

## De-scoping round — 2026-08-20

The creator asked that the plugin stop assuming concerts and handle any subject thrown at it.
This overturns decision 11 and one HANDOFF constraint; both are amended in place rather than
silently rewritten.

| Changed | To |
|---|---|
| `ff-shotlist` assumed venue, crowd, set length | Asks what is being shot; constraints are elicited, not assumed |
| `platform-facts.md` led with "concert footage and copyrighted music — the constraint that shapes the whole strategy" | "Copyrighted music in footage", applying to any source of recorded music, with concert as the strictest worked example |
| `ff-package` hashtag ladder used concert tags | Subject-agnostic ladder; the rungs are fixed, the tags are not |
| Descriptions on `ff-shotlist` and `ff-trends` named concerts and phone cinematography | Subject-neutral |
| `ff-trends` weighted audio low because "nobody discovers a concert video through its sound" | Same weighting, but conditioned — audio matters for dance, comedy, lip-sync, music-led formats |

**Deliberately unchanged:** the anti-slop machinery. Witness detail, the send test, SHIP/FIX/KILL,
blanks stay blank, and the deny-list are all subject-independent and were never concert-coupled.

**Still concert-flavoured on purpose:** worked examples throughout. An abstract instruction is
harder to follow than a concrete one; the rule is that examples illustrate and never gate.

## Evidence quality

- **Anthropic authoring guidance** — official, acted on directly.
- **Ternary-over-numeric, pairwise-over-absolute** — matches independent expectation, acted on.
- **The GitHub repo survey** — patterns corroborated across three agents and by Anthropic's docs,
  but individual repos were **not verified to exist**. Patterns adopted; specific repo claims not.
- **Percentages** ("68% of skills fail on descriptions", "85% human agreement") — single community
  posts and unverified arXiv IDs. Directional only; no threshold was set from them.
