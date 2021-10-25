if SERVER then
	AddCSLuaFile()
end

SWEP.Base					= "weapon_zen_base"
SWEP.SubClass				= "bolt" -- bolt or auto
SWEP.AvailableSubclasses = {
							["auto"] = true
							}
SWEP.SubClassName		= {
							["default"] = "Bolt-Action Sniper Rifle",
							["auto"] = "Designated Marksman Rifle"
							}

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

SWEP.Primary.Sound 			= Sound("Weapon_Scout.Single")
SWEP.Secondary.Sound		= Sound("Default.Zoom")

SWEP.ViewModel				= Model("models/weapons/cstrike/c_snip_scout.mdl")
SWEP.WorldModel				= Model("models/weapons/w_snip_scout.mdl")

-- Standard Set for Bolt-Action Sniper Rifle "bolt"
	SWEP.HoldType 				= "ar2"

	SWEP.Primary.Automatic 		= true

	SWEP.Primary.Damage 		= 52
	SWEP.Primary.Delay 			= 1.5
	SWEP.Primary.Recoil 		= 15
	SWEP.Primary.NumShots 		= 1
	SWEP.Primary.Cone 			= 0.1
	SWEP.SightsAccuracyBoost	= 1			-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.HeadshotMultiplier 	= 6
	SWEP.CloseUpKillDistance	= 1000		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.FallOfDistance			= 500

	SWEP.Primary.ClipSize 		= 10
	SWEP.Primary.DefaultClip	= 10
	SWEP.Primary.ClipMax 		= 20

	SWEP.Primary.Ammo 			= "357"
	SWEP.AmmoEnt				= "item_ammo_357_ttt"

	SWEP.RNGDamage				= 0.5		-- Maximum Damage Pct Gain
	SWEP.RNGDelay				= -0.333	-- Maximum Delay Pct Loss (Negative Delay is a slowdown for good weapons)
	SWEP.RNGRecoil				= -0.5		-- Maximum Recoil Pct Loss (Negative for Recoil Gain)
	SWEP.RNGNumShots			= 0			-- Maximum NumberOfShots Pct Gain
	SWEP.RNGCone				= 0.5		-- Maximum Cone Pct Loss
	SWEP.RNGSightsAccuracyBoost	= 0			-- Maximum SightsAccuracy Pct Gain

	SWEP.RNGHeadshotMultiplier	= 0		-- Maximum HeadshotMultiplier Pct Gain (Negative for Headshot Gain, when bad RNG)
--

	SWEP.Zen					= {}
	SWEP.Zen["auto"] 			= {}

-- Replace Set for Automatic Sniper Rifle "auto"
	SWEP.Zen["auto"].HoldType				= "ar2"

	SWEP.Zen["auto"].Automatic				= true

	SWEP.Zen["auto"].Damage					= 33
	SWEP.Zen["auto"].Delay 					= 0.8
	SWEP.Zen["auto"].Recoil 				= 9.0
	SWEP.Zen["auto"].NumShots				= 1
	SWEP.Zen["auto"].Cone 					= 0.07
	SWEP.Zen["auto"].SightsAccuracyBoost	= 1		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

	SWEP.Zen["auto"].HeadshotMultiplier 	= 6
	SWEP.Zen["auto"].CloseUpKillDistance	= 1000		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
	SWEP.Zen["auto"].FallOfDistance			= 500

	SWEP.Zen["auto"].ClipSize 				= 15
	SWEP.Zen["auto"].DefaultClip			= 15
	SWEP.Zen["auto"].ClipMax 				= 60 		-- this doesnt work for some reason. Limit for sniper rifles is 20

	SWEP.Zen["auto"].Ammo					= "357"
	SWEP.Zen["auto"].AmmoEnt				= "item_ammo_357_ttt"

	SWEP.Zen["auto"].RNGDamage					= -0.2		-- Maximum Damage Pct Gain (Negative for Damage Loss)
	SWEP.Zen["auto"].RNGDelay					= 0.5		-- Maximum Delay Pct Loss
	SWEP.Zen["auto"].RNGRecoil					= 0.5		-- Maximum Recoil Pct Loss
	SWEP.Zen["auto"].RNGNumShots				= 0			-- Maximum NumberOfShots Pct Gain
	SWEP.Zen["auto"].RNGCone					= 0.33		-- Maximum Cone Pct Loss
	SWEP.Zen["auto"].RNGSightsAccuracyBoost		= 0			-- Maximum SightsAccuracy Pct Gain

	SWEP.Zen["auto"].RNGHeadshotMultiplier		= 0			-- Maximum HeadshotMultiplier Pct Gain
--

SWEP.Secondary.Delay 		= 0.1

SWEP.DeploySpeed 			= 1.4

SWEP.IronSightsPos 			= Vector(5, -15, -2)
SWEP.IronSightsAng 			= Vector(2.6, 1.37, 3.5)
SWEP.ZoomFOV				= 20
SWEP.DrawIronSightsScope	= true

SWEP.AutoSpawnable 			= false
SWEP.Spawnable             	= false
SWEP.UseHands 				= true
