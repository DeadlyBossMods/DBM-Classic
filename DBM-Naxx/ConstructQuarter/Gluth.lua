local mod	= DBM:NewMod("Gluth", "DBM-Naxx", 2)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(15932)
mod:SetEncounterID(1108)
mod:SetModelID(16064)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 28371",
	"SPELL_AURA_REMOVED 28371",
	"SPELL_DAMAGE 28375"
)

--TODO, is it really nessesarly to use SPELL_DAMAGE here?
local warnEnrage		= mod:NewTargetNoFilterAnnounce(19451, 3, nil , "Healer|Tank|RemoveEnrage", 2)
--local warnDecimateSoon	= mod:NewSoonAnnounce(28374, 2)
local warnDecimateNow	= mod:NewSpellAnnounce(28374, 3)

local specWarnEnrage	= mod:NewSpecialWarningDispel(19451, "RemoveEnrage", nil, nil, 1, 6)

local timerEnrage		= mod:NewBuffActiveTimer(8, 19451, nil, nil, nil, 5, nil, DBM_CORE_L.ENRAGE_ICON)
--local timerDecimate		= mod:NewCDTimer(120, 28374, nil, nil, nil, 2)--120-182
local enrageTimer		= mod:NewBerserkTimer(420)

function mod:OnCombatStart(delay)
	enrageTimer:Start(420 - delay)
--	timerDecimate:Start(110 - delay)
--	warnDecimateSoon:Schedule(100 - delay)
end

do
	local Enrage = DBM:GetSpellInfo(28371)
	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 28371 then
		if args.spellName == Enrage and args:IsDestTypeHostile() then
			if self.Options.SpecWarn19451dispel then
				specWarnEnrage:Show(args.destName)
				specWarnEnrage:Play("enrage")
			else
				warnEnrage:Show(args.destName)
			end
			timerEnrage:Start()
		end
	end

	function mod:SPELL_AURA_REMOVED(args)
		--if args.spellId == 28371 then
		if args.spellName == Enrage and args:IsDestTypeHostile() then
			timerEnrage:Stop()
		end
	end
end

do
	local Decimate = DBM:GetSpellInfo(28375)
	function mod:SPELL_DAMAGE(_, _, _, _, _, _, _, _, spellId, spellName)
		--if spellId == 28375 and self:AntiSpam(20) then
		if spellName == Decimate and self:AntiSpam(20) then
			warnDecimateNow:Show()
--			timerDecimate:Start()
--			warnDecimateSoon:Schedule(96)
		end
	end
end
