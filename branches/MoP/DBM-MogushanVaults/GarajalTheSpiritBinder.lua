local mod	= DBM:NewMod(682, "DBM-MogushanVaults", nil, 317)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(60143)
mod:SetModelID(41256)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"SPELL_CAST_SUCCESS",
	"UNIT_SPELLCAST_SUCCEEDED"
)

--NOTES
--Syncing is used for all warnings because the realms don't share combat events. You won't get warnings for other realm any other way.
--Voodoo dolls do not have a CD, they are linked to banishment, when he banishes current tank, he reapplies voodoo dolls to new tank and new players. If tank dies, he just recasts voodoo on a new current threat target.
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
local timerBanishmentCD					= mod:NewNextTimer(65, 116272)
local timerSoulSever					= mod:NewBuffFadesTimer(30, 116278)--Tank version of spirit realm
local timerSpiritualInnervation			= mod:NewBuffFadesTimer(30, 117549)--Dps version of spirit realm
local timerShadowyAttackCD				= mod:NewCDTimer(8, "ej9999")--Unknown ID, arta's database is 3 months old and my DBC tools aren't worth a shit or current either.

local voodooDollTargets = {}
local spiritualInnervationTargets = {}

local function warnVoodooDollTargets()
	warnVoodooDolls:Show(table.concat(voodooDollTargets, "<, >"))
	specWarnVoodooDolls:Show()
	table.wipe(voodooDollTargets)
end

local function warnSpiritualInnervationTargets()
	warnSpiritualInnervation:Show(table.concat(spiritualInnervationTargets, "<, >"))
	table.wipe(spiritualInnervationTargets)
end

function mod:OnCombatStart(delay)
	table.wipe(voodooDollTargets)
	table.wipe(spiritualInnervationTargets)
	timerShadowyAttackCD:start(7-delay)
	timerTotemCD:Start(-delay)
	timerBanishmentCD:Start(-delay)
end

function mod:SPELL_AURA_APPLIED(args)--We don't use spell cast success for actual debuff on >player< warnings since it has a chance to be resisted.
	if args:IsSpellID(122151) then
		self:SendSync("VoodooTargets", args.destName)
	elseif args:IsSpellID(117549) then
		if args:IsPlayer() then--no latency check for personal notice you aren't syncing.
			timerSpiritualInnervation:Start()
			warnSuicide:Schedule(25)
		end
		if self:LatencyCheck() then
			self:SendSync("SpiritualTargets", args.destName)
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
			self:SendSync("BanishmentTarget", args.destName)
		end
	end
end

function mod:OnSync(msg, target)
	if msg == "SummonTotem" then
		warnTotem:Show()
		specWarnTotem:Show()
		timerTotemCD:Start()
	elseif msg == "VoodooTargets" and target then
		voodooDollTargets[#voodooDollTargets + 1] = target
		self:Unschedule(warnVoodooDollTargets)
		self:Schedule(0.3, warnVoodooDollTargets)
	elseif msg == "SpiritualTargets" and target then
		spiritualInnervationTargets[#spiritualInnervationTargets + 1] = target
		self:Unschedule(warnSpiritualInnervationTargets)
		self:Schedule(0.3, warnSpiritualInnervationTargets)
	elseif msg == "BanishmentTarget" and target then
		warnBanishment:Show(target)
		timerBanishmentCD:Start()
		if target ~= UnitName("player") then--make sure YOU aren't target before warning "other"
			specWarnBanishmentOther:Show(target)
		end
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if (spellId == 117215 or spellId == 117218 or spellId == 117219 or spellId == 117222) and self:AntiSpam(2, 1) then--Shadowy Attacks
		timerShadowyAttackCD:Start()
	end
end
