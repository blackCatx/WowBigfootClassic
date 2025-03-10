local mod	= DBM:NewMod(479, "DBM-Party-Classic", 19, 240)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20190813032603")
mod:SetCreatureID(3673)
mod:SetEncounterID(590)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 8040 23381",
	"SPELL_AURA_APPLIED 8040"
)

local warningDruidSlumber			= mod:NewTargetNoFilterAnnounce(8040, 2)
local warningHealingTouch			= mod:NewCastAnnounce(23381, 2)

local specWarnDruidsSlumber			= mod:NewSpecialWarningInterrupt(8040, "HasInterrupt", nil, nil, 1, 2)

local timerDruidsSlumberCD			= mod:NewAITimer(180, 8040, nil, nil, nil, 4, nil, DBM_CORE_INTERRUPT_ICON..DBM_CORE_MAGIC_ICON)
local timerHealingTouchCD			= mod:NewAITimer(180, 23381, nil, nil, nil, 4, nil, DBM_CORE_INTERRUPT_ICON)

function mod:OnCombatStart(delay)
	timerDruidsSlumberCD:Start(1-delay)
	timerHealingTouchCD:Start(1-delay)
end

do
	local DruidsSlumber, HealingTouch = DBM:GetSpellInfo(8040), DBM:GetSpellInfo(23381)
	function mod:SPELL_CAST_START(args)
		--if args.spellId == 8040 then
		if args.spellName == DruidsSlumber and args:IsSrcTypeHostile() then
			if self:CheckInterruptFilter(args.sourceGUID, false, true) then
				specWarnDruidsSlumber:Show(args.sourceName)
				specWarnDruidsSlumber:Play("kickcast")
			end
		--elseif args.spellId == 23381 then
		elseif args.spellName == HealingTouch and args:IsSrcTypeHostile() then
			warningHealingTouch:Show()
			timerHealingTouchCD:Start()
		end
	end

	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 8040 then
		if args.spellName == DruidsSlumber and args:IsDestTypePlayer() then
			warningDruidSlumber:Show(args.destName)
		end
	end
end
