if SERVER then
    AddCSLuaFile()
end

SWEP.Base = "weapon_zen_random_base_pistol"
SWEP.Class = "pistol"
SWEP.SubClass = "revolver"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
    SWEP.PrintName = "ZEN_Random_Pistol_Revolver"

    SWEP.Icon = "vgui/ttt/m29satan.png"
end

SWEP.Primary.Automatic = false

SWEP.Primary.Damage = 37
SWEP.Primary.Delay = 0.5
SWEP.Primary.Recoil = 6.0
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.015
SWEP.SightsAccuracyBoost = 0.9 -- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier = 4
SWEP.CloseUpKillDistance = 300 -- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance = 500

SWEP.Primary.ClipSize = 8
SWEP.Primary.DefaultClip = 8
SWEP.Primary.ClipMax = 36

SWEP.Primary.Ammo = "AlyxGun"
SWEP.AmmoEnt = "item_ammo_revolver_ttt"

SWEP.RNGDamage = 0.4 -- Maximum Damage Pct Gain
SWEP.RNGDelay = 0.2 -- Maximum Delay Pct Loss
SWEP.RNGRecoil = -1 -- Maximum Recoil Pct Loss (Negative for Recoil Gain)
SWEP.RNGNumShots = 0 -- Maximum Damage Pct Gain
SWEP.RNGCone = 0.333 -- Maximum Cone Pct Loss
SWEP.RNGSightsAccuracyBoost = 0.1 -- Maximum SightsAccuracy Pct Gain

SWEP.RNGHeadshotMultiplier = -0.3 -- Maximum HeadshotMultiplier Pct Gain (Negative for Headshot Gain, when bad RNG)

SWEP.AutoSpawnable = false
SWEP.Spawnable = false
