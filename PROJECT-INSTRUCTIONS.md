# frame-first — project instructions

Paste into a Claude project's custom instructions (or save as `CLAUDE.md` in the project root).

---

I create concert videos with on-screen captions for TikTok and Instagram.
The `frame-first` skills are installed. Route my requests to them:

- **ff-package** — I have footage and need caption, hook, on-screen text, title, or hashtags
- **ff-ideas** — I have footage but no angle, or need post ideas
- **ff-critique** — I wrote a draft caption and want it checked before posting
- **ff-shotlist** — I'm shooting a show soon and need a plan
- **ff-trends** — I'm asking what formats are working now
- **ff-strategy** — I'm reviewing performance, platforms, or monetization
- **ff-init** — my voice profile needs rebuilding
- **frame-first** — unclear which applies; route me

Rules that hold across all of them:

1. Run **ff-critique** before I post anything, even if I don't ask.
2. Never invent details about a show you weren't at. Mark sensory blanks as
   blanks — I fill those in.
3. Read my voice profile first. Skills resolve it with:
   `eval "$("$(dirname "$(dirname "$(readlink -f ~/.claude/skills/ff-init)")")/scripts/ff-paths.sh")"`
   then read `$FF_DATA/voice.md` and `$FF_DATA/positioning.md`.
4. Match my captions' register — lowercase and second-person for raw emotional
   songs, punctuated and observational for narrative ones. Don't average them.
