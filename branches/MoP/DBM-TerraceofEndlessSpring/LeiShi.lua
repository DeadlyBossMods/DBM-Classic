local mod	= DBM:NewMod(729, "DBM-TerraceofEndlessSpring", nil, 320)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(62983)--62995 Animated Protector
mod:SetModelID(42811)

mod:RegisterCombat("combat")
mod:RegisterKill("yell", L.Victory)--Kill detection is aweful. No death, no special cast. yell is like 40 seconds AFTER victory. terrible.

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_CAST_START",
	"UNIT_SPELLCAST_SUCCEEDED"
)

--[[
--Not cleanest pull, someone facepulled before starting transcriptor so missed engage event by probably 1 second or so.
"<1.4> [PLAYER_TARGET_CHANGED] -1 Hostile (elite Elemental) - Lei Shi # 0xF130F6070000006C # 62983", -- [1]
"<52.6> [CLEU] SPELL_AURA_APPLIED#false#0xF130F6070000006C#Lei Shi#68168#0#0xF130F6070000006C#Lei Shi#68168#0#123250#Protect#16#BUFF", -- [3472]
"<81.5> [CLEU] SPELL_AURA_REMOVED#false#0xF130F6070000006C#Lei Shi#2632#0#0xF130F6070000006C#Lei Shi#2632#0#123250#Protect#16#BUFF", -- [5799]
"<83.9> [CLEU] SPELL_CAST_START#false#0xF130F6070000006C#Lei Shi#68168#0#0x0000000000000000#nil#-2147483648#-2147483648#123244#Hide#1", -- [5890]
"<115.1> [INSTANCE_ENCOUNTER_ENGAGE_UNIT] Fake Args:#nil#nil#Unknown#0xF130F6070000006C#normal#0#nil#nil#nil#nil#normal#0#nil#nil#nil#nil#normal#0#nil#nil#nil#nil#normal#0#Real Args:", -- [6899]
"<132.0> [CLEU] SPELL_AURA_APPLIED#false#0xF130F6070000006C#Lei Shi#68168#0#0xF130F6070000006C#Lei Shi#68168#0#123461#Get Away!#1#BUFF", -- [7831]
"<149.6> [CLEU] SPELL_AURA_REMOVED#false#0xF130F6070000006C#Lei Shi#68168#0#0xF130F6070000006C#Lei Shi#68168#0#123461#Get Away!#1#BUFF", -- [9155]
"<174.0> [CLEU] SPELL_AURA_APPLIED#false#0xF130F6070000006C#Lei Shi#68168#0#0xF130F6070000006C#Lei Shi#68168#0#123250#Protect#16#BUFF", -- [11124]--+121.4
"<201.8> [CLEU] SPELL_AURA_REMOVED#false#0xF130F6070000006C#Lei Shi#2632#0#0xF130F6070000006C#Lei Shi#2632#0#123250#Protect#16#BUFF", -- [13278]
"<202.9> [CLEU] SPELL_CAST_START#false#0xF130F6070000006C#Lei Shi#68168#0#0x0000000000000000#nil#-2147483648#-2147483648#123244#Hide#1", -- [13315]+119
"<233.9> [INSTANCE_ENCOUNTER_ENGAGE_UNIT] Fake Args:#nil#nil#Unknown#0xF130F6070000006C#normal#0#nil#nil#nil#nil#normal#0#nil#nil#nil#nil#normal#0#nil#nil#nil#nil#normal#0#Real Args:", -- [14168]
"<255.7> [CLEU] SPELL_AURA_APPLIED#false#0xF130F6070000006C#Lei Shi#68168#0#0xF130F6070000006C#Lei Shi#68168#0#123461#Get Away!#1#BUFF", -- [15500]--+123.7
"<269.5> [CLEU] SPELL_AURA_REMOVED#false#0xF130F6070000006C#Lei Shi#68168#0#0xF130F6070000006C#Lei Shi#68168#0#123461#Get Away!#1#BUFF", -- [16722]
"<295.3> [CLEU] SPELL_AURA_APPLIED#false#0xF130F6070000006C#Lei Shi#68168#0#0xF130F6070000006C#Lei Shi#68168#0#123250#Protect#16#BUFF", -- [18587]--+121.3
"<326.6> [CLEU] SPELL_AURA_REMOVED#false#0xF130F6070000006C#Lei Shi#2632#0#0xF130F6070000006C#Lei Shi#2632#0#123250#Protect#16#BUFF", -- [21030]
"<328.6> [CLEU] SPELL_AURA_APPLIED#false#0xF130F6070000006C#Lei Shi#68168#0#0xF130F6070000006C#Lei Shi#68168#0#123461#Get Away!#1#BUFF", -- [21115]+72.9
"<343.6> [CLEU] SPELL_AURA_REMOVED#false#0xF130F6070000006C#Lei Shi#68168#0#0xF130F6070000006C#Lei Shi#68168#0#123461#Get Away!#1#BUFF", -- [22277]
"<381.9> [CLEU] SPELL_CAST_START#false#0xF130F6070000006C#Lei Shi#68168#0#0x0000000000000000#nil#-2147483648#-2147483648#123244#Hide#1", -- [24917]--+179
"<403.9> [INSTANCE_ENCOUNTER_ENGAGE_UNIT] Fake Args:#nil#nil#Unknown#0xF130F6070000006C#normal#0#nil#nil#nil#nil#normal#0#nil#nil#nil#nil#normal#0#nil#nil#nil#nil#normal#0#Real Args:", -- [25624]
--]]
local warnProtect						= mod:NewSpellAnnounce(123250, 2)
local warnHide							= mod:NewSpellAnnounce(123244, 3)
local warnHideOver						= mod:NewAnnounce("warnHideOver", 2, 123244)--Because we can. with creativeness, the boss returning is detectable a full 1-2 seconds before even visible. A good signal to stop aoe and get ready to return norm DPS
local warnGetAway						= mod:NewSpellAnnounce(123461, 3)

local specWarnAnimatedProtector			= mod:NewSpecialWarningSwitch("ej6224", not mod:IsHealer())
local specWarnHide						= mod:NewSpecialWarningSpell(123244, nil, nil, nil, true)
local specWarnGetAway					= mod:NewSpecialWarningSpell(123461, nil, nil, nil, true)
local specWarnSpray						= mod:NewSpecialWarningStack(123121, mod:IsTank(), 12)--Not sure what's too big of a number yet. Fight was a bit undertuned.
local specWarnSprayOther				= mod:NewSpecialWarningTarget(123121, mod:IsTank())--Not sure what's too big of a number yet. Fight was a bit undertuned.

local timerProtectCD					= mod:NewNextTimer(121, 123250)--Only thing that has a predictable Cd. Hide and Get away are random, one will be cast immediately after protect ends, other some time (random, after it)
local timerSpray						= mod:NewTargetTimer(10, 123121)--Not worth adding yet, it only lasts like 4 seconds, blizzard needs to buff this to make it relevant to tanks.

function mod:OnCombatStart(delay)
	timerProtectCD:Start(52-delay)--May be off 1-2 sec.
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(123250) then
		warnProtect:Show()
		specWarnAnimatedProtector:Show()
		timerProtectCD:Start()
	elseif args:IsSpellID(123461) then
		warnGetAway:Show()
		specWarnGetAway:Show()
	elseif args:IsSpellID(123121) then
		timerSpray:Start(args.destName)
		if args:IsPlayer() and (args.amount or 1) >= 12 then
			specWarnSpray:Show(args.amount)
		else
			if (args.amount or 1) >= 12 and not UnitDebuff("player", GetSpellInfo(123121)) and not UnitIsDeadOrGhost("player") then--Other tank has 2 or more sunders and you have none.
				specWarnSprayOther:Show(args.destName)--So nudge you to taunt it off other tank already.
			end
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(123121) then
		timerSpray:Cancel(args.destName)
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(123244) then
		warnHide:Show()
		specWarnHide:Show()
		self:RegisterShortTermEvents(
			"INSTANCE_ENCOUNTER_ENGAGE_UNIT"--We register on hide, because it also fires just before hide, every time and don't want to trigger "hide over" at same time as hide.
		)
	end
end

--Fires twice when boss returns, once BEFORE visible (and before we can detect unitID, so it flags unknown), then once a 2nd time after visible
--"<233.9> [INSTANCE_ENCOUNTER_ENGAGE_UNIT] Fake Args:#nil#nil#Unknown#0xF130F6070000006C#normal#0#nil#nil#nil#nil#normal#0#nil#nil#nil#nil#normal#0#nil#nil#nil#nil#normal#0#Real Args:", -- [14168]
function mod:INSTANCE_ENCOUNTER_ENGAGE_UNIT(event)
	self:UnregisterShortTermEvents()--Once boss appears, unregister event, so we ignore the next two that will happen, which will be 2nd time after reappear, and right before next Hide.
	warnHideOver:Show(GetSpellInfo(123244))
end
