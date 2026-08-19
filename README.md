# frame-first

Content-creation skills for a phone-cinematography creator — iPhone 16 Pro, concerts, cinematic scenes.
Works in **Claude Code**, **Codex**, and **Cline** from one source of truth.

Built around one model: **Attention → Relevance → Retention → Reward → Sharing → Relationship.**
A post fails if any single stage breaks.

## The strategy it enforces

Concert footage is **proof, not product**. It is muted on TikTok, demoted on Instagram, and
revenue-shared on YouTube — spectacular, and structurally unmonetizable on the platforms that
matter most. The product is the **craft**: how the shot was got. That is searchable, teachable,
ToS-clean, and monetizable from the Philippines where TikTok Creator Rewards is not available.

## Skills

| Skill | Does |
|---|---|
| `ff-init` | One-time interview → your voice profile and positioning |
| `ff-ideas` | Premises from footage you shot, or from nothing |
| `ff-trends` | What is working now, angled to your niche — honest about what it cannot fetch |
| `ff-critique` | Blocking quality gate. Can tell you not to post |
| `ff-package` | Hooks, captions, titles, on-screen text, hashtags, SEO — per platform |
| `ff-strategy` | Performance logging and monetization planning |

## Install

```bash
git clone <your-repo-url> frame-first
cd frame-first
./sync.sh            # symlink into ~/.claude/skills, ~/.codex/skills, ~/.cline/skills
./sync.sh --check    # report broken or missing links
```

Then run `ff-init` first. Every other skill depends on the files it writes.

> Once installed as a proper Claude Code plugin, remove the `~/.claude/skills/ff-*` symlinks
> so the skills are not registered twice.

## Your data stays yours

`data/` is gitignored. Only `*.example.md` templates are committed. Your voice profile,
idea bank, and performance numbers never leave your machine.

## Optional

Set `YOUTUBE_API_KEY` to enable automatic YouTube trend fetching in `ff-trends`.
Free tier, ~100 searches/day. The skill works without it.
