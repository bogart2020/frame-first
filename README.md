# frame-first

Content-creation skills for a phone-cinematography creator — ideas, shot lists, packaging,
an anti-slop quality gate, trend research, and monetization strategy.

Works in **Claude Code**, **Claude Desktop**, **Claude mobile**, **Codex**, and **Cline** from
one source of truth. One skill folder, self-contained: nothing it needs lives outside itself.

Built around one model: **Attention → Relevance → Retention → Reward → Sharing → Relationship.**
A post fails if any single stage breaks.

## The strategy it enforces

The footage is **proof, not product**. Spectacular footage is muted on TikTok, demoted on
Instagram, and revenue-shared on YouTube — structurally unmonetizable on the platforms that matter
most. The product is the **craft**: how the shot was got. That is searchable, teachable, ToS-clean,
and monetizable from the Philippines where TikTok Creator Rewards is not available.

Concerts are the running example, never an assumption. The plugin handles any subject.

## What is in it

One skill, `frame-first`, which routes to seven workflows:

| Workflow | Does |
|---|---|
| `ff-init` | Optional quick seed for your voice profile, or a reset |
| `ff-shotlist` | Plans what to shoot **before** the moment happens |
| `ff-ideas` | Premises from footage you shot, or from nothing |
| `ff-trends` | What is working now — honest about what it cannot fetch |
| `ff-critique` | Blocking quality gate. Can tell you not to post |
| `ff-package` | Hooks, captions, titles, on-screen text, hashtags, SEO — per platform |
| `ff-strategy` | Performance logging and monetization planning |

```
skills/frame-first/
  SKILL.md          the router — decides profile mode, loads the profile, hands off
  workflows/        the seven above
  references/       verified doctrine; every dated platform claim lives in platform-facts.md
  scripts/          slop-check.sh — an optional accelerator, never a gate
  templates/        *.example.md, the shape of each profile file
```

## It runs without a filesystem

Every workflow produces correct output with **no commands run**. `scripts/slop-check.sh` is an
accelerator that is skipped where bash is unavailable, and each workflow states inline the
conclusion it draws from a reference — so a reference it cannot open costs a citation, not an
answer. That is what makes Claude Desktop and Claude mobile work.

## Install

### Claude Code, Codex, Cline

```bash
git clone <your-repo-url> frame-first
cd frame-first
./sync.sh            # symlink skills/frame-first into ~/.claude, ~/.codex, ~/.cline
./sync.sh --check    # report broken, missing, or stale links
```

Or install it as a Claude Code plugin from the marketplace manifest, and skip `sync.sh` entirely —
do one or the other, never both, or the skill registers twice.

### Claude Desktop and Claude mobile

```bash
cd skills && zip -r frame-first.zip frame-first
```

Upload that zip at **Settings → Capabilities → Skills**. It needs code execution enabled on your
account. Then follow `PROJECT-INSTRUCTIONS.md` to set up the Project that holds your profile —
that is what stops the skill being generic on your phone.

## Your profile stays yours

It lives at `~/.frame-first/` — outside the repo, and outside the installed plugin, so a plugin
update cannot destroy it. Set `FRAME_FIRST_DATA` to put it elsewhere. Nothing in `data/` is
committed and `data/` itself is gitignored.

On Desktop and mobile there is no filesystem to write to, so the skill **emits** profile updates
as paste-ready blocks instead of writing them. Same behaviour, two endings.

## Optional

Set `YOUTUBE_API_KEY` to enable automatic YouTube trend fetching in `ff-trends`.
Free tier, ~100 searches/day. The skill works without it.
