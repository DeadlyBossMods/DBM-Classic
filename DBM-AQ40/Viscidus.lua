local mod	= DBM:NewMod("Viscidus", "DBM-AQ40", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(15299)
mod:SetEncounterID(713)
mod:SetModelID(15686)
mod:SetHotfixNoticeRev(20200828000000)--2020, 8, 28
mod:SetMinSyncRevision(20200828000000)--2020, 8, 28

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 25991 25896",
	"SPELL_AURA_APPLIED 25989",
	"CHAT_MSG_MONSTER_EMOTE"
)

local warnPoisonBoltVolley		= mod:NewCountAnnounce(25991, 3)
local warnFreeze				= mod:NewAnnounce("WarnFreeze", 2, 16350)
local warnShatter				= mod:NewAnnounce("WarnShatter", 2, 12982)

local specWarnGTFO				= mod:NewSpecialWarningGTFO(25989, nil, nil, nil, 1, 8)

local timerPoisonBoltVolleyCD	= mod:NewCDCountTimer(11, 25991, nil, nil, nil, 2, nil, DBM_CORE_L.POISON_ICON)
local timerFrozen				= mod:NewBuffActiveTimer(30, 25937, nil, nil, nil, 6)

mod:AddInfoFrameOption(nil, true)

local twipe = table.wipe
local updateInfoFrame

local creatureIDCache = {}
local hits = 200

mod.vb.Frozen = false
mod.vb.volleyCount = 0

local function BossVisible(self)
	if self.Options.InfoFrame and not DBM.InfoFrame:IsShown() then
		self:RegisterShortTermEvents(
			"RANGE_DAMAGE",
			"SPELL_DAMAGE",
			"SWING_DAMAGE"
		)
		DBM.InfoFrame:SetHeader(L.HitsRemain)
		DBM.InfoFrame:Show(1, "function", updateInfoFrame, false, false)
	end
end

function mod:OnCombatStart(delay)
	self.vb.Frozen = false
	self.vb.volleyCount = 0
	timerPoisonBoltVolleyCD:Start(12.9, 1)
	hits = 200
	twipe(creatureIDCache)
	BossVisible(self)
end

function mod:OnCombatEnd(delay)
	self:UnregisterShortTermEvents()
	twipe(creatureIDCache)
	if DBM.InfoFrame:IsShown() then
		DBM.InfoFrame:Hide()
	end
end

do
	local lines = {}
	local sortedLines = {}
	updateInfoFrame = function()
		twipe(lines)
		twipe(sortedLines)

		local key = mod.vb.Frozen and L.Physical or L.Frost
		lines[key] = tostring(hits)
		sortedLines[1] = key

		return lines, sortedLines
	end
end

do
	local function GlobPhase(self)
		timerFrozen:Stop()
		warnShatter:Show(3)
		self.vb.Frozen = false
		hits = 200
		if DBM.InfoFrame:IsShown() then
			DBM.InfoFrame:Hide()
			self:UnregisterShortTermEvents()
		end
	end

	local PoisonBoltVolley, Rejoin = DBM:GetSpellInfo(25991), DBM:GetSpellInfo(25896)
	function mod:SPELL_CAST_SUCCESS(args)
		if args.spellName == PoisonBoltVolley then
			self.vb.volleyCount = self.vb.volleyCount + 1
			warnPoisonBoltVolley:Show(self.vb.volleyCount)
			timerPoisonBoltVolleyCD:Start(11, self.vb.volleyCount+1)
			if self.vb.Frozen then
				--Boss casts this near instantly coming out of frozen
				GlobPhase(self)
			end
		elseif args.spellName == Rejoin then
			BossVisible(self)
		end
	end

	-- function mod:SPELL_DAMAGE(sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellId, spellName, spellSchool, amount)
	function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, _, _, spellSchool)
		local creatureID = creatureIDCache[destGUID]
		if creatureID == nil then
			creatureID = DBM:GetCIDFromGUID(destGUID)
			creatureIDCache[destGUID] = creatureID
		end
		if ((not self.vb.Frozen and spellSchool == 16) or (self.vb.Frozen and spellSchool == 1)) and creatureID == 15299 then
				hits = hits - 1
		end
		if self.vb.Frozen and creatureID == 15667 then
			GlobPhase(self)-- reset on a glob hit if still in frozen mode
		end
	end
	mod.RANGE_DAMAGE = mod.SPELL_DAMAGE
	mod.SWING_DAMAGE = mod.SPELL_DAMAGE
end

do
	local Toxin = DBM:GetSpellInfo(25989)
	function mod:SPELL_AURA_APPLIED(args)
		if args.spellName == Toxin and args:IsPlayer() and self:AntiSpam(3, 2) then
			specWarnGTFO:Show(args.spellName)
			specWarnGTFO:Play("watchfeet")
		end
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L.Phase4 or msg:find(L.Phase4) then
		self:SendSync("Shatter", 1)
	elseif msg == L.Phase5 or msg:find(L.Phase5) then
		self:SendSync("Shatter", 2)
	elseif msg == L.Phase6 or msg:find(L.Phase6) then--No longer present in classic?
		self:SendSync("Shatter", 3)
	elseif msg == L.Slow or msg:find(L.Slow) then
		self:SendSync("Freeze", 1)
	elseif msg == L.Freezing or msg:find(L.Freezing) then
		self:SendSync("Freeze", 2)
	elseif msg == L.Frozen or msg:find(L.Frozen) then
		self:SendSync("Freeze", 3)
	end
end

function mod:OnSync(msg, count)
	if msg == "Shatter" and count then
		count = tonumber(count)
		warnShatter:Show(count)
--		if count == 3 then
--			timerFrozen:Stop()
--		end
	elseif msg == "Freeze" and count then
		count = tonumber(count)
		warnFreeze:Show(count)
		if count == 3 then
			timerFrozen:Start()
			timerPoisonBoltVolleyCD:Stop()
			hits = 75
			self.vb.Frozen = true
		end
		BossVisible(self)
	end
end
