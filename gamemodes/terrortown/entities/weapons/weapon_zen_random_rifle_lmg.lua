if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_random_base_rifle"
SWEP.Class = "rifle"
SWEP.SubClass = "lmg"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
    SWEP.PrintName = "ZEN_Random_Rifle_Lmg"

    SWEP.Icon = "vgui/ttt/icon_m249"
end

SWEP.HoldType = "crossbow"

SWEP.Primary.Automatic = true

SWEP.Primary.Damage = 15
SWEP.Primary.Delay = 0.065
SWEP.Primary.Recoil = 3
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.06
SWEP.SightsAccuracyBoost = 0.6 -- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier = 1.5
SWEP.CloseUpKillDistance = 10 -- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance = 90

SWEP.Primary.ClipSize = 150
SWEP.Primary.DefaultClip = 150
SWEP.Primary.ClipMax = 150

SWEP.Primary.Ammo = "AirboatGun"
SWEP.AmmoEnt = nil -- These guns don't get refill Ammo

SWEP.RNGDamage = 0.25 -- Maximum Damage Pct Gain
SWEP.RNGDelay = -0.1 -- Maximum Delay Pct Loss (Negative Delay is a slowdown for good weapons)
SWEP.RNGRecoil = -0.1 -- Maximum Recoil Pct Loss (Negative for Recoil Gain)
SWEP.RNGNumShots = 0 -- Maximum NumberOfShots Pct Gain
SWEP.RNGCone = -0.15 -- Maximum Cone Pct Loss
SWEP.RNGSightsAccuracyBoost = 0.25 -- Maximum SightsAccuracy Pct Gain

SWEP.RNGHeadshotMultiplier = 0 -- Maximum HeadshotMultiplier Pct Gain

SWEP.AutoSpawnable = false
SWEP.Spawnable = false
