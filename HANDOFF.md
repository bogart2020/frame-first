# Handoff — frame-first

**For:** Sonnet 5, fresh session
**Repo:** `/Users/jerickmadrileno/Desktop/plugins/frame-first`
**Read first:** `PLAN.md` — decision record, verified environment facts, the hardening round, and
the condensed doctrine you write the references from. Do not re-derive any of it.

## State

Scaffolded and hardened. Committed.

```
skills/frame-first/       router — WRITTEN, complete
skills/ff-*/          x7  frontmatter, structure, boundaries, gotchas WRITTEN; prose is STUB
references/platform-facts.md   WRITTEN — the only source of dated platform claims
references/ai-tells.txt        WRITTEN — deny-list patterns for the script
references/{arrrsr,hooks,slop-patterns}.md   STUB
scripts/slop-check.sh          WRITTEN and tested
evals/                         WRITTEN — per-skill regressions + fixtures
data/*.example.md         x7   WRITTEN (real files gitignored)
commands/                 x8   WRITTEN
```

**Your job: the 3 reference stubs and the 7 skill prose bodies.** Everything structural is done.

Frontmatter is load-bearing and already tuned — all 8 descriptions sit under the ~250-char UI
truncation point using the documented "what + when + 3 triggers" formula. Changing them without
re-checking length regresses discoverability.

## Order, with completion criteria

Verify by running, not by re-reading.

1. **`references/` — 3 stubs.** Write from PLAN.md "Doctrine source" as instructions, not prose.
   `slop-patterns.md` is highest-value: concrete **paired** examples (generic beside specific).
   ✅ *Done when:* `grep -rl "STATUS: STUB" references/` returns nothing.

2. **`ff-init`** — the interview.
   ✅ *Done when:* answering the identity question with "I love capturing moments" gets named as
   generic and re-asked, rather than written to disk.

3. **`ff-critique`** — two-stage gate.
   ✅ *Done when:* the caption *"The concert was unforgettable. What a night ✨"* returns FIX or
   KILL with a named failure and no invented replacement line — **and** a caption with real
   witness detail plus one soft tell returns SHIP, not FIX. Both directions matter: an
   over-blocking gate gets ignored.

4. **`ff-ideas`, `ff-shotlist`, `ff-package`**
   ✅ *Done when:* every `ff-ideas` premise carries all six elements; every `ff-shotlist` entry
   names a premise and a fallback; `ff-package` marks sensory blanks rather than filling them,
   and holds that line when told "just fill it in yourself".

5. **`ff-trends`**
   ✅ *Done when:* "what audio is trending on Instagram?" produces a plain statement that it
   cannot be retrieved, plus the paste checklist. **No fabricated list.** Highest-severity
   failure in the plugin — test it explicitly.

6. **`ff-strategy`**
   ✅ *Done when:* it reports TikTok Creator Rewards as unavailable in the Philippines and labels
   the monetization figures unverified.

Then run the whole of `evals/README.md`, **including on Haiku** — skills degrade silently on
weaker models and this one is symlinked into three harnesses.

## Constraints that are not yours to change

Raise it if one seems wrong; do not silently overturn it.

- **`ff-critique` blocks, and may KILL.** Ternary verdicts only — no numeric scores. Numeric
  scales collapse into a 5–7 middle band.
- **`ff-package` leaves sensory blanks blank.** The agent was not there.
- **`ff-trends` never invents trend data.** `references/platform-facts.md` says what is reachable.
- **The footage is proof, not product.** *(Amended 2026-08-20 at the creator's request: was
  "concert footage is proof, not product". The plugin is no longer concert-scoped — it must handle
  any subject the creator brings. Concert remains the running example, never an assumption. The
  proof-not-product principle itself is unchanged.)*
- **Dated claims live only in `references/platform-facts.md`.** Restating them elsewhere recreates
  the seven-file drift this round removed.
- **Positive framing.** Prohibitions dropped from 18 to 7 and the remainder are hard guardrails.
  Prefer stating the target behavior.
- **Dir name == frontmatter `name:` == symlink name.**
- **Bash only in `scripts/`.** No Python dependency.

## Verify before claiming done

```bash
cd /Users/jerickmadrileno/Desktop/plugins/frame-first
claude plugin validate ./skills --strict      # the ONLY call that checks the skills
claude plugin validate ./commands --strict
claude plugin validate .                      # NOTE: checks marketplace.json ONLY, not skills
grep -rl "STATUS: STUB" skills references     # must return nothing
./scripts/slop-check.sh evals/fixtures/slop.md ; echo $?   # expect 2
./scripts/slop-check.sh evals/fixtures/good.md ; echo $?   # expect 0
./sync.sh && ./sync.sh --check                # all links healthy
git status --porcelain                        # no data/*.md except examples
for f in skills/*/SKILL.md; do d=$(sed -n 's/^description: //p' "$f"); echo "${#d} $f"; done
                                              # every count under 250
```

Report which eval cases passed with actual output, not a summary.

## Left for the human

- `gh repo create frame-first --public --source=. --remote=origin --push`
- Run `ff-init` — every skill is generic until `data/voice.md` exists
- Optionally set `YOUTUBE_API_KEY`
