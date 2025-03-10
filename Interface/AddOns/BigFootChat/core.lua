local BFChatAddOn = LibStub('AceAddon-3.0'):NewAddon('BigFootChat',
                                                     'AceEvent-3.0',
                                                     'AceConsole-3.0',
                                                     'AceHook-3.0',
                                                     "AceTimer-3.0")
local L = LibStub('AceLocale-3.0'):GetLocale('BigFootChat')
local BFC_IconTableMap = {}
local BFC_ReverseIconTableMap = {}
local BFChat_dd5fbfa5a6e2278bea0e15c976f3b6a8 = 10
local BFC_TextIndex = 0
local db
local event
local defaults = {
    profile = {
        enabletimestamp = false,
        enableOldChatFrameStyle = true,
        enableclasscolor = true,
        useshortname = true,
        enablecopy = false,
        enablechatchannelmove = true,
        enableRollButton = true,
        enableReportButton = true,
        enableRaidersButton = true,
        modules = {["ICONFRAME"] = true, ["CHATFRAME"] = true}
    }
}
local events = {
    ["CHAT_MSG_YELL"] = true,
    ["CHAT_MSG_BN_WHISPER"] = true,
    ["CHAT_MSG_WHISPER"] = true,
    ["CHAT_MSG_WHISPER_INFORM"] = true,
    ["CHAT_MSG_SAY"] = true,
    ["CHAT_MSG_RAID_LEADER"] = true,
    ["CHAT_MSG_RAID"] = true,
    ["CHAT_MSG_RAID_WARNING"] = true,
    ["CHAT_MSG_PARTY"] = true,
    ["CHAT_MSG_PARTY_LEADER"] = true,
    ["CHAT_MSG_GUILD"] = true,
    ["CHAT_MSG_CHANNEL"] = true,
    ["CHAT_MSG_INSTANCE_CHAT"] = true,
    ["CHAT_MSG_DND"] = true,
    ["CHAT_MSG_OFFICER"] = true
}
local SCCN_Chan_Replace = {
    [L["Guild"]] = L["GuildShort"],
    [L["Raid"]] = L["RaidShort"],
    [L["Party"]] = L["PartyShort"],
    [L["Yell"]] = L["YellShort"],
    [L["BattleGround"]] = L["BattleGroundShort"],
    [L["General"]] = L["GeneralShort"],
    [L["Trade"]] = L["TradeShort"],
    [L["WorldDefense"]] = L["WorldDefenseShort"],
    [L["LocalDefense"]] = L["LocalDefenseShort"],
    [L["LFGChannel"]] = L["LFGChannelShort"],
    [L["BigFootChannel"]] = L["BigFootShort"],
    [L["WhisperTo"]] = L["WhisperToShort"],
    [L["WhisperFrom"]] = L["WhisperFromShort"]
}
local joinChannelFunc = function(channel)
    if GetLocale() ~= "zhCN" then return end
    local channelList = DEFAULT_CHAT_FRAME.channelList
    if #channelList < 10 then
        JoinTemporaryChannel(channel)
        local i = 1
        while (channelList[i]) do
            if not channelList[i]:find(channel) then
                i = i + 1
            else
                channelList[i] = channel
                return
            end
        end
        channelList[i] = channel
    end
end
StaticPopupDialogs["BFC_COPYTEXT"] = {
    text = L["Press Ctrl-C to Copy the text"],
    hasEditBox = 1,
    maxLetters = 255,
    hasWideEditBox = 1,
    button1 = ACCEPT,
    button2 = CANCEL,
    OnAccept = function(self) self:Hide() end,
    OnShow = function(self)
        if not BFChatAddOn.copyTextId then return end
        local temp = BFC_TextBuffer[tonumber(BFChatAddOn.copyTextId)]
        self.editBox:SetText(temp or "")
        self.editBox:HighlightText(0)
    end,
    OnHide = function(self) self.editBox:SetText("") end,
    EditBoxOnEnterPressed = function(self)
        local parent = self:GetParent()
        parent:Hide()
    end,
    EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1
}
local function generateIconMap()
    for BFChat_63a9ce6f1eeac72ef41293b7d0303335,
        BFChat_8d0644c92128c1ff68223fd74ba63b56 in pairs(BFC_IconTable) do
        BFC_IconTableMap[BFChat_8d0644c92128c1ff68223fd74ba63b56[1]] =
            BFChat_8d0644c92128c1ff68223fd74ba63b56[2]
    end
    for BFChat_63a9ce6f1eeac72ef41293b7d0303335,
        BFChat_8d0644c92128c1ff68223fd74ba63b56 in pairs(BFC_IconTable) do
        BFC_ReverseIconTableMap[BFChat_8d0644c92128c1ff68223fd74ba63b56[2]] =
            BFChat_8d0644c92128c1ff68223fd74ba63b56[1]
    end
end
local function getpoint(point)
    local point, relPoint, relp, xoff, yoff = unpack(point)
    local relObj = _G[relPoint]
    return point, relObj, relp, xoff, yoff
end
local function setpoint(point, relObj, relp, xoff, yoff)
    return {point, relObj:GetName(), relp, xoff, yoff}
end
local function getCurrentFont()
    local h = GetScreenHeight()
    local _, font = SELECTED_CHAT_FRAME:GetFont()
    font = ceil(font)
    local myfont = (font * 1.5) * h / 768
    return font
end
local function IsBFChannelSysMessage(text)
    if text:find(L["BigFootChannel"]) then
        if text:find(L["JoinChannel1"]) then return true end
        if text:find(L["LeaveChannel"]) then return true end
        if text:find(L["ModifyChannel"]) then return true end
        if text:find(L["OwnChannel"]) then return true end
        if text:find(L["PasswordChange"]) then return true end
        if text:find(L["Banned"]) then return true end
    end
end
function BFC_Print(...)
    local str = ...
    SELECTED_CHAT_FRAME:AddMessage("|cff00adef[" .. L["BFChat"] .. "]|r" .. str)
end
function BFCChatFrame_SavePos(self)
    local point, rel, relp, xoff, yoff = unpack(self.oripoint)
    db.frameposition = setpoint(point, rel, relp,
                                xoff + self.endx - self.startx,
                                yoff + self.endy - self.starty)
    self:SetPoint(getpoint(db.frameposition))
end
function BFChatAddOn:ParseLocalText(text)
    for tag in string.gmatch(text, "|T([^:]+):%d+|t") do
        if (BFC_ReverseIconTableMap[tag]) then
            text = string.gsub(text, "|T[^:]+:%d+|t",
                               BFC_ReverseIconTableMap[tag], 1)
            return text, true
        end
    end
    return text, false
end
function BFChatAddOn:ParseText(text, font)
    if self.sneak then text = text:gsub(sender, replace) end
    for tag in string.gmatch(text, "({[^}]+})") do
        if (BFC_IconTableMap[tag]) then
            local fontSize = getCurrentFont()
            text = text:gsub(tag, "|T" .. BFC_IconTableMap[tag] .. ":" ..
                                 fontSize .. "|t", 1)
            break
        end
    end
    return text
end
function BFChatAddOn:ReverseParseText(text, font)
    for tag in string.gmatch(text, "|T([^:]+):" .. font .. "|t") do
        if (BFC_ReverseIconTableMap[tag]) then
            text = string.gsub(text, "|T[^:]+:" .. font .. "|t",
                               BFC_ReverseIconTableMap[tag], 1)
        end
    end
    return text
end
local function checkResetPassword(text)
    if text:find(L["BigFootChannel"]) and text:find(L["OwnChannel"]) and
        text:find((UnitName("player"))) then
        SetChannelPassword(BFChatAddOn.nextChannel or L["BigFootChannel"], "")
    end
end
local function getNextChannel(channelName)
    local i = 1
    local cur
    if channelName:find(L["BigFootChannel"]) then
        cur = channelName:match("%d")
        if cur then i = tonumber(cur) + 1 end
        return L["BigFootChannel"] .. i
    end
end
local function getBFChannelNum(channelNum)
    local ChannelList = BFChatAddOn:GetChannelListTab(GetChannelList())
    for k, v in pairs(ChannelList) do
        if mod(k, 3) == 2 then
            if v:find(L["BigFootChannel"]) and channelNum == ChannelList[k - 1] then
                return true
            end
        end
    end
end
local ChannelNum
local function S_GetChannel(text)
    if not text then return end
    local a, b = string.find(text, "Hchannel:channel:")
    if b then
        local e = string.find(text, "|h", b + 1)
        if e then
            local f = string.sub(text, b + 1, e - 1)
            f = tonumber(f)
            if f then
                if ChannelNum and f == ChannelNum then
                    ChannelNum = f
                    return true
                elseif getBFChannelNum(f) then
                    ChannelNum = f
                    return true
                end
            end
        end
    end
end
local function S_GetMessage(text)
    local message = nil
    local a, b = string.find(text, "|h：")
    if b then message = string.sub(text, b + 1) end
    message = message and message:gsub("|cf.*|h|r", "") or message
    message = message and message:gsub("%p", "") or message
    message = message and message:gsub("%s", "") or message
    return message
end
local function S_GetSpeaker(text)
    local Speaker = nil
    local a, b, c, d = string.find(text, "Hplayer:")
    if b then
        local e = string.find(text, ":", b + 1)
        if e then
            local f = string.sub(text, b + 1, e - 1)
            if f then Speaker = f end
        end
    end
    return Speaker
end
local currentTime, isReturn
local SpeakerTab = {}
local function IsOldSpeak(speaker, messageText)
    currentTime = GetTime()
    if not SpeakerTab[speaker] then
        SpeakerTab[speaker] = {}
        SpeakerTab[speaker][1] = currentTime
        SpeakerTab[speaker].lastText = messageText
    else
        if SpeakerTab[speaker][#SpeakerTab[speaker]] == currentTime then
            return
        end
        isReturn = false
        if #SpeakerTab[speaker] >= 3 then
            if currentTime - SpeakerTab[speaker][1] >=
                BFChat_dd5fbfa5a6e2278bea0e15c976f3b6a8 then
                if (SpeakerTab[speaker].lastText == messageText) and
                    (currentTime - SpeakerTab[speaker][3] < 5) then
                    isReturn = true
                end
                SpeakerTab[speaker][1] = SpeakerTab[speaker][2]
                SpeakerTab[speaker][2] = SpeakerTab[speaker][3]
                SpeakerTab[speaker][3] = currentTime
                SpeakerTab[speaker].lastText = messageText
            else
                isReturn = true
            end
        else
            SpeakerTab[speaker][#SpeakerTab[speaker] + 1] = currentTime
            if (SpeakerTab[speaker].lastText == messageText) and
                (currentTime - SpeakerTab[speaker][#SpeakerTab[speaker] - 1] < 5) then
                isReturn = true
            else
                SpeakerTab[speaker].lastText = messageText
            end
        end
        if isReturn then return true end
    end
end
local Ban_Tables = {
    "工作室", "点心", "烧&大&小-饼", "擔保", "自己上号",
    "特价&优惠-套餐", "当天下单", "承&诚-接", "纯手-工&打",
    "代&带&dai-打&练&刷&售&评级", "打&卖&售-金&g",
    "刷&扰-屏&频-见谅", "详-情&谈&询", "信-誉&赖", "价.*优惠",
    "绑定.*上马", "上马.*绑定", "价格公道", "付款",
    "先.*后-款&钱", "游戏币", "无黑金", "不封号", "无风险",
    "金&g-币&元", "支付-宝&寶", "掏&淘&tao-宝&bao&寶", "皇&冲-冠",
    "热&促-销", "咨-询&詢", "联-系&係", "旺&汪&枉-旺&汪&枉",
    "口口", "扣扣", "叩叩", "歪歪", "平-台&臺", "店铺",
    "线下团", "月薪", "专业团队", "优惠业务", "游戏不回",
    "诚信服务", "练.*加.*", "练&业务-.*交易.*", "品质保证",
    "%d+.*联系.*", "牛不白", "美味切糕"
}
local BanWordTable = {}
local Ban_Table = {}
local Ban_WordTable = {}
local function addToBanTable(t)
    if #BanWordTable > 0 then
        local newBanWordTable = {}
        local tempWord
        for _, oword in pairs(BanWordTable) do
            for _, word in pairs(t) do
                tempWord = oword .. word
                table.insert(newBanWordTable, tempWord)
            end
        end
        BanWordTable = newBanWordTable
    else
        BanWordTable = t
    end
end
local function splitWord(word)
    local tempTable = {}
    local begin, ends
    if word:find("&") then
        while word:find("&") do
            begin, ends = word:find("&")
            table.insert(tempTable, word:sub(1, begin - 1))
            word = word:sub(ends + 1)
        end
    end
    table.insert(tempTable, word)
    addToBanTable(tempTable)
end
local function findBandWord(word, index)
    if word:find("-") then
        local begin, ends, tempWord
        while word:find("-") do
            begin, ends = word:find("-")
            tempWord = word:sub(1, begin - 1)
            splitWord(tempWord)
            word = word:sub(ends + 1)
        end
        splitWord(word)
    else
        local tempTable = {word}
        addToBanTable(tempTable)
    end
    table.insert(Ban_Table, BanWordTable)
    BanWordTable = {}
end
local function madeBanWords()
    for k, v in pairs(Ban_Tables) do findBandWord(v) end
    if #Ban_Table > 0 then
        for _, v in pairs(Ban_Table) do
            if v then
                for _, j in pairs(v) do
                    table.insert(Ban_WordTable, j)
                end
            end
        end
    end
end
local function IsBanMessage(text)
    for _, v in pairs(Ban_WordTable) do
        if string.find(text:lower(), v:lower()) then return true end
    end
    return
end
local Command = {}
local function IsOrderMessage(text)
    for k, v in pairs(Command) do
        if string.find(text, k) then
            print(k)
            return true
        end
    end
    return
end
local speaker, messageText
local function S_AddMessage(self, text, r, g, b, id, ...)
    if text then
        if IsBFChannelSysMessage(text) then
            checkResetPassword(text)
            return
        end
        if S_GetChannel(text) then
            if db.mute then return end
            speaker = S_GetSpeaker(text)
            messageText = S_GetMessage(text)
            if speaker and messageText then
                if IsBanMessage(messageText) then return end
                if IsOldSpeak(speaker, messageText) then return end
            end
        end
    end
    if event and events[event] then
        if (db.useshortname) then
            local temp = nil
            if text then
                if strsub(event, 1, 10) ~= "CHAT_MSG_S" then
                    for BFChat_63a9ce6f1eeac72ef41293b7d0303335,
                        BFChat_8d0644c92128c1ff68223fd74ba63b56 in
                        pairs(SCCN_Chan_Replace) do
                        temp = string.gsub(text, " " ..
                                               BFChat_63a9ce6f1eeac72ef41293b7d0303335 ..
                                               "]",
                                           BFChat_8d0644c92128c1ff68223fd74ba63b56 ..
                                               "%]", 1)
                        temp = string.gsub(temp,
                                           BFChat_63a9ce6f1eeac72ef41293b7d0303335 ..
                                               "]",
                                           BFChat_8d0644c92128c1ff68223fd74ba63b56 ..
                                               "%]", 1)
                        temp = string.gsub(temp,
                                           BFChat_63a9ce6f1eeac72ef41293b7d0303335 ..
                                               "：",
                                           BFChat_8d0644c92128c1ff68223fd74ba63b56 ..
                                               "：", 1)
                        temp = string.gsub(temp, "^" ..
                                               BFChat_63a9ce6f1eeac72ef41293b7d0303335,
                                           BFChat_8d0644c92128c1ff68223fd74ba63b56,
                                           1)
                        if temp ~= text then
                            text = temp
                            temp = nil
                            break
                        end
                    end
                end
            end
        end
        if text then
            text = BFChatAddOn:ParseText(text)
            BFC_TextIndex = BFC_TextIndex + 1
        end
    end
    if self.ORG_AddMessage then self:ORG_AddMessage(text, r, g, b, id, ...) end
end
local function BFC_ChatFrameHandler_Recover(self, _event, ...)
    event = _event
    if (self.ORG_AddMessage) then self.AddMessage = self.ORG_AddMessage end
    BFChatAddOn.hooks['ChatFrame_MessageEventHandler'](self, event, ...)
end
local function BFC_ChatFrameHandler(self, _event, ...)
    event = _event
    if (strsub(event, 1, 8) == "CHAT_MSG") then
        local msg, player = ...
        if (not event or not player) then
            BFChatAddOn.hooks['ChatFrame_MessageEventHandler'](self, event, ...)
            return nil
        end
        if (not self.ORG_AddMessage) then
            self.ORG_AddMessage = self.AddMessage
            self.AddMessage = S_AddMessage
        end
        if msg and player then
            BFChatAddOn.hooks['ChatFrame_MessageEventHandler'](self, event, ...)
        end
    end
end
function BFChatAddOn:GetenglishClassName(Class)
    local englishName
    if Class then
        if L.Mage == Class then englishName = "Mage" end
        if L.Druid == Class then englishName = "Druid" end
        if L.Hunter == Class then englishName = "Hunter" end
        if L.Paladin == Class then englishName = "Paladin" end
        if L.Priest == Class then englishName = "Priest" end
        if L.Rogue == Class then englishName = "Rogue" end
        if L.Shaman == Class then englishName = "Shaman" end
        if L.Warlock == Class then englishName = "Warlock" end
        if L.Warrior == Class then englishName = "Warrior" end
        if L.DeathKnight == Class then englishName = "DeathKnight" end
    end
    if englishName then englishName = strupper(englishName) end
    return englishName
end
function BFChatAddOn:FindFriendClassByName(name)
    local m_name = name
    local totalBNet, numBNetOnline = BNGetNumFriends()
    local hasFocus, toonName, client, realmName, realmID, faction, race, class,
          guild, zoneName, level, gameText
    local presenceID, givenName, surname, toonName, toonID, client, isOnline,
          lastOnline, isAFK, isDND, broadcastText, noteText, isFriend,
          broadcastTime
    local nameText
    local playnumberGive
    local playnumber
    string.gsub(m_name, ".-(%d+).-", function(number)
        if tonumber(number) and tonumber(number) ~= 0 then
            playnumberGive = tonumber(number)
        end
    end)
    for i = 1, totalBNet do
        presenceID, givenName, battleTag, isBattleTagPresence, toonName, toonID, client, isOnline, lastOnline, isAFK, isDND, messageText, noteText, isRIDFriend, broadcastTime, canSoR =
            BNGetFriendInfo(i)
        if presenceName and battleTag and toonName and toonID then
            nameText = format(BATTLENET_NAME_FORMAT, givenName, battleTag)
            string.gsub(nameText, ".-(%d+).-", function(number)
                if tonumber(number) and tonumber(number) ~= 0 then
                    playnumber = tonumber(number)
                end
            end)
            if playnumberGive == playnumber then
                hasFocus, toonName, client, realmName, realmID, faction, race, class, guild, zoneName, level, gameText =
                    BNGetGameAccountInfo(toonID)
            else
            end
        end
    end
    return class
end
function BFChatAddOn.GetColoredName(event, arg1, arg2, arg3, arg4, arg5, arg6,
                                    arg7, arg8, arg9, arg10, arg11, arg12)
    local chatType = strsub(event, 10)
    if (strsub(chatType, 1, 7) == "WHISPER") then chatType = "WHISPER" end
    if (strsub(chatType, 1, 7) == "CHANNEL") then
        chatType = "CHANNEL" .. arg8
    end
    local info = ChatTypeInfo[chatType]
    if event == "CHAT_MSG_BN_WHISPER_INFORM" or event == "CHAT_MSG_BN_WHISPER" then
        local Class = BFChatAddOn:FindFriendClassByName(arg2)
        local englishClass = BFChatAddOn:GetenglishClassName(Class)
        if englishClass then
            local classColorTable = RAID_CLASS_COLORS[englishClass]
            if (not classColorTable) then return arg2 end
            return string.format("\124cff%.2x%.2x%.2x", classColorTable.r * 255,
                                 classColorTable.g * 255,
                                 classColorTable.b * 255) .. arg2 .. "\124r"
        end
    end
    if (info and info.colorNameByClass and arg12 ~= "") then
        local localizedClass, englishClass, localizedRace, englishRace, sex =
            GetPlayerInfoByGUID(arg12)
        if (englishClass) then
            local classColorTable = RAID_CLASS_COLORS[englishClass]
            if (not classColorTable) then return arg2 end
            return string.format("\124cff%.2x%.2x%.2x", classColorTable.r * 255,
                                 classColorTable.g * 255,
                                 classColorTable.b * 255) .. arg2 .. "\124r"
        end
    end
    return arg2
end
function BFChatAddOn:MaskSystemColoring(flag)
    local m_ChatTypeInfo
    for k, v in pairs(getmetatable(ChatTypeInfo)) do
        if k == "__index" then m_ChatTypeInfo = v end
    end
    if flag then
        for _chatType, _table in pairs(m_ChatTypeInfo) do
            ToggleChatColorNamesByClassGroup(1, _chatType)
        end
    else
        for _chatType, _isColoring in pairs(m_ChatTypeInfo) do
            ToggleChatColorNamesByClassGroup(nil, _chatType)
        end
    end
end
function BFChatAddOn:SetItemRef(link, text, button, chatFrame)
    if not string.find(link, "bfcnamecopyproof") then
        self.hooks['SetItemRef'](link, text, button, chatFrame)
    else
        local id = string.match(link, "%d+", 1)
        self.copyTextId = id
        StaticPopup_Show("BFC_COPYTEXT")
    end
end
function BFChatAddOn:UnhookEvents() self:UnregisterAllEvents() end
function BFChatAddOn:Refresh()
    BFCChatFrame:SetMovable(db.enablechatchannelmove)
    BFChatAddOn:MaskSystemColoring(db.enableclasscolor)
    if db and db.frameposition then
        BFCChatFrame:SetPoint(unpack(db.frameposition))
    else
        BFCChatFrame:SetPoint("TOPLEFT", ChatFrame1, "BOTTOMLEFT", -5, -2)
    end
end
function BFChatAddOn:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("BFCDB", defaults, "Default")
    self.db.RegisterCallback(self, "OnProfileChanged", "Refresh")
    self.db.RegisterCallback(self, "OnProfileCopied", "Refresh")
    self.db.RegisterCallback(self, "OnProfileReset", "Refresh")
    self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
    self:RegisterEvent("CHANNEL_UI_UPDATE")
    self:RegisterEvent("CHANNEL_PASSWORD_REQUEST")
    db = self.db.profile
    self:SetupOptions()
    generateIconMap()
    madeBanWords()
end
local function BFChat_84ad48e612a92b69c1b98d3185056f3c(editbox)
    editbox:SetAttribute("bfwhispermode", "true")
end
local function BFChat_3eca70aa558d6bc043280757ebe23e94(editbox)
    editbox:SetAttribute("bfwhispermode", nil)
end
local function BFChat_8789b1a0b4da92efd2a9bb111a773e4c(editbox, name, val)
    if name == "bfwhispermode" then
        if not editbox.bfChatType then editbox.bfChatType = "SAY" end
        if not val then
            editbox:SetAttribute("chatType", editbox.bfChatType)
            ChatEdit_UpdateHeader(editbox)
        end
    end
end
local isReturns
local SpeakTab = {}
function BFChatAddOn:EnableOldStyleReply()
    hooksecurefunc("ChatEdit_SendText", function(editBox, ...)
        local type = editBox:GetAttribute("chatType")
        local text = editBox:GetText()
        if (text and type ~= "WHISPER" and type ~= "BN_WHISPER") then
            editBox.bfChatType = type
        end
    end)
    local SendChatMessage_Origin = SendChatMessage
    SendChatMessage = function(text, type, language, chanelId, ...)
        if type == "CHANNEL" and text and text ~= "" and tonumber(chanelId) ==
            getBigFootChannel() then
            local currentTimes = time()
            isReturns = false
            if #SpeakTab >= 3 then
                if currentTimes - SpeakTab[1] >=
                    BFChat_dd5fbfa5a6e2278bea0e15c976f3b6a8 then
                    if (SpeakTab.lastText == text) and
                        (currentTimes - SpeakTab[3] < 5) then
                        isReturns = true
                        BFC_Print(L["Please Do Not Send Same Message In 5s"])
                    end
                    SpeakTab[1] = SpeakTab[2]
                    SpeakTab[2] = SpeakTab[3]
                    SpeakTab[3] = currentTimes
                    SpeakTab.lastText = text
                else
                    isReturns = true
                    BFC_Print(L["Please Do Not Talk Too Fast"])
                end
            else
                SpeakTab[#SpeakTab + 1] = currentTimes
                if (SpeakTab.lastText == text) and
                    (currentTimes - SpeakTab[#SpeakTab - 1] < 5) then
                    isReturns = true
                    BFC_Print(L["Please Do Not Send Same Message In 5s"])
                else
                    SpeakTab.lastText = text
                end
            end
            if isReturns then return end
        end
        return SendChatMessage_Origin(text, type, language, chanelId, ...)
    end
    hooksecurefunc("ChatEdit_ClearChat", function(editBox)
        BFChat_3eca70aa558d6bc043280757ebe23e94(editBox)
    end)
    ChatFrame1EditBox:SetScript("OnAttributeChanged", function(...)
        if (db.enableOldChatFrameStyle) then
            BFChat_8789b1a0b4da92efd2a9bb111a773e4c(...)
        end
    end)
    hooksecurefunc("ChatFrame_ReplyTell", function(chatFrame)
        local editBox = ChatEdit_ChooseBoxForSend(chatFrame)
        BFChat_84ad48e612a92b69c1b98d3185056f3c(editBox)
    end)
    hooksecurefunc("ChatFrame_ReplyTell2", function(chatFrame)
        local editBox = ChatEdit_ChooseBoxForSend(chatFrame)
        BFChat_84ad48e612a92b69c1b98d3185056f3c(editBox)
    end)
end
function BFChatAddOn:IsDisplayChannelOwner()
    local selectIndex = GetSelectedDisplayChannel()
    if selectIndex > 0 then
        local channelName = GetChannelDisplayInfo(selectIndex)
        if channelName:find(L["BigFootChannel"]) then return false end
    end
    return self.hooks['IsDisplayChannelOwner']()
end
local isBanned
function BFChatAddOn:CHAT_MSG_CHANNEL_NOTICE(...)
    local _, message, _, _, _, _, _, _, _, channelName = ...
    if message == "BANNED" and channelName:find(L["BigFootChannel"]) then
        isBanned = true
        self.nextChannel = getNextChannel(channelName)
        joinChannelFunc(self.nextChannel)
    end
end
function BFChatAddOn:CHANNEL_UI_UPDATE(...)
    local ChannelList = BFChatAddOn:GetChannelListTab(GetChannelList())
    for k, v in pairs(ChannelList) do
        if mod(k, 3) == 2 then
            if v:find(L["BigFootChannel"]) then return end
        end
    end
    if not isBanned then joinChannelFunc(L["BigFootChannel"]) end
end
function BFChatAddOn:CHANNEL_PASSWORD_REQUEST(...)
    local _, channelName = ...
    if channelName:find(L["BigFootChannel"]) then
        self.nextChannel = getNextChannel(channelName)
        joinChannelFunc(self.nextChannel)
    else
        local dialog = StaticPopup_Show("CHAT_CHANNEL_PASSWORD", channelName)
        if (dialog) then dialog.data = channelName end
        return
    end
end
function BFChatAddOn:FCF_FadeInChatFrame(chatFrame)
    BFChannelMuteButton:Show()
    UIFrameFadeIn(BFChannelMuteButton, CHAT_FRAME_FADE_TIME, 0.5, 1)
    if ChannelFilterMuteButton then
        ChannelFilterMuteButton:Show()
        UIFrameFadeIn(ChannelFilterMuteButton, CHAT_FRAME_FADE_TIME, 0.5, 1)
    end
end
function BFChatAddOn:FCF_FadeOutChatFrame(chatFrame)
    UIFrameFadeOut(BFChannelMuteButton, CHAT_FRAME_FADE_OUT_TIME,
                   BFChannelMuteButton:GetAlpha(), 0)
    if ChannelFilterMuteButton then
        UIFrameFadeOut(ChannelFilterMuteButton, CHAT_FRAME_FADE_OUT_TIME,
                       ChannelFilterMuteButton:GetAlpha(), 0)
    end
end
function BFChatAddOn:GetChannelListTab(...) return {...} end
function BFChatAddOn:OnEnable()
    if self:IsHooked('ChatFrame_MessageEventHandler') then
        self:Unhook('ChatFrame_MessageEventHandler')
    end
    self:RawHook('ChatFrame_MessageEventHandler', BFC_ChatFrameHandler, true)
    self:RawHook('IsDisplayChannelOwner', true)
    self:SecureHook("FCF_FadeInChatFrame")
    self:SecureHook("FCF_FadeOutChatFrame")
    self:EnableOldStyleReply()
    BFChannel_RefreshMuteButton()
    UIParent_ManageFramePositions()
    BigFoot_DelayCall(BFChatAddOn.ReSetBigfootChannelSet, 12)
end
function BFChatAddOn:ReSetBigfootChannelSet()
    joinChannelFunc(L["BigFootChannel"])
    local ChannelList = BFChatAddOn:GetChannelListTab(GetChannelList())
    for k, v in pairs(ChannelList) do
        if mod(k, 3) == 2 then
            if v == L["BigFootChannel"] then
                ChatFrame_RemoveChannel(DEFAULT_CHAT_FRAME, v)
                ChatFrame_AddChannel(DEFAULT_CHAT_FRAME, v)
            end
        end
    end
end
function BFChatAddOn:OnDisable()
    if self:IsHooked('ChatFrame_MessageEventHandler') then
        self:Unhook('ChatFrame_MessageEventHandler')
    end
    self:RawHook('ChatFrame_MessageEventHandler', BFC_ChatFrameHandler_Recover,
                 true)
    self:UnhookEvents()
end
function BFChatAddOn:GetModuleEnabled(module) return db.modules[module] end
function BFChatAddOn:SetModuleEnabled(module, value)
    local old = db.modules[module]
    db.modules[module] = value
    if old ~= value then
        if value then
            self:EnableModule(module)
        else
            self:DisableModule(module)
        end
    end
end
function BFChannel_RefreshMuteButton()
    if db.mute then
        BFChannelMuteButtonMute:Show()
    else
        BFChannelMuteButtonMute:Hide()
    end
end
function BFChannelMuteButton_OnClick()
    db.mute = not db.mute
    if db.mute then
        BFC_Print(L["BigFoot Channel has been blocked"])
    else
        BFC_Print(L["BigFoot Channel has been unblocked"])
    end
    BFChannel_RefreshMuteButton()
end
function ChangeSet()
    hooksecurefunc("UIParent_ManageFramePositions", function()
        if (DEFAULT_CHAT_FRAME:IsUserPlaced()) then
            if (SIMPLE_CHAT ~= "1") then return end
        end
        if not BFChatAddOn:GetModule("CHATFRAME"):IsEnabled() then return end
        local chatOffset = 85
        if (GetNumShapeshiftForms() > 0 or HasPetUI() or PetHasActionBar()) then
            if (MultiBarBottomLeft:IsShown()) then
                chatOffset = chatOffset + 55
            else
                chatOffset = chatOffset + 15
            end
        elseif (MultiBarBottomLeft:IsShown()) then
            chatOffset = chatOffset + 15
        end
        DEFAULT_CHAT_FRAME:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 32,
                                    chatOffset + 25)
    end)
    hooksecurefunc("ResetChatWindows",
                   function() DEFAULT_CHAT_FRAME:SetUserPlaced(false) end)
end
function BFChatAddOn:BFChannelRollButton_OnClick()
    self.db.profile.enableRollButton = not self.db.profile.enableRollButton
    if self.db.profile.enableRollButton then
        BFCIconFrameRollButton:Show()
    else
        BFCIconFrameRollButton:Hide()
    end
end
function BFChatAddOn:BFChannelReportButton_OnClick()
    self.db.profile.enableReportButton = not self.db.profile.enableReportButton
    if self.db.profile.enableReportButton then
        BFCIconFrameReportButton:Show()
    else
        BFCIconFrameReportButton:Hide()
    end
end
function BFChatAddOn:BFChannelRaidersButton_OnClick()
    self.db.profile.enableRaidersButton =
        not self.db.profile.enableRaidersButton
    createRaidersFrame()
end
local f = CreateFrame 'Frame'
local reflash = 1080
local kId = 1
--SELECTED_CHAT_FRAME:AddMessage(L["Kindly Reminder"][kId], 1.0, 0.82, 0.0)
_G.BigFootChat = BFChatAddOn
