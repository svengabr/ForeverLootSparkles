# Gallery images

Source for the CurseForge gallery: one HTML page per image (1920×1080), shared look in `style.css`
(same frame as ForeverMinimapTarget and KeepOrSell). `shot-off.png` and `shot-on.png` are cropped from
`../before-after.png` (in-game screenshots).

Render all pages to JPG (or a single one with `sh render.sh 02-presets.html`):

```sh
sh render.sh
```

Not in the repo (Blizzard asset, git-ignored), fetch it before rendering:

- `fonts/FRIZQT__.TTF`: `curl -L -o fonts/FRIZQT__.TTF https://wago.tools/api/casc/615960`
