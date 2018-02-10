local mod	= DBM:NewMod("Deathbringer", "DBM-Icecrown", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 1799 $"):sub(12, -3))
mod:SetCreatureID(37813)
mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"UNIT_HEALTH"
)

local isRanged = select(2, UnitClass("player")) == "MAGE"
              or select(2, UnitClass("player")) == "HUNTER"
              or select(2, UnitClass("player")) == "WARLOCK"

local warnFrenzySoon		= mod:NewAnnounce("warnFrenzySoon", 2, 72737)
local warnFrenzy			= mod:NewSpellAnnounce(72737)
local warnBloodNova			= mod:NewSpellAnnounce(73058)
local warnMark				= mod:NewTargetAnnounce(72444)
local warnBoilingBlood		= mod:NewTargetAnnounce(72441)
local warnRuneofBlood		= mod:NewTargetAnnounce(72410)
local timerRuneofBlood		= mod:NewTargetTimer(30, 72410)
local timerBoilingBlood		= mod:NewBuffActiveTimer(24, 72441)
local timerBloodNova		= mod:NewCDTimer(20, 73058)--20-25sec cooldown?
local timerCallBloodBeast	= mod:NewNextTimer(30, 72173)

mod:AddBoolOption("RangeFrame", isRanged)

local warned_preFrenzy = false
local boilingTargets = {}

local function warnBoilingTargets()
	warnBoilingBlood:Show(table.concat(boilingTargets, "<, >"))
	table.wipe(boilingTargets)
	timerBoilingBlood:Start()
end

function mod:OnCombatStart(delay)
	table.wipe(boilingTargets)
	timerCallBloodBeast:Start(-delay)
	timerNextMark:Start(50-delay)
	timerBloodNova:Start(-delay)
	warned_preFrenzy = false
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(15)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(73058, 72378) then	-- Blood Nova (only 2 cast IDs, 4 spell damage IDs, and one dummy)
		warnBloodNova:Show()
		timerBloodNova:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(72173, 72356, 72357, 72358) then
		timerCallBloodBeast:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(72255, 72444, 72445, 72446) then		-- Mark of the Fallen Champion
		warnMark:Show(args.destName)
	elseif args:IsSpellID(72385, 72441, 72442, 72443) then	-- Boiling Blood
		boilingTargets[#boilingTargets + 1] = args.destName
		self:Unschedule(warnBoilingTargets)
		if not mod:IsDifficulty("heroic25") or #boilingTargets >= 3 then	-- only on 25man heroic = 3 targets?
			warnBoilingTargets()
		else
			self:Schedule(0.3, warnBoilingTargets)
		end
	elseif args:IsSpellID(72410) then						-- Rune of Blood
		warnRuneofBlood:Show(args.destName)
		timerRuneofBlood:Start(args.destName)
	elseif args:IsSpellID(72737) then						-- Frenzy
		warnFrenzy:Show()
	end
end

function mod:UNIT_HEALTH(uId)
	if not warned_preFrenzy and self:GetUnitCreatureId(uId) == 37813 and UnitHealth(uId) / UnitHealthMax(uId) <= 0.33 then
		warned_preFrenzy = true
		warnFrenzySoon:Show()	
	end
end