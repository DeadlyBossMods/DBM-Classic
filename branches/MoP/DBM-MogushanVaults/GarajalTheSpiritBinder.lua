local mod	= DBM:NewMod(682, "DBM-MogushanVaults", nil, 317)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(60143)
mod:SetModelID(41256)
mod:SetZone()
mod:SetUsedIcons(5, 6, 7, 8)
mod:SetMinSyncRevision(7733)

-- Sometimes it fails combat detection on "combat". Use yell instead until the problem being founded.
--I'd REALLY like to see some transcriptor logs that prove your bug, i pulled this boss like 20 times, on 25 man, 100% functional engage trigger, not once did this mod fail to start, on 25 man or 10 man.
--seems that combat detection fails only in lfr. (like DS Zonozz Void of Unmaking summon event.)
--"<102.8> [INSTANCE_ENCOUNTER_ENGAGE_UNIT] Fake Args:#1#1#Gara'jal the Spiritbinder#0xF150EAEF00000F5A#elit
--"<103.1> [CHAT_MSG_MONSTER_YELL] CHAT_MSG_MONSTER_YELL#It be dyin' time, now!#Gara'jal the Spiritbinder#####0#0##0#862##0#false#false", -- [291]
mod:RegisterCombat("yell", L.Pull)

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"SPELL_CAST_SUCCESS",
	"UNIT_SPELLCAST_SUCCEEDED"
)

--NOTES
--Syncing is used for all warnings because the realms don't share combat events. You won't get warnings for other realm any other way.
--Voodoo dolls do not have a CD, they are linked to banishment (or player deaths), when he banishes current tank, he reapplies voodoo dolls to new tank and new players. If tank dies, he just recasts voodoo on a new current threat target.
--Latency checks are used for good reason (to prevent lagging users from sending late events and making our warnings go off again incorrectly). if you play with high latency and want to bypass latency check, do so with in game GUI option.
local warnTotem							= mod:NewSpellAnnounce(116174, 2)
local warnVoodooDolls					= mod:NewTargetAnnounce(122151, 3)
local warnSpiritualInnervation			= mod:NewTargetAnnounce(117549, 3)
local warnBanishment					= mod:NewTargetAnnounce(116272, 3)
local warnSuicide						= mod:NewPreWarnAnnounce(116325, 5, 4)--Pre warn 5 seconds before you die so you take whatever action you need to, to prevent. (this is effect that happens after 30 seconds of Soul Sever

local specWarnTotem						= mod:NewSpecialWarningSpell(116174, false)
local specWarnBanishment				= mod:NewSpecialWarningYou(116272)
local specWarnBanishmentOther			= mod:NewSpecialWarningTarget(116272, mod:IsTank())
local specWarnVoodooDolls				= mod:NewSpecialWarningSpell(122151, false)

local timerTotemCD						= mod:NewNextTimer(36, 116174)
local timerBanishmentCD					= mod:NewNextTimer(70, 116272)
local timerSoulSever					= mod:NewBuffFadesTimer(30, 116278)--Tank version of spirit realm
local timerSpiritualInnervation			= mod:NewBuffFadesTimer(30, 117549)--Dps version of spirit realm
local timerShadowyAttackCD				= mod:NewCDTimer(8, "ej6698", nil, nil, nil, 117222)

mod:AddBoolOption("SetIconOnVoodoo")

local uName = {}
local voodooDollTargets = {}
local spiritualInnervationTargets = {}
local voodooDollTargetIcons = {}

local function buildUName()
	table.wipe(uName)
	for i = 1, GetNumGroupMembers() do
		local name, realm = nil
		name, realm = UnitName("raid"..i)
		if realm then name = name.."-"..realm end
		uName["raid"..i] = name
	end	
end

local function warnVoodooDollTargets()
	warnVoodooDolls:Show(table.concat(voodooDollTargets, "<, >"))
	specWarnVoodooDolls:Show()
	table.wipe(voodooDollTargets)
end

local function warnSpiritualInnervationTargets()
	warnSpiritualInnervation:Show(table.concat(spiritualInnervationTargets, "<, >"))
	table.wipe(spiritualInnervationTargets)
end

--[[
local function ClearVoodooTargets()
	table.wipe(voodooDollTargetIcons)
end--]]

do
	local function sort_by_group(v1, v2)
		-- This function seems to broken in cross-realm raid.
		-- first parameter of UnitName returns only UnitName on other server players. but GetRaidSubgroup return value includes servernames.
		-- I think it's better that check servernames, because player can be same name on other servers.
		return DBM:GetRaidSubgroup(UnitName(v1)) < DBM:GetRaidSubgroup(UnitName(v2))
	end
	function mod:SetVoodooIcons()
		if DBM:GetRaidRank() > 0 then
			table.sort(voodooDollTargetIcons, sort_by_group)
			local voodooIcon = 8
			for i, v in ipairs(voodooDollTargetIcons) do
				-- DBM:SetIcon() is used because of follow reasons
				--1. It checks to make sure you're on latest dbm version, if you are not, it disables icon setting so you don't screw up icons (ie example, a newer version of mod does icons differently)
				--2. It checks global dbm option "DontSetIcons"
				self:SetIcon(nil, voodooIcon, nil, v)
				voodooIcon = voodooIcon - 1
			end
--			self:Schedule(1.5, ClearVoodooTargets)--Table wipe delay so if icons go out too early do to low fps or bad latency, when they get new target on table, resort and reapplying should auto correct teh icon within .2-.4 seconds at most.
		end
	end
end

function mod:OnCombatStart(delay)
	buildUName()
	table.wipe(voodooDollTargets)
	table.wipe(spiritualInnervationTargets)
	table.wipe(voodooDollTargetIcons)
	timerShadowyAttackCD:Start(7-delay)
	timerTotemCD:Start(-delay)
	timerBanishmentCD:Start(-delay)
end

function mod:SPELL_AURA_APPLIED(args)--We don't use spell cast success for actual debuff on >player< warnings since it has a chance to be resisted.
	if args:IsSpellID(122151) then
		self:SendSync("VoodooTargets", DBM:GetRaidUnitId(args.destName))
	elseif args:IsSpellID(117549) then
		if args:IsPlayer() then--no latency check for personal notice you aren't syncing.
			timerSpiritualInnervation:Start()
			warnSuicide:Schedule(25)
		end
		if self:LatencyCheck() then
			self:SendSync("SpiritualTargets", DBM:GetRaidUnitId(args.destName))
		end
	elseif args:IsSpellID(116278) then
		if args:IsPlayer() then--no latency check for personal notice you aren't syncing.
			timerSoulSever:Start()
			warnSuicide:Schedule(25)
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)--We don't use spell cast success for actual debuff on >player< warnings since it has a chance to be resisted.
	if args:IsSpellID(117549) and args:IsPlayer() then
		timerSpiritualInnervation:Cancel()
		warnSuicide:Cancel()
	elseif args:IsSpellID(116278) and args:IsPlayer() then
		timerSoulSever:Cancel()
		warnSuicide:Cancel()
	elseif args:IsSpellID(122151) then
		self:SendSync("VoodooGoneTargets", DBM:GetRaidUnitId(args.destName))
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(116174) and self:LatencyCheck() then
		self:SendSync("SummonTotem")
	elseif args:IsSpellID(116272) then
		if args:IsPlayer() then--no latency check for personal notice you aren't syncing.
			specWarnBanishment:Show()
		end
		if self:LatencyCheck() then
			self:SendSync("BanishmentTarget", DBM:GetRaidUnitId(args.destName))
		end
	end
end

function mod:OnSync(msg, uId)
	if msg == "SummonTotem" then
		warnTotem:Show()
		specWarnTotem:Show()
		if self:IsDifficulty("lfr25") then
			timerTotemCD:Start(20.5)
		else
			timerTotemCD:Start()
		end
	elseif msg == "VoodooTargets" and uId then
		voodooDollTargets[#voodooDollTargets + 1] = uName[uId]
		self:Unschedule(warnVoodooDollTargets)
		self:Schedule(0.3, warnVoodooDollTargets)
		if self.Options.SetIconOnVoodoo then
			table.insert(voodooDollTargetIcons, uId)
			self:UnscheduleMethod("SetVoodooIcons")
			if self:LatencyCheck() then--lag can fail the icons so we check it before allowing.
				self:ScheduleMethod(0.5, "SetVoodooIcons")--Still seems touchy and .3 is too fast even on a 70ms connection in rare cases so back to .5
			end
		end
	elseif msg == "VoodooGoneTargets" and uId then
		table.remove(voodooDollTargetIcons, uId)
		if self.Options.SetIconOnVoodoo then
			self:SetIcon(nil, 10, nil, uId)
		end
	elseif msg == "SpiritualTargets" and uId then
		spiritualInnervationTargets[#spiritualInnervationTargets + 1] = uName[uId]
		self:Unschedule(warnSpiritualInnervationTargets)
		self:Schedule(0.3, warnSpiritualInnervationTargets)
	elseif msg == "BanishmentTarget" and uId then
		warnBanishment:Show(uName[uId])
		timerBanishmentCD:Start()
		if uName[uId] ~= UnitName("player") then--make sure YOU aren't target before warning "other"
			specWarnBanishmentOther:Show(uName[uId])
		end
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if (spellId == 117215 or spellId == 117218 or spellId == 117219 or spellId == 117222) and self:AntiSpam(2, 1) then--Shadowy Attacks
		timerShadowyAttackCD:Start()
	end
end
