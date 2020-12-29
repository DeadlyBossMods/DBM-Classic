-- this file uses the texture Textures/arrow.tga. This image was created by Everaldo Coelho and is licensed under the GNU Lesser General Public License. See Textures/lgpl.txt.
local mod	= DBM:NewMod("Thaddius", "DBM-Naxx", 2)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(15928)
mod:SetEncounterID(1120)
mod:SetModelID(16137)
mod:RegisterCombat("combat_yell", L.Yell)

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 28089",
	"CHAT_MSG_MONSTER_EMOTE",
	"UNIT_AURA player"
)

--TODO, UNIT_AURA might not work in classic? I didn't see any warnings on stream. May have to just do UnitDebuff() on self when cast finishes
local warnShiftSoon			= mod:NewSoonAnnounce(28089, 5, 3)
local warnShiftCasting		= mod:NewCastAnnounce(28089, 4)
local warnChargeChanged		= mod:NewSpecialWarning("WarningChargeChanged")
local warnChargeNotChanged	= mod:NewSpecialWarning("WarningChargeNotChanged", false)
local warnThrow				= mod:NewSpellAnnounce(28338, 2)
local warnThrowSoon			= mod:NewSoonAnnounce(28338, 1)

local enrageTimer			= mod:NewBerserkTimer(305)
local timerNextShift		= mod:NewCDTimer(25.9, 28089, nil, nil, nil, 2, nil, DBM_CORE_L.DEADLY_ICON)--25.9-34
local timerShiftCast		= mod:NewCastTimer(3, 28089, nil, nil, nil, 5)
local timerThrow			= mod:NewCDTimer(20.6, 28338, nil, nil, nil, 5, nil, DBM_CORE_L.TANK_ICON)

mod:AddDropdownOption("ArrowsEnabled", {"Never", "TwoCamp", "ArrowsRightLeft", "ArrowsInverse"}, "ArrowsRightLeft", "misc")

local currentCharge
mod.vb.phase = 1
local down = 0

function mod:OnCombatStart(delay)
	self.vb.phase = 1
	currentCharge = nil
	down = 0
	self:ScheduleMethod(40.6 - delay, "TankThrow")
	timerThrow:Start(-delay)
	warnThrowSoon:Schedule(37.6 - delay)
end

function mod:OnCombatEnd(wipe, isSecondRun)
	if wipe and not isSecondRun then
		DBM:AddMsg("Arrow Options can be changed for this encounter. Mod supports 3 different strats. Choose one that matches your strat")
	end
end

local lastShift = 0
do
	local PolarityShift = DBM:GetSpellInfo(28089)
	function mod:SPELL_CAST_START(args)
		--if args.spellId == 28089 then
		if args.spellName == PolarityShift then
			self.vb.phase = 2
			timerNextShift:Start()
			timerShiftCast:Start()
			warnShiftCasting:Show()
			warnShiftSoon:Schedule(20)
			lastShift = GetTime()
		end
	end
end

function mod:UNIT_AURA()
	if self.vb.phase ~=2 or (GetTime() - lastShift) > 5 or (GetTime() - lastShift) < 3 then return end
	local charge
	local i = 1
	while DBM:UnitDebuff("player", i) do
		local _, icon, count = DBM:UnitDebuff("player", i)
		if icon == "Interface\\Icons\\Spell_ChargeNegative" or icon == 135768 then--Not sure if classic will return data ID or path, so include both
			if count > 1 then return end
			charge = L.Charge1
		elseif icon == "Interface\\Icons\\Spell_ChargePositive" or icon == 135769 then--Not sure if classic will return data ID or path, so include both
			if count > 1 then return end
			charge = L.Charge2
		end
		i = i + 1
	end
	if charge then
		lastShift = 0
		--Did not Change
		if charge == currentCharge then
			warnChargeNotChanged:Show()
			if self.Options.ArrowsEnabled == "ArrowsInverse" then
				self:ShowLeftArrow()
			elseif self.Options.ArrowsEnabled == "ArrowsRightLeft" then
				self:ShowRightArrow()
			end
		--Changed
		else
			warnChargeChanged:Show(charge)
			if self.Options.ArrowsEnabled == "ArrowsInverse" then
				self:ShowRightArrow()
			elseif self.Options.ArrowsEnabled == "ArrowsRightLeft" then
				self:ShowLeftArrow()
			elseif self.Options.ArrowsEnabled == "TwoCamp" then
				self:ShowUpArrow()
			end
		end
		currentCharge = charge
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L.Emote or msg == L.Emote2 then
		down = down + 1
		if down >= 2 then
			self:UnscheduleMethod("TankThrow")
			timerThrow:Cancel()
			warnThrowSoon:Cancel()
			enrageTimer:Start()
		end
	end
end

function mod:TankThrow()
	if not self:IsInCombat() or self.vb.phase == 2 then
		return
	end
	timerThrow:Start()
	warnThrowSoon:Schedule(37.6)
	self:ScheduleMethod(40.6, "TankThrow")
end

local function arrowOnUpdate(self, elapsed)
	self.elapsed = (self.elapsed or 0) + elapsed
	if self.elapsed >= 3.5 and self.elapsed < 4.5 then
		self:SetAlpha(4.5 - self.elapsed)
	elseif self.elapsed >= 4.5 then
		self:Hide()
	end
end

local function arrowOnShow(self)
	self.elapsed = 0
	self:SetAlpha(1)
end

local arrowLeft = CreateFrame("Frame", nil, UIParent)
arrowLeft:Hide()
local arrowLeftTexture = arrowLeft:CreateTexture(nil, "BACKGROUND")
arrowLeftTexture:SetTexture("Interface\\AddOns\\DBM-Naxx\\ConstructQuarter\\Textures\\arrow")
arrowLeftTexture:SetPoint("CENTER", arrowLeft, "CENTER")
arrowLeft:SetHeight(1)
arrowLeft:SetWidth(1)
arrowLeft:SetPoint("CENTER", UIParent, "CENTER", -150, -30)
arrowLeft:SetScript("OnShow", arrowOnShow)
arrowLeft:SetScript("OnUpdate", arrowOnUpdate)

local arrowRight = CreateFrame("Frame", nil, UIParent)
arrowRight:Hide()
local arrowRightTexture = arrowRight:CreateTexture(nil, "BACKGROUND")
arrowRightTexture:SetTexture("Interface\\AddOns\\DBM-Naxx\\ConstructQuarter\\Textures\\arrow")
arrowRightTexture:SetPoint("CENTER", arrowRight, "CENTER")
arrowRightTexture:SetTexCoord(1, 0, 0, 1)
arrowRight:SetHeight(1)
arrowRight:SetWidth(1)
arrowRight:SetPoint("CENTER", UIParent, "CENTER", 150, -30)
arrowRight:SetScript("OnShow", arrowOnShow)
arrowRight:SetScript("OnUpdate", arrowOnUpdate)

local arrowUp = CreateFrame("Frame", nil, UIParent)
arrowUp:Hide()
local arrowUpTexture = arrowUp:CreateTexture(nil, "BACKGROUND")
arrowUpTexture:SetTexture("Interface\\AddOns\\DBM-Naxx\\ConstructQuarter\\Textures\\arrow")
arrowUpTexture:SetRotation(math.pi * 3 / 2)
arrowUpTexture:SetPoint("CENTER", arrowUp, "CENTER")
arrowUp:SetHeight(1)
arrowUp:SetWidth(1)
arrowUp:SetPoint("CENTER", UIParent, "CENTER", 0, 40)
arrowUp:SetScript("OnShow", arrowOnShow)
arrowUp:SetScript("OnUpdate", arrowOnUpdate)

function mod:ShowRightArrow()
	arrowRight:Show()
end

function mod:ShowLeftArrow()
	arrowLeft:Show()
end

function mod:ShowUpArrow()
	arrowUp:Show()
end
