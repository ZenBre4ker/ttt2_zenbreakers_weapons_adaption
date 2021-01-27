if SERVER then
	AddCSLuaFile()
end

SWEP.Base				= "weapon_zen_pistolbase"
SWEP.SubClass			= "pistol"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName		= "Pistol"

	SWEP.ViewModelFlip	= false

	SWEP.Icon			= "vgui/ttt/icon_pistol"
	SWEP.IconLetter		= "u"
end

SWEP.Primary.Sound 		= Sound("Weapon_FiveSeven.Single")

SWEP.ViewModel			= Model("models/weapons/cstrike/c_pist_fiveseven.mdl")
SWEP.WorldModel			= Model("models/weapons/w_pist_fiveseven.mdl")

SWEP.IronSightsPos		= Vector(-5.95, -4, 2.799)
SWEP.IronSightsAng		= Vector(0, 0, 0)

SWEP.AutoSpawnable		= true
SWEP.Spawnable			= true
