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

local COMMS = {	CTHUN = "C", TENTACLES = "T", CREATE = "C", UPDATE = "U", REMOVE = "R" }

local ResourceTracker = {}
ResourceTracker.__index = ResourceTracker

function ResourceTracker.new(name, max)
	local self = setmetatable({}, ResourceTracker)
	self.name = tostring(name) or ""
	self.value = tonumber(max) or 0
	self.percentage = 100
	self.max = self.value
	return self
end

function ResourceTracker:GetName()
	return self.name
end

function ResourceTracker:Update(value)
	self.value = tonumber(value) or 0
	self.percentage = math.abs(math.floor(self.value/self.max))
end

function ResourceTracker:GetPercentage()
	return self.percentage
 end

function ResourceTracker:CalculatePercentageChange(value)
   return self.percentage - math.abs(math.floor((tonumber(value) or 0)/self.max))
end

mod.vb.phase = 1
mod.vb.fleshTentacles = {}

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
		for _,v in pairs(mod.vb.fleshTentacles) do
			addLine(v:GetName(), tostring(v:GetPercentage()).."%%")
		end
		return lines, sortedLines
	end
end

local function handleFleshTentacleSync(event, param1, param2, param3, param4)
	local spawnUid = tonumber(param1)
	if not spawnUid then return end
	if (event == COMMS.CREATE) then
		-- Create: param1:spawnUid param2:unitName param3:health param4:maxHealth
		local unitName = param2
		local health = tonumber(param3)
		local maxHealth = tonumber(param4)

		if not (unitName and health and maxHealth) then return end
		if health == 0 or maxHealth == 0 then return end
		if health > maxHealth then return end

		if not mod.vb.fleshTentacles[spawnUid] then
			mod.vb.fleshTentacles[spawnUid] = ResourceTracker.new(unitName, maxHealth)
		end
		mod.vb.fleshTentacles[spawnUid]:Update(health)
	elseif (event == COMMS.UPDATE) then
		-- Update: param1:spawnUid  param2:health
		local health = tonumber(param2)
		if not health then return end
		if mod.vb.fleshTentacles[spawnUid] then
			mod.vb.fleshTentacles[spawnUid]:Update(health)
		end
	elseif (event == COMMS.REMOVE) then
		-- Remove: param1:spawnUid
		if mod.vb.fleshTentacles[spawnUid] then
			mod.vb.fleshTentacles[spawnUid] = nil
		end
	else
		return
	end

	if mod.Options.InfoFrame then
		if not DBM.InfoFrame:IsShown() then
			DBM.InfoFrame:SetHeader(L.Stomach)
			DBM.InfoFrame:Show(2, "function", updateInfoFrame, false, false, true)
		else
			DBM.InfoFrame:Update()
		end
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
			-- the eye target can change to the correct target a tiny bit after the cast starts
			self:ScheduleMethod(0.1, "BossTargetScanner", args.sourceGUID, "EyeBeamTarget", 0.1, 3)
		end
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L.Weakened or msg:find(L.Weakened) then
		self:SendSync(COMMS.CTHUN, COMMS.UPDATE)
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
		if self.fleshTentacles[spawnUid] then
			self:SendSync(COMMS.TENTACLES, COMMS.REMOVE, spawnUid)
		end
	end
end

function mod:OnSync(target, event, param1, param2, param3, param4)
	if not self:IsInCombat() then return end
	if target == COMMS.CTHUN and event == COMMS.UPDATE then
		specWarnWeakened:Show()
		specWarnWeakened:Play("targetchange")
		timerWeakened:Start()

		mod.vb.fleshTentacles = {}
		if self.Options.InfoFrame then
			DBM.InfoFrame:Hide()
		end

	elseif (target == COMMS.TENTACLES) then
		handleFleshTentacleSync(event, param1, param2, param3, param4)
	end
end

function mod:UNIT_HEALTH(uid)
	if not self:IsInCombat() then return end
	if self.vb.phase ~= 2 then return end

	if self:GetUnitCreatureId(uid) == 15802 then -- 15802 Flesh Tentacle
		local spawnUid = self:GetSpawnIdFromGUID(UnitGUID(uid))
		if not spawnUid or spawnUid == "" then return end
		if not self.vb.fleshTentacles[spawnUid] then
			self:SendSync(COMMS.TENTACLES, COMMS.CREATE, spawnUid, GetUnitName(uid), UnitHealth(uid), UnitHealthMax(uid))
		else
			local current = self.vb.fleshTentacles[spawnUid]
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
				self:SendSync(COMMS.TENTACLES, COMMS.UPDATE, spawnUid, tostring(health))
			end
		end
	end
end
