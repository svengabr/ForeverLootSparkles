-- luacheck config: every WoW global the addon touches must be listed here,
-- so a typo or an accidental global fails CI instead of erroring in the client.
std = "lua51"
max_line_length = false
exclude_files = { ".luacheckrc" }

globals = {
  "ForeverLootSparklesDB",
}

read_globals = {
  "C_CVar",
  "C_NamePlate",
  "C_QuestLog",
  "C_TooltipInfo",
  "CreateFrame",
  "CreateSettingsListSectionHeaderInitializer",
  "Enum",
  "GetFileIDFromPath",
  "GetNumQuestLogEntries",
  "GetQuestLogTitle",
  "GetTime",
  "InCombatLockdown",
  "issecretvalue",
  "SetUnitCursorTexture",
  "Settings",
  "strlower",
  "UIParent",
  "UnitExists",
  "UnitIsGameObject",
  "UnitIsInInteractRange",
  "UnitIsUnit",
  "UnitName",
  "wipe",
}
