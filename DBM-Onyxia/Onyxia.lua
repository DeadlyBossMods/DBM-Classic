local mod	= DBM:NewMod("Onyxia", "DBM-Onyxia")
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(10184)
mod:SetEncounterID(1084)
mod:SetZone()
mod:SetModelID(8570)
mod:SetHotfixNoticeRev(20191122000000)--2019, 11, 22

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"CHAT_MSG_MONSTER_YELL"
)

--[[
(ability.id = 17086 or ability.id = 18351 or ability.id = 18500 or ability.id = 18564 or ability.id = 18576 or ability.id = 18584 or ability.id = 18596 or ability.id = 18609 or ability.id = 18617 or ability.id = 18435 or ability.id = 18431) and type = "begincast"
--]]
--https://classic.wowhead.com/spell=17646/summon-onyxia-whelp
--TODO, if blizzard makes classic wrath and this mod is used as foundation, remove the deep breath emote trigger (because pet added in wrath breaks it)
mod:RegisterEventsInCombat(
	"SPELL_CAST_START 17086 18351 18564 18576 18584 18596 18609 18617 18435 18431 18500 18392",
	"SPELL_CAST_SUCCESS 19633",
	"SPELL_DAMAGE 15847",-- 68867
	"UNIT_DIED",
	"CHAT_MSG_MONSTER_EMOTE",
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"UNIT_HEALTH mouseover target"
)

--Todo, adds stuff (if they exist) with classic IDs
--local warnWhelpsSoon		= mod:NewAnnounce("WarnWhelpsSoon", 1, 69004)
local warnWingBuffet		= mod:NewSpellAnnounce(18500, 2, nil, "Tank")
local warnKnockAway			= mod:NewTargetNoFilterAnnounce(19633, 2, nil, false)
local warnPhase2			= mod:NewPhaseAnnounce(2)
local warnFireball			= mod:NewTargetNoFilterAnnounce(18392, 2, nil, false)
local warnPhase3			= mod:NewPhaseAnnounce(3)
local warnPhase2Soon		= mod:NewPrePhaseAnnounce(2)
local warnPhase3Soon		= mod:NewPrePhaseAnnounce(3)

local specWarnBreath			= mod:NewSpecialWarningSpell(18584, nil, nil, nil, 2, 2)
local specWarnBellowingRoar		= mod:NewSpecialWarningSpell(18431, nil, nil, nil, 2, 2)
local yellFireball				= mod:NewYell(18392)
--local specWarnBlastNova		= mod:NewSpecialWarningRun(68958, "Melee", nil, nil, 4, 2)
--local specWarnAdds			= mod:NewSpecialWarningAdds(68959, "-Healer", nil, nil, 1, 2)

local timerNextFlameBreath	= mod:NewCDTimer(13.3, 18435, nil, "Tank", 2, 5)--13.3-20 Breath she does on ground in frontal cone.
--local timerNextDeepBreath	= mod:NewCDTimer(35, 18584, nil, nil, nil, 3)--Range from 35-60seconds in between based on where she moves to.
local timerBreath			= mod:NewCastTimer(5, 18584, nil, nil, nil, 3)
--local timerWhelps			= mod:NewTimer(105, "TimerWhelps", 10697, nil, nil, 1)
--local timerBigAddCD			= mod:NewAddsTimer(44.9, 68959, nil, "-Healer")

mod:AddBoolOption("SoundWTF3", true, "sound")
mod:AddRangeFrameOption(8, 18392)

mod.vb.warned_preP2 = false
mod.vb.warned_preP3 = false
mod.vb.phase = 0
--mod.vb.whelpsCount = 0

function mod:OnCombatStart(delay)
	self.vb.phase = 1
	--self.vb.whelpsCount = 0
    self.vb.warned_preP2 = false
	self.vb.warned_preP3 = false
	if self.Options.SoundWTF3 then
		DBM:PlaySoundFile("Interface\\AddOns\\DBM-Onyxia\\sounds\\dps-very-very-slowly.ogg")
		self:Schedule(20, DBM.PlaySoundFile, DBM, "Interface\\AddOns\\DBM-Onyxia\\sounds\\hit-it-like-you-mean-it.ogg")
		self:Schedule(30, DBM.PlaySoundFile, DBM, "Interface\\AddOns\\DBM-Onyxia\\sounds\\now-hit-it-very-hard-and-fast.ogg")
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

--[[
--70, 60,
function mod:Whelps()--Not right, need to fix
	if self:IsInCombat() then
		self.vb.whelpsCount = self.vb.whelpsCount + 1
		timerWhelps:Start()
		warnWhelpsSoon:Schedule(60)
		self:ScheduleMethod(70, "Whelps")
	end
end
--]]

do
	function mod:FireballTarget(targetname, uId)
		if not targetname then return end
		warnFireball:Show(targetname)
		if GetRaidTargetIndex(targetname) ~= 8 then
			-- If another DBM/BigWigs client has not yet put a skull on said player, attempt to do so.
			SetRaidTarget(targetname, 8) -- Automatically ignored if the user does not have raid assist.
		end
		if targetname == UnitName("player") then
			yellFireball:Yell()
		end
	end

	local deepBreathCast, flameBreathCast, bellowingRoar, wingBuffet, fireball = DBM:GetSpellInfo(17086), DBM:GetSpellInfo(18435), DBM:GetSpellInfo(18431), DBM:GetSpellInfo(18500), DBM:GetSpellInfo(18392)
	function mod:SPELL_CAST_START(args)
		local spellName = args.spellName
		if spellName == deepBreathCast and args:IsSrcTypeHostile() and self:AntiSpam(8, 1) then
			specWarnBreath:Show()
			specWarnBreath:Play("breathsoon")
			timerBreath:Start()
			--timerNextDeepBreath:Start()
		elseif spellName == flameBreathCast and args:IsSrcTypeHostile() then        -- Flame Breath (Ground phases)
			timerNextFlameBreath:Start()
		elseif spellName == bellowingRoar and args:IsSrcTypeHostile() then
			self:SendSync("Fear")
			if self:AntiSpam(3, 3) then
				specWarnBellowingRoar:Show()
				specWarnBellowingRoar:Play("fearsoon")
			end
		elseif spellName == wingBuffet and args:IsSrcTypeHostile() then
			warnWingBuffet:Show()
		elseif spellName == fireball and args:IsSrcTypeHostile() then
			self:SendSync("Fireball", args.sourceGUID)
			if self:AntiSpam(3, 2) then
				self:BossTargetScanner(args.sourceGUID, "FireballTarget", 0.3, 6)
			end
		end
	end
end

do
	local KnockAway = DBM:GetSpellInfo(19633)
	function mod:SPELL_CAST_SUCCESS(args)
		local spellName = args.spellName
		if spellName == KnockAway and args:IsSrcTypeHostile() then
			warnKnockAway:Show(args.destName)
		end
	end
end

do
	local tailSweep = DBM:GetSpellInfo(15847)
	function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId, spellName)
		if spellName == tailSweep and destGUID == UnitGUID("player") and self.Options.SoundWTF3 then		-- Tail Sweep
			DBM:PlaySoundFile("Interface\\AddOns\\DBM-Onyxia\\sounds\\watch-the-tail.ogg")
		end
	end
end

function mod:UNIT_DIED(args)
	if self:IsInCombat() and args:IsPlayer() and self.Options.SoundWTF3 then
		DBM:PlaySoundFile("Interface\\AddOns\\DBM-Onyxia\\sounds\\thats-a-fucking-fifty-dkp-minus.ogg")
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg)
	if msg == L.Breath or msg:find(L.Breath) then
		self:SendSync("Breath")
	end
end
mod.CHAT_MSG_MONSTER_EMOTE = mod.CHAT_MSG_RAID_BOSS_EMOTE -- todo: check if this is necessary

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L.YellPull and not self:IsInCombat() then
		DBM:StartCombat(self, 0)
	elseif msg == L.YellP2 or msg:find(L.YellP2) then
		self:SendSync("Phase2")
	elseif msg == L.YellP3 or msg:find(L.YellP3) then
		self:SendSync("Phase3")
	end
end

function mod:UNIT_HEALTH(uId)
	if self.vb.phase == 1 and not self.vb.warned_preP2 and self:GetUnitCreatureId(uId) == 10184 and UnitHealth(uId) / UnitHealthMax(uId) <= 0.70 then
		self.vb.warned_preP2 = true
		warnPhase2Soon:Show()
	elseif self.vb.phase == 2 and not self.vb.warned_preP3 and self:GetUnitCreatureId(uId) == 10184 and UnitHealth(uId) / UnitHealthMax(uId) <= 0.45 then
		self.vb.warned_preP3 = true
		warnPhase3Soon:Show()
		if self.Options.SoundWTF3 then
			self:Unschedule(DBM.PlaySoundFile, DBM)
		end
	end
end

function mod:OnSync(msg, guid)
	if not self:IsInCombat() then return end
	if msg == "Breath" and self:AntiSpam(8, 1) then
		specWarnBreath:Show()
		specWarnBreath:Play("breathsoon")
		timerBreath:Start()
		--timerNextDeepBreath:Start()
	elseif msg == "Phase2" then
		self.vb.phase = 2
		self.vb.whelpsCount = 0
		warnPhase2:Show()
		--timerBigAddCD:Start(65)
		--timerNextDeepBreath:Start(67)
		timerNextFlameBreath:Cancel()
		--self:ScheduleMethod(5, "Whelps")
		if self.Options.RangeFrame then
			DBM.RangeCheck:Show(8)
		end
		if self.Options.SoundWTF3 then
			self:Unschedule(DBM.PlaySoundFile, DBM)
			DBM:PlaySoundFile("Interface\\AddOns\\DBM-Onyxia\\sounds\\i-dont-see-enough-dots.ogg")
			self:Schedule(10, DBM.PlaySoundFile, DBM, "Interface\\AddOns\\DBM-Onyxia\\sounds\\throw-more-dots.ogg")
			self:Schedule(18, DBM.PlaySoundFile, DBM, "Interface\\AddOns\\DBM-Onyxia\\sounds\\whelps-left-side-even-side-handle-it.ogg")
		end
	elseif msg == "Phase3" then
		self.vb.phase = 3
		warnPhase3:Show()
		--self:UnscheduleMethod("Whelps")
		--timerWhelps:Stop()
		--timerNextDeepBreath:Stop()
		--timerBigAddCD:Stop()
		--warnWhelpsSoon:Cancel()
		if self.Options.RangeFrame then
			DBM.RangeCheck:Hide()
		end
		if self.Options.SoundWTF3 then
			self:Unschedule(DBM.PlaySoundFile, DBM)
			self:Schedule(15, DBM.PlaySoundFile, DBM, "Interface\\AddOns\\DBM-Onyxia\\sounds\\dps-very-very-slowly.ogg")
			self:Schedule(35, DBM.PlaySoundFile, DBM, "Interface\\AddOns\\DBM-Onyxia\\sounds\\hit-it-like-you-mean-it.ogg")
			self:Schedule(45, DBM.PlaySoundFile, DBM, "Interface\\AddOns\\DBM-Onyxia\\sounds\\now-hit-it-very-hard-and-fast.ogg")
		end
	elseif msg == "Fireball" and guid and self:AntiSpam(3, 2) then
		self:BossTargetScanner(guid, "FireballTarget", 0.3, 6)
	elseif msg == "Fear" and self:AntiSpam(3, 3) then
		specWarnBellowingRoar:Show()
		specWarnBellowingRoar:Play("fearsoon")
	end
end
