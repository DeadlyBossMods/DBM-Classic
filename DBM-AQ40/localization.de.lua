if GetLocale() ~= "deDE" then return end
local L

------------
-- Skeram --
------------
L = DBM:GetModLocalization("Skeram")

L:SetGeneralLocalization{
	name = "Der Prophet Skeram"
}

----------------
-- Three Bugs --
----------------
L = DBM:GetModLocalization("ThreeBugs")

L:SetGeneralLocalization{
	name = "Adel der Silithiden"
}
L:SetMiscLocalization{
	Yauj = "Prinzessin Yauj",
	Vem = "Vem",
	Kri = "Lord Kri"
}

-------------
-- Sartura --
-------------
L = DBM:GetModLocalization("Sartura")

L:SetGeneralLocalization{
	name = "Schlachtwache Sartura"
}

--------------
-- Fankriss --
--------------
L = DBM:GetModLocalization("Fankriss")

L:SetGeneralLocalization{
	name = "Fankriss der Unnachgiebige"
}

--------------
-- Viscidus --
--------------
L = DBM:GetModLocalization("Viscidus")

L:SetGeneralLocalization{
	name = "Viscidus"
}
L:SetWarningLocalization{
	WarnFreeze	= "Einfrieren: %d/3",
	WarnShatter	= "Zerspringen: %d/3"
}
L:SetOptionLocalization{
	WarnFreeze	= "Verkünde Einfrieren Status",
	WarnShatter	= "Verkünde Zerspringen Status"
}
L:SetMiscLocalization{
	Slow	= "wird langsamer",
	Freezing= "friert ein",
	Frozen	= "ist tiefgefroren",
	Phase4 	= "geht die Puste aus",
	Phase5 	= "ist kurz davor, zu zerspringen",
	Phase6 	= "Explodes." --translate (trigger)
}
-------------
-- Huhuran --
-------------
L = DBM:GetModLocalization("Huhuran")

L:SetGeneralLocalization{
	name = "Prinzessin Huhuran"
}
---------------
-- Twin Emps --
---------------
L = DBM:GetModLocalization("TwinEmpsAQ")

L:SetGeneralLocalization{
	name = "Zwillingsimperatoren"
}
L:SetMiscLocalization{
	Veklor = "Imperator Vek'lor",
	Veknil = "Imperator Vek'nilash"
}

------------
-- C'Thun --
------------
L = DBM:GetModLocalization("CThun")

L:SetGeneralLocalization{
	name = "C'Thun"
}
L:SetWarningLocalization{
	WarnEyeTentacle			= "Augententakel erscheinen",
	SpecWarnWeakened		= "C'Thun geschwächt!"
}
L:SetTimerLocalization{
	TimerEyeTentacle		= "Nächstes Augententakel",
	TimerWeakened			= "Schwäche endet"
}
L:SetOptionLocalization{
	WarnEyeTentacle			= "Zeige Warnung, wenn Augententakel erscheinen",
	SpecWarnWeakened		= "Spezialwarnung, wenn C'Thun geschwächt ist",
	TimerEyeTentacle		= "Zeige Zeit bis die nächsten Augententakel erscheinen",
	TimerWeakened			= "Dauer der Schwäche von C'Thun anzeigen",
	RangeFrame				= "Zeige Abstandsfenster (10m)"
}
L:SetMiscLocalization{
	Stomach		= "Magen of C'Thun",
	Eye			= "Auge von C'Thun",--needs to be verified (guessed)
	Weakened 	= "C'Thun ist geschwächt!",
	NotValid	= "AQ40 teilweise gelöscht. % s optionale Bosse bleiben erhalten."
}
----------------
-- Ouro --
----------------
L = DBM:GetModLocalization("Ouro")

L:SetGeneralLocalization{
	name = "Ouro"
}
L:SetWarningLocalization{
	WarnSubmerge		= "Abtauchen",
	WarnEmerge			= "Auftauchen"
}
L:SetTimerLocalization{
	TimerSubmerge		= "Abtauchen",
	TimerEmerge			= "Auftauchen"
}
L:SetOptionLocalization{
	WarnSubmerge		= "Zeige Warnung für Abtauchen",
	TimerSubmerge		= "Zeige Zeit bis Abtauchen",
	WarnEmerge			= "Zeige Warnung für Auftauchen",
	TimerEmerge			= "Zeige Zeit bis Auftauchen"
}