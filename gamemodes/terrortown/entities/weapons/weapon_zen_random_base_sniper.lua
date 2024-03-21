if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_base"
SWEP.Class = "sniper"
SWEP.SubClass = nil

if CLIENT then
    SWEP.PrintName = "ZEN_Random_Sniper_Base"
    SWEP.Slot = 2

    SWEP.Icon = "vgui/ttt/icon_scout"
    SWEP.IconLetter = "n"
end

SWEP.Kind = WEAPON_HEAVY
SWEP.WeaponID = AMMO_RIFLE

SWEP.HoldType = "ar2"

SWEP.Primary.Ammo = "357"
SWEP.AmmoEnt = "item_ammo_357_ttt"

SWEP.Secondary.Delay = 0.1
SWEP.Secondary.Sound = Sound("Default.Zoom")

SWEP.DeploySpeed = 1.4

SWEP.ZoomFOV = 20
SWEP.DrawIronSightsScope = true

SWEP.AutoSpawnable = true
SWEP.Spawnable = true
SWEP.UseHands = true
