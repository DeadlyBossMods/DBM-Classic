local mod	= DBM:NewMod("Faerlina", "DBM-Naxx", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(15953)
mod:SetEncounterID(1110)
mod:SetModelID(15940)
mod:RegisterCombat("combat_yell", L.Pull)

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 28798 28732 28794",--54100, 54097, 54099
	"UNIT_DIED"
)

local warnEmbraceActive		= mod:NewSpellAnnounce(28732, 1)
local warnEmbraceExpire		= mod:NewAnnounce("WarningEmbraceExpire", 2, 28732)
local warnEmbraceExpired	= mod:NewAnnounce("WarningEmbraceExpired", 3, 28732)
local warnEnrageSoon		= mod:NewSoonAnnounce(28131, 3)
local warnEnrageNow			= mod:NewSpellAnnounce(28131, 4)

local specWarnEnrage		= mod:NewSpecialWarningDefensive(28131, nil, nil, nil, 3, 2)
local specWarnGTFO			= mod:NewSpecialWarningGTFO(28794, nil, nil, nil, 1, 8)

local timerEmbrace			= mod:NewBuffActiveTimer(30, 28732, nil, nil, nil, 6)
local timerEnrage			= mod:NewCDTimer(56, 28131, nil, nil, nil, 6)-- 56-76

mod.vb.enraged = false

function mod:OnCombatStart(delay)
	timerEnrage:Start(-delay)
	warnEnrageSoon:Schedule(55 - delay)
	self.vb.enraged = false
end

do
	local Frenzy, Embrace, RainofFire = DBM:GetSpellInfo(28798), DBM:GetSpellInfo(28732), DBM:GetSpellInfo(28794)
	function mod:SPELL_AURA_APPLIED(args)
		--if args:IsSpellID(28798, 54100) then -- Frenzy
		if args.spellName == Frenzy and args:IsDestTypeHostile() then -- Frenzy
			warnEnrageNow:Show()
			self.vb.enraged = true
			--if self:IsTanking("player", "boss1", nil, true) then
			if self:IsTanking("player", nil, nil, nil, args.destGUID) then--Basically, HAS to be bosses current target
				specWarnEnrage:Show()
				specWarnEnrage:Play("defensive")
			else
				warnEnrageNow:Show()
			end
		--elseif args:IsSpellID(28732, 54097) and args:GetDestCreatureID() == 15953 and self:AntiSpam(5) then
		elseif args.spellName == Embrace and args:GetDestCreatureID() == 15953 and self:AntiSpam(5) then
			warnEmbraceExpire:Cancel()
			warnEmbraceExpired:Cancel()
			warnEnrageSoon:Cancel()
			timerEnrage:Stop()
			if self.vb.enraged then
				timerEnrage:Start()
				warnEnrageSoon:Schedule(45)
			end
			timerEmbrace:Start()
			warnEmbraceActive:Show()
			warnEmbraceExpire:Schedule(25)
			warnEmbraceExpired:Schedule(30)
			self.vb.enraged = false
		--elseif args:IsSpellID(28794, 54099) and args:IsPlayer() then--Rain of Fire
		elseif args.spellName == RainofFire and args:IsPlayer() then--Rain of Fire
			specWarnGTFO:Show(args.spellName)
			specWarnGTFO:Play("watchfeet")
		end
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 15953 then
		warnEnrageSoon:Cancel()
		warnEmbraceExpire:Cancel()
		warnEmbraceExpired:Cancel()
	end
end
