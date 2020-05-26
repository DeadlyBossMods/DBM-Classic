if GetLocale() ~= "esES" and GetLocale() ~= "esMX" then return end
local L

------------
-- Skeram --
------------
L = DBM:GetModLocalization("Skeram")

L:SetGeneralLocalization{
	name = "El profeta Skeram"
}

----------------
-- Three Bugs --
----------------
L = DBM:GetModLocalization("ThreeBugs")

L:SetGeneralLocalization{
	name = "Realeza silítida"
}
L:SetMiscLocalization{
	Yauj = "Princesa Yauj",
	Vem = "Vem",
	Kri = "Lord Kri"
}

-------------
-- Sartura --
-------------
L = DBM:GetModLocalization("Sartura")

L:SetGeneralLocalization{
	name = "Guardia de batalla Sartura"
}

--------------
-- Fankriss --
--------------
L = DBM:GetModLocalization("Fankriss")

L:SetGeneralLocalization{
	name = "Fankriss el Implacable"
}

--------------
-- Viscidus --
--------------
L = DBM:GetModLocalization("Viscidus")

L:SetGeneralLocalization{
	name = "Viscidus"
}
L:SetWarningLocalization{
	WarnFreeze	= "Congelar: %d/3",
	WarnShatter	= "Hacerse añicos: %d/3"
}
L:SetOptionLocalization{
	WarnFreeze	= "Anunciar congelar",
	WarnShatter	= "Anunciar hacerse añicos"
}
L:SetMiscLocalization{
	Slow	= "comienza a ir más despacio!",
	Freezing= "se está congelando!",
	Frozen	= "no se puede mover!",
	Phase4 	= "comienza a desmoronarse!",
	Phase5 	= "parece a punto de hacerse añicos!",
	Phase6 	= "explota"--Might want to double check this, since no further messages appeared after the previous one.
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
	name = "Los Emperadores Gemelos"
}
L:SetMiscLocalization{
	Veklor = "Emperador Vek'lor",
	Veknil = "Emperador Vek'nilash"
}

------------
-- C'Thun --
------------
L = DBM:GetModLocalization("CThun")

L:SetGeneralLocalization{
	name = "C'Thun"
}
L:SetWarningLocalization{
	WarnEyeTentacle			= "Tentáculo ocular",
	WarnWeakened			= "C'Thun vulnerable",
	SpecWarnWeakened		= "¡C'Thun vulnerable!"
}
L:SetTimerLocalization{
	TimerEyeTentacle		= "Siguiente Tentáculo ocular",
	TimerWeakened			= "Vulnerabilidad termina"
}
L:SetOptionLocalization{
	WarnEyeTentacle			= "Mostrar aviso cuando aparezca un Tentáculo ocular",
	WarnWeakened			= "Mostrar aviso cuando C'Thun se vuelva vulnerable",
	SpecWarnWeakened		= "Mostrar aviso especial cuando C'Thun se vuelva vulnerable",
	TimerEyeTentacle		= "Mostrar temporizador para el siguiente Tentáculo ocular",
	TimerWeakened			= "Mostrar temporizador para la duración de la vulnerabilidad de C'Thun",
	RangeFrame				= "Mostrar marco de distancia (10 m)"
}
L:SetMiscLocalization{
	Eye			= "Ojo de C'Thun",
	Weakened 	= "está débil!"
}
----------------
-- Ouro --
----------------
L = DBM:GetModLocalization("Ouro")

L:SetGeneralLocalization{
	name = "Ouro"
}
L:SetWarningLocalization{
	WarnSubmerge		= "Ouro se sumerge",
	WarnEmerge			= "Ouro regresa"
}
L:SetTimerLocalization{
	TimerSubmerge		= "Sumersión",
	TimerEmerge			= "Emersión"
}
L:SetOptionLocalization{
	WarnSubmerge		= "Mostrar aviso cuando Ouro se sumerja",
	TimerSubmerge		= "Mostrar temporizador para cuando Ouro se sumerja",
	WarnEmerge			= "Mostrar aviso cuando Ouro regrese a la superficie",
	TimerEmerge			= "Mostrar temporizador para cuando Ouro regrese a la superficie"
}
