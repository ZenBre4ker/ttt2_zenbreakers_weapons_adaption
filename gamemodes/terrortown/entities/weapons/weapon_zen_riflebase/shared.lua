if SERVER then
	AddCSLuaFile()
end

SWEP.Base					= "weapon_zen_base"
SWEP.SubClass				= "ar" -- ar or smg or mp or lmg

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName			= "M16"
	SWEP.Slot				= 2

	SWEP.ViewModelFlip		= false
	SWEP.ViewModelFOV		= 64

	SWEP.Icon				= "vgui/ttt/icon_m16"
	SWEP.IconLetter			= "w"
end

SWEP.Kind 					= WEAPON_HEAVY
SWEP.WeaponID				= AMMO_M16
SWEP.HoldType 				= "ar2"

SWEP.Primary.Sound 			= Sound("Weapon_M4A1.Single")
SWEP.Secondary.Sound		= nil

SWEP.ViewModel				= Model("models/weapons/cstrike/c_rif_m4a1.mdl")
SWEP.WorldModel				= Model("models/weapons/w_rif_m4a1.mdl")

SWEP.Primary.Automatic 		= true

-- Standard Set for Assault Rifle "ar"
	SWEP.Primary.Damage 		= 16
	SWEP.Primary.Delay 			= 0.1
	SWEP.Primary.Recoil 		= 2.0
	SWEP.Primary.NumShots 		= 1
	SWEP.Primary.Cone 			= 0.02
	SWEP.SightsAccuracyBoost	= 0.4		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.HeadshotMultiplier 	= 1.5
	SWEP.CloseUpKillDistance	= 100		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.FallOfDistance			= 200

	SWEP.Primary.ClipSize 		= 40
	SWEP.Primary.DefaultClip	= 40
	SWEP.Primary.ClipMax 		= 120

	SWEP.Primary.Ammo 			= "Pistol"
	SWEP.AmmoEnt				= "item_ammo_pistol_ttt" -- There is no AssaultRifle Ammo
--

	SWEP.Zen						= {}
	SWEP.Zen["smg"] 				= {}
	SWEP.Zen["mp"] 					= {}
	SWEP.Zen["lmg"] 				= {}

-- Replace Set for Submachine Gun "smg"
	SWEP.Zen["smg"].HoldType			= "smg"

	SWEP.Zen["smg"].Damage 				= 13
	SWEP.Zen["smg"].Delay 				= 0.065
	SWEP.Zen["smg"].Recoil 				= 0.8
	SWEP.Zen["smg"].Cone 				= 0.03
	SWEP.Zen["smg"].SightsAccuracyBoost	= 0.4		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["smg"].HeadshotMultiplier	= 1.5
	SWEP.Zen["smg"].CloseUpKillDistance	= 100		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["smg"].FallOfDistance		= 200

	SWEP.Zen["smg"].ClipSize 			= 50
	SWEP.Zen["smg"].DefaultClip			= 50
	SWEP.Zen["smg"].ClipMax 			= 100

	SWEP.Zen["smg"].Ammo 				= "smg1"
	SWEP.Zen["smg"].AmmoEnt				= "item_ammo_smg1_ttt"
--

-- Replace Set for Machine Pistol "mp"
	SWEP.Zen["mp"].HoldType				= "ar2" -- not smg?

	SWEP.Zen["mp"].Damage 				= 11
	SWEP.Zen["mp"].Delay 				= 0.08
	SWEP.Zen["mp"].Recoil 				= 0.9
	SWEP.Zen["mp"].Cone 				= 0.04
	SWEP.Zen["mp"].SightsAccuracyBoost	= 0.4		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["mp"].HeadshotMultiplier	= 1.5
	SWEP.Zen["mp"].CloseUpKillDistance	= 100		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["mp"].FallOfDistance		= 200

	SWEP.Zen["mp"].ClipSize 			= 25
	SWEP.Zen["mp"].DefaultClip			= 25
	SWEP.Zen["mp"].ClipMax 				= 75

	SWEP.Zen["mp"].Ammo 				= "smg1"
	SWEP.Zen["mp"].AmmoEnt				= "item_ammo_smg1_ttt"
--

-- Replace Set for Light Machine Gun "lmg"
	SWEP.Zen["lmg"].HoldType			= "crossbow"

	SWEP.Zen["lmg"].Damage 				= 19
	SWEP.Zen["lmg"].Delay 				= 0.05
	SWEP.Zen["lmg"].Recoil 				= 1.9
	SWEP.Zen["lmg"].Cone 				= 0.055
	SWEP.Zen["lmg"].SightsAccuracyBoost	= 0.5		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["lmg"].HeadshotMultiplier	= 1.5
	SWEP.Zen["lmg"].CloseUpKillDistance	= 100		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["lmg"].FallOfDistance		= 200

	SWEP.Zen["lmg"].ClipSize 			= 150
	SWEP.Zen["lmg"].DefaultClip			= 150
	SWEP.Zen["lmg"].ClipMax 			= 150

	SWEP.Zen["lmg"].Ammo 				= "AirboatGun"
	SWEP.Zen["lmg"].AmmoEnt				= nil	-- These guns don't get refill Ammo
--

SWEP.Secondary.Delay 		= 0.1

SWEP.DeploySpeed 			= 1.4

SWEP.IronSightsPos 			= Vector(-7.58, -9.2, 0.55)
SWEP.IronSightsAng 			= Vector(2.599, -1.3, -3.6)
SWEP.ZoomFOV				= 0
SWEP.DrawIronSightsScope	= false

SWEP.AutoSpawnable 			= false
SWEP.Spawnable             	= false
SWEP.UseHands 				= true

function SWEP:Initialize()
	baseclass.Get("weapon_zen_base").Initialize(self)
	local subclass = self.SubClass

	if subclass ~= "smg" and subclass ~= "mp" and subclass ~= "lmg" then return end

	local myClass = weapons.GetStored(self:GetClass())

	if myClass.isRifleInitialized then return end
	myClass.isRifleInitialized	= true
	myClass.HoldType			= self.Zen[subclass].HoldType

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

	self.HoldType				= myClass.HoldType
	self:SetHoldType(myClass.HoldType)

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
