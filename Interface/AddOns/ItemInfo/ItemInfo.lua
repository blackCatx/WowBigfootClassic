local _
local ItemInfo_27564b0f8fc08d6bd0345695785ce4b6 = BLocal("ItemInfo")
local ItemInfo_01df612d60ced2cfa8ff3c8d1a39e47d = BLibrary("BSecureHook")
local ItemInfo_bec6b2696ec890fdca8ddd42fbd09040 = BLibrary("BEvent")
ItemInfo_bec6b2696ec890fdca8ddd42fbd09040:RegisterEvent("ADDON_LOADED")
if (GetLocale() == "zhCN") then
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Item Info"] = "物品信息"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Unit Price"] = "单价"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Show unit price"] =
        "显示拍卖物品的单价"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff00ff00Add|r %s"] =
        "|cff00ff00添加|r %s"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffff0000Remove|r %s"] =
        "|cffff0000移除|r %s"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["[%s] has been removed from query list."] =
        "[%s] 已成功移除出查询列表!"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["[%s] has been add from query list."] =
        "[%s] 已成功添加入查询列表!"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["The item has been bid"] =
        "该物品已有人竞拍"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Click to select item to query"] =
        "点击选择查询物品"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEEach for sell: |r"] =
        "|cff7B68EE出售单价: |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EETotal for sell: |r"] =
        "|cff7B68EE出售总价: |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEStart bid: |r"] =
        "|cff7B68EE起拍单价: |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEStart group bid(%d): |r"] =
        "|cff7B68EE每组拍价(%d): |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEGroup bid(%d%%): |r"] =
        "|cff7B68EE竞标单价(%d%%): |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEBid out(%d%%): |r"] =
        "|cff7B68EE一口单价(%d%%): |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffFFFAFAStack: %d|r"] =
        "|cffFFFAFA每组堆叠: %d|r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffFFE4B5Item level: %d|r"] =
        "|cffFFE4B5物品等级: %d|r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffFFD700Use(%s):|r |cffFF00FF%s|r"] =
        "|cffFFD700用途(%s):|r |cffFF00FF%s|r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffFFD700Use:|r |cffFFD700%s|r"] =
        "|cffFFD700用途:|r |cffFFD700%s|r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Priest'] = "牧师"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Mage'] = "法师"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Paladin'] = "圣骑士"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Rogue'] = "潜行者"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Shaman'] = "萨满"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Warlock'] = "术士"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Druid'] = "德鲁伊"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Alchemy'] = "炼金"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Blacksmithing'] = "锻造"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Enchanting'] = "附魔"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Engineering'] = "工程学"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Leatherworking'] = "制皮"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Tailoring'] = "裁缝"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Gem'] = "宝石加工"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Cooking'] = "烹饪"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Inscription'] = "铭文"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Mining'] = "采矿"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['FirstAid'] = "急救"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["All information about auction items will be cleared, Are you sure?"] =
        "确认清除所有物品的拍卖信息?"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["All information about auction items were cleared!"] =
        "成功清除了所有物品的拍卖信息!"
elseif (GetLocale() == "zhTW") then
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Item Info"] = "物品信息"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Unit Price"] = "單價"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Show unit price"] =
        "顯示拍賣物品的單價"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff00ff00Add|r %s"] =
        "|cff00ff00添加|r %s"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffff0000Remove|r %s"] =
        "|cffff0000移除|r %s"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["[%s] has been removed from query list."] =
        "[%s] 已成功移除出查詢列表!"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["[%s] has been add from query list."] =
        "[%s] 已成功添加入查詢列表!"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["The item has been bid"] =
        "該物品已有人競拍"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Click to select item to query"] =
        "點擊選擇查詢物品"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEEach for sell: |r"] =
        "|cff7B68EE出售單價: |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EETotal for sell: |r"] =
        "|cff7B68EE出售總價: |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEStart bid: |r"] =
        "|cff7B68EE起拍單價: |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEStart group bid(%d): |r"] =
        "|cff7B68EE每組拍價(%d): |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEGroup bid(%d%%): |r"] =
        "|cff7B68EE競標單價(%d%%): |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEBid out(%d%%): |r"] =
        "|cff7B68EE直購單價(%d%%): |r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffFFFAFAStack: %d|r"] =
        "|cffFFFAFA每組堆疊: %d|r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffFFE4B5Item level: %d|r"] =
        "|cffFFE4B5物品等級: %d|r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffFFD700Use(%s):|r |cffFF00FF%s|r"] =
        "|cffFFD700用途(%s):|r |cffFF00FF%s|r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffFFD700Use:|r |cffFFD700%s|r"] =
        "|cffFFD700用途:|r |cffFFD700%s|r"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Priest'] = "牧師"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Mage'] = "法師"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Paladin'] = "聖騎士"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Rogue'] = "盜賊"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Shaman'] = "薩滿"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Warlock'] = "術士"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Druid'] = "德魯伊"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Alchemy'] = "煉金"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Blacksmithing'] = "鍛造"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Enchanting'] = "附魔"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Engineering'] = "工程學"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Leatherworking'] = "制皮"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Tailoring'] = "裁縫"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Gem'] = "寶石加工"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Cooking'] = "烹飪"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Inscription'] = "銘文"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['Mining'] = "採礦"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6['FirstAid'] = "急救"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["All information about auction items will be cleared, Are you sure?"] =
        "確認清除所有物品的拍賣資訊?"
    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["All information about auction items were cleared!"] =
        "成功清除了所有物品的拍賣資訊!"
end
ItemInfo_Config = {
    ["rname"] = {},
    ["auctionPrice"] = {},
    ["ShowUnitPrice"] = false
}
local II_LAST_ITEM_AUCTIONED
local ItemInfo_c3eba7ecdad0c747cae12732334b4e0a,
      ItemInfo_f924ef2a8da54a3e2af4e2f83c870fe6,
      ItemInfo_7a0f86110e37241bb46f51b3e0530b56
local BUY_OUT_SCALE = 1.5
local ItemInfo_430372cffccf1f7472976dd445422a1b =
    BLibrary("BInfo", "chat",
             ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Item Info"])
local ItemInfo_2140bb9f1f51de36bdf1e48056b92f6d =
    "Interface\\PvPRankBadges\\PvPRank09.blp"
local ItemInfo_7d74c6a6be304992d3e391143d721868 = 20
II_Config = {
    ["SellValue"] = 1,
    ["AuctionInfo"] = 1,
    ["ItemLevel"] = 1,
    ["StackCount"] = 1,
    ["GemInfo"] = 1,
    ["ItemQulity"] = 1
}
local RelicTypes = {
    ["Blood"] = RELIC_SLOT_TYPE_BLOOD,
    ["Shadow"] = RELIC_SLOT_TYPE_SHADOW,
    ["Iron"] = RELIC_SLOT_TYPE_IRON,
    ["Frost"] = RELIC_SLOT_TYPE_FROST,
    ["Fire"] = RELIC_SLOT_TYPE_FIRE,
    ["Fel"] = RELIC_SLOT_TYPE_FEL,
    ["Arcane"] = RELIC_SLOT_TYPE_ARCANE,
    ["Life"] = RELIC_SLOT_TYPE_LIFE,
    ["Wind"] = RELIC_SLOT_TYPE_WIND,
    ["Holy"] = RELIC_SLOT_TYPE_HOLY
}
local RelicSlots = {
    [127829] = {"Fel", "Shadow", "Fel"},
    [128832] = {"Iron", "Arcane", "Fel"},
    [128402] = {"Blood", "Shadow", "Iron"},
    [128292] = {"Frost", "Shadow", "Frost"},
    [128403] = {"Fire", "Shadow", "Blood"},
    [128858] = {"Arcane", "Life", "Arcane"},
    [128860] = {"Frost", "Blood", "Life"},
    [128821] = {"Fire", "Blood", "Life"},
    [128306] = {"Life", "Frost", "Life"},
    [128861] = {"Wind", "Arcane", "Iron"},
    [128826] = {"Wind", "Blood", "Life"},
    [128808] = {"Wind", "Iron", "Blood"},
    [127857] = {"Arcane", "Frost", "Arcane"},
    [128820] = {"Fire", "Arcane", "Fire"},
    [128862] = {"Frost", "Arcane", "Frost"},
    [128938] = {"Life", "Wind", "Iron"},
    [128937] = {"Frost", "Life", "Wind"},
    [128940] = {"Wind", "Iron", "Wind"},
    [128823] = {"Holy", "Life", "Holy"},
    [128866] = {"Holy", "Iron", "Arcane"},
    [120978] = {"Holy", "Fire", "Holy"},
    [128868] = {"Holy", "Shadow", "Holy"},
    [128825] = {"Holy", "Life", "Holy"},
    [128827] = {"Shadow", "Blood", "Shadow"},
    [128870] = {"Shadow", "Iron", "Blood"},
    [128872] = {"Blood", "Iron", "Wind"},
    [128476] = {"Fel", "Shadow", "Fel"},
    [128935] = {"Wind", "Frost", "Wind"},
    [128819] = {"Fire", "Iron", "Wind"},
    [128911] = {"Life", "Frost", "Life"},
    [128942] = {"Shadow", "Blood", "Shadow"},
    [128943] = {"Shadow", "Fire", "Fel"},
    [128941] = {"Fel", "Fire", "Fel"},
    [128910] = {"Iron", "Blood", "Shadow"},
    [128908] = {"Fire", "Wind", "Iron"},
    [128289] = {"Iron", "Blood", "Fire"}
}
StaticPopupDialogs["CLEAR_AUCTION_INFOMATION"] =
    {
        text = ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["All information about auction items will be cleared, Are you sure?"],
        button1 = ACCEPT,
        button2 = CANCEL,
        OnAccept = function(self)
            ItemInfo_Config.auctionPrice = {}
            ItemInfo_430372cffccf1f7472976dd445422a1b:Print(
                ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["All information about auction items were cleared!"])
        end,
        showAlert = 1,
        timeout = 0,
        exclusive = 1,
        hideOnEscape = 1
    } --[[ 扫描功能待修复 拍卖行信息保存的数据格式：近一段时间的物品最高和最低一口价 拍卖时按照最低一口价作为标准 ItemInfo_f13ab2b475c25572a620788ec44fbbf8 = {}; function checkData(timeStamp) for i,v in pairs(ItemInfo_f13ab2b475c25572a620788ec44fbbf8) do print(i) end end function ItemInfo_bec6b2696ec890fdca8ddd42fbd09040.AUCTION_ITEM_LIST_UPDATE() local timeStamp = time(); local ItemInfo_3f50417fb16be9b1078eb68d24fa9c26, ItemInfo_aa48e4d59c305916bb09e3d3ecaa76d0, ItemInfo_8126704607de771b02f09d547c67706b, ItemInfo_7034464da73cfb8515c09445b0c4bc7f, ItemInfo_e498578b78aa0db9c45f30f87d63debc, ItemInfo_de3cbe286618f666df102dd52371d2ef; local _data = {}; _data.timeStamp = timeStamp; for ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f = 1, NUM_AUCTION_ITEMS_PER_PAGE do ItemInfo_e498578b78aa0db9c45f30f87d63debc = GetAuctionItemLink("list", ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f); if (ItemInfo_e498578b78aa0db9c45f30f87d63debc and type(ItemInfo_e498578b78aa0db9c45f30f87d63debc) == "string") then local ItemInfo_de3cbe286618f666df102dd52371d2ef = ItemInfo_d38674d7124558fa892d69c68668bd01(ItemInfo_e498578b78aa0db9c45f30f87d63debc); if ItemInfo_de3cbe286618f666df102dd52371d2ef then _, _, ItemInfo_3f50417fb16be9b1078eb68d24fa9c26, _, _, _, _, ItemInfo_aa48e4d59c305916bb09e3d3ecaa76d0, _, ItemInfo_8126704607de771b02f09d547c67706b, ItemInfo_7034464da73cfb8515c09445b0c4bc7f = GetAuctionItemInfo("list", ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f); _data[ItemInfo_de3cbe286618f666df102dd52371d2ef] = {ItemInfo_aa48e4d59c305916bb09e3d3ecaa76d0,ItemInfo_8126704607de771b02f09d547c67706b,ItemInfo_7034464da73cfb8515c09445b0c4bc7f,ItemInfo_3f50417fb16be9b1078eb68d24fa9c26} end end end end ]]
local function ItemInfo_d38674d7124558fa892d69c68668bd01(
    ItemInfo_e498578b78aa0db9c45f30f87d63debc)
    if (not ItemInfo_e498578b78aa0db9c45f30f87d63debc or
        type(ItemInfo_e498578b78aa0db9c45f30f87d63debc) ~= "string" or
        ItemInfo_e498578b78aa0db9c45f30f87d63debc == "") then return end
    local _, _, ItemInfo_82541cdf49ca614c4b9f2a16a07469a0 =
        strfind(ItemInfo_e498578b78aa0db9c45f30f87d63debc,
                "\124c%x+\124Hitem:(%d+):.+\124h%[.-%]\124h\124r")
    if not ItemInfo_82541cdf49ca614c4b9f2a16a07469a0 then return end
    return tonumber(ItemInfo_82541cdf49ca614c4b9f2a16a07469a0)
end
local function ItemInfo_00c082a9be8a1d8e162a78021c9506b5(self,
                                                         ItemInfo_8983c60d66c8593ec7165ea9dbedb584)
    if (ItemInfo_8983c60d66c8593ec7165ea9dbedb584 and
        type(ItemInfo_8983c60d66c8593ec7165ea9dbedb584) == "string") then
        BrowseName:SetText(ItemInfo_8983c60d66c8593ec7165ea9dbedb584)
        BrowseName:HighlightText(0, -1)
    end
end
local function ItemInfo_2f54ba7e2e2035f7cae3d0a3d6ea3eb3()
    if ItemInfo_c3eba7ecdad0c747cae12732334b4e0a then
        tremove(ItemInfo_Config.rname, ItemInfo_c3eba7ecdad0c747cae12732334b4e0a)
        BrowseName:SetText("")
        ItemInfo_430372cffccf1f7472976dd445422a1b:Print(
            format(
                ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["[%s] has been removed from query list."],
                ItemInfo_Config.rname[ItemInfo_c3eba7ecdad0c747cae12732334b4e0a]))
    end
end
local function ItemInfo_64ac251a2fd0f26a37b32e9c8e3c7c66(self,
                                                         ItemInfo_8983c60d66c8593ec7165ea9dbedb584)
    tinsert(ItemInfo_Config.rname, ItemInfo_8983c60d66c8593ec7165ea9dbedb584)
    ItemInfo_430372cffccf1f7472976dd445422a1b:Print(
        format(
            ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["[%s] has been add from query list."],
            ItemInfo_8983c60d66c8593ec7165ea9dbedb584))
end
local function ItemInfo_ae5f860635f34632b40407a4193e0abd(
    ItemInfo_8983c60d66c8593ec7165ea9dbedb584)
    if not ItemInfo_8983c60d66c8593ec7165ea9dbedb584 then return end
    for ItemInfo_413bf9c15ce77baa8ebf1cda4cbf4887,
        ItemInfo_2361bab8b48b1041ad740bb561b21aee in
        ipairs(ItemInfo_Config.rname) do
        if (ItemInfo_2361bab8b48b1041ad740bb561b21aee ==
            ItemInfo_8983c60d66c8593ec7165ea9dbedb584) then
            return ItemInfo_413bf9c15ce77baa8ebf1cda4cbf4887
        end
    end
end
local function ItemInfo_52de863f6e4805efe3608c438f3dde1b()
    local ItemInfo_a44ecbf575d7f2eca081a0592e8d84fa =
        {value = 0, notCheckable = 1}
    local ItemInfo_8983c60d66c8593ec7165ea9dbedb584 = BrowseName:GetText()
    local ItemInfo_6d6c07a1e02fdc49f88cbb276184ce42
    if (ItemInfo_8983c60d66c8593ec7165ea9dbedb584 and
        ItemInfo_8983c60d66c8593ec7165ea9dbedb584 ~= "") then
        ItemInfo_c3eba7ecdad0c747cae12732334b4e0a =
            ItemInfo_ae5f860635f34632b40407a4193e0abd(
                ItemInfo_8983c60d66c8593ec7165ea9dbedb584)
        if (ItemInfo_c3eba7ecdad0c747cae12732334b4e0a) then
            ItemInfo_a44ecbf575d7f2eca081a0592e8d84fa.func =
                ItemInfo_2f54ba7e2e2035f7cae3d0a3d6ea3eb3
            ItemInfo_a44ecbf575d7f2eca081a0592e8d84fa.text =
                format(
                    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffff0000Remove|r %s"],
                    ItemInfo_8983c60d66c8593ec7165ea9dbedb584)
        elseif (#(ItemInfo_Config["rname"]) <
            ItemInfo_7d74c6a6be304992d3e391143d721868) then
            ItemInfo_a44ecbf575d7f2eca081a0592e8d84fa.func =
                ItemInfo_64ac251a2fd0f26a37b32e9c8e3c7c66
            ItemInfo_a44ecbf575d7f2eca081a0592e8d84fa.arg1 =
                ItemInfo_8983c60d66c8593ec7165ea9dbedb584
            ItemInfo_a44ecbf575d7f2eca081a0592e8d84fa.text =
                format(
                    ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff00ff00Add|r %s"],
                    ItemInfo_8983c60d66c8593ec7165ea9dbedb584)
        else
            ItemInfo_6d6c07a1e02fdc49f88cbb276184ce42 = true
        end
        if not ItemInfo_6d6c07a1e02fdc49f88cbb276184ce42 then
            BDropDownMenu_AddButton(ItemInfo_a44ecbf575d7f2eca081a0592e8d84fa)
        end
    end
    for ItemInfo_413bf9c15ce77baa8ebf1cda4cbf4887,
        ItemInfo_8983c60d66c8593ec7165ea9dbedb584 in
        ipairs(ItemInfo_Config.rname) do
        ItemInfo_a44ecbf575d7f2eca081a0592e8d84fa =
            {
                text = ItemInfo_8983c60d66c8593ec7165ea9dbedb584,
                arg1 = ItemInfo_8983c60d66c8593ec7165ea9dbedb584,
                value = ItemInfo_413bf9c15ce77baa8ebf1cda4cbf4887,
                func = ItemInfo_00c082a9be8a1d8e162a78021c9506b5
            }
        if (ItemInfo_413bf9c15ce77baa8ebf1cda4cbf4887 ==
            ItemInfo_c3eba7ecdad0c747cae12732334b4e0a) then
            ItemInfo_a44ecbf575d7f2eca081a0592e8d84fa.checked = 1
        end
        BDropDownMenu_AddButton(ItemInfo_a44ecbf575d7f2eca081a0592e8d84fa)
    end
end
local function ItemInfo_648afc4e523bce211ef4a10aead7bc38()
    for ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f = 1, NUM_BROWSE_TO_DISPLAY do
        local ItemInfo_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 =
            getglobal("BrowseButton" ..
                          ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f)
        local ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a =
            CreateFrame("Button",
                        ItemInfo_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName() ..
                            "Texture", ItemInfo_99f3cf2c6f1fdfadb0fd4ab6e0843bf5)
        local ItemInfo_9248008bbb6d0ee7ce13f6ee45680051 =
            ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a:CreateTexture('',
                                                                    "ARTWORK")
        ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a:SetWidth(20)
        ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a:SetHeight(20)
        ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a:SetFrameLevel(
            ItemInfo_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetFrameLevel() + 1)
        ItemInfo_9248008bbb6d0ee7ce13f6ee45680051:SetAllPoints(
            ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a)
        ItemInfo_9248008bbb6d0ee7ce13f6ee45680051:SetTexture(
            ItemInfo_2140bb9f1f51de36bdf1e48056b92f6d)
        ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint("TOPLEFT",
                                                           ItemInfo_99f3cf2c6f1fdfadb0fd4ab6e0843bf5,
                                                           "TOPLEFT", 185, -8)
        ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a:SetScript("OnEnter",
                                                            function(self)
            GameTooltip:SetOwner(ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a,
                                 "ANCHOR_BOTTOMRIGHT", 20, 20)
            GameTooltip:AddLine(
                ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["The item has been bid"])
            GameTooltip:Show()
        end)
        ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a:SetScript("OnLeave", function(
            self) GameTooltip:Hide() end)
    end
    AuctionSort["list_name"] = {
        {column = "bid", reverse = false},
        {column = "quantity", reverse = true},
        {column = "buyout", reverse = false},
        {column = "name", reverse = false}, {column = "level", reverse = true},
        {column = "quality", reverse = false}
    }
    local ItemInfo_a8644751c725025897986966350ca5bf =
        CreateFrame("Button", "BrowseNameSort", AuctionFrameBrowse,
                    "AuctionSortButtonTemplate")
    ItemInfo_a8644751c725025897986966350ca5bf:SetText(NAME)
    ItemInfo_a8644751c725025897986966350ca5bf:SetWidth(94)
    ItemInfo_a8644751c725025897986966350ca5bf:SetHeight(19)
    ItemInfo_a8644751c725025897986966350ca5bf:SetPoint("TOPLEFT",
                                                       AuctionFrameBrowse,
                                                       "TOPLEFT", 186, -82)
    ItemInfo_a8644751c725025897986966350ca5bf.order = false
    ItemInfo_a8644751c725025897986966350ca5bf:SetScript("OnClick",
                                                        function(self, ...)
        self.order = not self.order
        AuctionFrame_SetSort("list", "name", self.order)
        AuctionFrameBrowse_Search()
        SortButton_UpdateArrow(ItemInfo_a8644751c725025897986966350ca5bf,
                               "list", "name")
    end)
    hooksecurefunc("AuctionFrameBrowse_UpdateArrows", function(self, ...)
        if ItemInfo_7a0f86110e37241bb46f51b3e0530b56 then
            SortButton_UpdateArrow(ItemInfo_a8644751c725025897986966350ca5bf,
                                   "list", "name")
        end
    end)
    BrowseQualitySort:SetWidth(123)
    BrowseQualitySort:ClearAllPoints()
    BrowseQualitySort:SetPoint("LEFT",
                               ItemInfo_a8644751c725025897986966350ca5bf,
                               "RIGHT", -2, 0)
    local ItemInfo_1dde068a1391636ae83e03bd798f5914 =
        CreateFrame("CheckButton", "ShowOnUnitPriceCheckButton",
                    BrowseCurrentBidSort, "UICheckButtonTemplate")
    ItemInfo_1dde068a1391636ae83e03bd798f5914:SetWidth(24)
    ItemInfo_1dde068a1391636ae83e03bd798f5914:SetHeight(24)
    getglobal(ItemInfo_1dde068a1391636ae83e03bd798f5914:GetName() .. "Text"):SetText(
        ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Unit Price"], 1, 1, 1)
    ItemInfo_1dde068a1391636ae83e03bd798f5914:SetPoint("LEFT",
                                                       BrowseCurrentBidSort,
                                                       "LEFT", 110, -2)
    ItemInfo_1dde068a1391636ae83e03bd798f5914:SetScript("OnEnter",
                                                        function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT", -60, 0)
        GameTooltip:AddLine(
            ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Show unit price"])
        GameTooltip:Show()
    end)
    ItemInfo_1dde068a1391636ae83e03bd798f5914:SetScript("OnLeave",
                                                        function(self)
        GameTooltip:Hide()
    end)
    ItemInfo_1dde068a1391636ae83e03bd798f5914:SetScript("OnClick",
                                                        function(self)
        ItemInfo_Config.ShowUnitPrice =
            ItemInfo_1dde068a1391636ae83e03bd798f5914:GetChecked()
        AuctionFrameBrowse_Update()
    end)
    ItemInfo_1dde068a1391636ae83e03bd798f5914:SetScript("OnShow", function(self)
        ItemInfo_1dde068a1391636ae83e03bd798f5914:SetChecked(
            ItemInfo_Config.ShowUnitPrice)
    end)
    local ItemInfo_8e74cec0f43558c7a448228e3cd6dc8b =
        CreateFrame("Frame", "SaveSearchName_DropDown", BrowseName,
                    "BDropDownMenuTemplate")
    local ItemInfo_7ea66450f0a3bcc8fa0da90afc9e7fda =
        ItemInfo_8e74cec0f43558c7a448228e3cd6dc8b:GetName()
    ItemInfo_8e74cec0f43558c7a448228e3cd6dc8b:SetID(1)
    ItemInfo_8e74cec0f43558c7a448228e3cd6dc8b:SetPoint("LEFT", BrowseName,
                                                       "LEFT", 13, -3)
    ItemInfo_8e74cec0f43558c7a448228e3cd6dc8b:SetScript("OnShow", function()
        BDropDownMenu_Initialize(ItemInfo_8e74cec0f43558c7a448228e3cd6dc8b,
                                 ItemInfo_52de863f6e4805efe3608c438f3dde1b,
                                 "MENU")
        getglobal(ItemInfo_7ea66450f0a3bcc8fa0da90afc9e7fda ..
                      "ButtonNormalTexture"):SetTexture(
            "Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
        getglobal(ItemInfo_7ea66450f0a3bcc8fa0da90afc9e7fda ..
                      "ButtonDisabledTexture"):SetTexture(
            "Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled")
        getglobal(ItemInfo_7ea66450f0a3bcc8fa0da90afc9e7fda ..
                      "ButtonPushedTexture"):SetTexture(
            "Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down")
        getglobal(ItemInfo_7ea66450f0a3bcc8fa0da90afc9e7fda ..
                      "ButtonHighlightTexture"):SetTexture(
            "Interface\\Buttons\\UI-Common-MouseHilight")
        BDropDownMenu_SetSelectedValue(BrowseDropDown, -1)
    end)
    local ItemInfo_1db96014cef6489dcf324f3ef7b365bd =
        getglobal(ItemInfo_7ea66450f0a3bcc8fa0da90afc9e7fda .. "Button")
    ItemInfo_1db96014cef6489dcf324f3ef7b365bd:SetScript("OnEnter",
                                                        function(
        ItemInfo_c933410cf37b41b19e2f71899bab1b9b)
        GameTooltip:SetOwner(ItemInfo_1db96014cef6489dcf324f3ef7b365bd,
                             "ANCHOR_RIGHT")
        GameTooltip:AddLine(
            ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["Click to select item to query"])
        GameTooltip:Show()
    end)
    ItemInfo_1db96014cef6489dcf324f3ef7b365bd:SetScript("OnLeave", function(
        ItemInfo_c933410cf37b41b19e2f71899bab1b9b) GameTooltip:Hide() end)
end
local function ItemInfo_a445b92afd50dd0eb5fc856b59495961(self, event, ...)
    if (event == "NEW_AUCTION_UPDATE") then
        local ItemInfo_8983c60d66c8593ec7165ea9dbedb584, _,
              ItemInfo_3f50417fb16be9b1078eb68d24fa9c26, _, _,
              ItemInfo_8a3f6cb862abe97e1e5c304b618abf6c,
              ItemInfo_153c09d58f6a5f5b4e49d6f46f5b1395 =
            GetAuctionSellItemInfo()
        II_LAST_ITEM_AUCTIONED = ItemInfo_8983c60d66c8593ec7165ea9dbedb584
        if not ItemInfo_8983c60d66c8593ec7165ea9dbedb584 then return end
        if PriceDropDown and not PriceDropDown:IsShown() then
            PriceDropDown:ClearAllPoints()
            PriceDropDown:SetPoint("TOP", StartPriceCopper, "BOTTOM", -20, 0)
            PriceDropDown:Show()
        end
        if ItemInfo_Config.auctionPrice[ItemInfo_8983c60d66c8593ec7165ea9dbedb584] then
            local ItemInfo_8e6c2aaeb6b11f026ff5cb0a29aebe68 =
                ItemInfo_Config.auctionPrice[ItemInfo_8983c60d66c8593ec7165ea9dbedb584]
            if AuctionFrameAuctions.priceType == 1 then
                MoneyInputFrame_SetCopper(StartPrice,
                                          ItemInfo_8e6c2aaeb6b11f026ff5cb0a29aebe68[1])
                MoneyInputFrame_SetCopper(BuyoutPrice,
                                          ItemInfo_8e6c2aaeb6b11f026ff5cb0a29aebe68[2])
            else
                MoneyInputFrame_SetCopper(StartPrice,
                                          ItemInfo_8e6c2aaeb6b11f026ff5cb0a29aebe68[1] *
                                              ItemInfo_3f50417fb16be9b1078eb68d24fa9c26)
                MoneyInputFrame_SetCopper(BuyoutPrice,
                                          ItemInfo_8e6c2aaeb6b11f026ff5cb0a29aebe68[2] *
                                              ItemInfo_3f50417fb16be9b1078eb68d24fa9c26)
            end
        else
            local ItemInfo_72715f78e65bb2b7bd0a142e3e8051d5,
                  ItemInfo_fafa209f325a6db4a33bfb03c1262213
            if AuctionFrameAuctions.priceType == 1 then
                ItemInfo_72715f78e65bb2b7bd0a142e3e8051d5 =
                    max(floor(ItemInfo_153c09d58f6a5f5b4e49d6f46f5b1395 *
                                  BUY_OUT_SCALE), 100)
                ItemInfo_fafa209f325a6db4a33bfb03c1262213 =
                    max(floor(ItemInfo_153c09d58f6a5f5b4e49d6f46f5b1395 *
                                  BUY_OUT_SCALE) * BUY_OUT_SCALE, 150)
            else
                ItemInfo_72715f78e65bb2b7bd0a142e3e8051d5 =
                    max(floor(ItemInfo_8a3f6cb862abe97e1e5c304b618abf6c *
                                  BUY_OUT_SCALE), 100)
                ItemInfo_fafa209f325a6db4a33bfb03c1262213 =
                    max(floor(ItemInfo_8a3f6cb862abe97e1e5c304b618abf6c *
                                  BUY_OUT_SCALE) * BUY_OUT_SCALE, 150)
            end
            MoneyInputFrame_SetCopper(StartPrice,
                                      ItemInfo_72715f78e65bb2b7bd0a142e3e8051d5)
            MoneyInputFrame_SetCopper(BuyoutPrice,
                                      ItemInfo_fafa209f325a6db4a33bfb03c1262213)
        end
        UpdateDeposit()
    end
end
local function ItemInfo_816bad5b26d812a70e00dd16c033428d(self, ...)
    if II_LAST_ITEM_AUCTIONED then
        local bid = MoneyInputFrame_GetCopper(StartPrice)
        local buyout = MoneyInputFrame_GetCopper(BuyoutPrice)
        local duration = AuctionFrameAuctions.duration or 2
        if not PriceDropDown:IsShown() or AuctionFrameAuctions.priceType == 1 then
            ItemInfo_Config.auctionPrice[II_LAST_ITEM_AUCTIONED] =
                {bid, buyout, duration}
        else
            local count = AuctionsStackSizeEntry:GetNumber()
            ItemInfo_Config.auctionPrice[II_LAST_ITEM_AUCTIONED] =
                {math.floor(bid / count), math.floor(buyout / count), duration}
        end
    end
end
local function ItemInfo_0c52d557e2660c2afbb6a0ff84149692(...)
    SortButton_UpdateArrow(BrowseNameSort, "list", "name")
    local ItemInfo_45739690061ee7945c14d8a8937f5395,
          ItemInfo_9248008bbb6d0ee7ce13f6ee45680051,
          ItemInfo_81b1f54fc01b0ac2d57753b4b077836c,
          ItemInfo_34694ab57c8a9444e5e6faf24cae8213,
          ItemInfo_410bf65e3d9dd0c6862d3e4426dce982,
          ItemInfo_4f0f0bd269d3aed0b523907026ae2a31
    local ItemInfo_3f50417fb16be9b1078eb68d24fa9c26,
          ItemInfo_aa48e4d59c305916bb09e3d3ecaa76d0,
          ItemInfo_8126704607de771b02f09d547c67706b,
          ItemInfo_7034464da73cfb8515c09445b0c4bc7f
    local ItemInfo_98b436aae97b9941de81152428c81208 =
        FauxScrollFrame_GetOffset(BrowseScrollFrame)
    for ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f = 1, NUM_BROWSE_TO_DISPLAY do
        ItemInfo_45739690061ee7945c14d8a8937f5395 =
            ItemInfo_98b436aae97b9941de81152428c81208 +
                ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f
        ItemInfo_81b1f54fc01b0ac2d57753b4b077836c =
            "BrowseButton" .. ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f
        ItemInfo_9248008bbb6d0ee7ce13f6ee45680051 =
            getglobal(ItemInfo_81b1f54fc01b0ac2d57753b4b077836c .. "Texture")
        ItemInfo_34694ab57c8a9444e5e6faf24cae8213 =
            getglobal(ItemInfo_81b1f54fc01b0ac2d57753b4b077836c .. "MoneyFrame")
        ItemInfo_410bf65e3d9dd0c6862d3e4426dce982 =
            getglobal(ItemInfo_81b1f54fc01b0ac2d57753b4b077836c ..
                          "BuyoutFrameMoney")
        _, _, ItemInfo_3f50417fb16be9b1078eb68d24fa9c26, _, _, _, _, ItemInfo_aa48e4d59c305916bb09e3d3ecaa76d0, _, ItemInfo_8126704607de771b02f09d547c67706b, ItemInfo_7034464da73cfb8515c09445b0c4bc7f =
            GetAuctionItemInfo("list", ItemInfo_45739690061ee7945c14d8a8937f5395)
        if (ItemInfo_7034464da73cfb8515c09445b0c4bc7f == 0) then
            ItemInfo_9248008bbb6d0ee7ce13f6ee45680051:Hide()
            ItemInfo_4f0f0bd269d3aed0b523907026ae2a31 =
                ItemInfo_aa48e4d59c305916bb09e3d3ecaa76d0
        else
            ItemInfo_9248008bbb6d0ee7ce13f6ee45680051:Show()
            ItemInfo_4f0f0bd269d3aed0b523907026ae2a31 =
                ItemInfo_7034464da73cfb8515c09445b0c4bc7f
        end
        if (ItemInfo_Config.ShowUnitPrice) then
            ItemInfo_4f0f0bd269d3aed0b523907026ae2a31 =
                math.floor(ItemInfo_4f0f0bd269d3aed0b523907026ae2a31 /
                               ItemInfo_3f50417fb16be9b1078eb68d24fa9c26 + 0.5)
            if (ItemInfo_8126704607de771b02f09d547c67706b > 0) then
                ItemInfo_8126704607de771b02f09d547c67706b =
                    math.floor(ItemInfo_8126704607de771b02f09d547c67706b /
                                   ItemInfo_3f50417fb16be9b1078eb68d24fa9c26 +
                                   0.5)
            end
        end
        if ItemInfo_34694ab57c8a9444e5e6faf24cae8213 then
            MoneyFrame_Update(
                ItemInfo_34694ab57c8a9444e5e6faf24cae8213:GetName(),
                ItemInfo_4f0f0bd269d3aed0b523907026ae2a31)
        end
        if ItemInfo_410bf65e3d9dd0c6862d3e4426dce982 then
            MoneyFrame_Update(
                ItemInfo_410bf65e3d9dd0c6862d3e4426dce982:GetName(),
                ItemInfo_8126704607de771b02f09d547c67706b)
        end
    end
end
local function ItemInfo_6cab35024b87790a8a354e65a303109a(frame, scriptName, func)
    if (frame:GetScript(scriptName)) then
        frame:HookScript(scriptName, func)
    else
        frame:SetScript(scriptName, func)
    end
end
local function ItemInfo_HookAuctionUI()
    ItemInfo_01df612d60ced2cfa8ff3c8d1a39e47d:HookScript(AuctionsItemButton,
                                                         "OnEvent",
                                                         ItemInfo_a445b92afd50dd0eb5fc856b59495961)
    ItemInfo_01df612d60ced2cfa8ff3c8d1a39e47d:HookScript(
        AuctionsCreateAuctionButton, "PreClick",
        ItemInfo_816bad5b26d812a70e00dd16c033428d)
    ItemInfo_01df612d60ced2cfa8ff3c8d1a39e47d:Hook("AuctionFrameBrowse_Update",
                                                   ItemInfo_0c52d557e2660c2afbb6a0ff84149692)
    hooksecurefunc("ChatEdit_InsertLink", function(text)
        if not text then return end
        if ItemInfo_7a0f86110e37241bb46f51b3e0530b56 then
            if (BrowseName and BrowseName:IsVisible()) then
                local item
                if (strfind(text, "item:", 1, true)) then
                    item = GetItemInfo(text)
                end
                if item then
                    BrowseName:SetText(item)
                    QueryAuctionItems(item)
                    return true
                end
            end
        end
    end)
    for i = 1, NUM_CONTAINER_FRAMES do
        for j = 1, MAX_CONTAINER_ITEMS do
            local f = getglobal("ContainerFrame" .. i .. "Item" .. j)
            if f then
                ItemInfo_6cab35024b87790a8a354e65a303109a(f, "PreClick",
                                                          ItemInfo_ContainerItemPreClick)
            end
        end
    end
end
local function ItemInfo_OnAutionEnable(switch)
    if (IsAddOnLoaded("Blizzard_AuctionUI")) then
        if (switch) then
            getglobal("SaveSearchName_DropDown"):Show()
            getglobal("ShowOnUnitPriceCheckButton"):Show()
        else
            getglobal("SaveSearchName_DropDown"):Hide()
            getglobal("ShowOnUnitPriceCheckButton"):Hide()
            for ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f = 1, NUM_BROWSE_TO_DISPLAY do
                local ItemInfo_9248008bbb6d0ee7ce13f6ee45680051 =
                    getglobal("BrowseButton" ..
                                  ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f ..
                                  "Texture")
                ItemInfo_9248008bbb6d0ee7ce13f6ee45680051:Hide()
            end
        end
    end
end
function ItemInfo_bec6b2696ec890fdca8ddd42fbd09040:ADDON_LOADED(addon)
    if (addon == "Blizzard_AuctionUI") then
        ItemInfo_648afc4e523bce211ef4a10aead7bc38()
        ItemInfo_HookAuctionUI()
        ItemInfo_OnAutionEnable(ItemInfo_f924ef2a8da54a3e2af4e2f83c870fe6)
        self:UnregisterEvent("ADDON_LOADED")
    end
end
local function ItemInfo_65407381b6a3a856c701a9dc4af83c36(self)
    local selfName = self:GetName()
    for ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f = 1, 6 do
        local ItemInfo_8983c60d66c8593ec7165ea9dbedb584 =
            format(selfName .. "IIMoneyFrame%d",
                   ItemInfo_e914904fab9d05d3f54d52bfc31a0f3f)
        if (getglobal(ItemInfo_8983c60d66c8593ec7165ea9dbedb584) and
            getglobal(ItemInfo_8983c60d66c8593ec7165ea9dbedb584):IsShown()) then
            getglobal(ItemInfo_8983c60d66c8593ec7165ea9dbedb584):Hide()
        end
    end
end
local function ItemInfo_4ff31b8a539fa2cf7990edc09e693395(
    ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a,
    ItemInfo_acaec9f163947cc37d561bc125c83a9f,
    ItemInfo_22757db962500df3e5f8bfed4be92671,
    ItemInfo_45739690061ee7945c14d8a8937f5395)
    if (InCombatLockdown() or not ItemInfo_acaec9f163947cc37d561bc125c83a9f or
        not ItemInfo_22757db962500df3e5f8bfed4be92671) then return end
    local ItemInfo_dc0ed675b3e32a9dd9d4058182798c95 =
        ItemInfo_411b8aa6d5954c6020f0b9c9e80e847a or GameTooltip
    local ItemInfo_e975387afdf29ffdf25670c037f683f0 =
        ItemInfo_dc0ed675b3e32a9dd9d4058182798c95:GetName()
    local ItemInfo_8983c60d66c8593ec7165ea9dbedb584 =
        format(ItemInfo_e975387afdf29ffdf25670c037f683f0 .. "IIMoneyFrame%d",
               tonumber(ItemInfo_45739690061ee7945c14d8a8937f5395))
    local ItemInfo_34694ab57c8a9444e5e6faf24cae8213 =
        getglobal(ItemInfo_8983c60d66c8593ec7165ea9dbedb584)
    if (not ItemInfo_34694ab57c8a9444e5e6faf24cae8213) then
        ItemInfo_34694ab57c8a9444e5e6faf24cae8213 =
            CreateFrame("Frame", ItemInfo_8983c60d66c8593ec7165ea9dbedb584,
                        ItemInfo_dc0ed675b3e32a9dd9d4058182798c95,
                        "ItemInfoMoneyFrameTemplate")
        ItemInfo_34694ab57c8a9444e5e6faf24cae8213.small = 1
        MoneyFrame_SetType(ItemInfo_34694ab57c8a9444e5e6faf24cae8213, "AUCTION")
    end
    if ItemInfo_22757db962500df3e5f8bfed4be92671 > 0 then
        MoneyFrame_Update(ItemInfo_8983c60d66c8593ec7165ea9dbedb584,
                          ItemInfo_22757db962500df3e5f8bfed4be92671)
        local leftText = getglobal(format(
                                       ItemInfo_e975387afdf29ffdf25670c037f683f0 ..
                                           "TextLeft%d",
                                       ItemInfo_acaec9f163947cc37d561bc125c83a9f))
        ItemInfo_34694ab57c8a9444e5e6faf24cae8213:ClearAllPoints()
        ItemInfo_34694ab57c8a9444e5e6faf24cae8213:SetPoint("RIGHT",
                                                           ItemInfo_dc0ed675b3e32a9dd9d4058182798c95,
                                                           "RIGHT", 0, 0)
        ItemInfo_34694ab57c8a9444e5e6faf24cae8213:SetPoint("TOP", leftText,
                                                           "TOP", 0, 0)
        local lastWidth = math.max(
                              ItemInfo_dc0ed675b3e32a9dd9d4058182798c95:GetWidth(),
                              ItemInfo_34694ab57c8a9444e5e6faf24cae8213:GetWidth() +
                                  leftText:GetWidth() + 4)
        ItemInfo_dc0ed675b3e32a9dd9d4058182798c95:SetMinimumWidth(lastWidth)
        ItemInfo_34694ab57c8a9444e5e6faf24cae8213:Show()
    else
        ItemInfo_34694ab57c8a9444e5e6faf24cae8213:Hide()
    end
end
local function ItemInfo_e82cbfba30c104197e9c9c6d43949874(self, ...)
    if not ItemInfo_7a0f86110e37241bb46f51b3e0530b56 then return end
    local ItemInfo_1f194f793e9150819d886c66d5bc23b5,
          ItemInfo_e498578b78aa0db9c45f30f87d63debc = self:GetItem()
    if (not ItemInfo_1f194f793e9150819d886c66d5bc23b5 or
        type(ItemInfo_1f194f793e9150819d886c66d5bc23b5) ~= "string") then
        return
    end
    local _, _, ItemInfo_0d0e9323a9500f0bec70aa7c547df8b3,
          ItemInfo_5b2b9385dc5869461473771f275680cd, _, itemType, itemSubType,
          ItemInfo_0397db9e44d4d2fb454377be99924ddb, _, _itemTexture, _itemPrice =
        GetItemInfo(ItemInfo_e498578b78aa0db9c45f30f87d63debc)
    local ItemInfo_de3cbe286618f666df102dd52371d2ef =
        ItemInfo_d38674d7124558fa892d69c68668bd01(
            ItemInfo_e498578b78aa0db9c45f30f87d63debc)
    if not ItemInfo_de3cbe286618f666df102dd52371d2ef then return end
    ItemInfo_65407381b6a3a856c701a9dc4af83c36(self) --[[ if (II_Config.GemInfo) then local gemLink, gemLv; local relic1,relic2,relic3 _, _, _, relic1, relic2, relic3 = strsplit(':', ItemInfo_e498578b78aa0db9c45f30f87d63debc) local relics = {relic1,relic2,relic3} for i = 1,#relics do _, gemLink = GetItemGem(ItemInfo_e498578b78aa0db9c45f30f87d63debc, i); if gemLink then local relicType,artifactLevelGain; if RelicSlots[ItemInfo_de3cbe286618f666df102dd52371d2ef] then artifactLevelGain = C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic(gemLink) relicType = RelicTypes[RelicSlots[ItemInfo_de3cbe286618f666df102dd52371d2ef][i] ] end gemLv = select(4,GetItemInfo(gemLink)) if relicType then self:AddDoubleLine(format(' +(%s)|cffffd400[%s]|r%s', artifactLevelGain,gemLv, gemLink), format('|cff00ff00[%s]',relicType), 0, 1, 0, 0, 1, 0) else self:AddLine(format('|cffffd400 [%s] %s|r', gemLv, gemLink)); end end end end ]]
    if (ItemInfo_5b2b9385dc5869461473771f275680cd and
        ItemInfo_5b2b9385dc5869461473771f275680cd > 0 and II_Config.ItemLevel) then
        self:AddLine(format(
                         ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffFFE4B5Item level: %d|r"],
                         ItemInfo_5b2b9385dc5869461473771f275680cd))
    end
    if (II_Config.ItemQulity and ItemInfo_0d0e9323a9500f0bec70aa7c547df8b3) then
        local quality = getglobal(format("ITEM_QUALITY%d_DESC",
                                         ItemInfo_0d0e9323a9500f0bec70aa7c547df8b3))
        if (quality) then self:AppendText(" (" .. quality .. ")") end
    end
    local ItemInfo_a722f7ebe3a21e277257a47471105b36 = 0
    if II_Config.SellValue then
        local price = _itemPrice or 0
        if (type(price) == 'number' and price > 0) then
            self:AddLine(
                ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEEach for sell: |r"])
            ItemInfo_a722f7ebe3a21e277257a47471105b36 = self:NumLines()
            ItemInfo_4ff31b8a539fa2cf7990edc09e693395(self,
                                                      ItemInfo_a722f7ebe3a21e277257a47471105b36,
                                                      price, 1)
        end
        local ItemInfo_f3855ba422be79d226acf0ca95a2b15c
        local ItemInfo_ca0de5e9ed087ac8d67ca8d417281946 = self:GetOwner()
        if ItemInfo_ca0de5e9ed087ac8d67ca8d417281946 and
            ItemInfo_ca0de5e9ed087ac8d67ca8d417281946.count then
            ItemInfo_f3855ba422be79d226acf0ca95a2b15c =
                ItemInfo_ca0de5e9ed087ac8d67ca8d417281946.count
        end
        if (ItemInfo_f3855ba422be79d226acf0ca95a2b15c and
            type(ItemInfo_f3855ba422be79d226acf0ca95a2b15c) == 'number' and
            ItemInfo_f3855ba422be79d226acf0ca95a2b15c > 1) and
            (type(price) == 'number' and price > 0) then
            self:AddLine(
                ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EETotal for sell: |r"])
            ItemInfo_a722f7ebe3a21e277257a47471105b36 = self:NumLines()
            ItemInfo_4ff31b8a539fa2cf7990edc09e693395(self,
                                                      ItemInfo_a722f7ebe3a21e277257a47471105b36,
                                                      price *
                                                          ItemInfo_f3855ba422be79d226acf0ca95a2b15c,
                                                      2)
        end
    end
    if itemType and itemSubType and II_Config.AuctionInfo then
        self:AddDoubleLine(format("AH Info:(%s - %s)", itemType, itemSubType))
    end
    --[[ if (II_Config.AuctionInfo) then local acinfo if (acinfo and acinfo ~= {}) then if (acinfo[1] and acinfo[1] > 0 and acinfo[2] and acinfo[2] > 0) then local ItemInfo_45240f1627e791c3b39d033574b82163 = floor(acinfo[1]/acinfo[2] + 0.5); self:AddLine(ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEStart bid: |r"]); ItemInfo_a722f7ebe3a21e277257a47471105b36 = self:NumLines(); ItemInfo_4ff31b8a539fa2cf7990edc09e693395(self, ItemInfo_a722f7ebe3a21e277257a47471105b36, ItemInfo_45240f1627e791c3b39d033574b82163, 3); if (ItemInfo_0397db9e44d4d2fb454377be99924ddb and ItemInfo_0397db9e44d4d2fb454377be99924ddb > 1) then self:AddLine(format(ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEStart group bid(%d): |r"], ItemInfo_0397db9e44d4d2fb454377be99924ddb)); ItemInfo_a722f7ebe3a21e277257a47471105b36 = self:NumLines(); ItemInfo_4ff31b8a539fa2cf7990edc09e693395(self, ItemInfo_a722f7ebe3a21e277257a47471105b36, ItemInfo_45240f1627e791c3b39d033574b82163*ItemInfo_0397db9e44d4d2fb454377be99924ddb, 4); end end if (acinfo[3] and acinfo[3] > 0 and acinfo[4] and acinfo[4] > 0) then self:AddLine(format(ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEGroup bid(%d%%): |r"], floor(acinfo[4]/acinfo[2]+0.5)*100)); ItemInfo_a722f7ebe3a21e277257a47471105b36 = self:NumLines(); ItemInfo_4ff31b8a539fa2cf7990edc09e693395(self, ItemInfo_a722f7ebe3a21e277257a47471105b36, floor(acinfo[3]/acinfo[4]+0.5), 5); end if (acinfo[5] and acinfo[5] > 0 and acinfo[6] and acinfo[6] > 0) then self:AddLine(format(ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cff7B68EEBid out(%d%%): |r"], floor(acinfo[6]/acinfo[2]+0.5)*100)); ItemInfo_a722f7ebe3a21e277257a47471105b36 = self:NumLines(); ItemInfo_4ff31b8a539fa2cf7990edc09e693395(self, ItemInfo_a722f7ebe3a21e277257a47471105b36, floor(acinfo[5]/acinfo[6]+0.5), 6); end end end ]]
    if (ItemInfo_0397db9e44d4d2fb454377be99924ddb and
        ItemInfo_0397db9e44d4d2fb454377be99924ddb > 1 and II_Config.StackCount) then
        self:AddDoubleLine(format(
                               ItemInfo_27564b0f8fc08d6bd0345695785ce4b6["|cffFFFAFAStack: %d|r"],
                               ItemInfo_0397db9e44d4d2fb454377be99924ddb))
    end
    self:Show()
end
local function Hook_Tooltip_Cleared(object)
    if (object:GetScript("OnTooltipCleared")) then
        object:HookScript("OnTooltipCleared", function()
            ItemInfo_65407381b6a3a856c701a9dc4af83c36(object)
        end)
    else
        object:SetScript("OnTooltipCleared", function()
            ItemInfo_65407381b6a3a856c701a9dc4af83c36(object)
        end)
    end
end
local hasHooked
function ItemInfo_Toggle(switch)
    if (switch) then
        if (not hasHooked) then
            if not ItemInfo_Config.auctionPrice then
                ItemInfo_Config.auctionPrice = {}
            end
            BigFoot_HookItemTip(GameTooltip,
                                ItemInfo_e82cbfba30c104197e9c9c6d43949874)
            BigFoot_HookItemTip(ItemRefTooltip,
                                ItemInfo_e82cbfba30c104197e9c9c6d43949874)
            BigFoot_HookItemTip(ShoppingTooltip1,
                                ItemInfo_e82cbfba30c104197e9c9c6d43949874)
            BigFoot_HookItemTip(ShoppingTooltip2,
                                ItemInfo_e82cbfba30c104197e9c9c6d43949874)
            Hook_Tooltip_Cleared(GameTooltip)
            Hook_Tooltip_Cleared(ItemRefTooltip)
            Hook_Tooltip_Cleared(ShoppingTooltip1)
            Hook_Tooltip_Cleared(ShoppingTooltip2)
            hasHooked = true
        end
        ItemInfo_7a0f86110e37241bb46f51b3e0530b56 = true
    else
        ItemInfo_7a0f86110e37241bb46f51b3e0530b56 = nil
    end
end
function ItemInfo_AuctionToggle(switch)
    if (switch) then
        ItemInfo_f924ef2a8da54a3e2af4e2f83c870fe6 = true
        ItemInfo_bec6b2696ec890fdca8ddd42fbd09040:RegisterEvent(
            "AUCTION_ITEM_LIST_UPDATE")
        ItemInfo_01df612d60ced2cfa8ff3c8d1a39e47d:Enable()
    else
        ItemInfo_f924ef2a8da54a3e2af4e2f83c870fe6 = false
        ItemInfo_bec6b2696ec890fdca8ddd42fbd09040:UnregisterEvent(
            "AUCTION_ITEM_LIST_UPDATE")
        ItemInfo_01df612d60ced2cfa8ff3c8d1a39e47d:Disable()
    end
    ItemInfo_OnAutionEnable(ItemInfo_f924ef2a8da54a3e2af4e2f83c870fe6)
end
function ItemInfo_ClearAcutionInfomation()
    StaticPopup_Show("CLEAR_AUCTION_INFOMATION")
end
function ItemInfo_ContainerItemPreClick(self, button)
    if (button == "RightButton" and not IsModifierKeyDown()) then
        if (AuctionFrame and AuctionFrame:IsVisible()) then
            AuctionFrameTab_OnClick(AuctionFrameTab3)
            if (AuctionsItemButton and AuctionsItemButton:IsVisible()) then
                PickupContainerItem(self:GetParent():GetID(), self:GetID())
                ClickAuctionSellItemButton()
                AuctionsFrameAuctions_ValidateAuction()
            end
        end
    end
end
