# AGENTS.md

Notes for AI agents (Claude Code, Codex, Cursor …) working on ForeverLootSparkles.

## What the addon does

WoW addon that keeps the sparkle effect on lootable quest items switched on. The sparkle only shows while the
outline mode is off, and graphics presets turn it back on. At login (and 5 s later) and about 1 s after any
watched cvar changes (`CVAR_UPDATE`), the addon sets:

| CVar | Value |
|---|---|
| `outlineModeShowLootEffectWhenDisabled` | 1 |
| `graphicsOutlineMode` | 0 |
| `OutlineEngineMode` | 0 |
| `raidGraphicsOutlineMode` | 0 |
| `RAIDOutlineEngineMode` | 0 |

In combat it waits for `PLAYER_REGEN_ENABLED`. One option (checkbox under Esc > Options > AddOns, SavedVariable `ForeverLootSparklesDB.enabled`, default on); switching it off stops enforcing and writes the `DISABLED` values once (loot effect 0, outline modes 2). Tested in the client: switching on shows the sparkle at once, switching off only takes effect after a full game restart (`/reload` is not enough), so a notice shows while the option is off and sparkles were on this session. Everything lives in
`ForeverLootSparkles.lua`; the addon list icon is `Icon.tga` (64×64, scaled down from `media/logo.png`, whose source is `media/logo.svg`).

The feature was extracted from ForeverQoL, which set the same cvars through secure macro buttons
(`/console …`). This addon uses `C_CVar.SetCVar` instead.

## Rules

- **English only in the repo**: code comments, commit messages, `AGENTS.md`, `CHANGELOG.md`, `README.md` and
  workflow files.
- Played and tested only on WoW: Forever (Interface 16001, Blizzard UI source: Gethe/wow-ui-source, branch
  `forever`).
- CVars persist in `WTF/Config.wtf`: disabling the addon does not undo them. Keep the README's "Turning it off
  again" section in sync with what actually works in the client.
- Commit messages follow Conventional Commits (`feat:`, `fix:`, `chore:` …).
- The README is also the **CurseForge project description**. CurseForge can't take it over via API; after README
  changes, remind the maintainer to paste it there by hand.

## Checks

There are no unit tests. In-game behavior can only be checked in the client; say so honestly.

**luacheck:** `.luacheckrc` lists every global the addon uses; add new globals there.
Locally without a Lua install via Docker:
`docker run --rm -v "$PWD:/data" -w /data ghcr.io/lunarmodules/luacheck .`

It runs in `.github/workflows/test.yml` on push and pull request; the release workflow only starts after a green
check.

## Release

Publishing is automatic via `.github/workflows/release.yml` (BigWigsMods/packager) to CurseForge (project ID in
the TOC) and GitHub Releases. It runs **only on tags** `v*`, never on a plain push.

1. Add the new version to `CHANGELOG.md` and commit.
2. Create an annotated tag `vX.Y.Z` and push it; that starts the upload.

Don't replace `## Version: @project-version@` by hand, the packager sets it from the tag. It sits in a `#@non-debug@`
block so a source checkout (the junction in the AddOns folder) shows `dev` instead of the raw placeholder; the
packager drops the `#@debug@` line and uncomments the real one.
New files or folders that don't belong in the addon ZIP go into `.pkgmeta` under `ignore`.
Tags and pushes only after the maintainer approves.
