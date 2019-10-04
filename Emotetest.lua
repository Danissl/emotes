SLASH_RELOADUI1 = "/rl"; -- new slash command for reloading UI
SlashCmdList.RELOADUI = ReloadUI;


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

local function createMenu()
 
	--title
	data = { text = "Emotes", isTitle = true, notCheckable = true, notClickable = true, keepShownOnClick = true }
	line = createMenuLine(data)
	table.insert(menuTable,line)
   



local function createSubMenu(title)
    local subMenu = {}
    data = { text = title, isTitle = true, notCheckable = true, notClickable = true, keepShownOnClick = true }
    table.insert(subMenu, createMenuLine(data))
    table.insert(subMenu, createDelimLine())
end

local function createSubMenuLine(subMenu, lineData)
    data = { text = lineData.text, func = function() DoEmote(lineData.token) end, notCheckable = true, keepShownOnClick = false }
    table.insert(subMenu, createMenuLine(data))
end

subMenus = {
    ["A-D"] = createSubMenu("A-D")
}
emoteTable = {
     {key = "dance", text = "Dance", token = EMOTE35_TOKEN, subMenu = "A-D"},
     {key = "drink", text = "Drink", token = EMOTE36_TOKEN, subMenu = "A-D"}
-- More
}

-- Once at the end
for emoteData in emoteTable do
    createSubMenuLine(subMenus[emoteData.subMenu], emoteData)
end

for subMenuName,subMenu in pairs(subMenus) do
    data = { text = subMenuName, notCheckable = true, hasArrow = true, menuList = subMenu, keepShownOnClick = true }
    table.insert(menuTable, createMenuLine(data))
end


--CALL
local function SlashCmd(cmd)
  EasyMenu(menuTable, dropdown, "MyButton", 60 , 20, "MENU")
end
SlashCmdList["menu"] = SlashCmd
SLASH_menu1 = "/menu"













