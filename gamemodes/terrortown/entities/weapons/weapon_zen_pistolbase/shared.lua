if SERVER then
	AddCSLuaFile()
end

SWEP.Base					= "weapon_zen_base"
SWEP.SubClass				= "pistol" -- pistol or revolver or auto
SWEP.AvailableSubclasses = {
							["revolver"] = true,
							["auto"] = true
							}

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

SWEP.Primary.Sound 			= Sound("Weapon_FiveSeven.Single")
SWEP.Secondary.Sound		= nil

SWEP.ViewModel				= Model("models/weapons/cstrike/c_pist_fiveseven.mdl")
SWEP.WorldModel				= Model("models/weapons/w_pist_fiveseven.mdl")

-- Standard Set for Pistols "pistol"
	SWEP.HoldType 				= "pistol"

	SWEP.Primary.Automatic 		= false

	SWEP.Primary.Damage 		= 14
	SWEP.Primary.Delay 			= 0.15
	SWEP.Primary.Recoil 		= 0.8
	SWEP.Primary.NumShots 		= 1
	SWEP.Primary.Cone 			= 0.02
	SWEP.SightsAccuracyBoost	= 0.4		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.HeadshotMultiplier 	= 2
	SWEP.CloseUpKillDistance	= 100		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.FallOfDistance			= 200

	SWEP.Primary.ClipSize 		= 15
	SWEP.Primary.DefaultClip	= 15
	SWEP.Primary.ClipMax 		= 60

	SWEP.Primary.Ammo 			= "Pistol"
	SWEP.AmmoEnt				= "item_ammo_pistol_ttt" -- There is no AssaultRifle Ammo

	SWEP.RNGDamage				= 0.215		-- Maximum Damage Pct Gain
	SWEP.RNGDelay				= 0.333		-- Maximum Delay Pct Loss
	SWEP.RNGRecoil				= 0.25		-- Maximum Recoil Pct Loss
	SWEP.RNGNumShots			= 0			-- Maximum Damage Pct Gain
	SWEP.RNGCone				= 0.25		-- Maximum Cone Pct Loss
	SWEP.RNGSightsAccuracyBoost	= 0.5		-- Maximum SightsAccuracy Pct Gain

	SWEP.RNGHeadshotMultiplier	= 0.25		-- Maximum HeadshotMultiplier Pct Gain
--

	SWEP.Zen						= {}
	SWEP.Zen["revolver"] 			= {}
	SWEP.Zen["auto"] 				= {}

-- Replace Set for Revolvers/Deagles "revolver"
	SWEP.Zen["revolver"].HoldType				= "pistol"

	SWEP.Zen["revolver"].Automatic 				= false

	SWEP.Zen["revolver"].Damage 				= 37
	SWEP.Zen["revolver"].Delay 					= 0.5
	SWEP.Zen["revolver"].Recoil 				= 6.0
	SWEP.Zen["revolver"].NumShots				= 1
	SWEP.Zen["revolver"].Cone 					= 0.015
	SWEP.Zen["revolver"].SightsAccuracyBoost	= 0.9		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["revolver"].HeadshotMultiplier		= 4
	SWEP.Zen["revolver"].CloseUpKillDistance	= 300		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["revolver"].FallOfDistance			= 500

	SWEP.Zen["revolver"].ClipSize 				= 8
	SWEP.Zen["revolver"].DefaultClip			= 8
	SWEP.Zen["revolver"].ClipMax 				= 36

	SWEP.Zen["revolver"].Ammo 					= "AlyxGun"
	SWEP.Zen["revolver"].AmmoEnt				= "item_ammo_revolver_ttt"

	SWEP.Zen["revolver"].RNGDamage				= 0.4		-- Maximum Damage Pct Gain
	SWEP.Zen["revolver"].RNGDelay				= 0.2		-- Maximum Delay Pct Loss
	SWEP.Zen["revolver"].RNGRecoil				= -1		-- Maximum Recoil Pct Loss (Negative for Recoil Gain)
	SWEP.Zen["revolver"].RNGNumShots			= 0			-- Maximum Damage Pct Gain
	SWEP.Zen["revolver"].RNGCone				= 0.333		-- Maximum Cone Pct Loss
	SWEP.Zen["revolver"].RNGSightsAccuracyBoost	= 0.1		-- Maximum SightsAccuracy Pct Gain

	SWEP.Zen["revolver"].RNGHeadshotMultiplier	= -0.3	-- Maximum HeadshotMultiplier Pct Gain (Negative for Headshot Gain, when bad RNG)
--

-- Replace Set for Automatic Pistols "auto"
	SWEP.Zen["auto"].HoldType					= "pistol"

	SWEP.Zen["auto"].Automatic 					= true

	SWEP.Zen["auto"].Damage 					= 11
	SWEP.Zen["auto"].Delay 						= 0.1
	SWEP.Zen["auto"].Recoil 					= 1.1
	SWEP.Zen["auto"].NumShots					= 1
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

	SWEP.Zen["auto"].RNGDamage					= 0.182		-- Maximum Damage Pct Gain
	SWEP.Zen["auto"].RNGDelay					= 0.2		-- Maximum Delay Pct Loss
	SWEP.Zen["auto"].RNGRecoil					= -0.5		-- Maximum Recoil Pct Loss (Negative for Recoil Gain)
	SWEP.Zen["auto"].RNGNumShots				= 0			-- Maximum Damage Pct Gain
	SWEP.Zen["auto"].RNGCone					= 0.25		-- Maximum Cone Pct Loss
	SWEP.Zen["auto"].RNGSightsAccuracyBoost		= 0.25		-- Maximum SightsAccuracy Pct Gain

	SWEP.Zen["auto"].RNGHeadshotMultiplier		= 0.25	-- Maximum HeadshotMultiplier Pct Gain (Negative for Headshot Gain, when bad RNG)
--
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
