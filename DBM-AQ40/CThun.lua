local mod	= DBM:NewMod("CThun", "DBM-AQ40", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(15589, 15727)
mod:SetEncounterID(717)
mod:SetMinSyncRevision(20200804000000)--2020, 8, 04
mod:SetUsedIcons(1)

mod:RegisterCombat("combat")
mod:SetWipeTime(25)

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 26134",
	"CHAT_MSG_MONSTER_EMOTE",
	"UNIT_DIED",
	"UNIT_HEALTH mouseover target"
)

local warnEyeTentacle		= mod:NewAnnounce("WarnEyeTentacle", 2, 126)
--local warnClawTentacle		= mod:NewAnnounce("WarnClawTentacle", 2, 26391)
--local warnGiantEyeTentacle	= mod:NewAnnounce("WarnGiantEyeTentacle", 3, 26391)
--local warnGiantClawTentacle	= mod:NewAnnounce("WarnGiantClawTentacle", 3, 26391)
local warnPhase2			= mod:NewPhaseAnnounce(2)

local specWarnDarkGlare		= mod:NewSpecialWarningDodge(26029, nil, nil, nil, 3, 2)
local specWarnWeakened		= mod:NewSpecialWarning("SpecWarnWeakened", nil, nil, nil, 2, 2, nil, 28598)
local specWarnEyeBeam		= mod:NewSpecialWarningYou(26134, nil, nil, nil, 1, 2)
local yellEyeBeam			= mod:NewYell(26134)

local timerDarkGlareCD		= mod:NewNextTimer(86, 26029)
local timerDarkGlare		= mod:NewBuffActiveTimer(37, 26029)
local timerEyeTentacle		= mod:NewTimer(45, "TimerEyeTentacle", 126, nil, nil, 1)
--local timerGiantEyeTentacle	= mod:NewTimer(60, "TimerGiantEyeTentacle", 26391, nil, nil, 1)
--local timerClawTentacle		= mod:NewTimer(11, "TimerClawTentacle", 26391, nil, nil, 1)
--local timerGiantClawTentacle = mod:NewTimer(60, "TimerGiantClawTentacle", 26391, nil, nil, 1)
local timerWeakened			= mod:NewTimer(45, "TimerWeakened", 28598)

mod:AddRangeFrameOption("10")
mod:AddSetIconOption("SetIconOnEyeBeam", 26134, true, false, {1})
local firstBossMod = DBM:GetModByName("AQ40Trash")

local COMMS = {
	CTHUN = "C",
	TENTACLES = "T",
	CREATE = "C",
	UPDATE = "U",
	REMOVE = "R",
	DELIMITER = "|"
}

local ResourceTracker = {}
ResourceTracker.__index = ResourceTracker -- failed table lookups on the instances should fallback to the class table, to get methods

function ResourceTracker.new(name, max)
	local self = setmetatable({}, ResourceTracker)
	self.name = name
	self.value = max
	self.percentage = 100
	self.max = max
	return self
end

function ResourceTracker:GetName()
	return self.name
end

function ResourceTracker:Update(value)
	self.value = value
	self.percentage = math.abs(math.floor(value/self.max))
end

function ResourceTracker:GetValue()
   return self.value
end

function ResourceTracker:GetPercentage()
	return self.percentage
 end

function ResourceTracker:CalculatePercentageChange(value)
   return self.percentage - math.abs(math.floor(value/self.max))
end

mod.vb.phase = 1
mod.vb.fleshTentacles = { trackers = {} }

local updateInfoFrame
do
	local lines = {}
	local sortedLines = {}
	local function addLine(key, value)
		-- sort by insertion order
		lines[key] = value
		sortedLines[#sortedLines + 1] = key
	end
	updateInfoFrame = function()
		table.wipe(lines)
		table.wipe(sortedLines)
		for _,v in pairs(mod.vb.fleshTentacles.trackers) do
			local line = v:GetName()..": "..tostring(v:GetPercentage()).."%"
			addLine(line, "")
		end
		return lines, sortedLines
	end
end

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

function mod:OnCombatEnd(wipe, isSecondRun)
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end

	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end

	--Only run on second run, to ensure trash mod has had enough time to update requiredBosses
	if not wipe and isSecondRun and firstBossMod.vb.firstEngageTime and firstBossMod.Options.SpeedClearTimer then
		if firstBossMod.vb.requiredBosses < 5 then
			DBM:AddMsg(L.NotValid:format(5 - firstBossMod.vb.requiredBosses .. "/4"))
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
	specWarnDarkGlare:Play("laserrun")--Or "watchstep" ?
	timerDarkGlare:Start()
	timerDarkGlareCD:Start()
	self:ScheduleMethod(86, "DarkGlare")
end

do
	local EyeBeam = DBM:GetSpellInfo(26134)
	function mod:EyeBeamTarget(targetname, uId)
		if not targetname then return end
		if targetname == UnitName("player") then
			specWarnEyeBeam:Show()
			specWarnEyeBeam:Play("targetyou")
			yellEyeBeam:Yell()
		end
		if self.Options.SetIconOnEyeBeam then
			self:SetIcon(targetname, 1, 3)
		end
	end

	function mod:SPELL_CAST_START(args)
		local spellName = args.spellName
		if spellName == EyeBeam and args:IsSrcTypeHostile() and DBM.Options.DebugMode then
			self:BossTargetScanner(args.sourceGUID, "EyeBeamTarget", 0.1, 8)
		end
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L.Weakened or msg:find(L.Weakened) then
		self:SendSync(COMMS.CTHUN..COMMS.DELIMITER..COMMS.UPDATE)
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 15589 then -- Eye of C'Thun
		self.vb.phase = 2
		warnPhase2:Show()
		timerDarkGlareCD:Stop()
		timerEyeTentacle:Stop()
		self:UnscheduleMethod("EyeTentacle")
		self:UnscheduleMethod("DarkGlare")
	elseif cid == 15802 then -- Flesh Tentacle
		local spawnUid = DBM:GetSpawnIdFromGUID(args.destGUID)
		if self.fleshTentacles.trackers[spawnUid] then
			self.fleshTentacles.trackers[spawnUid] = nil;
			-- Remove: spawnUid
			self:SendSync(COMMS.TENTACLES..COMMS.DELIMITER..COMMS.REMOVE..COMMS.DELIMITER..self:GetSpawnIdFromGUID(args.destGUID))
		end
	end
end

function mod:OnSync(msg)
	if not self:IsInCombat() then return end
	local target, event, param1, param2, param3, param4 = strsplit(COMMS.DELIMITER, msg)
	if target == COMMS.CTHUN and event == COMMS.UPDATE then
		specWarnWeakened:Show()
		specWarnWeakened:Play("targetchange")
		timerWeakened:Start()

		if self.Options.InfoFrame then
			DBM.InfoFrame:Hide()
		end

	elseif (target == COMMS.TENTACLES) then
		if (event == COMMS.CREATE) then
			-- Create: spawnUid unitName health maxHealth
			if not self.vb.fleshTentacles.trackers[param1] then
				self.vb.fleshTentacles.trackers[param1] = ResourceTracker.new(param2, param4)
				self.vb.fleshTentacles.trackers[param1]:Update(param3)
			end
		elseif (event == COMMS.UPDATE) then
			-- Update: spawnUid health
			if self.vb.fleshTentacles.trackers[param1] then
				self.vb.fleshTentacles.trackers[param1]:Update(param2)
			end
		elseif (event == COMMS.REMOVE) then
			-- Remove: spawnUid
			if self.vb.fleshTentacles.trackers[param1] then
				self.vb.fleshTentacles.trackers[param1] = nil
			end
		else
			return
		end

		if self.Options.InfoFrame then
			if not DBM.InfoFrame:IsShown() then
				DBM.InfoFrame:SetHeader(L.Stomach)
				DBM.InfoFrame:Show(2, "function", updateInfoFrame, false, false, true)
			else
				DBM.InfoFrame:Update()
			end
		end

	end
end

function mod:UNIT_HEALTH(uid)
	if not self:IsInCombat() then return end
	if self.vb.phase ~= 2 then return end

	if self:GetUnitCreatureId(uid) == 15802 then -- 15802 Flesh Tentacle
		local spawnUid = self:GetSpawnIdFromGUID(UnitGUID(uid))

		if not self.vb.fleshTentacles.trackers[spawnUid] and UnitHealth(uid) > 0 then
			local unitName = GetUnitName(uid)
			local health = UnitHealth(uid)
			local maxHealth = UnitHealthMax(uid)
			self.vb.fleshTentacles.trackers[spawnUid] = ResourceTracker.new(unitName, maxHealth)
			self.vb.fleshTentacles.trackers[spawnUid]:Update(health)
			-- Create: spawnUid unitName health maxHealth
			self:SendSync(COMMS.TENTACLES..COMMS.DELIMITER..COMMS.CREATE..COMMS.DELIMITER..spawnUid..COMMS.DELIMITER..unitName..COMMS.DELIMITER..health..COMMS.DELIMITER..maxHealth)
		end

		local current = self.vb.fleshTentacles.trackers[spawnUid]
		local step
		if current:GetPercentage() > 33 then
			step = 5
		elseif current:GetPercentage() > 10 then
			step = 3
		else
			step = 1
		end

		local health = UnitHealth(uid)
		if current:CalculatePercentageChange(health) >= step then
			current:Update(health)
			-- Update: spawnUid health
			self:SendSync(COMMS.TENTACLES..COMMS.DELIMITER..COMMS.UPDATE..COMMS.DELIMITER..spawnUid..COMMS.DELIMITER..tostring(current:GetValue()))
		end
	end
end
