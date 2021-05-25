local mod = DBM:NewMod("Bloodlord", "DBM-ZG", 1)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))

mod:SetCreatureID(11382, 14988)
mod:SetEncounterID(787)
mod:SetHotfixNoticeRev(20200418000000)--2020, 04, 18

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 24314 24318 16856",
	"CHAT_MSG_MONSTER_YELL"
)

--TODO, actual timer for abilities. Tank swap for mortal?
local warnFrenzy	= mod:NewSpellAnnounce(24318, 3, nil, "Tank|Healer", 2)
local warnGaze		= mod:NewTargetNoFilterAnnounce(24314, 4)
local warnMortal	= mod:NewTargetNoFilterAnnounce(16856, 2, nil, "Tank|Healer", 2)

local specWarnGaze	= mod:NewSpecialWarningCast(24314, nil, nil, nil, 3, 2)

local timerGaze 	= mod:NewTargetTimer(6, 24314, nil, nil, nil, 3)
local timerMortal	= mod:NewTargetTimer(5, 16856, nil, "Tank|Healer", 2, 5, nil, DBM_CORE_L.TANK_ICON)

do
	local ThreateningGaze, Frenzy, MortalStrike = DBM:GetSpellInfo(24314), DBM:GetSpellInfo(24318), DBM:GetSpellInfo(16856)
	function mod:SPELL_AURA_APPLIED(args)
		--if args:IsSpellID(24314) then
		if args.spellName == ThreateningGaze then
			timerGaze:Start(args.destName)
			if self:AntiSpam(3, args.destName) then
				if args:IsPlayer() then
					specWarnGaze:Show()
					specWarnGaze:Play("stopcast")
				else
					warnGaze:Show(args.destName)
				end
			end
		--elseif args:IsSpellID(24318) then
		elseif args.spellName == Frenzy and args:IsDestTypeHostile() then
			warnFrenzy:Show(args.destName)
		--elseif args:IsSpellID(16856) and args:IsDestTypePlayer() then
		elseif args.spellName == MortalStrike and args:IsDestTypePlayer() then
			warnMortal:Show(args.destName)
			timerMortal:Start(args.destName)
		end
	end
end

--Yell gives target 1.5-2 seconds faster than combat log, so we attempt to parse it first
--Combat log is used as fallback and to start the duration timer
function mod:CHAT_MSG_MONSTER_YELL(msg, mob, _, _, targetName)
	if msg:find(L.GazeYell) and targetName then
		if self:AntiSpam(3, targetName) then
			if targetName == UnitName("player") then
				specWarnGaze:Show()
				specWarnGaze:Play("stopcast")
			else
				warnGaze:Show(targetName)
			end
		end
	end
end
