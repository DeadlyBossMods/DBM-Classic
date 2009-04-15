local mod = DBM:NewMod("Ignis", "DBM-Ulduar")
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(33118)
mod:SetZone()

-- disclaimer: we never did this boss on the PTR, this boss mod is based on combat logs and movies. This boss mod might be completely wrong or broken, we will replace it with an updated version asap


mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED"
)

local warnFlameJetsCast			= mod:NewSpecialWarning("SpecWarnJetsCast")	-- spell interrupt (according to the tooltip)
local timerFlameJetsCast		= mod:NewTimer(2.7, "TimerFlameJetsCast", 63472)
local timerFlameJetsCooldown		= mod:NewTimer(35, "TimerFlameJetsCooldown", 63472)

local timerScorchCooldown		= mod:NewTimer(25, "TimerScorch", 63473)
local timerScorchCast			= mod:NewTimer(3, "TimerScorchCast", 63473)

local announceSlagPot			= mod:NewAnnounce("WarningSlagPot", 3, 63477)
local timerSlagPot			= mod:NewTimer(10, "TimerSlagPot", 63477)

function mod:OnCombatStart(delay)
	timerScorchCooldown:Start(10-delay)
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 63472 then		-- Flame Jets
		timerFlameJetsCast:Start()
		warnFlameJetsCast:Show()
		timerFlameJetsCooldown:Start()

	elseif args.spellId == 63473 then	-- Scorch
		timerScorchCast:Start()
		timerScorchCooldown:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 63477 then		-- Slag Pot
		announceSlagPot:Show(args.destName)
		timerSlagPot:Start(args.destName)
	end
end


