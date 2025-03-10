local mod	= DBM:NewMod("PlaguemawtheRotting", "DBM-Party-Classic", 10)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20190810210513")
mod:SetCreatureID(7356)
--mod:SetEncounterID(585)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 12946",
	"SPELL_AURA_APPLIED 12946 11442"
)

local warningWitheredTouch			= mod:NewTargetNoFilterAnnounce(11442, 2, nil, "RemoveDisease")

local specWarnPutridStench			= mod:NewSpecialWarningDispel(12946, "RemoveDisease", nil, nil, 1, 2)

local timerPutridStenchCD			= mod:NewAITimer(180, 12946, nil, nil, nil, 5, nil, DBM_CORE_DISEASE_ICON)

function mod:OnCombatStart(delay)
	timerPutridStenchCD:Start(1-delay)
end

do
	local PutridStench, WitheredTouch = DBM:GetSpellInfo(12946), DBM:GetSpellInfo(11442)
	function mod:SPELL_CAST_SUCCESS(args)
		--if args.spellId == 12946 then
		if args.spellName == PutridStench then
			timerPutridStenchCD:Start()
		end
	end

	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 12946 and self:CheckDispelFilter() then
		if args.spellName == PutridStench and self:CheckDispelFilter() then
			specWarnPutridStench:Show(args.destName)
			specWarnPutridStench:Play("helpdispel")
		--elseif args.spellId == 11442 and self:CheckDispelFilter() then
		elseif args.spellName == WitheredTouch and self:CheckDispelFilter() then
			warningWitheredTouch:Show(args.destName)
		end
	end
end
