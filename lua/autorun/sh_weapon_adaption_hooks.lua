if SERVER then
	AddCSLuaFile()
end

--local gaussian_random = gaussian_random

hook.Add("PreCleanupMap", "PreCleanUp Distribution", function()
	gaussian_random.Reset()
end)

hook.Add("PostCleanupMap", "PostCleanUp Distribution", function()
	gaussian_random.Reset()
end)

hook.Add("TTTRenderEntityInfo", "Render Rarity Loot", function(tData)
	local ent = tData:GetEntity()
	if not IsValid(ent) or not ent:IsWeapon() or not weapons.IsBasedOn(ent:GetClass(), "weapon_zen_base") then return end
	local myRandomValue = ent:GetRandomValue()
	if not myRandomValue then return end

	local myColor = gaussian_random.interpolateColor(myRandomValue)

	local params = tData.params
	title = params.displayInfo.title.text
	subtitle = params.displayInfo.subtitle.text

	tData:SetTitle(title, myColor)
	tData:SetSubtitle(subtitle, myColor)
end)
