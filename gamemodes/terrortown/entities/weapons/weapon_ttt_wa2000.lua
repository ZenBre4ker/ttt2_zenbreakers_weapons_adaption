if SERVER then
	AddCSLuaFile()
	resource.AddWorkshop("613786944")
end

SWEP.Base				= "weapon_zen_sniperbase"
SWEP.SubClass			= "auto" -- "bolt" or "auto"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName		= "Walther 2000"

	SWEP.ViewModelFlip	= true

	SWEP.Icon			= "vgui/ttt/icon_wa2000"
	SWEP.IconLetter		= "n"
end

SWEP.Primary.Sound 		= Sound("weapons/gamefreak/walther2000/walther.wav")
SWEP.Secondary.Sound	= Sound("Default.Zoom")

SWEP.ViewModel			= Model("models/weapons/gamefreak/v_noob_sg550.mdl")
SWEP.WorldModel			= Model("models/weapons/gamefreak/w_noob_sg550.mdl")

SWEP.IronSightsPos 		= Vector(1, -1,1)
SWEP.IronSightsAng 		= Vector(0, 0, 0)

SWEP.AutoSpawnable 		= true
SWEP.Spawnable			= true
