# frame-first on Claude Desktop and Claude mobile

This is the canonical setup for the Claude apps. It is what makes the skill sound like you rather
than like a generic content assistant — on a phone there is no filesystem, so your profile has to
arrive some other way. A Claude Project is that way.

## 1. Install the skill

```bash
cd skills && zip -r frame-first.zip frame-first
```

Upload `frame-first.zip` at **Settings → Capabilities → Skills**. Skills require code execution to
be enabled on your account. One zip, one skill — there is nothing else to upload and nothing to
keep in sync.

## 2. Create a Project and add your profile

Create a Claude Project (name it whatever you like) and add these as **project files**:

- `voice.md` — from `~/.frame-first/voice.md`
- `positioning.md` — from `~/.frame-first/positioning.md`

Add the others only once they have content worth carrying: `hooks-used.md`, `gate-log.md`,
`performance.md`, `ideas.md`. An empty file is worse than a missing one — the skill treats a thin
profile as a cold start, which is a supported state, but treats a file that exists as authoritative.

If you have no profile yet, skip this step and ask for `ff-init` in the Project. Two or three
questions, and you can refuse it and still get work done.

## 3. Paste this into the Project's custom instructions

---

I create photo and video content and post it to Instagram, TikTok, YouTube, and Facebook.
The `frame-first` skill is installed. Use it for anything to do with my content.

My voice profile and positioning are in this Project's files. Read them before drafting anything —
they are `profile/voice.md` and `profile/positioning.md` as far as the skill is concerned.

Rules that hold across every workflow:

1. Run `ff-critique` before I post anything, even if I don't ask for it.
2. Never invent details about something you weren't at. Mark sensory blanks as blanks — I fill
   those in. A caption with a hole in it is the deliverable; a caption with invented detail is
   fiction under my name.
3. You are in **context mode**: there is no profile directory here, so never try to write to one.
   When you learn something about my voice, record it in memory *and* end your reply with a short
   `Profile update → voice.md` block containing exactly the lines to append, and I will paste it
   into the Project file. Only when there's something real to record.
4. Before writing captions, ideas, or a shot list, **grill me first** — one question at a time
   until you could produce the work and defend every choice in it, then restate what you're about
   to make and wait for my yes. If I say "just draft it", stop asking immediately and mark the
   gaps as blanks.
5. Match my captions' register — lowercase and second-person for raw emotional pieces, punctuated
   and observational for narrative ones. Don't average them.

---

## 4. Keep the profile fed

The skill learns from your corrections, not from interviews. Two things happen when you rewrite a
line it drafted:

- **Memory picks it up automatically.** No action from you. This is what makes the next
  conversation in this Project already know it.
- **You get a `Profile update` block to paste into `voice.md`.** Do this when they pile up rather
  than every time — memory is already carrying it for the apps. The file is what reaches Claude
  Code, and what survives memory being cleared.

Claude cannot write to Project files. That is a platform limit, not a shortcut — uploaded project
knowledge is yours to manage, so the paste is the only write path that exists here.

When the three disagree, the skill applies **conversation > memory > file**. Refreshing the file
raises the floor; you never have to reconcile them by hand.

If you also use Claude Code, `~/.frame-first/voice.md` and the Project's copy are the same file in
two places, and nothing syncs them for you.

## What differs from Claude Code

Only two things:

- **Writes.** Claude Code appends to `~/.frame-first/` directly. Here you paste.
- **`scripts/slop-check.sh`.** It runs where bash is available and is skipped silently where it is
  not. It never changes a verdict on its own — the gate's real work is the judgment pass.

The grilling works here too, just in prose — there is no question popup on Desktop or mobile, so it
asks one question per message instead. Same rule, slower to answer on a phone. That is what the
"just draft it" escape hatch is for.

Everything else — the workflows, the references, the standards, the SHIP/FIX/KILL thresholds — is
identical, because it is the same folder.
