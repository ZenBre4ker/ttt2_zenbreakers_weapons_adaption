if SERVER then
	AddCSLuaFile()
end

SWEP.Base				= "weapon_zen_sniperbase"
SWEP.SubClass			= "bolt" -- "bolt" or "auto"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName		= "Sniper Rifle"

	SWEP.ViewModelFlip	= false

	SWEP.Icon			= "vgui/ttt/icon_scout"
	SWEP.IconLetter		= "n"
end

SWEP.Primary.Sound 		= Sound("Weapon_Scout.Single")
SWEP.Secondary.Sound	= Sound("Default.Zoom")

SWEP.ViewModel			= Model("models/weapons/cstrike/c_snip_scout.mdl")
SWEP.WorldModel			= Model("models/weapons/w_snip_scout.mdl")

SWEP.IronSightsPos 		= Vector(5, -15, -2)
SWEP.IronSightsAng 		= Vector(2.6, 1.37, 3.5)

SWEP.AutoSpawnable 		= true
SWEP.Spawnable          = true
