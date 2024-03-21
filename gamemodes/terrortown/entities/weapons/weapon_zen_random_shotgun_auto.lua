if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_random_base_shotgun"
SWEP.Class = "shotgun"
SWEP.SubClass = "auto"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
    SWEP.PrintName = "ZEN_Random_Shotgun_Auto"

    SWEP.Icon = "vgui/ttt/jackhammer.png"
end

SWEP.Primary.Automatic = false

SWEP.Primary.Damage = 6.5
SWEP.Primary.Delay = 0.25
SWEP.Primary.Recoil = 8.0
SWEP.Primary.NumShots = 8
SWEP.Primary.Cone = 0.07
SWEP.SightsAccuracyBoost = 0.4 -- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier = 1.2
SWEP.CloseUpKillDistance = 50 -- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance = 100

SWEP.Primary.ClipSize = 12
SWEP.Primary.DefaultClip = 12
SWEP.Primary.ClipMax = 36

SWEP.Primary.Ammo = "Buckshot"
SWEP.AmmoEnt = "item_box_buckshot_ttt"

SWEP.RNGDamage = -0.2 -- Maximum Damage Pct Gain (Negative for Damage Loss)
SWEP.RNGDelay = 0.1 -- Maximum Delay Pct Loss
SWEP.RNGRecoil = 0.1 -- Maximum Recoil Pct Loss
SWEP.RNGNumShots = 0.17 -- Maximum NumberOfShots Pct Gain
SWEP.RNGCone = -0.1 -- Maximum Cone Pct Loss
SWEP.RNGSightsAccuracyBoost = 0.5 -- Maximum SightsAccuracy Pct Gain

SWEP.RNGHeadshotMultiplier = 0 -- Maximum HeadshotMultiplier Pct Gain

SWEP.AutoSpawnable = false
SWEP.Spawnable = false
