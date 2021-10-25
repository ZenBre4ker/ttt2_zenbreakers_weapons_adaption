if SERVER then
	AddCSLuaFile()
end

SWEP.Base					= "weapon_zen_base"
SWEP.SubClass				= "pump" -- pump or auto or double
SWEP.AvailableSubclasses = {
							["auto"] = true,
							["double"] = true
							}
SWEP.SubClassName		= {
							["default"] = "Pumpgun",
							["auto"] = "Automatic Shotgun",
							["double"] = "Double Barrel Shotgun"
							}
SWEP.ConVars			= {
							["default"] = {GetConVar("ttt_ZenBase_Pumpgun_DPS_Base"),GetConVar("ttt_ZenBase_Pumpgun_DPS_Range")},
							["auto"] = {GetConVar("ttt_ZenBase_AutoShotgun_DPS_Base"),GetConVar("ttt_ZenBase_AutoShotgun_DPS_Range")},
							["double"] = {GetConVar("ttt_ZenBase_DoubleBarrel_DPS_Base"),GetConVar("ttt_ZenBase_DoubleBarrel_DPS_Range")},
							}

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

SWEP.Primary.Sound 			= Sound("Weapon_XM1014.Single")
SWEP.Secondary.Sound		= nil

SWEP.ViewModel				= Model("models/weapons/cstrike/c_shot_xm1014.mdl")
SWEP.WorldModel				= Model("models/weapons/w_shot_xm1014.mdl")

-- Standard Set for Shotgun "pump"
	SWEP.HoldType 				= "shotgun"

	SWEP.Primary.Automatic 		= false

	SWEP.Primary.Damage 		= 12
	SWEP.Primary.Delay 			= 0.7
	SWEP.Primary.Recoil 		= 12.0
	SWEP.Primary.NumShots 		= 9
	SWEP.Primary.Cone 			= 0.08
	SWEP.SightsAccuracyBoost	= 0.2		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.HeadshotMultiplier 	= 1.5
	SWEP.CloseUpKillDistance	= 50		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.FallOfDistance			= 100

	SWEP.Primary.ClipSize 		= 8
	SWEP.Primary.DefaultClip	= 8
	SWEP.Primary.ClipMax 		= 24

	SWEP.Primary.Ammo 			= "Buckshot"
	SWEP.AmmoEnt				= "item_box_buckshot_ttt"

	SWEP.RNGDamage				= -0.2		-- Maximum Damage Pct Gain
	SWEP.RNGDelay				= 0.08		-- Maximum Delay Pct Loss (Negative Delay is a slowdown for good weapons)
	SWEP.RNGRecoil				= 0.08		-- Maximum Recoil Pct Loss (Negative for Recoil Gain)
	SWEP.RNGNumShots			= 0.17		-- Maximum NumberOfShots Pct Gain
	SWEP.RNGCone				= -0.1		-- Maximum Cone Pct Loss
	SWEP.RNGSightsAccuracyBoost	= 0			-- Maximum SightsAccuracy Pct Gain

	SWEP.RNGHeadshotMultiplier	= 0		-- Maximum HeadshotMultiplier Pct Gain (Negative for Headshot Gain, when bad RNG)
--

	SWEP.Zen						= {}
	SWEP.Zen["auto"] 				= {}
	SWEP.Zen["double"] 				= {}

-- Replace Set for Automatic Shotgun "auto"
	SWEP.Zen["auto"].HoldType				= "shotgun"

	SWEP.Zen["auto"].Automatic				= false

	SWEP.Zen["auto"].Damage 				= 10
	SWEP.Zen["auto"].Delay 					= 0.5
	SWEP.Zen["auto"].Recoil 				= 9.0
	SWEP.Zen["auto"].NumShots 				= 11
	SWEP.Zen["auto"].Cone 					= 0.1
	SWEP.Zen["auto"].SightsAccuracyBoost	= 0.2		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["auto"].HeadshotMultiplier		= 1.5
	SWEP.Zen["auto"].CloseUpKillDistance	= 50		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["auto"].FallOfDistance			= 100

	SWEP.Zen["auto"].ClipSize 				= 12
	SWEP.Zen["auto"].DefaultClip			= 12
	SWEP.Zen["auto"].ClipMax 				= 36

	SWEP.Zen["auto"].Ammo					= "Buckshot"
	SWEP.Zen["auto"].AmmoEnt				= "item_box_buckshot_ttt"

	SWEP.Zen["auto"].RNGDamage					= -0.2		-- Maximum Damage Pct Gain (Negative for Damage Loss)
	SWEP.Zen["auto"].RNGDelay					= 0.1		-- Maximum Delay Pct Loss
	SWEP.Zen["auto"].RNGRecoil					= 0.1		-- Maximum Recoil Pct Loss
	SWEP.Zen["auto"].RNGNumShots				= 0.17		-- Maximum NumberOfShots Pct Gain
	SWEP.Zen["auto"].RNGCone					= -0.1		-- Maximum Cone Pct Loss
	SWEP.Zen["auto"].RNGSightsAccuracyBoost		= 0.5		-- Maximum SightsAccuracy Pct Gain

	SWEP.Zen["auto"].RNGHeadshotMultiplier		= 0		-- Maximum HeadshotMultiplier Pct Gain
--

-- Replace Set for Double Barrel Shotgun "double"
	SWEP.Zen["double"].HoldType				= "shotgun"

	SWEP.Zen["double"].Automatic			= false

	SWEP.Zen["double"].Damage 				= 14
	SWEP.Zen["double"].Delay 				= 0.4
	SWEP.Zen["double"].Recoil 				= 12.0
	SWEP.Zen["double"].NumShots 			= 8
	SWEP.Zen["double"].Cone 				= 0.07
	SWEP.Zen["double"].SightsAccuracyBoost	= 0.2		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["double"].HeadshotMultiplier	= 1.5
	SWEP.Zen["double"].CloseUpKillDistance	= 50		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["double"].FallOfDistance		= 100

	SWEP.Zen["double"].ClipSize 			= 2
	SWEP.Zen["double"].DefaultClip			= 4
	SWEP.Zen["double"].ClipMax 				= 16

	SWEP.Zen["double"].Ammo					= "Buckshot"
	SWEP.Zen["double"].AmmoEnt				= "item_box_buckshot_ttt"

	SWEP.Zen["double"].RNGDamage				= 0.12		-- Maximum Damage Pct Gain
	SWEP.Zen["double"].RNGDelay					= 0.1		-- Maximum Delay Pct Loss
	SWEP.Zen["double"].RNGRecoil				= 0.1		-- Maximum Recoil Pct Loss (Negative for Recoil Gain)
	SWEP.Zen["double"].RNGNumShots				= -0.17		-- Maximum NumberOfShots Pct Gain
	SWEP.Zen["double"].RNGCone					= -0.1		-- Maximum Cone Pct Loss (Negative for Accuracy Loss)
	SWEP.Zen["double"].RNGSightsAccuracyBoost	= -0.5		-- Maximum SightsAccuracy Pct Gain (Negative for Accuracy Loss)

	SWEP.Zen["double"].RNGHeadshotMultiplier	= 0			-- Maximum HeadshotMultiplier Pct Gain
--

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
