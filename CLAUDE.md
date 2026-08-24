# frame-first — plugin development instructions

You are working on the `frame-first` Claude plugin. It is consumed through **Claude Desktop**
via a personal plugin marketplace synced from this git repo. That distribution path has sharp
edges; most of this file exists because of them.

---

## Versioning — read this before touching a manifest

**Declare `version` in exactly one place, or in none.**

- `plugin.json` and the marketplace entry can both carry `version`. If both are set, the
  `plugin.json` value wins **silently** — a version you bump in `marketplace.json` is masked
  with no warning. Never set both.
- **Preferred for this repo: omit `version` entirely.** On a git source the resolved commit SHA
  becomes the version, so every push counts as a release and there is nothing to remember.
- If `version` is set and you push without changing the string, installed copies keep the cached
  build. The change ships to the remote and reaches nobody. This is the single most common way
  an update silently fails to land.

If you are asked to add or restore a `version` field, say why the SHA-as-version approach is
being abandoned before doing it.

---

## Never rename the plugin

`name` in the manifest is an immutable public slug. Users have it installed under that slug and
renaming breaks their install with a plugin-not-found error.

- To change the label shown in the UI, set `displayName` and leave `name` alone.
- If a rename is genuinely unavoidable, add an entry to the top-level `renames` map in
  `marketplace.json` mapping the old name to the new one, so existing installs auto-migrate.
  Treat `renames` as append-only history — never edit an old entry, add a new one and let the
  chain resolve.

---

## The Desktop sync trap

Claude Desktop keeps a local git clone of the marketplace and **pins it to the commit it was at
when the marketplace was added**. Refresh runs `git fetch` but does not fast-forward the working
tree, so Desktop reads the manifests from its own frozen copy, sees no version change, and
reports everything as current. The `lastUpdated` timestamp still advances, so it looks like sync
worked.

Consequences to keep in mind whenever a change "isn't showing up":

- Pushing to the remote is not the same as the change being live. Assume nothing until verified.
- The marketplace's `···` menu shows **Synced commit**. Compare it against `HEAD`. If it lags,
  that is the problem — not the manifest, not the skill file.
- The reliable fix is to **remove the marketplace and re-add it**, then reinstall the plugin.
  "Check for updates" is not dependable and may fail with a generic toast.
- If this repo is ever distributed through an org marketplace instead: a direct push to the
  default branch does **not** trigger a sync. It requires a merged pull request that includes a
  version bump, or a manual "Update" on the marketplace.

Do not spend time debugging skill content when the symptom is "my change didn't appear." Check
the synced commit first.

---

## Structural rules

- Skills live at `skills/<name>/SKILL.md`. Every skill needs YAML frontmatter with `name`
  (matching the directory) and a `description` that states both what it does and when to use it —
  the description is the only thing the router and the model see when deciding whether to load it.
- **There is exactly one skill: `frame-first`.** The seven `ff-*` files are `workflows/*.md`
  inside it and carry no frontmatter. Collapsing to one skill is what makes the plugin uploadable
  to Claude Desktop and mobile, where a zip holds one skill folder. Do not re-split it. If routing
  degrades, the escape hatch is thin stub skills for discovery on Claude Code only — see PLAN.md
  decision 26.
- Plugins are copied into a cache directory on install. **Nothing inside `skills/frame-first/`
  may reference a path outside that folder.** No `../shared`, no absolute paths to your machine,
  and specifically **no `${CLAUDE_PLUGIN_ROOT}`** — it does not exist on Desktop or mobile, and
  removing it was the fix that made them work. Everything a workflow needs is a sibling:
  `references/`, `scripts/`, `templates/`, `workflows/`. One command checks it:

  ```bash
  grep -rn 'CLAUDE_PLUGIN_ROOT\|ff-paths\|readlink\|\.\./\|~/\.claude' \
    skills/frame-first/ | grep -v 'Any other resolution is wrong'
  ```

  Expected: nothing. The excluded line is the *prohibition* in `SKILL.md` Step 0, which names
  `ff-paths.sh` in order to forbid it. It is a deny-mention, not a reference — and a check that
  always reports one known hit stops being run.
- **The creator's profile is the one permitted exception, and it lives outside the plugin** — at
  `$FRAME_FIRST_DATA`, else `~/.frame-first/` (`voice.md`, `positioning.md`, and the rest). It has
  to: the cache directory above is rewritten on every plugin update, so a profile stored inside
  the plugin is destroyed by its own upgrade. Exactly two places may name that path —
  `skills/frame-first/SKILL.md` Step 0 and `scripts/slop-check.sh`. Nothing else.
- `data/` at the repo root is the **pre-2026-08-21 profile location**. It is gitignored wholesale
  so a leftover copy can never be committed. Its absence is correct, not a broken install. Never
  commit a profile, and never fabricate its contents to make a workflow testable.
- Any file a workflow points at **must actually exist in the repo.** A workflow instructed to cite
  a file that isn't there fails silently at the worst moment. Before shipping, grep the skill for
  referenced paths and confirm each one resolves.
- Run `claude plugin validate .` from the repo root before every push. From a marketplace
  directory it checks `marketplace.json` for schema errors, duplicate names, and bad source
  paths. To catch YAML frontmatter errors in the skill itself, run it again pointed at the
  `skills` directory — a marketplace-level run does not open those files.

---

## Content rules specific to frame-first

- The router's shared vocabulary — witness detail, the send test, proof-not-product,
  SHIP/FIX/KILL — is defined in `skills/frame-first/SKILL.md` and **only** there. If a workflow
  needs one of these terms, it references the definition; it does not restate or redefine it.
- Workflows run in sequence, never merged. If a task spans two, run them in order.
- Never invent platform figures, engagement numbers, or payout rates. Anything in
  `references/platform-facts.md` carries a source and a date, or it does not go in. A workflow
  that cannot reach a real figure reports it as unavailable rather than supplying a plausible one.
- **Dated claims live only in `references/platform-facts.md`.** A workflow may inline the
  *conclusion* a claim drives, so the answer survives the reference being unreadable on Desktop or
  mobile — but it may not restate the claim's date or its source. One place to re-verify.
- The profile-loading step in the router is not optional and is not a formality. Do not add
  fast-paths that skip it.
- **A complete input gets no grilling.** `ff-ideas`, `ff-package`, and `ff-shotlist` interrogate
  before generating, but only for what is missing from their stated input contract. An
  implementation that always grills is wrong — it becomes a toll, and a toll gets routed around.
  That is what happened to the original `ff-init` interview.

---

## Definition of done

A change is not done when it is committed. It is done when:

1. `claude plugin validate` passes at both the marketplace level and the `skills` directory.
2. Every path referenced by a workflow resolves in the repo.
3. The containment grep above returns nothing.
4. The change is pushed.
5. The synced commit in Desktop matches `HEAD`.
6. The behavior is confirmed in a **fresh conversation** — not the one where the edit was made.

Report honestly which of these you have actually verified and which you have not. "Should work"
is not step 6.
