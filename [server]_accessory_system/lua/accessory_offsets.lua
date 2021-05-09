--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_accessory_system/lua/accessory_offsets.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Whenever you add a new model as an accessory, you NEED to register at least one offset (the "default" offset) which
-- will position your model on every player model. Without the "default" offset the add-on will throw an error and that's bad.
-- This is also where you position models manually for specific models. It can be very tedious to do so I recommend you
-- contact the author (http://steamcommunity.com/id/shendow/) before touching anything.

-- every little character counts
local B_HEAD = "ValveBiped.Bip01_Head1"
local B_SPINE2 = "ValveBiped.Bip01_Spine2"

local V = Vector
local A = Angle

function SH_ACC:GetOffset(mdl, ply)
	if (!self.Offsets[mdl]) then
		return false
	end

	return self.Offsets[mdl][ply:GetModel():lower()] or self.Offsets[mdl].default or false
end

function SH_ACC:GetModelOffset(bone, ply)
	local mdl = self.ModelOffsets[ply:GetModel():lower()]
	if (!mdl or !mdl[bone]) then
		return false
	end

	return mdl[bone]
end

function SH_ACC:DefineOffsetEasy(mdl, bone, pos, ang)
	self.Offsets[mdl] = {
		default = {
			bone = bone,
			pos = pos,
			ang = ang,
		}
	}
end

local function Offset(...)
	SH_ACC:DefineOffsetEasy(...)
end

/*
	PREDEFINED OFFSETS
*/

SH_ACC.Offsets = {}

-- ADDON: [GTA V] Giant Accessories Pack
Offset("models/modified/hat07.mdl", B_HEAD, V(4.8, -0.5, 0.2), A(0, -70, -90))
Offset("models/modified/hat08.mdl", B_HEAD, V(4.2, -0, 0.2), A(0, -80, -90))
Offset("models/sal/acc/fix/beerhat.mdl", B_HEAD, V(3, 0, 0.2), A(0, -75, -90))
Offset("models/modified/glasses01.mdl", B_HEAD, V(2, -0.1, 0.05), A(180, 110, 90))
Offset("models/modified/bandana.mdl", B_HEAD, V(-1.9, 1.5, 0), A(180, 110, 90))
Offset("models/modified/backpack_1.mdl", B_SPINE2, V(1.5, -4.2, 0), A(0, 80, 90))
Offset("models/modified/backpack_2.mdl", B_SPINE2, V(2, -4, 0), A(0, 80, 90))
Offset("models/modified/backpack_3.mdl", B_SPINE2, V(1.5, -4.2, 0), A(0, 80, 90))
Offset("models/sal/cat.mdl", B_HEAD, V(2, 0.5, 0), A(180, 110, 90))
Offset("models/sal/fox.mdl", B_HEAD, V(1.1, 0.5, 0), A(180, 110, 90))
Offset("models/sal/gingerbread.mdl", B_HEAD, V(0.5, 1, 0), A(180, 110, 90))
Offset("models/sal/acc/fix/scarf01.mdl", "ValveBiped.Bip01_Neck1", V(-18, 14, 0), A(180, 120, 90))
Offset("models/modified/headphones.mdl", B_HEAD, V(2.3, 0.8, 0), A(180, 110, 90))
Offset("models/sal/acc/fix/cheafhat.mdl", B_HEAD, V(7, 0, 0.4), A(180, 90, 90))
Offset("models/sal/halloween/bag.mdl", B_HEAD, V(0.5, 0.66, 0), A(180, 110, 90))
Offset("models/sal/halloween/doctor.mdl", B_HEAD, V(0, -0.1, 0.05), A(180, 110, 90))
Offset("models/sal/halloween/headwrap1.mdl", B_HEAD, V(0.6, 1.6, 0), A(180, 110, 90))
Offset("models/modified/hat01_fix.mdl", B_HEAD, V(4.4, -0.7, 0.2), A(0, -70, -90))
Offset("models/modified/hat03.mdl", B_HEAD, V(4.4, -0.7, 0), A(0, -60, -90))
Offset("models/modified/hat04.mdl", B_HEAD, V(4.2, -2.1, 0), A(0, -60, -90))
Offset("models/modified/hat06.mdl", B_HEAD, V(5.3, -1, 0), A(0, -80, -90))
Offset("models/modified/mask5.mdl", B_HEAD, V(0.5, 1.2, 0.05), A(180, 110, 90))
Offset("models/sal/hawk_1.mdl", B_HEAD, V(-1.5, 1, 0.2), A(180, 110, 90))
Offset("models/sal/pig.mdl", B_HEAD, V(0.1, 0.5, 0), A(180, 105, 90))
Offset("models/sal/wolf.mdl", B_HEAD, V(-1, 1, 0), A(180, 105, 90))
Offset("models/sal/acc/fix/mask_1.mdl", B_HEAD, V(-62.5, 17.7, 0), A(180, 105, 90))
Offset("models/sal/acc/fix/mask_4.mdl", B_HEAD, V(0.2, 1, 0.05), A(180, 110, 90))
Offset("models/sal/halloween/monkey.mdl", B_HEAD, V(0.2, 0.8, 0), A(180, 110, 90))
Offset("models/sal/halloween/ninja.mdl", B_HEAD, V(-0.3, 0.8, 0.1), A(180, 110, 90))

-- Offset copies
SH_ACC.Offsets["models/sal/bear.mdl"] = SH_ACC.Offsets["models/sal/cat.mdl"]
SH_ACC.Offsets["models/sal/owl.mdl"] = SH_ACC.Offsets["models/sal/fox.mdl"]
SH_ACC.Offsets["models/sal/penguin.mdl"] = SH_ACC.Offsets["models/sal/fox.mdl"]
SH_ACC.Offsets["models/sal/halloween/headwrap2.mdl"] = SH_ACC.Offsets["models/sal/halloween/headwrap1.mdl"]
SH_ACC.Offsets["models/modified/mask6.mdl"] = SH_ACC.Offsets["models/modified/mask5.mdl"]
SH_ACC.Offsets["models/sal/hawk_2.mdl"] = SH_ACC.Offsets["models/sal/hawk_1.mdl"]
SH_ACC.Offsets["models/sal/acc/fix/mask_2.mdl"] = SH_ACC.Offsets["models/modified/mask5.mdl"]

-- You shouldn't have to modify this.
-- These are model-specific bone offsets for when you have a model slightly different in a set of otherwise identical models
SH_ACC.ModelOffsets = {
	["models/player/breen.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.2, 0)
		},
	},
	["models/player/alyx.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.4, 0)
		},
	},
	["models/player/p2_chell.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.3, 0)
		},
	},
	["models/player/barney.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.25, 0.2, 0)
		},
	},
	["models/player/monk.mdl"] = {
		[B_HEAD] = {
			pos = V(0.5, -0.5, 0)
		},
	},
	["models/player/gman_high.mdl"] = {
		[B_HEAD] = {
			pos = V(0.8, 0, 0)
		},
	},
	["models/player/odessa.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.1, 0.65, 0)
		},
	},
	["models/player/mossman.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.2, 0)
		},
	},
	["models/player/eli.mdl"] = {
		[B_HEAD] = {
			pos = V(0, -0.5, 0)
		},
	},
	["models/player/charple.mdl"] = {
		[B_HEAD] = {
			pos = V(0, -1.5, 0)
		},
	},
	["models/player/soldier_stripped.mdl"] = {
		[B_HEAD] = {
			pos = V(-1.2, -1.2, 0)
		},
	},

	["models/player/group01/male_01.mdl"] = {
		[B_HEAD] = {
			pos = V(0, 0.85, 0)
		},
	},
	["models/player/group01/male_03.mdl"] = {
		[B_HEAD] = {
			pos = V(0.25, 0, 0)
		},
	},
	["models/player/group01/male_06.mdl"] = {
		[B_HEAD] = {
			pos = V(0.35, 1, 0)
		},
	},
	["models/player/group01/female_01.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.33, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_02.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.5, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_03.mdl"] = {
		[B_HEAD] = {
			pos = V(-1.1, 0.0, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_04.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, 0.5, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
}

SH_ACC.ModelOffsets["models/player/group01/male_04.mdl"] = SH_ACC.ModelOffsets["models/player/group01/male_03.mdl"]
SH_ACC.ModelOffsets["models/player/group01/female_05.mdl"] = SH_ACC.ModelOffsets["models/player/group01/female_03.mdl"]
SH_ACC.ModelOffsets["models/player/group01/female_06.mdl"] = SH_ACC.ModelOffsets["models/player/group01/female_01.mdl"]
SH_ACC.ModelOffsets["models/player/mossman_arctic.mdl"] = SH_ACC.ModelOffsets["models/player/mossman.mdl"]





--------------------------------------------------------------------------------------------
-- All yo custom shit goes here dawg
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- Pets
--------------------------------------------------------------------------------------------


-- TF2 PETS

Offset("models/player/items/all_class/hwn_ghost_pj.mdl", "ValveBiped.Bip01_Pelvis", Vector(-16.7, -23.3, -10), Angle(90, -90, 0))
Offset("models/player/items/all_class/hwn_pet_balloon.mdl", "ValveBiped.Bip01_Pelvis", Vector(-16.7, -23.3, -10), Angle(90, -90, 0))
Offset("models/player/items/all_class/pet_robro.mdl", "ValveBiped.Bip01_Pelvis", Vector(-16.7, -16.7, -10), Angle(90, -90, 0))
Offset("models/player/items/all_class/hwn_pet_ghost.mdl", "ValveBiped.Bip01_Pelvis", Vector(3.33, -3.33, 10), Angle(23.3, 90, 110))
Offset("models/player/items/all_class/hwn_pet_ghost_pyro.mdl", "ValveBiped.Bip01_Pelvis", Vector(-36.7, -16.7, 23.3), Angle(0, 0, 0))
Offset("models/player/items/all_class/pet_reinballoonicorn.mdl", "ValveBiped.Bip01_Pelvis", Vector(-3.33, -16.7, 16.7), Angle(0, -63.3, -10))
Offset("models/player/items/all_class/pet_balloonicorn.mdl", "ValveBiped.Bip01_Pelvis", Vector(-3.33, -16.7, 16.7), Angle(0, -63.3, -10))


--------------------------------------------------------------------------------------------
-- Head
--------------------------------------------------------------------------------------------
Offset("models/props/de_tides/vending_hat.mdl", "ValveBiped.Bip01_Head1", Vector(4, 1, 0), Angle(90, 120, 90))
Offset("models/props/de_tides/vending_turtle.mdl", "ValveBiped.Bip01_Head1", Vector(4, 1, 0), Angle(90, 120, 90))
Offset("models/player/items/humans/top_hat.mdl", B_HEAD, V(0, 1.43, 0), A(0, 113.47, 90))
Offset("models/props/cs_office/snowman_hat.mdl", "ValveBiped.Bip01_Head1", Vector(6, 1, 0), Angle(90, 120, 90))
Offset("models/props_combine/headcrabcannister01a.mdl", "ValveBiped.Bip01_Head1", Vector(12, 0, 0), Angle(0, 0, 90))
Offset("models/props_interiors/pot02a.mdl", "ValveBiped.Bip01_Head1", Vector(5, 2, -7), Angle(23.3, -43.3, 90))
Offset("models/props_c17/lampshade001a.mdl", "ValveBiped.Bip01_Head1", Vector(4, 0, 0), Angle(0, 100, 90))
Offset("models/headcrabclassic.mdl", "ValveBiped.Bip01_Head1", Vector(1, 6, 0), Angle(180, 110, 90))
Offset("models/props_junk/trafficcone001a.mdl", "ValveBiped.Bip01_Head1", Vector(12, -3.5, 0), Angle(180, 117, 90))
Offset("models/props_junk/metalbucket01a.mdl", "ValveBiped.Bip01_Head1", Vector(6, -1, 0), Angle(120, 115, 280))
Offset("models/dav0r/hoverball.mdl", "ValveBiped.Bip01_Head1", Vector(5, -4.5, 0), Angle(90, 110, 330))
Offset("models/roller.mdl", "ValveBiped.Bip01_Head1", Vector(5, 0, 0), Angle(0, 63.3, 30))
Offset("models/roller_spikes.mdl", "ValveBiped.Bip01_Head1", Vector(6, 0, 0), Angle(0, 36.7, 90))
Offset("models/editor/air_node.mdl", "ValveBiped.Bip01_Head1", Vector(3, 0, 0), Angle(0, 0, 0))
Offset("models/editor/air_node_hint.mdl", "ValveBiped.Bip01_Head1", Vector(4, 0, 0), Angle(0, 0, 90))
Offset("models/editor/node_hint.mdl", "ValveBiped.Bip01_Head1", Vector(5, 0, 0), Angle(0, 0, 90))
Offset("models/editor/scriptedsequence.mdl", "ValveBiped.Bip01_Head1", Vector(-3, 0, 0), Angle(0, 90, 90))
Offset("models/effects/portalfunnel.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, 90, 90))
Offset("models/zombie/classic_torso.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, 0, 270))
Offset("models/props/de_inferno/tree_small.mdl", "ValveBiped.Bip01_Head1", Vector(5, 0, 0), Angle(137, 90, 90))
Offset("models/props_junk/glassjug01.mdl", "ValveBiped.Bip01_Head1", Vector(-3, 0, 0), Angle(83.3, 90, 90))
Offset("models/props/cs_havana/gazebo.mdl", "ValveBiped.Bip01_Head1", Vector(6, 0, 0), Angle(183, 103, 90))
Offset("models/maxofs2d/hover_rings.mdl", "ValveBiped.Bip01_Head1", Vector(3.33, 0, 0), Angle(0, 0, 0))
Offset("models/props_lab/huladoll.mdl", "ValveBiped.Bip01_Head1", Vector(7, -1, 0), Angle(0, -78.1, -90))
Offset("models/props/cs_office/snowman_face.mdl", "ValveBiped.Bip01_Head1", Vector(3.5, 2.5, 0), Angle(90, 0, -180))
Offset("models/props_c17/tv_monitor01.mdl", "ValveBiped.Bip01_Head1", Vector(4, 0, -1), Angle(177, 83.3, 90))
Offset("models/marioragdoll/super mario galaxy/star/star.mdl", "ValveBiped.Bip01_Head1", Vector(-7, 3.33, 0), Angle(0, -76.7, 270))
Offset("models/props_wasteland/light_spotlight01_lamp.mdl", "ValveBiped.Bip01_Head1", Vector(0, 3.33, 0), Angle(0, -76.7, 270))
Offset("models/props_phx/misc/soccerball.mdl", "ValveBiped.Bip01_Head1", Vector(4, 3.33, 0), Angle(0, -76.7, 270))
Offset("models/props/cs_office/Snowman_face.mdl", "ValveBiped.Bip01_Head1", Vector(3.33, 3.33, -1), Angle(83.3, 50, -217))
Offset("models/smile/smile.mdl", "ValveBiped.Bip01_Head1", Vector(4, 4.5, 0), Angle(90, -35, -217))
Offset("models/gibs/hgibs.mdl", "ValveBiped.Bip01_Head1", Vector(2, 1, 0), Angle(170, 110, 90))
Offset("models/items/cs_gift.mdl", "ValveBiped.Bip01_Head1", Vector(-4, 1, 0), Angle(170, 110, 90))
Offset("models/props_junk/terracotta01.mdl", "ValveBiped.Bip01_Head1", Vector(11, 1, 0), Angle(170, -96.7, 90))
Offset("models/props_c17/streetsign004f.mdl", "ValveBiped.Bip01_Head1", Vector(5, 5, 0), Angle(270, -70, 90))
Offset("models/props_lab/monitor02.mdl", "ValveBiped.Bip01_Head1", Vector(-7, 0, 0), Angle(180, 100, 90))
Offset("models/props_junk/watermelon01.mdl", "ValveBiped.Bip01_Head1", Vector(4, 0, 0), Angle(180, 100, 90))
Offset("models/props_phx/misc/t_light_head.mdl", "ValveBiped.Bip01_Head1", Vector(-5, 0, 0), Angle(180, 100, 90))
Offset("models/dynamite/dynamite.mdl", "ValveBiped.Bip01_Head1", Vector(-4, 2, 0), Angle(180, 100, 90))
Offset("models/nova/w_headgear.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(90, 0, -90))
Offset("models/props_phx/misc/egg.mdl", "ValveBiped.Bip01_Head1", Vector(-5, 2, 0), Angle(0, 90, 90))
Offset("models/props_c17/clock01.mdl", "ValveBiped.Bip01_Head1", Vector(4, 1, 0), Angle(180, 10, 90))
Offset("models/maxofs2d/balloon_gman.mdl", "ValveBiped.Bip01_Head1", Vector(-11, 1, 0), Angle(180, 90, 90))
Offset("models/maxofs2d/balloon_mossman.mdl", "ValveBiped.Bip01_Head1", Vector(-9, 1, 0), Angle(180, 90, 90))







-- TF2 HATS
Offset("models/player/items/all_class/all_bug_hat_demo.mdl", "ValveBiped.Bip01_Head1", Vector(1, 0, 0), Angle(0, -70, -90))
Offset("models/player/items/all_class/all_class_oculus_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -70, -90))
Offset("models/player/items/all_class/all_class_oculus_heavy_on.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -70, -90))
Offset("models/player/items/all_class/all_domination_2009_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-1, 3.33, 0), Angle(0, 90, 90))
Offset("models/player/items/all_class/all_domination_b_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-1, 3.33, 0), Angle(0, 90, 90))
Offset("models/player/items/all_class/all_domination_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-1, 3.33, 0), Angle(0, 90, 90))
Offset("models/player/items/all_class/all_halo.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, 90, 90))
Offset("models/player/items/all_class/all_reckoning_bolgan_demo.mdl", "ValveBiped.Bip01_Head1", Vector(1, -1, 0), Angle(0, -76.7, -90))
Offset("models/player/items/all_class/all_reckoning_eagonn_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -80, -90))
Offset("models/player/items/all_class/all_scrib_l_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -80, -90))
Offset("models/player/items/all_class/all_scrib_m_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -80, -90))
Offset("models/player/items/all_class/as_robot_chicken_heavy_b.mdl", "ValveBiped.Bip01_Head1", Vector(-2, -1, -2), Angle(-10, -90, -70))
Offset("models/player/items/all_class/bdayhat_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-1, 2, 0), Angle(0, 90, 90))
Offset("models/player/items/all_class/brutal_hair_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(0, 2, 0), Angle(0, -50, -90))
Offset("models/player/items/all_class/chess_heavy_blue.mdl", "ValveBiped.Bip01_Head1", Vector(0, -1, 0), Angle(180, 90, 90))
Offset("models/player/items/all_class/chess_heavy_red.mdl", "ValveBiped.Bip01_Head1", Vector(0, -1, 0), Angle(180, 90, 90))
Offset("models/player/items/all_class/crimecraft_helmet_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(0, -1, 0), Angle(180, 90, 90))
Offset("models/player/items/all_class/dex_belltower_demo.mdl", "ValveBiped.Bip01_Head1", Vector(0, -0.4, 0), Angle(180, 90, 90))
Offset("models/player/items/all_class/dex_belltower_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(0, -0.4, 0), Angle(180, 90, 90))
Offset("models/player/items/all_class/dueler_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(0, 2, 0), Angle(180, 137, 90))
Offset("models/player/items/all_class/executionerhood_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-81, 32, 0), Angle(180, 110, 90))
Offset("models/player/items/all_class/generous_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(2, 4, 0), Angle(0, 130, 90))
Offset("models/player/items/soldier/soldier_ttg_max.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -57.5, -90))
Offset("models/player/items/soldier/soldier_samurai.mdl", "ValveBiped.Bip01_Head1", Vector(7.5, -1, 0), Angle(0, -82.5, -95))
Offset("models/player/items/all_class/haunted_eyeball_hat_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(0, -2, 0), Angle(0, -90, 280))
Offset("models/player/items/soldier/soldier_spartan.mdl", "ValveBiped.Bip01_Head1", Vector(0, -1, 0), Angle(0, -77.5, -92.5))
Offset("models/player/items/soldier/soldier_pot.mdl", "ValveBiped.Bip01_Head1", Vector(5.5, -1.5, 0), Angle(278, 188, 148))
Offset("models/player/items/soldier/soldier_officer.mdl", "ValveBiped.Bip01_Head1", Vector(1, -1.5, 0), Angle(0, -82.5, -90))
Offset("models/player/items/soldier/veteran_hat.mdl", "ValveBiped.Bip01_Head1", Vector(2, -1, 0), Angle(0, -77.5, -90))
Offset("models/player/items/soldier/skull_horns_b3.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -70, -90))
Offset("models/player/items/all_class/merasmus_skull_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-1, 3.33, 0), Angle(0, -50, -90))
Offset("models/player/items/soldier/chief_rocketeer.mdl", "ValveBiped.Bip01_Head1", Vector(-72.5, 17.5, 0), Angle(0, -77.5, -90))
Offset("models/player/items/heavy/heavy_big_chief.mdl", "ValveBiped.Bip01_Head1", Vector(0, -2, 0), Angle(0, -82.5, -90))
Offset("models/player/items/all_class/notch_head_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-1, -2, 0), Angle(0, -73, -90))
Offset("models/player/items/soldier/treasure_hat_oct.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -72.5, -90))
Offset("models/player/items/all_class/oh_xmas_tree_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(0, -1, 0), Angle(0, -73, -90))
Offset("models/player/items/all_class/parasite_hat_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-55, 5, 94), Angle(10, -70, -150))
Offset("models/player/items/all_class/pcg_hat_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-3, 1, 0), Angle(0, -63.3, -90))
Offset("models/player/items/all_class/pumpkin_hat_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-93, 48, 0), Angle(0, -63.3, -90))
Offset("models/player/items/soldier/soldier_bill.mdl", "ValveBiped.Bip01_Head1", Vector(-72.5, 17.5, 0), Angle(0, -77, -90))
Offset("models/player/items/soldier/soldier_sargehat.mdl", "ValveBiped.Bip01_Head1", Vector(-71.5, 16.5, 0), Angle(0, -77.5, -90))
Offset("models/player/items/pyro/fwk_pyro_flamenco.mdl", "ValveBiped.Bip01_Head1", Vector(0, -1.5, 0), Angle(0, -62.5, -90))
Offset("models/player/items/pyro/pyro_plunger.mdl", "ValveBiped.Bip01_Head1", Vector(5.5, -1.5, 0), Angle(0, -52.5, -90))
Offset("models/player/items/pyro/fwk_pyro_birdcage.mdl", "ValveBiped.Bip01_Head1", Vector(-0.5, 0, 0), Angle(0, -52.5, -90))
Offset("models/player/items/pyro/pyro_chef_hat.mdl", "ValveBiped.Bip01_Head1", Vector(1.5, -4, 0), Angle(0, -113, -90))
Offset("models/player/items/pyro/fiesta_sombrero.mdl", "ValveBiped.Bip01_Head1", Vector(2.5, -5, 0), Angle(0, -92.5, -90))
Offset("models/player/items/sniper/sniper_applearrow.mdl", "ValveBiped.Bip01_Head1", Vector(6, 0, -3), Angle(-113, -67.5, -90))
Offset("models/player/items/sniper/c_bet_brinkhood.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0.5, 0), Angle(0, -87.5, -90))
Offset("models/player/items/spy/spy_detective_noir.mdl", "ValveBiped.Bip01_Head1", Vector(1.7, -1.5, 0), Angle(0, -77.5, -90))
Offset("models/player/items/spy/shogun_ninjamask.mdl", "ValveBiped.Bip01_Head1", Vector(0, -1, 0), Angle(0, -79.5, -90))
Offset("models/player/items/spy/grfs_spy.mdl", "ValveBiped.Bip01_Head1", Vector(-0.85, -0.5, 0), Angle(0, -72.5, -90))
Offset("models/player/items/spy/hardhat.mdl", "ValveBiped.Bip01_Head1", Vector(0, -1.5, 0), Angle(0, -82.5, -90))
Offset("models/player/items/spy/spy_charmers_chapeau.mdl", "ValveBiped.Bip01_Head1", Vector(1, -1.5, 0), Angle(-2, -87.5, -90))
Offset("models/player/items/spy/spy_party_phantom.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -72.5, -90))
Offset("models/player/items/pyro/fireman_helmet.mdl", "ValveBiped.Bip01_Head1", Vector(-72.5, 7.5, 0), Angle(0, -81, -90))
Offset("models/player/items/pyro/pyro_beanie.mdl", "ValveBiped.Bip01_Head1", Vector(-78.5, 6, 0), Angle(0, -81, -90))
Offset("models/player/items/heavy/heavy_ushanka.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -62.5, -90))
Offset("models/player/items/engineer/engineer_cowboy_hat.mdl", "ValveBiped.Bip01_Head1", Vector(0.5, 0, 0), Angle(0, -67.5, -90))
Offset("models/player/items/heavy/heavy_officer.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -59.5, -90))
Offset("models/player/items/heavy/pugilist_protector.mdl", "ValveBiped.Bip01_Head1", Vector(-77.5, 20, 0), Angle(0, -77.5, -90))
Offset("models/player/items/heavy/wrestling_mask.mdl", "ValveBiped.Bip01_Head1", Vector(-4, -3.6, 0), Angle(0, -81, -90))
Offset("models/player/items/demo/demo_fiesta_sombrero.mdl", "ValveBiped.Bip01_Head1", Vector(1, -0.7, 0), Angle(0, -72.5, -90))
Offset("models/player/items/demo/mighty_pirate.mdl", "ValveBiped.Bip01_Head1", Vector(1, 0, 0), Angle(0, -72.5, -90))
Offset("models/player/items/demo/crown.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0.5, -0.25), Angle(0, -82.5, -86))
Offset("models/player/items/demo/demo_shogun_kabuto.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -67.5, -90))
Offset("models/player/items/demo/stunt_helmet.mdl", "ValveBiped.Bip01_Head1", Vector(1, 0, 0), Angle(0, -77.5, -90))
Offset("models/player/items/demo/demo_sultan_hat.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -62.5, -90))
Offset("models/player/items/demo/demo_tricorne.mdl", "ValveBiped.Bip01_Head1", Vector(-72.5, 15.5, 0), Angle(0, -77.5, -90))
Offset("models/player/items/medic/medic_mtg.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -77.5, -90))
Offset("models/player/items/all_class/trn_wiz_hat_soldier.mdl", "ValveBiped.Bip01_Head1", Vector(0, 1, 0), Angle(0, -47.5, -90))
Offset("models/player/items/all_class/soundtrack_hat_soldier.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -77.5, -90))
Offset("models/player/items/demo/ttg_glasses.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0.25, 0), Angle(0, -76.5, -90))
Offset("models/props_manor/clocktower_01.mdl", "ValveBiped.Bip01_Head1", Vector(5, 0, 0), Angle(0, -80.5, -90))
Offset("models/props_viaduct_event/skull_island01.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 1, 0), Angle(-90, -32.5, 0))
Offset("models/pickups/pickup_powerup_king.mdl", "ValveBiped.Bip01_Head1", Vector(2, 1, 0), Angle(0, -80, -90))
Offset("models/player/items/demo/hero_academy_demo.mdl", "ValveBiped.Bip01_Head1", Vector(-74, 6.5, 0), Angle(0, -85, -90))
Offset("models/player/items/demo/japan_hat.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -87.5, -90))
Offset("models/player/items/demo/japan_hat_monarch.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -87.5, -90))
Offset("models/player/items/demo/fwk_demo_sashhat.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0.5, 0), Angle(0, -81, -90))
Offset("models/player/items/demo/hallmark.mdl", "ValveBiped.Bip01_Head1", Vector(0.5, 1, 0), Angle(0, -67.5, -90))
Offset("models/player/items/engineer/mbsf_engineer.mdl", "ValveBiped.Bip01_Head1", Vector(-1, 1.5, 0), Angle(0, -62.5, -90))
Offset("models/player/items/engineer/weldingmask.mdl", "ValveBiped.Bip01_Head1", Vector(-36, -57.5, 0), Angle(0, -146, -90))
Offset("models/player/items/engineer/engineer_brain.mdl", "ValveBiped.Bip01_Head1", Vector(6, -1.25, 0), Angle(0, -72.5, -90))
Offset("models/player/items/engineer/engineer_buckaroos_hat.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -77.5, -90))
Offset("models/player/items/heavy/fwk_heavy_lumber.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 1, 0), Angle(0, -63.5, -90))
Offset("models/player/items/heavy/heavy_fairy_tiara.mdl", "ValveBiped.Bip01_Head1", Vector(-0.4, 0, 0), Angle(90, -65.5, -90))
Offset("models/player/items/sniper/larrikin_robin.mdl", "ValveBiped.Bip01_Head1", Vector(1, 1, 0), Angle(0, -77.5, -90))


Offset("models/player/items/all_class/halloween_bag_demo_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -90, 280))
Offset("models/player/items/all_class/halloween_bag_engineer_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -90, 280))
Offset("models/player/items/all_class/halloween_bag_heavy_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -90, 280))
Offset("models/player/items/all_class/halloween_bag_medic_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -90, 280))
Offset("models/player/items/all_class/halloween_bag_pyro_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -90, 280))
Offset("models/player/items/all_class/halloween_bag_saxton_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -90, 280))
Offset("models/player/items/all_class/halloween_bag_scout_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -90, 280))
Offset("models/player/items/all_class/halloween_bag_sniper_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -90, 280))
Offset("models/player/items/all_class/halloween_bag_soldier_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -90, 280))
Offset("models/player/items/all_class/halloween_bag_spy_heavy.mdl", "ValveBiped.Bip01_Head1", Vector(-2, 0, 0), Angle(0, -90, 280))


--------------------------------------------------------------------------------------------
-- Neck
--------------------------------------------------------------------------------------------
Offset("models/props_wasteland/prison_padlock001a.mdl", "ValveBiped.Bip01_Neck1", Vector(2, 5, -1), Angle(0, 0, 280))
Offset("models/effects/vol_light64x128.mdl", "ValveBiped.forward", Vector(2.5, 2.5, 90), Angle(0, 0, 0))


-- TF2 ITEMS
Offset("models/player/items/mvm_loot/heavy/fob_e_minigun.mdl", "ValveBiped.Bip01_Neck1", Vector(-43.3, -4, 3), Angle(0, 0, -63.3))
Offset("models/player/items/mvm_loot/heavy/fob_h_minigun.mdl", "ValveBiped.Bip01_Neck1", Vector(-43.3, -4, 3), Angle(0, 0, -63.3))
Offset("models/player/items/mvm_loot/heavy/fob_h_minigun_diamond.mdl", "ValveBiped.Bip01_Neck1", Vector(-43.3, -4, 3), Angle(0, 0, -63.3))

Offset("models/player/items/all_class/all_winter_scarf_heavy.mdl", "ValveBiped.Bip01_Neck1", Vector(-5, 1, 0), Angle(0, 90, 90))

--------------------------------------------------------------------------------------------
-- Eyes
--------------------------------------------------------------------------------------------
Offset("models/player/items/spy/fwk_spy_specs.mdl", "ValveBiped.Bip01_Head1", Vector(-2.6, -2.5, 0), Angle(0, -67.5, -90))
Offset("models/player/items/spy/summer_shades.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -70.5, -90))
Offset("models/player/items/spy/professor_speks.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -72.5, -90))
Offset("models/player/items/demo/demo_fiesta_shades.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -69, -90))
Offset("models/player/items/scout/fwk_scout_3d.mdl", "ValveBiped.Bip01_Head1", Vector(0, 1, 0), Angle(0, -70.5, -90))
Offset("models/player/items/scout/scout_mtg.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0.5, 0), Angle(0, -79.5, -90))
Offset("models/workshop/player/items/all_class/jul13_sweet_shades_s1/jul13_sweet_shades_s1_soldier.mdl", "ValveBiped.Bip01_Head1", Vector(2.6, 4, 0), Angle(0, -72.5, -90))
Offset("models/player/items/medic/medic_blighted_beak.mdl", "ValveBiped.Bip01_Head1", Vector(1, 1, 0), Angle(0, -80.5, -90))
Offset("models/player/items/all_class/summer_deal_spy.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0, 0), Angle(0, -82.5, -90))


--------------------------------------------------------------------------------------------
-- Mouth
--------------------------------------------------------------------------------------------
Offset("models/pissedmeoff.mdl", "ValveBiped.Bip01_Head1", Vector(1.5, 8, 0), Angle(0, 280, 0))
Offset("models/katharsmodels/contraband/jointjes/jointjes.mdl", "ValveBiped.Bip01_Head1", Vector(1.2, 7, 0), Angle(0, 280, 0))

--------------------------------------------------------------------------------------------
-- Chest
--------------------------------------------------------------------------------------------
Offset("models/drugplants/weedflower.mdl", "ValveBiped.Bip01_Pelvis", Vector(0, 7, 0), Angle(36.7, 0, 280))

-- TF2 Items
Offset("models/player/items/all_class/3a_badge.mdl", "ValveBiped.Bip01_Spine2", Vector(9, -5, 5), Angle(23.3, 63.3, 90))
Offset("models/player/items/all_class/headsplitter_demo.mdl", "ValveBiped.Bip01_Spine2", Vector(0, 6, 0), Angle(0, -16.7, -90))


--------------------------------------------------------------------------------------------
-- Back
--------------------------------------------------------------------------------------------
Offset("models/thrusters/jetpack.mdl", "ValveBiped.Bip01_Spine2", Vector(0, 9, 1), Angle(180, 90, 90))
Offset("models/balloons/hot_airballoon.mdl", "ValveBiped.Bip01_Spine2", Vector(1, -4.5, 0), Angle(180, 90, 90))
Offset("models/props_junk/wheebarrow01a.mdl", "ValveBiped.Bip01_Spine2", Vector(4, 0, 0), Angle(0, 0, 90))
Offset("models/dav0r/tnt/tnttimed.mdl", "ValveBiped.Bip01_Spine2", Vector(-9, 10, 2), Angle(90, 180, 0))
Offset("models/props_phx/amraam.mdl", "ValveBiped.Bip01_Spine2", Vector(4, 5, -4), Angle(0, 0, 0))
Offset("models/props_c17/playground_carousel01.mdl", "ValveBiped.Bip01_Spine2", Vector(5, 2, 0), Angle(0, 0, 90))
Offset("models/props_junk/shovel01a.mdl", "ValveBiped.Bip01_Spine2", Vector(5, 3, 0), Angle(180, 90, 110))
Offset("models/props_c17/shelfunit01a.mdl", "ValveBiped.Bip01_Spine2", Vector(-15, 7, 0), Angle(90, 0, 180))
Offset("models/props_c17/trappropeller_blade.mdl", "ValveBiped.Bip01_Spine2", Vector(3, 4, 0), Angle(35, 0, 90))
Offset("models/props_phx/rocket1.mdl", "ValveBiped.Bip01_Spine2", Vector(-30, 12, 0), Angle(0, 93, 90))
Offset("models/props_phx/torpedo.mdl", "ValveBiped.Bip01_Spine2", Vector(5, 8, -5), Angle(0, 0, 0))
Offset("models/xqm/jetbody3_s2.mdl", "ValveBiped.Bip01_Spine2", Vector(5, 6, 1), Angle(90, 0, 90))
Offset("models/xqm/jetbody3_s2.mdl", "ValveBiped.Bip01_Spine2", Vector(5, 6, 1), Angle(90, 0, 90))
Offset("models/katharsmodels/syringe_out/syringe_out.mdl", "ValveBiped.Bip01_Spine2", Vector(2, 6, 0), Angle(-23.3, 180, -3.33))
Offset("models/props_c17/tools_wrench01a.mdl", "ValveBiped.Bip01_Spine2", Vector(5, 2, 0), Angle(65, 0, 90))
Offset("models/props_combine/health_charger001.mdl", "ValveBiped.Bip01_Spine2", Vector(3, 3, 1), Angle(0, 270, 90))
Offset("models/props_c17/gravestone002a.mdl", "ValveBiped.Bip01_Spine2", Vector(4, 5, 0), Angle(0, 90, 90))
Offset("models/noesis/donut.mdl", "ValveBiped.Bip01_Spine2", Vector(1, 10, -1), Angle(0, 0, 90))
Offset("models/props_c17/doll01.mdl", "ValveBiped.Bip01_Spine2", Vector(2, 7, 0), Angle(180, 90, 90))
Offset("models/props_phx/misc/fender.mdl", "ValveBiped.Bip01_Spine2", Vector(7, 2, -3), Angle(157, 0, 90))
Offset("models/maxofs2d/companion_doll.mdl", "ValveBiped.Bip01_Spine2", Vector(-7, 5, 0), Angle(180, 80, 90))
Offset("models/food/hotdog.mdl", "ValveBiped.Bip01_Spine2", Vector(4, -40, 0), Angle(0, 0, 90))
Offset("models/boxopencigshib.mdl", "ValveBiped.Bip01_Spine2", Vector(8, 3, 0), Angle(180, 90, 90))
Offset("models/props_phx/games/chess/board.mdl", "ValveBiped.Bip01_Spine2", Vector(1, 3, 0), Angle(180, 90, 90))
Offset("models/food/burger.mdl", "ValveBiped.Bip01_Spine2", Vector(3.33, -39, 0), Angle(90, 0, 90))
Offset("models/props_phx/cannon.mdl", "ValveBiped.Bip01_Spine2", Vector(0, 0, 0), Angle(180, 0, 90))
Offset("models/maxofs2d/camera.mdl", "ValveBiped.Bip01_Spine2", Vector(1, 10, -8), Angle(180, 90, 180))
Offset("models/props_junk/bicycle01a.mdl", "ValveBiped.Bip01_Spine2", Vector(2, 3.33, 0), Angle(-36.7, 0, 0))
Offset("models/props_interiors/bathtub01a.mdl", "ValveBiped.Bip01_Spine2", Vector(3, 7, -4), Angle(0, 0, 90))
Offset("models/props/cs_italy/bananna_bunch.mdl", "ValveBiped.Bip01_Spine2", Vector(-3, 4, -2), Angle(90, 63.3, 43.3))
Offset("models/props/cs_italy/bananna.mdl", "ValveBiped.Bip01_Spine2", Vector(-6, 3.33, 3.33), Angle(180, 90, 30))
Offset("models/katharsmodels/contraband/zak_wiet/zak_wiet.mdl", "ValveBiped.Bip01_Spine2", Vector(7, 5, 0), Angle(180, 0, 90))
Offset("models/katharsmodels/contraband/metasync/blue_sky.mdl", "ValveBiped.Bip01_Spine2", Vector(7, 5, 0), Angle(180, 0, 90))
Offset("models/katharsmodels/contraband/zak_wiet/zak_seed.mdl", "ValveBiped.Bip01_Spine2", Vector(7, 5, 0), Angle(180, 0, 90))
Offset("models/props_c17/suitcase_passenger_physics.mdl", "ValveBiped.Bip01_Spine2", Vector(1, 7, 9), Angle(0, 0, 0))
Offset("models/seagull.mdl", "ValveBiped.Bip01_Spine2", Vector(4, 30, -6), Angle(0, -16.7, 280))
Offset("models/props_trainstation/train001.mdl", "ValveBiped.Bip01_Spine2", Vector(1, 8, 0), Angle(270, 170, 263))
Offset("models/props_lab/crematorcase.mdl", "ValveBiped.Bip01_Spine2", Vector(2, 3, 1), Angle(0, 0, 90))
Offset("models/maxofs2d/logo_gmod_b.mdl", "ValveBiped.Bip01_Spine2", Vector(3, 4, 0), Angle(0, 90, 90))
Offset("models/props/icefuse/icefuse_logo_text_base.mdl", "ValveBiped.Bip01_Spine2", Vector(-15, 5, 0), Angle(0, 83.3, 90))

Offset("models/maxofs2d/hover_propeller.mdl", "ValveBiped.Bip01_Spine2", Vector(15, 12, 0), Angle(0, 90, 270))
Offset("models/maxofs2d/lamp_flashlight.mdl", "ValveBiped.Bip01_Spine2", Vector(-5, 9, 0), Angle(0, 180, -90))
Offset("models/humans/charple03.mdl", "ValveBiped.Bip01_Spine2", Vector(-43.3, -3.33, 0), Angle(0, -100, -90))
Offset("models/props_c17/metalpot002a.mdl", "ValveBiped.Bip01_Spine2", Vector(3, 4, 0), Angle(170, 0, 90))
Offset("models/props_phx/misc/flakshell_big.mdl", "ValveBiped.Bip01_Spine2", Vector(-17.5, 12.5, 0), Angle(0, 90, 90))






Offset("models/weapons/w_spade.mdl", "ValveBiped.Bip01_Spine2", Vector(43.3, 3.33, 30), Angle(120, 0, 0))
Offset("models/weapons/w_357.mdl", "ValveBiped.Bip01_Spine2", Vector(-16.7, 3.33, -10), Angle(-315, 0, 180))
Offset("models/weapons/w_pist_elite.mdl", "ValveBiped.Bip01_Spine2", Vector(0, 0, 0), Angle(0, 0, 90))
Offset("models/weapons/w_rif_ak47.mdl", "ValveBiped.Bip01_Spine2", Vector(-4, 5, 16), Angle(45, 0, 180))
Offset("models/weapons/w_snip_sg550.mdl", "ValveBiped.Bip01_Spine2", Vector(1, 4, 15), Angle(23.3, 0, 180))
Offset("models/weapons/w_snip_scout.mdl", "ValveBiped.Bip01_Spine2", Vector(-3.33, 3.33, -13), Angle(-30, 0, 0))
Offset("models/weapons/w_snip_g3sg1.mdl", "ValveBiped.Bip01_Spine2", Vector(3.33, 3.33, -16.7), Angle(-30, 0, 0))
Offset("models/weapons/w_snip_awp.mdl", "ValveBiped.Bip01_Spine2", Vector(3.33, 3.33, -16.7), Angle(-30, 0, 0))
Offset("models/weapons/w_smg_ump45.mdl", "ValveBiped.Bip01_Spine2", Vector(-3.33, 3.33, -10), Angle(-30, 0, 0))
Offset("models/weapons/w_smg_tmp.mdl", "ValveBiped.Bip01_Spine2", Vector(-3.33, 3.33, -8), Angle(-30, 0, 0))
Offset("models/weapons/w_smg_p90.mdl", "ValveBiped.Bip01_Spne2", Vector(-3.33, 3.33, -8), Angle(-30, 0, 0))
Offset("models/weapons/w_smg_mp5.mdl", "ValveBiped.Bip01_Spine2", Vector(-10, 3.33, -10), Angle(-30, 0, 0))
Offset("models/weapons/w_smg_mac10.mdl", "ValveBiped.Bip01_Spine2", Vector(-10, 3.33, -10), Angle(-30, 0, 0))
Offset("models/weapons/w_shot_xm1014.mdl", "ValveBiped.Bip01_Spine2", Vector(3.33, 5, -16.7), Angle(-30, 0, 0))
Offset("models/weapons/w_shot_m3super90.mdl", "ValveBiped.Bip01_Spine2", Vector(3.33, 5, -16.7), Angle(-30, 0, 0))
Offset("models/weapons/w_rif_sg552.mdl", "ValveBiped.Bip01_Spine2", Vector(3.33, 5, -16.7), Angle(-30, 0, 0))
Offset("models/weapons/w_rif_m4a1_silencer.mdl", "ValveBiped.Bip01_Spine2", Vector(3.33, 5, -16.7), Angle(-30, 0, 0))
Offset("models/weapons/w_rif_m4a1.mdl", "ValveBiped.Bip01_Spine2", Vector(3.33, 5, -16.7), Angle(-30, 0, 0))
Offset("models/weapons/w_rif_galil.mdl", "ValveBiped.Bip01_Spine2", Vector(3.33, 5, -16.7), Angle(-30, 0, 0))
Offset("models/weapons/w_rif_famas.mdl", "ValveBiped.Bip01_Spine2", Vector(3.33, 5, -20), Angle(-30, 0, 0))



-- TF2 ITEMS
Offset("models/player/items/all_class/all_penguin.mdl", "ValveBiped.Bip01_Spine2", Vector(10, -7, 10), Angle(-310, -83.3, -103))
Offset("models/player/items/all_class/all_penguin_demo.mdl", "ValveBiped.Bip01_Spine2", Vector(10, -7, 10), Angle(-310, -83.3, -103))
Offset("models/player/items/all_class/all_penguin_pyro.mdl", "ValveBiped.Bip01_Spine2", Vector(10, -7, 10), Angle(-310, -83.3, -103))
Offset("models/player/items/all_class/bombonomicon.mdl", "ValveBiped.Bip01_Spine2", Vector(8, 3, 0), Angle(180, 90, 90))
Offset("models/player/items/all_class/hm_duck_sniper.mdl", "ValveBiped.Bip01_Spine2", Vector(-83.3, -16.7, -3), Angle(-90, 0, 0))
Offset("models/player/items/sniper/knife_shield.mdl", "ValveBiped.Bip01_Spine2", Vector(-62.5, -6, 0), Angle(5, 93.5, 89))
Offset("models/player/items/sniper/croc_shield.mdl", "ValveBiped.Bip01_Spine2", Vector(-62.5, -5, -12.5), Angle(0, 92.5, 77.5))
Offset("models/player/items/scout/boombox.mdl", "ValveBiped.Bip01_Spine2", Vector(92.5, -7.5, -64.5), Angle(2.5, 77.5, -57.5))
Offset("models/player/items/engineer/guitar.mdl", "ValveBiped.Bip01_Spine2", Vector(1, 2.2, 0), Angle(0, -180, -90))
Offset("models/props_granary/rocket_launchpad3.mdl", "ValveBiped.Bip01_Spine2", Vector(0, 0, 0), Angle(0, 183, -90))
Offset("models/props_manor/coffin_01.mdl", "ValveBiped.Bip01_Spine2", Vector(0, 2, 0), Angle(0, 180, -90))
Offset("models/props_manor/gargoyle_01.mdl", "ValveBiped.Bip01_Spine2", Vector(0, 0, 0), Angle(0, 11, 90))
Offset("models/props_mining/ingot001.mdl", "ValveBiped.Bip01_Spine2", Vector(2, 2.5, 0), Angle(225, 2, 90))
Offset("models/props_swamp/chainsaw.mdl", "ValveBiped.Bip01_Spine2", Vector(17.5, 12.5, 4), Angle(0, 118, 90))
Offset("models/props_trainyard/cart_bomb_separate.mdl", "ValveBiped.Bip01_Spine2", Vector(-2.5, 12.5, 0), Angle(0, 185, 0))
Offset("models/player/items/demo/tw_kingcape.mdl", "ValveBiped.Bip01_Spine2", Vector(-62, 0, 0), Angle(0, 92.5, 90))
Offset("models/player/items/heavy/heavy_fairy_wings.mdl", "ValveBiped.Bip01_Spine2", Vector(5, -5.5, 0), Angle(90, 0, -180))

--------------------------------------------------------------------------------------------
-- Pelvis
--------------------------------------------------------------------------------------------

Offset("models/jaanus/dildo.mdl", "ValveBiped.Bip01_Pelvis", Vector(0, 5.22, 4), Angle(250, 100, 0))
Offset("models/effects/portalrift.mdl", "ValveBiped.forward", Vector(0, 0, 1), Angle(0, 0, 180))
Offset("models/props/de_nuke/lifepreserver.mdl", "ValveBiped.Bip01_Pelvis", Vector(0, 0, -1), Angle(0, 90, 0))
Offset("models/player/items/heavy/heavy_fairy_tutu.mdl", "ValveBiped.Bip01_Pelvis", Vector(0, 0, -4.5), Angle(0, 0, 95))






























--------------------------------------------------------------------------------------------
-- End
--------------------------------------------------------------------------------------------



-- Refresh the offsets
if (_FIRST_OFFSETS) then
	for _, v in ipairs (player.GetAll()) do
		if (v.SH_Accessories) then
			for id, cs in pairs (v.SH_Accessories) do
				local offset = SH_ACC:GetOffset(cs.m_sModel, v)
				cs.m_Offset = offset
			end
		end
	end
else
	_FIRST_OFFSETS = true
end