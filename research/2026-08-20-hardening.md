# Hardening research — 2026-08-20

Research pass only. No skill was changed. Every dated claim below carries the source that owns it
and the date it was checked. Claims that reached only secondary sourcing are labelled
**unverified** and are not promoted to fact anywhere in this file.

Verification environment: Claude Code CLI **2.1.235**, macOS 25.6.0.

Conventions used in the tables:

| Term | Meaning |
|---|---|
| **Confirmed** | An official page owned by the platform states it. URL given. |
| **Corrected** | Official page contradicts or materially narrows the claim in `references/platform-facts.md`. |
| **Unverified** | Only secondary sourcing, or absence-of-evidence. Do not treat as fact. |
| **Unreachable** | The owning page exists but blocked automated access. Recorded as such. |

---

## 1. What changed since 2026-08-19

**Nothing on any platform changed in one day.** The file is not stale on elapsed time.

What did change is what can now be *proved*. Re-verification against primary sources moved four
rows and corrected two:

| # | Change | Direction |
|---|---|---|
| 1 | YouTube Shorts over one minute with an active Content ID claim are **blocked**, not "up and monetized" | Correction — material, and it hits the exact format this creator posts |
| 2 | Instagram Gifts **and** Subscriptions confirmed absent from the Philippines on Instagram's own country lists | Upgrade: "Unverified" → Confirmed unavailable |
| 3 | Facebook Content Monetization in PH confirmed on Meta's own availability page, not just a press post | Upgrade: secondary → primary |
| 4 | Meta's music handling **is** publicly documented; `platform-facts.md` says it is not | Correction |
| 5 | TikTok auto-muting of copyrighted audio has **no** primary source | Downgrade: "near-certain" → unverified |
| 6 | `claude plugin eval` and `claude plugin validate` exist in the installed CLI; neither is in the plugin's tooling | New capability available to adopt |

Two dated facts surfaced that the file does not carry and now should:

- Facebook **In-stream ads for Live ended 2026-06-15**
  ([Meta Business Help Center 267128784014981](https://www.facebook.com/business/help/267128784014981), verified 2026-08-20).
- Instagram Gifts pays **$0.01 USD per star** received
  ([help.instagram.com/738469380549477](https://help.instagram.com/738469380549477), verified 2026-08-20).

---

## 2. Skill-authoring findings

Primary sources, both verified 2026-08-20:

- [Extend Claude with skills](https://code.claude.com/docs/en/skills) — Claude Code frontmatter reference
- [Skill authoring best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices) — cross-product guidance
- [Plugins reference](https://code.claude.com/docs/en/plugins-reference) — plugin manifest, env vars, validation

### 2.1 Verdict table

| # | Item | What the official docs say | Plugin state | Verdict |
|---|---|---|---|---|
| 1 | `description` length | Spec max **1,024 chars**. Claude Code truncates `description` + `when_to_use` combined at **1,536 chars** in the listing. Separately, the whole skill listing has a budget of **1% of the model's context window**; on overflow Claude Code drops descriptions starting with least-used skills | All 8 are 182–236 chars | **Already doing.** But PLAN.md's stated reason ("~250-char UI display limit") is **not in current docs**. The behaviour is real, the number is not. Fix the rationale, keep the lengths |
| 2 | `name` gerund vs noun | "Consider using **gerund form**". Then, verbatim: "**Acceptable alternatives:** Noun phrases: `pdf-processing`, `spreadsheet-analysis`" | `ff-*` nouns | **Already doing.** Decision 20 stands, but PLAN.md overstates it as a "deliberate departure" — noun phrases are explicitly sanctioned. Hard rules only: ≤64 chars, lowercase/digits/hyphens, no `claude`/`anthropic` |
| 3 | `${CLAUDE_PLUGIN_ROOT}` | Substituted in plugin skill markdown **and** in Bash rules in `allowed-tools`. Resolves to the plugin's install directory | **Zero occurrences** in the repo | **ADOPT — P0.** See §4.1 |
| 4 | `${CLAUDE_PLUGIN_DATA}` | `~/.claude/plugins/data/{id}/`, survives plugin updates, deleted on uninstall | Not used; `data/` lives in the repo, overridable by `FRAME_FIRST_DATA` | **Adopt as a documented option, not a default.** The creator's voice profile surviving a plugin update is exactly the use case; but deletion-on-uninstall is a real risk for hand-written interview output. Keep `FRAME_FIRST_DATA` as the escape hatch |
| 5 | `allowed-tools` | Pre-approves tools for the turn that invokes the skill; grant clears on the next user message. Same-variable substitution in body and rule lets a bundled script run without a prompt | Not used | **ADOPT.** `ff-critique` shells out to `slop-check.sh` on every run |
| 6 | `disallowed-tools` | Removes tools from the pool while the skill is active | Not used | **Ignore.** No skill here needs a tool removed |
| 7 | `when_to_use` | Optional; appended to `description`, counts against the same 1,536 cap | Not used | **Ignore.** Triggers already live in the descriptions; splitting them buys nothing and costs the same budget |
| 8 | `disable-model-invocation` | Prevents auto-loading; also blocks preloading into subagents | Not used | **Consider (low).** Only plausible for `ff-init`, a one-time interview with disk side effects. Weigh against the cold-start routing that currently depends on Claude reaching for it |
| 9 | `context: fork` / `agent` / `background` | Runs the skill in a forked subagent with no conversation history | Not used | **Ignore.** Every skill here depends on the creator's in-conversation answers |
| 10 | `model` / `effort` | Per-skill model and effort override | Not used | **Consider (low).** Would let `ff-critique` pin a stronger model, but PLAN.md decision 21 deliberately wants the gate to hold on Haiku. Pinning would mask the regression the evals exist to catch |
| 11 | `metadata` / `license` / `compatibility` | The three portable spec fields beyond `name`/`description`/`allowed-tools` | Not used | **Adopt `license` only, if at all.** Low value |
| 12 | Portability ceiling | Outside Claude Code, only six fields are legal: `name`, `description`, `license`, `compatibility`, `metadata`, `allowed-tools`. Anything else is a **hard error** on claude.ai upload / Skills API / `package_skill.py` | Uses `name` + `description` only | **Already doing — and this is a live constraint.** The plugin targets Claude, Codex, and Cline. Adding `when_to_use`, `paths`, `argument-hint`, `hooks` etc. makes the skills unpackageable. Record this before anyone adds a field |
| 13 | 500-line SKILL.md ceiling | "Keep `SKILL.md` under 500 lines" | 58–109 lines | **Already doing** |
| 14 | One-level-deep references | "Keep references one level deep from SKILL.md." Nested references get partially read (`head -100`) | `SKILL.md` → `references/*.md` is one hop | **Already doing** |
| 15 | TOC in long reference files | Required above 100 lines | Longest reference is `arrrsr.md` at 90 lines | **Already doing** (no action, but `arrrsr.md` is close to the line) |
| 16 | Avoid time-sensitive info in SKILL.md | "Don't include information that will become outdated" | Hardening round already moved every date into `references/platform-facts.md` | **Already doing — and it is the right read of the guidance.** Keep it |
| 17 | Third-person descriptions | "Always write in third person" — first/second person causes discovery problems | All 8 are third person | **Already doing** |
| 18 | Test on Haiku, Sonnet, Opus | Explicit checklist item | Decision 21 | **Already doing** |
| 19 | ≥3 evaluations per skill | "At least three evaluations created" | 9 written cases across 8 skills — `ff-package`, `ff-strategy`, `ff-init`, `ff-ideas`, `ff-shotlist` have 1–2 each | **Gap.** Only `ff-critique` and `ff-trends` clear the bar |
| 20 | Skill content lifecycle | Rendered `SKILL.md` enters the conversation **once** and stays; **Claude Code does not re-read the file on later turns**. "Write guidance that should apply throughout a task as standing instructions rather than one-time steps" | Not accounted for | **ADOPT as an authoring rule.** Directly relevant: `ff-critique`'s refusal to be talked into a SHIP must read as a standing rule, not a step in a sequence that has already "run" |
| 21 | `plugin.json` optional fields | `homepage`, `repository`, `license`, `keywords`, `displayName` | Only `name`, `version`, `description`, `author` | **Adopt (low).** `keywords` aids marketplace discovery |

### 2.2 Tooling the plugin can adopt

**`claude plugin validate`** — documented, generally available.

```bash
claude plugin validate ./my-plugin [--strict]
```

Checks `plugin.json` syntax and schema, skill/agent/command frontmatter, and `hooks/hooks.json`.
`--strict` turns warnings into errors (exit 1) — meant for CI.

**Trap found by running it (2026-08-20):**

```
$ claude plugin validate .
Validating marketplace manifest: .../.claude-plugin/marketplace.json
✔ Validation passed
```

Because `.claude-plugin/marketplace.json` exists, the bare invocation validated **only the
marketplace manifest** and never looked at a single skill. It reports a clean pass. To actually
check the skills:

```bash
claude plugin validate ./skills --strict     # → "Validating components in: .../skills" ✔
claude plugin validate ./commands --strict   # ✔
```

Both pass today. The point is that the green tick from `validate .` means almost nothing here.

**`claude plugin eval`** — present in CLI 2.1.235, **gated**:

```
$ claude plugin eval help
`plugin eval` is currently in early access
```

Not documented on `code.claude.com` (absent from `llms.txt`, verified 2026-08-20). The `--help`
output is first-party and is the source for what follows.

```bash
claude plugin eval init --bare <name>   # writes prompt.md + graders/criteria.md
claude plugin eval [target]             # target = path | plugin name | plugin@marketplace
```

Case format: `<eval dir>/**/case.yaml`, or `prompt.md` + `graders/*.md`. **The eval dir defaults
to `evals/`** — which this repo already has, under that exact name.

Flags that matter for this plugin:

| Flag | Why it matters here |
|---|---|
| `--ablation with-without` | Runs a no-plugin baseline arm and reports the score delta. This is exactly the baseline comparison the best-practices page calls for, automated |
| `--runs <n>` | Default 3 per case. Non-determinism is the reason the hand-run evals are unreliable |
| `--threshold <0..1>` | Exit 1 if any case scores below it — turns the eval suite into a CI gate |
| `--model` / `--judge-model` | Runs the suite on Haiku, then Sonnet, then Opus, without re-typing prompts by hand. Judge defaults to Haiku |
| `--json [path]` | Machine-readable results |
| `--max-cost-usd` | Hard budget ceiling |
| `--no-publish` | Keeps the HTML report local. **Default is to publish it to claude.ai** — worth knowing before running it on a repo with a personal voice profile |

Second option, documented and not gated: the **skill-creator plugin**
(`/plugin install skill-creator@claude-plugins-official`), which stores cases in
`evals/evals.json` inside the skill directory and produces `grading.json` / `benchmark.json`, plus
a description-tuning mode that measures should-trigger vs should-not-trigger hit rate.
([skills doc](https://code.claude.com/docs/en/skills), verified 2026-08-20.)

**`/skill-doctor`** — I found **no first-party page** for it. Multiple independent third-party
GitHub repos publish a plugin under that name, and one aggregator attributes a `skill-doctor` to
`anthropics/claude-plugins-community`, which I did not confirm at the repo. **Treat as
unverified**; use `claude plugin validate` and `/doctor` instead. `/doctor` is documented and
reports the skill listing's context cost and its biggest contributors.

---

## 3. Platform-facts re-verification

All verified **2026-08-20**.

### 3.1 Concert footage and copyrighted music

| Claim in `platform-facts.md` | Verdict | Primary source | Confidence |
|---|---|---|---|
| TikTok: "Audio muted, near-certain" | **Unverified** | [TikTok IP Policy](https://www.tiktok.com/legal/page/global/copyright-policy/en) documents removal *on rightsholder report*; it does not describe automatic detection behaviour at all | Low. No primary source states TikTok auto-mutes |
| TikTok LIVE: "risks an immediate cut" | **Unverified** | Not found in policy pages | Low |
| Instagram: "demotes reach to followers only, or mutes" | **Confirmed in substance** | [Meta Music Guidelines](https://www.facebook.com/legal/music_guidelines) — Meta "may block, mute, or remove your content"; higher music density makes limitation more likely; recorded audio must not be the primary purpose | High for block/mute/limit. The specific mechanism "reach to followers only" is **not** stated — that phrasing is more confident than the evidence |
| YouTube: "Content ID **claim** — not a strike" | **Confirmed** | [Learn about Content ID claims](https://support.google.com/youtube/answer/6013276) — "Copyright strikes happen as a result of a valid copyright removal request. Content ID claims are different from copyright removal requests" | High |
| YouTube: "video stays up and monetized, revenue to the rights holder" | **Corrected — materially** | Same page: "**Shorts longer than one minute that have an active Content ID claim, regardless of the policy, will be blocked on YouTube.**" The "stays viewable" language applies to **videos longer than three minutes** | High. This is the single most consequential error in the file for a short-form creator |
| Facebook: "likely claim + shared revenue; **policy not publicly documented**" | **Corrected** | [Meta Music Guidelines](https://www.facebook.com/legal/music_guidelines) covers Facebook and Instagram together, names block/mute/remove, and names ineligibility for Music Revenue Share. It explicitly covers live videos | Medium-high. The policy *is* documented; what is undocumented is the revenue split |

**Consequence for the plugin.** The stated strategy — "Real concert audio belongs on YouTube" — is
now wrong for the format the creator actually posts. A vertical clip of 1–3 minutes is a Short by
YouTube's own classification, and a Short over one minute carrying a Content ID claim is blocked
outright. The safe YouTube path for real concert audio is a **horizontal or over-three-minute**
upload, not a Short.

### 3.2 Trend data reachability

| Claim | Verdict | Primary source | Confidence |
|---|---|---|---|
| YouTube Data API v3: `chart=mostPopular`, `regionCode` | **Confirmed** | [YouTube Data API](https://developers.google.com/youtube/v3/getting-started) | High |
| "~100 searches/day on the free quota" | **Confirmed — and the units concern in the brief is out of date** | Same page, verbatim: "Projects that enable the YouTube Data API have a default quota allocation of **100 `search.list` calls, 100 `videos.insert` calls, and 10,000 units per day combined for all other endpoints**." Google now allocates search calls separately from the unit pool | High. The file's number is correct. If anything it is now *more* correct than the old "10,000 units, search costs 100" framing |
| pytrends "archived April 2025" | **Split** | [GitHub API, GeneralMills/pytrends](https://api.github.com/repos/GeneralMills/pytrends) returns `"archived": true`, last push `2024-08-10`. `archived_at` is null | Archived: high. **The April 2025 date is unverified** — GitHub does not expose an archive timestamp here |
| Google Trends direct requests "commonly return 429" | **Unverified** | Not tested; no official statement | Low |
| Instagram trending audio: login-gated, no API export | **Unverified by absence** | No Instagram page asserts the negative. Graph API has no trending-audio endpoint, but absence of an endpoint is not a citable claim | Medium in practice, low as a citation. The operational conclusion is sound; the wording should say "no endpoint exists that we could find", not state platform intent |
| Meta Content Library: academic/nonprofit only | **Confirmed, verbatim** | [Meta Content Library](https://transparency.meta.com/researchtools/meta-content-library/) — "Affiliation with an academic institution or other non-university organization, institute, or society which operates as a not-for-profit entity and holds scientific or public interest research as a primary purpose or core activity is required to be eligible for access" | High |
| TikTok Research API: academic-only, commercial barred | **Confirmed, verbatim** | [TikTok Research API FAQ](https://developers.tiktok.com/doc/research-api-faq) — "I am a creator, advertiser, or commercial user. Am I eligible for access to the Research Tools? **No.**" | High |
| TikTok Creative Center: "ToS forbids automated fetching" | **Split — Unreachable + Confirmed empirically** | The Creative Center ToS URL 404s. Empirically, an automated browser navigation to `ads.tiktok.com/business/creativecenter/...` returned **HTTP 403** on 2026-08-20 | Blocking in practice: high (observed). **The ToS assertion is unverified** — reword to "blocked to automated access" |
| Facebook Reels: "no public trend surface exists" | **Unverified by absence** | — | Low as a citation, sound in practice |
| YouTube Shorts: "no Shorts-specific audio endpoint" | **Unverified by absence** | — | Low as a citation, sound in practice |

### 3.3 Philippines monetization

| Claim | Verdict | Primary source | Confidence |
|---|---|---|---|
| TikTok Creator Rewards **not available in PH** | **Confirmed, verbatim** | [TikTok Creator Academy — eligibility](https://www.tiktok.com/creator-academy/article/eligibility): "The program is currently open to creators in the **United States, the United Kingdom, Germany, Japan, South Korea, France, Mexico, and Brazil**, so you must be based in one of these countries and have an account registered there." Philippines absent | High |
| Instagram **Gifts** — "Unverified, PH absent from list" | **Confirmed unavailable** | [How to earn money on Instagram Gifts](https://help.instagram.com/738469380549477) — official country list runs …Mexico, The Netherlands, New Zealand, **Peru, Poland**, Portugal… The Philippines is absent at its alphabetical position | High. Upgrade the file from "Unverified" |
| Instagram **Subscriptions** — same | **Confirmed unavailable** | [Eligibility requirements for Instagram Subscriptions](https://help.instagram.com/478012211024479) — same alphabetical gap between Peru and Poland | High. Upgrade the file |
| Facebook Content Monetization **available in PH** | **Confirmed** | [Meta Business Help Center 267128784014981](https://www.facebook.com/business/help/267128784014981) lists "The Philippines" in the official country/territory availability list. Corroborated by [Meta for Creators](https://creators.facebook.com/helping-creators-earn-from-more-types-of-content) (2024-02-29) | High |
| "roughly PHP 0.008–0.018 per view" | **Unverified** | Meta publishes **no** per-view rate anywhere I could reach | Low. Keep the unverified flag exactly as it is. Do not quote this as a number the creator can plan against |
| YouTube: "RPM follows the **viewer's** location, not the creator's" | **Confirmed in substance** | [YouTube revenue metrics](https://support.google.com/youtube/answer/9314357) — "Different locations will have different levels of competition in the ad market, so CPMs will vary by geography", and shifts in audience geography change earnings at constant views | High. Note the mechanism is CPM by ad market, which is what drives RPM — say it that way rather than as a bare rule |
| YouTube Partner Program available in PH | **Not re-checked** | — | See §5 |

**New, and missing from the file:** Facebook **In-stream ads for Live ended 2026-06-15**
([source](https://www.facebook.com/business/help/267128784014981)). Any advice that routes concert
LIVE to Facebook for ad revenue is dead.

---

## 4. Prioritized hardening recommendations

### P0 — correctness; the plugin gives wrong answers today

**4.1 Replace the `readlink` path hack with `${CLAUDE_PLUGIN_ROOT}`.** *Effort: ~1 hour.*

Nine occurrences across all eight skills and `scripts/ff-paths.sh` hardcode this:

```bash
eval "$("$(dirname "$(dirname "$(readlink -f ~/.claude/skills/ff-init)")")/scripts/ff-paths.sh")"
```

Three independent failure modes:

1. **Marketplace or `claude plugin install` copy** — there is no `~/.claude/skills/ff-init`
   symlink. The plugin lives in the plugin cache. Every path resolution fails, and the failure is
   silent enough that the model will fall back to reading `data/voice.md` relative to whatever
   project is open.
2. **Non-Claude harnesses** — the path is hardcoded to `~/.claude/skills/`, so a Codex or Cline
   session resolves the wrong root or nothing.
3. **`readlink -f`** is a GNU extension. BSD `readlink` on older macOS has no `-f`. It fails
   silently into an empty string, which makes `dirname` return `.`.

The documented mechanism ([skills doc](https://code.claude.com/docs/en/skills), verified
2026-08-20): `${CLAUDE_PLUGIN_ROOT}` is substituted in plugin skill markdown, and
`${CLAUDE_SKILL_DIR}` for skill-local files. Both also substitute inside `allowed-tools` Bash
rules, which is what lets the script run without a permission prompt.

Keep `ff-paths.sh` — it is already self-locating via `BASH_SOURCE` and is the correct fallback for
harnesses that do not substitute. The change is to make the *invocation* use the variable:

```bash
eval "$("${CLAUDE_PLUGIN_ROOT}/scripts/ff-paths.sh")"
```

Note the ordering constraint: `${CLAUDE_PLUGIN_ROOT}` is substituted **only in plugin skills**. If
the symlink distribution in `sync.sh` remains the primary install path for Codex/Cline, the skills
need both forms, with the variable first and the `readlink` chain as a documented fallback.

**4.2 Correct the YouTube Content ID row.** *Effort: 15 min.*

Evidence in §3.1. Current text tells the creator that real concert audio belongs on YouTube. For a
1–3 minute vertical clip — a Short by YouTube's own 2024-10-15 classification rule — an active
Content ID claim **blocks** it regardless of policy. The row needs the Shorts carve-out and the
strategy line needs "horizontal or over three minutes" attached.

**4.3 Downgrade the TikTok mute claim.** *Effort: 15 min.*

"Audio muted, near-certain" has no primary source. This matters more than it looks: the whole
plugin is built on not fabricating, and its own facts file carries an unsourced near-certainty.
Reword to what is actually known, and mark it unverified alongside the monetization figures.

**4.4 Fix the "policy not publicly documented" line on Facebook.** *Effort: 10 min.*

Meta's Music Guidelines are public and cover Facebook and Instagram together, including live video.
Cite it. What genuinely is undocumented is the revenue split, not the policy.

### P1 — verification infrastructure

**4.5 Add `claude plugin validate ./skills --strict` to the HANDOFF verify block.** *Effort: 5 min.*

Evidence in §2.2: the bare `claude plugin validate .` returns a green tick having checked only
`marketplace.json`. HANDOFF's verify block currently contains no validate step at all, so the
plugin has never been schema-checked. Add all three targets (`.`, `./skills`, `./commands`).

**4.6 Convert `evals/README.md` into `claude plugin eval` cases.** *Effort: 2–4 hours.*

The current evals are prose, run by hand, on three models, by one person. That is the least likely
thing in this repo to actually get done on every change. The CLI already defaults its eval
directory to `evals/`, which is where these live.

What adoption buys, per `--help` (verified 2026-08-20): `--runs` (default 3) against
non-determinism; `--ablation with-without` for the baseline comparison the best-practices page
requires; `--threshold` for a CI exit code; `--model` to sweep Haiku/Sonnet/Opus without retyping.

Two caveats before committing: the subcommand is **early access** and may be unavailable, and the
HTML report **publishes to claude.ai by default** — pass `--no-publish` on a repo that reads a
personal voice profile.

Fallback if the gate blocks it: the `skill-creator` plugin is generally available and does the same
comparison loop from `evals/evals.json`, plus description-tuning against should-trigger and
should-not-trigger prompts.

**4.7 Raise the thin skills to three evals each.** *Effort: 1 hour.*

Best-practices checklist requires at least three. `ff-package`, `ff-strategy`, `ff-init`,
`ff-ideas`, `ff-shotlist` have one or two.

**4.8 Pre-approve the gate script with `allowed-tools`.** *Effort: 15 min.*

```yaml
allowed-tools: Bash(${CLAUDE_PLUGIN_ROOT}/scripts/slop-check.sh *)
```

Depends on 4.1. A gate that raises a permission prompt on every draft is a gate people route
around. The grant is turn-scoped and clears on the next user message, so it is not a standing
privilege.

**4.9 Upgrade the Instagram PH rows from "Unverified" to confirmed-unavailable.** *Effort: 15 min.*

Evidence in §3.3, with URLs. Also add the $0.01/star figure and the 2026-06-15 Facebook Live ads
sunset.

### P2 — hygiene

| # | Item | Effort |
|---|---|---|
| 4.10 | Record the six-field portability ceiling in HANDOFF's constraints list, so nobody adds `when_to_use`/`paths`/`hooks` and silently breaks claude.ai packaging | 10 min |
| 4.11 | Correct PLAN.md: the "~250-char UI limit" rationale, and the "deliberate departure" framing on noun names (docs call noun phrases an acceptable alternative) | 15 min |
| 4.12 | Decide `commands/` vs skills. Docs state custom commands have been merged into skills, and a plugin skill's bare `/name` already works unless another command claims it. The eight files in `commands/` claim exactly the eight skill names. Both validate clean today, so this is a clarity question, not a bug — but it is eight files of duplication | 30 min |
| 4.13 | `plugin.json`: add `homepage`, `repository`, `license`, `keywords` | 10 min |
| 4.14 | Note the skill-content-lifecycle rule (§2.1 #20) in the authoring conventions, and re-read `ff-critique` as a standing instruction rather than a sequence | 30 min |
| 4.15 | Consider `${CLAUDE_PLUGIN_DATA}` for the voice profile so it survives plugin updates — but keep `FRAME_FIRST_DATA` as the default, because that directory is deleted on uninstall | 30 min |

### P3 — scope change received 2026-08-20

See Appendix A. Summarised: **de-concert the plugin**, and add a ranking-signals reference so
packaging decisions are driven by documented platform behaviour rather than by the concert case.
*Effort: 4–8 hours, and it is a design change, not a patch.*

---

## 5. What could NOT be verified

Mandatory section. Everything here is honestly unresolved.

| # | Claim | Why it failed |
|---|---|---|
| 1 | TikTok automatically mutes audio on copyrighted music | TikTok's IP Policy documents removal on rightsholder report and says nothing about automatic detection behaviour. No other TikTok-owned page found that states it |
| 2 | TikTok LIVE "risks an immediate cut" for copyrighted audio | No TikTok-owned page found |
| 3 | Instagram demotes specifically "to followers only" | Meta's Music Guidelines say block/mute/remove and "limit". The follower-only mechanism is not stated anywhere Meta-owned |
| 4 | Facebook concert-clip revenue split with rights holders | Meta documents the policy but not the split |
| 5 | Facebook Content Monetization payout of PHP 0.008–0.018/view | Meta publishes no per-view rate. This was already flagged unverified in the file and stays that way |
| 6 | pytrends archived specifically in **April 2025** | GitHub API confirms `archived: true`, last push 2024-08-10, but exposes no archive timestamp |
| 7 | Google Trends direct requests "commonly return 429" | Not tested, no official statement |
| 8 | TikTok Creative Center **ToS** forbids automated fetching | The ToS URL 404s. What I did observe is an **HTTP 403 to an automated browser** on 2026-08-20 — evidence of blocking, not evidence of a term |
| 9 | Instagram trending audio has no API export; Facebook Reels has no trend surface; YouTube has no Shorts audio endpoint | All three are absence-of-evidence. No platform publishes a page asserting the negative. The operational conclusion holds; the *wording* in the file is more confident than a citation can support |
| 10 | YouTube Partner Program availability in the Philippines | Not re-checked this pass. Ran out of scope before reaching the YPP availability page |
| 11 | `/skill-doctor` as a first-party Anthropic tool | Only third-party GitHub repos and aggregator listings found. One aggregator attributes it to `anthropics/claude-plugins-community`; I did not confirm it at the repo. **Do not adopt on this evidence** |
| 12 | `claude plugin eval` behaviour beyond `--help` | Early-access gated on this account. All statements about it in §2.2 come from `--help` output, which is first-party but not the same as running it. The eval-case YAML schema was **not** inspected |
| 13 | Instagram Gifts / Subscriptions PH status via a page that names the Philippines | Confirmed by **absence from an official enumerated list**, not by a positive statement. Strong, but it is an inference from a complete alphabetical list, and lists change without notice |
| 14 | Any 2026-dated Anthropic change to skill authoring | The docs are not versioned per-section. I can confirm what the pages say **today**; I cannot confirm what changed since 2026-08-19 |
| 15 | "YouTube confirms captioned Shorts rank 23% higher" | Circulating in several SEO blogs with the attribution "YouTube confirms". **No YouTube page says this.** Treat as fabricated attribution — see Appendix A.3 |

---

## Appendix A — scope change requested 2026-08-20

The creator asked mid-research for two things the current design does not serve:

> "plugin will not limit to what i provided like concert, music, etc … it should cover all scope
> and i want it favors with the SEO and algorithm up to date. my issue right now i cant predict
> what to caption, i confidently have good content but my issue how to spread it organically and
> favored to algorithm real time"

This is a design change, recorded here as research rather than acted on.

### A.1 What in the plugin is concert-shaped

| Location | Coupling |
|---|---|
| `references/platform-facts.md` | Its largest section is concert-audio handling. That section becomes one case among many, not the constraint that "shapes the whole strategy" |
| `skills/ff-shotlist` | Description and body assume "concert or scene", venue, crowd density, set length |
| PLAN.md decision 11 | "Concert = proof/hook. Craft = product" — a positioning bet, not a mechanism |
| HANDOFF constraint | "Concert footage is proof, not product" |
| `ff-package`, `ff-ideas` | Generalize cleanly. The witness-detail and send-test doctrine is subject-agnostic already |

The anti-slop machinery — deny-list, witness detail, SHIP/FIX/KILL, blanks stay blank — is entirely
subject-independent and should not be touched.

### A.2 Official ranking and discovery signals (all verified 2026-08-20)

This is the primary-source material a "what do I caption" skill should be driven by. None of it is
concert-specific.

| Platform | What the platform itself says | Source |
|---|---|---|
| **Instagram Reels** | The most important predictions are "how likely you are to **reshare** a reel, **watch a reel all the way through**, like it, and go to the audio page". Signals, in order: your activity; history with the poster; information about the reel (audio, visuals, popularity); information about the poster | [Instagram Ranking Explained](https://about.instagram.com/blog/announcements/instagram-ranking-explained) |
| **Instagram — made less visible** | Reels "that have already been posted on Instagram", and reels with watermarks or low resolution | same |
| **Instagram Explore** | Signals in order: information about the post (likes, comments, shares, saves); your activity in Explore; history with the poster; information about the poster | same |
| **Instagram Search** | Matches on similarity between the query and the **account username/profile name**, suggested keywords, and hashtags. Caption text is **not** named as a signal on the transparency page | [Instagram Search AI system](https://transparency.meta.com/features/explaining-ranking/ig-search/) |
| **TikTok For You** | User interactions (like, share, comment, **watch in full or skip**); content information (**sounds, hashtags**, view count, country published); user information (device, language, location, time zone, day) | [How TikTok recommends content](https://www.tiktok.com/support/faq_detail?id=7655285288050104852) |
| **TikTok Search** | "For most users, **content information, which may include how well the content matches the specific term entered, is generally weighted more heavily** than others" | same |
| **TikTok FYF** | Content can be made ineligible for recommendation while still being findable "through search or by going to a creator's account". Creators can see in analytics "if there were any made ineligible for recommendation" | [FYF Eligibility Standards](https://www.tiktok.com/community-guidelines/en/fyf-standards) |
| **YouTube** | Discovery weighs "how well the **title, description, and video content** match the viewer's search" and "what videos drive the most engagement for a search". **Tags: "Not important. Tags are primarily used to help correct for common spelling mistakes."** Relative watch time matters more for short videos, absolute watch time for long ones | [Search and discovery](https://support.google.com/youtube/answer/141805) |
| **Meta — demoted** | "Low-quality content, such as clickbait and engagement bait"; "limited originality content that is principally repurposed from other sources" | [Reducing distribution of problematic content](https://transparency.meta.com/enforcement/taking-action/lowering-distribution-of-problematic-content/) |

Three of these directly ratify decisions already in PLAN.md and should be cited rather than
re-argued:

- **Decision 15** (shares + watch-through primary, likes untracked) is Instagram's own top-two
  predictions, in order.
- **Search-first doctrine** is TikTok's own statement that content-query match dominates search
  ranking, and YouTube's title/description weighting.
- **Originality is distribution** is Meta's own demotion policy, verbatim.

One correction the sources force: **YouTube says tags are not important.** If any skill drafts
tags as an SEO lever, that is wrong per YouTube's own page.

### A.3 Third-party evidence — requested, and clearly bounded

The creator asked for proven third-party approaches that do not conflict with the official record.
Two large-N studies qualify; the rest of the "2026 SEO" genre does not.

**Usable — large sample, stated methodology.** Still secondary. Correlational, from tool-user
populations, not causal.

| Finding | Sample | Conflicts with official? | Source |
|---|---|---|---|
| Posts using at least one hashtag saw **31.70% fewer views** and 33.89% fewer interactions than platform average | 24.3M Instagram posts, 375k accounts, Jan–Feb 2025 vs Jan–Feb 2026 | **No — but read carefully.** Instagram's own Search page names hashtags as a *search-matching* signal. Fewer feed views and better search matching are not contradictory. Correlational: accounts that lean on hashtags may differ systematically | [Metricool 2026 Instagram study](https://metricool.com/press-release-instagram-study-2026/) |
| Posts including a question: **+36.70% comments**; comment-focused CTAs: **+202.78% comments** | same | **Tension worth naming.** Meta demotes "engagement bait" explicitly. A question that earns a comment and a CTA that farms one are different things, and the plugin's gate already treats "generic engagement-bait question" as a soft hit | same |
| Reels: >4x the interactions of single images; average watch time doubled YoY to **8.5 seconds** | same | No | same |
| Carousels: **9x more saves** than single images | same | No | same |
| Single images YoY: reach −21.96%, interactions −25.41%, engagement −45.98% | same | No | same |
| Instagram Reels get **36% more reach** than carousels but **12% less engagement**; carousels get **109% more engagement per person reached** than Reels | 52M+ posts, 10 platforms, through 2025-12-03; median rates, fixed-effects regression | No | [Buffer, State of Social Media Engagement 2026](https://buffer.com/resources/state-of-social-media-engagement-2026/) |
| **Replying to comments** correlates with more engagement on all six platforms studied; lift +5% (Bluesky) to +42% (Threads) | same | No — TikTok names comments as an interaction signal | same |
| Accounts that skipped a week "consistently underperformed their own baseline growth rates"; top-10% performers post more often | same | No | same |
| **No universal best posting time**; optimal windows differ per network and matter far less than content | same | No — and it independently matches PLAN.md's myth list | same |

Buffer's own summary line is the one most worth carrying into the plugin: *what you post about
matters more than which format it is.* That is the existing doctrine, arrived at from 52M posts.

**Rejected — do not adopt.** The "2026 short-form SEO" blog genre repeats a claim that "YouTube
confirms captioned Shorts rank 23% higher on average than uncaptioned ones." I found **no YouTube
page saying this**, and YouTube's actual discovery page pushes in a different direction (metadata
matters less than viewer interaction; tags are "not important"). Treat the 23% figure as fabricated
attribution. It is exactly the kind of claim `ff-trends` exists to refuse.

### A.4 What this implies for the build

Not decisions — options, for the human to rule on.

1. **Move concert handling from "the constraint that shapes the whole strategy" to one case in
   `platform-facts.md`.** The music-copyright section stays; its framing changes.
2. **`ff-shotlist` generalizes to "any planned shoot"**, with concert as a worked example. Venue,
   crowd, and set length become one constraint set among several.
3. **New reference file: `references/ranking-signals.md`**, sourced entirely from §A.2, dated the
   same way `platform-facts.md` is. This is what answers "what do I caption" with something other
   than taste — and it is the direct fix for the stated pain.
4. **The "real time" part cannot be solved.** §3.2 is unchanged by the scope change: Instagram and
   TikTok trending data remain unreachable to any agent, and the TikTok Creative Center returned
   403 to an automated browser on 2026-08-20. What *is* reachable and up to date is the documented
   ranking behaviour in §A.2, which changes on the order of months, not hours. Reframing the
   creator's question from "what is trending right now" to "what does each platform say it
   rewards" is the only version of this that can be answered honestly — and it happens to be the
   more durable one.
5. **`ff-package` gains a per-platform SEO contract driven by §A.2**: query-matching phrases in
   TikTok on-screen text and caption; title and description on YouTube (not tags); account-name and
   keyword alignment on Instagram, where captions are not a named search signal.
