local mod	= DBM:NewMod("MinerJohnson", "DBM-Party-Classic", 5)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20190810040131")
mod:SetCreatureID(3586)
--mod:SetEncounterID(1144)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 12097",
	"SPELL_AURA_APPLIED 12097"
)

local warningPierceArmor			= mod:NewTargetNoFilterAnnounce(12097, 2)

local timerPierceArmorCD			= mod:NewAITimer(180, 12097, nil, nil, nil, 5, nil, DBM_CORE_TANK_ICON)

function mod:OnCombatStart(delay)
	timerPierceArmorCD:Start(1-delay)
end

do
	local PierceArmor = DBM:GetSpellInfo(12097)
	function mod:SPELL_CAST_SUCCESS(args)
		--if args.spellId == 12097 then
		if args.spellName == PierceArmor then
			timerPierceArmorCD:Start()
		end
	end

	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 12097 then
		if args.spellName == PierceArmor then
			warningPierceArmor:Show(args.destName)
		end
	end
end
