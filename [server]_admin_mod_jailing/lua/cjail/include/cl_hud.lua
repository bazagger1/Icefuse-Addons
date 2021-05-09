--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_jailing/lua/cjail/include/cl_hud.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local _player

local function doHUDPaint()
	
	if !( IsValid( _player ) ) then
		_player = LocalPlayer()
		return
	end
	
	if !( _player:GetNWBool( "cjail_jailed", false ) ) then return end
	
	local time = tostring(_player:GetNWString( "cjail_time", "unknown" ))
	
	local x, y = ScrW() * 0.5, 80
	
	if ( time == -1 ) then
		
		draw.SimpleText( "You are jailed permanently.", "HudHintTextLarge", x, y, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER )
		
	else
	
		draw.SimpleText( "You are jailed.", "HudHintTextLarge", x, y, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER )
		draw.SimpleText( "Time left: " .. time .. " seconds", "HudHintTextLarge", x, y + 20, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER )
	
	end
	
end
hook.Add( "HUDPaint", "cjail", doHUDPaint )