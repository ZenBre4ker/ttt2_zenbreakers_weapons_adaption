---
-- @class SWEP
-- @desc Custom weapon base, used to derive from CS one, still very similar.
-- See <a href="https://wiki.garrysmod.com/page/Category:Weapon">Weapon</a>
-- @section weapon_tttbase

if SERVER then
	AddCSLuaFile()
end

-- SWEP Base is TTT, we only implement some new features here, so normal TTT stuff should be still available
SWEP.Base = "weapon_tttbase"
SWEP.Subclass = "none"

-- These can be copied to every weapon, as they are weapon specific
if CLIENT then
	SWEP.PrintName			= "pistol_name"
	SWEP.Slot				= 1

	SWEP.ViewModelFlip		= false
	SWEP.ViewModelFOV		= 54

	SWEP.Icon				= "vgui/ttt/icon_pistol"
	SWEP.IconLetter			= "u"
end

SWEP.Kind 					= WEAPON_NONE
SWEP.HoldType 				= "pistol"

SWEP.Primary.Sound 			= Sound("Weapon_Pistol.Empty")
SWEP.Secondary.Sound		= nil

SWEP.ViewModel				= Model("models/weapons/cstrike/c_pist_fiveseven.mdl")
SWEP.WorldModel				= Model("models/weapons/w_pist_fiveseven.mdl")

SWEP.Primary.Automatic 		= false

SWEP.Primary.Damage 		= 20
SWEP.Primary.Delay 			= 0.15
SWEP.Primary.Recoil 		= 1.5
SWEP.Primary.NumShots 		= 1
SWEP.Primary.Cone 			= 0.02
SWEP.SightsAccuracyBoost	= 0.1		-- Sights Accuracy Boost has to be between 1 and 0, defining the percentual boost while aiming down sights -> 0.1 = 10% plus accuracy

SWEP.HeadshotMultiplier 	= 2
SWEP.CloseUpKillDistance	= 100		-- Depending on the CloseUpKillDistance you can oneshot everybody with a headshot in this distance
SWEP.FallOfDistance			= 200

SWEP.Primary.ClipSize 		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.ClipMax 		= -1
SWEP.Primary.Ammo 			= "none"
SWEP.AmmoEnt				= "item_ammo_357_ttt"

SWEP.Secondary.Delay 		= 0.1

SWEP.DeploySpeed 			= 1.4

SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)
SWEP.ZoomFOV				= 40
SWEP.DrawIronSightsScope	= false

---
-- Called when the SWEP should set up its Data Tables.
-- Sets up the networked vars for ironsights.
-- @warning Weapons using their own DT vars will have to make sure they call this.
-- @see https://wiki.facepunch.com/gmod/WEAPON:SetupDataTables
-- @realm shared
function SWEP:SetupDataTables()
	return baseclass.Get("weapon_tttbase").SetupDataTables(self)
end

---
-- Called when the weapon entity is created.
-- @see https://wiki.facepunch.com/gmod/WEAPON:Initialize
-- @realm shared
function SWEP:Initialize()
	self:InitializeClassValues()

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
	local myClass = weapons.GetStored(self:GetClass())

	if myClass.isInitialized then return end
	local myBaseClass = baseclass.Get(myClass.Base)
	myClass.isInitialized = true

	myClass.Primary.Ammo = myBaseClass.Primary.Ammo
	myClass.AmmoEnt = myBaseClass.AmmoEnt

	self.Primary.Ammo = myClass.Primary.Ammo
	self.AmmoEnt = myClass.AmmoEnt
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

	if not self:CanPrimaryAttack() then return end

	if not worldsnd then
		self:EmitSound(self.Primary.Sound, self.Primary.SoundLevel)
	elseif SERVER then
		sound.Play(self.Primary.Sound, self:GetPos(), self.Primary.SoundLevel)
	end

	self:ShootBullet(self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self:GetPrimaryCone())
	self:TakePrimaryAmmo(1)
end

---
-- Called if the player presses IN_ATTACK2 (Default: Right mouse button).
-- You can override it to implement special attacks, but it is usually reserved for aiming with ironsights.
-- @see https://wiki.facepunch.com/gmod/WEAPON:SecondaryAttack
-- @realm shared
function SWEP:SecondaryAttack()
	if self.NoSights or not self.IronSightsPos then return end

	if CLIENT and self.Secondary.Sound then
		self:EmitSound(self.Secondary.Sound)
	end

	local bNotIronsights = not self:GetIronsights()

	self:SetIronsights(bNotIronsights)
	self:SetZoom(bNotIronsights)
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
end

function SWEP:Holster()
	self:SetIronsights(false)
	self:SetZoom(false)
	return baseclass.Get("weapon_tttbase").Holster(self)
end

function SWEP:PreDrop()
	self:SetZoom(false)
	self:SetIronsights(false)
	return baseclass.Get("weapon_tttbase").PreDrop(self)
end

---
-- @return number
-- @realm shared
function SWEP:GetPrimaryCone()
	local cone = self.Primary.Cone or 0.2

	-- accuracy bonus when sighting
	return self:GetIronsights() and (cone * math.Clamp(1-self.SightsAccuracyBoost, 0, 1)) or cone
end

---
-- @param Player victim
-- @param DamageInfo dmginfo
-- @return number
-- @realm shared
function SWEP:GetHeadshotMultiplier(victim, dmginfo)
	local headshotMultiplier = self.HeadshotMultiplier

	local att = dmginfo:GetAttacker()
	if not IsValid(att) or self.Primary.Damage <= 0 then return headshotMultiplier end

	local dist = victim:GetPos():Distance(att:GetPos())
	print("\nDistance to Headshot is: " .. dist)
	local health = victim:Health()
	local multiplierNeededToKill = math.Clamp(health / self.Primary.Damage * 1.25, headshotMultiplier, 100)
	local maxDist = self.CloseUpKillDistance
	local minDist = self.CloseUpKillDistance + self.FallOfDistance
	if dist <= maxDist then
		headshotMultiplier = multiplierNeededToKill
	elseif dist <= minDist then
		headshotMultiplier = headshotMultiplier + (multiplierNeededToKill - headshotMultiplier) / (minDist - maxDist) * (minDist - dist) -- Scales linearly between minDist and maxDist
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
			surface.SetDrawColor( 0, 0, 0, 255 )

			local scrW = ScrW()
			local scrH = ScrH()

			local x = scrW / 2.0
			local y = scrH / 2.0
			local scope_size = scrH

			-- crosshair
			local gap = 80
			local length = scope_size
			surface.DrawLine( x - length, y, x - gap, y )
			surface.DrawLine( x + length, y, x + gap, y )
			surface.DrawLine( x, y - length, x, y - gap )
			surface.DrawLine( x, y + length, x, y + gap )

			gap = 0
			length = 50
			surface.DrawLine( x - length, y, x - gap, y )
			surface.DrawLine( x + length, y, x + gap, y )
			surface.DrawLine( x, y - length, x, y - gap )
			surface.DrawLine( x, y + length, x, y + gap )


			-- cover edges
			local sh = scope_size / 2
			local w = (x - sh) + 2
			surface.DrawRect(0, 0, w, scope_size)
			surface.DrawRect(x + sh - 2, 0, w, scope_size)

			-- cover gaps on top and bottom of screen
			surface.DrawLine( 0, 0, scrW, 0 )
			surface.DrawLine( 0, scrH - 1, scrW, scrH - 1 )

			surface.SetDrawColor(255, 0, 0, 255)
			surface.DrawLine(x, y, x + 1, y + 1)

			-- scope
			surface.SetTexture(scope)
			surface.SetDrawColor(255, 255, 255, 255)

			surface.DrawTexturedRectRotated(x, y, scope_size, scope_size, 0)
		else
			return baseclass.Get("weapon_tttbase").DrawHUD(self)
		end
	end

	function SWEP:AdjustMouseSensitivity()
		return (self:GetIronsights() and self.DrawIronSightsScope and 0.2) or nil
	end
end
