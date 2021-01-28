if SERVER then
	AddCSLuaFile()
end

SWEP.Base				= "weapon_zen_riflebase"
SWEP.SubClass			= "ar"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName		= "M16"

	SWEP.ViewModelFlip	= false

	SWEP.Icon			= "vgui/ttt/icon_m16"
	SWEP.IconLetter		= "w"
end

SWEP.Primary.Sound		= Sound("Weapon_M4A1.Single")

SWEP.ViewModel			= Model("models/weapons/cstrike/c_rif_m4a1.mdl")
SWEP.WorldModel			= Model("models/weapons/w_rif_m4a1.mdl")

SWEP.IronSightsPos 		= Vector(-2, -5, 2)
SWEP.IronSightsAng 		= Vector(2.6, 1.37, 3.5)

SWEP.AutoSpawnable		= true
SWEP.Spawnable			= true
