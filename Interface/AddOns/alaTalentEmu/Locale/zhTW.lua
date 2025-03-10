﻿--[[--
	alex@0
--]]--
----------------------------------------------------------------------------------------------------
local ADDON, NS = ...;
NS.L = NS.L or {  };
local L = NS.L;

if GetLocale() ~= "zhTW" then return;end
L.Locale = "zhTW";

L.Emu = "仿真器";
L.curTabPointsLabel = "點數";
L.curPointsTotal = "縂點數";
L.curPointsRemaining = "剩餘";
L.curPointsUsed = "已用";
L.curPointsReqLevel = "等級";
L.readOnly = "\124cffff0000只讀\124r";
L.notReadOnly = "\124cff00ff00可編輯\124r";
L.labelPointsChanged = "(\124cffff0000修改\124r)";
L.resetButton = "重置本欄天賦";
L.resetAllButton = "重置所有天賦";
L.resetToSetButton = "重置到初始狀態";
L.readOnlyButton = "\124cff00ff00左鍵\124r切換禁止編輯\n\124cff00ff00右鍵\124r設置窗口風格";
L.closeButton = "關閉窗體";
L.inspectTargetButton = "觀察目標天賦";
L.applyTalentsButton = "應用當前天賦仿真";
L.importButton = "導入字符串";
L.exportButton = "導出字符串";
L.TalentFrameCallButton = "開啓ala天賦仿真器";
L.TalentFrameCallButtonFontString = "仿真器";
L.curRank = "當前等級";
L.nextRank = "下一等級";
L.maxRank = "最高等級";
L.classButton = {
	druid = "druid",
	hunter = "hunter",
	mage = "mage",
	paladin = "paladin",
	priest = "priest",
	rogue = "rogue",
	shaman = "shaman",
	warlock = "warlock",
	warrior = "warrior",
};
L.SetStyleAllTo1_ThisWin = "設置本窗體為三列顯示所有天賦";
L.SetStyleAllTo2_ThisWin = "設置本窗體為單列顯示天賦樹，通過標簽切換";
L.SetStyleAllTo1_AlsoSetShownWin = "設置本插件為三列顯示所有天賦樹（同時更改已顯示的窗體）";
L.SetStyleAllTo1_LaterWin = "設置本插件為三列顯示所有天賦樹";
L.SetStyleAllTo2_AlsoSetShownWin = "設置本插件為單列顯示天賦樹，通過標簽切換（同時更改已顯示的窗體）";
L.SetStyleAllTo2_LaterWin = "設置本插件為單列顯示天賦樹，通過標簽切換";
L.DBIcon_Text = "\124cff00ff00左鍵\124r新建仿真器\n\124cff00ff00右鍵\124r設置窗體風格";


BINDING_NAME_ALARAIDTOOL_NEWWINDOW = "新建仿真器";
BINDING_NAME_ALARAIDTOOL_QUERY = "查看目標天賦";
