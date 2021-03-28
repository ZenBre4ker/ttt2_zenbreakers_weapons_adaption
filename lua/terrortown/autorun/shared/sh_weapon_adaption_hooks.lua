if SERVER then
	AddCSLuaFile()
end

if file.Exists("terrortown/autorun/shared/sh_zenbreaker_weapons_cvars.lua", "LUA") then
	include("terrortown/autorun/shared/sh_zenbreaker_weapons_cvars.lua")
end

--ConVars
local showZenStats = GetConVar("ttt_ZenBase_ShowZenStats")
local showOnlyZenStats = GetConVar("ttt_ZenBase_ShowOnlyZenStats")
local drawHalo = GetConVar("ttt_ZenBase_DrawHaloLootColors")
local drawHaloRange = GetConVar("ttt_ZenBase_DrawHaloRange")

hook.Add("PreCleanupMap", "PreCleanUp Distribution", function()
	gaussian_random.Reset()
end)

hook.Add("PostCleanupMap", "PostCleanUp Distribution", function()
	gaussian_random.Reset()
end)

local function weaponGlow()
	if not drawHalo:GetBool() then return end

	local ply = LocalPlayer()
	local entList = ents.FindInSphere(ply:GetPos(),drawHaloRange:GetInt())
	for _,ent in pairs(entList) do
		if ent:IsWeapon() and not IsPlayer(ent:GetOwner()) and baseclass.Get(weapons.GetStored(ent:GetClass()).Base).Base == "weapon_zen_base" then
			outline.Add(ent,ent.myColor,OUTLINE_MODE_VISIBLE)
		end
	end
end

hook.Add("PreDrawHalos", "Zen_AddWeaponGlow", weaponGlow)

local function shiftTablebyN (tbl, N)
	entries = #tbl
	for i = entries,1 do
		tbl[i + N] = tbl[i]
		tbl[i] = nil
	end
	return tbl
end

hook.Add("TTTRenderEntityInfo", "Render Rarity Loot", function(tData)
	local ent = tData:GetEntity()
	if not IsValid(ent) or not ent:IsWeapon() or not weapons.IsBasedOn(ent:GetClass(), "weapon_zen_base") or not showZenStats:GetBool() then return end
	local myRandomValue = ent:GetRandomValue()
	if not myRandomValue then return end

	local params = tData.params
	title = params.displayInfo.title.text
	--subtitle = params.displayInfo.subtitle.text

	tData:SetTitle(title, ent.myColor)
	--tData:SetSubtitle(subtitle, myColor)

	local lines = tData:GetAmountDescriptionLines()
	local subclass = ent.SubClass
	local classname = ent.AvailableSubclasses[subclass] and ent.SubClassName[subclass] or ent.SubClassName["default"] or "Default not defined!"

	-- Old Code to preserve other Weapon Infos
	local preserveOtherInfos = not showOnlyZenStats:GetBool()
	local desc = tData.params.displayInfo.desc

	if preserveOtherInfos and lines > 1 then
		desc = shiftTablebyN(desc,5)
	end

	desc = preserveOtherInfos and desc or {}

	desc[1] = {
		text = "Class: " .. classname,
		color = COLOR_WHITE,
		icons = {}
		}

	desc[2] = {
		text = "Lootvalue: " .. ent.scaledVal .. " / 10",
		color = COLOR_WHITE,
		icons = {}
		}

	desc[3] = {
		text = "Damage per Second: " .. ent.BaseDPS .. " (" ..  ent.DPSSign .. ent.DPSPlus .. ") DPS",
		color = COLOR_WHITE,
		icons = {}
		}

	desc[4] = {
		text = "Damage: " .. ent.BaseDamage .. " (" ..  ent.DamageSign .. ent.DamagePlus .. ")",
		color = COLOR_WHITE,
		icons = {}
		}

	desc[5] = {
		text = "Rounds per Minute: " .. ent.BaseRPM .. " (" ..  ent.RPMSign .. ent.RPMPlus .. ")",
		color = COLOR_WHITE,
		icons = {}
		}

	tData.params.displayInfo.desc = desc

	if not preserveOtherInfos then return true end
end)
