# Forever Loot Sparkles

A tiny addon for **World of Warcraft: Forever** that always shows the sparkle effect on lootable quest items.

The sparkle only appears while the outline mode is off. Graphics presets switch it back on, so the addon sets the needed console variables at login and again whenever a graphics change resets them. There are no options: enabled means sparkles.

## Install

1. Download the latest release zip.
2. Extract it so you have `World of Warcraft\_classic_beta_\Interface\AddOns\ForeverLootSparkles`.
3. Restart the game or type `/reload`.

## Turning it off again

Disabling the addon does **not** undo the settings, because WoW saves console variables itself. After disabling it and typing `/reload`, either pick a graphics preset again, or type:

```
/console outlineModeShowLootEffectWhenDisabled 0
/console graphicsOutlineMode 2
```

## What it sets

| Console variable | Value |
| --- | --- |
| `outlineModeShowLootEffectWhenDisabled` | 1 |
| `graphicsOutlineMode` | 0 |
| `OutlineEngineMode` | 0 |
| `raidGraphicsOutlineMode` | 0 |
| `RAIDOutlineEngineMode` | 0 |
