if GetLocale() ~= "ptBR" then return end
local L

------------
-- Skeram --
------------
L = DBM:GetModLocalization("Skeram")

L:SetGeneralLocalization{
	name = "Profeta Skeram"
}

----------------
-- Three Bugs --
----------------
L = DBM:GetModLocalization("ThreeBugs")

L:SetGeneralLocalization{
	name = "A Família de Insetos"
}
L:SetMiscLocalization{
	Yauj = "Princesa Yauj",
	Vem = "Veim",
	Kri = "Lorde Kri"
}

-------------
-- Sartura --
-------------
L = DBM:GetModLocalization("Sartura")

L:SetGeneralLocalization{
	name = "Guarda de Batalha Sartura"
}

--------------
-- Fankriss --
--------------
L = DBM:GetModLocalization("Fankriss")

L:SetGeneralLocalization{
	name = "Fankriss, o Obstinado"
}

--------------
-- Viscidus --
--------------
L = DBM:GetModLocalization("Viscidus")

L:SetGeneralLocalization{
	name = "Viscidus"
}
L:SetWarningLocalization{
	WarnFreeze	= "Congelamento: %d/3",
	WarnShatter	= "Shatter: %d/3"
}
L:SetOptionLocalization{
	WarnFreeze	= "Anunciar status de congelamento",
	WarnShatter	= "Announce Shatter status" -- check when I have phase5 emote
}
L:SetMiscLocalization{
	Slow	= "begins to slow",
	Freezing= "is freezing up",
	Frozen	= "is frozen solid",
	Phase4 	= "begins to crack",
	Phase5 	= "looks ready to shatter",
	Phase6 	= "Explodes."
}
-------------
-- Huhuran --
-------------
L = DBM:GetModLocalization("Huhuran")

L:SetGeneralLocalization{
	name = "Princesa Huhuran"
}
---------------
-- Twin Emps --
---------------
L = DBM:GetModLocalization("TwinEmpsAQ")

L:SetGeneralLocalization{
	name = "Imperadores Gêmeos"
}
L:SetMiscLocalization{
	Veklor = "Imperador Vek'lor",
	Veknil = "Imperador Vek'nilash"
}

------------
-- C'Thun --
------------
L = DBM:GetModLocalization("CThun")

L:SetGeneralLocalization{
	name = "C'Thun"
}
L:SetWarningLocalization{
	WarnEyeTentacle			= "Tentóculo",
	SpecWarnWeakened		= "C'Thun enfraquecido!"
}
L:SetTimerLocalization{
	TimerEyeTentacle		= "Próximo Tentóculo",
	TimerWeakened			= "Enfraquecido termina"
}
L:SetOptionLocalization{
	WarnEyeTentacle			= "Exibir aviso para Tentóculo",
	SpecWarnWeakened		= "Exibir aviso especial quando o chefe enfraquece",
	TimerEyeTentacle		= "Exibir cronômetro para o próximo Tentóculo",
	TimerWeakened			= "Exibir cronômetro para duração mais fraca do chefe",
	RangeFrame				= "Exibir quadro de alcance (10 m)"
}
L:SetMiscLocalization{
	Stomach		= "Estómago de C'Thun",
	Eye			= "Olho de C'Thun",
	Weakened 	= "enfraquecido",
	NotValid	= "AQ40 parcialmente limpo. %s chefes opcionais permanecem."
}
----------------
-- Ouro --
----------------
L = DBM:GetModLocalization("Ouro")

L:SetGeneralLocalization{
	name = "Ouro"
}
L:SetWarningLocalization{
	WarnSubmerge		= "Submersão",
	WarnEmerge			= "Emersão"
}
L:SetTimerLocalization{
	TimerSubmerge		= "Submersão",
	TimerEmerge			= "Emersão"
}
L:SetOptionLocalization{
	WarnSubmerge		= "Exibir aviso para submersão",
	TimerSubmerge		= "Exibir cronômetro para submersão",
	WarnEmerge			= "Exibir aviso para emersão",
	TimerEmerge			= "Exibir cronômetro para emersão"
}

----------------
-- AQ40 Trash --
----------------
L = DBM:GetModLocalization("AQ40Trash")

L:SetGeneralLocalization{
	name = "AQ40: Lixo"
}
