if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_random_base_pistol"
SWEP.Class = "pistol"
SWEP.SubClass = "auto"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
    SWEP.PrintName = "ZEN_Random_Pistol_Auto"

    SWEP.Icon = "vgui/ttt/glock.png"
end

SWEP.Primary.Automatic = true

SWEP.Primary.Damage = 11
SWEP.Primary.Delay = 0.1
SWEP.Primary.Recoil = 1.1
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.02
SWEP.SightsAccuracyBoost = 0.4 -- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier = 2
SWEP.CloseUpKillDistance = 100 -- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance = 20

SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 20
SWEP.Primary.ClipMax = 60

SWEP.Primary.Ammo = "Pistol"
SWEP.AmmoEnt = "item_ammo_pistol_ttt"

SWEP.RNGDamage = 0.182 -- Maximum Damage Pct Gain
SWEP.RNGDelay = 0.2 -- Maximum Delay Pct Loss
SWEP.RNGRecoil = -0.5 -- Maximum Recoil Pct Loss (Negative for Recoil Gain)
SWEP.RNGNumShots = 0 -- Maximum Damage Pct Gain
SWEP.RNGCone = 0.25 -- Maximum Cone Pct Loss
SWEP.RNGSightsAccuracyBoost = 0.25 -- Maximum SightsAccuracy Pct Gain

SWEP.RNGHeadshotMultiplier = 0.25 -- Maximum HeadshotMultiplier Pct Gain (Negative for Headshot Gain, when bad RNG)

SWEP.AutoSpawnable = false
SWEP.Spawnable = false
