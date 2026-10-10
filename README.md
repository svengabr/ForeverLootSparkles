# Forever Loot Sparkles

<img src="https://raw.githubusercontent.com/svengabr/ForeverLootSparkles/main/media/logo.png" alt="ForeverLootSparkles logo" width="128">

A tiny addon for **World of Warcraft: Forever** that always shows the sparkle effect on lootable quest items.

The sparkle only appears while the outline mode is off. Graphics presets switch it back on, so the addon sets the needed console variables at login and again whenever a graphics change resets them.

The game has no sparkle for ore veins and herbs, so the addon adds its own: as you approach a node, a small cluster of golden glints twinkles over it. They are dim while the node is out of reach, brighten once you can gather it, and turn grey when you can't (skill too low). This uses Blizzard's soft targeting, which marks the nearest interactable object within about 15 yards; the game's interact icon is switched on above it as well.

![Forever Loot Sparkles](https://raw.githubusercontent.com/svengabr/ForeverLootSparkles/main/media/gallery/01-overview.jpg)

![Survives graphics presets](https://raw.githubusercontent.com/svengabr/ForeverLootSparkles/main/media/gallery/02-presets.jpg)

## Options

Open **Esc > Options > AddOns > Forever Loot Sparkles**. The checkbox **Show quest item sparkles** is on by default. Switching it off stops the addon from touching the graphics settings, turns the loot sparkle off and sets the outline mode back to High (the two commands below). Switching it on works at once. Switching it off only takes effect after **restarting the game**; `/reload` is not enough. The panel shows a reminder.

Under **Sparkles while approaching** there are three more checkboxes: **Ore veins** and **Herbs** (on by default) and **Quest objects** (off by default, since the game's loot sparkle already marks most of them). They take effect at once.

![Options](https://raw.githubusercontent.com/svengabr/ForeverLootSparkles/main/media/gallery/03-options.jpg)

## Install

1. Download the latest release zip.
2. Extract it so you have `World of Warcraft\_classic_beta_\Interface\AddOns\ForeverLootSparkles`.
3. Restart the game or type `/reload`.

## Turning it off again

The easiest way is the checkbox under Options (see above), which resets the settings for you.

Disabling the addon in the addon list does **not** undo the settings, because WoW saves console variables itself. After disabling it, either pick a graphics preset again, or type:

```
/console outlineModeShowLootEffectWhenDisabled 0
/console graphicsOutlineMode 2
```

Then restart the game.

The soft targeting settings for the approach sparkles are put back as soon as all three checkboxes under **Sparkles while approaching** are off. Untick them before disabling the addon.

## What it sets

| Console variable | Value |
| --- | --- |
| `outlineModeShowLootEffectWhenDisabled` | 1 |
| `graphicsOutlineMode` | 0 |
| `OutlineEngineMode` | 0 |
| `raidGraphicsOutlineMode` | 0 |
| `RAIDOutlineEngineMode` | 0 |

For the approach sparkles, while at least one of their checkboxes is on (the original values are saved and restored):

| Console variable | Value |
| --- | --- |
| `SoftTargetInteract` | 3 |
| `SoftTargetInteractRange` | 60 (the client still stops at about 15 yards) |
| `SoftTargetInteractArc` | 2 |
| `SoftTargetInteractOnlyInRange` | 0 |
| `SoftTargetIconInteract` | 1 |
| `SoftTargetIconGameObject` | 1 |
| `SoftTargetLowPriorityIcons` | 1 |
| `SoftTargetNameplateInteract` | 1 on a node that sparkles, otherwise 0 |

## Support

The addon is free and always will be. If it made your game a bit nicer, you can [buy me a coffee](https://buymeacoffee.com/conoar).
