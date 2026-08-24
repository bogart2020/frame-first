# Handoff — frame-first

**Repo:** `/Users/jerickmadrileno/Desktop/plugins/frame-first`
**Read first:** `PLAN.md` — the decision record. It carries the original grilling pass, the
hardening round, the de-scoping round, and the 2026-08-21 portability round. Do not re-derive any
of it; amend a decision in place if reality disagrees.

## State

Complete and hardened. One self-contained skill that runs in five places.

```
skills/frame-first/
  SKILL.md          router — profile mode, profile load, routing, shared vocabulary
  workflows/   x7   ff-{init,shotlist,ideas,trends,critique,package,strategy}.md
  references/  x7   verified doctrine; platform-facts.md owns every dated claim
  scripts/          slop-check.sh — optional accelerator
  templates/   x7   *.example.md, the shape of each profile file
commands/      x8   Claude Code slash commands → frame-first + a workflow
evals/              per-workflow regressions, the no-bash pass, fixtures
research/      x5   the verification record behind references/
~/.frame-first/     the creator's profile. Outside the repo. Not yours to edit
```

## The one rule that holds the whole thing up

**Nothing inside `skills/frame-first/` may reference a path outside it.** No
`${CLAUDE_PLUGIN_ROOT}`, no `readlink`, no `../`, no `~/.claude`, no environment-derived root. That
self-containment is the entire reason the skill works on Claude Desktop and Claude mobile, where
none of those exist. One command checks it:

```bash
grep -rn 'CLAUDE_PLUGIN_ROOT\|ff-paths\|readlink\|\.\./\|~/\.claude' skills/frame-first/ \
  | grep -v 'Any other resolution is wrong'   # the SKILL.md deny-mention, not a reference
```

Expected: nothing. The single exception is the creator's profile, which must live outside the skill
so a reinstall cannot destroy it — reached via `$FRAME_FIRST_DATA` or `~/.frame-first/`, and only
in local mode.

## Constraints that are not yours to change

Raise it if one seems wrong; do not silently overturn it.

- **Correct output with zero commands run.** Scripts accelerate, references add citations. Neither
  is allowed to gate an answer. A workflow that stops because a file would not open is a bug.
- **`ff-critique` blocks, and may KILL.** Ternary verdicts only — no numeric scores. Numeric scales
  collapse into a 5–7 middle band.
- **One gate, one calibration.** Never write an app-specific variant of the critique thresholds.
- **`ff-package` leaves sensory blanks blank.** The agent was not there.
- **`ff-trends` never invents trend data.** `references/platform-facts.md` says what is reachable.
- **The footage is proof, not product.** Any subject, not only concerts. Concert stays as the
  running example and never as an assumption.
- **Dated claims live only in `references/platform-facts.md`** — restating them elsewhere recreates
  the seven-file drift the hardening round removed. Workflows may inline the *conclusion* a claim
  drives, marked uncited; they may not restate the claim, its date, or its source.
- **Never write in context mode.** Emit a `Profile update →` block instead.
- **Positive framing.** Prefer stating the target behavior over prohibiting the failure.
- **Bash only in `scripts/`.** No Python dependency ships.

## Verify before claiming done

```bash
cd /Users/jerickmadrileno/Desktop/plugins/frame-first
grep -rn 'CLAUDE_PLUGIN_ROOT\|ff-paths\|readlink\|\.\./\|~/\.claude' skills/frame-first/ \
  | grep -v 'Any other resolution is wrong'   # the SKILL.md deny-mention, not a reference   # nothing
claude plugin validate ./skills --strict      # the ONLY call that checks the skill
claude plugin validate ./commands --strict
claude plugin validate .                      # NOTE: checks marketplace.json ONLY
grep -rl "STATUS: STUB" skills references     # must return nothing
./skills/frame-first/scripts/slop-check.sh evals/fixtures/slop.md ; echo $?   # expect 2
./skills/frame-first/scripts/slop-check.sh evals/fixtures/good.md ; echo $?   # expect 0
./sync.sh && ./sync.sh --check                # one link per harness, all healthy
git status --porcelain                        # no profile files, ever
(cd skills && zip -qr /tmp/ff.zip frame-first && unzip -l /tmp/ff.zip | tail -1)  # upload bundle
```

Then run `evals/README.md` in full — **including the no-bash pass, and including on Haiku.** Skills
degrade silently on weaker models, and the no-bash pass is the only thing standing between the
design claim and an actual working phone. Report which cases passed with real output.

## Left for the human

- Confirm `~/.frame-first/voice.md` and `positioning.md` read correctly, then `rm -rf data/`
- Upload the skill zip on Desktop and follow `PROJECT-INSTRUCTIONS.md`
- Optionally set `YOUTUBE_API_KEY`
