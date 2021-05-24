local mod	= DBM:NewMod("Razorgore", "DBM-BWL", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(12435, 99999)--Bogus detection to prevent invalid kill detection if razorgore happens to die in phase 1
mod:SetEncounterID(610)--BOSS_KILL is valid, but ENCOUNTER_END is not
mod:DisableEEKillDetection()--So disable only EE
mod:SetModelID(10115)
mod:SetHotfixNoticeRev(20200904000000)--2020, September, 4th
mod:SetMinSyncRevision(20200904000000)--2020, September, 4th

mod:RegisterCombat("yell", L.YellPull)
mod:SetWipeTime(180)--guesswork

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 22425",
	"SPELL_CAST_SUCCESS 23040 19873",
	"SPELL_AURA_APPLIED 23023",
	"CHAT_MSG_MONSTER_EMOTE",
--	"CHAT_MSG_MONSTER_YELL",
	"UNIT_DIED"
)

--ability.id = 22425 and type = "begincast" or (ability.id = 23040 or ability.id = 19873) and type = "cast"
local warnPhase2			= mod:NewPhaseAnnounce(2)
local warnFireballVolley	= mod:NewCastAnnounce(22425, 3)
local warnConflagration		= mod:NewTargetNoFilterAnnounce(23023, 2)
local warnEggsLeft			= mod:NewCountAnnounce(19873, 1)

local specWarnFireballVolley= mod:NewSpecialWarningMoveTo(22425, false, nil, nil, 2, 2)

local timerAddsSpawn		= mod:NewTimer(47, "TimerAddsSpawn", 19879, nil, nil, 1)--Only for start of adds, not adds after the adds.

mod:AddSpeedClearOption("BWL", true)

mod.vb.phase = 1
mod.vb.eggsLeft = 30
mod.vb.firstEngageTime = nil

function mod:OnCombatStart(delay)
	timerAddsSpawn:Start()
	self.vb.phase = 1
	self.vb.eggsLeft = 30
	if not self.vb.firstEngageTime then
		self.vb.firstEngageTime = GetServerTime()
		if self.Options.FastestClear and self.Options.SpeedClearTimer then
			--Custom bar creation that's bound to core, not mod, so timer doesn't stop when mod stops it's own timers
			DBT:CreateBar(self.Options.FastestClear, DBM_CORE_L.SPEED_CLEAR_TIMER_TEXT, 136106)
		end
	end
end

do
	local fireballVolley = DBM:GetSpellInfo(22425)
	function mod:SPELL_CAST_START(args)
		--if args.spellId == 23023 and args:IsDestTypePlayer() then
		if args.spellName == fireballVolley  then
			if self.Options.SpecWarn22425moveto then
				specWarnFireballVolley:Show(DBM_CORE_L.BREAK_LOS)
				specWarnFireballVolley:Play("findshelter")
			else
				warnFireballVolley:Show()
			end
		end
	end
end

do
	local warmingFlames, destroyEgg = DBM:GetSpellInfo(23040), DBM:GetSpellInfo(19873)
	function mod:SPELL_CAST_SUCCESS(args)
		--if args.spellId == 23023 and args:IsDestTypePlayer() then
		if args.spellName == warmingFlames and self.vb.phase < 2 then
			warnPhase2:Show()
			self.vb.phase = 2
		--This may not be accurate, it depends on how large expanded combat log range is
		--elseif args.spellId == 19873 then
		elseif args.spellName == destroyEgg then
			self.vb.eggsLeft = self.vb.eggsLeft - 1
			warnEggsLeft:Show(string.format("%d/%d",30-self.vb.eggsLeft,30))
		end
	end
end

do
	local Conflagration = DBM:GetSpellInfo(23023)
	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 23023 and args:IsDestTypePlayer() then
		if args.spellName == Conflagration and args:IsDestTypePlayer() then
			warnConflagration:CombinedShow(0.3, args.destName)
		end
	end
end

--For some reason this no longer works
function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if (msg == L.Phase2Emote or msg:find(L.Phase2Emote)) and self.vb.phase < 2 then
		self:SendSync("Phase2")
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 12435 then--Only trigger kill for unit_died if he dies in phase 2 with everyone alive, otherwise it's an auto wipe.
		if DBM:NumRealAlivePlayers() > 0 and self.vb.phase == 2 then
			DBM:EndCombat(self)
		else
			DBM:EndCombat(self, true)--Pass wipe arg end combat
		end
	end
end

function mod:OnSync(msg, name)
	if msg == "Phase2" and self.vb.phase < 2 then
		warnPhase2:Show()
		self.vb.phase = 2
	end
end
