local mod	= DBM:NewMod(449, "DBM-Party-Classic", 16, 236)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20190824201836")
mod:SetCreatureID(10812, 10813)--10812 Grand Crusader Dathrohan (stage 1 classic, on live the boss starts out as Balnazzar)
mod:SetEncounterID(478)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 17405 66290 13704",
	"SPELL_AURA_APPLIED 17405 66290",
	"UNIT_DIED"
)

--TODO, P2 trigger, and cleanup boss count code
local warningDomination					= mod:NewTargetNoFilterAnnounce(17405, 4)
--local warningSleep						= mod:NewTargetNoFilterAnnounce(66290, 3)
local warningPsychicScream				= mod:NewSpellAnnounce(13704, 3)

--local specWarnMaddeningCall			= mod:NewSpecialWarningInterrupt(86620, "HasInterrupt", nil, nil, 1, 2)

local timerDominationCD					= mod:NewAITimer(180, 17405, nil, nil, nil, 3)
--local timerSleepCD						= mod:NewAITimer(180, 66290, nil, nil, nil, 3, nil, DBM_CORE_MAGIC_ICON)
local timerPsychicScreamCD				= mod:NewAITimer(180, 13704, nil, nil, nil, 2, nil, DBM_CORE_MAGIC_ICON)

function mod:OnCombatStart(delay)
--	timerDominationCD:Start(1-delay)
--	timerSleepCD:Start(1-delay)
--	timerPsychicScreamCD:Start(1-delay)
end

do
	local Domination, PsychicScream = DBM:GetSpellInfo(17405), DBM:GetSpellInfo(13704)
	function mod:SPELL_CAST_SUCCESS(args)
		--if args.spellId == 17405 then
		if args.spellName == Domination and args:IsSrcTypeHostile() then
			timerDominationCD:Start()
		--elseif args.spellId == 13704 then
		elseif args.spellName == PsychicScream and args:IsSrcTypeHostile() then
			warningPsychicScream:Show()
			timerPsychicScreamCD:Start()
--		elseif args.spellId == 66290 then
--			timerSleepCD:Start()
		end
	end

	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 17405 then
		if args.spellName == Domination and args:IsDestTypePlayer() then
			warningDomination:Show(args.destName)
--		elseif args.spellId == 66290 then
--			warningSleep:Show(args.destName)
		end
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 10813 then
		DBM:EndCombat(self)
	end
end
