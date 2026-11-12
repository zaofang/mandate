# Brand

Files in [`assets/brand/`](../assets/brand/). Colours as data in [`tokens.json`](../assets/brand/tokens.json).

## Mark

命 (mìng, command; as in 天命, the Mandate of Heaven) with the word `mandate`.

| Part | Typeface | Licence |
|---|---|---|
| 命 | Noto Sans SC Light | OFL 1.1 |
| mandate | Major Mono Display | OFL 1.1 |

Both are outlined in every asset; no font is needed to display them.

Construction, in the word's cap height (C):

- 命 is 1.12 C tall and sits 6% of its height below the baseline.
- Stems match: 命 2.4, word 2.2 at a 60px word.
- Gap between 命 and word: 0.42 × 命 height.
- Clear space on every side: C.

## Rules

- 命 always appears with `mandate`. Alone, it reads first as life or fate.
- Exception: icons, where the name sits beside them (browser tab, repo, app).
- Below 110px lockup width, use the icon.
- One colour is always acceptable. Two-tone is the default.
- No outlines, frames, effects, patterns or ornament on the mark. No other typeface for 命.

## Colour

Turquoise inlay: Shang and Zhou bronzes were inlaid with turquoise. No red.

| Role | Dark | Light |
|---|---|---|
| Background | `#2b1f16` | `#efe5d2` |
| Surface | `#36281d` | `#e5d9c2` |
| Line | `#4a3828` | `#cdbfa5` |
| Text | `#efe5d2` | `#2b1f16` |
| Muted | `#b3a28c` | `#6e6253` |
| 命 | `#3fb8af` | `#186861` |
| Word | `#e3c08a` | `#6b4a2a` |

All text roles are at least 4.5:1 on their background.

## Status

Colour is never the only signal; each state has a glyph.

| State | Glyph | Dark | Light |
|---|---|---|---|
| active | ● | `#3fb8af` | `#186861` |
| gate | ◐ | `#e3c08a` | `#7a5530` |
| blocked | ○ | `#8fa9ee` | `#2f4fa8` |
| info | ◆ | `#7cc79b` | `#2b6b4c` |
| done | ✓ | `#b8a892` | `#6e6253` |

## Icon masters

Heavier 命 at smaller sizes so strokes hold on the pixel grid.

| Size | Weight | File |
|---|---|---|
| 16 | Bold | `favicon-16.png`, `favicon.svg` |
| 32 | Regular | `favicon-32.png` |
| 48 and up | Light | `apple-touch-icon.png`, `icon-dark.svg`, `icon-light.svg` |

## Files

| File | Use |
|---|---|
| `lockup-on-dark.svg`, `lockup-on-light.svg` | Default, transparent background |
| `lockup-on-dark-mono.svg`, `lockup-on-light-mono.svg` | One colour |
| `stacked-on-dark.svg`, `stacked-on-light.svg` | Covers, square spaces |
| `icon-dark.svg`, `icon-light.svg` | App and avatar, 512 |
| `favicon.svg`, `favicon-16.png`, `favicon-32.png`, `apple-touch-icon.png` | Browser |
| `social-preview.png` | GitHub social preview, 1280 × 640 |
