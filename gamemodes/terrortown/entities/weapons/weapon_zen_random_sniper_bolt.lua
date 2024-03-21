if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_random_base_sniper"
SWEP.Class = "sniper"
SWEP.SubClass = "bolt"

if CLIENT then
    SWEP.PrintName = "ZEN_Random_Sniper_Bolt"

    SWEP.Icon = "vgui/ttt/aw50.png"
end

SWEP.Primary.Automatic = true

SWEP.Primary.Damage = 52
SWEP.Primary.Delay = 1.5
SWEP.Primary.Recoil = 7
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.01
SWEP.SightsAccuracyBoost = 1 -- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier = 6
SWEP.CloseUpKillDistance = 1000 -- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance = 500

SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 10
SWEP.Primary.ClipMax = 20

SWEP.RNGDamage = 0.5 -- Maximum Damage Pct Gain
SWEP.RNGDelay = -0.333 -- Maximum Delay Pct Loss (Negative Delay is a slowdown for good weapons)
SWEP.RNGRecoil = -0.5 -- Maximum Recoil Pct Loss (Negative for Recoil Gain)
SWEP.RNGNumShots = 0 -- Maximum NumberOfShots Pct Gain
SWEP.RNGCone = 0.5 -- Maximum Cone Pct Loss
SWEP.RNGSightsAccuracyBoost = 0 -- Maximum SightsAccuracy Pct Gain

SWEP.RNGHeadshotMultiplier = 0 -- Maximum HeadshotMultiplier Pct Gain (Negative for Headshot Gain, when bad RNG)

SWEP.AutoSpawnable = false
SWEP.Spawnable = false
