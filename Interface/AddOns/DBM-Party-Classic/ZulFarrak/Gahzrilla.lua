local mod	= DBM:NewMod(483, "DBM-Party-Classic", 20, 241)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20190813032603")
mod:SetCreatureID(7273)
mod:SetEncounterID(594)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 11836",
	"SPELL_CAST_SUCCESS 11902",
	"SPELL_AURA_APPLIED 11836"
)

--TODO, no indication she actually has a heal, only lightning bolt and throns
local warningFreezeSolid			= mod:NewTargetNoFilterAnnounce(11836, 2)
local warningSlam					= mod:NewSpellAnnounce(11902, 2)

local timerFreezeSolidCD			= mod:NewAITimer(180, 11836, nil, nil, nil, 3, nil, DBM_CORE_MAGIC_ICON)
local timerSlamCD					= mod:NewAITimer(180, 11902, nil, nil, nil, 2)

function mod:OnCombatStart(delay)
	timerFreezeSolidCD:Start(1-delay)
	timerSlamCD:Start(1-delay)
end

do
	local FreezeSolid = DBM:GetSpellInfo(11836)
	function mod:SPELL_CAST_START(args)
		--if args.spellId == 11836 then
		if args.spellName == FreezeSolid and args:IsSrcTypeHostile() then
			timerFreezeSolidCD:Start()
		end
	end

	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 11836 then
		if args.spellName == FreezeSolid and args:IsDestTypePlayer() then
			warningFreezeSolid:Show(args.destName)
		end
	end
end

do
	local Slam = DBM:GetSpellInfo(11902)
	function mod:SPELL_CAST_SUCCESS(args)
		--if args.spellId == 11902 then
		if args.spellName == Slam and args:IsSrcTypeHostile() then
			warningSlam:Show()
			timerSlamCD:Start()
		end
	end
end
