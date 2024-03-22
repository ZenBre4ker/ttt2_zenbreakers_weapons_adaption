ZENWEAPONS = ZENWEAPONS or {}
ZENWEAPONS.folderPath = "terrortown/zen_weapons/"
ZENWEAPONS.weaponsList = {}

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

ZENWEAPONS.classes = {}
ZENWEAPONS.subClasses = {}
for class, subClasses in pairs(ZENWEAPONS.classVariants) do
    ZENWEAPONS.classes[#ZENWEAPONS.classes + 1] = class
    ZENWEAPONS.subClasses[class] = {}
    for subClass in pairs(subClasses) do
        ZENWEAPONS.subClasses[class][#ZENWEAPONS.subClasses[class] + 1] = subClass
    end
end

ZENWEAPONS.classStats = table.Copy(ZENWEAPONS.classVariants)

ZENWEAPONS.defaultSubClasses = {
    pistol = "pistol",
    rifle = "ar",
    shotgun = "pump",
    sniper = "bolt",
}

ZENWEAPONS.allowedWeapons = {
    weapon_zen_base = true,
    weapon_zen_random_base_pistol = true,
    weapon_zen_random_base_rifle = true,
    weapon_zen_random_base_shotgun = true,
    weapon_zen_random_base_sniper = true,
    weapon_zen_random_pistol_auto = true,
    weapon_zen_random_pistol_pistol = true,
    weapon_zen_random_pistol_revolver = true,
    weapon_zen_random_rifle_ar = true,
    weapon_zen_random_rifle_lmg = true,
    weapon_zen_random_rifle_mp = true,
    weapon_zen_random_rifle_smg = true,
    weapon_zen_random_shotgun_auto = true,
    weapon_zen_random_shotgun_double = true,
    weapon_zen_random_shotgun_pump = true,
    weapon_zen_random_sniper_auto = true,
    weapon_zen_random_sniper_bolt = true,
}

ZENWEAPONS.skinStats = {
    { "Name" },
    { "PrintName" },
    { "ViewModelFlip" },
    { "IronSightsPos" },
    { "IronSightsAng" },
    { "Primary", "Sound" },
    { "ViewModel" },
    { "WorldModel" },
}

function ZENWEAPONS:GetRandomSubClass(class)
    return ZENWEAPONS.subClasses[class][math.random(#ZENWEAPONS.subClasses[class])]
end

function ZENWEAPONS:GetRandomClass()
    return ZENWEAPONS.classes[math.random(#ZENWEAPONS.classes)]
end

function ZENWEAPONS:GetClassStats(class, subClass)
    return self.classStats[class][subClass]
end

function ZENWEAPONS:GetRandomSkin(class, subClass) end

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
            .. "), IronSightsAng = Vector("
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

function ZENWEAPONS:MergeRandomSkinStats(destinationTbl, class, subClass)
    local randomVariant = self.weaponsList[self.classVariants[class][subClass][math.random(
        #self.classVariants[class][subClass]
    )]]

    for i = 1, #ZENWEAPONS.skinStats do
        local lastStat
        local statTbl = ZENWEAPONS.skinStats[i]
        local sourceTbl = randomVariant
        for j = 1, #statTbl do
            lastStat = statTbl[j]
            sourceTbl = sourceTbl[lastStat]
            destinationTbl[lastStat] = destinationTbl[lastStat] or {}
        end
        destinationTbl[lastStat] = sourceTbl
    end
end

local function MergeIncludeUserdata(destination, source)
    table.Merge(destination, source)
    destination.IronSightsPos = source.IronSightsPos or destination.IronSightsPos
    destination.IronSightsAng = source.IronSightsAng or destination.IronSightsAng
end

function ZENWEAPONS:CheckNonZenWeapons(equipment, name)
    local allowedWeapon = self.allowedWeapons[name]

    if allowedWeapon == nil then
        return
    end

    local weaponSkin = self.weaponsList[name] or {}
    MergeIncludeUserdata(equipment, weaponSkin)
    self.weaponsList[name] = equipment

    if not allowedWeapon then
        return false
    end

    local class = equipment.Class
    local subClass = equipment.SubClass
    if class == nil or subClass == nil then
        return
    end

    self.classStats[class][subClass] = equipment
end

function ZENWEAPONS:AddWeaponFromFile(weapon)
    local name = weapon.Name
    if not isstring(weapon.Class) or not isstring(name) then
        return false
    end

    local subClasses = self.classVariants[weapon.Class]
    if not istable(subClasses) then
        return false
    end

    self.weaponsList[name] = weapon
    local subClassVariants
    if (isstring(weapon.SubClass)) and istable(subClasses[weapon.SubClass]) then
        subClassVariants = subClasses[weapon.SubClass]
    else
        subClassVariants = subClasses[self.defaultSubClasses[weapon.Class]]
    end
    subClassVariants[#subClassVariants + 1] = name
    self.allowedWeapons[name] = false

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
        "Successfully loaded ",
        fileExecutionCounter,
        " Files with ",
        weaponCounter,
        " ZEN weapons."
    )
end
