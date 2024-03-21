if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_random_base_shotgun"
SWEP.Class = "shotgun"
SWEP.SubClass = "pump"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
    SWEP.PrintName = "ZEN_Random_Shotgun_Pump"

    SWEP.Icon = "vgui/ttt/spas12.png"
end

SWEP.Primary.Automatic = false

SWEP.Primary.Damage = 9
SWEP.Primary.Delay = 0.4
SWEP.Primary.Recoil = 12.0
SWEP.Primary.NumShots = 9
SWEP.Primary.Cone = 0.06
SWEP.SightsAccuracyBoost = 0.4 -- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier = 1.2
SWEP.CloseUpKillDistance = 50 -- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance = 100

SWEP.Primary.ClipSize = 8
SWEP.Primary.DefaultClip = 8
SWEP.Primary.ClipMax = 24

SWEP.Primary.Ammo = "Buckshot"
SWEP.AmmoEnt = "item_box_buckshot_ttt"

SWEP.RNGDamage = -0.2 -- Maximum Damage Pct Gain
SWEP.RNGDelay = 0.08 -- Maximum Delay Pct Loss (Negative Delay is a slowdown for good weapons)
SWEP.RNGRecoil = 0.08 -- Maximum Recoil Pct Loss (Negative for Recoil Gain)
SWEP.RNGNumShots = 0.17 -- Maximum NumberOfShots Pct Gain
SWEP.RNGCone = -0.1 -- Maximum Cone Pct Loss
SWEP.RNGSightsAccuracyBoost = 0 -- Maximum SightsAccuracy Pct Gain

SWEP.RNGHeadshotMultiplier = 0 -- Maximum HeadshotMultiplier Pct Gain (Negative for Headshot Gain, when bad RNG)

SWEP.AutoSpawnable = false
SWEP.Spawnable = false
