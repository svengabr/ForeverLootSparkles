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
  "CreateFrame",
  "CreateSettingsListSectionHeaderInitializer",
  "GetTime",
  "InCombatLockdown",
  "Settings",
  "strlower",
}
