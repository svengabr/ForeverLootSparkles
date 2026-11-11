# AGENTS.md

Notes for AI agents (Claude Code, Codex, Cursor …) working on ForeverLootSparkles.

## What the addon does

WoW addon that keeps the sparkle effect on lootable quest items switched on. Graphics presets turn it off. At
login (and 5 s later) and about 1 s after any watched cvar changes (`CVAR_UPDATE`), the addon sets
`outlineModeShowLootEffectWhenDisabled` = 1. Up to 1.3.0 it also forced `graphicsOutlineMode`, `OutlineEngineMode`,
`raidGraphicsOutlineMode` and `RAIDOutlineEngineMode` to 0, which removed the player's Self Highlight outline
(CurseForge issue #1). The outline mode is the player's setting: don't touch it.

In combat it waits for `PLAYER_REGEN_ENABLED`. One option (checkbox under Esc > Options > AddOns, SavedVariable `ForeverLootSparklesDB.enabled`, default on); switching it off stops enforcing and writes the `DISABLED` value once (loot effect 0). Tested in the client: switching on shows the sparkle at once, switching off only takes effect after a full game restart (`/reload` is not enough), so switching it off prints a restart notice in chat (not a settings header with a shown predicate: Blizzard's options search runs those and gets tainted, CurseForge issue #4). The cvar part lives in
`ForeverLootSparkles.lua`.

Up to 1.3.x a second file, `SoftTarget.lua` (from the maintainer's Lueur addon), made ore veins, herbs, corpses with
loot and quest objects sparkle by switching on Blizzard's interaction soft targeting (`SoftTargetInteract` 3,
`SoftTargetIconGameObject` 1, `SoftTargetNameplateInteract`) and hanging glints on the `softinteract` nameplate. It was
removed in 2.0.0: it broke self-cast on friendly spells (CurseForge issue #10), left empty nameplates on dead mobs
(#12) and showed interact icons (#7). Don't bring that approach back. What's left is a one-time cleanup in
`ForeverLootSparkles.lua` (`RestoreSoftTarget`): the original values saved in `ForeverLootSparklesDB.savedCVars` are
put back at login and again with the 5 s pass, then the table is dropped. `SoftTargetInteract`,
`SoftTargetIconGameObject`, `SoftTargetIconInteract` and `SoftTargetLowPriorityIcons` only go back while they still hold
the value the addon set, so a player who changed them keeps theirs. The old option keys (`sparkleOre`, `sparkleHerbs`,
`sparkleQuest`, `sparkleCorpseLoot`) are cleared from the SavedVariable. The addon list icon is `Icon.tga` (64×64, scaled down from `media/logo.png`, whose source is `media/logo.svg`).

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
  changes, remind the maintainer to paste it there by hand. Leave out the title, the logo and the two gallery
  images there: the CurseForge page already shows all three above the description.

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
