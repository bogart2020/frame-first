---
name: frame-first
description: Routes content-creation work to the right frame-first skill and loads the creator profile. Use when starting any photography or video content task, planning a post, or unsure which frame-first skill applies.
---

# frame-first

Entry point. Load the creator profile, pick the branch, hand off.

## Step 0 — locate the plugin files

Every frame-first path (`data/…`, `references/…`, `scripts/…`) is relative to the **plugin
root**, not to whatever project folder happens to be open. Resolve it once per session:

```bash
FF="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$(readlink "$HOME/.claude/skills/ff-init")")")}"; eval "$("$FF/scripts/ff-paths.sh")"
```

That sets `$FF_HOME`, `$FF_DATA`, `$FF_REFS`, `$FF_SCRIPTS`. Use them for every read and write —
`"$FF_DATA/voice.md"`, not `data/voice.md`. This is what lets the skills work from any project in
Claude Desktop or Claude Code, not only when frame-first itself is the open folder.

`${CLAUDE_PLUGIN_ROOT}` is the documented mechanism and is substituted when this runs as an
installed plugin. The `readlink` fallback covers the symlink install that `sync.sh` creates for
Codex and Cline, where no such variable exists. Plain `readlink` is used rather than `readlink -f`
because `-f` is a GNU extension that fails silently on BSD.

`$FF_DATA` honors the `FRAME_FIRST_DATA` environment variable when set, so the creator's profile
can live outside the repo. Everything below writes `data/…` as shorthand for `$FF_DATA/…`.

## Step 1 — load the profile

Read `$FF_DATA/voice.md` and `$FF_DATA/positioning.md`. Every downstream skill depends on them.

**When either file is missing or thin: proceed anyway.** Do not block, and do not push the creator
into `ff-init` — that friction is why the old interview went unused. Work with what is there, and
let the profile fill itself in from feedback (below). Mention `ff-init` only if they ask to seed or
reset the profile deliberately.

**Read the conversation as profile data too.** Anything the creator has already said in this
session about how they write, what they are making, or what they dislike outranks a stale file.
The file is the memory across sessions; the conversation is the current truth.

**Cold start** — no captions, no analytics, no history. Normal, and not a blocker. Do not
fabricate profile content to fill the gap.

## Learn from the correction

This is what replaces the interview. Every skill follows it.

When the creator rejects, rewrites, or overrides something, that is the highest-quality voice
signal available — better than anything an interview produces, because it is a real judgment about
real work. Capture it:

| What happened | Append to |
|---|---|
| They rewrote a line you drafted | `data/voice.md` → `## Learned from feedback`, both versions, one line on what changed |
| They said "I'd never say that" | `data/voice.md` → the deny-list, as a phrase `slop-check.sh` can match |
| They published something the gate marked FIX | `data/gate-log.md` — the gate may be miscalibrated |
| They corrected what they are making or for whom | `data/positioning.md` |

Rules that keep this from becoming noise:

- **Record the specific, not the summary.** "Prefers 'ruined' over 'ruin'" is useless; "tightens
  grammar between draft and publish while keeping the lowercase confession tone" is a pattern.
- **One line per entry, dated.** This section is read on every run; it cannot become an essay.
- **Do not record your own guesses** — only things the creator actually said or did.
- **Say when you have recorded something**, briefly. Silent profile edits are unsettling.

## Step 2 — route

| The creator is… | Skill |
|---|---|
| Setting up, or their content is drifting generic | `ff-init` |
| Preparing for a shoot or show | `ff-shotlist` |
| Holding footage with no angle, or stuck for ideas | `ff-ideas` |
| Asking what is working now | `ff-trends` |
| Holding a draft caption, hook, or script | `ff-critique` |
| Ready to write the words around finished footage | `ff-package` |
| Reviewing results, planning a cycle, or asking about money | `ff-strategy` |

Two skills can apply in sequence — `ff-ideas` then `ff-package`, or `ff-package` then
`ff-critique`. Run them in order rather than merging them.

## Step 3 — hand off

State which skill you are invoking and why in one line, then invoke it and follow it exactly.

## Boundaries

Routes and loads context. All actual work happens in the specialist skills. When no branch fits,
say so and ask — rather than picking the closest one.

## Shared vocabulary

Terms every frame-first skill uses. Definitions live here only.

- **Witness detail** — a concrete detail only someone who was physically present could supply.
  "15,000 people singing the first line" is a witness detail; "the crowd was amazing" is not.
  This is the plugin's central test.
- **The send test** — would someone forward this to one specific person, and what does sending
  it say about them? Content that survives this travels through relationships.
- **Proof, not product** — concert footage is the credential that earns attention. The craft
  behind it is what the audience actually pays for. See `references/platform-facts.md`.
- **SHIP / FIX / KILL** — the only three verdicts `ff-critique` returns.

## Gotchas

- **The profile gets skipped under time pressure.** A creator in a hurry wants the caption, not
  the interview. Loading the profile is step 1 for a reason; a fast generic caption is worth less
  than no caption.
- **Routing to two skills at once produces mush.** Sequence them.
- **`data/` is gitignored.** Its absence means a fresh clone, not a broken install.
