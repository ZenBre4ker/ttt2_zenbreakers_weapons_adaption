if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_base"
SWEP.Class = "pistol"
SWEP.SubClass = nil

if CLIENT then
    SWEP.PrintName = "ZEN_Random_Pistol_Base"
    SWEP.Slot = 1

    SWEP.Icon = "vgui/ttt/icon_pistol"
    SWEP.IconLetter = "u"
end

SWEP.Kind = WEAPON_PISTOL
SWEP.WeaponID = AMMO_PISTOL

SWEP.HoldType = "pistol"

SWEP.Secondary.Delay = 0.1

SWEP.DeploySpeed = 1.4

SWEP.ZoomFOV = 0
SWEP.DrawIronSightsScope = false

SWEP.AutoSpawnable = true
SWEP.Spawnable = true
SWEP.UseHands = true
