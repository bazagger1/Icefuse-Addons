--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_accessory_system/lua/accessory_list.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- This is the accessory list. It comes with accessories from a few add-ons (which can be enabled in accessory_addons.lua).
-- If you want to add a new accessory, you can use the SH_ACC:AddAccessory function.
-- To register an accessory, the id, model and slots are mandatory.
-- "id" is an unique identifier for the accessory.
-- "model" is the model of the accessory. Multi-model accessories are not supported.
-- "slots" are the slots that the accessory occupies. A slot may have only one accessory at a time (normally). An accessory can occupy multiple slots (a full face mask for example)
-- There are other settings such as:
-- "name", "price", "skin", "bodygroups", "material", "color", "scale", "canPurchase", "canSell",
-- "usergroups", "steamids", "jobs", "jobsexclude"
-- ...but these are optional.
-- After registering your entity, you need to set up an offset in accessory_offsets.lua

SH_SLOT_PETS = 1

SH_SLOT_HEAD = 2
SH_SLOT_NECK = 4
SH_SLOT_EYES = 8
SH_SLOT_MOUTH = 16
SH_SLOT_CHEST = 32
SH_SLOT_BACK = 64
SH_SLOT_PELVIS = 128

SH_ACC.List = {}

local precached = {}

function SH_ACC:AddAccessory(id, data)
	local mdl = data.mdl
	local slots = data.slot or data.slots

	assert(id and id ~= "", "empty accessory id")
	assert(mdl and id ~= "", "empty model name")
	assert(slots and slots > 0, "unassigned slot")

	local name = data.name or "Accessory"
	local price = data.price or 0

	local skin = data.skin or 0
	local bodygroups = data.bodygroups or {}
	local material = data.material or ""
	local color = data.color or Color(255, 255, 255)
	local scale = data.scale or 1
	local canPurchase = data.canPurchase or nil
	local canSell = data.canSell or nil
	local usergroups = data.usergroups or nil
	local steamids = data.steamids or nil

	assert(self.List[id] == nil, "accessory with id '" .. id .. "' already exists")

	self.List[id] = {
		id = id,
		mdl = mdl:lower(),
		slots = slots,

		name = name,
		price = price,

		skin = skin,
		bodygroups = bodygroups,
		material = material,
		color = color,
		scale = scale,

		canPurchase = canPurchase,
		canSell = canSell,
		usergroups = usergroups,
		steamids = steamids,
	}

	if (!precached[mdl]) then
		util.PrecacheModel(mdl)
		precached[mdl] = true
	end

	return self.List[id]
end

function SH_ACC:GetAccessory(id)
	return self.List[id]
end

function SH_ACC:CopyAccessory(id, acc, data)
	local newacc = table.Copy(acc)
	for k, v in pairs (data) do
		newacc[k] = v
	end

	return self:AddAccessory(id, newacc)
end

local New = function(...)
	return SH_ACC:AddAccessory(...)
end

local Copy = function(...)
	return SH_ACC:CopyAccessory(...)
end

--------------------------------------------------------------------------------------------
-- GTA5 MASKS AND OTHER SHIT
--------------------------------------------------------------------------------------------

if (SH_ACC.Addons["572310302"]) then
	-- Head
	local a = New("symbolcap1", {name = "[GTA] Cap [Gray F]", price = 10000, mdl = "models/modified/hat07.mdl", slot = SH_SLOT_HEAD})
	Copy("symbolcap2", a, {name = "[GTA] Cap [Black F]", skin = 1})
	Copy("symbolcap3", a, {name = "[GTA] Cap [Light Gray C]", skin = 2})
	Copy("symbolcap4", a, {name = "[GTA] Cap [White LS]", skin = 3})
	Copy("symbolcap5", a, {name = "[GTA] Cap [Green Feud]", skin = 4})
	Copy("symbolcap6", a, {name = "[GTA] Cap [Kaki Magnetics]", skin = 5})
	Copy("symbolcap7", a, {name = "[GTA] Cap [Brown OG]", skin = 6})
	Copy("symbolcap8", a, {name = "[GTA] Cap [Blue Stank]", skin = 7})
	Copy("symbolcap9", a, {name = "[GTA] Cap [Olive Knight]", skin = 8})
	Copy("symbolcap10", a, {name = "[GTA] Cap [Dark Blue Monkey]", skin = 9})
	Copy("symbolcap11", a, {name = "[GTA] Cap [Dark Green Football]", skin = 10})

	local a = New("symbolcap12", {name = "[GTA] Cap [Orange LH]", price = 10000, mdl = "models/modified/hat08.mdl", slot = SH_SLOT_HEAD})
	Copy("symbolcap13", a, {name = "[GTA] Cap [Censored]", skin = 1})
	Copy("symbolcap14", a, {name = "[GTA] Cap [The Nut House]", skin = 2})
	Copy("symbolcap15", a, {name = "[GTA] Cap [Rusty Browns]", skin = 3})
	Copy("symbolcap16", a, {name = "[GTA] Cap [Bishop's]", skin = 4})
	Copy("symbolcap17", a, {name = "[GTA] Cap [247]", skin = 5})
	Copy("symbolcap18", a, {name = "[GTA] Cap [Fruit Basket]", skin = 6})
	Copy("symbolcap19", a, {name = "[GTA] Cap [Ron]", skin = 7})
	Copy("symbolcap20", a, {name = "[GTA] Cap [Meteorite]", skin = 8})
	Copy("symbolcap21", a, {name = "[GTA] Cap [Dusche Gold]", skin = 9})
	Copy("symbolcap22", a, {name = "[GTA] Cap [Vespucci Beach]", skin = 10})
	Copy("symbolcap23", a, {name = "[GTA] Cap [Orang-O-Tang]", skin = 11})

	local a = New("beerhat1", {name = "[GTA] Beer Hat [Pisswasser]", price = 15000, mdl = "models/sal/acc/fix/beerhat.mdl", slot = SH_SLOT_HEAD})
	Copy("beerhat2", a, {name = "[GTA] Beer Hat [Supa Wet]", skin = 1})
	Copy("beerhat3", a, {name = "[GTA] Beer Hat [Patriot]", skin = 2})
	Copy("beerhat4", a, {name = "[GTA] Beer Hat [Benedict]", skin = 3})
	Copy("beerhat5", a, {name = "[GTA] Beer Hat [Blarneys]", skin = 4})
	Copy("beerhat6", a, {name = "[GTA] Beer Hat [J Lager]", skin = 5})

	local a = New("headphones1", {name = "[GTA] Headphones [Red]", price = 15000, mdl = "models/modified/headphones.mdl", slot = SH_SLOT_HEAD})
	Copy("headphones2", a, {name = "[GTA] Headphones [Pink]", skin = 1})
	Copy("headphones3", a, {name = "[GTA] Headphones [Green]", skin = 2})
	Copy("headphones4", a, {name = "[GTA] Headphones [Yellow]", skin = 3})

	New("chefhat", {name = "[GTA] Chef's Hat", price = 13500, mdl = "models/sal/acc/fix/cheafhat.mdl", slot = SH_SLOT_HEAD})

	local a = New("fedora1", {name = "[GTA] Fedora [Gray]", price = 15000, mdl = "models/modified/hat01_fix.mdl", slot = SH_SLOT_HEAD})
	Copy("fedora2", a, {name = "[GTA] Fedora [Black]", skin = 1})
	Copy("fedora3", a, {name = "[GTA] Fedora [White]", skin = 2})
	Copy("fedora4", a, {name = "[GTA] Fedora [Yellow]", skin = 3})
	Copy("fedora5", a, {name = "[GTA] Fedora [Red]", skin = 4})
	Copy("fedora6", a, {name = "[GTA] Fedora [Black/Red]", skin = 5})
	Copy("fedora7", a, {name = "[GTA] Fedora [Brown/White]", skin = 6})
	Copy("fedora8", a, {name = "[GTA] Fedora [Blue/Black]", skin = 7})

	local a = New("beanie1", {name = "[GTA] Beanie [Red Stripes]", price = 20000, mdl = "models/modified/hat03.mdl", slot = SH_SLOT_HEAD})
	Copy("beanie2", a, {name = "[GTA] Beanie [Blue]", skin = 1})
	Copy("beanie3", a, {name = "[GTA] Beanie [Red]", skin = 2})
	Copy("beanie4", a, {name = "[GTA] Beanie [White]", skin = 3})
	Copy("beanie5", a, {name = "[GTA] Beanie [Black Stripes]", skin = 4})

	local a = New("woolhat1", {name = "[GTA] Wool Hat [Black]", price = 20000, mdl = "models/modified/hat04.mdl", slot = SH_SLOT_HEAD})
	Copy("woolhat2", a, {name = "[GTA] Wool Hat [Gray]", skin = 1})
	Copy("woolhat3", a, {name = "[GTA] Wool Hat [Gray Stripes]", skin = 2})
	Copy("woolhat4", a, {name = "[GTA] Wool Hat [Jamaica]", skin = 3})
	Copy("woolhat5", a, {name = "[GTA] Wool Hat [Dark Blue]", skin = 4})

	New("flatcap", {name = "[GTA] Flat Cap", price = 15000, mdl = "models/modified/hat06.mdl", slot = SH_SLOT_HEAD})

	-- Eyes
	local a = New("glasses1", {name = "[GTA] Glasses [Gray]", price = 6500, mdl = "models/modified/glasses01.mdl", slot = SH_SLOT_EYES})
	Copy("glasses2", a, {name = "[GTA] Glasses [White]", skin = 1})
	Copy("glasses3", a, {name = "[GTA] Glasses [Green]", skin = 2})
	Copy("glasses4", a, {name = "[GTA] Glasses [Brown]", skin = 3})
	Copy("glasses5", a, {name = "[GTA] Glasses [Orange]", skin = 4})
	Copy("glasses6", a, {name = "[GTA] Glasses [Light Gray]", skin = 5})

	New("plaguedoctor", {name = "[GTA] Plague Doctor Mask", price = 25000, slot = SH_SLOT_EYES, mdl = "models/sal/halloween/doctor.mdl"})

	local a = New("balletmask1", {name = "[GTA] Ballet Mask [White]", price = 20000, slot = SH_SLOT_EYES, mdl = "models/sal/acc/fix/mask_1.mdl"})
	Copy("balletmask2", a, {name = "[GTA] Ballet Mask [Blue]", skin = 1})
	Copy("balletmask3", a, {name = "[GTA] Ballet Mask [Black]", skin = 2})
	Copy("balletmask4", a, {name = "[GTA] Ballet Mask [Gray]", skin = 3})
	Copy("balletmask5", a, {name = "[GTA] Ballet Mask [Yellow]", skin = 4})
	Copy("balletmask6", a, {name = "[GTA] Ballet Mask [Black 2]", skin = 5})

	-- Mouth
	New("bandana", {name = "[GTA] Black Bandana", price = 35000, slot = SH_SLOT_MOUTH, mdl = "models/modified/bandana.mdl"})

	-- Neck
	local a = New("scarf1", {name = "[GTA] Scarf [White]", price = 30000, mdl = "models/sal/acc/fix/scarf01.mdl", slot = SH_SLOT_NECK})
	Copy("scarf2", a, {name = "[GTA] Scarf [Gray]", skin = 1})
	Copy("scarf3", a, {name = "[GTA] Scarf [Black]", skin = 2})
	Copy("scarf4", a, {name = "[GTA] Scarf [Dark Blue]", skin = 3})
	Copy("scarf5", a, {name = "[GTA] Scarf [Red]", skin = 4})
	Copy("scarf6", a, {name = "[GTA] Scarf [Green]", skin = 5})
	Copy("scarf7", a, {name = "[GTA] Scarf [Pink]", skin = 6})

	-- Whole head (Head + Eyes + Mouth)
	New("catmask", {name = "[GTA] Cat Mask", price = 150000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/cat.mdl"})
	New("bearmask", {name = "[GTA] Bear Mask", price = 150000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/bear.mdl"})
	New("foxmask", {name = "[GTA] Fox Mask", price = 150000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/fox.mdl"})
	New("owlmask", {name = "[GTA] Owl Mask", price = 150000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/owl.mdl"})
	New("wolfmask", {name = "[GTA] Wolf Mask", price = 150000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/wolf.mdl"})

	local a = New("monkeymask1", {name = "[GTA] Monkey Mask [Normal]", price = 150000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/halloween/monkey.mdl"})
	Copy("monkeymask2", a, {name = "[GTA] Monkey Mask [Gorilla]", skin = 1})
	Copy("monkeymask3", a, {name = "[GTA] Monkey Mask [Zombie]", skin = 2})
	Copy("monkeymask4", a, {name = "[GTA] Monkey Mask [Old]", skin = 3})

	local a = New("santapenguin", {name = "[GTA] Santa Penguin", price = 150000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/penguin.mdl"})
	-- a.canPurchase = function(ply)
	-- 	if (os.date("%m") == "12") then
	-- 		return true
	-- 	else
	-- 		return false, "You can only purchase this accessory in December!"
	-- 	end
	-- end

	local a = New("eaglemask1", {name = "[GTA] Eagle Mask [White]", price = 150000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/hawk_1.mdl"})
	Copy("eaglemask2", a, {name = "[GTA] Eagle Mask [Brown]", mdl = "models/sal/hawk_2.mdl"})

	local a = New("paperbag1", {name = "[GTA] Paper Bag", price = 65000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/halloween/bag.mdl"})
	Copy("paperbag2", a, {name = "[GTA] Paper Bag [Grin]", skin = 1})
	Copy("paperbag3", a, {name = "[GTA] Paper Bag [Crying]", skin = 2})
	Copy("paperbag4", a, {name = "[GTA] Paper Bag [Smile]", skin = 3})
	Copy("paperbag5", a, {name = "[GTA] Paper Bag [Boss]", skin = 4})
	Copy("paperbag6", a, {name = "[GTA] Paper Bag [Teeth]", skin = 5})
	Copy("paperbag7", a, {name = "[GTA] Paper Bag [Timid]", skin = 6})
	Copy("paperbag8", a, {name = "[GTA] Paper Bag [Burger Shot]", skin = 7})
	Copy("paperbag9", a, {name = "[GTA] Paper Bag [Please Kill Me]", skin = 8})
	Copy("paperbag10", a, {name = "[GTA] Paper Bag [Satan]", skin = 9})
	Copy("paperbag11", a, {name = "[GTA] Paper Bag [Pig]", skin = 10})
	Copy("paperbag12", a, {name = "[GTA] Paper Bag [Tongue Out]", skin = 11})
	Copy("paperbag13", a, {name = "[GTA] Paper Bag [Angry]", skin = 12})
	Copy("paperbag14", a, {name = "[GTA] Paper Bag [Confused]", skin = 13})
	Copy("paperbag15", a, {name = "[GTA] Paper Bag [Death]", skin = 14})
	Copy("paperbag16", a, {name = "[GTA] Paper Bag [Dog]", skin = 15})
	Copy("paperbag17", a, {name = "[GTA] Paper Bag [Ghos]", skin = 16})
	Copy("paperbag18", a, {name = "[GTA] Paper Bag [Alien]", skin = 17})
	Copy("paperbag19", a, {name = "[GTA] Paper Bag [Help Me]", skin = 18})
	Copy("paperbag20", a, {name = "[GTA] Paper Bag [Rectangles]", skin = 19})
	Copy("paperbag21", a, {name = "[GTA] Paper Bag [Middle Finger]", skin = 20})
	Copy("paperbag22", a, {name = "[GTA] Paper Bag [Gentleman]", skin = 21})
	Copy("paperbag23", a, {name = "[GTA] Paper Bag [Stickers]", skin = 22})
	Copy("paperbag24", a, {name = "[GTA] Paper Bag [Picasso]", skin = 23})
	Copy("paperbag25", a, {name = "[GTA] Paper Bag [Black Heart]", skin = 24})
	Copy("paperbag26", a, {name = "[GTA] Paper Bag [Black]", skin = 25})

	-- Face (Eyes + Mouth)
	New("gingerbread", {name = "[GTA] Gingerbread Mask", price = 150000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/gingerbread.mdl"})

	local a = New("headwrap1", {name = "[GTA] Headwrap [Gray Bandages]", price = 150000, mdl = "models/sal/halloween/headwrap2.mdl", slot = SH_SLOT_EYES + SH_SLOT_MOUTH}) a.scale = 0.9
	Copy("headwrap2", a, {name = "[GTA] Headwrap [Black Bandages]", skin = 1})
	Copy("headwrap3", a, {name = "[GTA] Headwrap [White Bandages]", skin = 2})
	Copy("headwrap4", a, {name = "[GTA] Headwrap [Rainbow Bandages]", skin = 3})
	Copy("headwrap5", a, {name = "[GTA] Headwrap [Do Not Cross]", mdl = "models/sal/halloween/headwrap1.mdl"})

	local a = New("hockeymask1", {name = "[GTA] Hockey Mask [Please Stop Me]", price = 150000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/modified/mask5.mdl"}) a.scale = 0.9

	local a = New("hockeymask2", {name = "[GTA] Hockey Mask [Bullet Holes]", price = 150000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/acc/fix/mask_2.mdl"}) a.scale = 0.9

	Copy("hockeymask3", a, {name = "[GTA] Hockey Mask [Dog]", skin = 1})
	Copy("hockeymask4", a, {name = "[GTA] Hockey Mask [Cat]", skin = 2})
	Copy("hockeymask5", a, {name = "[GTA] Hockey Mask [Dog 2]", skin = 3})
	Copy("hockeymask6", a, {name = "[GTA] Hockey Mask [Dog 3]", skin = 4})
	Copy("hockeymask7", a, {name = "[GTA] Hockey Mask [Crown]", skin = 5})
	Copy("hockeymask8", a, {name = "[GTA] Hockey Mask [Rotten Zombie]", skin = 6})
	Copy("hockeymask9", a, {name = "[GTA] Hockey Mask [Vile Zombie]", skin = 7})
	Copy("hockeymask10", a, {name = "[GTA] Hockey Mask [Flame Skull]", skin = 8})
	Copy("hockeymask11", a, {name = "[GTA] Hockey Mask [Nightmare Skull]", skin = 9})
	Copy("hockeymask12", a, {name = "[GTA] Hockey Mask [Electric Skull]", skin = 10})
	Copy("hockeymask13", a, {name = "[GTA] Hockey Mask [Skull]", skin = 11})
	Copy("hockeymask14", a, {name = "[GTA] Hockey Mask [Stitched]", skin = 12})
	Copy("hockeymask15", a, {name = "[GTA] Hockey Mask [Pale Stitched]", skin = 13})
	Copy("hockeymask16", a, {name = "[GTA] Hockey Mask [X]", skin = 14})

	local a = New("skullmask1", {name = "[GTA] Skull Mask [Black]", price = 250000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/modified/mask6.mdl"}) a.scale = 0.9
	Copy("skullmask2", a, {name = "[GTA] Skull Mask [Gray]", skin = 1})
	Copy("skullmask3", a, {name = "[GTA] Skull Mask [White]", skin = 2})
	Copy("skullmask4", a, {name = "[GTA] Skull Mask [Dark Green]", skin = 3})

	local a = New("pigmask1", {name = "[GTA] Pig Mask [Normal]", price = 150000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/pig.mdl"})
	Copy("pigmask2", a, {name = "[GTA] Pig Mask [Bloody]", skin = 1})

	local a = New("warriormask1", {name = "[GTA] Warrior Mask [Metal]", price = 150000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/acc/fix/mask_4.mdl"})
	Copy("warriormask2", a, {name = "[GTA] Warrior Mask [Circuit]", skin = 1})
	Copy("warriormask3", a, {name = "[GTA] Warrior Mask [Molten]", skin = 2})
	Copy("warriormask4", a, {name = "[GTA] Warrior Mask [Purple]", skin = 3})
	Copy("warriormask5", a, {name = "[GTA] Warrior Mask [Carbon]", skin = 4})
	Copy("warriormask6", a, {name = "[GTA] Warrior Mask [Target]", skin = 5})
	Copy("warriormask7", a, {name = "[GTA] Warrior Mask [Concrete]", skin = 6})
	Copy("warriormask8", a, {name = "[GTA] Warrior Mask [Thunder]", skin = 7})

	local a = New("ninja1", {name = "[GTA] Ninja Mask [Black]", price = 150000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/halloween/ninja.mdl"})
	Copy("ninja2", a, {name = "[GTA] Ninja Mask [White]", skin = 1})
	Copy("ninja3", a, {name = "[GTA] Ninja Mask [Tan]", skin = 2})
	Copy("ninja4", a, {name = "[GTA] Ninja Mask [L.S Benders]", skin = 3})
	Copy("ninja5", a, {name = "[GTA] Ninja Mask [Justice]", skin = 4})
	Copy("ninja6", a, {name = "[GTA] Ninja Mask [Woodland Camo]", skin = 5})
	Copy("ninja7", a, {name = "[GTA] Ninja Mask [Red Stripes]", skin = 6})
	Copy("ninja8", a, {name = "[GTA] Ninja Mask [Love Fist]", skin = 7})
	Copy("ninja9", a, {name = "[GTA] Ninja Mask [T.P.I]", skin = 8})
	Copy("ninja10", a, {name = "[GTA] Ninja Mask [Pink Camo]", skin = 9})
	Copy("ninja11", a, {name = "[GTA] Ninja Mask [Police]", skin = 10})

	-- Back
	local a = New("backpack1", {name = "[GTA] Backpack [Red]", price = 100000, mdl = "models/modified/backpack_1.mdl", slot = SH_SLOT_BACK})
	Copy("backpack2", a, {name = "[GTA] Backpack [Black]", skin = 1})
	Copy("backpack3", a, {name = "[GTA] Backpack [Orange]", skin = 2})

	local a = New("backpackcamp1", {name = "[GTA] Camping Backpack [Blue]", price = 100000, mdl = "models/modified/backpack_2.mdl", slot = SH_SLOT_BACK})
	Copy("backpackcamp2", a, {name = "[GTA] Camping Backpack [Green]", skin = 1})
	Copy("backpackcamp3", a, {name = "[GTA] Camping Backpack [Red/White]", skin = 2})

	local a = New("backpackmil1", {name = "[GTA] Military Backpack [Black]", price = 100000, mdl = "models/modified/backpack_3.mdl", slot = SH_SLOT_BACK})
	Copy("backpackmil2", a, {name = "[GTA] Military Backpack [Gray]", skin = 1})
end





















--------------------------------------------------------------------------------------------
-- All yo custom shit goes here dawg
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- Pets
--------------------------------------------------------------------------------------------
if (SH_ACC.Addons["pets_0"]) then
-- TF2 ITEMS
local a = New("tf2_pet_ghost_pj", {name = "[TF2] Pet Ghost PJ", price = 15000000, slot = SH_SLOT_PETS, mdl = "models/player/items/all_class/hwn_ghost_pj.mdl"})
local a = New("tf2_pet_balloon", {name = "[TF2] Pet Balloon", price = 15000000, slot = SH_SLOT_PETS, mdl = "models/player/items/all_class/hwn_pet_balloon.mdl"})
local a = New("tf2_pet_flying_robot", {name = "[TF2] Pet Flying Robot", price = 15000000, slot = SH_SLOT_PETS, mdl = "models/player/items/all_class/pet_robro.mdl"})
local a = New("tf2_pet_ghost", {name = "[TF2] Pet Ghost", price = 15000000, slot = SH_SLOT_PETS, mdl = "models/player/items/all_class/hwn_pet_ghost.mdl"})
local a = New("tf2_pet_ghost_pyro", {name = "[TF2] Pet Ghost Pyro", price = 15000000, slot = SH_SLOT_PETS, mdl = "models/player/items/all_class/hwn_pet_ghost_pyro.mdl"})
local a = New("tf2_pet_magic_balloon_unicorn", {name = "[TF2] Pet Magic Balloon Unicorn", price = 15000000, slot = SH_SLOT_PETS, mdl = "models/player/items/all_class/pet_reinballoonicorn.mdl"})
local a = New("tf2_pet_balloon_unicorn", {name = "[TF2] Pet Balloon Unicorn", price = 15000000, slot = SH_SLOT_PETS, mdl = "models/player/items/all_class/pet_balloonicorn.mdl"})
end





--------------------------------------------------------------------------------------------
-- Head
--------------------------------------------------------------------------------------------
if (SH_ACC.Addons["head_items"]) then

local a = New("white_shitty_hat", {name = "White Shitty Hat", price = 5000, slot = SH_SLOT_HEAD, mdl = "models/props/de_tides/vending_hat.mdl"}) a.scale = 0.78
local a = New("turtle_hat", {name = "Turtle Hat", price = 30000, slot = SH_SLOT_HEAD, mdl = "models/props/de_tides/vending_turtle.mdl"}) a.scale = 0.96
local a = New("top_hat", {name = "Top Hat", price = 5000, slot = SH_SLOT_HEAD, mdl = "models/player/items/humans/top_hat.mdl"})
local a = New("united_states_hat", {name = "United States Hat", price = 5000, slot = SH_SLOT_HEAD, mdl = "models/props/cs_office/snowman_hat.mdl"}) a.scale = 0.77
local a = New("pharaohs_mask", {name = "Pharaohs Mask", price = 350000, slot = SH_SLOT_HEAD, mdl = "models/props_combine/headcrabcannister01a.mdl"}) a.scale = 0.35
local a = New("pan_hat", {name = "Pan Hat", price = 15000, slot = SH_SLOT_HEAD, mdl = "models/props_interiors/pot02a.mdl"}) a.scale = 1.28
local a = New("lampshade_hat", {name = "Lampshade Hat", price = 15000, slot = SH_SLOT_HEAD, mdl = "models/props_c17/lampshade001a.mdl"}) a.scale = 0.86
local a = New("headcrab_hat", {name = "Headcrab Hat", price = 150000, slot = SH_SLOT_HEAD, mdl = "models/headcrabclassic.mdl"}) a.scale = 0.75
local a = New("cone_hat", {name = "Cone Hat", price = 35000, slot = SH_SLOT_HEAD, mdl = "models/props_junk/trafficcone001a.mdl"}) a.scale = 0.75
local a = New("bucket_hat", {name = "Bucket Hat", price = 35000, slot = SH_SLOT_HEAD, mdl = "models/props_junk/metalbucket01a.mdl"}) a.scale = 0.63
local a = New("afro", {name = "Afro", price = 35000, slot = SH_SLOT_HEAD, material = "models/weapons/v_stunbaton/w_shaft01a", mdl = "models/dav0r/hoverball.mdl"}) a.scale = 1.47
local a = New("ping_pong_hat", {name = "Ping Pong Hat", price = 45000, slot = SH_SLOT_HEAD, mdl = "models/roller.mdl"})
local a = New("explosive_ping_pong_hat", {name = "Explosive Ping Pong Hat", price = 9000000, slot = SH_SLOT_HEAD, mdl = "models/roller_spikes.mdl"}) a.scale = 1.33
local a = New("air_node_mask", {name = "Air Node Mask", price = 100000, slot = SH_SLOT_HEAD, mdl = "models/editor/air_node.mdl"}) a.scale = 0.63
local a = New("hint_box_mask", {name = "Hint Box Mask", price = 15000, slot = SH_SLOT_HEAD, mdl = "models/editor/air_node_hint.mdl"}) a.scale = 0.73
local a = New("white_hint_box_mask", {name = "White Hint Box Mask", price = 65000, slot = SH_SLOT_HEAD, mdl = "models/editor/node_hint.mdl"}) a.scale = 0.73
local a = New("scripted_sequence_box_mask", {name = "Scripted Sequence Box Mask", price = 95000, slot = SH_SLOT_HEAD, mdl = "models/editor/scriptedsequence.mdl"}) a.scale = 0.45
local a = New("badass_vortex_hat", {name = "Badass Vortex Hat", price = 10000000, slot = SH_SLOT_HEAD, mdl = "models/effects/portalfunnel.mdl"}) a.scale = 0.05
local a = New("crawling_in_my_skin_hat", {name = "Crawling In My Skin Hat", price = 75000000, slot = SH_SLOT_HEAD, mdl = "models/zombie/classic_torso.mdl"}) a.scale = 0.45
local a = New("i_am_groot_hat", {name = "I Am Groot Hat", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/props/de_inferno/tree_small.mdl"}) a.scale = 0.1
local a = New("jar_head", {name = "Jar Head", price = 35000, slot = SH_SLOT_HEAD, mdl = "models/props_junk/glassjug01.mdl"}) a.scale = 2.07
local a = New("bird_house_hat", {name = "Bird House Hat", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/props/cs_havana/gazebo.mdl"}) a.scale = 0.04
local a = New("space_ball", {name = "Space Ball", price = 200000, slot = SH_SLOT_HEAD, mdl = "models/maxofs2d/hover_rings.mdl"}) a.scale = 1.37
local a = New("hula_girl_hat", {name = "Hula Girl Hat", price = 35000, slot = SH_SLOT_HEAD, mdl = "models/props_lab/huladoll.mdl"}) a.scale = 2.87
-- local a = New("snow_man_hat", {name = "Snowman Hat", price = 30000, slot = SH_SLOT_HEAD, mdl = "models/props/cs_office/snowman_face.mdl"}) a.scale = 1.24
-- local a = New("helicopter_mask", {name = "Helicopter Mask", price = 5000000, slot = SH_SLOT_HEAD, mdl = "models/Gibs/helicopter_brokenpiece_04_cockpit.mdl"}) a.scale = 0.22
local a = New("tv_head", {name = "TV Head", price = 65000, slot = SH_SLOT_HEAD, mdl = "models/props_c17/tv_monitor01.mdl"})
local a = New("super_star_mask", {name = "Super Star Mask", price = 100000, slot = SH_SLOT_HEAD, mdl = "models/marioragdoll/super mario galaxy/star/star.mdl"}) a.scale = 1.28
local a = New("spotlight_head", {name = "Spotlight Head", price = 120000, slot = SH_SLOT_HEAD, mdl = "models/props_wasteland/light_spotlight01_lamp.mdl"}) a.scale = 0.91
local a = New("soccer_sall_mask", {name = "Soccer Ball Mask", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/props_phx/misc/soccerball.mdl"}) a.scale = 0.91
local a = New("snowman_mask", {name = "Snowman Head", price = 400000, slot = SH_SLOT_HEAD, mdl = "models/props/cs_office/Snowman_face.mdl"}) a.scale = 1.33
local a = New("smile_mask", {name = "Smile Mask", price = 100000, slot = SH_SLOT_HEAD, mdl = "models/smile/smile.mdl"})
local a = New("skull_mask", {name = "Skull Head", price = 1000000, slot = SH_SLOT_HEAD, mdl = "models/gibs/hgibs.mdl"}) a.scale = 2
local a = New("present_mask", {name = "Present Mask", price = 450000, slot = SH_SLOT_HEAD, mdl = "models/items/cs_gift.mdl"})
local a = New("pot_head", {name = "Pot Head", price = 450000, slot = SH_SLOT_HEAD, mdl = "models/props_junk/terracotta01.mdl"})
local a = New("no_entry_mask", {name = "No Entry Mask", price = 25000, slot = SH_SLOT_HEAD, mdl = "models/props_c17/streetsign004f.mdl"})
local a = New("monitor_head", {name = "Monitor Head", price = 95000, slot = SH_SLOT_HEAD, mdl = "models/props_lab/monitor02.mdl"})
local a = New("melon_head", {name = "Melon Head", price = 60000, slot = SH_SLOT_HEAD, mdl = "models/props_junk/watermelon01.mdl"})
local a = New("light_headed", {name = "Light Headed", price = 100000, slot = SH_SLOT_HEAD, mdl = "models/props_phx/misc/t_light_head.mdl"}) a.scale = 0.91
local a = New("hot_headed", {name = "Hot Head", price = 350000, slot = SH_SLOT_HEAD, mdl = "models/dynamite/dynamite.mdl"}) a.scale = 1.3
local a = New("gas_mask", {name = "Gas Mask", price = 350000, slot = SH_SLOT_HEAD, mdl = "models/nova/w_headgear.mdl"}) a.scale = 1.1
local a = New("egg_head", {name = "Egg Head", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/props_phx/misc/egg.mdl"}) a.scale = 5
local a = New("clock_mask", {name = "Clock Mask", price = 85000, slot = SH_SLOT_HEAD, mdl = "models/props_c17/clock01.mdl"}) a.scale = 1.3
local a = New("big_headed_male", {name = "Big Headed Male", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/maxofs2d/balloon_gman.mdl"}) a.scale = 1.5
local a = New("big_headed_female", {name = "Big Headed Female", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/maxofs2d/balloon_mossman.mdl"}) a.scale = 1.5



end


if (SH_ACC.Addons["tf2_head_items_1"]) then
  
  
--TF2 HATS
local a = New("tf2_bug_hat", {name = "[TF2] Bug Hat", price = 15000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_bug_hat_demo.mdl"}) a.scale = 0.96
local a = New("tf2_oculus_glasses_off", {name = "[TF2] Oculus Glasses Off", price = 150000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_class_oculus_heavy.mdl"})
local a = New("tf2_oculus_glasses_on", {name = "[TF2] Oculus Glasses On", price = 200000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_class_oculus_heavy_on.mdl"})
local a = New("tf2_skull_tophat", {name = "[TF2] Skull Tophat", price = 150000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_domination_2009_heavy.mdl"})
local a = New("tf2_skull_and_eye_tophat", {name = "[TF2] Skull And Eye Tophat", price = 100000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_domination_b_heavy.mdl"})
local a = New("tf2_brown_tophat", {name = "[TF2] Brown Tophat", price = 300000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_domination_heavy.mdl"})
local a = New("tf2_halo", {name = "[TF2] Halo", price = 180000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_halo.mdl"})
local a = New("tf2_reckoning_hat", {name = "[TF2] Reckoning Hat", price = 150000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_reckoning_bolgan_demo.mdl"})
local a = New("tf2_reckoning_eagonn_hat", {name = "[TF2] Reckoning Eagonn Hat", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_reckoning_eagonn_heavy.mdl"})
local a = New("tf2_pink_baby_night_time_hat", {name = "[TF2] Pink Baby Night Time Hat", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_scrib_l_heavy.mdl"})
local a = New("tf2_rubber_hat_with_headphones", {name = "[TF2] Rubber Hat With Headphones", price = 650000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/all_scrib_m_heavy.mdl"})
local a = New("tf2_robot_chicken_face_mask", {name = "[TF2] Robot Chicken Face Mask", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/as_robot_chicken_heavy_b.mdl"}) a.scale = 1.19
local a = New("tf2_birthday_hat", {name = "[TF2] Birthday Hat", price = 35000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/bdayhat_heavy.mdl"})
local a = New("tf2_brutal_hair", {name = "[TF2] Brutal Hair", price = 150000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/brutal_hair_heavy.mdl"}) a.scale = 0.9
local a = New("tf2_blue_chess_hat", {name = "[TF2] Blue Chess Hat", price = 400000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/chess_heavy_blue.mdl"})
local a = New("tf2_red_chess_hat", {name = "[TF2] Red Chess Hat", price = 400000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/chess_heavy_red.mdl"})
local a = New("tf2_football_helmet", {name = "[TF2] Football Helmet", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/crimecraft_helmet_heavy.mdl"})
local a = New("tf2_belltower_mask", {name = "[TF2] Belltower Mask", price = 1500000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/dex_belltower_demo.mdl"})
local a = New("tf2_belltower_open_mask", {name = "[TF2] Belltower Open Mask", price = 1000000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/dex_belltower_heavy.mdl"})
local a = New("tf2_dueler_mask", {name = "[TF2] Dueler Mask", price = 6000000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/dueler_heavy.mdl"}) a.scale = 0.8
local a = New("tf2_executioner_hood", {name = "[TF2] Executioner Hood", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/executionerhood_heavy.mdl"}) a.scale = 1
local a = New("tf2_generous_tophat", {name = "[TF2] Generous Tophat", price = 3000000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/generous_heavy.mdl"}) a.scale = 0.7
local a = New("tf2_bunny_rabit_hat", {name = "[TF2] Bunny Rabbit Hat", price = 100000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/soldier_ttg_max.mdl"})
local a = New("tf2_samurai_helmet", {name = "[TF2] Samurai Helmet", price = 1250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/soldier_samurai.mdl"})
local a = New("tf2_deadeye_mask", {name = "[TF2] Deadeye Mask", price = 3500000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/haunted_eyeball_hat_heavy.mdl"})
local a = New("tf2_spartan_helmet", {name = "[TF2] Spartan Helmet", price = 1250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/soldier_spartan.mdl"}) a.scale = 1.1
local a = New("tf2_metal_pot_helmet", {name = "[TF2] Metal Pot Helmet", price = 350000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/soldier_pot.mdl"}) a.scale = 0.9
local a = New("tf2_officer_hat", {name = "[TF2] Officer Hat", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/soldier_officer.mdl"}) a.scale = 1.25
local a = New("tf2_black_officer_hat", {name = "[TF2] Black Officer Hat", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/heavy/heavy_officer.mdl"})
local a = New("tf2_war_veterans_helmet", {name = "[TF2] War Veteran Helmet", price = 100000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/veteran_hat.mdl"})
local a = New("tf2_skull_horns_mask", {name = "[TF2] Skull Horns Mask", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/skull_horns_b3.mdl"}) a.scale = 1.1
local a = New("tf2_ram_skull_hat", {name = "[TF2] TF2 Ram Skull Hat", price = 130000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/merasmus_skull_heavy.mdl"})
local a = New("tf2_tribal_chieftain_hat", {name = "[TF2] Tribal Chieftain Hat", price = 1500000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/chief_rocketeer.mdl"})
local a = New("tf2_tribal_chief_hat", {name = "[TF2] Tribal Chief Hat", price = 1250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/heavy/heavy_big_chief.mdl"})
local a = New("tf2_notch_mask", {name = "[TF2] Notch Mask", price = 8000000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/notch_head_heavy.mdl"})
local a = New("tf2_treasure_chest_hat", {name = "[TF2] Treasure Chest Hat", price = 5000000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/treasure_hat_oct.mdl"}) a.scale = 1.03
local a = New("tf2_xmas_tree_hat", {name = "[TF2] XMass Tree Hat", price = 500000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/oh_xmas_tree_heavy.mdl"})
local a = New("tf2_parasite_hat", {name = "[TF2] Parasite Hat", price = 210000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/parasite_hat_heavy.mdl"}) a.scale = 1.33
local a = New("tf2_pcg_hat", {name = "[TF2] PCG Hat", price = 150000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/pcg_hat_heavy.mdl"}) a.scale = 1.3
local a = New("tf2_glowing_pumkin_mask", {name = "[TF2] Glowing Pumkin Mask", price = 500000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/pumpkin_hat_heavy.mdl"}) a.scale = 1.3
local a = New("tf2_soldier_beret", {name = "[TF2] Soldier Beret", price = 95000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/soldier_bill.mdl"})
local a = New("tf2_sarge_hat", {name = "[TF2] Sarge Hat", price = 120000, slot = SH_SLOT_HEAD, mdl = "models/player/items/soldier/soldier_sargehat.mdl"})
local a = New("tf2_flamenco_hat", {name = "[TF2] Flamenco Hat", price = 1000000, slot = SH_SLOT_HEAD, mdl = "models/player/items/pyro/fwk_pyro_flamenco.mdl"})
local a = New("tf2_toilet_plunger_hat", {name = "[TF2] Toilet Plunger Hat", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/pyro/pyro_plunger.mdl"}) a.scale = 1.25
local a = New("tf2_bird_cage_helmet", {name = "[TF2] Bird Cage Helmet", price = 350000, slot = SH_SLOT_HEAD, mdl = "models/player/items/pyro/fwk_pyro_birdcage.mdl"})
local a = New("tf2_chef_hat", {name = "[TF2] Chef Hat", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/pyro/pyro_chef_hat.mdl"}) a.scale = 1.1
local a = New("tf2_mexican_sombrero", {name = "[TF2] Mexican Sombrero", price = 500000, slot = SH_SLOT_HEAD, mdl = "models/player/items/pyro/fiesta_sombrero.mdl"}) a.scale = 1.21
local a = New("tf2_fiesta_sombrero", {name = "[TF2] Fiesta Sombrero", price = 1200000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/demo_fiesta_sombrero.mdl"})
local a = New("tf2_apple_arrow_hat", {name = "[TF2] Apple arrow hat", price = 450000, slot = SH_SLOT_HEAD, mdl = "models/player/items/sniper/sniper_applearrow.mdl"})
local a = New("tf2_stiched_hood", {name = "[TF2] Stitched Hood", price = 1250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/sniper/c_bet_brinkhood.mdl"})
local a = New("tf2_detective_hat", {name = "[TF2] Detective Hat", price = 110000, slot = SH_SLOT_HEAD, mdl = "models/player/items/spy/spy_detective_noir.mdl"})
local a = New("tf2_shogun_ninja_mask", {name = "[TF2] Shogun Ninja Mask", price = 500000, slot = SH_SLOT_HEAD, mdl = "models/player/items/spy/shogun_ninjamask.mdl"}) a.scale = 1.3
local a = New("tf2_red_eyepatch_bandana", {name = "[TF2] Red Eyepatch Bandana", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/player/items/spy/grfs_spy.mdl"}) a.scale = 1.1
local a = New("tf2_hardhat_potato", {name = "[TF2] Hardhat Potato", price = 165000, slot = SH_SLOT_HEAD, mdl = "models/player/items/spy/hardhat.mdl"}) a.scale = 1.1
local a = New("tf2_charmers_chapeau", {name = "[TF2] Charmers Chapeau", price = 1500000, slot = SH_SLOT_HEAD, mdl = "models/player/items/spy/spy_charmers_chapeau.mdl"}) a.scale = 1.2
local a = New("tf2_phantom_party_mask", {name = "[TF2] Phantom Party Mask", price = 85000, slot = SH_SLOT_HEAD, mdl = "models/player/items/spy/spy_party_phantom.mdl"})
local a = New("tf2_fireman_helmet", {name = "[TF2] Fireman Helmet", price = 200000, slot = SH_SLOT_HEAD, mdl = "models/player/items/pyro/fireman_helmet.mdl"})
local a = New("tf2_winter_beanie", {name = "[TF2] Winter Beanie", price = 25000, slot = SH_SLOT_HEAD, mdl = "models/player/items/pyro/pyro_beanie.mdl"}) a.scale = 1.1
local a = New("tf2_russian_ushanka", {name = "[TF2] Russian Ushanka", price = 150000, slot = SH_SLOT_HEAD, mdl = "models/player/items/heavy/heavy_ushanka.mdl"})
local a = New("tf2_white_cowboy_hat", {name = "[TF2] White Cowboy Hat", price = 100000, slot = SH_SLOT_HEAD, mdl = "models/player/items/engineer/engineer_cowboy_hat.mdl"})
local a = New("tf2_boxing_helmet", {name = "[TF2] Boxing Helmet", price = 300000, slot = SH_SLOT_HEAD, mdl = "models/player/items/heavy/pugilist_protector.mdl"})
local a = New("tf2_wrestling_mask", {name = "[TF2] Wrestling Mask", price = 150000, slot = SH_SLOT_HEAD, mdl = "models/player/items/heavy/wrestling_mask.mdl"})
local a = New("tf2_mighty_pirate_hat", {name = "[TF2] Mighty Pirate Hat", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/mighty_pirate.mdl"})
local a = New("tf2_king_crown", {name = "[TF2] King Crown", price = 10000000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/crown.mdl"})
local a = New("tf2_shogun_kabuto", {name = "[TF2] Shogun Kabuto", price = 1250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/demo_shogun_kabuto.mdl"})
local a = New("tf2_stunt_helmet", {name = "[TF2] Stunt Helmet", price = 300000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/stunt_helmet.mdl"})
local a = New("tf2_sultan_hat", {name = "[TF2] Sultan Hat", price = 1250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/demo_sultan_hat.mdl"})
local a = New("tf2_tricorne_hat", {name = "[TF2] Tricorne Hat", price = 100000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/demo_tricorne.mdl"})
local a = New("tf2_metal_horned_helmet", {name = "[TF2] Metal Horned Helmet", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/medic/medic_mtg.mdl"})
local a = New("tf2_wizard_hat", {name = "[TF2] Wizard Hat", price = 4000000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/trn_wiz_hat_soldier.mdl"})
local a = New("tf2_turntable_hat", {name = "[TF2] Turntable Hat", price = 1000000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/soundtrack_hat_soldier.mdl"})
local a = New("tf2_clocktower_hat", {name = "[TF2] Clocktower Hat", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/props_manor/clocktower_01.mdl"}) a.scale = 0.02
local a = New("tf2_huge_skull_helmet", {name = "[TF2] Huge Skull Helmet", price = 5000000, slot = SH_SLOT_HEAD, mdl = "models/props_viaduct_event/skull_island01.mdl"}) a.scale = 0.01
local a = New("tf2_2D_king_crown", {name = "[TF2] 2D King Crown", price = 5000000, slot = SH_SLOT_HEAD, mdl = "models/pickups/pickup_powerup_king.mdl"}) a.scale = 0.3
local a = New("tf2_viking_helmet", {name = "[TF2] Viking Helmet", price = 145000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/hero_academy_demo.mdl"})  
local a = New("tf2_bag_mask_1", {name = "[TF2] Bag Mask 1", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/halloween_bag_demo_heavy.mdl"}) a.scale = 1.23
local a = New("tf2_bag_mask_2", {name = "[TF2] Bag Mask 2", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/halloween_bag_engineer_heavy.mdl"}) a.scale = 1.23
local a = New("tf2_bag_mask_3", {name = "[TF2] Bag Mask 3", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/halloween_bag_heavy_heavy.mdl"}) a.scale = 1.23
local a = New("tf2_bag_mask_4", {name = "[TF2] Bag Mask 4", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/halloween_bag_medic_heavy.mdl"}) a.scale = 1.23
local a = New("tf2_bag_mask_5", {name = "[TF2] Bag Mask 5", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/halloween_bag_pyro_heavy.mdl"}) a.scale = 1.23
local a = New("tf2_bag_mask_6", {name = "[TF2] Bag Mask 6", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/halloween_bag_saxton_heavy.mdl"}) a.scale = 1.23
local a = New("tf2_bag_mask_7", {name = "[TF2] Bag Mask 7", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/halloween_bag_scout_heavy.mdl"}) a.scale = 1.23
local a = New("tf2_bag_mask_8", {name = "[TF2] Bag Mask 8", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/halloween_bag_sniper_heavy.mdl"}) a.scale = 1.23
local a = New("tf2_bag_mask_9", {name = "[TF2] Bag Mask 9", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/halloween_bag_soldier_heavy.mdl"}) a.scale = 1.23
local a = New("tf2_bag_mask_10", {name = "[TF2] Bag Mask 10", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/all_class/halloween_bag_spy_heavy.mdl"}) a.scale = 1.23
local a = New("tf2_japanese_hat", {name = "[TF2] Japanese Hat", price = 50000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/japan_hat.mdl"})
local a = New("tf2_japanese_monarch_hat", {name = "[TF2] Japanese Monarch Hat", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/japan_hat_monarch.mdl"})
local a = New("tf2_sash_hat", {name = "[TF2] Sash Hat", price = 185000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/fwk_demo_sashhat.mdl"})
local a = New("tf2_hallmark_hat", {name = "[TF2] Hallmark Hat", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/demo/hallmark.mdl"})
local a = New("tf2_mbsf_hat", {name = "[TF2] MBSF Hat", price = 125000, slot = SH_SLOT_HEAD, mdl = "models/player/items/engineer/mbsf_engineer.mdl"})
local a = New("tf2_welding_mask", {name = "[TF2] Welding Mask", price = 350000, slot = SH_SLOT_HEAD, mdl = "models/player/items/engineer/weldingmask.mdl"})
local a = New("tf2_artificial_brain", {name = "[TF2] Artificial Brain", price = 250000, slot = SH_SLOT_HEAD, mdl = "models/player/items/engineer/engineer_brain.mdl"})
local a = New("tf2_buckaroos_hat", {name = "[TF2] Buckaroos Hat", price = 125000, slot = SH_SLOT_HEAD, mdl = "models/player/items/engineer/engineer_buckaroos_hat.mdl"})
local a = New("tf2_lumberjack_hat", {name = "[TF2] Lumberjack Hat", price = 100000, slot = SH_SLOT_HEAD, mdl = "models/player/items/heavy/fwk_heavy_lumber.mdl"})
local a = New("tf2_fairy_tiara", {name = "[TF2] Fairy Tiara", price = 500000, slot = SH_SLOT_HEAD, mdl = "models/player/items/heavy/heavy_fairy_tiara.mdl"})
local a = New("tf2_robin_hood_hat", {name = "[TF2] Robin Hood Hat", price = 75000, slot = SH_SLOT_HEAD, mdl = "models/player/items/sniper/larrikin_robin.mdl"}) a.scale = 0.8


  
end

--------------------------------------------------------------------------------------------
-- Neck
--------------------------------------------------------------------------------------------

if (SH_ACC.Addons["neck_items"]) then

local a = New("lock_collar", {name = "Lock Collar", price = 25000, slot = SH_SLOT_NECK, mdl = "models/props_wasteland/prison_padlock001a.mdl"}) a.scale = 1.33
-- local a = New("grace", {name = "Gaben's Grace", price = 8000000, slot = SH_SLOT_NECK, mdl = "models/effects/vol_light64x128.mdl"}) a.scale = 0.75

end

if (SH_ACC.Addons["tf2_neck_items"]) then
-- TF2 Items
local a = New("tf2_robot_head_neckless_1", {name = "[TF2] Robot Head Neckless 1", price = 2500000, slot = SH_SLOT_NECK, mdl = "models/player/items/mvm_loot/heavy/fob_e_minigun.mdl"})
local a = New("tf2_robot_head_neckless_2", {name = "[TF2] Robot Head Neckless 2", price = 2500000, slot = SH_SLOT_NECK, mdl = "models/player/items/mvm_loot/heavy/fob_h_minigun.mdl"})
local a = New("tf2_robot_head_neckless_3", {name = "[TF2] Robot Head Neckless 3", price = 2500000, slot = SH_SLOT_NECK, mdl = "models/player/items/mvm_loot/heavy/fob_h_minigun_diamond.mdl"})
local a = New("tf2_red_scarf", {name = "[TF2] Red Scarf", price = 35000, slot = SH_SLOT_NECK, mdl = "models/player/items/all_class/all_winter_scarf_heavy.mdl"}) a.scale = 0.68

end

--------------------------------------------------------------------------------------------
-- Eyes
--------------------------------------------------------------------------------------------
if (SH_ACC.Addons["eye_items"]) then

local a = New("golden_spectacles", {name = "Golden Spectacles", price = 150000, slot = SH_SLOT_EYES, mdl = "models/player/items/spy/fwk_spy_specs.mdl"}) a.scale = 1.6
local a = New("summer_sunglasses", {name = "Summer Sunglasses", price = 50000, slot = SH_SLOT_EYES, mdl = "models/player/items/spy/summer_shades.mdl"})
local a = New("professor_glasses", {name = "Professor Glasses", price = 50000, slot = SH_SLOT_EYES, mdl = "models/player/items/spy/professor_speks.mdl"})
local a = New("tf2_shutter_sunglasses", {name = "[TF2] Shutter Sunglasses", price = 100000, slot = SH_SLOT_EYES, mdl = "models/player/items/demo/ttg_glasses.mdl"})
end


if (SH_ACC.Addons["tf2_eye_items"]) then
local a = New("tf2_cocktail_sunglasses", {name = "[TF2] Cocktail Sunglasses", price = 50000, slot = SH_SLOT_EYES, mdl = "models/player/items/demo/demo_fiesta_shades.mdl"})
local a = New("tf2_3d_glasses", {name = "[TF2] 3D Glasses", price = 25000, slot = SH_SLOT_EYES, mdl = "models/player/items/scout/fwk_scout_3d.mdl"}) a.scale = 1.01
local a = New("tf2_pyro_goggles", {name = "[TF2] Pyro Goggles", price = 75000, slot = SH_SLOT_EYES, mdl = "models/player/items/scout/scout_mtg.mdl"})
local a = New("tf2_sweet_sunglasses", {name = "[TF2] Sweet Sunglasses", price = 25000, slot = SH_SLOT_EYES, mdl = "models/workshop/player/items/all_class/jul13_sweet_shades_s1/jul13_sweet_shades_s1_soldier.mdl"})
local a = New("tf2_medic_beak_mask", {name = "[TF2] Medic Beak Mask", price = 75000, slot = SH_SLOT_EYES, mdl = "models/player/items/medic/medic_blighted_beak.mdl"})
local a = New("tf2_4_sunglasses", {name = "[TF2] Four Sunglasses for One", price = 25000, slot = SH_SLOT_EYES, mdl = "models/player/items/all_class/summer_deal_spy.mdl"})

end
--------------------------------------------------------------------------------------------
-- Mouth
--------------------------------------------------------------------------------------------

if (SH_ACC.Addons["mouth_items"]) then

local a = New("cigarette", {name = "Cigarette", price = 10000, slot = SH_SLOT_MOUTH, mdl = "models/pissedmeoff.mdl"})
local a = New("joint", {name = "Joint", price = 15000, slot = SH_SLOT_MOUTH, mdl = "models/katharsmodels/contraband/jointjes/jointjes.mdl"})

end


--------------------------------------------------------------------------------------------
-- Chest
--------------------------------------------------------------------------------------------

if (SH_ACC.Addons["chest_items"]) then

local a = New("weed_ghillie_suit", {name = "Weed Ghillie Suit", price = 1500000, slot = SH_SLOT_CHEST, mdl = "models/drugplants/weedflower.mdl"})

end

if (SH_ACC.Addons["tf2_chest_items"]) then
-- TF2 ITEMS
local a = New("tf2_3d_badge", {name = "[TF2] 3D Badge", price = 15000, slot = SH_SLOT_CHEST, mdl = "models/player/items/all_class/3a_badge.mdl"})
local a = New("tf2_cleaver_in_chest", {name = "[TF2] Cleaver In Chest", price = 250000, slot = SH_SLOT_CHEST, mdl = "models/player/items/all_class/headsplitter_demo.mdl"}) a.scale = 2

 end

--------------------------------------------------------------------------------------------
-- Back
--------------------------------------------------------------------------------------------

if (SH_ACC.Addons["back_items"]) then

local a = New("jetpack", {name = "Jetpack", price = 85000, slot = SH_SLOT_BACK, mdl = "models/thrusters/jetpack.mdl"}) a.scale = 2

local a = New("hot_air_balloon", {name = "Hot air balloon", price = 1000000, slot = SH_SLOT_BACK, mdl = "models/balloons/hot_airballoon.mdl"}) a.scale = 0.15
local a = New("wheelbarrow", {name = "Wheelbarrow", price = 550000, slot = SH_SLOT_BACK, mdl = "models/props_junk/wheebarrow01a.mdl"}) a.scale = 0.96
local a = New("tnt_backpack", {name = "TNT Backpack", price = 400000, slot = SH_SLOT_BACK, mdl = "models/dav0r/tnt/tnttimed.mdl"}) a.scale = 1.6
local a = New("swan_dive_rocket_backpack", {name = "Swan dive rocket backpack", price = 10000000, slot = SH_SLOT_BACK, mdl = "models/props_phx/amraam.mdl"}) a.scale = 0.5
local a = New("merry_go_round_backpack", {name = "Merry Go Round backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/props_c17/playground_carousel01.mdl"}) a.scale = 0.3
local a = New("shovel", {name = "Shovel", price = 35000, slot = SH_SLOT_BACK, mdl = "models/props_junk/shovel01a.mdl"}) a.scale = 1.25
local a = New("shelf_backpack", {name = "Shelf Backpack", price = 65000, slot = SH_SLOT_BACK, mdl = "models/props_c17/shelfunit01a.mdl"}) a.scale = 0.3
local a = New("rusty_blade", {name = "Rusty blade", price = 550000, slot = SH_SLOT_BACK, mdl = "models/props_c17/trappropeller_blade.mdl"}) a.scale = 0.6
local a = New("rocket_backpack", {name = "Rocket Backpack", price = 1000000, slot = SH_SLOT_BACK, mdl = "models/props_phx/rocket1.mdl"}) a.scale = 0.18
local a = New("navel_nuke_backpack", {name = "Navel Nuke Backpack", price = 1000000, slot = SH_SLOT_BACK, mdl = "models/props_phx/torpedo.mdl"}) a.scale = 0.5
local a = New("small_toy_jet_backpack", {name = "Small Toy Jet Backpack", price = 15000000, slot = SH_SLOT_BACK, mdl = "models/xqm/jetbody3_s2.mdl"}) a.scale = 0.1
local a = New("large_jet_backpack", {name = "Jet Backpack", price = 15000000, slot = SH_SLOT_BACK, mdl = "models/xqm/jetbody3_s2.mdl"}) a.scale = 0.2
local a = New("infected_needle", {name = "Infected Needle", price = 750000, slot = SH_SLOT_BACK, mdl = "models/katharsmodels/syringe_out/syringe_out.mdl"}) a.scale = 5
local a = New("huge_wrench", {name = "Huge wrench", price = 40000, slot = SH_SLOT_BACK, mdl = "models/props_c17/tools_wrench01a.mdl"}) a.scale = 3
local a = New("health_kit_backpack", {name = "Health Kit backpack", price = 100000, slot = SH_SLOT_BACK, mdl = "models/props_combine/health_charger001.mdl"}) a.scale = 0.7
local a = New("gravestone_backpack", {name = "Gravestone Backpack", price = 70000, slot = SH_SLOT_BACK, mdl = "models/props_c17/gravestone002a.mdl"}) a.scale = 0.8
local a = New("donute_backpack", {name = "Donut Backpack", price = 120000, slot = SH_SLOT_BACK, mdl = "models/noesis/donut.mdl"}) a.scale = 1.51
local a = New("baby_backpack", {name = "Baby Backpack", price = 2000000, slot = SH_SLOT_BACK, mdl = "models/props_c17/doll01.mdl"}) a.scale = 3
local a = New("electric_guitar", {name = "Electric Guitar", price = 65000, slot = SH_SLOT_BACK, mdl = "models/props_phx/misc/fender.mdl"})
local a = New("doll_backpack", {name = "Doll Backpack", price = 85000, slot = SH_SLOT_BACK, mdl = "models/maxofs2d/companion_doll.mdl"})
local a = New("hotdog_backpack", {name = "Hotdog Backpack", price = 65000, slot = SH_SLOT_BACK, mdl = "models/food/hotdog.mdl"}) a.scale = 3.31
local a = New("cigarette_backpack", {name = "Cigarette backpack", price = 110000, slot = SH_SLOT_BACK, mdl = "models/boxopencigshib.mdl"}) a.scale = 5
local a = New("chess_board_backpack", {name = "Chess board Backpack", price = 65000, slot = SH_SLOT_BACK, mdl = "models/props_phx/games/chess/board.mdl"}) a.scale = 0.1
local a = New("cheeseburger_backpack", {name = "Cheeseburger Backpack", price = 110000, slot = SH_SLOT_BACK, mdl = "models/food/burger.mdl"}) a.scale = 3.27
local a = New("cannon_pack", {name = "Cannon pack", price = 2000000, slot = SH_SLOT_BACK, mdl = "models/props_phx/cannon.mdl"}) a.scale = 0.2
local a = New("camera_backpack", {name = "Camera Backpack", price = 95000, slot = SH_SLOT_BACK, mdl = "models/maxofs2d/camera.mdl"}) a.scale = 3
local a = New("bike_backpack", {name = "Bike Backpack", price = 45000, slot = SH_SLOT_BACK, mdl = "models/props_junk/bicycle01a.mdl"}) a.scale = 0.68
local a = New("bathtub_backpack", {name = "Bathtub Backpack", price = 95000, slot = SH_SLOT_BACK, mdl = "models/props_interiors/bathtub01a.mdl"}) a.scale = 0.54
local a = New("banana_bunch_backpack", {name = "Banana Bunch Backpack", price = 120000, slot = SH_SLOT_BACK, mdl = "models/props/cs_italy/bananna_bunch.mdl"}) a.scale = 2.5
local a = New("banana_backpack", {name = "Banana Backpack", price = 95000, slot = SH_SLOT_BACK, mdl = "models/props/cs_italy/bananna.mdl"}) a.scale = 2.5
local a = New("bag_of_weed", {name = "Bag Of Weed", price = 350000, slot = SH_SLOT_BACK, mdl = "models/katharsmodels/contraband/zak_wiet/zak_wiet.mdl"}) a.scale = 5
local a = New("bag_of_meth", {name = "Bag Of Meth", price = 400000, slot = SH_SLOT_BACK, mdl = "models/katharsmodels/contraband/metasync/blue_sky.mdl"}) a.scale = 5
local a = New("bag_of_dirt", {name = "Bag Of Dirt", price = 300000, slot = SH_SLOT_BACK, mdl = "models/katharsmodels/contraband/zak_wiet/zak_seed.mdl"}) a.scale = 5
local a = New("suitcase_backpack", {name = "Suitcase Backpack", price = 300000, slot = SH_SLOT_BACK, mdl = "models/props_c17/suitcase_passenger_physics.mdl"})
local a = New("bird_man_backpack", {name = "Bird Man Backpack", price = 15000000, slot = SH_SLOT_BACK, mdl = "models/seagull.mdl"}) a.scale = 3.04
local a = New("i_like_trains_backpack", {name = "I Like Trains Backpack", price = 450000, slot = SH_SLOT_BACK, mdl = "models/props_trainstation/train001.mdl"}) a.scale = 0.08
local a = New("drug_lab_backpack", {name = "Drug Lab Backpack", price = 75000, slot = SH_SLOT_BACK, mdl = "models/props_lab/crematorcase.mdl"}) a.scale = 0.59
local a = New("g_backpack", {name = "G Backpack", price = 25000, slot = SH_SLOT_BACK, mdl = "models/maxofs2d/logo_gmod_b.mdl"}) a.scale = 0.22
local a = New("icefuse_back_pack", {name = "Icefuse Backpack", price = 5000, slot = SH_SLOT_BACK, mdl = "models/props/icefuse/icefuse_logo_text_base.mdl"}) a.scale = 0.26
local a = New("propeller_fan_backpack", {name = "Propeller Fan Backpack", price = 75000, slot = SH_SLOT_BACK, mdl = "models/maxofs2d/hover_propeller.mdl"}) a.scale = 1.28
local a = New("flashlight_backpack", {name = "Flashlight Backpack", price = 65000, slot = SH_SLOT_BACK, mdl = "models/maxofs2d/lamp_flashlight.mdl"}) a.scale = 2.2
local a = New("charred_corpse_cackpack", {name = "Charred Corpse Backpack", price = 13000000, slot = SH_SLOT_BACK, mdl = "models/humans/charple03.mdl"})
local a = New("battle_grounds_pan", {name = "Battle Grounds Pan", price = 25000, slot = SH_SLOT_BACK, mdl = "models/props_c17/metalpot002a.mdl"}) a.scale = 1.2
local a = New("flakshell_backpack", {name = "Flakshell Backpack", price = 50000, slot = SH_SLOT_BACK, mdl = "models/props_phx/misc/flakshell_big.mdl"})

-- Weapons 
local a = New("rounded_shovel_back_attachment", {name = "Rounded Shovel Back Attachment", price = 125000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_spade.mdl"}) a.scale = 1.65
local a = New("large_revolver_backpack", {name = "Large Revolver Backpack", price = 200000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_357.mdl"}) a.scale = 4
local a = New("large_dual_pistols_backpack", {name = "Large Dual Pistols Backpack", price = 350000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_pist_elite.mdl"}) a.scale = 3
local a = New("large_ak47_backpack", {name = "Large AK47 Backpack", price = 650000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_rif_ak47.mdl"}) a.scale = 2
local a = New("large_sg550_backpack", {name = "Large SG550 Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_snip_sg550.mdl"}) a.scale = 2
local a = New("large_scout_backpack", {name = "Large Scout Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_snip_scout.mdl"}) a.scale = 2
local a = New("large_g3sg1_backpack", {name = "Large G3sg1 Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_snip_g3sg1.mdl"}) a.scale = 2
local a = New("large_awp_backpack", {name = "Large AWP Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_snip_awp.mdl"}) a.scale = 1.6
local a = New("large_ump45_backpack", {name = "Large UMP45 Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_smg_ump45.mdl"}) a.scale = 1.6
local a = New("large_smg_tmp_backpack", {name = "Large SMG TMP Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_smg_tmp.mdl"}) a.scale = 1.6
local a = New("large_smg_p90_backpack", {name = "Large SMG P90 Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_smg_p90.mdl"}) a.scale = 1.6
local a = New("large_smg_mp5_backpack", {name = "Large SMG MP5 Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_smg_mp5.mdl"}) a.scale = 1.6
local a = New("large_mac10_backpack", {name = "Large Mac 10 Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_smg_mac10.mdl"}) a.scale = 2.5
local a = New("large_xm1014_backpack", {name = "Large XM1014 Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_shot_xm1014.mdl"}) a.scale = 2
local a = New("large_m3super90_backpack", {name = "Large M3Super90 Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_shot_m3super90.mdl"}) a.scale = 2
local a = New("large_sg552_backpack", {name = "Large SG552 Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_rif_sg552.mdl"}) a.scale = 2
local a = New("large_m4a1_silencer_backpack", {name = "Large M4A1 Silencer Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_rif_m4a1_silencer.mdl"}) a.scale = 2
local a = New("large_m4a1_backpack", {name = "Large M4A1 Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_rif_m4a1.mdl"}) a.scale = 2
local a = New("large_galil_backpack", {name = "Large Galil Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_rif_galil.mdl"}) a.scale = 2
local a = New("large_famas_backpack", {name = "Large Famas Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/weapons/w_rif_famas.mdl"}) a.scale = 2

end

if (SH_ACC.Addons["tf2_back_items"]) then
-- TF2 ITEMS
local a = New("tf2_penguin_backpack", {name = "[TF2] Penguin Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/player/items/all_class/all_penguin.mdl"}) a.scale = 3
local a = New("tf2_penguin_pirate_backpack", {name = "[TF2] Penguin Pirate Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/player/items/all_class/all_penguin_demo.mdl"}) a.scale = 3
local a = New("tf2_penguin_pyro_backpack", {name = "[TF2] Penguin Pyro Backpack", price = 500000, slot = SH_SLOT_BACK, mdl = "models/player/items/all_class/all_penguin_pyro.mdl"}) a.scale = 3
local a = New("tf2_duck_with_hat_backpack", {name = "[TF2] Duck With Hat Backpack", price = 250000, slot = SH_SLOT_BACK, mdl = "models/player/items/all_class/hm_duck_sniper.mdl"}) a.scale = 2.16
local a = New("tf2_knife_shield", {name = "[TF2] Knife Shield", price = 250000, slot = SH_SLOT_BACK, mdl = "models/player/items/sniper/knife_shield.mdl"})
local a = New("tf2_croc_shield", {name = "[TF2] Croc Shield", price = 500000, slot = SH_SLOT_BACK, mdl = "models/player/items/sniper/croc_shield.mdl"})
local a = New("tf2_boombox_backpack", {name = "[TF2] Boombox Backpack", price = 3000000, slot = SH_SLOT_BACK, mdl = "models/player/items/scout/boombox.mdl"}) a.scale = 2.04
local a = New("tf2_wooden_guitar", {name = "[TF2] Wooden Guitar", price = 250000, slot = SH_SLOT_BACK, mdl = "models/player/items/engineer/guitar.mdl"}) a.scale = 1.25
local a = New("tf2_missile_launchpad_back_attachment", {name = "[TF2] Missile Launchpad Back Attachment", price = 650000, slot = SH_SLOT_BACK, mdl = "models/props_granary/rocket_launchpad3.mdl"}) a.scale = 0.15
local a = New("tf2_bombonomicon_backpack", {name = "[TF2] Bombonomicon Backpack", price = 6000000, slot = SH_SLOT_BACK, mdl = "models/player/items/all_class/bombonomicon.mdl"}) a.scale = 4.15
local a = New("tf2_coffin_backpack", {name = "[TF2] Coffin Backpack", price = 750000, slot = SH_SLOT_BACK, mdl = "models/props_manor/coffin_01.mdl"}) a.scale = 0.5
local a = New("tf2_pissed_off_gargoyle_backpack", {name = "[TF2] Pissed off Gargoyle Backpack", price = 1500000, slot = SH_SLOT_BACK, mdl = "models/props_manor/gargoyle_01.mdl"}) a.scale = 0.4
local a = New("tf2_gold_bar_backpack", {name = "[TF2] Gold Bar Backpack", price = 3000000, slot = SH_SLOT_BACK, mdl = "models/props_mining/ingot001.mdl"}) a.scale = 3
local a = New("tf2_chainsaw_backpack", {name = "[TF2] Chainsaw Backpack", price = 750000, slot = SH_SLOT_BACK, mdl = "models/props_swamp/chainsaw.mdl"})
local a = New("tf2_mini_nuke_backpack", {name = "[TF2] Mini Nuke Backpack", price = 400000, slot = SH_SLOT_BACK, mdl = "models/props_trainyard/cart_bomb_separate.mdl"}) a.scale = 0.5
local a = New("tf2_kings_cape", {name = "[TF2] Kings Cape", price = 5000000, slot = SH_SLOT_BACK, mdl = "models/player/items/demo/tw_kingcape.mdl"})
local a = New("tf2_fairy_wings", {name = "[TF2] Fairy Wings", price = 500000, slot = SH_SLOT_BACK, mdl = "models/player/items/heavy/heavy_fairy_wings.mdl"}) a.scale = 1.5

  
end









--------------------------------------------------------------------------------------------
-- Pelvis
--------------------------------------------------------------------------------------------

if (SH_ACC.Addons["pelvis_items"]) then

local a = New("black_cock", {name = "Black Cock", price = 5000000, slot = SH_SLOT_PELVIS, mdl = "models/jaanus/dildo.mdl"}) a.scale = 1.28
-- local a = New("black_hole", {name = "Black hole", price = 25000000, slot = SH_SLOT_PELVIS, mdl = "models/effects/portalrift.mdl"}) a.scale = 0.07

local a = New("life_preserver", {name = "Life Preserver", price = 25000, slot = SH_SLOT_PELVIS, mdl = "models/props/de_nuke/lifepreserver.mdl"}) a.scale = 0.63
local a = New("tf2_fairy_tutu", {name = "[TF2] Fairy Tutu", price = 500000, slot = SH_SLOT_PELVIS, mdl = "models/player/items/heavy/heavy_fairy_tutu.mdl"}) a.scale = 0.85



end























--[[

-- Only admins may buy this hat, and this hat will only render when their team name is "Admin On Duty"
local a = New("tophat", {name = "Top Hat", price = 5000, slot = SH_SLOT_HEAD, mdl = "models/player/items/humans/top_hat.mdl"})
a.jobs = {
	["Admin On Duty"] = true,
}
a.usergroups = {
	["admin"] = true,
	["superadmin"] = true,
}

--]]