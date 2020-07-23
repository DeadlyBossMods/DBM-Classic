local mod	= DBM:NewMod("AQ40Trash", "DBM-AQ40", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetModelID(15347)-- Anubisath Sentinel
mod:SetZone()
mod:SetMinSyncRevision(20200710000000)--2020, 7, 10

mod.isTrashMod = true

mod:RegisterEvents(
	"ENCOUNTER_END",
	"SPELL_AURA_APPLIED 22997",
	"SPELL_AURA_REMOVED 22997",
	"SPELL_MISSED"
)

mod:AddRangeFrameOption(10, 22997)

--TODO, meteor those big guys use, maybe some other stuff
--local specWarnPrimalRampage			= mod:NewSpecialWarningDodge(198379, "Melee", nil, nil, 1, 2)

mod:AddSpeedClearOption("AQ40", true)

--Speed Clear variables
mod.vb.firstEngageTime = nil
mod.vb.OuroDefeated = false
mod.vb.ViscidusDefeated = false
mod.vb.RoyaltyDefeated = false

--Register all damage events on mod load
local eventsRegistered = true
mod:RegisterShortTermEvents(
	"SPELL_DAMAGE",
	"SWING_DAMAGE",
	"SWING_MISSED",
	"SPELL_PERIODIC_DAMAGE",
	"SPELL_PERIODIC_MISSED"
)

--Request speed clear variables, in case it was already started before mod loaded
mod:SendSync("IsAQ40Started")

do
	local startCreatureIds = {
		[15264] = true--Anubisath Sentinel
	}
	local function checkFirstPull(self, GUID)
		local cid = self:GetCIDFromGUID(GUID)
		if startCreatureIds[cid] then
			if not self.vb.firstEngageTime then
				self.vb.firstEngageTime = GetServerTime()
				if self.Options.FastestClear and self.Options.SpeedClearTimer then
					--Custom bar creation that's bound to core, not mod, so timer doesn't stop when mod stops it's own timers
					DBM.Bars:CreateBar(self.Options.FastestClear, DBM_CORE_L.SPEED_CLEAR_TIMER_TEXT, "136106")
				end
				self:SendSync("AQ40Started", self.vb.firstEngageTime)--Also sync engage time
			end
			--Unregister high CPU combat log events
			self:UnregisterShortTermEvents()
			eventsRegistered = false
		end
	end

	function mod:SPELL_DAMAGE(_, _, _, _, destGUID)
		checkFirstPull(self, destGUID or 0)
	end

	function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID)
		checkFirstPull(self, destGUID or 0)
	end
	mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

	function mod:SWING_DAMAGE(_, _, _, _, destGUID)
		checkFirstPull(self, destGUID or 0)
	end
	mod.SWING_MISSED = mod.SWING_DAMAGE

	function mod:OnSync(msg, startTime, sender)
		--Sync recieved with start time and ours is currently not started
		--The reason this doesn't just check self.vb.firstEngageTime is nil, because it might not be if SendVariableInfo send it first
		if msg == "AQ40Started" and startTime and not DBM.Bars:GetBar(DBM_CORE_L.SPEED_CLEAR_TIMER_TEXT) then
			if not self.vb.firstEngageTime then
				self.vb.firstEngageTime = tonumber(startTime)
			end
			if self.Options.FastestClear and self.Options.SpeedClearTimer then
				--Custom bar creation that's bound to core, not mod, so timer doesn't stop when mod stops it's own timers
				local adjustment = GetServerTime() - self.vb.firstEngageTime
				DBM.Bars:CreateBar(self.Options.FastestClear - adjustment, DBM_CORE_L.SPEED_CLEAR_TIMER_TEXT)
			end
			--Unregister high CPU combat log events
			self:UnregisterShortTermEvents()
		elseif msg == "IsAQ40Started" and self.vb.firstEngageTime then
			--Sadly this has to be done with two syncs, one for variables for bosses that have been killed and one to instruct starting of timer
			self:SendSync("AQ40Started", self.vb.firstEngageTime)
			--Send all variables from the mod.vb table in whisper comm to requester (and not sent to whole raid)
			--This is sadly still going to generate a LOT of comm traffic on zone in. upwards of 4-117 syncs, per player zone in
			--Reviewing code, it's hard to do this in less comms, it's either don't support recovering the speed clear timer in all situations (disconnect, reloadui, zoning in late) or cause a burst of syncs :\
			DBM:SendVariableInfo(self, sender)
		end
	end
end

function mod:ENCOUNTER_END(encounterID, _, _, _, success)
	if success == 0 then return end--wipe
	if encounterID == 716 then
		self.vb.OuroDefeated = true
	elseif encounterID == 713 then
		self.vb.ViscidusDefeated = true
	elseif encounterID == 710 then
		self.vb.RoyaltyDefeated = true
	end
end

do-- Anubisath Plague - keep in sync - AQ40/AQ40Trash.lua AQ20/AQ20Trash.lua
	local warnPlague                    = mod:NewTargetAnnounce(22997, 2)--Not excempt from filter since it could be spammy
	local specWarnPlague                = mod:NewSpecialWarningMoveAway(22997, nil, nil, nil, 1, 2)
	local yellPlague                    = mod:NewYell(22997)

	local Plague = DBM:GetSpellInfo(22997)

	-- aura applied didn't seem to catch the reflects and other buffs
	function mod:SPELL_AURA_APPLIED(args)
		if args.spellName == Plague then
			if args:IsPlayer() then
				specWarnPlague:Show()
				specWarnPlague:Play("runout")
				yellPlague:Yell()
				if self.Options.RangeFrame then
					DBM.RangeCheck:Show(10)
				end
			else
				warnPlague:Show(args.destName)
			end
		end
	end

	function mod:SPELL_AURA_REMOVED(args)
		if args.spellName == Plague then
			if args:IsPlayer() and self.Options.RangeFrame then
				DBM.RangeCheck:Hide()
			end
		end
	end
end

do-- Anubisath Reflect - keep in sync - AQ40/AQ40Trash.lua AQ20/AQ20Trash.lua
	local ShadowFrostReflect 			= DBM:GetSpellInfo(19595)
	local FireArcaneReflect 			= DBM:GetSpellInfo(13022)
	local specWarnShadowFrostReflect    = mod:NewSpecialWarningReflect(19595)
	local specWarnFireArcaneReflect     = mod:NewSpecialWarningReflect(13022)

	-- todo: thorns, shadow storm

	local playerGUID = UnitGUID("player")
	function mod:SPELL_MISSED(sourceGUID, _, _, _, destGUID, destName, _, _, _, _, spellSchool, missType)
		if (missType == "REFLECT" or missType == "DEFLECT") and sourceGUID == playerGUID then
			if spellSchool == 32 or spellSchool == 16 then
				specWarnShadowFrostReflect:Show(destName)
			elseif spellSchool == 4 or spellSchool == 64 then
				specWarnFireArcaneReflect:Show(destName)
			end
		end
		if eventsRegistered then-- for AQ40 timer
			self:SPELL_DAMAGE(nil, nil, nil, nil, destGUID)
		end
	end
end
