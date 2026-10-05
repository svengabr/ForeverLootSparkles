-- Quest item sparkles only show when the outline mode is off and
-- outlineModeShowLootEffectWhenDisabled is on. Graphics presets reset these,
-- so they are applied at login and again after every relevant cvar change.

local WANTED = {
	outlineModeShowLootEffectWhenDisabled = "1",
	graphicsOutlineMode = "0",
	OutlineEngineMode = "0",
	raidGraphicsOutlineMode = "0",
	RAIDOutlineEngineMode = "0",
};

local WATCHED = {
	graphicsquality = true,
	raidgraphicsquality = true,
};
for cvar in pairs(WANTED) do
	WATCHED[strlower(cvar)] = true;
end

local applying = false;
local pendingAfterCombat = false;

local function Apply()
	if InCombatLockdown() then
		pendingAfterCombat = true;
		return;
	end
	applying = true;
	for cvar, value in pairs(WANTED) do
		local current = C_CVar.GetCVar(cvar);
		if current ~= nil and current ~= value then
			pcall(C_CVar.SetCVar, cvar, value);
		end
	end
	applying = false;
end

local applyAt;
local timerFrame = CreateFrame("Frame");
timerFrame:Hide();
timerFrame:SetScript("OnUpdate", function(self)
	if GetTime() >= applyAt then
		self:Hide();
		Apply();
	end
end);

local function ScheduleApply(delay)
	applyAt = GetTime() + delay;
	timerFrame:Show();
end

local frame = CreateFrame("Frame");
frame:RegisterEvent("PLAYER_LOGIN");
frame:RegisterEvent("PLAYER_REGEN_ENABLED");
pcall(frame.RegisterEvent, frame, "CVAR_UPDATE");
frame:SetScript("OnEvent", function(_, event, cvar)
	if event == "PLAYER_LOGIN" then
		Apply();
		ScheduleApply(5);
	elseif event == "PLAYER_REGEN_ENABLED" then
		if pendingAfterCombat then
			pendingAfterCombat = false;
			Apply();
		end
	elseif not applying and type(cvar) == "string" and WATCHED[strlower(cvar)] then
		ScheduleApply(1);
	end
end);
