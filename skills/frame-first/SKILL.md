---
name: frame-first
description: Content creation for photography and video creators - post ideas from footage, shot lists before a shoot, hooks and captions and hashtags written per platform, a blocking anti-slop quality gate, trend research, and performance and monetization strategy. Use when the creator has footage and needs words, wants a caption or hook or title or hashtags written or checked, is planning what to shoot, asks what is trending or working now, shares Insights or analytics screenshots, is stuck for post ideas, or says their content sounds generic.
---

# frame-first

Entry point. Decide the profile mode, load the profile, route to a workflow.

## Everything lives inside this folder

`workflows/`, `references/`, `scripts/`, and `templates/` are siblings of this file. Read them by
their path relative to this skill — `references/platform-facts.md`, not an absolute path, and never
a path computed from a plugin root, an environment variable, or a symlink target. There is nothing
outside this folder to resolve.

The one exception is the creator's profile, which is theirs and must survive this skill being
reinstalled. See Step 0.

## Step 0 — decide the profile mode

Two modes. Decide once per session, state which one you are in, and do not re-check.

**Local mode** — a profile directory is reachable on disk. Look for `$FRAME_FIRST_DATA` if it is
set, otherwise `~/.frame-first/`. Read the profile from there and append to it directly.

**Context mode** — no reachable profile directory. The profile arrives as Project files or in the
conversation, or it is absent. Read whatever is there; **never attempt a write.** Updates are
emitted as paste-ready blocks instead (see *Learn from the correction*).

Deciding: check once whether the profile directory exists. If it does, local mode. If it does not,
or if you have no way to look, **context mode** — that is the safe default, because the cost of
guessing wrong is a failed write in the middle of the creator's work.

Say which mode you are in, in a few words, the first time it matters. Do not make it a ceremony.

**The `profile/` convention.** Workflow files write the creator's own files as `profile/voice.md`,
`profile/positioning.md`, and so on. That prefix is a namespace, not a directory — it resolves to
the profile directory in local mode and to Project files or the conversation in context mode. It
exists to keep those files visibly distinct from `references/` and `templates/`, which ship with
this skill and are never written to.

The profile files are: `voice.md`, `positioning.md`, `ideas.md`, `hooks-used.md`, `gate-log.md`,
`performance.md`, `trends.md`, and dated shot lists under `shotlists/`.

## Step 1 — load the profile

Read `voice.md` and `positioning.md` — from the profile directory in local mode, from the Project
files or the conversation in context mode. Every workflow depends on them.

**When either is missing or thin: proceed anyway.** Do not block, and do not push the creator into
`ff-init` — that friction is why the old interview went unused. Work with what is there, and let
the profile fill itself in from feedback.

**Read the conversation as profile data too.** Anything the creator has already said in this
session about how they write, what they are making, or what they dislike outranks a stale file.
The file is the memory across sessions; the conversation is the current truth.

**Cold start** — no captions, no analytics, no history. Normal, and not a blocker. Do not
fabricate profile content to fill the gap.

`templates/*.example.md` show the structure of every profile file.

## Learn from the correction

This is what replaces the interview. Every workflow follows it.

When the creator rejects, rewrites, or overrides something, that is the highest-quality voice
signal available — better than anything an interview produces, because it is a real judgment about
real work. Capture it:

| What happened | Goes to |
|---|---|
| They rewrote a line you drafted | `voice.md` → `## Learned from feedback`, both versions, one line on what changed |
| They said "I'd never say that" | `voice.md` → the deny-list, as a phrase `slop-check.sh` can match |
| They published something the gate marked FIX | `gate-log.md` — the gate may be miscalibrated |
| They corrected what they are making or for whom | `positioning.md` |

**Where it goes depends on the mode**, and this is the only thing that differs between them:

- **Local mode** — append it to the file, then say in one line that you recorded it.
- **Context mode** — end your reply with a short fenced block headed `Profile update →
  voice.md`, containing exactly the lines to append. The creator pastes it into their Project
  file. Emit it only when there is something real to record; an empty block every turn is noise.

Rules that keep this from becoming noise:

- **Record the specific, not the summary.** "Prefers 'ruined' over 'ruin'" is useless; "tightens
  grammar between draft and publish while keeping the lowercase confession tone" is a pattern.
- **One line per entry, dated.** This section is read on every run; it cannot become an essay.
- **Do not record your own guesses** — only things the creator actually said or did.
- **Say when you have recorded something**, briefly. Silent profile edits are unsettling.

## Step 2 — route

| The creator is… | Workflow |
|---|---|
| Setting up, or their content is drifting generic | `workflows/ff-init.md` |
| Preparing for a shoot or show | `workflows/ff-shotlist.md` |
| Holding footage with no angle, or stuck for ideas | `workflows/ff-ideas.md` |
| Asking what is working now | `workflows/ff-trends.md` |
| Holding a draft caption, hook, or script | `workflows/ff-critique.md` |
| Ready to write the words around finished footage | `workflows/ff-package.md` |
| Reviewing results, planning a cycle, or asking about money | `workflows/ff-strategy.md` |

Two workflows can apply in sequence — `ff-ideas` then `ff-package`, or `ff-package` then
`ff-critique`. Run them in order rather than merging them.

## Step 3 — hand off

State which workflow you are running and why in one line, then read that file and follow it
exactly.

## Working without tools

This skill must produce correct output with no commands run. Two things are optional, and both
degrade rather than break:

- **`scripts/slop-check.sh` is an accelerator, not a gate.** It catches surface patterns in
  milliseconds where bash is available. Where it is not, skip it silently and run `ff-critique`'s
  judgment pass, which is the real gate. A skipped stage 1 never changes a verdict on its own.
- **`references/` is read for depth.** Every workflow states inline the conclusion it depends on,
  so the output is correct without the reference file. If you cannot open one, use the inlined
  line and say the claim is uncited rather than dropping it or guessing at a replacement.

Never tell the creator a task is impossible because a file or a script was unavailable. Say what
you could not open, and give them the answer anyway.

## Shared vocabulary

Terms every frame-first workflow uses. Definitions live here only.

- **Witness detail** — a concrete detail only someone who was physically present could supply.
  "15,000 people singing the first line" is a witness detail; "the crowd was amazing" is not.
  This is the plugin's central test.
- **The send test** — would someone forward this to one specific person, and what does sending
  it say about them? Content that survives this travels through relationships.
- **Proof, not product** — the footage is the credential that earns attention; the craft behind it
  is what the audience actually returns for. Originally framed around concerts, it holds for any
  subject: the thing filmed is evidence, the skill is the offer.
- **SHIP / FIX / KILL** — the only three verdicts `ff-critique` returns.

## Boundaries

Routes and loads context. All actual work happens in the workflow files. When no branch fits,
say so and ask — rather than picking the closest one.

## Gotchas

- **Load the profile even when the creator is in a hurry.** It is step 1 for a reason. But loading
  it is cheap and never blocks — if it is thin, work anyway and record what you learn.
- **Do not assume the subject.** The plugin was built around concert footage and still carries it
  as the running example, but nothing in the doctrine depends on it. Ask what is being made before
  reaching for a concert-shaped answer.
- **Routing to two workflows at once produces mush.** Sequence them.
- **A missing profile means a fresh install, not a broken one.** Cold start is a supported state.
- **Do not attempt a write in context mode.** A failed write mid-session is worse than a paste
  block, and the creator on a phone cannot fix it.
