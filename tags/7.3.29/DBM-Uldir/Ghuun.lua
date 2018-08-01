local mod	= DBM:NewMod(2147, "DBM-Uldir", nil, 1031)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(132998)--136461 spawn of ghuun (mythic lasher add), 138531 (Cyclopean Terror), 138529 (dark-young)
mod:SetEncounterID(2122)
--mod:DisableESCombatDetection()
mod:SetZone()
--mod:SetBossHPInfoToHighest()
mod:SetUsedIcons(6)
--mod:SetHotfixNoticeRev(16950)
--mod:SetMinSyncRevision(16950)
--mod.respawnTime = 35

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 272505 267509 267427 267412 273406 273405 267409 267462 267579 263482 263503 263307 276839",
	"SPELL_CAST_SUCCESS 263235",
	"SPELL_AURA_APPLIED 268074 267813 277079 272506 274262 263420 273251 263504 270447 263235",
	"SPELL_AURA_APPLIED_DOSE 270447",
	"SPELL_AURA_REMOVED 268074 267813 277079 272506 274262 273251 263504 263235",
	"SPELL_PERIODIC_DAMAGE 270287",
	"SPELL_PERIODIC_MISSED 270287",
--	"SPELL_DAMAGE 263326",
--	"SPELL_MISSED 263326",
	"UNIT_DIED",
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--TODO, what to do with blood shield, it's probably a good phase change detection
--TODO, adjust icons when other boss mods add them
--TODO, add "torment" timer?
--TODO, add "massive smash" timer?
--TODO, add "dark bargain" cast timer when energy rate is known of Dark Young
--TODO, add "burrow" cd timer?
--TODO, add timers for host, when ORIGIN cast can be detected (not spread/fuckup casts)
--TODO, cast event for Matrix Surge and possible aoe warning (with throttle)
--TODO, how does http://bfa.wowhead.com/spell=268174/tendrils-of-corruption work? warning/yell? is it like yogg squeeze?
--TODO, adjust stacks of Growing Corruption? Drycode assumes devs copied and pasted from margok/Odyn, so that's exactly what I did
--TODO, move range frame to p2 when p2 detection added
--TODO, wave of corruption cast detection, too many Ids to guess accurately, plus it might be spammed every 3 seconds
--TODO, Bursting Boil CAST detection
--TODO, find right balance for automating specWarnBloodFeastMoveTo. Right now don't want to assume EVERYONE goes to target, maybe only players above x stacks?
--TODO, timers for Mind Numbing Chatter?
--TODO, P3 timers, well timers in general and how they are reset on phase changes or boss stuns
--Arena Floor
--local warnXorothPortal				= mod:NewSpellAnnounce(244318, 2, nil, nil, nil, nil, nil, 7)
local warnBloodHost						= mod:NewTargetAnnounce(267813, 3)--Mythic
local warnDarkPurpose					= mod:NewTargetAnnounce(268074, 4, nil, false)--Mythic
local warnDarkBargain					= mod:NewSpellAnnounce(267409, 1)
local warnBurrow						= mod:NewSpellAnnounce(267579, 2)
local warnPowerMatrix					= mod:NewTargetAnnounce(263420, 2)

--Arena Floor
--local specWarnRealityTear				= mod:NewSpecialWarningStack(244016, nil, 2, nil, nil, 1, 6)
local specWarnBloodHost					= mod:NewSpecialWarningClose(267813, nil, nil, nil, 1, 2)--Mythic
--local specWarnSpawnofGhuun			= mod:NewSpecialWarningSwitch("ej13699", "RangedDps", nil, nil, 1, 2)
local yellBloodHost						= mod:NewYell(267813)--Mythic
local specWarnDarkPurpose				= mod:NewSpecialWarningRun(268074, nil, nil, nil, 4, 2)--Mythic
local yellDarkPurpose					= mod:NewYell(268074)--Mythic
local specWarnExplosiveCorruption		= mod:NewSpecialWarningMoveAway(272506, nil, nil, nil, 4, 2)
local yellExplosiveCorruption			= mod:NewYell(272506)
local yellExplosiveCorruptionFades		= mod:NewShortFadesYell(272506)
local specWarnThousandMaws				= mod:NewSpecialWarningSwitch(267509, nil, nil, nil, 1, 2)
local specWarnTorment					= mod:NewSpecialWarningInterrupt(267427, "HasInterrupt", nil, nil, 1, 2)
local specWarnMassiveSmash				= mod:NewSpecialWarningSpell(267412, nil, nil, nil, 1, 2)
local specWarnDarkBargain				= mod:NewSpecialWarningDodge(267409, nil, nil, nil, 1, 2)
local specWarnGTFO						= mod:NewSpecialWarningGTFO(270287, nil, nil, nil, 1, 2)
local specWarnDecayingEruption			= mod:NewSpecialWarningInterrupt(267462, "HasInterrupt", nil, nil, 1, 2)--Mythic
----Arena Floor P2+
local specWarnGrowingCorruption			= mod:NewSpecialWarningCount(270447, nil, DBM_CORE_AUTO_SPEC_WARN_OPTIONS.stack:format(5, 270447), nil, 1, 2)
local specWarnGrowingCorruptionOther	= mod:NewSpecialWarningTaunt(270447, nil, nil, nil, 1, 2)
local specWarnBloodFeast				= mod:NewSpecialWarningYou(263235, nil, nil, nil, 1, 2)
local yellBloodFeast					= mod:NewYell(263235)
local yellBloodFeastFades				= mod:NewFadesYell(263235)
local specWarnBloodFeastMoveTo			= mod:NewSpecialWarningMoveTo(263235, nil, nil, nil, 1, 2)
local specWarnMindNumbingChatter		= mod:NewSpecialWarningCast(263307, "SpellCaster", nil, nil, 1, 2)
----Arena Floor P3
local specWarnCollapse					= mod:NewSpecialWarningDodge(276839, nil, nil, nil, 2, 2)
local specWarnMalignantGrowth			= mod:NewSpecialWarningDodge(274582, nil, nil, nil, 2, 2)
--Upper Platforms
local specWarnPowerMatrix				= mod:NewSpecialWarningYou(263420, nil, nil, nil, 1, 8)--New voice "Matrix on you"
local yellPowerMatrix					= mod:NewYell(263420)
local specWarnReorginationBlast			= mod:NewSpecialWarningSpell(263482, nil, nil, nil, 2, 2)

mod:AddTimerLine("Arena Floor")--Dungeon journal later
--local timerRealityTearCD				= mod:NewAITimer(12.1, 244016, nil, "Tank", nil, 5, nil, DBM_CORE_TANK_ICON)
local timerExplosiveCorruptionCD		= mod:NewAITimer(12.1, 272506, nil, nil, nil, 3)
local timerThousandMawsCD				= mod:NewAITimer(12.1, 267509, nil, nil, nil, 1)
local timerBloodFeastCD					= mod:NewAITimer(12.1, 263235, nil, nil, nil, 3)
mod:AddTimerLine(SCENARIO_STAGE:format(3))
local timerMalignantGrowthCD			= mod:NewAITimer(12.1, 274582, nil, nil, nil, 3)
mod:AddTimerLine("Upper Platforms")--Dungeon journal later
local timerBloodFeastCD					= mod:NewAITimer(12.1, 263235, nil, nil, nil, 3)

--local berserkTimer					= mod:NewBerserkTimer(600)

--local countdownCollapsingWorld			= mod:NewCountdown(50, 243983, true, 3, 3)
--local countdownRealityTear				= mod:NewCountdown("Alt12", 244016, false, 2, 3)
--local countdownFelstormBarrage			= mod:NewCountdown("AltTwo32", 244000, nil, nil, 3)

--mod:AddSetIconOption("SetIconGift", 255594, true)
mod:AddRangeFrameOption(5, 270428)
--mod:AddBoolOption("ShowAllPlatforms", false)
mod:AddInfoFrameOption(nil, true)
mod:AddNamePlateOption("NPAuraOnFixate", 268074)
mod:AddNamePlateOption("NPAuraOnUnstoppable", 275204)
mod:AddSetIconOption("SetIconOnBloodHost", 267813, true)

mod.vb.phase = 1

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
		--Boss Powers first
		--TODO, eliminate main or alternate if it's not needed (drycode checking both to ensure everything is covered)
		for i = 1, 5 do
			local uId = "boss"..i
			--Primary Power
			local currentPower, maxPower = UnitPower(uId), UnitPowerMax(uId)
			if maxPower and maxPower ~= 0 then
				if currentPower / maxPower * 100 >= 1 then
					addLine(UnitName(uId), currentPower)
				end
			end
			--Alternate Power
			local currentAltPower, maxAltPower = UnitPower(uId, 10), UnitPowerMax(uId, 10)
			if maxAltPower and maxAltPower ~= 0 then
				if currentAltPower / maxAltPower * 100 >= 1 then
					addLine(UnitName(uId), currentAltPower)
				end
			end
		end
		--Scan raid for notable debuffs and add them
		--263235 (blood Feast), 263372 or 263420 (Power Matrix), 263227 or 263334 (Putrid Blood), 263436 (Imperfect Physiology)
		--TODO, optimize when correct spellIDs and such known
		--TODO, if stuff appears in combat log correctly, cache target tables using CLEU events instead of scanning entire raid on loop
		for uId in DBM:GetGroupMembers() do
			local spellName = DBM:UnitDebuff(uId, 263235)
			if spellName then--Blood Feast target(s)
				addLine(spellName, UnitName(uId))
			end
			local spellName2 = DBM:UnitDebuff(uId, 263372, 263420)
			if spellName2 then--Power Matrix target(s)
				addLine(spellName2, UnitName(uId))
			end
			if UnitIsUnit("player", uId) then
				local spellName3, _, _, _, _, expireTime = DBM:UnitDebuff("player", 263436)
				if spellName3 and expireTime then--Personal Imperfect Physiology
					local remaining = expireTime-GetTime()
					addLine(spellName3, remaining)
				end
				local spellName4, _, currentStack = DBM:UnitDebuff("player", 263372, 263420)
				if spellName4 and currentStack then--Personal Putrid Blood count
					addLine(spellName4, currentStack)
				end
				local spellName5, _, _, _, _, expireTime2 = DBM:UnitDebuff("player", 277007)
				if spellName5 and expireTime2 then--Personal Bursting Boil
					local remaining2 = expireTime2-GetTime()
					addLine(spellName5, remaining2)
				end
				local spellName6, _, _, _, _, expireTime3 = DBM:UnitDebuff("player", 273405, 267409)
				if spellName6 and expireTime3 then--Personal Dark Bargain
					local remaining3 = expireTime3-GetTime()
					addLine(spellName6, remaining3)
				end
			end
		end
		return lines, sortedLines
	end
end

function mod:OnCombatStart(delay)
	self.vb.phase = 1
	timerExplosiveCorruptionCD:Start(1-delay)
	timerThousandMawsCD:Start(1-delay)
	if self.Options.InfoFrame then
		DBM.InfoFrame:Show(8, "function", updateInfoFrame, false, false)
	end
	if self.Options.NPAuraOnFixate or self.Options.NPAuraOnUnstoppable then
		DBM:FireEvent("BossMod_EnableHostileNameplates")
	end
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(5)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
	if self.Options.NPAuraOnFixate or self.Options.NPAuraOnUnstoppable then
		DBM.Nameplate:Hide(false, nil, nil, nil, true, true)
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 272505 then
		timerExplosiveCorruptionCD:Start()
	elseif spellId == 267509 then
		specWarnThousandMaws:Show()
		specWarnThousandMaws:Play("killmob")
		timerThousandMawsCD:Start()
	elseif spellId == 267427 and self:CheckInterruptFilter(args.sourceGUID) then
		specWarnTorment:Show(args.sourceName)
		specWarnTorment:Play("kickcast")
	elseif spellId == 267462 and self:CheckInterruptFilter(args.sourceGUID) then
		specWarnDecayingEruption:Show(args.sourceName)
		specWarnDecayingEruption:Play("kickcast")
	elseif spellId == 267412 and self:CheckInterruptFilter(args.sourceGUID, true) then
		specWarnMassiveSmash:Show()
		specWarnMassiveSmash:Play("carefly")
	elseif (spellId == 273406 or spellId == 273405 or spellId == 267409) and self:AntiSpam(3.5, 1) then--Dark Bargains
		if spellId ~= 273406 and DBM:UnitDebuff("player", 273405, 267409) then--Run out or get MCed
			specWarnDarkBargain:Show()
			specWarnDarkBargain:Play("runaway")
		else
			warnDarkBargain:Show()
		end
	elseif spellId == 267579 then
		warnBurrow:Show()
	elseif (spellId == 263482 or spellId == 263503) and self:AntiSpam(15, 2) then
		specWarnReorginationBlast:Show()
		specWarnReorginationBlast:Play("aesoon")--Or phase change
	elseif spellId == 263307 then
		specWarnMindNumbingChatter:Show()
		specWarnMindNumbingChatter:Play("stopcast")
	elseif spellId == 276839 then
		self.vb.phase = 3
		specWarnCollapse:Show()
		specWarnCollapse:Play("watchstep")
		timerBloodFeastCD:Stop()
		--Probably other timer updates
		timerMalignantGrowthCD:Start(3)
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 263235 then
		timerBloodFeastCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 268074 then
		warnDarkPurpose:CombinedShow(0.5, args.destName)
		if args:IsPlayer() then
			specWarnDarkPurpose:Show()
			specWarnDarkPurpose:Play("justrun")
			yellDarkPurpose:Yell()
		end
		if self.Options.NPAuraOnFixate then
			DBM.Nameplate:Show(true, args.sourceGUID, spellId)
		end
	elseif spellId == 275204 then
		if self.Options.NPAuraOnUnstoppable then
			DBM.Nameplate:Show(true, args.sourceGUID, spellId)
		end
	elseif spellId == 267813 then
		if args:IsPlayer() then
			yellBloodHost:Yell()
		end
		if self:CheckNearby(20, args.destName) and self:AntiSpam(3.5, 3) then
			specWarnBloodHost:Show(args.destName)
			specWarnBloodHost:Play("runaway")
		else
			warnBloodHost:CombinedShow(0.5, args.destName)
		end
		if self.Options.SetIconOnBloodHost and not self:IsLFR() then
			--This assumes no fuckups. Because honestly coding this around fuckups is not worth the effort
			self:SetIcon(args.destName, 6)
		end
	elseif spellId == 277079 or spellId == 272506 or spellId == 274262 then
		if args:IsPlayer() then
			specWarnExplosiveCorruption:Show()
			specWarnExplosiveCorruption:Play("runout")
			yellExplosiveCorruption:Yell()
			yellExplosiveCorruptionFades:Countdown(spellId == 277079 and 6 or spellId == 272506 and 5 or 4)
		end
	elseif spellId == 263420 then
		if args:IsPlayer() then
			specWarnPowerMatrix:Show()
			specWarnPowerMatrix:Play("matrixyou")
		else
			warnPowerMatrix:Show(args.destName)
		end
	elseif (spellId == 273251 or spellId == 263504) and args:GetDestCreatureID() == 132998 then--G'huun Debuffed by Blast
		--Do fancy stuff with timers. either pausing or canceling them
	elseif spellId == 270447 then
		local amount = args.amount or 1
		if (amount == 6 or amount >= 9) and not self.vb.noTaunt and self:AntiSpam(3, 3) then--First warning at 6, then a decent amount of time until 9. then spam every 3 seconds at 9 and above.
			local tanking, status = UnitDetailedThreatSituation("player", "boss1")
			if tanking or (status == 3) then
				specWarnGrowingCorruption:Show(amount)
				specWarnGrowingCorruption:Play("changemt")
			else
				specWarnGrowingCorruptionOther:Show(L.name)
				specWarnGrowingCorruptionOther:Play("changemt")
			end
		end
	elseif spellId == 263235 then
		if args:IsPlayer() then
			specWarnBloodFeast:Show()
			specWarnBloodFeast:Play("targetyou")
			yellBloodFeast:Yell()
			yellBloodFeastFades:Countdown(8)
		else
			--specWarnBloodFeastMoveTo:Show(args.destName)
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 268074 then
		if self.Options.NPAuraOnFixate then
			DBM.Nameplate:Hide(true, args.sourceGUID, spellId)
		end
	elseif spellId == 275204 then
		if self.Options.NPAuraOnUnstoppable then
			DBM.Nameplate:Hide(true, args.sourceGUID, spellId)
		end
	elseif spellId == 267813 then
		if self:AntiSpam(5, 4) and not DBM:UnitDebuff("player", 267813) then
			--specWarnSpawnofGhuun:Show()
			--specWarnSpawnofGhuun:Play("killmob")
		end
		if self.Options.SetIconOnBloodHost and not self:IsLFR() then
			self:SetIcon(args.destName, 0)
		end
	elseif spellId == 277079 or spellId == 272506 or spellId == 274262 then
		if args:IsPlayer() then
			yellExplosiveCorruptionFades:Cancel()
		end
	elseif (spellId == 273251 or spellId == 263504) and args:GetDestCreatureID() == 132998 then--G'huun Debuffed by Blast
		--Do fancy stuff with timers. either resuming or starting them
	elseif spellId == 263235 then
		if args:IsPlayer() then
			yellBloodFeastFades:Cancel()
		end
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 270287 and destGUID == UnitGUID("player") and self:AntiSpam(2, 5) then
		specWarnGTFO:Show()
		specWarnGTFO:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 263326 and destGUID == UnitGUID("player") and self:AntiSpam(2, 5) then
		specWarnGTFO:Show()
		specWarnGTFO:Play("runaway")
	end
end
mod.SPELL_MISSED = mod.SPELL_DAMAGE

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 136461 then--spawn of ghuun
	
	elseif cid == 138531 then--Cyclopean Terror
	
	elseif cid == 138529 then--Dark Young
	
	elseif cid == 134590 then--Blightspreader Tendril

	elseif cid == 141265 then--Amorphus Cyst (cat)
	
	elseif cid == 134010 then--Gibbering Horror
	
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 274582 then--Malignant Growth
		specWarnMalignantGrowth:Show()
		specWarnMalignantGrowth:Play("watchstep")
		timerMalignantGrowthCD:Start()
	end
end