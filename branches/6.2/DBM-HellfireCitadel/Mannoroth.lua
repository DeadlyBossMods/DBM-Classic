local mod	= DBM:NewMod(1395, "DBM-HellfireCitadel", nil, 669)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(91349)--91305 Fel Iron Summoner
mod:SetEncounterID(1795)
mod:SetZone()
--mod:SetUsedIcons(8, 7, 6, 4, 2, 1)
--mod:SetRespawnTime(20)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 181126 181132 181557 183376 181793 181792 181738 181799 182084 185830 181948 182040 182076 182077",
	"SPELL_CAST_SUCCESS 181190 181597 182006",
	"SPELL_AURA_APPLIED 181099 181275 181191 181597 182006",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED 181099 181275 185147 182212 185175 181597 182006",
--	"SPELL_PERIODIC_DAMAGE",
--	"SPELL_ABSORBED",
	"INSTANCE_ENCOUNTER_ENGAGE_UNIT",
	"UNIT_DIED",
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"UNIT_SPELLCAST_SUCCEEDED boss1"
)

--TODO, do voices later, for this fight i need a lot of clarity first.
--TODO, get timer for 2nd doom lord spawning, if some group decides to do portals in a bad order and not kill that portal summoner first
--TODO, get longer phase 4 log because log i have isn't long enough to see why felstorm has a longer cd in phase 4
--Adds
----Doom Lords
local warnCurseoftheLegion			= mod:NewTargetAnnounce(181275, 3)--Spawn
local warnMarkofDoom				= mod:NewTargetAnnounce(181099, 4)
----Fel Imp
local warnFelImplosion				= mod:NewSpellAnnounce(181255, 3)--Spawn
----Dread Infernals
local warnInferno					= mod:NewSpellAnnounce(181180, 3)--Spawn
local warnFelStreak					= mod:NewSpellAnnounce(181190, 3, nil, "Melee")--Change to target scan/personal/near warning if possible
--Mannoroth
local warnGaze						= mod:NewTargetAnnounce(181597, 3)
local warnFelseeker					= mod:NewCountAnnounce(181735, 3)

--Adds
----Doom Lords
local specWarnCurseofLegion			= mod:NewSpecialWarningYou(181275)
local yellCurseofLegion				= mod:NewFadesYell(181275)--Don't need to know when it's applied, only when it's fading does it do aoe/add spawn
local specWarnMarkOfDoom			= mod:NewSpecialWarningYou(181099)
local yellMarkOfDoom				= mod:NewYell(181099)--This need to know at apply, only player needs to know when it's fading
local specWarnShadowBoltVolley		= mod:NewSpecialWarningInterrupt(181126, "-Healer")
----Fel Imps
local specWarnFelBlast				= mod:NewSpecialWarningInterrupt(181132, "-Healer")--This warning is spammy if filter is disabled, so this mod does NOT honor filter setting, this warning is ALWAYS target filtered
----Dread Infernals
local specWarnFelHellfire			= mod:NewSpecialWarningDodge(181191, "Melee", nil, nil, 4)
--Mannoroth
local specWarnGlaiveCombo			= mod:NewSpecialWarningSpell(181354, "Tank", nil, nil, 3)--Active mitigation or die mechanic
local specWarnMassiveBlast			= mod:NewSpecialWarningSpell(181359, "Tank")--Swap Mechanic
local specWarnFelHellStorm			= mod:NewSpecialWarningSpell(181557, nil, nil, nil, 2)
local specWarnGaze					= mod:NewSpecialWarningYou(181597)
local yellGaze						= mod:NewYell(181597)
local specWarnFelSeeker				= mod:NewSpecialWarningDodge(181735, nil, nil, nil, 2)
local specWarnShadowForce			= mod:NewSpecialWarningSpell(181799, nil, nil, nil, 3)

--Adds
----Doom Lords
--local timerCurseofLegionCD		= mod:NewCDTimer(107, 181275)--Maybe see one day, in LFR or something when group is terrible or doesn't kill doom lord portal first
local timerMarkofDoomCD				= mod:NewCDTimer(31.5, 181099, nil, "-Tank")
local timerShadowBoltVolleyCD		= mod:NewCDTimer(13, 181126, nil, "-Healer")
----Fel Imps
local timerFelImplosionCD			= mod:NewNextCountTimer(46, 181255)
----Infernals
local timerInfernoCD				= mod:NewNextCountTimer(107, 181180)
--Mannoroth
local timerGlaiveComboCD			= mod:NewCDTimer(30, 181354, nil, "Tank")--30 seconds unless delayed by something else
local timerFelHellfireCD			= mod:NewCDTimer(35, 181557)--35, unless delayed by other things.
local timerGazeCD					= mod:NewCDTimer(47.5, 181597)--As usual, some variation do to other abilities
local timerFelSeekerCD				= mod:NewCDTimer(51, 181735)--Small sample size, confirm it's not shorter if not delayed by things.
local timerShadowForceCD			= mod:NewCDTimer(52.5, 181799)

--local berserkTimer					= mod:NewBerserkTimer(360)

local countdownMarkOfDoom			= mod:NewCountdownFades("Alt15", 181099)
local countdownShadowForce			= mod:NewCountdown("AltTwo52", 181799)

--local voiceInfernoSlice				= mod:NewVoice(155080)

mod:AddRangeFrameOption(20, 181099)
mod:AddHudMapOption("HudMapOnGaze", 181597)

mod.vb.DoomTargetCount = 0
mod.vb.portalsLeft = 3
mod.vb.phase = 1
mod.vb.impCount = 0
mod.vb.infernalCount = 0
local phase1ImpTimers = {15, 35, 23, 15, 10}--Spawn 33% faster each wave, but cannot confirm it goes lower than 10, if it does, next would be 6.6
local phase2ImpTimers = {27.6, 46.2, 43.8}--Confirmed two pulls consistent, but no more than 3 spawns seen, don't know next one
local phase1InfernalTimers = {18.4, 40}--That's all I have, strat is generally to kill doom lord portal first, then infernals, lastly imps.
local phase2InfernalTimers = {53.3, 50}
local phase3InfernalTimers = {43.2, 34.8}

local AddsSeen = {}
local debuffFilter
local debuffName = GetSpellInfo(181099)
local UnitDebuff = UnitDebuff
do
	debuffFilter = function(uId)
		if UnitDebuff(uId, debuffName) then
			return true
		end
	end
end

local function updateRangeFrame(self)
	if not self.Options.RangeFrame then return end
	if self.vb.DoomTargetCount > 0 then
		if UnitDebuff("Player", debuffName) then
			DBM.RangeCheck:Show(20)
		else
			DBM.RangeCheck:Show(20, debuffFilter)
		end
	else
		DBM.RangeCheck:Hide()
	end
end

function mod:OnCombatStart(delay)
	self.vb.impCount = 0
	self.vb.infernalCount = 0
	self.vb.phase = 1
	self.vb.portalsLeft = 3
	table.wipe(AddsSeen)
	self.vb.DoomTargetCount = 0
	timerFelImplosionCD:Start(15-delay, 1)
	timerInfernoCD:Start(18.4-delay, 1)
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.HudMapOnGaze then
		DBMHudMap:Disable()
	end
end 

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 181557 or spellId == 181948 then
		specWarnFelHellStorm:Show()
		timerFelHellfireCD:Start()
	elseif spellId == 181126 then
		timerShadowBoltVolleyCD:Start(args.sourceGUID)
		if self:CheckInterruptFilter(args.sourceGUID) then
			specWarnShadowBoltVolley:Show(args.sourceName)
		end
	elseif spellId == 181132 then
		if self:CheckInterruptFilter(args.sourceGUID, true) then
			specWarnFelBlast:Show(args.sourceName)
		end
	elseif spellId == 183376 or spellId == 185830 then
		specWarnMassiveBlast:Show()
	elseif spellId == 181793 or spellId == 182077 then--Melee (10)
		warnFelseeker:Show(10)
	elseif spellId == 181792 or spellId == 182076 then--Ranged (20)
		warnFelseeker:Show(20)
	elseif spellId == 181738 or spellId == 182040 then--Ranged (35)
		warnFelseeker:Show(35)
	elseif spellId == 181799 or spellId == 182084 then
		specWarnShadowForce:Show()
		timerShadowForceCD:Start()
		countdownShadowForce:Start(52.5)
	end
end

function mod:SPELL_SUMMON(args)
	local spellId = args.spellId
	if spellId == 181255 and self:AntiSpam(7, 1) then--Imps
		self.vb.impCount = self.vb.impCount + 1
		warnFelImplosion:Show(self.vb.impCount)
		local nextCount = self.vb.impCount + 1
		if self.sb.phase == 1 then
			if phase1ImpTimers[nextCount] then
				timerFelImplosionCD:Start(phase1ImpTimers[nextCount], nextCount)
			end
		else
			if phase2ImpTimers[nextCount] then
				timerFelImplosionCD:Start(phase2ImpTimers[nextCount], nextCount)
			end
		end
	elseif spellId == 181180 and self:AntiSpam(7, 2) then--Infernals
		self.vb.infernalCount = self.vb.infernalCount + 1
		warnInferno:Show(self.vb.infernalCount)
		local nextCount = self.vb.infernalCount + 1
		if self.sb.phase == 1 then
			if phase1InfernalTimers[nextCount] then
				timerInfernoCD:Start(phase1InfernalTimers[nextCount], nextCount)
			end
		elseif self.sb.phase == 2 then
			if phase2InfernalTimers[nextCount] then
				timerInfernoCD:Start(phase2InfernalTimers[nextCount], nextCount)
			end
		else
			if phase3InfernalTimers[nextCount] then
				timerInfernoCD:Start(phase3InfernalTimers[nextCount], nextCount)
			end
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 181190 and self:AntiSpam(2, 3) then
		warnFelStreak:Show()
	elseif spellId == 181597 or spellId == 182006 then
		timerGazeCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 181275 then
		--timerCurseofLegionCD:Start()
		if args:IsPlayer() then
			specWarnCurseofLegion:Show()
			local _, _, _, _, _, _, expires = UnitDebuff("Player", args.spellName)
			local debuffTime = expires - GetTime()
			yellCurseofLegion:Schedule(debuffTime - 1, 1)
			yellCurseofLegion:Schedule(debuffTime - 2, 2)
			yellCurseofLegion:Schedule(debuffTime - 3, 3)
			yellCurseofLegion:Schedule(debuffTime - 2, 4)
			yellCurseofLegion:Schedule(debuffTime - 5, 5)
		else
			warnCurseoftheLegion:Show(args.destName)
		end
	elseif spellId == 181099 then
		timerMarkofDoomCD:Start(args.sourceGUID)
		self.vb.DoomTargetCount = self.vb.DoomTargetCount + 1
		warnMarkofDoom:CombinedShow(1.2, args.destName)--3 targets, pretty slowly
		if args:IsPlayer() then
			specWarnMarkOfDoom:Show()
			countdownMarkOfDoom:Start()
			yellMarkOfDoom:Yell()
		end
		updateRangeFrame(self)
	elseif spellId == 181191 and self:CheckInterruptFilter(args.sourceGUID, true) then--No sense in duplicating code, just use CheckInterruptFilter with arg to skip the filter setting check
		specWarnFelHellfire:Show()--warn melee who are targetting infernal to run out if it's exploding
	elseif spellId == 181597 or spellId == 182006 then
		warnGaze:CombinedShow(0.3, args.destName)
		if args:IsPlayer() then
			specWarnGaze:Show()
			yellGaze:Yell()
		end
		if self.Options.HudMapOnGaze then
			DBMHudMap:RegisterRangeMarkerOnPartyMember(spellId, "highlight", args.destName, 3, 8, 1, 1, 0, 0.5, nil, true, 1):Pulse(0.5, 0.5)
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	local spellId = args.spellId
	if spellId == 181099 then
		self.vb.DoomTargetCount = self.vb.DoomTargetCount - 1
		if args:IsPlayer() then
			countdownMarkOfDoom:Cancel()
		end
		updateRangeFrame(self)
	elseif spellId == 185147 or spellId == 182212 or spellId == 185175 then--Portals
		self.vb.portalsLeft = self.vb.portalsLeft - 1
		if self.sb.portalsLeft == 0 then
			self.vb.phase = 2
			timerFelHellfireCD:Start(30)
			timerGazeCD:Start(42)
			timerGlaiveComboCD:Start(44)
			timerFelSeekerCD:Start(59)
		end
		if spellId == 185147 then--Doom Lords Portal
			--I'd add a cancel for the Doom Lords here, but since everyone killed this portal first
			--no one ever actually learned what the cooldown was, so no timer to cancel yet!
		elseif spellId == 182212 then--Infernals Portal
			
		elseif spellId == 185175 then--Imps Portal
			timerFelImplosionCD:Cancel()
		end
	elseif spellId == 181597 or spellId == 182006 then
		if self.Options.HudMapOnGaze then
			DBMHudMap:FreeEncounterMarkerByTarget(spellId, args.destName)
		end
	end
end

--Switch to SPELL_SUMMON events if they exist with their associated summon spells. Has to be an event that has GUID, for the timers
function mod:INSTANCE_ENCOUNTER_ENGAGE_UNIT()
	for i = 1, 5 do
		local unitGUID = UnitGUID("boss"..i)
		if unitGUID and not AddsSeen[unitGUID] then
			AddsSeen[unitGUID] = true
			local cid = self:GetCIDFromGUID(unitGUID)
			if cid == 91241 then--Doom Lord
				--timerShadowBoltVolleyCD:Start(nil, unitGUID)
				timerMarkofDoomCD:Start(11, unitGUID)
			end
		end
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 91241 then--Doom Lord
		timerMarkofDoomCD:Cancel(args.destGUID)
		timerShadowBoltVolleyCD:Cancel(args.destGUID)
	end
end

--Todo, verify mythic has no new emotes with guldan's name, if not, just check npc for "Gul'dan"
--This function isn't required by mod, i purposely put start timers on later trigger that doesn't need localizing.
--This just starts phase 3 and 4 earlier, if translation available.
function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg, npc)
	if msg:find(L.felSpire) then
		self.vb.phase = self.vb.phase + 1
		if self.vb.phase == 3 then
			timerFelHellfireCD:Cancel()
			timerShadowForceCD:Cancel()
			countdownShadowForce:Cancel()
			timerGlaiveComboCD:Cancel()
			timerGazeCD:Cancel()
			timerFelSeekerCD:Cancel()
			timerFelHellfireCD:Start(22.9)
			timerShadowForceCD:Start(27.8)
			countdownShadowForce:Start(27.8)
			timerGazeCD:Start(40.5)
			timerGlaiveComboCD:Start(41.2)--I suspect this isn't power based and may be 40.5-41.2
			timerFelSeekerCD:Start(58.1)--^^
		elseif self.vb.phase == 4 then
			timerFelHellfireCD:Cancel()
			timerShadowForceCD:Cancel()
			countdownShadowForce:Cancel()
			timerGlaiveComboCD:Cancel()
			timerGazeCD:Cancel()
			timerFelSeekerCD:Cancel()
			timerFelHellfireCD:Start(13)
			timerShadowForceCD:Start(21.5)
			countdownShadowForce:Start(21.5)
			timerGlaiveComboCD:Start(40.5)--I suspect this isn't power based and may be 40.5-41.2
			timerGazeCD:Start(48)
			timerFelSeekerCD:Start(58.5)--^^
		end
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 181735 then
		specWarnFelSeeker:Show()
		timerFelSeekerCD:Start()
	elseif spellId == 181301 then--Summon Adds (Start Phase 2 imps/Infernal timers)
		self.vb.impCount = 0
		self.vb.infernalCount = 0
		timerFelImplosionCD:Start(27.6, 1)
		timerInfernoCD:Start(53.3, 1)
	elseif spellId == 182262 then--Summon Adds (Start phase 3 Infernals Timers, cancel Imp timers)
		self.vb.infernalCount = 0
		timerFelImplosionCD:Cancel()
		timerInfernoCD:Cancel()
		timerInfernoCD:Start(43.2, 1)
	--Backup phase detection. a bit slower than CHAT_MSG_RAID_BOSS_EMOTE
	elseif spellId == 182263 and self.vb.phase == 2 then--Phase 3
		self.vb.phase = 3
		timerFelHellfireCD:Cancel()
		timerShadowForceCD:Cancel()
		countdownShadowForce:Cancel()
		timerGlaiveComboCD:Cancel()
		timerGazeCD:Cancel()
		timerFelSeekerCD:Cancel()
		timerFelHellfireCD:Start(17.4)
		timerShadowForceCD:Start(22.3)
		countdownShadowForce:Start(22.3)
		timerGazeCD:Start(35)
		timerGlaiveComboCD:Start(35.7)
		timerFelSeekerCD:Start(52.6)
	elseif spellId == 185690 and self.vb.phase == 3 then--Phase 4
		self.vb.phase = 4
		timerFelHellfireCD:Cancel()
		timerShadowForceCD:Cancel()
		countdownShadowForce:Cancel()
		timerGlaiveComboCD:Cancel()
		timerGazeCD:Cancel()
		timerFelSeekerCD:Cancel()
		timerFelHellfireCD:Start(7.5)
		timerShadowForceCD:Start(16)
		countdownShadowForce:Start(16)
		timerGlaiveComboCD:Start(35)
		timerGazeCD:Start(42.5)
		timerFelSeekerCD:Start(53)
	elseif spellId == 181354 then--183377 or 185831 also usable with SPELL_CAST_START but i like this way more, cleaner.
		specWarnGlaiveCombo:Show()
		timerGlaiveComboCD:Start()
	end
end

--[[
function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 173192 and destGUID == UnitGUID("player") and self:AntiSpam(2, 4) then

	end
end
mod.SPELL_ABSORBED = mod.SPELL_PERIODIC_DAMAGE
--]]
