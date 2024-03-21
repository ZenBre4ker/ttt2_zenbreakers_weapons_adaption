if SERVER then
    AddCSLuaFile()
end

local baseClass = "weapon_zen_base"
DEFINE_BASECLASS(baseClass)

SWEP.Base = baseClass
SWEP.Class = "shotgun"
SWEP.SubClass = nil

if CLIENT then
    SWEP.PrintName = "ZEN_Random_Shotgun_Base"
    SWEP.Slot = 2

    SWEP.Icon = "vgui/ttt/icon_shotgun"
    SWEP.IconLetter = "b"
end

SWEP.Kind = WEAPON_HEAVY
SWEP.WeaponID = AMMO_SHOTGUN

SWEP.HoldType = "shotgun"

SWEP.Secondary.Delay = 0.1

SWEP.DeploySpeed = 1.4

SWEP.ZoomFOV = 0
SWEP.DrawIronSightsScope = false

SWEP.AutoSpawnable = true
SWEP.Spawnable = true
SWEP.UseHands = true

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "Reloading")
    self:NetworkVar("Float", 0, "ReloadTimer")
    return BaseClass.SetupDataTables(self)
end

function SWEP:Deploy()
    self:SetReloading(false)
    self:SetReloadTimer(0)
    return BaseClass.Deploy(self)
end

function SWEP:SecondaryAttack()
    if self:GetReloading() then
        return
    end
    return BaseClass.SecondaryAttack(self)
end

function SWEP:Think()
    BaseClass.Think(self)
    if self:GetReloading() then
        if self:GetOwner():KeyPressed(IN_ATTACK) then
            self:FinishReload()
            return
        end

        if self:GetReloadTimer() <= CurTime() then
            if
                self:GetOwner():GetAmmoCount(self.Primary.Ammo) > 0
                and self:Clip1() < self.Primary.ClipSize
            then
                self:PerformReload()
            else
                self:FinishReload()
            end
            return
        end
    end
end

function SWEP:Reload()
    if self:GetReloading() then
        return
    end
    if
        self:Clip1() == self.Primary.ClipSize
        or self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0
    then
        return
    end
    self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)

    -- prevent normal shooting in between reloads
    self:SetNextPrimaryFire(CurTime() + self:SequenceDuration() + 0.1)
    self:SetReloadTimer(CurTime() + self:SequenceDuration())

    self:SetReloading(true)
    self:SetIronsights(false)
    self:SetZoom(false)
end

function SWEP:PerformReload()
    -- Handle full auto magazine reload
    local ammoCount = 1
    if self.SubClass == "auto" then
        ammoCount = math.min(
            self.Primary.ClipSize - self:Clip1(),
            self:GetOwner():GetAmmoCount(self.Primary.Ammo)
        )
    end

    self:GetOwner():RemoveAmmo(ammoCount, self.Primary.Ammo, false)
    self:SetClip1(self:Clip1() + ammoCount)

    self:SendWeaponAnim(ACT_VM_RELOAD)

    -- prevent normal shooting in between reloads
    self:SetNextPrimaryFire(CurTime() + self:SequenceDuration() + 0.1)
    self:SetReloadTimer(CurTime() + self:SequenceDuration())
end

function SWEP:FinishReload()
    self:SetReloading(false)

    self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)

    -- prevent normal shooting before reload finish
    self:SetNextPrimaryFire(CurTime() + self:SequenceDuration())
    self:SetReloadTimer(CurTime() + self:SequenceDuration())
end
