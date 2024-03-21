if SERVER then
    AddCSLuaFile()
end

local filePath = "terrortown/scripts/sh_zen_weapons.lua"
if file.Exists(filePath, "LUA") then
    AddCSLuaFile(filePath)
    include(filePath)
end

ZENWEAPONS:LoadIncludedWeapons()

local function CheckNonZenWeapons(equipment, name)
    return ZENWEAPONS:CheckNonZenWeapons(equipment, name)
end

hook.Add("PreRegisterSWEP", "CheckNonZenWeapons", CheckNonZenWeapons)
