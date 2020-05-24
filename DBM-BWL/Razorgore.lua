local mod	= DBM:NewMod("Razorgore", "DBM-BWL", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(12435, 99999)--Bogus detection to prevent invalid kill detection if razorgore happens to die in phase 1
mod:SetEncounterID(610)--BOSS_KILL is valid, but ENCOUNTER_END is not
mod:DisableEEKillDetection()--So disable only EE
mod:SetModelID(10115)
mod:SetHotfixNoticeRev(20200320000000)--2020, March, 20th
mod:SetMinSyncRevision(20200320000000)--2020, March, 20th

mod:RegisterCombat("yell", L.YellPull)
mod:SetWipeTime(180)--guesswork

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 22425",
	"SPELL_CAST_SUCCESS 23040 19873",
	"SPELL_AURA_APPLIED 23023",
	"CHAT_MSG_MONSTER_EMOTE",
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
		self.vb.firstEngageTime = GetTime()
		if self.Options.FastestClear and self.Options.SpeedClearTimer then
			--Custom bar creation that's bound to core, not mod, so timer doesn't stop when mod stops it's own timers
			DBM.Bars:CreateBar(self.Options.FastestClear, DBM_SPEED_CLEAR_TIMER_TEXT)
		end
	end
end

function mod:OnCombatEnd()
	DBM:AddMsg("Reason egg counter is off a little, is because blizzard gutted combat log range. Capturing their destruction is not accurate via combat log without heavy syncing which is then also prone to errors with lag that causes eggs to be counted twice sometimes. TL/DR, egg counter is approx at best unless blizzard reverts combat log nerf in instances")
end

do
	local fireballVolley = DBM:GetSpellInfo(22425)
	function mod:SPELL_CAST_START(args)
		--if args.spellId == 23023 and args:IsDestTypePlayer() then
		if args.spellName == fireballVolley  then
			if self:AntiSpam(5, "fireballVolley") then
				self:SendSync("fireballVolley", args.destName)
			end
			if self:AntiSpam(8, 1) then
				if self.Options.SpecWarn22425moveto then
					specWarnFireballVolley:Show(DBM_CORE_BREAK_LOS)
					specWarnFireballVolley:Play("findshelter")
				else
					warnFireballVolley:Show()
				end
			end
		end
	end
end

do
	function mod:SPELL_CAST_SUCCESS(args)
		if args.spellId == 23040 and self.vb.phase < 2 then
			self:SendSync("Phase2")
		elseif args.spellId == 19873 then
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
			self:SendSync("Conflag", args.destName)
			if self:AntiSpam(8, args.destName) then
				warnConflagration:CombinedShow(0.3, args.destName)
			end
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
	if cid == 12435 then--Only trigger kill for unit_died if he dies in phase 2, otherwise it's an auto wipe.
		if self.vb.phase == 2 then
			self:SendSync("Win")
			DBM:EndCombat(self)
		else
			DBM:EndCombat(self, true)--Pass wipe arg end combat
		end
	end
end

function mod:OnSync(msg, name)
	if self:AntiSpam(5, msg) then
		--Do nothing, this is just an antispam threshold for syncing
	end
	if msg == "Phase2" and self.vb.phase < 2 then
		warnPhase2:Show()
		self.vb.phase = 2
	elseif msg == "Conflag" and name and self:AntiSpam(8, name) then
		warnConflagration:Show(name)
	elseif msg == "Win" then
		DBM:EndCombat(self)
	elseif msg == "fireballVolley" and self:AntiSpam(8, 1) then
		if self.Options.SpecWarn22425moveto then
			specWarnFireballVolley:Show(DBM_CORE_BREAK_LOS)
			specWarnFireballVolley:Play("findshelter")
		else
			warnFireballVolley:Show()
		end
	end
end
