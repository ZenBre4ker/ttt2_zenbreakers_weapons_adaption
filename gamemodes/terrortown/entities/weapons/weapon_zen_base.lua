if SERVER then
    AddCSLuaFile()
end

local baseClass = "weapon_tttbase"
DEFINE_BASECLASS(baseClass)

-- Subclass Convars
local useConvars = GetConVar("ttt_ZenBase_UseConVarValues")
local randomizeStats = GetConVar("ttt_ZenBase_RandomizeStats")

-- SWEP Base is TTT, we only implement some new features here, so normal TTT stuff should be still available
SWEP.Base = baseClass
SWEP.Class = nil
SWEP.SubClass = nil

if CLIENT then
    SWEP.PrintName = "ZEN_Random_Base"
end

SWEP.EquipMenuData = {
    type = "item_weapon",
    desc = [[
			Kill your enemies with this weapon!\n
			Left-Click: Shoot\n
			Right-Click: Aim
			]],
}

SWEP.AutoSpawnable = false
SWEP.Spawnable = false

---
-- Called when the SWEP should set up its Data Tables.
-- Sets up the networked vars for ironsights.
-- @warning Weapons using their own DT vars will have to make sure they call this.
-- @see https://wiki.facepunch.com/gmod/WEAPON:SetupDataTables
-- @realm shared
function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)
    self:NetworkVar("Float", 4, "RandomValue")
    self:NetworkVar("String", 0, "ClassName")
    self:NetworkVar("String", 1, "SubClassName")
    self:NetworkVar("String", 2, "SkinName")

    self:InitializeClassValues()
    self:InitializeRandomSkin()
    self:InitializeRandomLootValues()
end

---
-- Called when the weapon entity is created.
-- @see https://wiki.facepunch.com/gmod/WEAPON:Initialize
-- @realm shared
function SWEP:Initialize()
    --if useConvars:GetBool() then
    --    self:InitializeConVarValues()
    --end

    if CLIENT and self:Clip1() == -1 then
        self:SetClip1(self.Primary.DefaultClip)
    elseif SERVER then
        self.fingerprints = {}

        self:SetIronsights(false)
        self:SetZoom(false)
    end
    self.IronSightsTime = self.Secondary.Delay

    self:SetDeploySpeed(self.DeploySpeed)

    self:SetHoldType(self.HoldType or "pistol")
end

-- As Ammo is only looked up in the class file itself, which in this particular case doesn't inherit anything underneath
-- we need to add manually one time after initialization
-- AutoSpawnable is also such a case
function SWEP:InitializeClassValues()
    if SERVER then
        if self.Class == nil then
            self.Class = ZENWEAPONS:GetRandomClass()
        end

        if self.SubClass == nil then
            self.SubClass = ZENWEAPONS:GetRandomSubClass(self.Class)
        end
        self:SetClassName(self.Class)
        self:SetSubClassName(self.SubClass)
    end
    if CLIENT then
        self.Class = self:GetClassName()
        self.SubClass = self:GetSubClassName()
    end

    table.Merge(self, ZENWEAPONS:GetClassStats(self.Class, self.SubClass))
end

function SWEP:InitializeConVarValues()
    if not self.ConVars then
        return
    end

    local subclass = self.SubClass

    local DPSBase = 150
    local DPSRange = 0

    if self.AvailableSubclasses[subclass] then
        DPSBase = self.ConVars[subclass][1]:GetInt()
        DPSRange = self.ConVars[subclass][2]:GetInt()
    else
        DPSBase = self.ConVars["default"][1]:GetInt()
        DPSRange = self.ConVars["default"][2]:GetInt()
    end

    self.Primary.Damage = DPSBase * self.Primary.Delay / self.Primary.NumShots
    self.RNGDamage = ((DPSBase + DPSRange) * self.Primary.Delay * (1 - self.RNGDelay))
            / (self.Primary.Damage * self.Primary.NumShots)
        - 1
end

function SWEP:InitializeRandomLootValues()
    if SERVER then
        self:SetRandomValue(gaussian_random.assignRandomValue()) -- Random Value between -1 and 1
    end

    local rVal = randomizeStats:GetBool() and self:GetRandomValue() or 0 -- Random Value between -1 and 1
    self.myColor = gaussian_random.interpolateColor(rVal)
    self.scaledVal = math.floor((rVal + 1) * 10) / 2

    self.BaseDPS = math.Round(self.Primary.NumShots * self.Primary.Damage / self.Primary.Delay, 0)
    self.BaseDamage = math.Round(self.Primary.Damage, 1)
    self.BaseRPM = math.Round(60 / self.Primary.Delay, 1)

    self.Primary.Damage = math.Round(self.Primary.Damage * (1 + rVal * self.RNGDamage), 1)
    self.Primary.Delay = self.Primary.Delay * (1 - rVal * self.RNGDelay)
    self.Primary.Recoil = self.Primary.Recoil * (1 - rVal * self.RNGRecoil)
    self.Primary.NumShots = math.Round(self.Primary.NumShots * (1 + rVal * self.RNGNumShots), 0)
    self.Primary.Cone = self.Primary.Cone * (1 - rVal * self.RNGCone)
    self.SightsAccuracyBoost = self.SightsAccuracyBoost * (1 + rVal * self.RNGSightsAccuracyBoost)

    self.HeadshotMultiplier = self.HeadshotMultiplier * (1 + rVal * self.RNGHeadshotMultiplier)
    --self.CloseUpKillDistance	= myClass.CloseUpKillDistance
    --self.FallOfDistance			= myClass.FallOfDistance

    --self.Primary.ClipSize		= myClass.Primary.ClipSize
    --self.Primary.DefaultClip	= myClass.Primary.DefaultClip
    --self.Primary.ClipMax		= myClass.Primary.ClipMax

    self.DPS = math.Round(self.Primary.NumShots * self.Primary.Damage / self.Primary.Delay, 0)
    self.DPSPlus = math.Round(self.DPS - self.BaseDPS, 0)
    self.DPSSign = self.DPSPlus >= 0 and "+" or ""

    self.DamagePlus = math.Round(self.Primary.Damage - self.BaseDamage, 1)
    self.DamageSign = self.DamagePlus >= 0 and "+" or ""

    self.RPM = math.Round(60 / self.Primary.Delay, 1)
    self.RPMPlus = math.Round(self.RPM - self.BaseRPM, 1)
    self.RPMSign = self.RPMPlus >= 0 and "+" or ""
end

function SWEP:InitializeRandomSkin()
    if SERVER then
        self:SetSkinName(ZENWEAPONS:GetRandomSkin(self.Class, self.SubClass))
    end

    ZENWEAPONS:MergeSkinStats(self, self:GetSkinName())
end

---
-- Called if the player presses IN_ATTACK (Default: Left Mouse Button)
-- Shooting functions largely copied from weapon_cs_base
-- @param boolean worldsnd
-- @see https://wiki.facepunch.com/gmod/WEAPON:PrimaryAttack
-- @realm shared
function SWEP:PrimaryAttack(worldsnd)
    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
    self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)

    if not self:CanPrimaryAttack() then
        return
    end

    if not worldsnd then
        self:EmitSound(self.Primary.Sound, self.Primary.SoundLevel)
    elseif SERVER then
        sound.Play(self.Primary.Sound, self:GetPos(), self.Primary.SoundLevel)
    end

    self:ShootBullet(
        self.Primary.Damage,
        self.Primary.Recoil,
        self.Primary.NumShots,
        self:GetPrimaryCone()
    )
    self:TakePrimaryAmmo(1)
end

---
-- Called if the player presses IN_ATTACK2 (Default: Right mouse button).
-- You can override it to implement special attacks, but it is usually reserved for aiming with ironsights.
-- @see https://wiki.facepunch.com/gmod/WEAPON:SecondaryAttack
-- @realm shared
function SWEP:SecondaryAttack()
    if self.NoSights or not self.IronSightsPos then
        return
    end

    if CLIENT and self.Secondary.Sound then
        self:EmitSound(self.Secondary.Sound)
    end

    local bNotIronsights = not self:GetIronsights()

    self:SetIronsights(bNotIronsights)
    self:SetZoom(bNotIronsights)
    self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
end

-- HL2 weapon models need this because the instruction to emit this sound is not baked into the models unlike with CS:S weapon models.
function SWEP:Reload()
    BaseClass.Reload(self)
    if
        not self.ReloadSound
        or self:Clip1() == self.Primary.ClipSize
        or self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0
    then
        return
    end
    self:EmitSound(self.ReloadSound) -- Play extra sound if defined
end

function SWEP:Holster()
    self:SetIronsights(false)
    self:SetZoom(false)
    return BaseClass.Holster(self)
end

function SWEP:PreDrop()
    self:SetZoom(false)
    self:SetIronsights(false)
    return BaseClass.PreDrop(self)
end

---
-- @return number
-- @realm shared
function SWEP:GetPrimaryCone()
    local cone = self.Primary.Cone or 0.2

    -- accuracy bonus when sighting
    return self:GetIronsights() and (cone * math.Clamp(1 - self.SightsAccuracyBoost, 0, 1)) or cone
end

---
-- @param Player victim
-- @param DamageInfo dmginfo
-- @return number
-- @realm shared
function SWEP:GetHeadshotMultiplier(victim, dmginfo)
    local headshotMultiplier = self.HeadshotMultiplier

    local att = dmginfo:GetAttacker()
    if not IsValid(att) or self.Primary.Damage <= 0 then
        return headshotMultiplier
    end

    local dist = victim:GetPos():Distance(att:GetPos())
    local health = victim:Health()
    local multiplierNeededToKill =
        math.Clamp(health / self.Primary.Damage * 1.25, headshotMultiplier, 100)
    local maxDist = self.CloseUpKillDistance
    local minDist = self.CloseUpKillDistance + self.FallOfDistance
    if dist <= maxDist then
        headshotMultiplier = multiplierNeededToKill
    elseif dist <= minDist then
        headshotMultiplier = headshotMultiplier
            + (multiplierNeededToKill - headshotMultiplier)
                / (minDist - maxDist)
                * (minDist - dist) -- Scales linearly between minDist and maxDist
    end

    return headshotMultiplier
end

function SWEP:SetZoom(state)
    if IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() then
        if state then
            self:GetOwner():SetFOV(self.ZoomFOV, self.Secondary.Delay)
        else
            self:GetOwner():SetFOV(0, self.Secondary.Delay)
        end
    end
end

if CLIENT then
    local scope = surface.GetTextureID("sprites/scope")
    function SWEP:DrawHUD()
        if self:GetIronsights() and self.DrawIronSightsScope then
            surface.SetDrawColor(0, 0, 0, 255)

            local scrW = ScrW()
            local scrH = ScrH()

            local x = scrW / 2.0
            local y = scrH / 2.0
            local scope_size = scrH

            -- crosshair
            local gap = 80
            local length = scope_size
            surface.DrawLine(x - length, y, x - gap, y)
            surface.DrawLine(x + length, y, x + gap, y)
            surface.DrawLine(x, y - length, x, y - gap)
            surface.DrawLine(x, y + length, x, y + gap)

            gap = 0
            length = 50
            surface.DrawLine(x - length, y, x - gap, y)
            surface.DrawLine(x + length, y, x + gap, y)
            surface.DrawLine(x, y - length, x, y - gap)
            surface.DrawLine(x, y + length, x, y + gap)

            -- cover edges
            local sh = scope_size / 2
            local w = (x - sh) + 2
            surface.DrawRect(0, 0, w, scope_size)
            surface.DrawRect(x + sh - 2, 0, w, scope_size)

            -- cover gaps on top and bottom of screen
            surface.DrawLine(0, 0, scrW, 0)
            surface.DrawLine(0, scrH - 1, scrW, scrH - 1)

            surface.SetDrawColor(255, 0, 0, 255)
            surface.DrawLine(x, y, x + 1, y + 1)

            -- scope
            surface.SetTexture(scope)
            surface.SetDrawColor(255, 255, 255, 255)

            surface.DrawTexturedRectRotated(x, y, scope_size, scope_size, 0)
        else
            return BaseClass.DrawHUD(self)
        end
    end

    function SWEP:AdjustMouseSensitivity()
        return (self:GetIronsights() and self.DrawIronSightsScope and 0.2) or nil
    end
end
