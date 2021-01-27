if SERVER then
	AddCSLuaFile()
end

SWEP.Base				= "weapon_zen_riflebase"
SWEP.SubClass			= "lmg"
SWEP.HoldType			= "crossbow"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName		= "H.U.G.E-249"

	SWEP.ViewModelFlip	= false

	SWEP.Icon			= "vgui/ttt/icon_m249"
	SWEP.IconLetter		= "z"
end

SWEP.Primary.Sound		= Sound("Weapon_m249.Single")

SWEP.ViewModel			= Model("models/weapons/cstrike/c_mach_m249para.mdl")
SWEP.WorldModel			= Model("models/weapons/w_mach_m249para.mdl")

SWEP.IronSightsPos		= Vector(-5.96, -5.119, 2.349)
SWEP.IronSightsAng		= Vector(0, 0, 0)

SWEP.AutoSpawnable		= true
SWEP.Spawnable			= true
