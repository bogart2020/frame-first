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

### Resolving the profile directory

The canonical form, literally:

```
${FRAME_FIRST_DATA:-$HOME/.frame-first}
```

Any other resolution is wrong — a symlink target, a plugin root, an `ff-paths.sh`, a `$FF_DATA`.
If a caller supplies one, ignore it and use the form above. There is no path-resolution script in
this skill and there is not meant to be one.

This is the only path in frame-first that comes from an environment variable. The rule against
computed paths in *Everything lives inside this folder* governs the skill's own files — those are
always plain relative siblings.

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

**There are three sources, and they rank by recency.** When they disagree, later wins:

1. **The conversation.** Anything the creator has said this session about how they write, what
   they are making, or what they dislike. Current truth.
2. **Memory**, where the harness keeps it. It picks up corrections as they happen, so it is newer
   than the file by construction.
3. **`profile/voice.md` and `profile/positioning.md`.** The durable copy, and the only one that
   travels between Claude Code and the apps.

Do not reconcile them out loud or ask the creator which is right — apply the order and move on.
Refreshing the file from accumulated updates raises the floor; it is not a merge ceremony.

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

Where the harness keeps its own memory, let it record the correction as well. Memory makes the
capture automatic; the file makes it portable. Both, not either — and the paste block is still
emitted, because memory does not travel to Claude Code.

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

**`ff-package`, `ff-ideas`, and `ff-shotlist` do not end at their own output.** Any draft caption,
hook, on-screen text, or title they produce runs through `workflows/ff-critique.md` before it is
presented as finished, whether or not the creator asked. State the verdict inline. The creator may
override a verdict; they may not skip the gate. This is the sequence above, not a merge — finish
the first workflow, then run the gate on what it produced.

## Step 3 — hand off

State which workflow you are running and why in one line, then read that file and follow it
exactly.

## Grill before generating

`ff-ideas`, `ff-package`, and `ff-shotlist` invent something from a premise, and a premise built on
a misread costs a post or a shoot. Those three interrogate the input before producing anything.
`ff-critique`, `ff-strategy`, `ff-trends`, and `ff-init` do not — they judge what exists, report
what they found, or already ask by nature.

### What has to be present

Each has an input contract. Grill for what is missing from it, and for nothing else.

| Workflow | The input is complete when you know |
|---|---|
| `ff-ideas` | what was actually shot or planned, at least one witness detail, the subject, and who it is for |
| `ff-package` | the subject, at least one witness detail, what the footage shows, and which platforms |
| `ff-shotlist` | the subject, where the creator can physically be, the light and time available, and whether the moment repeats |

Anything already in the conversation, in `profile/positioning.md`, or in memory **counts as
present**. Do not ask for what you have been told.

**A complete input gets no questions at all.** Going straight to the work when the creator has
already done the thinking matters as much as grilling when they have not. A grill that always runs
is a toll, and a toll gets routed around.

### How to grill

Work it as a frontier. Ask one question, wait for the answer, and let that answer reshape what is
still open. A question whose answer depends on one you have not heard yet belongs later, not now.

- **One question per message.** Never a numbered list. Where the harness offers a question UI, use
  it; where it does not, ask in prose — the rule is the same, the delivery differs.
- **Highest-value gap first** — the one whose answer changes the most about what gets made.
- **Keep going until you could produce the work and defend every choice in it.** There is no
  question count. The creator's most interesting detail usually arrives third; stopping at one is
  how generic drafts happen.
- **Unless `profile/positioning.md` says otherwise.** Where it records a stated preference for
  decisive execution — a `## How much to ask` set to decisive, or the equivalent said outright —
  collapse the frontier to the **single highest-value gap**, ask that one, then go straight to the
  restatement. This is a profile setting, not a per-session negotiation, and it is what keeps the
  escape hatch from being load-bearing every time. **The restatement is never skipped**; it is the
  cheap check, and it is where a misread surfaces.
- **Do not ask what you can find.** Read positioning, memory, and the conversation first. Asking
  for something already on record reads as not listening, and spends the creator's patience on
  nothing.
- **Never ask for a witness detail you would then invent anyway.** If they cannot supply it, it
  stays a blank.

### The escape hatch

"Just draft it", "I'm in a hurry", or any equivalent ends the grilling immediately. No pushback,
no second attempt, no asking again later in the same session.

Then, in that same reply, **name the gaps you would have closed** and leave each one as an explicit
blank in the output rather than filling it. `[the specific thing you noticed in the third song]` is
the deliverable; an invented third song is fiction under the creator's name.

Do not hold the line here. `ff-critique` holds its verdict when asked to approve, because that gate
protects the creator from a bad post. This one only shapes an input, and the creator is allowed to
decide it is good enough.

**"Just draft it" ends the grilling. It does not skip the gate** — the draft still goes through
`ff-critique` and still comes back with a verdict.

### Before generating

When the frontier is empty, restate what you are about to make — premise, witness detail, angle,
platform — in a few lines, and wait for a yes.

**That restatement is the point of the exercise.** The questions gather; the restatement is where a
misread surfaces, while it still costs one line instead of a finished draft. A "no" reopens the
frontier rather than starting over.

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
