--Addon will check to see if you have a favorite mount and remind you if you do not.

local JWNumMounts =  C_MountJournal.GetNumMounts();
local JWFav = 0
local JWNoFav = CreateFrame("Frame", "JWNoFav", UIParent)

JWNoFav:RegisterEvent("PLAYER_ENTERING_WORLD")

local function eventHandler(self, event, ...)
	for i = 1, JWNumMounts do
		if C_MountJournal.GetIsFavorite(i) then
			JWFav = JWFav + 1
		end
	end
	if JWFav == 0 then
		message("You do not have any mounts selected as a favorite.")
	end
end

JWNoFav:SetScript("OnEvent", eventHandler)