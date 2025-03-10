local mod	= DBM:NewMod("SneedsShredder", "DBM-Party-Classic", 5)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20190810040131")
mod:SetCreatureID(642, 643)--Shredder, Sneed
--mod:SetEncounterID(1144)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 7399 6713 5141",
	"SPELL_AURA_APPLIED 7399 6713"
)

local warningFear			= mod:NewTargetNoFilterAnnounce(7399, 2)
local warningDisarm			= mod:NewTargetNoFilterAnnounce(6713, 2)
local warningEjectSneed		= mod:NewSpellAnnounce(5141, 2)

local timerFearCD			= mod:NewAITimer(180, 7399, nil, nil, nil, 3, nil, DBM_CORE_MAGIC_ICON)
local timerDisarmCD			= mod:NewAITimer(180, 6713, nil, nil, nil, 5, nil, DBM_CORE_TANK_ICON)

function mod:OnCombatStart(delay)
	timerFearCD:Start(1-delay)
end

do
	local Terrify, Disarm, EjectSneed = DBM:GetSpellInfo(7399), DBM:GetSpellInfo(6713), DBM:GetSpellInfo(5141)
	function mod:SPELL_CAST_SUCCESS(args)
		--if args.spellId == 7399 then
		if args.spellName == Terrify and args:IsSrcTypeHostile() then
			timerFearCD:Start()
		--elseif args.spellId == 6713 then
		elseif args.spellName == Disarm and args:IsSrcTypeHostile() then
			timerDisarmCD:Start()
		--elseif args.spellId == 5141 then
		elseif args.spellName == EjectSneed then
			warningEjectSneed:Show()
			timerFearCD:Stop()
			timerDisarmCD:Start(1)
		end
	end

	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 7399 and args:IsDestTypePlayer() then
		if args.spellName == Terrify and args:IsDestTypePlayer() then
			warningFear:Show(args.destName)
		--elseif args.spellId == 6713 and args:IsDestTypePlayer() then
		elseif args.spellName == Disarm and args:IsDestTypePlayer() then
			warningDisarm:Show(args.destName)
		end
	end
end
