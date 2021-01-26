if SERVER then
	AddCSLuaFile()
end

SWEP.Base					= "weapon_zen_base"
SWEP.SubClass				= "pistol" -- pistol or revolver or auto

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName			= "Pistol"
	SWEP.Slot				= 1

	SWEP.ViewModelFlip		= false
	SWEP.ViewModelFOV		= 54

	SWEP.Icon				= "vgui/ttt/icon_pistol"
	SWEP.IconLetter			= "u"
end

SWEP.Kind 					= WEAPON_PISTOL
SWEP.WeaponID				= AMMO_PISTOL
SWEP.HoldType 				= "pistol"

SWEP.Primary.Sound 			= Sound("Weapon_FiveSeven.Single")
SWEP.Secondary.Sound		= nil

SWEP.ViewModel				= Model("models/weapons/cstrike/c_pist_fiveseven.mdl")
SWEP.WorldModel				= Model("models/weapons/w_pist_fiveseven.mdl")

-- Standard Set for Pistols "pistol"
	SWEP.Primary.Automatic 		= false

	SWEP.Primary.Damage 		= 9
	SWEP.Primary.Delay 			= 0.15
	SWEP.Primary.Recoil 		= 0.8
	SWEP.Primary.NumShots 		= 1
	SWEP.Primary.Cone 			= 0.015
	SWEP.SightsAccuracyBoost	= 0.5		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.HeadshotMultiplier 	= 2
	SWEP.CloseUpKillDistance	= 100		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.FallOfDistance			= 200

	SWEP.Primary.ClipSize 		= 15
	SWEP.Primary.DefaultClip	= 15
	SWEP.Primary.ClipMax 		= 60

	SWEP.Primary.Ammo 			= "Pistol"
	SWEP.AmmoEnt				= "item_ammo_pistol_ttt" -- There is no AssaultRifle Ammo
--

SWEP.Zen						= {}
SWEP.Zen["revolver"] 			= {}
SWEP.Zen["auto"] 				= {}

-- Replace Set for Revolvers/Deagles "revolver"
	SWEP.Zen["revolver"].Automatic 				= false

	SWEP.Zen["revolver"].Damage 				= 37
	SWEP.Zen["revolver"].Delay 					= 0.5
	SWEP.Zen["revolver"].Recoil 				= 6.0
	SWEP.Zen["revolver"].Cone 					= 0.015
	SWEP.Zen["revolver"].SightsAccuracyBoost	= 0.9		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["revolver"].HeadshotMultiplier		= 3
	SWEP.Zen["revolver"].CloseUpKillDistance	= 300		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["revolver"].FallOfDistance			= 500

	SWEP.Zen["revolver"].ClipSize 				= 8
	SWEP.Zen["revolver"].DefaultClip			= 8
	SWEP.Zen["revolver"].ClipMax 				= 36

	SWEP.Zen["revolver"].Ammo 					= "AlyxGun"
	SWEP.Zen["revolver"].AmmoEnt				= "item_ammo_revolver_ttt"
--

-- Replace Set for Automatic Pistols "auto"
	SWEP.Zen["auto"].Automatic 					= true

	SWEP.Zen["auto"].Damage 					= 8
	SWEP.Zen["auto"].Delay 						= 0.1
	SWEP.Zen["auto"].Recoil 					= 1.1
	SWEP.Zen["auto"].Cone 						= 0.02
	SWEP.Zen["auto"].SightsAccuracyBoost		= 0.4		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["auto"].HeadshotMultiplier			= 2
	SWEP.Zen["auto"].CloseUpKillDistance		= 100		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["auto"].FallOfDistance				= 20

	SWEP.Zen["auto"].ClipSize 					= 20
	SWEP.Zen["auto"].DefaultClip				= 20
	SWEP.Zen["auto"].ClipMax 					= 60

	SWEP.Zen["auto"].Ammo 						= "Pistol"
	SWEP.Zen["auto"].AmmoEnt					= "item_ammo_pistol_ttt"
--

SWEP.Secondary.Delay 		= 0.1

SWEP.DeploySpeed 			= 1.4

SWEP.IronSightsPos 			= Vector(-5.95, -4, 2.799)
SWEP.IronSightsAng 			= Vector(0, 0, 0)
SWEP.ZoomFOV				= 0
SWEP.DrawIronSightsScope	= false

SWEP.AutoSpawnable 			= false
SWEP.Spawnable             	= false
SWEP.UseHands 				= true

function SWEP:Initialize()
	baseclass.Get("weapon_zen_base").Initialize(self)
	local subclass = self.SubClass

	if subclass ~= "revolver" and subclass ~= "auto" then return end
	local myClass = weapons.GetStored(self:GetClass())

	if myClass.isPistolInitialized then return end
	myClass.isPistolInitialized	= true

	myClass.Primary.Automatic	= self.Zen[subclass].Automatic

	myClass.Primary.Damage		= self.Zen[subclass].Damage
	myClass.Primary.Delay		= self.Zen[subclass].Delay
	myClass.Primary.Recoil		= self.Zen[subclass].Recoil
	myClass.Primary.Cone		= self.Zen[subclass].Cone
	myClass.SightsAccuracyBoost	= self.Zen[subclass].SightsAccuracyBoost

	myClass.HeadshotMultiplier	= self.Zen[subclass].HeadshotMultiplier
	myClass.CloseUpKillDistance = self.Zen[subclass].CloseUpKillDistance
	myClass.FallOfDistance 		= self.Zen[subclass].FallOfDistance

	myClass.Primary.ClipSize	= self.Zen[subclass].ClipSize
	myClass.Primary.DefaultClip	= self.Zen[subclass].DefaultClip
	myClass.Primary.ClipMax		= self.Zen[subclass].ClipMax

	myClass.Ammo				= self.Zen[subclass].Ammo
	myClass.AmmoEnt				= self.Zen[subclass].AmmoEnt

	self.Primary.Automatic		= myClass.Primary.Automatic

	self.Primary.Damage			= myClass.Primary.Damage
	self.Primary.Delay			= myClass.Primary.Delay
	self.Primary.Recoil			= myClass.Primary.Recoil
	self.Primary.Cone			= myClass.Primary.Cone
	self.SightsAccuracyBoost	= myClass.SightsAccuracyBoost

	self.HeadshotMultiplier		= myClass.HeadshotMultiplier
	self.CloseUpKillDistance	= myClass.CloseUpKillDistance
	self.FallOfDistance			= myClass.FallOfDistance

	self.Primary.ClipSize		= myClass.Primary.ClipSize
	self.Primary.DefaultClip	= myClass.Primary.DefaultClip
	self.Primary.ClipMax		= myClass.Primary.ClipMax

	self.Primary.Ammo 			= myClass.Primary.Ammo
	self.AmmoEnt 				= myClass.AmmoEnt
end
