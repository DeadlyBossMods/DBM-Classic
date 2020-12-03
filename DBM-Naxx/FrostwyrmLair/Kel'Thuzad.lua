local mod	= DBM:NewMod("Kel'Thuzad", "DBM-Naxx", 5)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(15990)
mod:SetEncounterID(1114)
--mod:SetModelID(15945)--Doesn't work at all, doesn't even render.
mod:SetMinCombatTime(60)
mod:SetUsedIcons(1, 2, 3, 4, 5, 6, 7, 8)

mod:RegisterCombat("combat_yell", L.Yell)

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 27808 27819 28410",
	"SPELL_AURA_REMOVED 28410",
	"SPELL_CAST_SUCCESS 27810 27819 27808",
	"UNIT_HEALTH mouseover target",
	"UNIT_TARGETABLE_CHANGED"
)

--[[
ability.id = 27810 or ability.id = 27819 or ability.id = 27808 and type = "cast"
 or (source.type = "NPC" and source.firstSeen = timestamp) or (target.type = "NPC" and target.firstSeen = timestamp)
--]]
local warnAddsSoon			= mod:NewAnnounce("warnAddsSoon", 1, "134321")
local warnPhase2			= mod:NewPhaseAnnounce(2, 3)
local warnBlastTargets		= mod:NewTargetAnnounce(27808, 2)
local warnFissure			= mod:NewSpellAnnounce(27810, 4, nil, nil, nil, nil, nil, 2)
local warnMana				= mod:NewTargetAnnounce(27819, 2)
local warnChainsTargets		= mod:NewTargetNoFilterAnnounce(28410, 4)

local specwarnP2Soon		= mod:NewSpecialWarning("specwarnP2Soon")
local specWarnManaBomb		= mod:NewSpecialWarningMoveAway(27819, nil, nil, nil, 1, 2)
local specWarnBlast			= mod:NewSpecialWarningTarget(27808, "Healer", nil, nil, 1, 2)
local yellManaBomb			= mod:NewShortYell(27819)

--Fissure timer is 13-30 or something pretty wide, so no timer
local timerManaBomb			= mod:NewCDTimer(20, 27819, nil, nil, nil, 3)--20-50 (still true in vanilla, kind of shitty variation too)
local timerFrostBlastCD		= mod:NewCDTimer(33.5, 27808, nil, nil, nil, 3, nil, DBM_CORE_L.DEADLY_ICON)--33-46
local timerfrostBlast		= mod:NewBuffActiveTimer(4, 27808, nil, nil, nil, 5, nil, DBM_CORE_L.HEALER_ICON)
local timerMC				= mod:NewBuffActiveTimer(20, 28410, nil, nil, nil, 3)
--local timerMCCD			= mod:NewCDTimer(90, 28410, nil, nil, nil, 3)--actually 60 second cdish but its easier to do it this way for the first one.
local timerPhase2			= mod:NewTimer(305, "TimerPhase2", "136116", nil, nil, 6)

mod:AddSetIconOption("SetIconOnMC", 28410, true, false, {1, 2, 3})
mod:AddSetIconOption("SetIconOnManaBomb", 27819, false, false, {8})
mod:AddSetIconOption("SetIconOnFrostTomb", 27808, true, false, {1, 2, 3, 4, 5, 6, 7, 8})
mod:AddRangeFrameOption(10, 27819)

mod.vb.phase = 1
mod.vb.warnedAdds = false
mod.vb.MCIcon = 1
local frostBlastTargets = {}
local chainsTargets = {}

local function AnnounceChainsTargets(self)
	warnChainsTargets:Show(table.concat(chainsTargets, "< >"))
	table.wipe(chainsTargets)
	self.vb.MCIcon = 1
end

local function AnnounceBlastTargets(self)
	if self.Options.SpecWarn27808target then
		specWarnBlast:Show(table.concat(frostBlastTargets, "< >"))
		specWarnBlast:Play("healall")
	else
		warnBlastTargets:Show(table.concat(frostBlastTargets, "< >"))
	end
	timerfrostBlast:Start(3.5)
	if self.Options.SetIconOnFrostTomb then
		for i = #frostBlastTargets, 1, -1 do
			self:SetIcon(frostBlastTargets[i], 8 - i, 4.5)
			frostBlastTargets[i] = nil
		end
	end
end

local function RangeToggle(show)
	if show then
		DBM.RangeCheck:Show(10)
	else
		DBM.RangeCheck:Hide()
	end
end

function mod:OnCombatStart(delay)
	self.vb.phase = 1
	table.wipe(chainsTargets)
	table.wipe(frostBlastTargets)
	self.vb.warnedAdds = false
	self.vb.MCIcon = 1
	specwarnP2Soon:Schedule(295-delay)
	timerPhase2:Start()
	warnPhase2:Schedule(305)
	if self.Options.ShowRange then
		self:Schedule(305-delay, RangeToggle, true)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

do
	local ShadowFissure, ManaBomb, FrostBlast, ChainsofKT = DBM:GetSpellInfo(27810), DBM:GetSpellInfo(27819), DBM:GetSpellInfo(27808), DBM:GetSpellInfo(28410)
	function mod:SPELL_CAST_SUCCESS(args)
		--if args.spellId == 27810 then
		if args.spellName == ShadowFissure then
			warnFissure:Show()
			warnFissure:Play("watchstep")
		--elseif args.spellId == 27819 then
		elseif args.spellName == ManaBomb then
			timerManaBomb:Start()
		--elseif args.spellId == 27808 then
		elseif args.spellName == FrostBlast then
			timerFrostBlastCD:Start()
		end
	end

	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 27808 then -- Frost Blast
		if args.spellName == FrostBlast then
			table.insert(frostBlastTargets, args.destName)
			self:Unschedule(AnnounceBlastTargets)
			self:Schedule(0.5, AnnounceBlastTargets, self)
		--elseif args.spellId == 27819 then -- Mana Bomb
		elseif args.spellName == ManaBomb then
			if self.Options.SetIconOnManaBomb then
				self:SetIcon(args.destName, 8, 5.5)
			end
			if args:IsPlayer() then
				specWarnManaBomb:Show()
				specWarnManaBomb:Play("scatter")
				yellManaBomb:Yell()
			else
				warnMana:Show(args.destName)
			end
		--elseif args.spellId == 28410 then -- Chains of Kel'Thuzad
		elseif args.spellName == ChainsofKT then
			chainsTargets[#chainsTargets + 1] = args.destName
			if self:AntiSpam() then
				timerMC:Start()
				--timerMCCD:Start(60)--60 seconds?
			end
			if self.Options.SetIconOnMC then
				self:SetIcon(args.destName, self.vb.MCIcon)
			end
			self.vb.MCIcon = self.vb.MCIcon + 1
			self:Unschedule(AnnounceChainsTargets)
			if #chainsTargets >= 5 then--Not sure max targets on 40 man but def more than 3, looked like 5
				AnnounceChainsTargets(self)
			else
				self:Schedule(1.0, AnnounceChainsTargets, self)
			end
		end
	end

	function mod:SPELL_AURA_REMOVED(args)
		--if args.spellId == 28410 then
		if args.spellName == ChainsofKT then
			if self.Options.SetIconOnMC then
				self:SetIcon(args.destName, 0)
			end
		end
	end
end

function mod:UNIT_HEALTH(uId)
	if not self.vb.warnedAdds and self:GetUnitCreatureId(uId) == 15990 and UnitHealth(uId) / UnitHealthMax(uId) <= 0.48 then
		self.vb.warnedAdds = true
		warnAddsSoon:Show()
	end
end

--Classic probably won't have UNIT_TARGETABLE_CHANGED, so backups are in place
function mod:UNIT_TARGETABLE_CHANGED()
	if self.vb.phase == 1 then
		self:Unschedule(RangeToggle)
		warnPhase2:Cancel()
		self.vb.phase = 2
		warnPhase2:Show()
		warnPhase2:Play("ptwo")
		if self.Options.RangeFrame then
			DBM.RangeCheck:Show(10)
		end
	end
end
