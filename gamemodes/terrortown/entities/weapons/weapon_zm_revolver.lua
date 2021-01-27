if SERVER then
	AddCSLuaFile()
end

SWEP.Base				= "weapon_zen_pistolbase"
SWEP.SubClass			= "revolver"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName		= "Deagle"

	SWEP.ViewModelFlip	= false

	SWEP.Icon			= "vgui/ttt/icon_deagle"
end

SWEP.Primary.Sound 		= Sound("Weapon_Deagle.Single")

SWEP.ViewModel			= Model("models/weapons/cstrike/c_pist_deagle.mdl")
SWEP.WorldModel			= Model("models/weapons/w_pist_deagle.mdl")

SWEP.IronSightsPos		= Vector(-6.361, -3.701, 2.15)
SWEP.IronSightsAng		= Vector(0, 0, 0)

SWEP.AutoSpawnable		= true
SWEP.Spawnable			= true
