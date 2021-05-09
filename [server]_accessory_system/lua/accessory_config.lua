--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_accessory_system/lua/accessory_config.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

/****
	GENERAL CONFIGURATION
	General
****/

-- Whether to use the server's database (sv.db) or MySQL. Restart the map after changing database mode.
-- WARNING: You cannot transfer items from one database to another.
-- 0: sv.db (local)
-- 1: MySQL via gmsv_mysqloo (https://facepunch.com/showthread.php?t=1515853)
--	  Configure the DB settings in accessory/sv_database.lua
-- 2: MySQL via gmsv_tmysql4
--	  Configure the DB settings in accessory/sv_database.lua
SH_ACC.DatabaseMode = 1

-- Set to true to allow players to run a command (defined below) to bring up the menu.
-- AKA players can change their accessories at any time given.
SH_ACC.FreeAccess = false

-- Commands to open the accessory menu. Only works when FreeAccess is true.
-- ! is automatically replaced to / so you don't have to include them.
SH_ACC.FreeAccessCommand = {
	"/accessory",
	"/accessories",
	"/acc",
}

-- Which usergroups are allowed to use the system.
-- Leave the table empty to allow everyone to use the add-on.
SH_ACC.AllowedUsergroups = {
	// Remove the -- below to allow only "vip" players to use the add-on.
	-- ["vip"] = true,
}

-- Fraction of an accessory's price.
-- Anything below 0 will result in unintended behavior!
SH_ACC.PurchaseFrac = 1

-- Different purchase price fractions for specific usergroups.
-- If available, this overrides the PurchaseFrac option but is overriden by PurchaseFracPlayers.
SH_ACC.PurchaseFracUsergroups = {
	-- ["admin"] = 0.1,
	-- ["superadmin"] = 0.1,
}

-- Different purchase price fractions for specific players.
-- SteamID only.
-- If available, this overrides the PurchaseFrac and PurchaseFracUsergroups options.
SH_ACC.PurchaseFracPlayers = {
	-- ["STEAM_0:0:0"] = 0.1,
}

-- How many accessories a player can wear at a time.
-- Set to 0 to remove the limit.
SH_ACC.MaximumWearable = 0

-- Different wearable accessory limit for specific usergroups.
-- If available, this overrides the MaximumWearable option but is overriden by MaximumWearablePlayers.
SH_ACC.MaximumWearableUsergroups = {
	-- ["admin"] = 100,
	-- ["superadmin"] = 100,
}

-- Different wearable accessory limit for specific players.
-- SteamID only.
-- If available, this overrides the MaximumWearable and MaximumWearableUsergroups options.
SH_ACC.MaximumWearablePlayers = {
	-- ["STEAM_0:0:0"] = 100,
}

-- Disable key shortcuts when using the shop.
-- TAB = toggle navigation bar
-- 1-9 = browse categories
-- Ctrl+F = open search bar
-- MOUSE4 (in adjust menu) = close adjust menu
SH_ACC.DisableKeyShortcuts = false

-- Disable the info tab.
-- Shows name, credits, version, add-ons enabled, how many accessories are installed and a link to the ScriptFodder page.
SH_ACC.DisableInfoTab = true

-- Where to spawn Accessories Vendor NPCs on the map.
-- Use the "sh_accessories_mypos" console command to get your current position and angle.
SH_ACC.NPCSpawns = {
	-- {pos = Vector(0, 0, 0), ang = Angle(0, 0, 0)},
}

-- How long equipping an accessory from the SWEP takes in seconds.
SH_ACC.DelayedEquipTime = 6

-- How long unequipping an accessory from the SWEP takes in seconds.
SH_ACC.DelayedUnequipTime = 1

-- Whether to send the (interface) content used by the script via Steam Workshop or FastDL.
SH_ACC.UseWorkshop = false

/****
	GENERAL CONFIGURATION
	Adjusting
****/

-- Should players be allowed to adjust their accessories?
-- Adjusting is moving, rotating or scaling an accessory slightly in case it doesn't or barely fits a player model.
SH_ACC.AllowAdjusting = true

-- Specific usergroups allowed (or not) to adjust accessories.
-- If available, this overrides the AllowAdjusting option but is overriden by AllowAdjustingPlayers.
SH_ACC.AllowAdjustingUsergroups = {
	-- ["admin"] = true,
	-- ["superadmin"] = true,
}

-- Allow specific players to adjust or not.
-- SteamID only.
-- If available, this overrides the AllowAdjusting and AllowAdjustingUsergroups options.
SH_ACC.AllowAdjustingPlayers = {
	-- ["STEAM_0:0:0"] = false,
}

-- Factor determining how much a player can adjust their accessory.
-- The smaller the value, the less the player will be able to adjust their accessory.
-- The higher, the (potentially) further they can move, rotate or scale it from their body, resulting in hilarious consequences.
-- Anything below or equal to 0 will produce unexpected results, so don't do that.
SH_ACC.AdjustFactor = 5

-- Different adjusting factors for specific usergroups.
-- If available, this overrides the AdjustFactor option but is overriden by AdjustFactorPlayers.
SH_ACC.AdjustFactorUsergroups = {
	-- ["admin"] = 100,
	-- ["superadmin"] = 100,
}

-- Different adjusting factors for specific players.
-- SteamID only.
-- If available, this overrides the AdjustFactor and AdjustFactorUsergroups options.
SH_ACC.AdjustFactorPlayers = {
	-- ["STEAM_0:0:0"] = 100,
}

-- How much translating, rotating and scaling are affected by adjustment.
-- Don't touch unless you've got a good reason to.
SH_ACC.IndividiualAdjustFactor = {
	translate = 0.5,
	rotate = 1,
	scale = 0.01,
}

/****
	GENERAL CONFIGURATION
	Selling
****/

-- Can players sell their accessories?
SH_ACC.AllowSelling = false

-- Allow specific usergroups to sell or not.
-- If available, this overrides the AllowSelling option but is overriden by AllowSellingPlayers.
SH_ACC.AllowSellingUsergroups = {
	-- ["admin"] = true,
	-- ["superadmin"] = true,
}

-- Allow specific players to sell or not.
-- SteamID only.
-- If available, this overrides the AllowSelling and AllowSellingUsergroups options.
SH_ACC.AllowSellingPlayers = {
	-- ["STEAM_0:0:0"] = false,
}

-- Fraction of money players get by selling an accessory
-- Anything below 0 will result in unintended behavior!
SH_ACC.SellFrac = 0.5

-- Different sell value fractions for specific usergroups.
-- If available, this overrides the SellFrac option but is overriden by SellFracPlayers.
SH_ACC.SellFracUsergroups = {
	-- ["vip"] = 0.75,
	-- ["admin"] = 1,
	-- ["superadmin"] = 1,
}

-- Different sell value fractions for specific players.
-- SteamID only.
-- If available, this overrides the SellFrac and SellFracUsergroups options.
SH_ACC.SellFracPlayers = {
	-- ["STEAM_0:0:0"] = 100,
}

/****
	GENERAL CONFIGURATION
	Rendering
****/

-- Draw accessories on player bodies
SH_ACC.DrawOnBodies = false

-- Draw accessories on arrested players
SH_ACC.DrawOnArrested = false

-- Draw accessories even if they can't find the player's bone
-- (often they will be badly positionned, like real bad)
SH_ACC.DisplayWithEmptyBone = false

-- Maximum distance at which the accessories can be rendered. In units.
-- Set to 0 for infinite distance
SH_ACC.RenderDistance = 450

/****
	GENERAL CONFIGURATION
	Interface
****/

-- Blur the blackground in black when the menu is open
SH_ACC.DrawBackgroundBlur = true

-- Show messages when equipping/unequipping something
SH_ACC.EquipMessages = true

-- Categories displayed in the Shop.
-- Here you can move categories around or even delete them.
SH_ACC.ShopCategories = {
	{text = "pets",   slot = SH_SLOT_PETS, icon = Material("shenesis/accessory/backpack.png", "noclamp smooth")},

	{text = "head",   slot = SH_SLOT_HEAD, icon = Material("shenesis/accessory/hat.png", "noclamp smooth")},
	{text = "neck",   slot = SH_SLOT_NECK, icon = Material("shenesis/accessory/scarf.png", "noclamp smooth")},
	{text = "eyes",   slot = SH_SLOT_EYES, icon = Material("shenesis/accessory/sunglasses.png", "noclamp smooth")},
	{text = "mouth",  slot = SH_SLOT_MOUTH, icon = Material("shenesis/accessory/mask.png", "noclamp smooth")},
	{text = "chest",  slot = SH_SLOT_CHEST, icon = Material("shenesis/accessory/mask.png", "noclamp smooth")},
	{text = "back",   slot = SH_SLOT_BACK, icon = Material("shenesis/accessory/backpack.png", "noclamp smooth")},
	{text = "pelvis", slot = SH_SLOT_PELVIS, icon = Material("icon16/package.png", "noclamp smooth")},
}

/****
	STYLE CONFIGURATION
****/

-- Font to use for normal text throughout the interface.
SH_ACC.Font = "Circular Std Medium"

-- Font to use for bold text throughout the interface.
SH_ACC.FontBold = "Circular Std Bold"

-- Color sheet. Only modify if you know what you're doing
SH_ACC.Style = {
	header = Color(10, 10, 10, 200),
	bg = Color(10, 10, 10, 170),
	inbg = Color(44, 62, 80, 150),

	close_hover = Color(231, 76, 60),
	hover = Color(255, 255, 255, 10),
	hover2 = Color(255, 255, 255, 5),

	text = Color(255, 255, 255),
	text_down = Color(0, 0, 0),
	can_afford = Color(46, 204, 17),
	cant_afford = Color(231, 76, 60),
	equipped = Color(52, 152, 219),
	possessed = Color(241, 196, 15),
	restricted = Color(230, 126, 34),

	menu = Color(10, 10, 10, 150),
}

/****
	LANGUAGE CONFIGURATION
****/

-- Names corresponding to each accessory slot.
-- You shouldn't have to modify this. Modify the Language table instead.
-- If you (manage to) add a new slot, make sure to register it here or the add-on will not work!
SH_ACC.SlotText = {
	[SH_SLOT_PETS] = "pets",

	[SH_SLOT_HEAD] = "head",
	[SH_SLOT_NECK] = "neck",
	[SH_SLOT_EYES] = "eyes",
	[SH_SLOT_MOUTH] = "mouth",
	[SH_SLOT_CHEST] = "chest",
	[SH_SLOT_BACK] = "back",
	[SH_SLOT_PELVIS] = "pelvis",
}

-- Various strings used throughout the add-on. Change them to your language here.
-- %s and %d are special strings replaced with relevant info, keep them in the string!

-- French translation: http://pastebin.com/aHGFnN5A

SH_ACC.Language = {
	accessory_vendor = "Accessories Vendor",
	accessory_changer = "Accessory Changer",

	toggle = "Toggle",
	purchase = "Purchase",
	sell = "Sell",
	equip = "Equip",
	unequip = "Unequip",
	adjust = "Adjust",
	adjust_desc = "Adjusting your accessory allows you to translate, rotate or scale the model a little in case it doesn't fit perfectly. Note that adjustments apply on all playermodels.",
	quick_switch = "Quick switching..",
	accessory_limit = "Accessory limit",
	search = "Search",

	none = "None",
	free = "Free",
	equipped = "Equipped",
	possessed = "Possessed",
	restricted = "Restricted",
	job_specific = "Job Specific",
	yes = "Yes",
	no = "No",
	info = "Info",

	translate = "Translate", -- "Move"
	rotate = "Rotate",
	scale = "Scale",
	reset_adjustments = "Reset adjustments",

	confirm_action = "Confirm action",
	buy_confirm = "Do you really want to buy the %s accessory for %s?",
	sell_confirm = "Do you really want to sell the %s accessory for %s? It will be automatically unequipped.",
	this_accessory_covers_x = "Fills multiple slots: %s",
	failed_to_perform_action = "Failed to perform action.",
	cant_afford_x = "You don't have enough money to purchase %s!",
	reached_acc_limit = "You have reached the limit of accessories you can wear.",
	cannot_purchase_accessory = "Cannot purchase accessory",
	cannot_sell_accessory = "Cannot sell accessory",
	bad_usergroup = "Your user group does not allow you to wear accessories.",

	you_equipped_x = "You now wear %s.",
	you_equipped_x_swapped_with_y = "You now wear %s (swapped with %s).",
	you_unequipped_x = "You no longer wear %s.",
	you_purchased_x = "You have purchased %s!",
	you_sold_x_for_y = "You have sold %s for %s!",
	equipping_to_acc = "Equipping %s, please wait..",
	unequipping_acc = "Taking %s off, please wait..",

	-- model panel instructions
	left_click_help = "LEFT CLICK: Rotate horizontally",
	right_click_help = "RIGHT CLICK: Zoom",
	middle_click_help = "MIDDLE MOUSE BUTTON: Drag view",

	-- slots
	overview = "Overview",

	pets = "Pets",

	head = "Head",
	neck = "Neck",
	eyes = "Eyes",
	mouth = "Mouth",
	chest = "Chest",
	back = "Back",
	pelvis = "Pelvis",
}