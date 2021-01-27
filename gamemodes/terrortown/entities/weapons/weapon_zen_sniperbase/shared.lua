if SERVER then
	AddCSLuaFile()
end

SWEP.Base					= "weapon_zen_base"
SWEP.SubClass				= "bolt" -- bolt or auto

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName			= "Sniper Rifle"
	SWEP.Slot				= 2

	SWEP.ViewModelFlip		= false
	SWEP.ViewModelFOV		= 54

	SWEP.Icon				= "vgui/ttt/icon_scout"
	SWEP.IconLetter			= "n"
end

SWEP.Kind 					= WEAPON_HEAVY
SWEP.WeaponID				= AMMO_RIFLE
SWEP.HoldType 				= "ar2"

SWEP.Primary.Sound 			= Sound("Weapon_Scout.Single")
SWEP.Secondary.Sound		= Sound("Default.Zoom")

SWEP.ViewModel				= Model("models/weapons/cstrike/c_snip_scout.mdl")
SWEP.WorldModel				= Model("models/weapons/w_snip_scout.mdl")

SWEP.Primary.Automatic 		= true

-- Standard Set for Bolt-Action Sniper Rifle "bolt"
	SWEP.Primary.Damage 		= 50
	SWEP.Primary.Delay 			= 1.5
	SWEP.Primary.Recoil 		= 7
	SWEP.Primary.NumShots 		= 1
	SWEP.Primary.Cone 			= 0.01
	SWEP.SightsAccuracyBoost	= 1			-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.HeadshotMultiplier 	= 2.5
	SWEP.CloseUpKillDistance	= 500		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.FallOfDistance			= 500

	SWEP.Primary.ClipSize 		= 10
	SWEP.Primary.DefaultClip	= 10
	SWEP.Primary.ClipMax 		= 20
--

	SWEP.Zen						= {}
	SWEP.Zen["auto"] 				= {}

-- Replace Set for Automatic Sniper Rifle "auto"
	SWEP.Zen["auto"].Damage			= 17
	SWEP.Zen["auto"].Delay 			= 0.4
	SWEP.Zen["auto"].Recoil 		= 2.0
	SWEP.Zen["auto"].Cone 			= 0.015

	SWEP.Zen["auto"].HeadshotMultiplier 	= 6

	SWEP.Zen["auto"].ClipSize 		= 15
	SWEP.Zen["auto"].DefaultClip	= 15
	SWEP.Zen["auto"].ClipMax 		= 60 		-- this doesnt work for some reason. Limit for sniper rifles is 20
--

SWEP.Primary.Ammo 			= "357"
SWEP.AmmoEnt				= "item_ammo_357_ttt"

SWEP.Secondary.Delay 		= 0.1

SWEP.DeploySpeed 			= 1.4

SWEP.IronSightsPos 			= Vector(5, -15, -2)
SWEP.IronSightsAng 			= Vector(2.6, 1.37, 3.5)
SWEP.ZoomFOV				= 20
SWEP.DrawIronSightsScope	= true

SWEP.AutoSpawnable 			= false
SWEP.Spawnable             	= false
SWEP.UseHands 				= true


function SWEP:Initialize()
	baseclass.Get("weapon_zen_base").Initialize(self)
	local subclass = self.SubClass

	if subclass ~= "auto" then return end
	local myClass = weapons.GetStored(self:GetClass())

	if myClass.isSniperInitialized then return end
	myClass.isSniperInitialized = true

	myClass.Primary.Damage 		= self.Zen[subclass].Damage
	myClass.Primary.Delay		= self.Zen[subclass].Delay
	myClass.Primary.Recoil		= self.Zen[subclass].Recoil
	myClass.Primary.Cone		= self.Zen[subclass].Cone

	myClass.HeadshotMultiplier	= self.Zen[subclass].HeadshotMultiplier

	myClass.Primary.ClipSize	= self.Zen[subclass].ClipSize
	myClass.Primary.DefaultClip	= self.Zen[subclass].DefaultClip
	myClass.Primary.ClipMax		= self.Zen[subclass].ClipMax

	self.Primary.Damage 		= myClass.Primary.Damage
	self.Primary.Delay			= myClass.Primary.Delay
	self.Primary.Recoil			= myClass.Primary.Recoil
	self.Primary.Cone			= myClass.Primary.Cone

	self.HeadshotMultiplier		= myClass.HeadshotMultiplier

	self.Primary.ClipSize		= myClass.Primary.ClipSize
	self.Primary.DefaultClip	= myClass.Primary.DefaultClip
	self.Primary.ClipMax		= myClass.Primary.ClipMax
end
