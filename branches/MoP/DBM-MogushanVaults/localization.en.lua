local L

------------
-- The Stone Guard --
------------
L= DBM:GetModLocalization(679)

L:SetMiscLocalization({
	Overload	= "%s is about to Overload!"
})


------------
-- Feng the Accursed --
------------
L= DBM:GetModLocalization(689)

L:SetMiscLocalization({
	Fire		= "Oh exalted one! Through me you shall melt flesh from bone!",
	Arcane		= "Oh sage of the ages! Instill to me your arcane wisdom!",
	Nature		= "Oh great spirit! Grant me the power of the earth!",--I did not log this one, text is probably not right
	Shadow		= "Great soul of champions past! Bear to me your shield!"
})


-------------------------------
-- Gara'jal the Spiritbinder --
-------------------------------
L= DBM:GetModLocalization(682)


----------------------
-- The Spirit Kings --
----------------------
L = DBM:GetModLocalization(687)

L:SetOptionLocalization({
	RangeFrame			= "Show range frame (8)"
})

L:SetMiscLocalization({
	--localized names for the CHAT_MSG_MONSTER_YELL (not EJ)
	Meng	= "Meng the Demented",
	Qiang	= "Qiang the Merciless",
	Subetai	= "Subetai the Swift",
	Pillage	= "spell:118047"
})


------------
-- Elegon --
------------
L = DBM:GetModLocalization(726)

L:SetWarningLocalization({
	specWarnDespawnFloor		= "Watch your step!"
})

L:SetTimerLocalization({
	timerDespawnFloor			= "Watch your step!"
})

L:SetOptionLocalization({
	specWarnDespawnFloor		= "Show special warning before floor vanishes",
	timerDespawnFloor			= "show timer for when floor vanishes"
})


------------
-- Will of the Emperor --
------------
L= DBM:GetModLocalization(677)

L:SetOptionLocalization({
	InfoFrame		= "Show info frame for players affected by $spell:116525"
})

L:SetMiscLocalization({
	Pull		= "Destroying the pipes leaks |cFFFF0000|Hspell:116779|h[Titan Gas]|h|r into the room!",--Emote
	Rage		= "The Emperor's Rage echoes through the hills.",--Yell
	Strength	= "The Emperor's Strength appears in the alcoves!",--Emote
	Courage		= "The Emperor's Courage appears in the alcoves!",--Emote
	Boss		= "Two titanic constructs appear in the large alcoves!"--Emote
})

