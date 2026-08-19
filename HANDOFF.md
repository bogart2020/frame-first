# Handoff — frame-first

**For:** Sonnet 5, fresh session
**Repo:** `/Users/jerickmadrileno/Desktop/plugins/frame-first`
**Read first:** `PLAN.md` — the full decision record, verified environment facts, research
findings, and the condensed doctrine you will be writing from. Do not re-derive any of it.

## State

Scaffold is complete and committed. What exists:

```
.claude-plugin/plugin.json    done
sync.sh                       done (symlinks + --check for dead links)
.gitignore                    done (data/ ignored, *.example.md committed)
README.md                     done
PLAN.md                       done — the source of truth for every decision
commands/ff-*.md          x6  done (Claude-only slash commands)
data/*.example.md         x6  done (templates; real files are gitignored)
skills/ff-*/SKILL.md      x6  STUB — frontmatter written, body is a spec
references/*.md           x4  STUB — headings and "to write here" lists only
```

**Your job: replace the 10 stubs with real content.** Frontmatter on the six skills is
already written and load-bearing (it decides when each skill fires) — do not rewrite it
without reason.

## Order, with completion criteria

Follow `PLAN.md` "Build order". Each step is done when its criterion passes — verify by
running it, not by reading it back.

1. **`references/` (4 files)** — write from PLAN.md's "Doctrine source". Rewrite as
   instructions, not prose. `slop-patterns.md` is the highest-value file: fill it with
   concrete **paired** examples (generic beside specific), not abstract rules.
   ✅ *Done when:* no `STATUS: STUB` marker remains in `references/`, and every "to write
   here" bullet has become real content.

2. **`ff-init`** — the interview. One question at a time.
   ✅ *Done when:* a dry run produces both `data/voice.md` and `data/positioning.md`, and
   the skill visibly pushes back on a deliberately generic answer instead of accepting it.

3. **`ff-critique`** — the blocking gate. SHIP / FIX / KILL, never a score.
   ✅ *Done when:* fed the caption *"The concert was unforgettable. What a night ✨"* it
   returns FIX or KILL with a **specific named** failure — and does not rewrite the line
   itself, since the missing ingredient is lived experience.

4. **`ff-ideas` and `ff-package`**
   ✅ *Done when:* every `ff-ideas` output carries all six required elements (premise,
   tension, teachable core, emotional payload, send test, searchability), and `ff-package`
   leaves sensory specifics as explicit blanks rather than inventing them.

5. **`ff-trends`**
   ✅ *Done when:* asked *"what audio is trending on Instagram right now?"* it states plainly
   that it cannot fetch that and offers the in-app paste checklist — **no fabricated list.**
   This is the skill's most important behavior; test it explicitly.

6. **`ff-strategy`**
   ✅ *Done when:* asked about TikTok monetization it reports that Creator Rewards is not
   available in the Philippines, and labels the flagged figures "unverified" rather than
   asserting them.

## Constraints that are not yours to change

These were decided deliberately. If one seems wrong, raise it — do not silently overturn it.

- **`ff-critique` blocks.** It withholds a ship verdict and may tell the creator not to post
  at all. A gate that always passes is not a gate.
- **`ff-package` does not fill sensory blanks.** The agent was not at the show. Filling those
  gaps manufactures exactly the AI sameness this plugin exists to prevent.
- **`ff-trends` never invents trend data.** See PLAN.md for what is provably unfetchable.
- **Concert footage is proof, not product.** The craft is the product. Every skill reflects this.
- **Dir name == frontmatter `name:` == symlink name.** Verified convention; breaking it breaks
  Codex/Cline.
- **Nothing personal gets committed.** Only `*.example.md` templates.

## Verify before claiming done

```bash
cd /Users/jerickmadrileno/Desktop/plugins/frame-first
grep -rl "STATUS: STUB" skills references          # must return nothing
./sync.sh && ./sync.sh --check                     # all links healthy
git status --porcelain                             # no data/*.md except examples
```

Then run the six completion criteria above as live prompts. Report which passed with actual
output — not a summary.

## Left for the human

- `gh repo create frame-first --public --source=. --remote=origin --push`
- Run `ff-init` — every other skill is generic until `data/voice.md` exists
- Optionally set `YOUTUBE_API_KEY` for automatic trend fetching
