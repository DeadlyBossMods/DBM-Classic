local mod	= DBM:NewMod(1153, "DBM-Highmaul", nil, 477)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(79015)
mod:SetEncounterID(1723)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 162185 162184 161411",
	"SPELL_AURA_APPLIED 156803 160734 162186 162185",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED 162186 162185",
	"CHAT_MSG_MONSTER_YELL"
)

local warnNullBarrier				= mod:NewTargetAnnounce(156803, 3)
local warnVulnerability				= mod:NewTargetAnnounce(160734, 1)
local warnTrample					= mod:NewTargetAnnounce(161328, 3)--Technically it's supression field, then trample, but everyone is going to know it more by trample cause that's the part of it that matters
--local warnOverflowingEnergy			= mod:NewSpellAnnounce(161576, 4)--need to find an alternate way to detect this. or just remove :\
local warnExpelMagicFire			= mod:NewSpellAnnounce(162185, 3)
local warnExpelMagicShadow			= mod:NewSpellAnnounce(162184, 3, nil, mod:IsHealer())
local warnExpelMagicFrost			= mod:NewSpellAnnounce(161411, 3)
local warnExpelMagicArcane			= mod:NewTargetAnnounce(162186, 4)--Everyone, so they know to avoid him

local specWarnNullBarrier			= mod:NewSpecialWarningTarget(156803)--Only warn for boss
local specWarnVulnerability			= mod:NewSpecialWarningTarget(160734)--Switched to target warning since some may be assined adds, some to boss, but all need to know when this phase starts
local specWarnTrample				= mod:NewSpecialWarningYou(163101)
local yellTrample					= mod:NewYell(163101)
--local specWarnOverflowingEnergy		= mod:NewSpecialWarningSpell(161576)--Warn the person with Null barrier.
local specWarnExpelMagicFire		= mod:NewSpecialWarningMoveAway(162185)
local specWarnExpelMagicShadow		= mod:NewSpecialWarningSpell(162184, mod:IsHealer())
local specWarnExpelMagicFrost		= mod:NewSpecialWarningSpell(161411, false)
local specWarnExpelMagicArcane		= mod:NewSpecialWarningTarget(162186, mod:IsHealer() or mod:IsTank())
local specWarnExpelMagicArcaneYou	= mod:NewSpecialWarningMoveAway(162186)
local yellExpelMagicArcane			= mod:NewYell(162186)

local timerVulnerability			= mod:NewBuffActiveTimer(20, 160734)
--local timerTrampleCD				= mod:NewCDTimer(15, 161328)--Also all over the place, 15-25 with first one coming very randomly (5-20 after barrier goes up)
local timerExpelMagicArcane			= mod:NewTargetTimer(10, 162186, nil, mod:IsTank() or mod:IsHealer())
--local timerExpelMagicFireCD		= mod:NewCDTimer(20, 162185)
--local timerExpelMagicShadowCD		= mod:NewCDTimer(10, 162184)
--local timerExpelMagicFrostCD		= mod:NewCDTimer(10, 161411)

mod:AddRangeFrameOption("7/5")

function mod:OnCombatStart(delay)
	--timerExpelMagicFireCD:Start(6-delay)
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 162185 then
		warnExpelMagicFire:Show()
	elseif spellId == 162184 then
		warnExpelMagicShadow:Show()
		specWarnExpelMagicShadow:Show()
	elseif spellId == 161411 then
		warnExpelMagicFrost:Show()
		specWarnExpelMagicFrost:Show()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 156803 then
		warnNullBarrier:Show(args.destName)
		specWarnNullBarrier:Show(args.destName)
		--Arcane is just too variable to make meaningful yet
		--I really don't think this is CD based anyways, need more data (such as a raid with WILDLY different dps.
		--I suspect these abilities are actually cast at certain shield % and not timer based at all.
		--If Shield % based then instead of timers just pre warn based on shield remaining
		--I'm not even sure order is always same. it MAY resume where it left off from previous phase.
--		timerExpelMagicFrostCD:Start(11)--11-29 Observed
--		timerExpelMagicShadowCD:Start(26)--26-44 Observed
--		timerExpelMagicFireCD:Start(41)--41-59 Observed
		--Variation that wild, i'm confident, shield % based not timer based.
	elseif spellId == 160734 then
		warnVulnerability:Show(args.destName)
		specWarnVulnerability:Show()
		timerVulnerability:Start()
--		timerExpelMagicFrostCD:Cancel()
--		timerExpelMagicShadowCD:Cancel()
--		timerExpelMagicFireCD:Cancel()
		timerTrampleCD:Cancel()
	elseif spellId == 162186 then
		warnExpelMagicArcane:Show(args.destName)
		timerExpelMagicArcane:Start(args.destName)
		if args:IsPlayer() then
			specWarnExpelMagicArcaneYou:Show()
			yellExpelMagicArcane:Yell()
			if self.Options.RangeFrame then
				DBM.RangeCheck:Show(5)
			end
		else
			specWarnExpelMagicArcane:Show(args.destName)
		end
	elseif spellId == 162185 and args:IsPlayer() then
		specWarnExpelMagicFire:Schedule(6)--Give you about 4 seconds to spread out
		if self.Options.RangeFrame then
			DBM.RangeCheck:Show(7)
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 162186 and args:IsPlayer() and self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	elseif spellId == 162185 and args:IsPlayer() and self.Options.RangeFrame then
		if UnitDebuff("player", GetSpellInfo(162186)) then
			DBM.RangeCheck:Show(5)
		else
			DBM.RangeCheck:Hide()
		end
	end
end

--"<16.8 14:52:14> [CHAT_MSG_MONSTER_YELL] CHAT_MSG_MONSTER_YELL#I will crush you!#Ko'ragh###Serrinne##0#0##0#565#nil#0#false#false", -- [5422]
--"<57.9 14:52:55> [CHAT_MSG_MONSTER_YELL] CHAT_MSG_MONSTER_YELL#Silence!#Ko'ragh###Hesptwo-BetaLevelingRealm02##0#0##0#568#nil#0#false#false", -- [18204]
--"<106.1 14:53:43> [CHAT_MSG_MONSTER_YELL] CHAT_MSG_MONSTER_YELL#Quiet!#Ko'ragh###Kevo-Level100PvP##0#0##0#572#nil#0#false#false", -- [30685]
--"<77.9 14:43:24> [CHAT_MSG_MONSTER_YELL] CHAT_MSG_MONSTER_YELL#I will tear you in half!#Ko'ragh###Turkeyburger##0#0##0#510#nil#0#false#false", -- [23203]
function mod:CHAT_MSG_MONSTER_YELL(msg, _, _, _, target)
	if msg:find(L.supressionTarget1) or msg:find(L.supressionTarget2) or msg:find(L.supressionTarget3) or msg:find(L.supressionTarget4) then
		self:SendSync("ChargeTo", target)--Sync since we have poor language support for many languages.
	end
end

function mod:OnSync(msg, targetname)
	if msg == "ChargeTo" and targetname and self:AntiSpam(10, 4) then
		timerTrampleCD:Start()
		local target = DBM:GetUnitFullName(targetname)
		if target then
			warnTrample:Show(target)
			if target == UnitName("player") then
				specWarnTrample:Show()
				yellTrample:Yell()
			end
		end
	end
end
