if SERVER then
	AddCSLuaFile()
end

SWEP.Base					= "weapon_zen_base"
SWEP.SubClass				= "pump" -- pump or auto or double

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName			= "Shotgun"
	SWEP.Slot				= 2

	SWEP.ViewModelFlip		= false
	SWEP.ViewModelFOV		= 64

	SWEP.Icon				= "vgui/ttt/icon_shotgun"
	SWEP.IconLetter			= "b"
end

SWEP.Kind 					= WEAPON_HEAVY
SWEP.WeaponID				= AMMO_SHOTGUN
SWEP.HoldType 				= "shotgun"

SWEP.Primary.Sound 			= Sound("Weapon_XM1014.Single")
SWEP.Secondary.Sound		= nil

SWEP.ViewModel				= Model("models/weapons/cstrike/c_shot_xm1014.mdl")
SWEP.WorldModel				= Model("models/weapons/w_shot_xm1014.mdl")

SWEP.Primary.Automatic 		= false

-- Standard Set for Shotgun "pump"
	SWEP.Primary.Damage 		= 4
	SWEP.Primary.Delay 			= 0.6
	SWEP.Primary.Recoil 		= 13.0
	SWEP.Primary.NumShots 		= 12
	SWEP.Primary.Cone 			= 0.08
	SWEP.SightsAccuracyBoost	= 0.4		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.HeadshotMultiplier 	= 1.5
	SWEP.CloseUpKillDistance	= 150		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.FallOfDistance			= 500

	SWEP.Primary.ClipSize 		= 8
	SWEP.Primary.DefaultClip	= 8
	SWEP.Primary.ClipMax 		= 24
--

	SWEP.Zen						= {}
	SWEP.Zen["auto"] 				= {}
	SWEP.Zen["double"] 				= {}

-- Replace Set for Automatic Shotgun "auto"
	SWEP.Zen["auto"].Damage 				= 6
	SWEP.Zen["auto"].Delay 					= 0.3
	SWEP.Zen["auto"].Recoil 				= 9.0
	SWEP.Zen["auto"].NumShots 				= 6
	SWEP.Zen["auto"].Cone 					= 0.09
	SWEP.Zen["auto"].SightsAccuracyBoost	= 0.4		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["auto"].HeadshotMultiplier		= 1.5
	SWEP.Zen["auto"].CloseUpKillDistance	= 150		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["auto"].FallOfDistance			= 500

	SWEP.Zen["auto"].ClipSize 				= 12
	SWEP.Zen["auto"].DefaultClip			= 12
	SWEP.Zen["auto"].ClipMax 				= 36
--

-- Replace Set for Double Barrel Shotgun "double"
	SWEP.Zen["double"].Damage 				= 8
	SWEP.Zen["double"].Delay 				= 0.3
	SWEP.Zen["double"].Recoil 				= 17.0
	SWEP.Zen["double"].NumShots 			= 16
	SWEP.Zen["double"].Cone 				= 0.09
	SWEP.Zen["double"].SightsAccuracyBoost	= 0.4		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["double"].HeadshotMultiplier	= 1.5
	SWEP.Zen["double"].CloseUpKillDistance	= 150		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["double"].FallOfDistance		= 500

	SWEP.Zen["double"].ClipSize 			= 2
	SWEP.Zen["double"].DefaultClip			= 4
	SWEP.Zen["double"].ClipMax 				= 16
--
SWEP.Primary.Ammo 			= "Buckshot"
SWEP.AmmoEnt				= "item_box_buckshot_ttt"

SWEP.Secondary.Delay 		= 0.1

SWEP.DeploySpeed 			= 1.4

SWEP.IronSightsPos 			= Vector(-6.881, -9.214, 2.66)
SWEP.IronSightsAng 			= Vector(-0.101, -0.7, -0.201)
SWEP.ZoomFOV				= 0
SWEP.DrawIronSightsScope	= false

SWEP.AutoSpawnable 			= false
SWEP.Spawnable             	= false
SWEP.UseHands 				= true

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "Reloading")
	self:NetworkVar("Float", 0, "ReloadTimer")
	return baseclass.Get("weapon_zen_base").SetupDataTables(self)
end

function SWEP:Initialize()
	baseclass.Get("weapon_zen_base").Initialize(self)
	local subclass = self.SubClass

	if subclass ~= "auto" and subclass ~= "double" then return end

	local myClass = weapons.GetStored(self:GetClass())

	if myClass.isShotgunInitialized then return end
	myClass.isShotgunInitialized	= true

	myClass.Primary.Damage			= self.Zen[subclass].Damage
	myClass.Primary.Delay			= self.Zen[subclass].Delay
	myClass.Primary.Recoil			= self.Zen[subclass].Recoil
	myClass.Primary.NumShots		= self.Zen[subclass].NumShots
	myClass.Primary.Cone			= self.Zen[subclass].Cone
	myClass.SightsAccuracyBoost		= self.Zen[subclass].SightsAccuracyBoost

	myClass.HeadshotMultiplier		= self.Zen[subclass].HeadshotMultiplier
	myClass.CloseUpKillDistance 	= self.Zen[subclass].CloseUpKillDistance
	myClass.FallOfDistance 			= self.Zen[subclass].FallOfDistance

	myClass.Primary.ClipSize		= self.Zen[subclass].ClipSize
	myClass.Primary.DefaultClip		= self.Zen[subclass].DefaultClip
	myClass.Primary.ClipMax			= self.Zen[subclass].ClipMax

	self.Primary.Damage				= myClass.Primary.Damage
	self.Primary.Delay				= myClass.Primary.Delay
	self.Primary.Recoil				= myClass.Primary.Recoil
	self.Primary.NumShots			= myClass.Primary.NumShots
	self.Primary.Cone				= myClass.Primary.Cone
	self.SightsAccuracyBoost		= myClass.SightsAccuracyBoost

	self.HeadshotMultiplier			= myClass.HeadshotMultiplier
	self.CloseUpKillDistance		= myClass.CloseUpKillDistance
	self.FallOfDistance				= myClass.FallOfDistance

	self.Primary.ClipSize			= myClass.Primary.ClipSize
	self.Primary.DefaultClip		= myClass.Primary.DefaultClip
	self.Primary.ClipMax			= myClass.Primary.ClipMax
end

function SWEP:Deploy()
	self:SetReloading(false)
	self:SetReloadTimer(0)
	return baseclass.Get("weapon_zen_base").Deploy(self)
end

function SWEP:SecondaryAttack()
	if self:GetReloading() then return end
	return baseclass.Get("weapon_zen_base").SecondaryAttack(self)
end

function SWEP:Think()
	baseclass.Get("weapon_zen_base").Think(self)
	if self:GetReloading() then
		if self:GetOwner():KeyPressed(IN_ATTACK) then
			self:FinishReload()
			return
		end

		if self:GetReloadTimer() <= CurTime() then
			if self:GetOwner():GetAmmoCount(self.Primary.Ammo) > 0  and self:Clip1() < self.Primary.ClipSize then
				self:PerformReload()
			else
				self:FinishReload()
			end
			return
		end
	end
end

function SWEP:Reload()
	if self:GetReloading() then return end
	if self:Clip1() == self.Primary.ClipSize or self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0 then return end
	self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)

	-- prevent normal shooting in between reloads
	self:SetNextPrimaryFire(CurTime() + self:SequenceDuration() + 0.1)
	self:SetReloadTimer(CurTime() + self:SequenceDuration())

	self:SetReloading(true)
	self:SetIronsights(false)
	self:SetZoom(false)
end

function SWEP:PerformReload()
	-- Handle full auto magazine reload
	local ammoCount = 1
	if self.SubClass == "auto" then
		ammoCount = math.min(self.Primary.ClipSize - self:Clip1(), self:GetOwner():GetAmmoCount(self.Primary.Ammo))
	end

	self:GetOwner():RemoveAmmo(ammoCount, self.Primary.Ammo, false)
	self:SetClip1(self:Clip1() + ammoCount)

	self:SendWeaponAnim(ACT_VM_RELOAD)

	-- prevent normal shooting in between reloads
	self:SetNextPrimaryFire(CurTime() + self:SequenceDuration() + 0.1)
	self:SetReloadTimer(CurTime() + self:SequenceDuration())
end

function SWEP:FinishReload()
	self:SetReloading(false)

	self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)

	-- prevent normal shooting before reload finish
	self:SetNextPrimaryFire(CurTime() + self:SequenceDuration())
	self:SetReloadTimer(CurTime() + self:SequenceDuration())
end
