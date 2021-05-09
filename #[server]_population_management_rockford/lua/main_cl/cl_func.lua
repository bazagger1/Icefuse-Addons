--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/#[server]_population_management_rockford/lua/main_cl/cl_func.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]


redir_debug = false;

oldpos = nil
olddir = nil
afkcount = 0
afk_threshold = 1800
default_pop_threshold = 70;
count=0
-- test
function client_testfunc()
    if IsValid( LocalPlayer()) then
        local time_afk=nil
        if olddir == nil and oldpos == nil then
            oldpos = LocalPlayer():GetPos();
            olddir = tostring(LocalPlayer():GetAngles())
        elseif tostring(LocalPlayer():GetAngles()) == olddir and LocalPlayer():GetPos() == oldpos then
            count=count+1
            if count==1 then afkcount=os.time() end -- Set the appropiate timestamp
            time_afk = os.time()-afkcount
            if redir_debug == true then
              chat.AddText("AFK Count: ", tostring( time_afk ))
            end
            oldpos = nil
            olddir = nil
        else
            oldpos = nil
            olddir = nil
            afkcount = 0
            count=0
        end
    end
end

function threshold_update()
  net.Receive( "afk_threshold_value", function()
    afk_threshold = net.ReadInt( 18 )
    default_pop_threshold = net.ReadInt( 10 )
    if redir_debug == true then
      --debug
      chat.AddText( Color( 255, 0, 0 ), "Updated the afk_threshold_value to be: ".. afk_threshold .. " and afk_pop_threshold to be: ".. default_pop_threshold   )
    end
  end )
end

function threshold_action()
    if isnumber( afkcount ) and afkcount != 0 then
      if os.time()-afkcount >= afk_threshold and #player.GetAll() >= default_pop_threshold then
       redirect_derma()
      end
    end
end


hook.Add( "Initialize", "cl_run_once_per_initialize", function()
    timer.Create( "checkpos", 2, 0, client_testfunc )
    timer.Create( "threshold_action", 3, 0, threshold_action )
    threshold_update();
end)

--test-derma

local blur = Material 'pp/blurscreen'
local function blurpanel(panel, amount)
    local x, y = panel:LocalToScreen(0, 0)
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)
    for i = 1, 3 do
        blur:SetFloat('$blur', (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, ScrW(), ScrH())
    end
end


surface.CreateFont('realGroupFont14', {font = 'roboto', size = 14, weight = 400})
surface.CreateFont('realGroupFont18', {font = 'roboto', size = 18, weight = 400})
surface.CreateFont('mainboldrboto', {font = 'roboto', size = 18, weight = 700})
surface.CreateFont('realGroupFont24', {font = 'roboto', size = 24, weight = 400})


local color_bg = Color(0,0,0,120)

function redirect_derma()
    oldpos = nil;
    olddir = nil;
    afkcount=os.time()
    local window = vgui.Create( "DPanel" )
    window:SetSize( 450, 180 )
    window:Center()
    window:SetVisible( true )
    window:MakePopup()

    function window.Paint(s, w, h)
        blurpanel(s)
        surface.SetDrawColor(color_bg)
        surface.DrawRect(0, 0, w, h)
    end


     local text = vgui.Create("ExTextRedir", window)
     text:Dock(FILL)
     text:DockMargin(16, 16, 16, 16)
     text:InvalidateParent(true)
     text:Open()
     local i = 10;
      text:AppendLine({
            Type = "Font",
            Data = "mainboldrboto",
       },
       {
            Type = "Color",
            Data = Color(220, 220, 220),
       },
       {
            Type = "Text",
            Data = [[You are about to be reconnected as you are currently AFK.

  Reconnecting in ]]..i..[[ seconds!]],
       })
     timer.Create( "redirect_timer", 1, 10, function()
      i=i-1;
      text:Clear()
      text:AppendLine({
            Type = "Font",
            Data = "mainboldrboto",
       },
       {
            Type = "Color",
            Data = Color(220, 220, 220),
       },
       {
            Type = "Text",
            Data = [[You are about to be reconnected as you are currently AFK.

  Reconnecting in ]]..i..[[ seconds!]],
       })
       if i == 0 then
         timer.Simple( 1, function()
           timer.Destroy( "redirect_timer" )
           window:Remove()
           RunConsoleCommand("func_redirect_latest")
          end )
       end
      end )


    local title = vgui.Create("DPanel", window)
    title:Dock(TOP)
    title:DockMargin(0, 0, 0, 0)
    title.text = "You are about to be redirected!"
    surface.SetFont("Roboto Bold")
    title.textw, title.texth = surface.GetTextSize(title.text)
    title:SetTall(20 + title.texth)

    function title.Paint(s, w, h)
        surface.SetDrawColor(0, 0, 0, 120)
        surface.DrawRect(0, 0, w, h)
        surface.SetFont("realGroupFont18")
        surface.SetTextColor(Color(255, 255, 255))
        surface.SetTextPos(16, (h / 2 - s.texth / 2) - 2)
        surface.DrawText(s.text)
    end

     local footer = vgui.Create("DPanel", window)
     footer:Dock(BOTTOM)
     footer:InvalidateParent(true)
     footer:SetTall(36)
     footer:DockMargin(8, 8, 8, 8)
     footer.Paint=function(s, w, h) --surface.SetDrawColor(230, 230, 230) surface.DrawRect(0, 0, w, h)
     end



     local button = vgui.Create("DButton", footer)
      button:Dock(LEFT)
      button:DockMargin(0, 0, 8, 0)
      button:InvalidateParent(true)
      button:SetText("I am not AFK, please do not reconnect me to the server!")
      button:SetFont("mainboldrboto")
      button:SetTextColor( Color( 255, 100, 100 ) )
      button.DoClick = function()
        timer.Destroy( "redirect_timer" )
        window:Remove()
      end

      function button.Paint(s, w, h)

          draw.RoundedBox(4, 0, 0, w, h, Color(0, 0, 0, 180))

           surface.SetFont(s:GetFont())
           local textw, texth = surface.GetTextSize(s:GetText())
           local _w = textw+32

           if _w ~= s:GetWide() then
                s:SetWide(_w > (64+16) and _w or (64+16))
           end
      end



end
