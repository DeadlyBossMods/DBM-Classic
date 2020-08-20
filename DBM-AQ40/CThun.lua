local mod	= DBM:NewMod("CThun", "DBM-AQ40", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(15589, 15727)
mod:SetEncounterID(717)
mod:SetHotfixNoticeRev(20200817000000)--2020, 8, 17
mod:SetMinSyncRevision(20200817000000)--2020, 8, 17
mod:SetUsedIcons(1)

mod:RegisterCombat("combat")
mod:SetWipeTime(25)

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 26134",
	"SPELL_CAST_SUCCESS 26586",
	"CHAT_MSG_MONSTER_EMOTE",
	"UNIT_DIED",
	"UNIT_HEALTH mouseover target"
)

local warnEyeTentacle			= mod:NewAnnounce("WarnEyeTentacle", 2, 126)
local warnClawTentacle			= mod:NewAnnounce("WarnClawTentacle", 2, 26391)
local warnGiantEyeTentacle		= mod:NewAnnounce("WarnGiantEyeTentacle", 3, 126)
local warnGiantClawTentacle		= mod:NewAnnounce("WarnGiantClawTentacle", 3, 26391)
local warnPhase2				= mod:NewPhaseAnnounce(2)

local specWarnDarkGlare			= mod:NewSpecialWarningDodge(26029, nil, nil, nil, 3, 2)
local specWarnWeakened			= mod:NewSpecialWarning("SpecWarnWeakened", nil, nil, nil, 2, 2, nil, 28598)
local specWarnEyeBeam			= mod:NewSpecialWarningYou(26134, nil, nil, nil, 1, 2)
local yellEyeBeam				= mod:NewYell(26134)

local timerDarkGlareCD			= mod:NewNextTimer(86, 26029)
local timerDarkGlare			= mod:NewBuffActiveTimer(37, 26029)
local timerEyeTentacle			= mod:NewTimer(45, "TimerEyeTentacle", 126, nil, nil, 1)
local timerGiantEyeTentacle		= mod:NewTimer(60, "TimerGiantEyeTentacle", 126, nil, nil, 1)
local timerClawTentacle			= mod:NewTimer(8, "TimerClawTentacle", 26391, nil, nil, 1) -- every 8 seconds
local timerGiantClawTentacle	= mod:NewTimer(60, "TimerGiantClawTentacle", 26391, nil, nil, 1)
local timerWeakened				= mod:NewTimer(45, "TimerWeakened", 28598)

mod:AddRangeFrameOption("10")
mod:AddSetIconOption("SetIconOnEyeBeam", 26134, true, false, {1})
mod:AddInfoFrameOption(nil, true)

local firstBossMod = DBM:GetModByName("AQ40Trash")

local COMMS = {	CTHUN = "C", TENTACLES = "T", CREATE = "C", UPDATE = "U", REMOVE = "R" }

mod.vb.phase = 1
local fleshTentacles = {}

function mod:OnCombatStart(delay)
	self.vb.phase = 1
	table.wipe(fleshTentacles)
	timerClawTentacle:Start(9-delay) -- Combatlog told me, the first Claw Tentacle spawn in 00:00:09, but need more test.
	timerEyeTentacle:Start(45-delay)
	timerDarkGlareCD:Start(48-delay)
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

do
	local Birth = DBM:GetSpellInfo(26586)
	function mod:SPELL_CAST_SUCCESS(args)
		local spellName = args.spellName
		if spellName == Birth then
			 local cid = self:GetCIDFromGUID(args.sourceGUID)
			 if self:AntiSpam(5, cid) then--Throttle multiple spawn within 5 seconds
				if cid == 15726 then--Eye Tentacle
					timerEyeTentacle:Stop()
					warnEyeTentacle:Show()
					timerEyeTentacle:Start(self.vb.phase == 2 and 30 or 45)
				elseif cid == 15725 then -- Claw Tentacle
					timerClawTentacle:Stop()
					warnClawTentacle:Show()
					timerClawTentacle:Start()
				elseif cid == 15334 then -- Giant Eye Tentacle
					timerGiantEyeTentacle:Stop()
					warnGiantEyeTentacle:Show()
					timerGiantEyeTentacle:Start()
				elseif cid == 15728 then -- Giant Claw Tentacle
					timerGiantClawTentacle:Stop()
					warnGiantClawTentacle:Show()
					timerGiantClawTentacle:Start()
				end
			end
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
		timerClawTentacle:Stop() -- Claw Tentacle never respawns in phase2
		timerEyeTentacle:Start(40)
		timerGiantClawTentacle:Start(10) -- Start Giant Claw Tentacle Spawn Timer, After Entering Phase 2
		timerGiantEyeTentacle:Start(41) -- Start Giant Eye Tentacle Spawn Timer, After Entering Phase 2, Giant Eye spawn in 1 second after Eye Spawn.
		self:UnscheduleMethod("DarkGlare")
	elseif cid == 15802 then -- Flesh Tentacle
		local spawnUid = DBM:GetSpawnIdFromGUID(args.destGUID)
		if fleshTentacles[spawnUid] then
			self:SendSync(COMMS.TENTACLES, COMMS.REMOVE, spawnUid)
		end
	end
end

do
	local lines = {}
	local sortedLines = {}
	local function addLine(key, value)
		-- sort by insertion order
		lines[key] = value
		sortedLines[#sortedLines + 1] = key
	end
	local function updateInfoFrame()
		table.wipe(lines)
		table.wipe(sortedLines)
		for _,v in pairs(fleshTentacles) do
			addLine(v:GetName(), tostring(v:GetPercentage()).."%%")
		end
		return lines, sortedLines
	end

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

	function mod:OnSync(msg, event, spawnUid, health, maxHealth)
		if not self:IsInCombat() then return end
		if msg == COMMS.CTHUN and event == COMMS.UPDATE then
			specWarnWeakened:Show()
			specWarnWeakened:Play("targetchange")
			timerEyeTentacle:Stop() -- Stop Eye Tentacle Timer, casused by C'Thun be Weakened
			timerGiantClawTentacle:Stop() -- Stop Giant Claw Tentacle Timer, casused by C'Thun be Weakened
			timerGiantEyeTentacle:Stop() -- Stop Giant Eye Tentacle Timer, casused by C'Thun be Weakened
			timerEyeTentacle:Start(85)
			timerGiantClawTentacle:Start(55) -- Renew Giant Claw Tentacle Spawn Timer, After C'Thun be Weakened
			timerGiantEyeTentacle:Start(86) -- Renew Giant Eye Tentacle Spawn Timer, After C'Thun be Weakened, A litter later than Eye Tentacles Spawn.

			fleshTentacles = {}
			if self.Options.InfoFrame then
				DBM.InfoFrame:Hide()
			end

		elseif (msg == COMMS.TENTACLES) and spawnUid then
			spawnUid = tonumber(spawnUid)
			if not spawnUid then return end
			if (event == COMMS.CREATE) and maxHealth and health then
				health = tonumber(health) or 0
				maxHealth = tonumber(maxHealth) or 0

				if health == 0 or maxHealth == 0 then return end
				if health > maxHealth then return end

				if not fleshTentacles[spawnUid] then
					fleshTentacles[spawnUid] = ResourceTracker.new(L.FleshTent, maxHealth)
				end
				fleshTentacles[spawnUid]:Update(health)
			elseif (event == COMMS.UPDATE) and health then
				health = tonumber(health)
				if not health then return end
				if fleshTentacles[spawnUid] then
					fleshTentacles[spawnUid]:Update(health)
				end
			elseif (event == COMMS.REMOVE) then
				if fleshTentacles[spawnUid] then
					fleshTentacles[spawnUid] = nil
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
end

function mod:UNIT_HEALTH(uid)
	if not self:IsInCombat() then return end
	if self.vb.phase ~= 2 then return end

	if self:GetUnitCreatureId(uid) == 15802 then -- 15802 Flesh Tentacle
		local spawnUid = DBM:GetSpawnIdFromGUID(UnitGUID(uid))
		if not spawnUid or spawnUid == "" then return end
		if not fleshTentacles[spawnUid] then
			self:SendSync(COMMS.TENTACLES, COMMS.CREATE, spawnUid, UnitHealth(uid), UnitHealthMax(uid))
		else
			local current = fleshTentacles[spawnUid]
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
