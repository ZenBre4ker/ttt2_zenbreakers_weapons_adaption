if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_random_base_rifle"
SWEP.Class = "rifle"
SWEP.SubClass = "mp"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
    SWEP.PrintName = "ZEN_Random_Rifle_Mp"

    SWEP.Icon = "vgui/ttt/mp9.png"
end

SWEP.HoldType = "ar2"

SWEP.Primary.Automatic = true

SWEP.Primary.Damage = 14
SWEP.Primary.Delay = 0.1
SWEP.Primary.Recoil = 1.5
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.05
SWEP.SightsAccuracyBoost = 0.4 -- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier = 1.8
SWEP.CloseUpKillDistance = 10 -- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance = 90

SWEP.Primary.ClipSize = 50
SWEP.Primary.DefaultClip = 50
SWEP.Primary.ClipMax = 100

SWEP.Primary.Ammo = "smg1"
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

SWEP.RNGDamage = -0.1 -- Maximum Damage Pct Gain
SWEP.RNGDelay = 0.2 -- Maximum Delay Pct Loss
SWEP.RNGRecoil = 0.2 -- Maximum Recoil Pct Loss (Negative for Recoil Gain)
SWEP.RNGNumShots = 0 -- Maximum NumberOfShots Pct Gain
SWEP.RNGCone = -0.25 -- Maximum Cone Pct Loss
SWEP.RNGSightsAccuracyBoost = 0.25 -- Maximum SightsAccuracy Pct Gain

SWEP.RNGHeadshotMultiplier = 0 -- Maximum HeadshotMultiplier Pct Gain

SWEP.AutoSpawnable = false
SWEP.Spawnable = false
