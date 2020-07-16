local mod	= DBM:NewMod("CThun", "DBM-AQ40", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(15589, 15727)
mod:SetEncounterID(717)
mod:RegisterCombat("combat")
mod:SetWipeTime(25)

mod:RegisterEventsInCombat(
	"CHAT_MSG_MONSTER_EMOTE",
	"UNIT_DIED"
)

local warnEyeTentacle		= mod:NewAnnounce("WarnEyeTentacle", 2)
--local warnClawTentacle		= mod:NewAnnounce("WarnClawTentacle", 2)
--local warnGiantEyeTentacle	= mod:NewAnnounce("WarnGiantEyeTentacle", 3)
--local warnGiantClawTentacle	= mod:NewAnnounce("WarnGiantClawTentacle", 3)
local warnPhase2			= mod:NewPhaseAnnounce(2)

local specWarnDarkGlare		= mod:NewSpecialWarningSpell(26029, nil, nil, nil, 3)--Dodge?
local specWarnWeakened		= mod:NewSpecialWarning("SpecWarnWeakened", nil, nil, nil, 2)

local timerDarkGlareCD		= mod:NewNextTimer(86, 26029)
local timerDarkGlare		= mod:NewBuffActiveTimer(39, 26029)
local timerEyeTentacle		= mod:NewTimer(45, "TimerEyeTentacle", nil, nil, nil, 1)
--local timerGiantEyeTentacle	= mod:NewTimer(60, "TimerGiantEyeTentacle", nil, nil, nil, 1)
--local timerClawTentacle		= mod:NewTimer(11, "TimerClawTentacle", nil, nil, nil, 1)
--local timerGiantClawTentacle = mod:NewTimer(60, "TimerGiantClawTentacle", nil, nil, nil, 1)
local timerWeakened			= mod:NewTimer(45, "TimerWeakened")

mod:AddRangeFrameOption("10")

mod.vb.phase = 1
local firstBossMod = DBM:GetModByName("AQ40Trash")

function mod:OnCombatStart(delay)
	self.vb.phase = 1
	--timerClawTentacle:Start(-delay)
	timerEyeTentacle:Start(45-delay)
	timerDarkGlareCD:Start(48-delay)
	self:ScheduleMethod(45-delay, "EyeTentacle")
	self:ScheduleMethod(48-delay, "DarkGlare")
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(10)
	end
end

function mod:OnCombatEnd(wipe)
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if not wipe then
		DBM.Bars:CancelBar(DBM_CORE_L.SPEED_CLEAR_TIMER_TEXT)
		if firstBossMod.vb.firstEngageTime then
			local thisTime = GetServerTime() - firstBossMod.vb.firstEngageTime
			if thisTime and thisTime > 0 then
				--Not an eligable speed run, since all 3 optional bosses weren't defeated
				if not firstBossMod.vb.OuroDefeated or not firstBossMod.vb.ViscidusDefeated or not firstBossMod.vb.RoyaltyDefeated then
					DBM:AddMsg(L.NotValid:format(DBM:strFromTime(thisTime)))
				elseif not firstBossMod.Options.FastestClear then
					--First clear, just show current clear time
					DBM:AddMsg(DBM_CORE_L.RAID_DOWN:format("AQ40", DBM:strFromTime(thisTime)))
					firstBossMod.Options.FastestClear = thisTime
				elseif (firstBossMod.Options.FastestClear > thisTime) then
					--Update record time if this clear shorter than current saved record time and show users new time, compared to old time
					DBM:AddMsg(DBM_CORE_L.RAID_DOWN_NR:format("AQ40", DBM:strFromTime(thisTime), DBM:strFromTime(firstBossMod.Options.FastestClear)))
					firstBossMod.Options.FastestClear = thisTime
				else
					--Just show this clear time, and current record time (that you did NOT beat)
					DBM:AddMsg(DBM_CORE_L.RAID_DOWN_L:format("AQ40", DBM:strFromTime(thisTime), DBM:strFromTime(firstBossMod.Options.FastestClear)))
				end
			end
			firstBossMod.vb.firstEngageTime = nil
		end
	end
end

function mod:EyeTentacle()
	warnEyeTentacle:Show()
	timerEyeTentacle:Start()
	self:ScheduleMethod(45, "EyeTentacle")
end

function mod:DarkGlare()
	specWarnDarkGlare:Show()
	timerDarkGlare:Start()
	timerDarkGlareCD:Start()
	self:ScheduleMethod(86, "DarkGlare")
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg:find(L.Weakened) then
		specWarnWeakened:Show()
		timerWeakened:Start()
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 15589 then
		self.vb.phase = 2
		warnPhase2:Show()
		self:UnscheduleMethod("EyeTentacle")
		self:UnscheduleMethod("DarkGlare")
	end
end
