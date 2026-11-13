# Forever Loot Sparkles

<img src="https://raw.githubusercontent.com/svengabr/ForeverLootSparkles/main/media/logo.png" alt="ForeverLootSparkles logo" width="128">

Keeps the loot sparkle on quest items switched on in **World of Warcraft: Forever**, so you don't walk past them.

Graphics presets turn the sparkle off. This addon turns it back on at login and whenever a graphics change resets it. There is nothing to set up.

![Forever Loot Sparkles](https://raw.githubusercontent.com/svengabr/ForeverLootSparkles/main/media/gallery/01-overview.jpg)

![Survives graphics presets](https://raw.githubusercontent.com/svengabr/ForeverLootSparkles/main/media/gallery/02-presets.jpg)

## Want more sparkles?

This addon only does quest items. For herbs, ore and other objects, use one of these:

| Addon | What it adds |
| --- | --- |
| [Forever Loot Sparkles : Herbs & Ores](https://www.curseforge.com/wow/addons/forever-loot-sparkles-herbs-ores) by N3zr0k | Sparkles on herbs, ore veins, quest objects and corpses with loot, each in a color you pick. Needs this addon installed. |
| [Lueur](https://www.curseforge.com/wow/addons/lueur) | Lights up ore veins, herbs, chests and quest objects as you get close. Ten effects, sparkles and a light beam among them. |

Versions 1.2.0 to 1.3.1 had herb and ore sparkles built in. They broke self-cast and left empty nameplates on dead mobs, so 2.0.0 removed them and put your interact key settings back.

## Turning it off again

Untick the checkbox under **Esc > Options > AddOns > Forever Loot Sparkles**, restart the game (`/reload` is not enough), then remove the addon.

Removing the addon alone does not switch the sparkle off, because WoW saves the setting itself. If the addon is already gone, type this and restart the game:

```
/console outlineModeShowLootEffectWhenDisabled 0
```

## Good to know

- The game shows either the sparkle or the outline on quest items, never both.
- The game decides which objects sparkle. Addons can't pick.
- Quest givers sparkle too. The game uses one setting for both, so there is no way to keep the sparkle on quest items and drop it on NPCs.

## About me

I'm Sven. I've been a software developer for over 20 years, and I write and maintain my World of Warcraft addons in my free time. They are free and open source, and they will stay that way.

Found a bug or have an idea? Open an [issue](https://github.com/svengabr/ForeverLootSparkles/issues) or send me a DM on [CurseForge](https://www.curseforge.com/members/conoar).

## Support

The addon is free and always will be. If it made your game a bit nicer, you can [buy me a coffee](https://buymeacoffee.com/conoar) or send something via [PayPal](https://paypal.me/svengabr).
