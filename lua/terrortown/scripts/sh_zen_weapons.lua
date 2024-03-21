ZENWEAPONS = ZENWEAPONS or {}
ZENWEAPONS.folderPath = "terrortown/zen_weapons/"

ZENWEAPONS.weaponsList = {
    weapon_zen_base = false,
    weapon_zen_pistolbase = false,
    weapon_zen_riflebase = false,
    weapon_zen_shotgunbase = false,
    weapon_zen_sniperbase = false,
}

ZENWEAPONS.classVariants = {
    pistol = {
        pistol = {},
        revolver = {},
        auto = {},
    },
    rifle = {
        ar = {},
        smg = {},
        mp = {},
        lmg = {},
    },
    shotgun = {
        pump = {},
        auto = {},
        double = {},
    },
    sniper = {
        bolt = {},
        auto = {},
    },
}

ZENWEAPONS.defaultSubClasses = {
    pistol = "pistol",
    rifle = "ar",
    shotgun = "pump",
    sniper = "bolt",
}

function ZENWEAPONS:PrintOldEquipment(equipment, name)
    print(
        "{Name = \""
            .. name
            .. "\", Base = \""
            .. equipment.Base
            .. "\", SubClass = \""
            .. tostring(equipment.SubClass)
            .. "\", PrintName = \""
            .. equipment.PrintName
            .. "\", ViewModelFlip = "
            .. tostring(equipment.ViewModelFlip)
            .. ", IronSightsPos = Vector("
            .. equipment.IronSightsPos.x
            .. ", "
            .. equipment.IronSightsPos.y
            .. ", "
            .. equipment.IronSightsPos.z
            .. "), IronsSightsAng = Vector("
            .. equipment.IronSightsAng.x
            .. ", "
            .. equipment.IronSightsAng.y
            .. ", "
            .. equipment.IronSightsAng.z
            .. "), Sound = Sound(\""
            .. tostring(equipment.Primary.Sound)
            .. "\")},"
    )
end

function ZENWEAPONS:CheckNonZenWeapons(equipment, name)
    weaponStored = self.weaponsList[name]

    if not weaponStored then
        return
    end

    table.Merge(equipment, weaponStored)
    self.weaponsList[name] = equipment

    return false
end

function ZENWEAPONS:AddWeaponFromFile(weapon)
    if not isstring(weapon.Base) or not isstring(weapon.Name) then
        return false
    end

    local subClasses = self.classVariants[weapon.Base]
    if not istable(subClasses) then
        return false
    end

    self.weaponsList[weapon.Name] = weapon
    local subClassVariants
    if (isstring(weapon.SubClass)) and istable(subClasses[weapon.SubClass]) then
        subClassVariants = subClasses[weapon.SubClass]
    else
        subClassVariants = subClasses[self.defaultSubClasses[weapon.Base]]
    end
    subClassVariants[#subClassVariants + 1] = weapon.Name

    return true
end

function ZENWEAPONS:LoadIncludedWeapons()
    local files = file.Find(self.folderPath .. "*.lua", "LUA", "nameasc") or {}

    local fileExecutionCounter = 0
    local weaponCounter = 0
    for i = 1, #files do
        local fileName = files[i]
        local fullPath = self.folderPath .. files[i]

        if SERVER then
            AddCSLuaFile(fullPath)
        end

        Dev(0, "Loading Zen Weapon file: ", fileName)

        zenWeapons = include(fullPath)

        if not istable(zenWeapons) or not table.IsSequential(zenWeapons) then
            ErrorNoHalt("[ZEN] Zen file returns no sequential table.")

            continue
        end

        for i = 1, #zenWeapons do
            if not self:AddWeaponFromFile(zenWeapons[i]) then
                continue
            end

            weaponCounter = weaponCounter + 1
        end

        fileExecutionCounter = fileExecutionCounter + 1
    end

    Dev(
        0,
        "[ZEN] Successfully loaded ",
        fileExecutionCounter,
        " Files with ",
        weaponCounter,
        " ZEN weapons."
    )
end
