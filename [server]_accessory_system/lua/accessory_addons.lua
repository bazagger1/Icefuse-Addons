--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_accessory_system/lua/accessory_addons.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

SH_ACC.Addons = {

	 ["572310302"] = true,

	 ["pets_0"] = true,
	 ["head_items"] = true,
	 ["tf2_head_items_1"] = true,
	 ["neck_items"] = true,
	 ["tf2_neck_items"] = true,
	 ["eye_items"] = true,
	 ["tf2_eye_items"] = true,
	 ["mouth_items"] = true,
	 ["chest_items"] = true,
	 ["tf2_chest_items"] = true,
	 ["back_items"] = true,
	 ["tf2_back_items"] = true,
	 ["pelvis_items"] = true,
	 ["tf2_pelvis_items"] = true,
}























local atleast = false

for id, enable in pairs (SH_ACC.Addons) do
	if (!enable) then
		continue end

	atleast = true

	if (SERVER) then
		-- resource.AddWorkshop(id)
	end
end

if (!atleast) then
	MsgC(Color(52, 152, 219), "SH Accessories", Color(219, 52, 52), ": No accessory add-ons were enabled at all! Check the accessory_addons.lua file to enable an add-on to use!\n")
	MsgC(Color(219, 52, 52), "While no add-on is enabled, the Accessory Vendor will show up empty.\n")

	if (CLIENT) then
		chat.AddText(Color(52, 152, 219), "SH Accessories", Color(219, 52, 52), ": No accessory add-ons were enabled at all! Check the accessory_addons.lua file to enable an add-on to use!")
		chat.AddText(Color(219, 52, 52), "While no add-on is enabled, the Accessory Vendor will show up empty.")
	end
end