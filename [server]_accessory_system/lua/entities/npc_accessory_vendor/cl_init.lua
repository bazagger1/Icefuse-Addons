--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_accessory_system/lua/entities/npc_accessory_vendor/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include("shared.lua")

surface.CreateFont("SH_ACC_VENDOR", {font = "Circular Std Bold", size = 200})
local offset = Vector(0, 0, 80)

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:DrawTranslucent()
	self:DrawModel()

	local origin = self:GetPos()
	if (LocalPlayer():GetPos():Distance(origin) >= 350) then
		return end

	local pos = origin + offset
	local ang = (LocalPlayer():EyePos() - pos):Angle()
	ang.p = 0
	ang:RotateAroundAxis(ang:Right(), 90)
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 180)

	local text = SH_ACC.Language.accessory_vendor

	cam.Start3D2D(pos, ang, 0.04)
		surface.SetFont("SH_ACC_VENDOR")
		local wi, he = surface.GetTextSize(text)
		local pad = 16
		wi = wi + pad * 2
		he = he + pad * 2

		draw.RoundedBox(8, -wi * 0.5, -pad, wi, he, SH_ACC.Style.header)

		draw.SimpleText(text, "SH_ACC_VENDOR", 0, 0, SH_ACC.Style.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	cam.End3D2D()
end