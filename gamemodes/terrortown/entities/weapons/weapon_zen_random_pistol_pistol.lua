if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_random_base_pistol"
SWEP.Class = "pistol"
SWEP.SubClass = "pistol"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
    SWEP.PrintName = "ZEN_Random_Pistol_Pistol"

    SWEP.Icon = "vgui/ttt/colt1911.png"
end

SWEP.Primary.Automatic = false

SWEP.Primary.Damage = 14
SWEP.Primary.Delay = 0.15
SWEP.Primary.Recoil = 0.8
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.02
SWEP.SightsAccuracyBoost = 0.4 -- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier = 2
SWEP.CloseUpKillDistance = 100 -- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance = 200

SWEP.Primary.ClipSize = 15
SWEP.Primary.DefaultClip = 15
SWEP.Primary.ClipMax = 60

SWEP.Primary.Ammo = "Pistol"
SWEP.AmmoEnt = "item_ammo_pistol_ttt" -- There is no AssaultRifle Ammo

SWEP.RNGDamage = 0.215 -- Maximum Damage Pct Gain
SWEP.RNGDelay = 0.333 -- Maximum Delay Pct Loss
SWEP.RNGRecoil = 0.25 -- Maximum Recoil Pct Loss
SWEP.RNGNumShots = 0 -- Maximum Damage Pct Gain
SWEP.RNGCone = 0.25 -- Maximum Cone Pct Loss
SWEP.RNGSightsAccuracyBoost = 0.5 -- Maximum SightsAccuracy Pct Gain

SWEP.RNGHeadshotMultiplier = 0.25 -- Maximum HeadshotMultiplier Pct Gain

SWEP.AutoSpawnable = false
SWEP.Spawnable = false
