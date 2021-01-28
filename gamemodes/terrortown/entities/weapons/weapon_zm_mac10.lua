if SERVER then
	AddCSLuaFile()
end

SWEP.Base				= "weapon_zen_riflebase"
SWEP.SubClass			= "mp"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName		= "MAC10"

	SWEP.ViewModelFlip	= false

	SWEP.Icon			= "vgui/ttt/icon_mac"
	SWEP.IconLetter		= "l"
end

SWEP.Primary.Sound		= Sound("Weapon_mac10.Single")

SWEP.ViewModel			= Model("models/weapons/cstrike/c_smg_mac10.mdl")
SWEP.WorldModel			= Model("models/weapons/w_smg_mac10.mdl")

SWEP.IronSightsPos 		= Vector(-2, -5, 2)
SWEP.IronSightsAng 		= Vector(2.6, 1.37, 3.5)

SWEP.AutoSpawnable		= true
SWEP.Spawnable			= true
