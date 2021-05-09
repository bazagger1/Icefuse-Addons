--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_admin_mod_effects/lua/effects/hell_hole/init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local DebrisRand = {'models/props_debris/concrete_chunk02b.mdl', 'models/props_debris/concrete_chunk02a.mdl', 'models/props_debris/broken_pile001a.mdl', 'models/props_debris/concrete_chunk01a.mdl'}
local ScaredSounds = {'vo/npc/male01/help01.wav'}
local DeathSounds = {'vo/npc/male01/no01.wav', 'vo/npc/male01/no02.wav'}
local BigSprite = Material( "turtle/hell_hole/glow_sprite" )
local DevilsTrap = Material( "turtle/hell_hole/devils_trap" )
local ParticleColor = Color( 230, 0, 0 )
local function nodraw() end
local increment = 0

// Utility functions
local function SetDesiredSequence( Ent, Seqs )
	for k, v in pairs( Seqs ) do
		local Seq = Ent:LookupSequence( v )
		if Seq == -1 then continue end
		Ent:ResetSequence( Seq )
	end
end

local function GetPlayerColor( self )
	return self.PlyCol
end

local function initBanish( effect )
	
	local ply = effect.Ent
	
	// Turn player invisible
	ply:SetNoDraw( true )
	for k, v in pairs( ply:GetWeapons() ) do
		v:SetNoDraw( true )
	end
	
	ply.RenderOverride = nodraw
	
	local uniqueBanish = increment
		
	effect.uniqueBanish = uniqueBanish
	ply.uniqueBanish = uniqueBanish
	
	if effect.isLocalPlayer then
		
		local fakePlayer = effect.FakeEnt
		
		hook.Add( 'PreDrawPlayerHands', 'banish'..uniqueBanish, function() return true end)
		
		local upDuration = SysTime() + 2
		hook.Add( 'CalcView', 'banish'..uniqueBanish, function( ply, pos, ang, fov, nearZ, farZ )
			
			if not IsValid( fakePlayer ) then
				hook.Remove( 'CalcView', 'banish'..uniqueBanish )
				hook.Remove( "HUDPaint", "banish"..uniqueBanish )
				hook.Remove( 'PreDrawPlayerHands', 'banish'..uniqueBanish )
				return
			end
			
			local view = {}
			
			local ang = fakePlayer:GetAngles()
			local pos = fakePlayer:GetPos()
			if upDuration - SysTime() > 0 then
				pos = pos + ( ang:Up() * ( 20 * ( upDuration - SysTime() ) ) )
			end
			view.origin = pos
			view.angles = ang
			
			return view
		end)
	
	end
	
end

local function cleanupBanish( effect )

	local ply = effect.Ent

	effect.CineDebris:Remove()
	effect.Hand:Remove()
	effect.Rim:Remove()
	effect.FakeEnt:Remove()
	
	for k, v in pairs( effect.Debris ) do
		SafeRemoveEntity( v )
	end
	
	if IsValid( ply ) and ply.uniqueBanish == effect.uniqueBanish then
		
		// Turn player back visible
		ply:SetNoDraw( false )
		for k, v in pairs( ply:GetWeapons() ) do
			v:SetNoDraw( false )
		end
		
		ply.RenderOverride = nil
		
	end
	
end


// Silent kick
local function SilentKickBan( playerindex, playername, text, messagetype )
	if messagetype == 'joinleave' && text:find('Banished to hell') then return true end
end
hook.Add( "ChatText", "HellBan.SilentKickBan", SilentKickBan )


// RenderOverrides

local function DrawFakeEnt( self )
	
	if !IsValid( self.Hell ) then return end
	
	local Col = 1 - self.Hell.PercentOpen
	local Col2 = Lerp( self.Hell.PercentOpen, 1, 0.65 )
	
	self:FrameAdvance( CurTime() - self.LastTick )
	self.LastTick = CurTime()
	
	self:SetPlaybackRate( 1 + self.Hell.PercentOpen )
	self:SetPoseParameter( "move_x", 0.5 )
	self:SetPoseParameter( "move_y", 2 )
	self:SetPoseParameter( "move_yaw",  60 )
	self:SetPoseParameter( "body_yaw",  90 )
	self:SetPoseParameter( "spine_yaw", 80 )
	
	render.SetColorModulation( Col2, Col, Col )
		self:DrawModel()
	render.SetColorModulation( 1, 1, 1 )
end

local function RenderDebris( self )
	if self.Hell.State == 2 then
		render.SetBlend( self.Hell.PercentOpen )
	end
	
	self:DrawModel()
	
	render.SetBlend( 1 )
end

local function DrawCineDebris( self )
	if self.Hell.State == 2 then
		render.SetBlend( self.Hell.PercentOpen )
	end
	
	self:SetRenderOrigin( self:GetPos() )
	self:SetRenderAngles( self:GetAngles() )
	self:DrawModel()
	
	self:FrameAdvance( CurTime() - self.LastTick )
	self.LastTick = CurTime()
	
	render.SetBlend( 1 )
end

/* Main effect code */

function EFFECT:Init( data )
	
	local Ent = data:GetEntity()
	
	if !IsValid( Ent ) then return end
	
	self.isLocalPlayer = Ent == LocalPlayer()
	
	// Save all the information we will need for later
	self.Ent = Ent
	self.PlayDeathSounds = Ent:IsPlayer() || Ent:IsNPC()
	self.StartPos = Ent:LocalToWorld( Ent:OBBCenter() ) + vector_up*Ent:OBBMins():Distance( Ent:OBBMaxs() ) 
	
	self.StartRenderOrigin = Ent:GetPos()
	self.StartRenderAngles = Ent:GetAngles()
	self.EntRadius = Ent:BoundingRadius()
	self.EntOBBC = Ent:OBBCenter()
	
	// Find good location
	local TD = {}
	TD.start = self.StartPos
	TD.endpos = self.StartPos - vector_up*810524
	TD.filter = Ent
	TD.mask = MASK_NPCWORLDSTATIC
	local Trace = util.TraceLine(TD)
	
	local Pos = Trace.HitPos
	
	if self.StartPos.z - Pos.z > 4096 then
		self.StartPos.z = Pos.z + 4096
	end
	
	//if self.StartPos.z:Distance( Pos.z ) > 
	//self.StartPos.z = math.min( 
	
	// Set up local variables
	self.Opened = false
	self.OpenTime = 2
	self.HandDelay = 2
	self.HandTime = 6
	self.CloseTime = 0.5
	-- 10.5 sec
	
	self.State = 0
	self.StartTime = CurTime()
	self.PercentOpen = 1
	
	self.TotalTime = self.StartTime + self.OpenTime + self.HandTime + self.HandDelay + self.CloseTime
	self.HandGrabTime = self.StartTime + self.OpenTime + self.HandDelay + 0.5
	
	self.handGrabDuration = self.OpenTime + self.HandDelay + 0.5
	
	self.Grabbed = false
	
	self.NextVictimParticle = CurTime()
	self.NextOpenParticle = CurTime()
	self.NextOpenDebris = CurTime()
	self.NextHandParticle = CurTime()
	
	self.Debris = {}
	
	// Place hole
	self:SetModel( "models/turtle/hell_hole.mdl" )	
	self:SetPos( Pos )
	self:SetAngles( Angle( 0, 0, 0 ) )
	self:DrawShadow( false )
	
	// Set up rim (so you can't see stencil edge)
	self.Rim = ClientsideModel( "models/turtle/hell_hole_rim.mdl", RENDERGROUP_BOTH )
	self.Rim:SetPos( Pos )
	self.Rim:SetNoDraw( true )
	self.Rim:DrawShadow( false )
	
	// Set up cinematic debris
	self.CineDebris = ClientsideModel( "models/turtle/cinematic_debris.mdl", RENDERGROUP_BOTH )
	self.CineDebris.Hell = self
	self.CineDebris:SetPos( Pos )
	self.CineDebris:SetSequence( self.CineDebris:LookupSequence( "rip_open" ) )
	self.CineDebris:SetPlaybackRate( 1 )
	self.CineDebris:DrawShadow( false )
	self.CineDebris.LastTick = CurTime()
	self.CineDebris.RenderOverride = DrawCineDebris
	
	// Set up hand model
	self.Hand = ClientsideModel( "models/turtle/hell_hole_hand.mdl", RENDERGROUP_BOTH )
	self.Hand:SetPos( Pos )
	self.Hand:SetSequence( self.Hand:LookupSequence( "hand_grab" ) )
	self.Hand:SetPlaybackRate( 1 )
	self.Hand:SetNoDraw( true )
	self.Hand:DrawShadow( false )
	self.Hand.LastTick = CurTime()
	self.WristBone = self.Hand:LookupBone( "grab_pos" )
	
	// Set up fake entity that will be grabbed by the hand
	self.FakeEnt = ClientsideModel( Ent:GetModel(), RENDERGROUP_BOTH )
	self.FakeEnt:SetPos( Ent:GetPos() )
	self.FakeEnt:SetAngles( Ent:GetAngles() )
	self.FakeEnt:DrawShadow( false )
	self.FakeEnt.Hell = self
	self.FakeEnt.RenderOverride = DrawFakeEnt
	SetDesiredSequence( self.FakeEnt, {'run_all_01', 'run_all'} )
	self.FakeEnt:SetPlaybackRate( 1 )
	self.FakeEnt:SetCycle( 0 )
	self.FakeEnt.LastTick = CurTime()
	self.FakeEnt:SetNoDraw( self.isLocalPlayer )
	//self.FakeEnt:SetIK( false )
	
	-- Scaling
	self:SetModelScale( 0.18, 0 )
	self.Rim:SetModelScale( 0.18, 0 )
	self.CineDebris:SetModelScale( 0.18, 0 )
	self.Hand:SetModelScale( 0.18, 0 )
	
	-- Player only
	self.FakeEnt.PlyCol = self.Ent:GetPlayerColor()
	self.FakeEnt.GetPlayerColor = GetPlayerColor
	
	initBanish( self )
	
	// Extra death sounds
	local distance = 1 - math.Clamp(IsValid(LocalPlayer()) and LocalPlayer():GetPos():Distance(Pos) * 0.001, 0, 1)
	util.ScreenShake( Pos, 50 * distance, 10, self.OpenTime + 0.5, 4098 ) 
	sound.Play( "hell_hole/open_effect.wav", self:GetPos(), 150, 100, 1 * distance )
	if self.PlayDeathSounds then
		sound.Play( table.Random( ScaredSounds ), self:GetPos(), 150, 100, 1 )
	end
	
	// Apply clean-up
	self:CallOnRemove( 'HellHoleCleanup.'..increment, cleanupBanish )
	
	increment = increment + 1
	
end

local function PointInSphere( Pos, r )
	local theta = math.random()*2*math.pi
	local phi = math.Rand( -math.pi/2, math.pi/2 )
	
	return Pos + Vector( r * math.cos(theta) * math.cos(phi), r * math.sin(phi), r * math.sin(theta) * math.cos(phi) )
end

function EFFECT:VictimFloating()
	
	local Pos = LerpVector( self.PercentOpen, self.StartRenderOrigin, self.StartPos )
	local ang = LerpAngle( ( 1 / self.handGrabDuration ) * ( self.handGrabDuration - ( self.HandGrabTime - CurTime() ) ), self.StartRenderAngles, Angle( 90, 0, 0 ) )
	
	local P = math.sin( CurTime() )*0.25
	local Y = CurTime()%360
	local R = math.cos( CurTime() )*0.25
	
	-- ang:RotateAroundAxis( Vector(1,0,0), P )
	-- ang:RotateAroundAxis( Vector(0,1,0), R )
	
	local NewPos = Pos + vector_up*math.cos( CurTime() )*16
	
	self.FakeEnt:SetRenderOrigin( NewPos )
	self.FakeEnt:SetRenderAngles( ang )
	
	local OBBC = Vector()+self.EntOBBC
	OBBC:Rotate( ang )
	
	return OBBC + NewPos
end

function EFFECT:setupBottomParticles()
	
	if self.nextBottomParticles then return end
	self.nextBottomParticles = true
	
	local NumParticles = 16
	local emitter = ParticleEmitter( self:GetPos(), false )
		for i=0, NumParticles do
			local angle = math.random()*2*math.pi
			
			local particle = emitter:Add( "effects/blood_drop", self:GetPos() - Vector( 0, 0, math.random( 140, 150 ) ) )
			if (particle) then
			
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 10 )
				
				particle:SetStartAlpha( 200 )
				particle:SetEndAlpha( 200 )
						
				local size = math.random( 90, 120 )
				particle:SetStartSize( size )
				particle:SetEndSize( size )
				
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-2, 2) )
				
				local RandDarkness = math.random( 0, 20 )
				particle:SetColor( RandDarkness, RandDarkness, RandDarkness )
				
				particle:SetCollide( true )
				particle:SetLighting( false )
				
			end
		end
	emitter:Finish()
	
end

function EFFECT:VictimParticles()
	local NewCenter = self:VictimFloating()

	local SpriteSize1 = (self.EntRadius*10)*self.PercentOpen
	local SpriteSize2 = (self.EntRadius*2.5)

	cam.IgnoreZ( true )
		render.SetMaterial( BigSprite )
		render.DrawSprite( NewCenter, SpriteSize1, SpriteSize1, ParticleColor)
		
		local DevilsColor = Color( 255, 255, 255, 30*self.PercentOpen )
		render.SetMaterial( DevilsTrap )
		render.DrawSprite( NewCenter, SpriteSize2, SpriteSize2, DevilsColor )
	cam.IgnoreZ( false )
	
	if self.NextVictimParticle > CurTime() then return end
	
	local NumParticles = 32
	
	local emitter = ParticleEmitter( self.FakeEnt:GetPos(), false )
		for i=0, NumParticles do
			local Pos = self.FakeEnt:GetPos()
	
			local particle = emitter:Add( "turtle/hell_hole/glow_sprite", PointInSphere( NewCenter, self.EntRadius ) )
			if (particle) then
			
				local Vel = VectorRand()*80
				particle:SetVelocity( Vel + VectorRand()*100 )
		
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 1 )
				
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				
				particle:SetStartSize( 0 )
				particle:SetEndSize( 8*self.PercentOpen )
				
				particle:SetAirResistance( 200 )
				particle:SetGravity( Vector( math.Rand( -400, 400 ) , math.Rand( -400, 400 ) , math.Rand( -400, 400 )) )
				
				local RandDarkness = math.Rand( 0.8, 1.0 )
				particle:SetColor( 230, 0, 0 )
				
				particle:SetCollide( false )
				particle:SetLighting( false )
				
			end
		end
	emitter:Finish()
	
	self.NextVictimParticle = CurTime()+0.1
end

function EFFECT:OpenParticles()
	if self.NextOpenParticle > CurTime() then return end
	
	local NumParticles = 32
	
	local emitter = ParticleEmitter( self:GetPos(), false )
		for i=0, NumParticles do
			local angle = math.random()*2*math.pi
			local Pos = Vector( math.cos(angle)*(self.PercentOpen*420), math.sin(angle)*(self.PercentOpen*420), math.Rand(1,16) )
	
			local particle = emitter:Add( "effects/blood_drop", self:GetPos() + Pos )
			if (particle) then
			
				local Vel = Vector( math.cos(angle)*( (1 - self.PercentOpen)*450)*math.Rand(2,3), math.sin(angle)*( (1 - self.PercentOpen)*450)*math.Rand(2,3), math.Rand(200,300) )
				particle:SetVelocity( ( Vel + VectorRand()*100 ) * 0.18 )
				
				local Size = ( 0.5 + (1 - self.PercentOpen)*math.Rand( 60, 120 ) ) * 0.3
				
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 2 )
				
				particle:SetStartAlpha( 200 )
				particle:SetEndAlpha( 0 )
				
				
				particle:SetStartSize( Size )
				particle:SetEndSize( Size*math.Rand( 2, 3 ) )
				
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-2, 2) )
				
				particle:SetAirResistance( 100 )
				particle:SetGravity( Vector( math.Rand( -400, 400 ) , math.Rand( -400, 400 ) ,-300) )
				
				local RandDarkness = math.Rand( 0.8, 1.0 )
				particle:SetColor( 127.5*RandDarkness, 115*RandDarkness, 100*RandDarkness )
				
				
				particle:SetCollide( true )
				particle:SetLighting( true )
				
			end
		end
	emitter:Finish()
	
	self.NextOpenParticle = CurTime()+0.1
end

function EFFECT:OpenDebris()
	if self.NextOpenDebris > CurTime() then return end
	
	local angle = math.random()*2*math.pi
	local Pos = Vector( math.cos(angle)*(self.PercentOpen*512), math.sin(angle)*(self.PercentOpen*512), math.Rand(1,16) )
	local Vel = Vector( math.cos(angle)*( (1 - self.PercentOpen)*450)*math.Rand(3,4), math.sin(angle)*( (1 - self.PercentOpen)*450)*math.Rand(3,4), math.Rand(200,300) )
	
	local Rock = ents.CreateClientProp()
	Rock:SetModel( table.Random(DebrisRand) )
	
	Rock:PhysicsInit( SOLID_VPHYSICS )
	Rock:SetMoveType( MOVETYPE_VPHYSICS )
	Rock:SetSolid( SOLID_VPHYSICS )
	
	Rock:SetPos( self:GetPos() + Pos + vector_up*32 )
	Rock:SetAngles( Angle( math.Rand(-180,180), math.Rand(-180,180), math.Rand(-180,180) ) )

	Rock:SetModelScale( math.Rand( 0.5, 2 ), 0 )
	
	local Brightness = math.Rand(0.6, 0.9)
	
	Rock:SetColor( Color( 250*Brightness, 240*Brightness, 240*Brightness ) )
	
	Rock.Hell = self
	Rock.RenderOverride = RenderDebris
	Rock:Spawn()
	
	local Phys = Rock:GetPhysicsObject()
	if Phys:IsValid() then
		Phys:Wake()				
		Phys:SetVelocity( Vel + VectorRand()*100 )
		Phys:AddAngleVelocity( VectorRand()*100 )
	end
	
	table.insert( self.Debris, Rock )
	
	self.NextOpenDebris = CurTime()+0.1
end

function EFFECT:HandParticles()
	if self.NextHandParticle > CurTime() then return end
	
	local NumParticles = 32
	
	local emitter = ParticleEmitter( self:GetPos(), false )
		for i=0, NumParticles do
			local angle = math.random()*2*math.pi
			local RandomRadius = math.Rand(0,450)
			local Pos = Vector( math.cos(angle)*(self.PercentOpen*RandomRadius), math.sin(angle)*(self.PercentOpen*RandomRadius), math.Rand(0,128) )
	
			local particle = emitter:Add( "effects/blood_drop", self:GetPos() + Pos )
			if (particle) then
			
				particle:SetVelocity( vector_up*500 )
				
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 1.5 )
				
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				
				local Size = ( math.Rand( 8, 32 ) ) * 0.15
				particle:SetStartSize( 0 )
				particle:SetEndSize( Size )
				
				particle:SetStartLength( math.Rand(60,90) )
				particle:SetEndLength( math.Rand( 90, 150) )
				
				
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-2, 2) )
				
				particle:SetAirResistance( 0 )
				particle:SetGravity( Vector(0,0,800) )
				
				particle:SetColor( 100*math.Rand(1, 2), 0, 0 )
				
				particle:SetCollide( true )
				particle:SetLighting( false )
				
			end
		end
	emitter:Finish()
	
	self.NextHandParticle = CurTime()+0.1
end

function EFFECT:ObjectGrabbed()
	if self.PlayDeathSounds then
		sound.Play( table.Random( DeathSounds ), self:GetPos(), 150, 100, 1 )
	end
	SetDesiredSequence( self.FakeEnt, {'idle_all_01', 'idle_all'} )
	
	if self.Ent == LocalPlayer() then
		local start = SysTime()
		hook.Add( "HUDPaint", "banish"..self.uniqueBanish, function()
			surface.SetDrawColor( 0, 0, 0, ( SysTime() - start ) * 255 )
			surface.DrawRect( 0, 0, ScrW(), ScrH() )
		end)
	end
	
end

function EFFECT:OnOpen()
	self.FakeEnt:SetNoDraw( true )
	-- self:SetRenderBounds( Vector(-523, -551, -1794.919678),	Vector(546, 516, 10000794) )
end

function EFFECT:Think( )	
	local TimeDifference = ( CurTime() - self.StartTime )
	if TimeDifference <= self.OpenTime then
		self.State = 0
		self.PercentOpen = (TimeDifference/self.OpenTime)
	elseif TimeDifference <= self.OpenTime+self.HandDelay+self.HandTime then
		self.State = 1
	else
		self.State = 2
		self.PercentOpen = (self.TotalTime - CurTime())/self.CloseTime
	end
	
	if !self.Grabbed && CurTime() >= self.HandGrabTime then
		self.Grabbed = true
		self:ObjectGrabbed()
	end
	
	if ( self.TotalTime > CurTime() ) then
		return true
	end
	
	return false
end

function EFFECT:TimeHandler()
	local DrawHand = false
	local TimeDifference = ( CurTime() - self.StartTime )
	if self.State == 0 then
		self:OpenParticles()
		self:setupBottomParticles()
		self:OpenDebris()
	elseif self.State == 1 then
		self:HandParticles()
		if TimeDifference >= self.OpenTime+self.HandDelay then
			if !self.Opened then
				self.Opened = true
				self:OnOpen()
			end
			self.Hand:SetRenderOrigin( self.StartPos )
			self.Hand:SetRenderAngles( self:GetAngles() + Angle(0,-90,0) )
			self.Hand:FrameAdvance( CurTime() - self.Hand.LastTick )
			self.Hand.LastTick = CurTime()
			
			DrawHand = true
		end
	end
	return DrawHand
end

function EFFECT:DrawMask( size, segments ) // I'm pretty sure most of this is from Jinto
	local pos = self:GetPos() + self:GetAngles():Up()*2
	local up = self:GetAngles():Right()
	local right = self:GetAngles():Forward()

	render.SetColorMaterial()
	mesh.Begin( MATERIAL_POLYGON, segments )

	for i = 0, segments - 1 do
		local rot = math.pi * 2 * ( i / segments )
		local sin = math.sin( rot ) * size
		local cos = math.cos( rot ) * size

		mesh.Position( pos + ( up * sin ) + ( right * cos ) )
		mesh.AdvanceVertex()
	end

	mesh.End()
end

function EFFECT:SetupStencils( Size )
	
	render.ClearStencil()
	render.SetStencilEnable( true )
	render.SetStencilCompareFunction( STENCIL_ALWAYS )
	render.SetStencilPassOperation( STENCIL_REPLACE )
	render.SetStencilFailOperation( STENCIL_KEEP )
	render.SetStencilZFailOperation( STENCIL_KEEP )
	render.SetStencilWriteMask( 1 )
	render.SetStencilTestMask( 1 )
	render.SetStencilReferenceValue( 1 )
	
	self:DrawMask( Size, 32 )
	
	render.SetStencilCompareFunction( STENCIL_EQUAL )
	render.ClearBuffersObeyStencil( 0, 0, 0, 0, true )
	
end

function EFFECT:SetupFog()
	local DistanceFix = EyePos():Distance( self:GetPos() )
	render.FogMode(MATERIAL_FOG_LINEAR)
	render.FogStart(80 + DistanceFix )
	render.FogEnd(1228 + DistanceFix)
	render.FogMaxDensity( 1 )
	render.FogColor( 20, 10, 10 ) 
end

function EFFECT:RenderRim()
	render.SetColorModulation( 0.5, 0.5, 0.5 )
		self.Rim:ManipulateBoneScale( 0, Vector( self.PercentOpen, self.PercentOpen, self.PercentOpen^2 ) )
		self.Rim:SetRenderOrigin( self:GetPos() + Vector( 0, 0, 2 + self.PercentOpen*2 ) )
		self.Rim:SetRenderAngles( self:GetAngles() )
		self.Rim:DrawModel()
	render.SetColorModulation( 1, 1, 1 )
end

function EFFECT:CalculateFakePerson()
	local pos, ang = self.Hand:GetBonePosition( self.WristBone )
	pos = pos + ( ang:Up() * -40 )
	self.FakeEnt:SetRenderOrigin( pos )
	self.FakeEnt:SetRenderAngles( ang )
end

function EFFECT:DrawHand()
	local normal = Vector( 0, 0, 1 )
	local distance = normal:Dot( self:GetPos() )
	local alreadyClipping = render.EnableClipping( true )
	render.PushCustomClipPlane( normal, distance )
		self.FakeEnt:DrawModel()
		self.Hand:DrawModel()
	render.PopCustomClipPlane()
	render.EnableClipping( alreadyClipping )
end

function EFFECT:Render()
	
	local DrawHand = self:TimeHandler()
	
	self:SetupStencils( self.PercentOpen*(495*0.18) )
	self:SetupFog()
	
	render.SuppressEngineLighting( true )
		self:DrawModel()
	render.SuppressEngineLighting( false )

	if self.Grabbed then
		self.FakeEnt:DrawModel()
		self:CalculateFakePerson()
	end
	
	if DrawHand then
		self.Hand:DrawModel()
	end
	
	render.SetStencilEnable( false )
	render.FogMode(MATERIAL_FOG_NONE)
	
	self:RenderRim()
	
	if DrawHand then
		self:DrawHand()
	end
	
	if CurTime() <= self.HandGrabTime then
		self:VictimParticles()
	end
	
	return true
end