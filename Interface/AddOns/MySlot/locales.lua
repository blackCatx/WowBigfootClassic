local _, MySlot = ...

local L = setmetatable({}, {
	__index = function(table, key)
		if key then
			table[key] = tostring(key)
		end
		return tostring(key)
	end,
})

MySlot.L = L

--
-- Use http://www.wowace.com/addons/myslot/localization/ to translate thanks
--
local locale = GetLocale()

if locale == 'enUs' then
	L["[WARN] Ignore slot due to an unknown error DEBUG INFO = [S=%s T=%s I=%s] Please send Importing Text and DEBUG INFO to %s"] = true
	L["[WARN] Ignore unsupported Key Binding [ %s ] , contact %s please"] = true
	L["[WARN] Ignore unsupported Slot Type [ %s ] , contact %s please"] = true
	L["All slots were restored"] = true
	L["Are you SURE to import ?"] = true
	L["Bad importing text [CRC32]"] = true
	L["Bad importing text [TEXT]"] = true
	L["Close"] = true
	L["Export"] = true
	L["Feedback"] = true
	L["Ignore unactived pet[id=%s], %s"] = true
	L["Ignore unlearned skill [id=%s], %s"] = true
	L["Import"] = true
	L["Import is not allowed when you are in combat"] = true
	L["Importing text [ver:%s] is not compatible with current version"] = true
	L["Macro %s was ignored, check if there is enough space to create"] = true
	L["Time"] = true
	L["TOC_NOTES"] = "Myslot is for transferring settings between accounts. Feedback farmer1992@gmail.com"
	L["Use random mount instead of an unactived mount"] = true

	MySlot_TitleText= "My Slot III";
	MySlot_GetText = "Export";
	MySlot_LoadText = "Load";
	MySlot_ImportText = "Importing";
	MySlot_SAVE_SUCCESS = "Key configuration  [%s]  Saved.";
	MySlot_CHANGE_SUCCESS = "Key configuration  [%s]  Has been modified.";
	MySlot_DEL_SUCCESS = "Key configuration  [%s]  Deleted.";
	MySlot_DEL_Text = "Are you sure you want to delete the program [%s]?";
	MySlot_Load_Scheme = "Load program";
	MySlot_LoadSchemeText = "Load";
	MySlot_Warning = "Macro [%s] is ignored, because you do not have more macro storage space, storage space to prepare an adequate macro re-import."
	MySlot_Scheme_No = "Key configuration"
	MySlot_Now_Scheme = "The current editor text "
	MySlot_Now_Scheme2 = "Edit the text in the current configuration"
	MySlot_Sure_Scheme = "Are you sure you want to import %s key configuration text?"
	MySlot_Load_Success = "%sHas been successfully loaded."
	MySlot_Text_Class = "@ Profession:"
	MySlot_Text_Unit = "@ Figure:"
	MySlot_Text_Talent = "@ Talent:"
	MySlot_Text_Date = "@ Export configuration time:"
	MySlot_InCombat = "Do not use the import feature under a state of war!"
	MySlot_Error = "Import string error, please check again after import!"
elseif locale == 'zhCN' then
	L["[WARN] Ignore slot due to an unknown error DEBUG INFO = [S=%s T=%s I=%s] Please send Importing Text and DEBUG INFO to %s"] = "[WARN] 忽略出错技能 DEBUG INFO = [S=%s T=%s I=%s] 请将出错的字符和 DEBUG INFO 发给作者 %s"
	L["[WARN] Ignore unsupported Key Binding [ %s ] , contact %s please"] = "[WARN] 忽略不支持的按键绑定 [ %s ]，请通知作者 %s"
	L["[WARN] Ignore unsupported Slot Type [ %s ] , contact %s please"] = "[WARN] 忽略不支持的按键类型 [ %s ]，请通知作者 %s"
	L["All slots were restored"] = "所有按钮及按键邦定位置恢复完毕"
	L["Are you SURE to import ?"] = "你确定要导入吗？"
	L["Bad importing text [CRC32]"] = "导入字符码校验不合法 [CRC32]"
	L["Bad importing text [TEXT]"] = "导入字符不合法 [TEXT]"
	L["Close"] = "关闭"
	L["Export"] = "导出"
	L["Feedback"] = "问题/建议"
	L["Ignore unactived pet[id=%s], %s"] = "忽略未开启的战斗宠物[id=%s]：%s"
	L["Ignore unlearned skill [id=%s], %s"] = "忽略未掌握技能[id=%s]：%s"
	L["Import"] = "导入"
	L["Import is not allowed when you are in combat"] = "请在非战斗时候使用导入功能"
	L["Importing text [ver:%s] is not compatible with current version"] = "导入字串 [ver:%s] 不兼容当前版本"
	L["Macro %s was ignored, check if there is enough space to create"] = "宏 [ %s ] 被忽略，请检查是否有足够的空格创建宏"
	L["Time"] = "时间"
	L["TOC_NOTES"] = "保存你的技能按钮位置。反馈：farmer1992@gmail.com"
	L["Use random mount instead of an unactived mount"] = "使用随机坐骑代替没有的坐骑"

	MySlot_TitleText = "按键配置";
	MySlot_GetText = "生成";
	MySlot_LoadText = "载入";
	MySlot_ImportText = "导入";
	MySlot_SAVE_SUCCESS = "按键配置方案  [%s]  已保存。";
	MySlot_CHANGE_SUCCESS = "按键配置方案  [%s]  已修改。";
	MySlot_DEL_SUCCESS = "按键配置方案  [%s]  已删除。";
	MySlot_DEL_Text = "你确定要删除方案  [%s]  吗？";
	MySlot_Load_Scheme = "载入方案";
	MySlot_LoadSchemeText = "加载";
	MySlot_Warning = "宏  [%s]  被忽略，因为你没有更多的宏储存空间，请准备充足的宏储存空间后重新导入。"
	MySlot_Scheme_No = "按键配置方案"
	MySlot_Now_Scheme = "当前编辑文本中"
	MySlot_Now_Scheme2 = "当前编辑文本中的配置"
	MySlot_Sure_Scheme = "你确定要导入%s的按键配置文本吗？"
	MySlot_Load_Success = "%s已成功加载。"
	MySlot_Text_Class = "@ 职业："
	MySlot_Text_Unit = "@ 人物："
	MySlot_Text_Talent = "@ 天赋："
	MySlot_Text_Date = "@ 配置生成时间："
	MySlot_InCombat = "请勿在战斗状态下使用导入功能！"
	MySlot_Error = "导入字符串有误，请检查后重新导入！"

elseif locale == 'zhTW' then
	L["[WARN] Ignore slot due to an unknown error DEBUG INFO = [S=%s T=%s I=%s] Please send Importing Text and DEBUG INFO to %s"] = "[WARN] 忽略出錯的欄位：DEBUG INFO = [S=%s T=%s I=%s] 請將出錯的字串與DEBUG INFO發給作者 %s。"
	L["[WARN] Ignore unsupported Key Binding [ %s ] , contact %s please"] = "[WARN] 忽略不支援的按鍵設置：K = [ %s ] ，請通知作者 %s"
	L["[WARN] Ignore unsupported Slot Type [ %s ] , contact %s please"] = "[WARN] 忽略不支援的欄位設置：K = [ %s ] ，請通知作者 %s"
	L["All slots were restored"] = "所有按鍵設定都已恢復完畢"
	L["Are you SURE to import ?"] = "你確定要導入嗎？"
	L["Bad importing text [CRC32]"] = "錯誤的導入字串[CRC32]"
	L["Bad importing text [TEXT]"] = "錯誤的導入字串[TEXT]"
	L["Close"] = "關閉"
	L["Export"] = "導出"
	L["Feedback"] = "反饋"
	L["Ignore unactived pet[id=%s], %s"] = "忽略沒有的寵物 [id=%s]：%s"
	L["Ignore unlearned skill [id=%s], %s"] = "忽略未習得技能 [id=%s], %s"
	L["Import"] = "導入"
	L["Import is not allowed when you are in combat"] = "請在非戰鬥狀態時使用導入功能"
	L["Importing text [ver:%s] is not compatible with current version"] = "導入的字串版本與當前版本不相容。(字串版本號：%s)"
	L["Macro %s was ignored, check if there is enough space to create"] = "忽略巨集 [%s] ，請檢查是否有足夠的欄位創建新巨集"
	L["Time"] = "時間"
	L["TOC_NOTES"] = "Myslot可以跨帳號綁定技能與按鍵設置。反饋通道：farmer1992@gmail.com"
	L["Use random mount instead of an unactived mount"] = "使用隨機座騎代替沒有的座騎"

	MySlot_TitleText = "按鍵配置";
	MySlot_GetText = "生成";
	MySlot_LoadText = "載入";
	MySlot_ImportText = "導入";
	MySlot_SAVE_SUCCESS = "按鍵配置方案  [%s]  已保存。";
	MySlot_CHANGE_SUCCESS = "按鍵配置方案  [%s]  已修改。";
	MySlot_DEL_SUCCESS = "按鍵配置方案  [%s]  已刪除。";
	MySlot_DEL_Text = "你确定要删除方案  [%s]  嗎？";
	MySlot_Load_Scheme = "載入方案";
	MySlot_LoadSchemeText = "加載";
	MySlot_Warning = "宏  [%s]  被忽略，因為你沒有更多的宏存儲空間，請准備充足的宏存儲空間后重新導入。"
	MySlot_Scheme_No = "按鍵配置方案"
	MySlot_Now_Scheme = "當前編輯文本中"
	MySlot_Now_Scheme2 = "當前編輯文本中的配置"
	MySlot_Sure_Scheme = "你確定要導入%s的按鍵配置文本嗎？"
	MySlot_Load_Success = "%s已成功加載。"
	MySlot_Text_Class = "@ 職業："
	MySlot_Text_Unit = "@ 人物："
	MySlot_Text_Talent = "@ 天賦："
	MySlot_Text_Date = "@ 配置生成時間："
	MySlot_InCombat = "請勿在戰鬥狀態下使用導入功能！"
	MySlot_Error = "導入字符串有誤，請檢查后重新導入！"
end

