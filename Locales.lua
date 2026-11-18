-- Translations. The English text is the key: L["Value"] is the player's language
-- where a block below has it, and the English itself where none does, so a string
-- left out of a block still shows. Loads first (see the TOC), so every file can
-- read ns.L as it loads. A new language is another block like frFR's, under its
-- GetLocale() code.

local _, ns = ...;

local L = setmetatable({}, { __index = function(_, key) return key; end });
ns.L = L;

if GetLocale and GetLocale() == "frFR" then
	L["|cffff8000Forever Loot Sparkles:|r restart the game to remove the sparkles. /reload is not enough."] =
		"|cffff8000Forever Loot Sparkles :|r relancez le jeu pour retirer les scintillements. /reload ne suffit pas.";
	L["Show quest item sparkles"] = "Afficher les scintillements des objets de quête";
	L["Keeps the game's loot sparkle on, even after a graphics preset turns it off. Your outline mode is left as you set it. Switching this off takes effect after restarting the game."] =
		"Garde le scintillement du butin du jeu activé, même après qu'un préréglage graphique l'a désactivé. Votre mode de contour reste tel que vous l'avez réglé. La désactivation prend effet après avoir relancé le jeu.";
end
