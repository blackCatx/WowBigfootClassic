
function ClassModConfigFunc()
	local BIGFOOT_CLASS_MOD,ENABLE_AIMED_SHOT,ENABLE_AIMED_SHOT_TOOLTIP,AJUST_CAST_POSITION, ENABLE_MISDIRECT,ENABLE_MISDIRECT_TOOLTIP;
	local ENABLE_ASPECT_BAR,ENABLE_ATTACK_TIMER,ENABLE_ATTACK_TIMER_TOOLTIP,CLASS_MOD_PATH,USE_OLD_COB,USE_OLD_COB_TEXT;
	local ENABLE_FOCUS_BAR,ENABLE_FOCUS_BAR_TOOLTIP,ENABLE_RAGE_BAR,ENABLE_RAGE_BAR_TOOLTIP

	if (GetLocale() == "zhCN") then
		BIGFOOT_CLASS_MOD = {"职业助手", "zhiyezhushou",2};

		USE_OLD_COB = "使用经典样式连击点数"
		USE_OLD_COB_TEXT = "设置连击点数生效需重新加载插件"

		ENABLE_ASPECT_BAR = "启用守护动作条";
		ENABLE_ASPECT_BAR_TOOLTIP= "在经验条上方额外显示守护动作条";

		ENABLE_MISDIRECT = "误导提示";
		ENABLE_MISDIRECT_TOOLTIP= "以喊话的方式提示误导";

		ENABLE_ATTACK_TIMER = "启用近战攻击计时器";
		ENABLE_ATTACK_TIMER_TOOLTIP= "在屏幕中下方显示下次普通攻击的剩余时间框体";

		ENABLE_AIMED_SHOT = "启用自动射击计时器";
		ENABLE_AIMED_SHOT_TOOLTIP = "在屏幕中下方显示下次普通射击的剩余时间框体";

		AJUST_CAST_POSITION = "调整位置";

		ENABLE_FOCUS_BAR = "开启集中值监视";
		ENABLE_FOCUS_BAR_TOOLTIP = "在屏幕中监视集中值，在脱离战斗时变为透明"

		ENABLE_RAGE_BAR = "开启怒气值监视";
		ENABLE_RAGE_BAR_TOOLTIP = "在屏幕中监视怒气值，在脱离战斗时变为透明"

		ENABLE_ECLIPS_TRACKER = "开启日能和月能监视"
		ENABLE_ECLIPS_TRACKER_TOOLTIP = "在屏幕中监视日能和月能，在脱离战斗时变为透明(只在枭兽形态下显示)"
		HIDE_ECLIPS_TRACKER = "隐藏系统能量条框体"

		ENABLE_MONK_ENERGY = "开启能量监视"
		ENABLE_MONK_ENERGY_TOOLTIP = "监视武僧能量,在脱离战斗后变为透明"

		ENABLE_BFTalent = "开启天赋助手"
	elseif (GetLocale() == "zhTW") then
		BIGFOOT_CLASS_MOD = {"職業助手", "zhiyezhushou",2};

		USE_OLD_COB = "使用經典樣式連擊點數"
		USE_OLD_COB_TEXT = "設置連擊點數生效需重新加載插件"

		ENABLE_ASPECT_BAR = "啟用守護動作條";
		ENABLE_ASPECT_BAR_TOOLTIP= "在經驗條上方額外顯示守護動作條";

		ENABLE_MISDIRECT = "誤導提示";
		ENABLE_MISDIRECT_TOOLTIP= "以喊話的方式誤導提示";

		ENABLE_ATTACK_TIMER = "啟用近戰攻擊計時器";
		ENABLE_ATTACK_TIMER_TOOLTIP= "在屏幕中下方顯示下次普通攻擊的剩餘時間框體";

		ENABLE_AIMED_SHOT = "啟用自动射擊計時器";
		ENABLE_AIMED_SHOT_TOOLTIP= "在屏幕中下方顯示下次普通射擊的剩餘時間框體";

		AJUST_CAST_POSITION = "調整位置";

		ENABLE_FOCUS_BAR = "開啟集中值監視";
		ENABLE_FOCUS_BAR_TOOLTIP = "在屏幕中監視集中值，在脫戰後變為透明"

		ENABLE_RAGE_BAR = "開啟怒氣值監視";
		ENABLE_RAGE_BAR_TOOLTIP = "在屏幕中監視怒氣值，在脫戰後變為透明"

		ENABLE_ECLIPS_TRACKER = "開啟日能和月能監視"
		ENABLE_ECLIPS_TRACKER_TOOLTIP = "在屏幕中監視日能和月能，在脫戰後變為透明(只在梟獸形態下顯示)"
		HIDE_ECLIPS_TRACKER = "隱藏系統能量框體"

		ENABLE_MONK_ENERGY = "開啟真氣監視"
		ENABLE_MONK_ENERGY_TOOLTIP = "監視武僧真氣,在脫戰後變為透明"

		ENABLE_BFTalent = "開啟天賦助手"
	else
		BIGFOOT_CLASS_MOD = "Class Assist";
		ENABLE_AIMED_SHOT = "Enable Auto Shot Timer";
		ENABLE_ASPECT_BAR = "Enable Aspect Bar";

		ENABLE_MISDIRECT = "Yell when cast misdirect";
		AJUST_CAST_POSITION = "Ajust position";
		ENABLE_ATTACK_TIMER = "Enable Attack Timer";
	end

	local playerclass = select(2, UnitClass("player"));

	if (playerclass == "HUNTER") then
		CLASS_MOD_PATH = "Interface\\ICONS\\Ability_Hunter_SniperShot.blp";
	elseif (playerclass == "WARRIOR") then
		CLASS_MOD_PATH = "Interface\\Icons\\Ability_Warrior_Charge.blp";
	elseif (playerclass == "PALADIN") then
		CLASS_MOD_PATH = "Interface\\Icons\\Spell_Holy_DivineIntervention.blp";
	elseif (playerclass == "SHAMAN") then
		CLASS_MOD_PATH = "Interface\\ICONS\\Spell_Nature_StoneSkinTotem.blp";
	else
		CLASS_MOD_PATH = "Interface\\ICONS\\Ability_Hunter_SniperShot.blp";
	end

	if IsConfigurableAddOn("BFClassMods") or IsConfigurableAddOn("AttackTimer") or (IsConfigurableAddOn("NewPowerBar") and playerclass == "HUNTER" or playerclass == "WARRIOR" or playerclass == "DRUID" or playerclass == "MONK") or playerclass == "ROGUE" then
		ModManagement_RegisterMod(
			"BigFootClassMod",
			CLASS_MOD_PATH,
			BIGFOOT_CLASS_MOD
		);
	end

	if playerclass == "ROGUE" then
		ModManagement_RegisterCheckBox(
			"BigFootClassMod",
			USE_OLD_COB,
			USE_OLD_COB_TEXT,
			"UseOldCob",
			0,
			function (arg)
				if (arg == 1) then
					if GetCVar("comboPointLocation") ~= "1" then
						SetCVar("comboPointLocation",1);
						BigFoot_RequestReloadUI(function() BigFoot_Print(USE_OLD_COB_TEXT); end);
					end
				else
					if GetCVar("comboPointLocation") ~= GetCVarDefault("comboPointLocation") then
						SetCVar("comboPointLocation",GetCVarDefault("comboPointLocation"))
						BigFoot_RequestReloadUI(function() BigFoot_Print(USE_OLD_COB_TEXT); end);
					end
				end
			end,
			nil,
			function()
				if GetCVar("comboPointLocation") ~= GetCVarDefault("comboPointLocation") then
					BigFoot_SetModVariable("BigFootClassMod", "UseOldCob", 1);
				else
					BigFoot_SetModVariable("BigFootClassMod", "UseOldCob", 0);
				end
			end
		);
	end

	if IsConfigurableAddOn("BFTalent") then
		ModManagement_RegisterCheckBox(
			"BigFootClassMod",
			ENABLE_BFTalent,
			nil,
			"EnaBFTalent",
			1,
			function (arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("BFTalent")) then
						BigFoot_LoadAddOn("BFTalent");
					end
					if (BigFoot_IsAddOnLoaded("BFTalent")) then
						BFTalent_Toggle(true);
					end
				else
					if (BigFoot_IsAddOnLoaded("BFTalent")) then
						BFTalent_Toggle(false);
					end
				end
			end
		);
	end

	if playerclass == "HUNTER" and IsConfigurableAddOn("BFClassMods") then
		ModManagement_RegisterCheckBox(
			"BigFootClassMod",
			ENABLE_AIMED_SHOT,
			ENABLE_AIMED_SHOT_TOOLTIP,
			"EnableAimedShot",
			1,
			function (arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("BFClassMods")) then
						BigFoot_LoadAddOn("BFClassMods");
					end
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						HunterAssistBar_Toggle(true);
					end
				else
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						HunterAssistBar_Toggle(false);
					end
				end
			end
		);
		ModManagement_RegisterButton(
			"BigFootClassMod",
			AJUST_CAST_POSITION,
			function ()
				if (BigFoot_IsAddOnLoaded("BFClassMods")) then
					HunterAssistCasteBar_AjustPosition();
				end
			end,
			nil,
			1
		);
		ModManagement_RegisterCheckBox(
			"BigFootClassMod",
			ENABLE_MISDIRECT,
			ENABLE_MISDIRECT_TOOLTIP,
			"EnablemisDirect",
			0,
			function (arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("BFClassMods")) then
						BigFoot_LoadAddOn("BFClassMods");
					end
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						HunterAssistMisdirect_Toggle(true);
					end
				else
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						HunterAssistMisdirect_Toggle(false);
					end
				end
			end
		);
	end

	if IsConfigurableAddOn("AttackTimer") then
		ModManagement_RegisterCheckBox(
			"BigFootClassMod",
			ENABLE_ATTACK_TIMER,
			ENABLE_ATTACK_TIMER_TOOLTIP,
			"EnableAttackTimer",
			1,
			function (arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("AttackTimer")) then
						BigFoot_LoadAddOn("AttackTimer");
					end
					if (BigFoot_IsAddOnLoaded("AttackTimer")) then
						AttackTimer_Toggle(true);
					end
				else
					if (BigFoot_IsAddOnLoaded("AttackTimer")) then
						AttackTimer_Toggle(false);
					end
				end
			end
		);
		ModManagement_RegisterButton(
			"BigFootClassMod",
			AJUST_CAST_POSITION,
			function ()
				if (BigFoot_IsAddOnLoaded("AttackTimer")) then
					AttackTimer_AjustPosition();
				end
			end,
			nil,
			1
		);
	end

	if (playerclass == "MAGE" or playerclass == "WARLOCK") and IsConfigurableAddOn("BFClassMods") then
		ModManagement_RegisterCheckBox(
			"BigFootClassMod",
			ENABLE_ASPECT_BAR,
			ENABLE_ASPECT_BAR_TOOLTIP,
			"EnableAspectBar",
			1,
			function (arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("BFClassMods")) then
						BigFoot_LoadAddOn("BFClassMods");
					end
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						ToggleBFAspectBar(true)
					end
				else
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						ToggleBFAspectBar(false)
					end
				end
			end	,
			nil,
			function (arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("BFClassMods")) then
						BigFoot_LoadAddOn("BFClassMods");
					end
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						BigFoot_DelayCall(function()
								ToggleBFAspectBar(true)
							end,
							5)
					end
				else
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						ToggleBFAspectBar(false)
					end
				end
			end
		);
	end

	if ( (playerclass == "HUNTER" or playerclass == "WARRIOR" or playerclass == "DRUID" or playerclass == "MONK") and IsConfigurableAddOn("NewPowerBar")) then
		local enableCheckBox,enableToolTip;
		if playerclass == "HUNTER" then
			enableCheckBox = ENABLE_FOCUS_BAR
			enableToolTip = ENABLE_FOCUS_BAR_TOOLTIP
		elseif playerclass == "WARRIOR" then
			enableCheckBox = ENABLE_RAGE_BAR
			enableToolTip = ENABLE_RAGE_BAR_TOOLTIP
		elseif playerclass == "DRUID" then
			enableCheckBox = ENABLE_ECLIPS_TRACKER
			enableToolTip = ENABLE_ECLIPS_TRACKER_TOOLTIP
		elseif playerclass == "MONK" then
			enableCheckBox = ENABLE_MONK_ENERGY
			enableToolTip = ENABLE_MONK_ENERGY_TOOLTIP
		end
		ModManagement_RegisterCheckBox(
			"BigFootClassMod",
			enableCheckBox,
			enableToolTip,
			"EnableNewPowerBar",
			nil,
			function (arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("NewPowerBar")) then
						BigFoot_LoadAddOn("NewPowerBar");
						BigFoot_RegistMoveFrame("NewPowerBarStructFrame")
					end
				else
					if (BigFoot_IsAddOnLoaded("NewPowerBar")) then
						BigFoot_RequestReloadUI()
					end
				end
			end,nil,
			function(arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("NewPowerBar")) then
						BigFoot_LoadAddOn("NewPowerBar");
						BigFoot_RegistMoveFrame("NewPowerBarStructFrame")
					end
					if (BigFoot_IsAddOnLoaded("NewPowerBar")) then
					end
				end
			end
		);
	end

	if ( playerclass == "DRUID" and IsConfigurableAddOn("NewPowerBar")) then
		local enableCheckBox,enableToolTip;
		local f = CreateFrame'Frame';
		f:RegisterEvent("UPDATE_SHAPESHIFT_FORM");

		ModManagement_RegisterCheckBox(
			"BigFootClassMod",
			HIDE_ECLIPS_TRACKER,
			nil,
			"HideEclipsBar",
			1,
			function (arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("BFClassMods")) then
						BigFoot_LoadAddOn("BFClassMods");
					end
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						EclipseBarFrame:Hide()
					end
				else
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						EclipseBarFrame:Show()
					end
				end
			end,
			1,
			function(arg)
				f:SetScript('OnEvent', function(self, event, ...)
					if arg == 1 and EclipseBarFrame:IsShown() then
						EclipseBarFrame:Hide()
					end
				end)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("BFClassMods")) then
						BigFoot_LoadAddOn("BFClassMods");
					end
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						BigFoot_DelayCall(function ()
							EclipseBarFrame:Hide()
						end,0.1)
					end
				else
					if (BigFoot_IsAddOnLoaded("BFClassMods")) then
						EclipseBarFrame:Show()
					end
				end
			end
		);
	end

end

BigFoot_AddCollector(ClassModConfigFunc)