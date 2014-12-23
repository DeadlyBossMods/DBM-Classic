local mod	= DBM:NewMod(1128, "DBM-Highmaul", nil, 477)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(78714)
mod:SetEncounterID(1721)
mod:SetZone()
--mod:SetUsedIcons(7)
mod:SetHotfixNoticeRev(11928)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 159113 159947 158986",
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED 159947 158986 159178 159202 162497",
	"SPELL_AURA_APPLIED_DOSE 159178",
	"SPELL_PERIODIC_DAMAGE 159413",
	"SPELL_PERIODIC_MISSED 159413",
	"CHAT_MSG_RAID_BOSS_EMOTE"
--	"UNIT_SPELLCAST_CHANNEL_STOP boss1"
)

--TODO add timer for sweeper in arena
local warnChainHurl					= mod:NewTargetAnnounce(159947, 3)--Warn for cast too?
local warnBerserkerRush				= mod:NewTargetAnnounce(158986, 4)
local warnOpenWounds				= mod:NewStackAnnounce(159178, 2, nil, mod:IsTank())
local warnImpale					= mod:NewSpellAnnounce(159113, 3, nil, mod:IsTank())
local warnPillar					= mod:NewSpellAnnounce("ej9394", 3, nil, 159202)
local warnOnTheHunt					= mod:NewTargetAnnounce(162497, 4)

local specWarnChainHurl				= mod:NewSpecialWarningSpell(159947, nil, nil, nil, nil, true)
local specWarnBerserkerRushOther	= mod:NewSpecialWarningTarget(158986, nil, nil, nil, 2, true)
local specWarnBerserkerRush			= mod:NewSpecialWarningMoveTo(158986, nil, DBM_CORE_AUTO_SPEC_WARN_OPTIONS.run:format(158986), nil, 3, true)--Creative use of warning. Run option text but a moveto warning to get players in LFR to actually run to the flame jet instead of being clueless.
local yellBerserkerRush				= mod:NewYell(158986)
--local specWarnBerserkerRushEnded	= mod:NewSpecialWarningEnd(158986)
local specWarnImpale				= mod:NewSpecialWarningSpell(159113, mod:IsTank())
local specWarnOpenWounds			= mod:NewSpecialWarningStack(159178, nil, 2)
local specWarnOpenWoundsOther		= mod:NewSpecialWarningTaunt(159178)--If it is swap every impale, will move this to impale cast and remove stack stuff all together.
local specWarnMaulingBrew			= mod:NewSpecialWarningMove(159413)
local specWarnOnTheHunt				= mod:NewSpecialWarningMoveTo(162497, nil, DBM_CORE_AUTO_SPEC_WARN_OPTIONS.run:format(162497), nil, nil, true)--Does not need yell, tigers don't cleave other targets like berserker rush does.

local timerPillarCD					= mod:NewNextTimer(20, "ej9394", nil, nil, nil, 159202)
local timerChainHurlCD				= mod:NewNextTimer(106, 159947)--177776
local timerSweeperCD				= mod:NewTimer(55, "timerSweeperCD", 177258)
local timerBerserkerRushCD			= mod:NewCDTimer(45, 158986)--45 to 70 variation. Small indication that you can use a sequence to get it a little more accurate but even then it's variable. Pull1: 48, 60, 46, 70, 45, 51, 46, 70. Pull2: 48, 60, 50, 55, 45. Mythic pull1, 48, 50, 57, 49
local timerImpaleCD					= mod:NewCDTimer(45, 159113, nil, mod:IsTank())--Highly variable now, seems better adjusted for berserker rush interaction
local timerTigerCD					= mod:NewNextTimer(110, "ej9396", nil, not mod:IsTank(), nil, 162497)

local countdownChainHurl			= mod:NewCountdown(106, 159947)
local countdownSweeper				= mod:NewCountdown(55, 177776, nil, mod.localization.options.countdownSweeper)
local countdownTiger				= mod:NewCountdown("Alt110", "ej9396", not mod:IsTank())--Tigers never bother tanks so not tanks probelm
local countdownImpale				= mod:NewCountdown("Alt45", 159113, mod:IsTank())--Slightly veriable based on other spells

local voiceImpale					= mod:NewVoice(159113)
local voiceBerserkerRush			= mod:NewVoice(158986)
local voiceChainHurl				= mod:NewVoice(159947)
local voiceOnTheHunt				= mod:NewVoice(162497)
local voicePillar					= mod:NewVoice("ej9394", mod:IsRanged())

mod:AddRangeFrameOption(4, 159386)

local firePillar = EJ_GetSectionInfo(9394)

function mod:OnCombatStart(delay)
	timerPillarCD:Start(24-delay)
	timerImpaleCD:Start(35-delay)
	countdownImpale:Start(35-delay)
	timerBerserkerRushCD:Start(48-delay)
	timerChainHurlCD:Start(91-delay)
	countdownChainHurl:Start(91-delay)
	if self.Options.RangeFrame and not self:IsLFR() then
		DBM.RangeCheck:Show(4)--For Mauling Brew splash damage.
	end
	if self:IsMythic() then
		timerTigerCD:Start()
		countdownTiger:Start()
	end
	voiceChainHurl:Schedule(84.5-delay, "159947r") --ready for hurl
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 159113 then
		warnImpale:Show()
		specWarnImpale:Show()
		timerImpaleCD:Start()
		countdownImpale:Start()
		if self:IsHealer() then
			voiceImpale:Play("tankheal")
		end
	elseif spellId == 159947 then
		specWarnChainHurl:Show()
		timerChainHurlCD:Start()
		countdownChainHurl:Start()
		voiceChainHurl:Schedule(99.5, "159947r") --ready for hurl
	elseif spellId == 158986 and self:IsMelee() then
		voiceBerserkerRush:Play("chargemove")
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 159947 then
		warnChainHurl:CombinedShow(0.5, args.destName)
		if args:IsPlayer() then
			timerSweeperCD:Start()
			countdownSweeper:Start()--TODO,scan for punted or whatever knockdown is and cancel.
			voiceChainHurl:Play("159947y") --you are the target
		else
			if self:AntiSpam(2, 2) then			
				voiceChainHurl:Play("otherout")
			end
		end
	elseif spellId == 158986 then
		warnBerserkerRush:Show(args.destName)
		timerBerserkerRushCD:Start()
		if args:IsPlayer() then
			specWarnBerserkerRush:Show(firePillar)
			yellBerserkerRush:Yell()
			voiceBerserkerRush:Play("159202f") --find the pillar
		else
			specWarnBerserkerRushOther:Show(args.destName)
			voiceBerserkerRush:Play("chargemove")
		end
	elseif spellId == 159178 then
		local amount = args.amount or 1
		warnOpenWounds:Show(args.destName, amount)
		if amount >= 2 then--Stack count unknown
			if args:IsPlayer() then--At this point the other tank SHOULD be clear.
				specWarnOpenWounds:Show(amount)
			else--Taunt as soon as stacks are clear, regardless of stack count.
				if not UnitDebuff("player", GetSpellInfo(159178)) and not UnitIsDeadOrGhost("player") then
					specWarnOpenWoundsOther:Show(args.destName)
				end
			end
		end
	elseif spellId == 159202 then
		warnPillar:Show()
		timerPillarCD:Start()
		voicePillar:Play("159202") --pillar
	elseif spellId == 162497 then
		warnOnTheHunt:Show(args.destName)
		if args:IsPlayer() then
			specWarnOnTheHunt:Show(firePillar)
			voiceOnTheHunt:Play("159202f") --find the pillar
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, destName, _, _, spellId)
	if spellId == 159413 and destGUID == UnitGUID("player") and self:AntiSpam(2, 1) then
		specWarnMaulingBrew:Show()
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg)
	--Only fires for one thing, so no reason to localize
	if self:IsMythic() then
		timerTigerCD:Start()
		countdownTiger:Start()
	end
end

--[[
function mod:UNIT_SPELLCAST_CHANNEL_STOP(uId, _, _, _, spellId)
	if spellId == 158986 then--160519 bugged. find better way
		specWarnBerserkerRushEnded:Show()
	end
end--]]
