local mod	= DBM:NewMod(742, "DBM-TerraceofEndlessSpring", nil, 320)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(62442)--62919 Unstable Sha, 62969 Embodied Terror
mod:SetModelID(42832)

mod:RegisterCombat("combat")
mod:RegisterKill("yell", L.Victory)

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_CAST_START",
	"RAID_BOSS_EMOTE",
	"UNIT_SPELLCAST_SUCCEEDED"
)

local warnNight							= mod:NewSpellAnnounce("ej6310", 2, 108558)
local warnSunbeam						= mod:NewSpellAnnounce(122789, 3)
local warnShadowBreath					= mod:NewSpellAnnounce(122752, 3)
local warnNightmares					= mod:NewSpellAnnounce(122770, 3)--maybe target scanning will work on this trigger?
local warnDarkOfNight					= mod:NewSpellAnnounce("ej6550", 4, 130013)--Heroic
local warnDay							= mod:NewSpellAnnounce("ej6315", 2, 122789)
local warnSummonUnstableSha				= mod:NewSpellAnnounce("ej6320", 3, 122953)--needs some Sha like icon.
local warnSummonEmbodiedTerror			= mod:NewSpellAnnounce("ej6316", 4)--needs some Sha like icon.
local warnTerrorize						= mod:NewTargetAnnounce(123012, 4, nil, mod:IsHealer())
local warnSunBreath						= mod:NewSpellAnnounce(122855, 3)
local warnLightOfDay					= mod:NewSpellAnnounce("ej6551", 4, 123716, mod:IsHealer())--Heroic

local specWarnShadowBreath				= mod:NewSpecialWarningSpell(122752, mod:IsTank())
local specWarnDreadShadows				= mod:NewSpecialWarningStack(122768, nil, 6)--For heroic, 10 is unhealable, and it stacks pretty fast so adaquate warning to get over there would be abou 5-6
local specWarnDarkOfNight				= mod:NewSpecialWarningSwitch("ej6550", mod:IsDps())
local specWarnTerrorize					= mod:NewSpecialWarningDispel(123012, mod:IsHealer())
local specWarnLightOfDay				= mod:NewSpecialWarningSpell("ej6551", mod:IsHealer())

local timerNightCD						= mod:NewNextTimer(121, "ej6310")
local timerSunbeamCD					= mod:NewCDTimer(41, 122789)
local timerShadowBreathCD				= mod:NewCDTimer(28, 122752, nil, mod:IsTank() or mod:IsHealer())
local timerNightmaresCD					= mod:NewCDTimer(15.5, 122770)
local timerDarkOfNightCD				= mod:NewCDTimer(30.5, "ej6550", nil, nil, nil, 130013)
local timerDayCD						= mod:NewNextTimer(121, "ej6315")
local timerSummonUnstableShaCD			= mod:NewCDTimer(18, "ej6320")
local timerSummonEmbodiedTerrorCD		= mod:NewCDTimer(41, "ej6316")
local timerTerrorizeCD					= mod:NewNextTimer(14, 123012)--Besides being cast 14 seconds after they spawn, i don't know if they recast it if they live too long, their health was too undertuned to find out.
local timerSunBreathCD					= mod:NewCDTimer(29, 122855, nil, mod:IsHealer())
--local timerLightOfDayCD					= mod:NewCDTimer(30.5, "ej6551", nil, mod:IsHealer(), nil, 123716)--Don't have timing for this yet, logs i was sent always wiped VERy early in light phase.

local terrorName = EJ_GetSectionInfo(6316)

function mod:OnCombatStart(delay)
	warnShadowBreath:Start(8.5-delay)
	timerNightmaresCD:Start(13.5-delay)
	timerDayCD:Start(-delay)
	if self:IsDifficulty("heroic10", "heroic25") then
		timerDarkOfNightCD:Start(10-delay)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(122768) then
		if args:IsPlayer() and (args.amount or 1) >= 6 then
			specWarnDreadShadows:Show(args.amount)
		end
	elseif args:IsSpellID(123012) and args:GetDestCreatureID() == 42832 then
		warnTerrorize:Show(args.destName)
		specWarnTerrorize:Show(args.destName)
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(122752) then
		warnShadowBreath:Show()
		timerShadowBreathCD:Start()
	elseif args:IsSpellID(122855) then
		warnSunBreath:Show()
		timerSunBreathCD:Start()
	end
end

function mod:RAID_BOSS_EMOTE(msg)
	if msg == L.Sunbeam or msg:find(L.Sunbeam) then
		timerSunbeamCD:Start()
	elseif msg:find(terrorName) then
		timerTerrorizeCD:Start()--always cast 14-15 seconds after one spawns.
		warnSummonEmbodiedTerror:Show()
		timerSummonEmbodiedTerrorCD:Start()
	end
end

function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	if spellId == 122770 and self:AntiSpam(2, 1) then--Nightmares (Night Phase)
		warnNightmares:Show()
		timerNightmaresCD:Start()
	elseif spellId == 123252 and self:AntiSpam(2, 2) then--Dread Shadows Cancel (Sun Phase)
		timerShadowBreathCD:Cancel()
		timerSunbeamCD:Cancel()
		timerNightmaresCD:Cancel()
		timerDarkOfNightCD:Cancel()
		warnDay:Show()
		timerSunBreathCD:Start()
		timerNightCD:Start()
	elseif spellId == 122953 and self:AntiSpam(2, 1) then--Summon Unstable Sha (122946 is another ID, but it always triggers at SAME time as Dread Shadows Cancel so can just trigger there too without additional ID scanning.
		warnSummonUnstableSha:Show()
		timerSummonUnstableShaCD:Start()
	elseif spellId == 122767 and self:AntiSpam(2, 2) then--Dread Shadows (Night Phase)
		timerSummonUnstableShaCD:Cancel()
		timerSummonEmbodiedTerrorCD:Cancel()
		timerSunBreathCD:Cancel()
--		timerLightOfDayCD:Cancel()
		warnNight:Show()
		timerShadowBreathCD:Start(10)
		timerNightmaresCD:Start(16)
		timerDayCD:Start()
		if self:IsDifficulty("heroic10", "heroic25") then
--			timerDarkOfNightCD:Start(10-delay)--Not enough information yet, no logs of this phase starting anywhere but combat start, and those timers differ. This might have first cast IMMEDIATELY on phase start like day does
		end
	elseif spellId == 123813 and self:AntiSpam(2, 3) then--The Dark of Night (Night Phase)
		warnDarkOfNight:Show()
		specWarnDarkOfNight:Show()
		timerDarkOfNightCD:Start()
	elseif spellId == 123816 and self:AntiSpam(2, 3) then--The Light of Day (Day Phase)
		warnLightOfDay:Show()
		specWarnLightOfDay:Show()
--		timerLightOfDayCD:Start()
	end
end
