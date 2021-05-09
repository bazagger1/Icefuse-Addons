--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_accessory_system/lua/weapons/sh_accessory_changer.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

AddCSLuaFile()

if (CLIENT) then
	SWEP.PrintName = "Accessory Change"
	SWEP.DrawWeaponInfoBox = false
end

SWEP.Category = "Icefuse Utilities"
SWEP.Spawnable = true

SWEP.ViewModel = "models/weapons/v_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

function SWEP:Initialize()
	self.PrintName = SH_ACC.Language.accessory_changer
	self:SetHoldType("normal")
end

function SWEP:PrimaryAttack()
	if (SERVER) then
		SH_ACC:Show(self.Owner)
	end
end

function SWEP:SecondaryAttack()
	self:PrimaryAttack()
end

if (CLIENT) then
	function SWEP:PreDrawViewModel()
		render.SetBlend(0)
	end

	function SWEP:PostDrawViewModel()
		render.SetBlend(1)
	end

	function SWEP:DrawWorldModel()
	end
end