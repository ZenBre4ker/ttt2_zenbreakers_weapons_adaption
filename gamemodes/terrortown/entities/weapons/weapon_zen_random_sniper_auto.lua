if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_random_base_sniper"
SWEP.Class = "sniper"
SWEP.SubClass = "auto"

if CLIENT then
    SWEP.PrintName = "ZEN_Random_Sniper_Auto"

    SWEP.Icon = "vgui/ttt/dragunov.png"
end

SWEP.Primary.Automatic = true

SWEP.Primary.Damage = 33
SWEP.Primary.Delay = 0.4
SWEP.Primary.Recoil = 2.0
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.015
SWEP.SightsAccuracyBoost = 1 -- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier = 6
SWEP.CloseUpKillDistance = 1000 -- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance = 500

SWEP.Primary.ClipSize = 15
SWEP.Primary.DefaultClip = 15
SWEP.Primary.ClipMax = 60 -- this doesnt work for some reason. Limit for sniper rifles is 20

SWEP.RNGDamage = -0.2 -- Maximum Damage Pct Gain (Negative for Damage Loss)
SWEP.RNGDelay = 0.5 -- Maximum Delay Pct Loss
SWEP.RNGRecoil = 0.5 -- Maximum Recoil Pct Loss
SWEP.RNGNumShots = 0 -- Maximum NumberOfShots Pct Gain
SWEP.RNGCone = 0.33 -- Maximum Cone Pct Loss
SWEP.RNGSightsAccuracyBoost = 0 -- Maximum SightsAccuracy Pct Gain

SWEP.RNGHeadshotMultiplier = 0 -- Maximum HeadshotMultiplier Pct Gain

SWEP.AutoSpawnable = false
SWEP.Spawnable = false
