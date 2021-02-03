if SERVER then
	AddCSLuaFile()
end

hook.Add("PreCleanupMap", "PreCleanUp Distribution", function()
	gaussian_random.Reset()
end)

hook.Add("PostCleanupMap", "PostCleanUp Distribution", function()
	gaussian_random.Reset()
end)

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
	if not IsValid(ent) or not ent:IsWeapon() or not weapons.IsBasedOn(ent:GetClass(), "weapon_zen_base") then return end
	local myRandomValue = ent:GetRandomValue()
	if not myRandomValue then return end

	local myColor = gaussian_random.interpolateColor(myRandomValue)

	local params = tData.params
	title = params.displayInfo.title.text
	--subtitle = params.displayInfo.subtitle.text

	tData:SetTitle(title, myColor)
	--tData:SetSubtitle(subtitle, myColor)

	local lines = tData:GetAmountDescriptionLines()
	local scaledVal = math.floor((myRandomValue + 1) * 10) / 2
	local subclass = ent.SubClass
	local classname = ent.AvailableSubclasses[subclass] and ent.SubClassName[subclass] or ent.SubClassName["default"] or "Default not defined!"

	if lines < 1 then
		tData:AddDescriptionLine(
			"Lootvalue: " .. scaledVal .. "/10",
			myColor
		)

		tData:AddDescriptionLine(
			"Class: " .. classname
		)

		tData:AddDescriptionLine(
			"Damage per Second: " .. ent.DPS .. " DPS"
		)
	else
		local desc = tData.params.displayInfo.desc
		desc = shiftTablebyN(desc,3)

		desc[1] = {
			text = "Lootvalue: " .. scaledVal .. "/10",
			color = myColor,
			icons = {}
			}

		desc[2] = {
			text = "Class: " .. classname,
			color = COLOR_WHITE,
			icons = {}
			}

		desc[3] = {
			text = "Damage per Second: " .. ent.DPS .. " DPS",
			color = COLOR_WHITE,
			icons = {}
			}

		tData.params.displayInfo.desc = desc
	end
end)
