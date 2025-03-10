local _G = _G
local hooksecurefunc, select, tonumber, strfind = hooksecurefunc, select,
                                                  tonumber, strfind
local BFTooltip_d21ea2df7d42b70936e5762719760d32 =
    BLibrary:CreateInstance("BHook")
local BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c = BLibrary("BSecureHook")
local BFTooltip_073f44590a2a7f437c05b9420615abb4 =
    CreateFrame("Frame", nil, UIParent)
local LibInspect = LibStub("LibInspect")
local maxage = 180
LibInspect:SetMaxAge(maxage)
local GameTooltip = GameTooltip
local BFTooltip_f2a8d52cb3b8454fce64eb2c12287307 = CORPSE
local BFTooltip_8c1238cf8b8bd7ccabfff661320b7233 = 4
local BFTooltip_adc9d1f00fa6bd4940e624b4c5235840 = "|cff888888"
local BFTooltip_6e397a8792a702ef576ac7368d5eaf88 = "|c0000ff00"
local BFTooltip_3f6959cb5e57fd67ab669170c8632b28 = "|CFFFFD000"
local BFTooltip_ad5a531d1bf71036cd3ca155666b4c35,
      BFTooltip_843a1e5002d398bc3baccfb6f1ab3613,
      BFTooltip_31d97b8fc6222bacc6c0821bca5ee74f
local BFTooltip_6bd5608f64f02bafe9f43448c9c73096,
      BFTooltip_890c94a500c19557d08d3b668c687d64
local BFTooltip_74859e1ca060dcaf910e42c2ec790c32,
      BFTooltip_662ca10dea06cc70b2070def0e0dadfa
local BFTooltip_c196f82539db628c892d24f623bdf3de,
      BFTooltip_d071e7fda59e4ddabd38cd6dd075f81c
if (GetLocale() == "zhCN") then
    BFTooltip_ad5a531d1bf71036cd3ca155666b4c35 = "|CFFFF0000>>你<<|r"
    BFTooltip_843a1e5002d398bc3baccfb6f1ab3613 = "目标："
    BFTooltip_31d97b8fc6222bacc6c0821bca5ee74f = "专精：%s |r"
    BFTooltip_6bd5608f64f02bafe9f43448c9c73096 =
        "正在查询目标当前装等"
    BFTooltip_890c94a500c19557d08d3b668c687d64 = "当前装等："
    BFTooltip_c196f82539db628c892d24f623bdf3de = "装等"
    BFTooltip_d071e7fda59e4ddabd38cd6dd075f81c = "专精"
    BFTooltip_74859e1ca060dcaf910e42c2ec790c32 =
        {
            ["elite"] = "精英",
            ["worldboss"] = "首领",
            ["rare"] = "稀有",
            ["rareelite"] = "稀有精英"
        }
    BFTooltip_662ca10dea06cc70b2070def0e0dadfa =
        {
            "仇恨", "敌对", "冷淡", "中立", "友善", "尊敬",
            "崇敬", "崇拜"
        }
elseif (GetLocale() == "zhTW") then
    BFTooltip_ad5a531d1bf71036cd3ca155666b4c35 = "|CFFFF0000>>你<<|r"
    BFTooltip_843a1e5002d398bc3baccfb6f1ab3613 = "目標："
    BFTooltip_31d97b8fc6222bacc6c0821bca5ee74f = "專精：%s |r"
    BFTooltip_6bd5608f64f02bafe9f43448c9c73096 =
        "正在查詢目標當前裝等"
    BFTooltip_890c94a500c19557d08d3b668c687d64 = "當前裝等"
    BFTooltip_c196f82539db628c892d24f623bdf3de = "裝等"
    BFTooltip_d071e7fda59e4ddabd38cd6dd075f81c = "專精"
    BFTooltip_74859e1ca060dcaf910e42c2ec790c32 =
        {
            ["elite"] = "精英",
            ["worldboss"] = "首領",
            ["rare"] = "稀有",
            ["rareelite"] = "稀有精英"
        }
    BFTooltip_662ca10dea06cc70b2070def0e0dadfa =
        {
            "仇恨", "敵對", "冷淡", "中立", "友善", "尊敬",
            "崇敬", "崇拜"
        }
else
    BFTooltip_ad5a531d1bf71036cd3ca155666b4c35 = "|CFFFF0000>>YOU<<|r"
    BFTooltip_843a1e5002d398bc3baccfb6f1ab3613 = "Target: "
    BFTooltip_31d97b8fc6222bacc6c0821bca5ee74f = "Talent: %s |r"
    BFTooltip_6bd5608f64f02bafe9f43448c9c73096 = "Item Level ..."
    BFTooltip_890c94a500c19557d08d3b668c687d64 = "Item Level"
    BFTooltip_c196f82539db628c892d24f623bdf3de = "Item Level"
    BFTooltip_d071e7fda59e4ddabd38cd6dd075f81c = "Talent"
    BFTooltip_74859e1ca060dcaf910e42c2ec790c32 =
        {
            ["elite"] = "Elite",
            ["worldboss"] = "Boss",
            ["rare"] = "Rare",
            ["rareelite"] = "Rare Elite"
        }
    BFTooltip_662ca10dea06cc70b2070def0e0dadfa =
        {
            "Hated", "Hostile", "Unfriendly", "Neutral", "Friendly", "Honored",
            "Revered", "Exalted"
        }
end
local hook, switch
local InspectInfo = {}
local playerGUID = UnitGUID("player")
local BFTooltip_078de750fe835178a4e8445fca9d135e =
    {
        [1] = {nil, nil},
        [2] = {"TOPLEFT", "BOTTOMLEFT"},
        [3] = {"TOPLEFT", "TOPLEFT"},
        [4] = {"TOP", "TOP"},
        [5] = {"TOPRIGHT", "TOPRIGHT"},
        [6] = {"LEFT", "LEFT"},
        [7] = {"CENTER", "CENTER"},
        [8] = {"RIGHT", "RIGHT"},
        [9] = {"BOTTOMLEFT", "BOTTOMLEFT"},
        [10] = {"BOTTOM", "BOTTOM"},
        [11] = {"BOTTOMRIGHT", "BOTTOMRIGHT"}
    }
local BFTooltip_3b4c6e8428fd1b418187eeddfb50851b =
    {
        ["HUNTER"] = "|cffabd473",
        ["WARLOCK"] = "|cff9382C9",
        ["PRIEST"] = "|cffffffff",
        ["PALADIN"] = "|cfff48cba",
        ["MAGE"] = "|cff69ccf0",
        ["ROGUE"] = "|cfffff569",
        ["DRUID"] = "|cffff7c0a",
        ["SHAMAN"] = "|cff0070de",
        ["WARRIOR"] = "|cffc79c6e",
        ["DEATHKNIGHT"] = "|cffc41f3b",
        ["MONK"] = "|cff00ff96",
        ["DEMONHUNTER"] = "|cffa330c9",
        ["DEFAULT"] = "|cffa0a0a0"
    }
local BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc =
    {
        [1] = "|cffff0000",
        [2] = "|cffff6600",
        [3] = "|cffffff00",
        [4] = "|cff00ff00",
        [5] = "|cff888888",
        [6] = "|cffffcc00"
    }
local BFTooltip_0287b1fb03d1295056e85a0f995b5dba =
    {
        ["elite"] = "|cffffcc00",
        ["worldboss"] = "|cffff0000",
        ["rare"] = "|cffff66ff",
        ["rareelite"] = "|cffffaaff"
    }
local BFTooltip_d529cdbee72d24a256b536b5aa241d53 =
    {
        [1] = {["r"] = 0.0, ["g"] = 0.0, ["b"] = 0.5},
        [2] = {["r"] = 0.5, ["g"] = 0.5, ["b"] = 0.0},
        [3] = {["r"] = 0.5, ["g"] = 0.0, ["b"] = 0.5},
        [4] = {["r"] = 0.5, ["g"] = 0.0, ["b"] = 0.0},
        [5] = {["r"] = 0.0, ["g"] = 0.0, ["b"] = 0.0}
    }
BFTT_Config = {
    ["Anchor"] = 1,
    ["PositionX"] = -20,
    ["PositionY"] = -25,
    ["Fade"] = 0,
    ["Talent"] = 2,
    ["ItemLevel"] = 1,
    ["TOT"] = 2,
    ["Actor"] = 2,
    ["GuildRank"] = 1,
    ["TooltipType"] = 0
}
local mediapath = "Interface\\AddOns\\BFTooltip\\media\\"
local GetTime = GetTime
local find = string.find
local format = string.format
local InCombatLockdown = InCombatLockdown
local PVP = PVP
local FACTION_ALLIANCE = FACTION_ALLIANCE
local FACTION_HORDE = FACTION_HORDE
local LEVEL = LEVEL
local CHAT_FLAG_AFK = CHAT_FLAG_AFK
local CHAT_FLAG_DND = CHAT_FLAG_DND
local targettext = TARGET
local DEAD = DEAD
local BOSS = BOSS
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local FACTION_BAR_COLORS = FACTION_BAR_COLORS
local ICON_LIST = ICON_LIST
local NORMAL_FONT_COLOR = NORMAL_FONT_COLOR
local GameTooltipStatusBar = GameTooltipStatusBar
local GameTooltipHeaderText = GameTooltipHeaderText
local GameTooltipText = GameTooltipText
local GameTooltipTextSmall = GameTooltipTextSmall
local INTERACTIVE_SERVER_LABEL = INTERACTIVE_SERVER_LABEL
local FOREIGN_SERVER_LABEL = FOREIGN_SERVER_LABEL
local COALESCED_REALM_TOOLTIP1 = string.split(FOREIGN_SERVER_LABEL,
                                              COALESCED_REALM_TOOLTIP)
local INTERACTIVE_REALM_TOOLTIP1 = string.split(INTERACTIVE_SERVER_LABEL,
                                                INTERACTIVE_REALM_TOOLTIP)
local ITEM_LEVEL_ABBR = "装等"
local ilvlText = "|cffFFFFFF%0.2f|r"
local specText = "|cffFFFFFF%s|r"
local newType_config = {
    font = mediapath .. "expressway.ttf",
    fontsize = 18,
    outline = "OUTLINE",
    tex = mediapath .. "bar",
    scale = 1.1,
    cursor = false,
    hideTitles = true,
    hideRealm = false,
    hideFaction = true,
    hidePvP = true,
    showFactionIcon = true,
    factionIconSize = 45,
    factionIconAlpha = 1,
    backdrop = {
        bgFile = "Blizzard Dialog Background Dark",
        edgeFile = mediapath .. "SeerahSolidBorder",
        tile = false,
        tileSize = 16,
        edgeSize = 3,
        insets = {left = 3, right = 3, top = 3, bottom = 3}
    },
    bgcolor = {r = 0.05, g = 0.05, b = 0.05, t = 1},
    bdrcolor = {r = 0, g = 0, b = 0},
    gcolor = {r = 1, g = 0.1, b = 0.8},
    you = ">>你<<",
    colorborderClass = true,
    colorborderItem = true,
    combathide = false,
    combathideALL = false,
    multiTip = true,
    hideHealthbar = false,
    powerbar = true,
    powerManaOnly = true,
    showRank = true,
    auraID = true,
    auraCaster = true
}
local colors = {power = {}}
for power, color in next, PowerBarColor do
    if (type(power) == 'string') then
        colors.power[power] = {color.r, color.g, color.b}
    end
end
colors.power['MANA'] = {.31, .45, .63}
colors.power['RAGE'] = {.69, .31, .31}
local slots = {
    "Back", "Chest", "Feet", "Finger0", "Finger1", "Hands", "Head", "Legs",
    "MainHand", "Neck", "SecondaryHand", "Shoulder", "Trinket0", "Trinket1",
    "Waist", "Wrist"
}
local slotIDs = {}
for i, slot in next, slots do
    local slotName = slot .. "Slot"
    local id = GetInventorySlotInfo(slotName)
    if (id) then slotIDs[i] = id end
end
local classification = {
    elite = "+",
    rare = " |cff6699ff稀有|r",
    rareelite = " |cff6699ff稀有+|r",
    worldboss = (" |cffFF0000%s|r"):format(BOSS)
}
local factionIcon = {
    ["Alliance"] = "Interface\\Timer\\Alliance-Logo",
    ["Horde"] = "Interface\\Timer\\Horde-Logo",
    ["Neutral"] = "Interface\\Timer\\Panda-Logo"
}
local numberize = function(val)
    if (val >= 1e8) then
        return ("%.2f亿"):format(val / 1e8)
    elseif (val >= 1e4) then
        return ("%.2f万"):format(val / 1e4)
    else
        return ("%d"):format(val)
    end
end
local hex = function(color)
    return (color.r and
               format('|cff%02x%02x%02x', color.r * 255, color.g * 255,
                      color.b * 255)) or "|cffFFFFFF"
end
local qqColor = {r = 1, g = 0, b = 0}
local nilcolor = {r = 1, g = 1, b = 1}
local tapped = {r = .6, g = .6, b = .6}
local itemTips = {}
local tooltips = {
    "GameTooltip", "ItemRefTooltip", "ShoppingTooltip1", "ShoppingTooltip2",
    "ShoppingTooltip3", "AutoCompleteBox", "FriendsTooltip", "WorldMapTooltip",
    "WorldMapCompareTooltip1", "WorldMapCompareTooltip2",
    "WorldMapCompareTooltip3", "ItemRefShoppingTooltip1",
    "ItemRefShoppingTooltip2", "ItemRefShoppingTooltip3",
    "DropDownList1MenuBackdrop", "DropDownList2MenuBackdrop",
    "DropDownList3MenuBackdrop"
}
local timer = 0.1
local types = {
    spell = "法术ID:",
    item = "物品ID:",
    glyph = "雕文ID:",
    quest = "任务ID:",
    achievement = "成就ID:"
}
local itemEvent = CreateFrame("Frame")
local BFTooltip_0c45f34dfb4120e86ac73e1f8aeee71e =
    CreateFrame('GameTooltip', 'bfITooltip', UIParent, 'GameTooltipTemplate')
local function BFTooltip_c2919e6b5d00ef4cc844fb3705581d1d(itemLink)
    BFTooltip_0c45f34dfb4120e86ac73e1f8aeee71e:SetOwner(UIParent, 'ANCHOR_NONE')
    BFTooltip_0c45f34dfb4120e86ac73e1f8aeee71e:ClearLines()
    BFTooltip_0c45f34dfb4120e86ac73e1f8aeee71e:SetHyperlink(itemLink)
    for BFTooltip_e914904fab9d05d3f54d52bfc31a0f3f = 1, 4 do
        if _G["bfITooltipTextLeft" .. BFTooltip_e914904fab9d05d3f54d52bfc31a0f3f]:GetText() then
            local BFTooltip_0db5ab7591386d733b59a51d951e85d0 =
                _G["bfITooltipTextLeft" ..
                    BFTooltip_e914904fab9d05d3f54d52bfc31a0f3f]:GetText():match(
                    ITEM_LEVEL:gsub("%%d", "(%%d+)"))
            if BFTooltip_0db5ab7591386d733b59a51d951e85d0 then
                BFTooltip_0c45f34dfb4120e86ac73e1f8aeee71e:Hide()
                return tonumber(BFTooltip_0db5ab7591386d733b59a51d951e85d0)
            end
        else
            break
        end
    end
    BFTooltip_0c45f34dfb4120e86ac73e1f8aeee71e:Hide()
    return 0
end
local function BFTooltip_72cc49141c08e56952ae7ad45a1edf51(
    BFTooltip_3f50417fb16be9b1078eb68d24fa9c26)
    local BFTooltip_e6955c64cf39bdb23dc86de1a9ec2117 = ""
    for BFTooltip_e914904fab9d05d3f54d52bfc31a0f3f = 1, BFTooltip_3f50417fb16be9b1078eb68d24fa9c26, 1 do
        BFTooltip_e6955c64cf39bdb23dc86de1a9ec2117 =
            BFTooltip_e6955c64cf39bdb23dc86de1a9ec2117 .. " "
    end
    return BFTooltip_e6955c64cf39bdb23dc86de1a9ec2117
end
local function BFTooltip_d26cd79fa9bc34a4cf186cfcc71e9233()
    local BFTooltip_77d93d0fdcdc419256aa5205c0ecfc70 = 0
    for BFTooltip_e914904fab9d05d3f54d52bfc31a0f3f = 1, GameTooltip:NumLines() do
        local BFTooltip_aacf928ffa23e474a000b1b6292d02a9 =
            getglobal("GameTooltipTextLeft" ..
                          BFTooltip_e914904fab9d05d3f54d52bfc31a0f3f):GetWidth()
        if (BFTooltip_aacf928ffa23e474a000b1b6292d02a9 >
            BFTooltip_77d93d0fdcdc419256aa5205c0ecfc70) then
            BFTooltip_77d93d0fdcdc419256aa5205c0ecfc70 =
                BFTooltip_aacf928ffa23e474a000b1b6292d02a9
        end
    end
    GameTooltip:SetWidth(BFTooltip_77d93d0fdcdc419256aa5205c0ecfc70 + 18)
end
local function GetFullName(unit)
    local name, server = UnitName(unit)
    if server then name = name .. "-" .. server end
    return name
end
local function GetCurrUnit()
    local mFocus = GetMouseFocus()
    local unit = mFocus and mFocus.unit or "mouseover"
    return unit
end
local function BFTooltip_6b595d544c5c02ea5184b48c2201a3f7(self,
                                                          BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)
    if not BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c then return end
    if not switch then return end
    local BFTooltip_8983c60d66c8593ec7165ea9dbedb584,
          BFTooltip_06dbcc4d2bf486ad2f0d8e082b30be8f =
        UnitName(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)
    if not BFTooltip_8983c60d66c8593ec7165ea9dbedb584 then return end
    local BFTooltip_36d63a69975fd08a36e2e6d5025c94df = GameTooltip:NumLines()
    local BFTooltip_c17d5b6cb27b5e698389952984895bd7,
          BFTooltip_b60cfe76c79aefbdff480476189e6666 =
        UnitClass(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)
    if (UnitIsPlayer(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)) then
        local coords = BFTooltip_b60cfe76c79aefbdff480476189e6666 and
                           CLASS_ICON_TCOORDS[BFTooltip_b60cfe76c79aefbdff480476189e6666]
        if (coords) then
            if GameTooltip.classIcon then
                GameTooltip.classIcon:SetTexture(
                    "Interface\\WorldStateFrame\\Icons-Classes")
                GameTooltip.classIcon:SetTexCoord(coords[1], coords[2],
                                                  coords[3], coords[4])
                GameTooltip.classIcon:Show()
            end
            if BFTT_Config["Actor"] == 1 then
                BFTooltip_8983c60d66c8593ec7165ea9dbedb584 =
                    UnitPVPName(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) or
                        BFTooltip_8983c60d66c8593ec7165ea9dbedb584
            end
            GameTooltipTextLeft1:SetText(
                format(BFTooltip_72cc49141c08e56952ae7ad45a1edf51(
                           BFTooltip_8c1238cf8b8bd7ccabfff661320b7233) .. "%s",
                       BFTooltip_8983c60d66c8593ec7165ea9dbedb584))
        else
            GameTooltipTextLeft1:SetText(
                BFTooltip_8983c60d66c8593ec7165ea9dbedb584)
        end
        if BFTooltip_06dbcc4d2bf486ad2f0d8e082b30be8f then
            GameTooltip:AppendText(" - " ..
                                       BFTooltip_06dbcc4d2bf486ad2f0d8e082b30be8f)
        end
        local guildName, guildRankName =
            GetGuildInfo(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)
        if guildName then
            if guildRankName and BFTT_Config["GuildRank"] == 1 then
                GameTooltipTextLeft2:SetText(
                    "<" .. guildName .. "> - " .. guildRankName)
            else
                GameTooltipTextLeft2:SetText("<" .. guildName .. ">")
            end
        end
    else
        if GameTooltip.classIcon then GameTooltip.classIcon:Hide() end
    end
    local BFTooltip_4cc93bff338b768a7287a88ed52e8a5b
    for BFTooltip_e914904fab9d05d3f54d52bfc31a0f3f = 1, BFTooltip_36d63a69975fd08a36e2e6d5025c94df do
        local BFTooltip_e6955c64cf39bdb23dc86de1a9ec2117 =
            getglobal("GameTooltipTextLeft" ..
                          BFTooltip_e914904fab9d05d3f54d52bfc31a0f3f):GetText()
        if (BFTooltip_e6955c64cf39bdb23dc86de1a9ec2117) then
            if (string.find(BFTooltip_e6955c64cf39bdb23dc86de1a9ec2117, LEVEL)) then
                BFTooltip_4cc93bff338b768a7287a88ed52e8a5b =
                    BFTooltip_e914904fab9d05d3f54d52bfc31a0f3f
                break
            end
        end
    end
    local leveltxt, levelcolor
    local BFTooltip_0db5ab7591386d733b59a51d951e85d0 =
        UnitLevel(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)
    if (BFTooltip_0db5ab7591386d733b59a51d951e85d0 and
        BFTooltip_0db5ab7591386d733b59a51d951e85d0 >= 1) then
        leveltxt = LEVEL .. " " .. BFTooltip_0db5ab7591386d733b59a51d951e85d0
    else
        leveltxt = LEVEL .. "??"
    end
    local BFTooltip_0bc2e111f929b46941314ba27b772be5 = UnitLevel("player")
    if (UnitFactionGroup(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) ~=
        UnitFactionGroup("player")) then
        if ((BFTooltip_0db5ab7591386d733b59a51d951e85d0 -
            BFTooltip_0bc2e111f929b46941314ba27b772be5 >= 5) or
            BFTooltip_0db5ab7591386d733b59a51d951e85d0 == -1) then
            levelcolor = BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc[1]
        elseif (BFTooltip_0db5ab7591386d733b59a51d951e85d0 -
            BFTooltip_0bc2e111f929b46941314ba27b772be5 >= 3) then
            levelcolor = BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc[2]
        elseif (BFTooltip_0db5ab7591386d733b59a51d951e85d0 -
            BFTooltip_0bc2e111f929b46941314ba27b772be5 >= -2) then
            levelcolor = BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc[3]
        elseif (BFTooltip_0bc2e111f929b46941314ba27b772be5 -
            BFTooltip_0db5ab7591386d733b59a51d951e85d0 <= GetQuestGreenRange()) then
            levelcolor = BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc[4]
        else
            levelcolor = BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc[5]
        end
    else
        levelcolor = BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc[6]
    end
    local BFTooltip_9f316a3eb2ba092b53bb884a899e56c5,
          BFTooltip_0edd4fa5d04bbdf4a6174772a777b9c9 = "|cffffffff"
    local BFTooltip_9fc1a99638e222362f76a2986addc9f8,
          BFTooltip_c8c12a7dbfd0b1a3c6e55e22ecc2596a,
          BFTooltip_05f00dfbbbbbdea5397f8a69924d1f4d
    if (UnitRace(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) and
        UnitIsPlayer(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)) then
        BFTooltip_0edd4fa5d04bbdf4a6174772a777b9c9 =
            UnitRace(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)
    elseif (UnitPlayerControlled(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)) then
        BFTooltip_0edd4fa5d04bbdf4a6174772a777b9c9 =
            UnitCreatureFamily(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)
    else
        BFTooltip_9fc1a99638e222362f76a2986addc9f8 =
            UnitIsFriend(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c, "player") and
                UnitReaction(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c,
                             "player")
        if BFTooltip_9fc1a99638e222362f76a2986addc9f8 then
            if BFTooltip_9fc1a99638e222362f76a2986addc9f8 <= 2 then
                BFTooltip_c8c12a7dbfd0b1a3c6e55e22ecc2596a =
                    BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc[1]
            elseif BFTooltip_9fc1a99638e222362f76a2986addc9f8 <= 3 then
                BFTooltip_c8c12a7dbfd0b1a3c6e55e22ecc2596a =
                    BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc[2]
            elseif BFTooltip_9fc1a99638e222362f76a2986addc9f8 <= 4 then
                BFTooltip_c8c12a7dbfd0b1a3c6e55e22ecc2596a =
                    BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc[3]
            else
                BFTooltip_c8c12a7dbfd0b1a3c6e55e22ecc2596a =
                    BFTooltip_7dfad32b68d1cb2bfbd8b776c7c0f5bc[4]
            end
            BFTooltip_05f00dfbbbbbdea5397f8a69924d1f4d =
                BFTooltip_662ca10dea06cc70b2070def0e0dadfa[BFTooltip_9fc1a99638e222362f76a2986addc9f8]
        end
        BFTooltip_0edd4fa5d04bbdf4a6174772a777b9c9 =
            UnitCreatureType(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)
    end
    if (BFTooltip_0edd4fa5d04bbdf4a6174772a777b9c9 == nil) then
        BFTooltip_0edd4fa5d04bbdf4a6174772a777b9c9 = ""
    else
        BFTooltip_0edd4fa5d04bbdf4a6174772a777b9c9 =
            (BFTooltip_0edd4fa5d04bbdf4a6174772a777b9c9 .. " ")
    end
    local BFTooltip_7a2bc46364cf858bda368b0cc2cebced = "|cffffffff"
    if (UnitIsPlayer(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)) then
        BFTooltip_7a2bc46364cf858bda368b0cc2cebced =
            BFTooltip_b60cfe76c79aefbdff480476189e6666 and
                BFTooltip_3b4c6e8428fd1b418187eeddfb50851b[BFTooltip_b60cfe76c79aefbdff480476189e6666] or
                BFTooltip_3b4c6e8428fd1b418187eeddfb50851b["DEFAULT"]
    else
        BFTooltip_c17d5b6cb27b5e698389952984895bd7 = " "
    end
    if BFTooltip_c17d5b6cb27b5e698389952984895bd7 then
        local BFTooltip_7208554a9f4262c89b2f8e16f4943abb,
              BFTooltip_92c450fe21210367e78dad9a0af8ae2f = "", "|cffffffff"
        if (UnitClassification(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) and
            UnitClassification(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) ~=
            "normal" and UnitHealth(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) >
            0) then
            if (UnitClassification(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) ==
                "elite" or
                UnitClassification(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) ==
                "worldboss" or
                UnitClassification(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) ==
                "rare" or
                UnitClassification(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) ==
                "rareelite") then
                BFTooltip_7208554a9f4262c89b2f8e16f4943abb =
                    ("(" ..
                        BFTooltip_74859e1ca060dcaf910e42c2ec790c32[UnitClassification(
                            BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)] .. ")")
                BFTooltip_92c450fe21210367e78dad9a0af8ae2f =
                    BFTooltip_0287b1fb03d1295056e85a0f995b5dba[UnitClassification(
                        BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)]
            else
                BFTooltip_7208554a9f4262c89b2f8e16f4943abb =
                    ("(" ..
                        UnitClassification(
                            BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) .. ")")
            end
        end
        local BFTooltip_2126e07dc437dce20510697ffb774e31,
              BFTooltip_d6c89e6ffa522271a53472720a0be6c1 = "", "|cffffffff"
        if (UnitHealth(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c) <= 0) then
            BFTooltip_2126e07dc437dce20510697ffb774e31 =
                BFTooltip_f2a8d52cb3b8454fce64eb2c12287307
            BFTooltip_d6c89e6ffa522271a53472720a0be6c1 =
                BFTooltip_adc9d1f00fa6bd4940e624b4c5235840
            BFTooltip_92c450fe21210367e78dad9a0af8ae2f =
                BFTooltip_adc9d1f00fa6bd4940e624b4c5235840
            BFTooltip_9f316a3eb2ba092b53bb884a899e56c5 =
                BFTooltip_adc9d1f00fa6bd4940e624b4c5235840
            levelcolor = BFTooltip_adc9d1f00fa6bd4940e624b4c5235840
        end
        local BFTooltip_b61b82ed9a8a82dfaaeed47bb2b6eadf =
            levelcolor .. leveltxt .. "|r" ..
                BFTooltip_9f316a3eb2ba092b53bb884a899e56c5 .. " " ..
                BFTooltip_0edd4fa5d04bbdf4a6174772a777b9c9 .. "|r" ..
                BFTooltip_7a2bc46364cf858bda368b0cc2cebced ..
                BFTooltip_c17d5b6cb27b5e698389952984895bd7 .. "|r" ..
                BFTooltip_92c450fe21210367e78dad9a0af8ae2f ..
                BFTooltip_7208554a9f4262c89b2f8e16f4943abb .. "|r" ..
                BFTooltip_d6c89e6ffa522271a53472720a0be6c1 ..
                BFTooltip_2126e07dc437dce20510697ffb774e31 .. "|r"
        if BFTooltip_c8c12a7dbfd0b1a3c6e55e22ecc2596a and
            BFTooltip_05f00dfbbbbbdea5397f8a69924d1f4d then
            BFTooltip_b61b82ed9a8a82dfaaeed47bb2b6eadf =
                BFTooltip_b61b82ed9a8a82dfaaeed47bb2b6eadf .. "(" ..
                    BFTooltip_c8c12a7dbfd0b1a3c6e55e22ecc2596a ..
                    BFTooltip_05f00dfbbbbbdea5397f8a69924d1f4d .. "|r)"
        end
        if BFTooltip_4cc93bff338b768a7287a88ed52e8a5b then
            getglobal("GameTooltipTextLeft" ..
                          BFTooltip_4cc93bff338b768a7287a88ed52e8a5b):SetText(
                BFTooltip_b61b82ed9a8a82dfaaeed47bb2b6eadf)
        else
            if GameTooltipTextLeft3:GetText() then
                GameTooltipTextLeft3:SetText(
                    BFTooltip_b61b82ed9a8a82dfaaeed47bb2b6eadf)
            else
                GameTooltip:AddLine(BFTooltip_b61b82ed9a8a82dfaaeed47bb2b6eadf)
            end
        end
    end
    local BFTooltip_3d39b031dc893292234b1e56c970798c,
          BFTooltip_ae3cefbd9c0af91ce6b58264802f08a5 = "", "|cffffffff"
    if (UnitIsVisible(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c .. "target") and
        BFTT_Config["TOT"] == 1) then
        BFTooltip_3d39b031dc893292234b1e56c970798c =
            UnitName(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c .. "target")
        if not BFTooltip_3d39b031dc893292234b1e56c970798c then return end
        if (UnitIsPlayer(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c .. "target")) then
            local _, BFTooltip_b60cfe76c79aefbdff480476189e6666 =
                UnitClass(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c .. "target")
            BFTooltip_ae3cefbd9c0af91ce6b58264802f08a5 =
                BFTooltip_b60cfe76c79aefbdff480476189e6666 and
                    BFTooltip_3b4c6e8428fd1b418187eeddfb50851b[BFTooltip_b60cfe76c79aefbdff480476189e6666]
        end
    end
    if (BFTT_Config["TOT"] == 1 and
        UnitIsVisible(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c .. "target")) then
        if (UnitIsUnit(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c .. "target",
                       "player")) then
            if GameTooltipTextLeft5:GetText() then
                GameTooltipTextLeft5:SetText(
                    BFTooltip_6e397a8792a702ef576ac7368d5eaf88 ..
                        BFTooltip_843a1e5002d398bc3baccfb6f1ab3613 .. "|r" ..
                        BFTooltip_ad5a531d1bf71036cd3ca155666b4c35)
            else
                GameTooltip:AddLine(
                    BFTooltip_6e397a8792a702ef576ac7368d5eaf88 ..
                        BFTooltip_843a1e5002d398bc3baccfb6f1ab3613 .. "|r" ..
                        BFTooltip_ad5a531d1bf71036cd3ca155666b4c35)
            end
        else
            if GameTooltipTextLeft5:GetText() then
                GameTooltipTextLeft5:SetText(
                    BFTooltip_6e397a8792a702ef576ac7368d5eaf88 ..
                        BFTooltip_843a1e5002d398bc3baccfb6f1ab3613 .. "|r" ..
                        BFTooltip_ae3cefbd9c0af91ce6b58264802f08a5 ..
                        BFTooltip_3d39b031dc893292234b1e56c970798c .. "|r")
            else
                GameTooltip:AddLine(
                    BFTooltip_6e397a8792a702ef576ac7368d5eaf88 ..
                        BFTooltip_843a1e5002d398bc3baccfb6f1ab3613 .. "|r" ..
                        BFTooltip_ae3cefbd9c0af91ce6b58264802f08a5 ..
                        BFTooltip_3d39b031dc893292234b1e56c970798c .. "|r")
            end
        end
    end
    BFTooltip_d26cd79fa9bc34a4cf186cfcc71e9233()
end
local function unitColor(unit)
    local color
    if (unit) then
        if (UnitIsPlayer(unit)) then
            local colors = RAID_CLASS_COLORS
            local _, class = UnitClass(unit)
            color = colors[class]
        elseif UnitIsTapDenied(unit) then
            color = tapped
        else
            local reaction = UnitReaction(unit, "player")
            if (reaction) then color = FACTION_BAR_COLORS[reaction] end
        end
    end
    return (color or nilcolor)
end
local function GameTooltip_UnitColor(unit)
    local color = unitColor(unit)
    return color.r, color.g, color.b
end
local function getUnit(self)
    local _, unit = self and self:GetUnit()
    if (not unit) then
        local mFocus = GetMouseFocus()
        unit = mFocus and (mFocus.unit or mFocus:GetAttribute("unit")) or
                   "mouseover"
    end
    return unit
end
local function formatLines(self)
    for i = 1, self:NumLines() do
        local tiptext = _G["GameTooltipTextLeft" .. i]
        local point, relTo, relPoint, x, y = tiptext:GetPoint()
        tiptext:ClearAllPoints()
        if (i == 1) then
            tiptext:SetPoint("TOPLEFT", self, "TOPLEFT", x, y)
        else
            local key = i - 1
            while (true) do
                local preTiptext = _G["GameTooltipTextLeft" .. key]
                if (preTiptext and not preTiptext:IsShown()) then
                    key = key - 1
                else
                    break
                end
            end
            tiptext:SetPoint("TOPLEFT", _G["GameTooltipTextLeft" .. key],
                             "BOTTOMLEFT", x, -2)
        end
    end
end
local function hideLines(self)
    for i = 3, self:NumLines() do
        local tiptext = _G["GameTooltipTextLeft" .. i]
        local linetext = tiptext:GetText()
        if (linetext) then
            if (newType_config.hidePvP and linetext:find(PVP)) then
                tiptext:SetText(nil)
                tiptext:Hide()
            elseif (linetext:find(COALESCED_REALM_TOOLTIP1) or
                linetext:find(INTERACTIVE_REALM_TOOLTIP1)) then
                tiptext:SetText(nil)
                tiptext:Hide()
                local pretiptext = _G["GameTooltipTextLeft" .. i - 1]
                pretiptext:SetText(nil)
                pretiptext:Hide()
                self:Show()
            elseif (linetext == FACTION_ALLIANCE) then
                if (newType_config.hideFaction) then
                    tiptext:SetText(nil)
                    tiptext:Hide()
                else
                    tiptext:SetText("|cff7788FF" .. linetext .. "|r")
                end
            elseif (linetext == FACTION_HORDE) then
                if (newType_config.hideFaction) then
                    tiptext:SetText(nil)
                    tiptext:Hide()
                else
                    tiptext:SetText("|cffFF4444" .. linetext .. "|r")
                end
            end
        end
    end
end
local function UpdatePower(self, elapsed)
    self.elapsed = self.elapsed + elapsed
    if (self.elapsed < .25) then return end
    local unit = getUnit(GameTooltip)
    if (unit) then
        local min, max = UnitPower(unit), UnitPowerMax(unit)
        if (max ~= 0) then
            self:SetValue(min)
            local pp = numberize(min) .. " / " .. numberize(max)
            self.text:SetText(pp)
        end
    end
    self.elapsed = 0
end
local function HidePower(powerbar)
    if (powerbar) then
        powerbar:Hide()
        if (powerbar.text) then powerbar.text:SetText(nil) end
    end
end
local function ShowPowerBar(self, unit, statusbar)
    local powerbar = _G[self:GetName() .. "FreebTipPowerBar"]
    if (not unit) then return HidePower(powerbar) end
    local min, max = UnitPower(unit), UnitPowerMax(unit)
    local ptype, ptoken = UnitPowerType(unit)
    if (max == 0 or (newType_config.powerManaOnly and ptoken ~= 'MANA')) then
        return HidePower(powerbar)
    end
    if (not powerbar) then
        powerbar = CreateFrame("StatusBar",
                               self:GetName() .. "FreebTipPowerBar", statusbar)
        powerbar:SetHeight(statusbar:GetHeight())
        powerbar:SetFrameLevel(statusbar:GetFrameLevel())
        powerbar:SetWidth(0)
        powerbar:SetStatusBarTexture(newType_config.tex, "OVERLAY")
        powerbar.elapsed = 0
        powerbar:SetScript("OnUpdate", UpdatePower)
        local bg = powerbar:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints(powerbar)
        bg:SetTexture(newType_config.tex)
        bg:SetVertexColor(0.3, 0.3, 0.3, 0.5)
    end
    powerbar.unit = unit
    powerbar:SetMinMaxValues(0, max)
    powerbar:SetValue(min)
    local pcolor = colors.power[ptoken]
    if (pcolor) then
        powerbar:SetStatusBarColor(pcolor[1], pcolor[2], pcolor[3])
    end
    powerbar:ClearAllPoints()
    powerbar:SetPoint("LEFT", statusbar, "LEFT", 0, -(statusbar:GetHeight()) - 4)
    powerbar:SetPoint("RIGHT", self, "RIGHT", -10, 0)
    powerbar:Show()
    if (not powerbar.text) then
        powerbar.text = powerbar:CreateFontString(nil, "OVERLAY")
        powerbar.text:SetPoint("CENTER", powerbar)
        powerbar.text:SetFont(newType_config.font, 13, newType_config.outline)
        powerbar.text:Show()
    end
    local pp = numberize(min) .. " / " .. numberize(max)
    if pp and numberize(max) ~= 0 then powerbar.text:SetText(pp) end
end
local function PlayerTitle(self, unit)
    local unitName
    if (BFTT_Config["Actor"] == 1) then
        unitName = UnitPVPName(unit) or UnitName(unit)
    else
        unitName = UnitName(unit)
    end
    if (unitName) then GameTooltipTextLeft1:SetText(unitName) end
    local relationship = UnitRealmRelationship(unit)
    if (relationship == LE_REALM_RELATION_VIRTUAL) then
        self:AppendText(("|cffcccccc%s|r"):format(INTERACTIVE_SERVER_LABEL))
    end
    local status = UnitIsAFK(unit) and CHAT_FLAG_AFK or UnitIsDND(unit) and
                       CHAT_FLAG_DND or not UnitIsConnected(unit) and "<离线>"
    if (status) then self:AppendText((" |cff00cc00%s|r"):format(status)) end
end
local function PlayerGuild(self, unit, unitGuild, unitRank)
    if (unitGuild) then
        local text2 = GameTooltipTextLeft2
        local str = hex(newType_config.gcolor) .. "<%s> |cff00E6A8%s|r"
        local showRank = true
        if BFTT_Config["GuildRank"] == 2 then showRank = false end
        local unitRank = showRank and unitRank or ""
        text2:SetFormattedText(str, unitGuild, unitRank)
    end
end
local function SetStatusBar(self, unit)
    if (GameTooltipStatusBar:IsShown()) then
        if (newType_config.hideHealthbar) then
            GameTooltipStatusBar:Hide()
            return
        end
        if (newType_config.powerbar) then
            ShowPowerBar(self, unit, GameTooltipStatusBar)
        end
        GameTooltipStatusBar:ClearAllPoints()
        local gtsbHeight = GameTooltipStatusBar:GetHeight()
        if (GameTooltipFreebTipPowerBar and
            GameTooltipFreebTipPowerBar:IsShown()) then
            GameTooltipStatusBar:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 10,
                                          ((gtsbHeight) * 2) + 4.5)
            GameTooltipStatusBar:SetPoint("BOTTOMRIGHT", self, -10, 0)
        else
            GameTooltipStatusBar:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 10,
                                          gtsbHeight + 1)
            GameTooltipStatusBar:SetPoint("BOTTOMRIGHT", self, -10, 0)
        end
    end
    if (unit) then
        GameTooltipStatusBar:SetStatusBarColor(GameTooltip_UnitColor(unit))
    else
        GameTooltipStatusBar:SetStatusBarColor(0, .9, 0)
    end
end
local function getTarget(unit)
    if (UnitIsUnit(unit, "player")) then
        return ("|cffff0000%s|r"):format(newType_config.you)
    else
        return UnitName(unit)
    end
end
local function ShowTarget(self, unit)
    if (UnitExists(unit .. "target")) then
        local tarRicon = GetRaidTargetIndex(unit .. "target")
        local tar = ("%s%s"):format(
                        (tarRicon and ICON_LIST[tarRicon] .. "10|t") or "",
                        getTarget(unit .. "target"))
        self:AddDoubleLine(targettext, tar, NORMAL_FONT_COLOR.r,
                           NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b,
                           GameTooltip_UnitColor(unit .. "target"))
    end
end
local function NewType_OnSetUnit(self)
    if (newType_config.combathide and InCombatLockdown()) then
        return self:Hide()
    end
    hideLines(self)
    local unit = getUnit(self)
    if (unit and UnitExists(unit)) then
        local isPlayer = UnitIsPlayer(unit)
        if not (self.factionIcon) then
            self.factionIcon = self:CreateTexture(nil, "OVERLAY")
            self.factionIcon:SetPoint("TOPRIGHT", 5, 18)
        end
        local faction = UnitFactionGroup(unit)
        if (newType_config.showFactionIcon and faction and factionIcon[faction] and
            isPlayer) then
            self.factionIcon:SetTexture(factionIcon[faction])
            self.factionIcon:SetSize(newType_config.factionIconSize,
                                     newType_config.factionIconSize)
            self.factionIcon:SetAlpha(newType_config.factionIconAlpha)
            self.factionIcon:Show()
        else
            self.factionIcon:Hide()
        end
        local color = unitColor(unit)
        local unitGuild, unitRank
        if (isPlayer) then
            PlayerTitle(self, unit)
            unitGuild, unitRank, unitRankIndex = GetGuildInfo(unit)
            if unitRank ~= nil and unitRankIndex then
                unitRank = unitRank .. "(" .. unitRankIndex .. ")"
            end
            PlayerGuild(self, unit, unitGuild, unitRank)
        end
        local ricon = GetRaidTargetIndex(unit)
        if (ricon) then
            local text = GameTooltipTextLeft1:GetText() or ""
            GameTooltipTextLeft1:SetFormattedText(("%s %s"),
                                                  ICON_LIST[ricon] ..
                                                      newType_config.fontsize ..
                                                      "|t", text)
        end
        local line1 = GameTooltipTextLeft1:GetText() or ""
        GameTooltipTextLeft1:SetFormattedText(("%s"), hex(color) .. line1)
        GameTooltipTextLeft1:SetTextColor(GameTooltip_UnitColor(unit))
        local alive = not UnitIsDeadOrGhost(unit)
        local level
        if (UnitIsWildBattlePet(unit) or UnitIsBattlePetCompanion(unit)) then
            level = UnitBattlePetLevel(unit)
        else
            level = UnitLevel(unit)
        end
        if (level) then
            local unitClass = isPlayer and
                                  ("%s %s"):format((UnitRace(unit) or ""), hex(
                                                       color) ..
                                                       (UnitClass(unit) or "") ..
                                                       "|r") or ""
            local creature = not isPlayer and UnitCreatureType(unit) or ""
            local diff
            if (level == -1) then
                level = "??"
                diff = qqColor
            else
                level = ("%d"):format(level)
                diff = GetQuestDifficultyColor(level)
            end
            local classify = UnitClassification(unit) or ""
            local textLevel = ("%s%s%s|r"):format(hex(diff), level,
                                                  classification[classify] or "")
            local tiptextLevel
            for i = (unitGuild and 3) or 2, self:NumLines() do
                local tiptext = _G["GameTooltipTextLeft" .. i]
                local linetext = tiptext:GetText()
                if (linetext and linetext:find(LEVEL)) then
                    tiptextLevel = tiptext
                end
            end
            if (tiptextLevel) then
                tiptextLevel:SetFormattedText(("|cffffd200等级|r %s %s%s %s"),
                                              textLevel, creature, unitClass,
                                              (not alive and "|cffCCCCCC" ..
                                                  DEAD .. "|r" or ""))
            end
        end
        if (BFTT_Config["TOT"] == 1) then ShowTarget(self, unit) end
        if (not alive) then GameTooltipStatusBar:Hide() end
    end
    SetStatusBar(self, unit)
    self.freebHeightSet = nil
    self.freebtipUpdate = 0
end
local function gtStatusBarValChange(self, value)
    if (not value) then return end
    local min, max = self:GetMinMaxValues()
    if (value < min) or (value > max) then return end
    if (not self.text) then
        self.text = self:CreateFontString(nil, "OVERLAY")
        self.text:SetPoint("CENTER", GameTooltipStatusBar)
        self.text:SetFont(newType_config.font, 15, newType_config.outline)
    end
    self.text:Show()
    local hp = numberize(self:GetValue()) .. " / " .. numberize(max)
    if hp and numberize(max) ~= 0 then self.text:SetText(hp) end
end
local function style(frame)
    if (not frame) then return end
    local frameName = frame:GetName()
    if (not frame.freebtipBD) then
        frame:SetBackdrop(newType_config.backdrop)
        frame.freebtipBD = true
    end
    frame:SetBackdropColor(newType_config.bgcolor.r, newType_config.bgcolor.g,
                           newType_config.bgcolor.b, newType_config.bgcolor.t)
    frame:SetBackdropBorderColor(newType_config.bdrcolor.r,
                                 newType_config.bdrcolor.g,
                                 newType_config.bdrcolor.b)
    frame:SetScale(newType_config.scale)
    if (newType_config.colorborderItem and frame.GetItem) then
        frame.freebtipItem = false
        local _, item = frame:GetItem()
        if (item) then
            local quality = select(3, GetItemInfo(item))
            if (quality) then
                local r, g, b = GetItemQualityColor(quality)
                frame:SetBackdropBorderColor(r, g, b)
                itemTips[frameName] = nil
                frame.freebtipItem = true
            else
                itemTips[frameName] = true
            end
        end
    end
    if (not frameName) then return end
    if (frameName ~= "GameTooltip" and frame.NumLines) then
        for index = 1, frame:NumLines() do
            if (index == 1) then
                _G[frameName .. 'TextLeft' .. index]:SetFontObject(
                    GameTooltipHeaderText)
            else
                _G[frameName .. 'TextLeft' .. index]:SetFontObject(
                    GameTooltipText)
            end
            _G[frameName .. 'TextRight' .. index]:SetFontObject(GameTooltipText)
        end
    end
    if (_G[frameName .. "MoneyFrame1"]) then
        _G[frameName .. "MoneyFrame1PrefixText"]:SetFontObject(GameTooltipText)
        _G[frameName .. "MoneyFrame1SuffixText"]:SetFontObject(GameTooltipText)
        _G[frameName .. "MoneyFrame1GoldButtonText"]:SetFontObject(
            GameTooltipText)
        _G[frameName .. "MoneyFrame1SilverButtonText"]:SetFontObject(
            GameTooltipText)
        _G[frameName .. "MoneyFrame1CopperButtonText"]:SetFontObject(
            GameTooltipText)
    end
    if (_G[frameName .. "MoneyFrame2"]) then
        _G[frameName .. "MoneyFrame2PrefixText"]:SetFontObject(GameTooltipText)
        _G[frameName .. "MoneyFrame2SuffixText"]:SetFontObject(GameTooltipText)
        _G[frameName .. "MoneyFrame2GoldButtonText"]:SetFontObject(
            GameTooltipText)
        _G[frameName .. "MoneyFrame2SilverButtonText"]:SetFontObject(
            GameTooltipText)
        _G[frameName .. "MoneyFrame2CopperButtonText"]:SetFontObject(
            GameTooltipText)
    end
end
local function GT_OnUpdate(self, elapsed)
    self:SetBackdropColor(newType_config.bgcolor.r, newType_config.bgcolor.g,
                          newType_config.bgcolor.b, newType_config.bgcolor.t)
    self.freebtipUpdate = (self.freebtipUpdate or timer) - elapsed
    if (self.freebtipUpdate > 0) then return end
    self.freebtipUpdate = timer
    local unit = getUnit(self)
    if (unit and self:IsUnit(unit)) then
        hideLines(self)
        if (newType_config.colorborderClass and UnitIsPlayer(unit)) then
            local color = unitColor(unit)
            self:SetBackdropBorderColor(color.r, color.g, color.b)
        end
    end
    local numLines = self:NumLines()
    if (self.freebHeightSet ~= numLines) then
        if (GameTooltipStatusBar:IsShown()) then
            local height = GameTooltipStatusBar:GetHeight() + 6
            local powbar = GameTooltipFreebTipPowerBar
            if (powbar and powbar:IsShown()) then
                height = (GameTooltipStatusBar:GetHeight() * 2) + 9
            end
            self:SetHeight((self:GetHeight() + height))
        end
        self.freebHeightSet = numLines
    end
    formatLines(self)
end
local function OverrideGetBackdropColor()
    return newType_config.bgcolor.r, newType_config.bgcolor.g,
           newType_config.bgcolor.b, newType_config.bgcolor.t
end
local function OverrideGetBackdropBorderColor()
    return newType_config.bdrcolor.r, newType_config.bdrcolor.g,
           newType_config.bdrcolor.b
end
local function addLine(tooltip, id, type)
    local found = false
    for i = 1, 15 do
        local frame = _G[tooltip:GetName() .. "TextLeft" .. i]
        local text
        if frame then text = frame:GetText() end
        if text and text == type then
            found = true
            break
        end
    end
    if not found then
        tooltip:AddDoubleLine(type, "|cffffffff" .. id)
        tooltip:Show()
    end
end
local function onSetHyperlink(self, link)
    local type, id = string.match(link, "^(%a+):(%d+)")
    if not type or not id then return end
    if type == "spell" or type == "enchant" or type == "trade" then
        addLine(self, id, types.spell)
    elseif type == "glyph" then
        addLine(self, id, types.glyph)
    elseif type == "quest" then
        addLine(self, id, types.quest)
    elseif type == "achievement" then
        addLine(self, id, types.achievement)
    elseif type == "item" then
        addLine(self, id, types.item)
    end
end
local function attachItemTooltip(self)
    local link = select(2, self:GetItem())
    if link then
        local id =
            select(3, strfind(link, "^|%x+|Hitem:(%-?%d+):(%d+):(%d+).*"))
        if id then addLine(self, id, types.item) end
    end
end
local addonsIsLoaded
local function NewType_Init()
    if not addonsIsLoaded then
        for i, tip in ipairs(tooltips) do
            if (_G[tip]) then
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(_G[tip],
                                                                      "OnShow",
                                                                      function(
                    self)
                    if (newType_config.combathideALL and InCombatLockdown()) then
                        return self:Hide()
                    end
                    style(self)
                end)
            end
        end
        addonsIsLoaded = true
    end
    itemEvent:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    itemEvent:SetScript("OnEvent", function(self, event, arg1)
        for k in next, itemTips do
            local tip = _G[k]
            if (tip and tip:IsShown()) then style(tip) end
        end
    end)
    GameTooltipStatusBar:SetScript("OnValueChanged", gtStatusBarValChange)
    GameTooltip.GetBackdropBorderColor = OverrideGetBackdropBorderColor
    GameTooltip:SetBackdropBorderColor(OverrideGetBackdropBorderColor)
    GameTooltip.GetBackdropColor = OverrideGetBackdropColor
    GameTooltip:SetBackdropColor(OverrideGetBackdropColor)
    GameTooltipHeaderText:SetFont(newType_config.font,
                                  newType_config.fontsize + 2,
                                  newType_config.outline)
    GameTooltipText:SetFont(newType_config.font, newType_config.fontsize,
                            newType_config.outline)
    GameTooltipTextSmall:SetFont(newType_config.font,
                                 newType_config.fontsize - 2,
                                 newType_config.outline)
    GameTooltipStatusBar:SetStatusBarTexture(newType_config.tex)
    GameTooltipStatusBar:SetHeight(10)
    local bg = GameTooltipStatusBar:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(GameTooltipStatusBar)
    bg:SetTexture(newType_config.tex)
    bg:SetVertexColor(0.3, 0.3, 0.3, 0.5)
end
local function ShowLevelAndTalent(score, spec)
    if (BFTT_Config["ItemLevel"] == 1 and not GameTooltip.freebtipiLvlSet and
        score) then
        GameTooltip:AddDoubleLine(ITEM_LEVEL_ABBR, ilvlText:format(score),
                                  NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g,
                                  NORMAL_FONT_COLOR.b)
        GameTooltip.freebtipiLvlSet = true
        GameTooltip:Show()
    end
    if (BFTT_Config["Talent"] == 1 and not GameTooltip.freebtipSpecSet and spec) then
        GameTooltip:AddDoubleLine(SPECIALIZATION, specText:format(spec),
                                  NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g,
                                  NORMAL_FONT_COLOR.b)
        GameTooltip.freebtipSpecSet = true
        GameTooltip:Show()
    end
end
local function ShowLevelAndTalent_Old(score, spec)
    if (BFTT_Config["ItemLevel"] == 1 and not GameTooltip.freebtipiLvlSet and
        score) then
        local linenums = GameTooltip:NumLines()
        local nonLine
        for i = 1, linenums, 1 do
            local text = getglobal("GameTooltipTextLeft" .. i):GetText()
            if (text) then
                if (string.find(text, BFTooltip_6bd5608f64f02bafe9f43448c9c73096)) then
                    nonLine = i
                    break
                end
            end
        end
        if nonLine then
            getglobal("GameTooltipTextLeft" .. nonLine):SetText(
                BFTooltip_890c94a500c19557d08d3b668c687d64 .. score)
        else
            GameTooltip:AddLine(BFTooltip_890c94a500c19557d08d3b668c687d64 ..
                                    score)
        end
        GameTooltip.freebtipiLvlSet = true
        GameTooltip:Show()
    elseif (BFTT_Config["ItemLevel"] == 1 and not GameTooltip.stillFind and
        not score) then
        local linenums = GameTooltip:NumLines()
        local nonLine
        for i = 1, linenums, 1 do
            local text = getglobal("GameTooltipTextLeft" .. i):GetText()
            if (text) then
                if (string.find(text, BFTooltip_6bd5608f64f02bafe9f43448c9c73096)) then
                    nonLine = i
                    break
                end
            end
        end
        if not nonLine then
            GameTooltip:AddLine(BFTooltip_6bd5608f64f02bafe9f43448c9c73096)
        end
        GameTooltip.stillFind = true
        GameTooltip:Show()
    end
    if (BFTT_Config["Talent"] == 1 and not GameTooltip.freebtipSpecSet and spec) then
        GameTooltip:AddLine(format(
                                BFTooltip_3f6959cb5e57fd67ab669170c8632b28 ..
                                    BFTooltip_31d97b8fc6222bacc6c0821bca5ee74f,
                                spec))
        GameTooltip.freebtipSpecSet = true
        GameTooltip:Show()
    end
end
local function BFTooltip_65d610506803fe617339151af6dbc5db()
    if (BFTT_Config["Fade"] ~= 1) then GameTooltip:Hide() end
end
local function UnitIsMouseOver() return UnitExists("mouseover") end
local BFTooltip_025d8007e5b2a8e146f3c15d572f9829 =
    CreateFrame("Frame", "BFTT_Fresh", UIParent)
local SHowTime = GetTime()
BFTooltip_025d8007e5b2a8e146f3c15d572f9829:SetScript("OnUpdate",
                                                     function(self, elapsed)
    if not UnitIsMouseOver() then
        if (BFTT_Config["Fade"] == 1) then
            GameTooltip:FadeOut()
            self:Hide()
        else
            if SHowTime and (GetTime() - SHowTime > 0.5) then
                SHowTime = GetTime()
                GameTooltip:Hide()
                self:Hide()
            end
        end
    end
end)
local BFTooltip_f1917fe48c4934b7873476da9e2bd3c1 = CreateFrame("Frame")
BFTooltip_f1917fe48c4934b7873476da9e2bd3c1:SetScript("OnUpdate",
                                                     function(self, elapsed)
    if not UnitIsPlayer("mouseover") then return end
    self.update = (self.update or 0) + elapsed
    if (self.update < 0.1) then return end
    local unit = GetCurrUnit()
    local guid = UnitGUID(unit)
    if (InspectInfo[guid]) then
        if (BFTT_Config["Talent"] == 1 or BFTT_Config["ItemLevel"] == 1) then
            if BFTT_Config["TooltipType"] == 2 then
                ShowLevelAndTalent(InspectInfo[guid].itemLevel,
                                   InspectInfo[guid].talentName)
            elseif BFTT_Config["TooltipType"] == 1 then
                ShowLevelAndTalent_Old(InspectInfo[guid].itemLevel,
                                       InspectInfo[guid].talentName)
            end
        end
    elseif BFTT_Config["TooltipType"] == 2 and
        (BFTT_Config["Talent"] == 1 or BFTT_Config["ItemLevel"] == 1) then
        local unit = GetCurrUnit()
        LibInspect:RequestData("items", unit)
    elseif BFTT_Config["TooltipType"] == 1 and
        (BFTT_Config["Talent"] == 1 or BFTT_Config["ItemLevel"] == 1) then
    end
    self.update = 0
end)
local function BFTooltip_cce46e1be80d9ce416e785215e447afb()
    local BFTooltip_f3fe7a8f6d115926040773b03a6ff3a4 =
        GameTooltip:CreateTexture(nil, "BORDER")
    BFTooltip_f3fe7a8f6d115926040773b03a6ff3a4:SetTexture(
        "Interface\\ChatFrame\\ChatFrameBackground")
    BFTooltip_f3fe7a8f6d115926040773b03a6ff3a4:SetPoint("TOPLEFT", GameTooltip,
                                                        "TOPLEFT", 6, -6)
    BFTooltip_f3fe7a8f6d115926040773b03a6ff3a4:SetPoint("BOTTOMRIGHT",
                                                        GameTooltip, "TOPRIGHT",
                                                        -6, -27)
    BFTooltip_f3fe7a8f6d115926040773b03a6ff3a4:SetBlendMode("ADD")
    BFTooltip_f3fe7a8f6d115926040773b03a6ff3a4:SetGradientAlpha("VERTICAL", .1,
                                                                .1, .1, 0, .2,
                                                                .2, .2, 1)
end
local function KeepNotify(unit)
    ClearInspectPlayer()
    NotifyInspect(unit)
    BigFoot_DelayCall(function()
        if unit == UIDROPDOWNMENU_INIT_MENU.unit and InspectFrame and
            InspectFrame:IsShown() then
            local haveEquipment = false
            for i = INVSLOT_FIRST_EQUIPPED, INVSLOT_LAST_EQUIPPED do
                if GetInventoryItemLink(unit, i) then
                    haveEquipment = true
                    break
                end
            end
            if not haveEquipment and InspectFrame and InspectFrame:IsShown() then
                return KeepNotify(unit)
            end
        end
    end, 1)
end
local function InspectUnit_KeepNotifying(unit)
    if not CheckInteractDistance(unit, 1) then return end
    KeepNotify(unit)
end
hooksecurefunc("InspectUnit", InspectUnit_KeepNotifying)
local function GetInspectItemLevel(guid, data, age)
    if ((not guid) or (data and type(data.items) ~= "table")) then return end
    if type(data) ~= "table" then return end
    local numItems = 0
    local itemsTotal = 0
    local iLv16, iLv17
    for i, id in next, slotIDs do
        local link = data.items[id]
        if (link) then
            local ilvl = BFTooltip_c2919e6b5d00ef4cc844fb3705581d1d(link)
            if id == 16 or id == 17 then
                local _, _, quality, level = GetItemInfo(link)
                if quality == 6 then
                    if id == 16 then
                        if data.items[17] then
                            iLv16 = ilvl
                            iLv17 = BFTooltip_c2919e6b5d00ef4cc844fb3705581d1d(
                                        data.items[17])
                            ilvl = iLv17 < iLv16 and iLv16 or iLv17
                        end
                    else
                        if iLv16 then
                            ilvl = ilvl < iLv16 and iLv16 or ilvl
                        end
                    end
                end
            end
            numItems = numItems + 1
            itemsTotal = itemsTotal + ilvl
        end
    end
    if (numItems > 0) then
        local score = math.floor(itemsTotal / numItems)
        if not InspectInfo[guid] then
            InspectInfo[guid] = {itemLevel = score, time = GetTime()}
        else
            InspectInfo[guid].itemLevel = score
            InspectInfo[guid].time = GetTime()
        end
    end
end
LibInspect:AddHook("BFToolTip", "items",
                   function(...) GetInspectItemLevel(...) end)
local function GetInspectTalentInfo(guid, data, age)
    if ((not guid) or (data and type(data.talents) ~= "table")) then return end
    if type(data) ~= "table" then return end
    local spec = data.talents.name
    if (spec) then
        if not InspectInfo[guid] then
            InspectInfo[guid] = {talentName = spec, time = GetTime()}
        else
            InspectInfo[guid].talentName = spec
            InspectInfo[guid].time = GetTime()
        end
    end
end
LibInspect:AddHook("BFToolTip", "talents",
                   function(...) GetInspectTalentInfo(...) end)
local function OnTooltipSetUnit(_tooltip)
    _tooltip.freebtipiLvlSet = false
    _tooltip.freebtipSpecSet = false
    _tooltip.stillFind = false
    if BFTT_Config["TooltipType"] == 2 then
        local unit = GetCurrUnit()
        NewType_OnSetUnit(_tooltip)
        if not InspectFrame or (InspectFrame and not InspectFrame:IsShown()) then
            LibInspect:RequestData("items", unit)
        end
    elseif BFTT_Config["TooltipType"] == 1 then
        local unit = GetCurrUnit()
        BFTooltip_6b595d544c5c02ea5184b48c2201a3f7(_tooltip, unit)
    end
end
local function BFTooltip_c26bb4c4b37e799f1819a6f53957dcaa()
    if BFTT_Config["TooltipType"] == 2 then
        if (GameTooltip.factionIcon) then GameTooltip.factionIcon:Hide() end
        if not (GameTooltip.freebtipItem) then
            GameTooltip:SetBackdropBorderColor(newType_config.bdrcolor.r,
                                               newType_config.bdrcolor.g,
                                               newType_config.bdrcolor.b)
        end
    elseif BFTT_Config["TooltipType"] == 1 then
        if GameTooltip.classIcon then
            GameTooltip.classIcon:SetTexture("")
            GameTooltip.classIcon:Hide()
        end
    end
end
local function BFTooltip_d778efd40aafd6a2ce01001bc73179eb(origfunc,
                                                          BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)
    local r, g, b
    if (UnitPlayerControlled(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)) then
        if (UnitCanAttack(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c, "player")) then
            if (not UnitCanAttack("player",
                                  BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)) then
                r = 1.0
                g = 1.0
                b = 1.0
                GameTooltip:SetBackdropColor(
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[3].r,
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[3].g,
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[3].b)
            else
                r = FACTION_BAR_COLORS[2].r
                g = FACTION_BAR_COLORS[2].g
                b = FACTION_BAR_COLORS[2].b
                GameTooltip:SetBackdropColor(
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[4].r,
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[4].g,
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[4].b)
            end
        elseif (UnitCanAttack("player",
                              BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)) then
            r = FACTION_BAR_COLORS[4].r
            g = FACTION_BAR_COLORS[4].g
            b = FACTION_BAR_COLORS[4].b
            GameTooltip:SetBackdropColor(
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[2].r,
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[2].g,
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[2].b)
        elseif (UnitIsPVP(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c)) then
            r = 0
            g = 1
            b = 0
            GameTooltip:SetBackdropColor(
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].r,
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].g,
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].b)
        else
            r = 0.0
            g = 0.8
            b = 1.0
            GameTooltip:SetBackdropColor(
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].r,
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].g,
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].b)
        end
    else
        local BFTooltip_c563f0e90b41e682984a062bfdb28376 =
            UnitReaction(BFTooltip_fd724fd3c5e25aaf3b4226e1dae5257c, "player")
        if (BFTooltip_c563f0e90b41e682984a062bfdb28376) then
            r = FACTION_BAR_COLORS[BFTooltip_c563f0e90b41e682984a062bfdb28376].r
            g = FACTION_BAR_COLORS[BFTooltip_c563f0e90b41e682984a062bfdb28376].g
            b = FACTION_BAR_COLORS[BFTooltip_c563f0e90b41e682984a062bfdb28376].b
            if (BFTooltip_c563f0e90b41e682984a062bfdb28376 <= 3) then
                GameTooltip:SetBackdropColor(
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[4].r,
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[4].g,
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[4].b)
            elseif (BFTooltip_c563f0e90b41e682984a062bfdb28376 == 4) then
                GameTooltip:SetBackdropColor(
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[5].r,
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[5].g,
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[5].b)
            else
                GameTooltip:SetBackdropColor(
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].r,
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].g,
                    BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].b)
            end
        else
            r = 0.0
            g = 0.8
            b = 1.0
            GameTooltip:SetBackdropColor(
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].r,
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].g,
                BFTooltip_d529cdbee72d24a256b536b5aa241d53[1].b)
        end
    end
    return r, g, b
end
local function BFTooltip_e09df68d86d3518f432268e2ba0cc101(
    BFTooltip_6c162b1123a1eb57c1827271b32b6959,
    BFTooltip_1346009d8936868590c1d007e3efcfae)
    if not switch then return end
    if not BFTooltip_1346009d8936868590c1d007e3efcfae then return end
    if (BFTooltip_6c162b1123a1eb57c1827271b32b6959 == getglobal("GameTooltip") or
        BFTooltip_6c162b1123a1eb57c1827271b32b6959 ==
        getglobal("MobileGameTooltip")) then
        local BFTooltip_c7268fe06b62927ac6031241d1c8fc74 = GetMouseFocus()
        if (BFTooltip_c7268fe06b62927ac6031241d1c8fc74) then
            if (BFTooltip_c7268fe06b62927ac6031241d1c8fc74:GetName() ~=
                "WorldFrame" and BFTT_Config["Anchor"] == 2) then
            else
                BFTooltip_6c162b1123a1eb57c1827271b32b6959:ClearAllPoints()
                BFTooltip_6c162b1123a1eb57c1827271b32b6959:SetOwner(
                    BFTooltip_1346009d8936868590c1d007e3efcfae, "ANCHOR_NONE")
                if (BFTT_Config["Anchor"] == 1) then
                    BFTooltip_6c162b1123a1eb57c1827271b32b6959:SetPoint(
                        "BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT",
                        -CONTAINER_OFFSET_X - 13, CONTAINER_OFFSET_Y)
                else
                    local BFTooltip_b254e387cf58e982ba24fcb3e8a63995,
                          BFTooltip_a0f453fd098c0b0fda780f69cda6ffbf =
                        GetCursorPosition()
                    local BFTooltip_6230e23f021dec637edabaa368556c06 =
                        UIParent:GetScale()
                    BFTooltip_b254e387cf58e982ba24fcb3e8a63995, BFTooltip_a0f453fd098c0b0fda780f69cda6ffbf =
                        BFTooltip_b254e387cf58e982ba24fcb3e8a63995 /
                            BFTooltip_6230e23f021dec637edabaa368556c06,
                        BFTooltip_a0f453fd098c0b0fda780f69cda6ffbf /
                            BFTooltip_6230e23f021dec637edabaa368556c06
                    local BFTooltip_79aa110240eabb8f0bf6dbb352d9d22c,
                          BFTooltip_5017a01ce90213af1c3e06519518a9bf =
                        BFTT_Config["PositionX"], BFTT_Config["PositionY"]
                    if (BFTT_Config["Anchor"] == 2) then
                        BFTooltip_79aa110240eabb8f0bf6dbb352d9d22c =
                            BFTooltip_79aa110240eabb8f0bf6dbb352d9d22c +
                                BFTooltip_b254e387cf58e982ba24fcb3e8a63995
                        BFTooltip_5017a01ce90213af1c3e06519518a9bf =
                            BFTooltip_5017a01ce90213af1c3e06519518a9bf +
                                BFTooltip_a0f453fd098c0b0fda780f69cda6ffbf
                    end
                    BFTooltip_6c162b1123a1eb57c1827271b32b6959:SetPoint(
                        BFTooltip_078de750fe835178a4e8445fca9d135e[BFTT_Config["Anchor"]][1],
                        UIParent,
                        BFTooltip_078de750fe835178a4e8445fca9d135e[BFTT_Config["Anchor"]][2],
                        BFTooltip_79aa110240eabb8f0bf6dbb352d9d22c,
                        BFTooltip_5017a01ce90213af1c3e06519518a9bf)
                end
            end
        end
    end
end
function BFTT_Toggle(enable, _tooltipType)
    BFTT_Config["TooltipType"] = _tooltipType
    switch = enable
    if (enable) then
        if not hook then
            if BFTT_Config["TooltipType"] == 2 then
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(
                    GameTooltip, "OnUpdate", GT_OnUpdate)
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(
                    GameTooltip, "OnTooltipSetItem", attachItemTooltip)
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(
                    ItemRefTooltip, "OnTooltipSetItem", attachItemTooltip)
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(
                    ItemRefShoppingTooltip1, "OnTooltipSetItem",
                    attachItemTooltip)
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(
                    ItemRefShoppingTooltip2, "OnTooltipSetItem",
                    attachItemTooltip)
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(
                    ShoppingTooltip1, "OnTooltipSetItem", attachItemTooltip)
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(
                    ShoppingTooltip2, "OnTooltipSetItem", attachItemTooltip)
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:Hook(ItemRefTooltip,
                                                                "SetHyperlink",
                                                                onSetHyperlink)
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:Hook(GameTooltip,
                                                                "SetHyperlink",
                                                                onSetHyperlink)
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:Hook(GameTooltip,
                                                                "SetHyperlink",
                                                                onSetHyperlink)
                BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(
                    GameTooltip, "OnTooltipSetSpell", function(self)
                        local id = select(2, self:GetSpell())
                        if id then
                            addLine(self, id, types.spell)
                        end
                    end)
            elseif BFTT_Config["TooltipType"] == 1 then
                GameTooltip.classIcon =
                    GameTooltip:CreateTexture(nil, "ARTWORK")
                GameTooltip.classIcon:SetPoint("LEFT", getglobal(
                                                   "GameTooltipTextLeft1"),
                                               "LEFT", 2, -1)
                GameTooltip.classIcon:SetWidth(14)
                GameTooltip.classIcon:SetHeight(14)
                GameTooltip.classIcon:Hide()
                BFTooltip_cce46e1be80d9ce416e785215e447afb()
            end
            hook = true
        end
        if BFTT_Config["TooltipType"] == 1 then
            BFTooltip_d21ea2df7d42b70936e5762719760d32:Hook(
                "GameTooltip_UnitColor",
                BFTooltip_d778efd40aafd6a2ce01001bc73179eb)
        elseif BFTT_Config["TooltipType"] == 2 then
            hooksecurefunc("SetItemRef", function(link, ...)
                if BFTT_Config["TooltipType"] == 2 then
                    local id = tonumber(link:match("spell:(%d+)"))
                    if id then
                        addLine(ItemRefTooltip, id, types.spell)
                    end
                end
            end)
            NewType_Init()
        end
        hooksecurefunc("GameTooltip_SetDefaultAnchor",
                       BFTooltip_e09df68d86d3518f432268e2ba0cc101)
        BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:Hook(GameTooltip, "FadeOut",
                                                        BFTooltip_65d610506803fe617339151af6dbc5db)
        BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(GameTooltip,
                                                              'OnTooltipSetUnit',
                                                              OnTooltipSetUnit)
        BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:HookScript(GameTooltip,
                                                              "OnTooltipCleared",
                                                              BFTooltip_c26bb4c4b37e799f1819a6f53957dcaa)
        BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:Enable()
        BFTooltip_073f44590a2a7f437c05b9420615abb4:RegisterEvent(
            "UPDATE_MOUSEOVER_UNIT")
        BFTooltip_073f44590a2a7f437c05b9420615abb4:SetScript("OnEvent",
                                                             function(self,
                                                                      event, ...)
            if (event == "UPDATE_MOUSEOVER_UNIT") then
                if (UnitIsMouseOver()) then BFTT_Fresh:Show() end
            end
        end)
        BFTT_Fresh:Show()
    else
        if BFTT_Config["TooltipType"] == 1 then
            BFTooltip_d21ea2df7d42b70936e5762719760d32:Unhook(
                "GameTooltip_UnitColor")
        end
        BFTooltip_6c391f92e72d1c9b7434bca8947c5e2c:Disable()
        BFTooltip_073f44590a2a7f437c05b9420615abb4:UnregisterAllEvent()
        BFTT_Fresh:Hide()
    end
end
