	SLASH_RELOADUI1 = "/rl"; -- new slash command for reloading UI
	SlashCmdList.RELOADUI = ReloadUI;






--[[

	local favoriteNumber = 42 -- A user-configurable setting

	-- Create the dropdown, and configure its appearance
	local dropDown = CreateFrame("FRAME", "WPDemoDropDown", UIParent, "UIDropDownMenuTemplate")
	dropDown:SetPoint("LEFT", UIParent, "LEFT", 0, -500)
	UIDropDownMenu_SetWidth(dropDown, 80)
	UIDropDownMenu_SetText(dropDown, "Emote: " .. favoriteNumber)
	
	-- Create and bind the initialization function to the dropdown menu
	UIDropDownMenu_Initialize(dropDown, function(self, level, menuList)
	 local info = UIDropDownMenu_CreateInfo()
	 if (level or 1) == 1 then
	  -- Display the 0-9, 10-19, ... groups
	  for i=0,4 do
	   info.text, info.checked = i*10 .. " - " .. (i*10+9), favoriteNumber >= i*10 and favoriteNumber <= (i*10+9)
	   info.menuList, info.hasArrow = i, true
	   UIDropDownMenu_AddButton(info)
	  end
	
	 else
	  -- Display a nested group of 10 favorite number options
	  info.func = self.SetValue
	  for i=menuList*10, menuList*10+9 do
	   info.text, info.arg1, info.checked = i, i, i == favoriteNumber
	   UIDropDownMenu_AddButton(info, level)
	  end
	 end
	end)
	
	-- Implement the function to change the favoriteNumber
	function dropDown:SetValue(newValue)
	 favoriteNumber = newValue
	 -- Update the text; if we merely wanted it to display newValue, we would not need to do this
	 UIDropDownMenu_SetText(dropDown, "Favorite number: " .. favoriteNumber)
	 -- Because this is called from a sub-menu, only that menu level is closed by default.
	 -- Close the entire menu with this next call
	 CloseDropDownMenus()
	end


--]]


local emote = CreateFrame("Button", "MyButton", UIParent, "UIPanelButtonTemplate")
emote:SetSize(60 ,20) -- width, height
emote:SetText("Emote")
emote:SetPoint("LEFT", UIParent, "LEFT", 430, -270)
emote:SetScript("OnClick", function()

	local editbox=ChatEdit_ChooseBoxForSend(DEFAULT_CHAT_FRAME);--  Get an editbox
ChatEdit_ActivateChat(editbox);--   Show the editbox
editbox:SetText("/menu");-- Command goes here
ChatEdit_OnEnterPressed(editbox);


end)


local dropdown = CreateFrame("Frame", "MyMenuFrame", nil, "UIDropDownMenuTemplate")
local menuTable = {}
local line, data, submenu = nil, nil, nil
 
local function createMenuLine(data)
  local line = {}
  if not data then return line end
  line.text = data.text or nil
  line.isTitle = data.isTitle or nil
  line.notCheckable = data.notCheckable or nil
  line.notClickable = data.notClickable or nil
  line.keepShownOnClick = data.keepShownOnClick or nil
  line.hasArrow = data.hasArrow or nil 
  line.func = data.func or nil
  line.menuList = data.menuList or nil
  return line
end
 
local function createDelimLine()
  --split line
  local delim = "----------------------"
  data = { text = delim, notCheckable = true, notClickable = true }
  line = createMenuLine(data)
  return line
end
 
local function createMenu()
 
  --title
  data = { text = "Emotes", isTitle = true, notCheckable = true, notClickable = true, keepShownOnClick = true }
  line = createMenuLine(data)
  table.insert(menuTable,line)
 
  --add delimiter
  line = createDelimLine()
  table.insert(menuTable,line)
 




    --generate sub menu
anim = {}      
    data = { text = "Animation/Voice", isTitle = true, notCheckable = true, notClickable = true, keepShownOnClick = true }
    line = createMenuLine(data)
    table.insert(anim,line)
    line = createDelimLine()
	table.insert(anim,line)
	

  --add submenu to menuTable
  	data = { text = "Animation/Voice", notCheckable = true, hasArrow = true, menuList = anim, keepShownOnClick = true }
 	line = createMenuLine(data)
	table.insert(menuTable,line)



------------------------------
--letter sub menus
------------------------------
line = createDelimLine()
table.insert(menuTable,line)
--special emotes
data = { text = "Heal me", func = function() DoEmote(EMOTE166_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(menuTable,line)

data = { text = "Mount Special", func = function() DoEmote(EMOTE171_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(menuTable,line)

data = { text = "Out of Mana", func = function() DoEmote(EMOTE119_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(menuTable,line)

-- A through C Catergory
athruc = {}

	data = { text = "A-C", isTitle = true, notCheckable = true, notClickable = true, keepShownOnClick = true}
	line = createMenuLine(data)
	table.insert(athruc,line)

	line = createDelimLine()
	table.insert(athruc,line)


--a through c anim/voice emotes

data = { text = "Angry", func = function() DoEmote(EMOTE3_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Applaud", func = function() DoEmote(EMOTE5_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Attack Target", func = function() DoEmote(EMOTE161_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Bashful", func = function() DoEmote(EMOTE6_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Beg", func = function() DoEmote(EMOTE8_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Blame", func = function() DoEmote(EMOTE368_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Blush", func = function() DoEmote(EMOTE12_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Boggle", func = function() DoEmote(EMOTE108_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Boop", func = function() DoEmote(EMOTE522_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Bow", func = function() DoEmote(EMOTE17_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Cackle", func = function() DoEmote(EMOTE20_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Charge", func = function() DoEmote(EMOTE159_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Cheer", func = function() DoEmote(EMOTE21_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Chicken", func = function() DoEmote(EMOTE22_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Chuckle", func = function() DoEmote(EMOTE23_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Clap", func = function() DoEmote(EMOTE24_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Commend", func = function() DoEmote(EMOTE154_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Confused", func = function() DoEmote(EMOTE25_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Congrats", func = function() DoEmote(EMOTE26_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Cower", func = function() DoEmote(EMOTE29_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Cry", func = function() DoEmote(EMOTE32_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Curious", func = function() DoEmote(EMOTE33_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)

data = { text = "Curtsey", func = function() DoEmote(EMOTE34_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(athruc,line)



-- add submenu to anim(menu)
	data = {text = "A-C", notCheckable = true, hasArrow = true, menuList = athruc, keepShownOnClick = true }
	line = createMenuLine(data)
	table.insert(anim,line)



-- d thru h category
dthruh = {}

	data = { text = "D-H", isTitle = true, notCheckable = true, notClickable = true, keepShownOnClick = true}
	line = createMenuLine(data)
	table.insert(dthruh,line)

	line = createDelimLine()
	table.insert(dthruh,line)


--d thru c emotes

data = { text = "Dance", func = function() DoEmote(EMOTE35_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Disagree", func = function() DoEmote(EMOTE372_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Doubt", func = function() DoEmote(EMOTE373_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Drink", func = function() DoEmote(EMOTE36_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Eat", func = function() DoEmote(EMOTE38_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Excited", func = function() DoEmote(EMOTE95_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Farewell", func = function() DoEmote(EMOTE19_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Flee", func = function() DoEmote(EMOTE160_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Flex", func = function() DoEmote(EMOTE42_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Flirt", func = function() DoEmote(EMOTE165_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Follow Me", func = function() DoEmote(EMOTE163_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "For the Alliance - Alliance Only", func = function() DoEmote(EMOTE454_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "For the Horde - Horde Only", func = function() DoEmote(EMOTE455_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Gasp", func = function() DoEmote(EMOTE44_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Giggle", func = function() DoEmote(EMOTE46_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Gloat", func = function() DoEmote(EMOTE48_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Golfclap", func = function() DoEmote(EMOTE170_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Greet", func = function() DoEmote(EMOTE49_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Grovel", func = function() DoEmote(EMOTE52_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Growl", func = function() DoEmote(EMOTE49_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Guffaw", func = function() DoEmote(EMOTE53_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Hail", func = function() DoEmote(EMOTE54_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Heal me", func = function() DoEmote(EMOTE166_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Hello", func = function() DoEmote(EMOTE56_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)

data = { text = "Help me", func = function() DoEmote(EMOTE156_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(dthruh,line)


-- add submenu to anim menu
data = {text = "D-H", notCheckable = true, hasArrow = true, menuList = dthruh, keepShownOnClick = true }
line = createMenuLine(data)
table.insert(anim,line)


-- i thru q category


ithruq = {}

	data = { text = "I-Q", isTitle = true, notCheckable = true, notClickable = true, keepShownOnClick = true}
	line = createMenuLine(data)
	table.insert(ithruq,line)
	line = createDelimLine()
	table.insert(ithruq,line)


-- i thru q emotes
data = { text = "Incoming", func = function() DoEmote(EMOTE157_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Insult", func = function() DoEmote(EMOTE114_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Kiss", func = function() DoEmote(EMOTE59_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Kneel", func = function() DoEmote(EMOTE60_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Laugh", func = function() DoEmote(EMOTE61_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Lay", func = function() DoEmote(EMOTE62_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Lost", func = function() DoEmote(EMOTE119_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Mercy", func = function() DoEmote(EMOTE406_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Moo - Tauren Only Animation", func = function() DoEmote(EMOTE153_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Mount Special", func = function() DoEmote(EMOTE171_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Mourn", func = function() DoEmote(EMOTE66_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "No", func = function() DoEmote(EMOTE67_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Nod", func = function() DoEmote(EMOTE68_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Object", func = function() DoEmote(EMOTE450_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Oops", func = function() DoEmote(EMOTE518_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Out of Mana", func = function() DoEmote(EMOTE119_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Open Fire", func = function() DoEmote(EMOTE158_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Plead", func = function() DoEmote(EMOTE72_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Point", func = function() DoEmote(EMOTE73_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Ponder", func = function() DoEmote(EMOTE121_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Pray", func = function() DoEmote(EMOTE75_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Puzzled", func = function() DoEmote(EMOTE125_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)

data = { text = "Question", func = function() DoEmote(EMOTE96_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(ithruq,line)






-- i thru q to anim menu
data = {text = "I-Q", notCheckable = true, hasArrow = true, menuList = ithruq, keepShownOnClick = true }
line = createMenuLine(data)
table.insert(anim,line)


-- r thru w category
rthruw = {}

	data = { text = "R-Z", isTitle = true, notCheckable = true, notClickable = true, keepShownOnClick = true}
	line = createMenuLine(data)
	table.insert(rthruw,line)

	line = createDelimLine()
	table.insert(rthruw,line)

-- r thru w emotes
data = { text = "Raspberry", func = function() DoEmote(EMOTE146_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Roar", func = function() DoEmote(EMOTE76_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Rofl", func = function() DoEmote(EMOTE77_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Roll eyes", func = function() DoEmote(EMOTE421_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Rude", func = function() DoEmote(EMOTE78_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Salute", func = function() DoEmote(EMOTE79_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Shrug", func = function() DoEmote(EMOTE84_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Shy", func = function() DoEmote(EMOTE85_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Silly", func = function() DoEmote(EMOTE167_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Sing", func = function() DoEmote(EMOTE433_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Sleep", func = function() DoEmote(EMOTE88_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Sniff - Worgen Only Animation", func = function() DoEmote(EMOTE133_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Surrender", func = function() DoEmote(EMOTE93_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Talk", func = function() DoEmote(EMOTE94_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Taunt", func = function() DoEmote(EMOTE137_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Thank", func = function() DoEmote(EMOTE98_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Train", func = function() DoEmote(EMOTE155_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Victory", func = function() DoEmote(EMOTE101_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Violin", func = function() DoEmote(EMOTE144_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Wait", func = function() DoEmote(EMOTE164_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Wave", func = function() DoEmote(EMOTE102_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Welcome", func = function() DoEmote(EMOTE103_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Whistle", func = function() DoEmote(EMOTE105_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "Whoa", func = function() DoEmote(EMOTE517_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

data = { text = "You're Welcome", func = function() DoEmote(EMOTE452_TOKEN) end, notCheckable = true, keepShownOnClick = false, }
line = createMenuLine(data)
table.insert(rthruw,line)

-- r thru w to anim menu
data = {text = "R-Z", notCheckable = true, hasArrow = true, menuList = rthruw, keepShownOnClick = true}
line = createMenuLine(data)
table.insert(anim,line)






	--basic/nonvoice and animation submenu
line = createDelimLine()
table.insert(menuTable,line)

submenu = {}      
    data = { text = "Basic", isTitle = true, notCheckable = true, notClickable = true, keepShownOnClick = true }
    line = createMenuLine(data)
	table.insert(submenu,line)
	
    line = createDelimLine()
	table.insert(submenu,line)



-- basic/nonvoice and animation letter categories
    data = { text = "Volunteer", func = function() DoEmote("raise") end, notCheckable = true, keepShownOnClick = false, }
	line = createMenuLine(data)
	table.insert(submenu,line)



  --add basic submenu to menuTable
  data = { text = "Basic", notCheckable = true, hasArrow = true, menuList = submenu, keepShownOnClick = true }
  line = createMenuLine(data)
  table.insert(menuTable,line)




  --add delimiter
  line = createDelimLine()
  table.insert(menuTable,line)
 
  --close menu
  data = { text = "Close", func = function() CloseDropDownMenus() end, notCheckable = true, keepShownOnClick = true }
  line = createMenuLine(data)
  table.insert(menuTable,line)

end
 
--INIT
createMenu()
 
--CALL
local function SlashCmd(cmd)
  EasyMenu(menuTable, dropdown, "MyButton", 60 , 20, "MENU")
end
SlashCmdList["menu"] = SlashCmd
SLASH_menu1 = "/menu"
--]]




--[[




local MyFrameTest = {};




--here to help debug and let me know what is going on when and where.

local function Println(line)
	if(line) then DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000DEBUG:|r " .. line); end
end


function MyFrameTest:Load()
	MyFrameTest:BuildParentFrame();
	MyFrameTest:BuildButton();
	MyFrameTest:BuildDropDown();

	Println('Loaded');--Debug: remove after testing
end


function MyFrameTest:BuildParentFrame()
	--Create our parent frame
	MyFrameTest.frame = CreateFrame("Frame", "MyFrameTest", UIParent);
	--frame visual appearance
	MyFrameTest.frame:SetFrameStrata("BACKGROUND");
	MyFrameTest.frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background",
										 edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
										 tile = true, tileSize = 16, edgeSize = 16,
										 insets = { left = 4, right = 4, top = 4, bottom = 4 } });
	MyFrameTest.frame:SetBackdropColor(0,0,0,1);
	--frame positioning
	MyFrameTest.frame:SetWidth(128);
	MyFrameTest.frame:SetHeight(64);
	MyFrameTest.frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0);
	--events and handlers
	MyFrameTest.frame:SetScript('OnEvent', function(self, event, arg1) MyFrameTest:OnEvent(self, event, arg1) end);
	MyFrameTest.frame:RegisterEvent('MINIMAP_PING');
end


function MyFrameTest:OnEvent(self, event, arg1)
	if(event == 'MINIMAP_PING') then
		local name = (UnitName(arg1) or "Unknown");
		Println(name .. " pinged the minimap");
	end
end


function MyFrameTest:BuildButton()
	MyFrameTest.button = CreateFrame("Button", "MyButton", MyFrameTest.frame, "UIPanelButtonTemplate")
	MyFrameTest.button:SetText("Click Me!")
	MyFrameTest.button:SetScript("OnClick", function(self) MyFrameTest:OnButtonClick(self) end)
	MyFrameTest.button:SetWidth(65);
	MyFrameTest.button:SetHeight(30);
	MyFrameTest.button:SetPoint("CENTER");
end


function MyFrameTest:OnButtonClick(self)
	ToggleDropDownMenu(1, nil, MyFrameTest.dropdown, "MyFrameTest", 0, 0)
end



--the dropdown mystery solved (^_^)

local menuTable = {
	"One",
	"Two",
	"Three"
};


function MyFrameTest:MyDropDownTest_Initialize()
  for i, title in ipairs(menuTable) do
    local info = UIDropDownMenu_CreateInfo();
    info.text = title;
    info.value = i;
    info.owner = MyFrameTest.dropdown;
    info.func = function(self) MyFrameTest:OnMenuClick(self) end;
    UIDropDownMenu_AddButton(info);
  end
end


function MyFrameTest:OnMenuClick(self)
	UIDropDownMenu_SetSelectedValue(self.owner, self.value);

	local menuText = UIDropDownMenu_GetText(MyFrameTest.dropdown);
	DoEmote("flirt");
end


function MyFrameTest:BuildDropDown()
	MyFrameTest:CreateDropDownFrame();
	UIDropDownMenu_Initialize(MyDropDownTest, function(self) MyFrameTest:MyDropDownTest_Initialize(self) end, "MENU");
	UIDropDownMenu_SetSelectedID(MyDropDownTest, 1);
	UIDropDownMenu_SetWidth(MyFrameTest.dropdown, 90);
end


function MyFrameTest:CreateDropDownFrame()
	MyFrameTest.dropdown = CreateFrame("Frame", "MyDropDownTest", nil, "UIDropDownMenuTemplate");
	MyFrameTest.dropdown.point = "TOPLEFT";
	MyFrameTest.dropdown.relativePoint = "TOPRIGHT";
	MyFrameTest.dropdown.displayMode = "MENU";
	MyFrameTest.dropdown.relativeTo = MyFrameTest.frame;
end


MyFrameTest:Load();


--]]
