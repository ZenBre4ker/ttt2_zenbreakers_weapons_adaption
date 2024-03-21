if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_base"
SWEP.Class = "rifle"
SWEP.SubClass = nil

if CLIENT then
    SWEP.PrintName = "ZEN_Random_Rifle_Base"
    SWEP.Slot = 2

    SWEP.Icon = "vgui/ttt/icon_m16"
    SWEP.IconLetter = "w"
end

SWEP.Kind = WEAPON_HEAVY
SWEP.WeaponID = AMMO_M16

SWEP.Secondary.Delay = 0.1

SWEP.DeploySpeed = 1.4

SWEP.ZoomFOV = 0
SWEP.DrawIronSightsScope = false

SWEP.AutoSpawnable = true
SWEP.Spawnable = true
SWEP.UseHands = true
