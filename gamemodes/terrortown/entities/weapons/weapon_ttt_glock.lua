if SERVER then
	AddCSLuaFile()
end

SWEP.Base				= "weapon_zen_pistolbase"
SWEP.SubClass			= "auto"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName		= "Glock"

	SWEP.ViewModelFlip	= false

	SWEP.Icon			= "vgui/ttt/icon_glock"
	SWEP.IconLetter		= "c"
end

SWEP.Primary.Sound 		= Sound("Weapon_Glock.Single")

SWEP.ViewModel			= Model("models/weapons/cstrike/c_pist_glock18.mdl")
SWEP.WorldModel			= Model("models/weapons/w_pist_glock18.mdl")

SWEP.IronSightsPos		= Vector(-5.79, -3.9982, 2.8289)
SWEP.IronSightsAng		= Vector(0, 0, 0)

SWEP.AutoSpawnable		= true
SWEP.Spawnable			= true
