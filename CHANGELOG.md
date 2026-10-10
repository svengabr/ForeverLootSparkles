# Changelog

## 1.2.0

- Ore veins and herbs sparkle as you approach them, using Blizzard's soft targeting (adapted from Lueur). The glints are dim out of reach, brighten in reach and turn grey when the node can't be gathered.
- The game's soft target icons are switched on (also for world objects), and the soft target range is set to the maximum.
- New checkboxes under Options > AddOns > Forever Loot Sparkles: Ore veins and Herbs (on), Quest objects (off).
- The soft targeting console variables are saved and restored once all three are switched off.

## 1.1.1

- Addon icon in the addon list.
- The addon list shows "dev" instead of the raw version placeholder when running from a source checkout.

## 1.1.0

- Options panel under Esc > Options > AddOns > Forever Loot Sparkles with a checkbox to switch the sparkles on or off (on by default).
- Switching it off turns the loot sparkle off and sets the outline mode back to High.
- Switching it on works at once; switching it off takes effect after restarting the game (`/reload` is not enough), and the panel shows a reminder.

## 1.0.0

- Initial release: quest items always sparkle. The addon turns the outline mode off and the loot sparkle on at login, and again whenever a graphics change resets them.
