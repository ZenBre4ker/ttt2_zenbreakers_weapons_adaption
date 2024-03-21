if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_random_base_rifle"
SWEP.Class = "rifle"
SWEP.SubClass = "ar"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
    SWEP.PrintName = "ZEN_Random_Rifle_Ar"

    SWEP.Icon = "vgui/ttt/ak47.png"
end

SWEP.HoldType = "ar2"

SWEP.Primary.Automatic = true

SWEP.Primary.Damage = 19
SWEP.Primary.Delay = 0.12
SWEP.Primary.Recoil = 2.0
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.025
SWEP.SightsAccuracyBoost = 0.4 -- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier = 2.0
SWEP.CloseUpKillDistance = 10 -- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance = 90

SWEP.Primary.ClipSize = 40
SWEP.Primary.DefaultClip = 40
SWEP.Primary.ClipMax = 120

SWEP.Primary.Ammo = "Pistol"
SWEP.AmmoEnt = "item_ammo_pistol_ttt" -- There is no AssaultRifle Ammo

SWEP.RNGDamage = 0.25 -- Maximum Damage Pct Gain
SWEP.RNGDelay = -0.17 -- Maximum Delay Pct Loss (Negative Delay is a slowdown for good weapons)
SWEP.RNGRecoil = -0.17 -- Maximum Recoil Pct Loss (Negative for Recoil Gain)
SWEP.RNGNumShots = 0 -- Maximum NumberOfShots Pct Gain
SWEP.RNGCone = -0.4 -- Maximum Cone Pct Loss
SWEP.RNGSightsAccuracyBoost = 0.25 -- Maximum SightsAccuracy Pct Gain

SWEP.RNGHeadshotMultiplier = 0 -- Maximum HeadshotMultiplier Pct Gain

SWEP.AutoSpawnable = false
SWEP.Spawnable = false
