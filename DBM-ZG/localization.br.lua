if GetLocale() ~= "ptBR" then return end
local L

-------------------
--  Venoxis  --
-------------------
L = DBM:GetModLocalization("Venoxis")

L:SetGeneralLocalization{
	name = "Sumo Sacerdote Venoxis"
}

-------------------
--  Jeklik  --
-------------------
L = DBM:GetModLocalization("Jeklik")

L:SetGeneralLocalization{
	name = "Alta-sacerdotisa Jeklik"
}

-------------------
--  Marli  --
-------------------
L = DBM:GetModLocalization("Marli")

L:SetGeneralLocalization{
	name = "Alta-sacerdotisa Mar'li"
}

-------------------
--  Thekal  --
-------------------
L = DBM:GetModLocalization("Thekal")

L:SetGeneralLocalization{
	name = "Sumo Sacerdote Thekal"
}

L:SetWarningLocalization({
	WarnSimulKill	= "Primeiro lacaio morto - ressurreição em ~ 15 segundos"
})

L:SetTimerLocalization({
	TimerSimulKill	= "Ressurreição"
})

L:SetOptionLocalization({
	WarnSimulKill	= "Anunciar o primeiro lacaio morto",
	TimerSimulKill	= "Mostrar a hora da ressurreição do sacerdote"
})

L:SetMiscLocalization({
	PriestDied	= "%s morre.",
	YellPhase2	= "Shirvallah! Me preenche com a tua fúria!",
	YellKill	= "Não sou mais prisioneiro de Hakkar! Enfim, paz!",
	Thekal		= "Sumo Sacerdote Thekal",
	Zath		= "Zelote Zath",
	LorKhan		= "Zelote Lor'Khan"
})

-------------------
--  Arlokk  --
-------------------
L = DBM:GetModLocalization("Arlokk")

L:SetGeneralLocalization{
	name = "Alta-sacerdotisa Arlokk"
}

-------------------
--  Hakkar  --
-------------------
L = DBM:GetModLocalization("Hakkar")

L:SetGeneralLocalization{
	name = "Hakkar"
}

-------------------
--  Bloodlord  --
-------------------
L = DBM:GetModLocalization("Bloodlord")

L:SetGeneralLocalization{
	name = "Sangrelorde Mandokir"
}
L:SetMiscLocalization{
	Bloodlord 	= "Sangrelorde Mandokir",
	Ohgan		= "Ohgan",
	GazeYell	= "Estou do olho em você"
}

-------------------
--  Edge of Madness  --
-------------------
L = DBM:GetModLocalization("EdgeOfMadness")

L:SetGeneralLocalization{
	name = "Beira da Loucura"
}
L:SetMiscLocalization{
	Hazzarah = "Hazza'rah",
	Renataki = "Renataki",
	Wushoolay = "Vuxulai",
	Grilek = "Gri'lek"
}

-------------------
--  Gahz'ranka  --
-------------------
L = DBM:GetModLocalization("Gahzranka")

L:SetGeneralLocalization{
	name = "Gahz'ranka"
}

-------------------
--  Jindo  --
-------------------
L = DBM:GetModLocalization("Jindo")

L:SetGeneralLocalization{
	name = "Jin'do, o Bagateiro"
}
