--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_accessory_system/lua/autorun/autorun_accessory.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

SH_ACC = {}

-- Don't modify this.
-- The script won't explode if you do but it's better for everyone if you don't mislead players.
_SH_ACC_VERSION = "1.0.5"

if (SERVER) then
	AddCSLuaFile("autorun/autorun_accessory.lua")
	AddCSLuaFile("accessory/cl_accessory.lua")
	AddCSLuaFile("accessory/cl_interface.lua")
	AddCSLuaFile("accessory/cl_notify.lua")
	AddCSLuaFile("accessory/cl_editor.lua")
	AddCSLuaFile("accessory/cl_obj_player_extend.lua")
	AddCSLuaFile("accessory/sh_obj_player_extend.lua")
	AddCSLuaFile("accessory_addons.lua")
	AddCSLuaFile("accessory_list.lua")
	AddCSLuaFile("accessory_offsets.lua")
	AddCSLuaFile("accessory_config.lua")

	include("accessory/sv_accessory.lua")
	include("accessory/sv_database.lua")
	include("accessory/sv_obj_player_extend.lua")
else
	include("accessory/cl_accessory.lua")
	include("accessory/cl_interface.lua")
	include("accessory/cl_notify.lua")
	include("accessory/cl_editor.lua")
	include("accessory/cl_obj_player_extend.lua")

	include("accessory_offsets.lua")
end

include("accessory_addons.lua")
include("accessory_list.lua")
include("accessory_config.lua")
include("accessory/sh_obj_player_extend.lua")

if (SERVER) then
	if (SH_ACC.UseWorkshop) then
		-- resource.AddWorkshop("881305303")
	else
		-- resource.AddFile("materials/shenesis/accessory/backpack.png")
		-- resource.AddFile("materials/shenesis/accessory/close.png")
		-- resource.AddFile("materials/shenesis/accessory/hat.png")
		-- resource.AddFile("materials/shenesis/accessory/info.png")
		-- resource.AddFile("materials/shenesis/accessory/list.png")
		-- resource.AddFile("materials/shenesis/accessory/mask.png")
		-- resource.AddFile("materials/shenesis/accessory/previous.png")
		-- resource.AddFile("materials/shenesis/accessory/scarf.png")
		-- resource.AddFile("materials/shenesis/accessory/search.png")
		-- resource.AddFile("materials/shenesis/accessory/stop.png")
		-- resource.AddFile("materials/shenesis/accessory/sunglasses.png")
		-- resource.AddFile("materials/shenesis/accessory/user.png")
		-- resource.AddFile("resource/fonts/circular.ttf")
		-- resource.AddFile("resource/fonts/circular_bold.ttf")

		for i = 1, 16 do
			-- resource.AddFile("sound/shenesis/generic_cloth_movement" .. i .. ".ogg")
		end
	end
end