local mod	= DBM:NewMod("Gothik", "DBM-Naxx", 4)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(16060)
mod:SetEncounterID(1109)
mod:SetModelID(16279)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"UNIT_DIED"
)

--TODO, actual naxx 40 waves, right now 25 man are used
--(source.type = "NPC" and source.firstSeen = timestamp) or (target.type = "NPC" and target.firstSeen = timestamp)
local warnWaveNow		= mod:NewAnnounce("WarningWaveSpawned", 3, nil, false)
local warnWaveSoon		= mod:NewAnnounce("WarningWaveSoon", 2)
local warnRiderDown		= mod:NewAnnounce("WarningRiderDown", 4)
local warnKnightDown	= mod:NewAnnounce("WarningKnightDown", 2)
local warnPhase2		= mod:NewPhaseAnnounce(2, 3)

local timerPhase2		= mod:NewTimer(270, "TimerPhase2", "136116", nil, nil, 6)
local timerWave			= mod:NewTimer(20, "TimerWave", "135974", nil, nil, 1)

mod:AddInfoFrameOption(nil, true)

mod.vb.wave = 0
local mobCounts = {}

local liveMobIds = {
	[16124] = L.Trainee,
	[16125] = L.Knight,
	[16126] = L.Rider
}
local liveMobNames = {
	[L.Trainee] = 16124,
	[L.Knight] = 16125,
	[L.Rider] = 16126
}
local undeadMobIds = {
	[16127] = L.Trainee,
	[16148] = L.Knight,
	[16150] = L.Rider,
	[16149] = L.Horse
}
local undeadMobNames = {
	[L.Trainee] = 16127,
	[L.Knight] = 16148,
	[L.Rider] = 16150,
	[L.Horse] = 16149
}
-- pick up localized names from UNIT_DEAD
local mobNames = {}

local updateInfoFrame
do
	local tostring, twipe = tostring, table.wipe
	local lines, sortedLines = {}, {}
	local function addLine(key, value)
		-- sort by insertion order
		lines[key] = value
		sortedLines[#sortedLines + 1] = key
	end
	updateInfoFrame = function()
		twipe(lines)
		twipe(sortedLines)
		for name, cid in pairs(liveMobNames) do
			if mobCounts[cid] then
				addLine(tostring(cid) .. '*' .. (mobNames[cid] or name), tostring(mobCounts[cid]))
			end
		end
		for name, cid in pairs(undeadMobNames) do
			if mobCounts[cid] then
				addLine(tostring(cid) .. '*' .. (mobNames[cid] or name), tostring(mobCounts[cid]))
			end
		end
		return lines, sortedLines
	end
end

--TODO, actual wave info and timer verification, this is Naxx25 data

local wavesClassic = {
	{3, L.Trainee, next = 20},
	{3, L.Trainee, next = 20},
	{3, L.Trainee, next = 10},
	{2, L.Knight, next = 10},
	{3, L.Trainee, next = 15},
	{2, L.Knight, next = 5},
	{3, L.Trainee, next = 20},
	{2, L.Knight, 3, L.Trainee, next = 10},
	{1, L.Rider, next = 10},
	{3, L.Trainee, next = 5},
	{2, L.Knight, next = 15},
	{1, L.Rider, 3, L.Trainee, next = 10},
	{2, L.Knight, next = 10},
	{3, L.Trainee, next = 10},
	{1, L.Rider, next = 5},
	{2, L.Knight, next = 5},
	{3, L.Trainee, next = 20},
	{1, L.Rider, 2, L.Knight, 3, L.Trainee},
}

--[[
local wavesWrath25 = {
	{3, L.Trainee, next = 20},
	{3, L.Trainee, next = 20},
	{3, L.Trainee, next = 10},
	{2, L.Knight, next = 10},
	{3, L.Trainee, next = 15},
	{2, L.Knight, next = 5},
	{3, L.Trainee, next = 20},
	{3, L.Trainee, 2, L.Knight, next = 10},
	{3, L.Trainee, next = 10},
	{1, L.Rider, next = 5},
	{3, L.Trainee, next = 15},
	{1, L.Rider, next = 10},
	{2, L.Knight, next = 10},
	{1, L.Rider, next = 10},
	{1, L.Rider, 3, L.Trainee, next = 5},
	{1, L.Knight, 3, L.Trainee, next = 5},
	{1, L.Rider, 3, L.Trainee, next = 20},
	{1, L.Rider, 2, L.Knight, 3, L.Trainee},
}
--]]

local function getWaveString(wave)
	local waveInfo = wavesClassic[wave]
	if #waveInfo == 2 then
		return L.WarningWave1:format(unpack(waveInfo))
	elseif #waveInfo == 4 then
		return L.WarningWave2:format(unpack(waveInfo))
	elseif #waveInfo == 6 then
		return L.WarningWave3:format(unpack(waveInfo))
	end
end

function mod:NextWave()
	self.vb.wave = self.vb.wave + 1
	warnWaveNow:Show(self.vb.wave, getWaveString(self.vb.wave))
	for i, num in ipairs(wavesClassic[self.vb.wave]) do
		if i % 2 == 1 then
			local cid = liveMobNames[wavesClassic[self.vb.wave][i + 1]]
			mobCounts[cid] = (mobCounts[cid] or 0) + num
		end
	end
	local next = wavesClassic[self.vb.wave].next
	if next then
		timerWave:Start(next, self.vb.wave + 1)
		warnWaveSoon:Schedule(next - 3, self.vb.wave + 1, getWaveString(self.vb.wave + 1))
		self:ScheduleMethod(next, "NextWave")
	end
end

function mod:OnCombatStart(delay)
	self.vb.wave = 0
	timerPhase2:Start()
	warnPhase2:Schedule(270)
	timerWave:Start(27, self.vb.wave + 1)
	warnWaveSoon:Schedule(24, self.vb.wave + 1, getWaveString(self.vb.wave + 1))
	self:ScheduleMethod(27, "NextWave")
	table.wipe(mobNames)
	table.wipe(mobCounts)

	if self.Options.InfoFrame and not DBM.InfoFrame:IsShown() then
		DBM.InfoFrame:SetHeader(DBM_CORE_L.ADDS)
		DBM.InfoFrame:Show(8, "function", updateInfoFrame, false, false)
		DBM.InfoFrame:SetColumns(1)
	end
--	DBM:AddMsg("Add timers/spawn names are probably not correct, as they are from Naxx 25. You can help correct this by sharing well angled videos of mobs spawning in that show the SPAWNING (not running in from a blind spot)")
end

function mod:OnCombatEnd()
	if DBM.InfoFrame:IsShown() then
		DBM.InfoFrame:Hide()
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 16126 then -- Unrelenting Rider
		warnRiderDown:Show()
	elseif cid == 16125 then -- Unrelenting Deathknight
		warnKnightDown:Show()
	end
	if liveMobIds[cid] then
		local undeadId = undeadMobNames[liveMobIds[cid]]
		mobCounts[cid] = (mobCounts[cid] or 0) - 1
		mobCounts[undeadId] = (mobCounts[undeadId] or 0) + 1
		mobNames[cid] = args.destName
		if cid == 16126 then
			-- When a rider dies it spawns a rider 16150 and a horse 16149
			mobCounts[16149] = (mobCounts[16149] or 0) + 1
		end
	elseif undeadMobIds[cid] then
		mobCounts[cid] = (mobCounts[cid] or 0) - 1
		mobNames[cid] = args.destName
	end
end
