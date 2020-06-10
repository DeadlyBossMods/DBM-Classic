if GetLocale() ~= "ptBR" then return end
local L

----------------
--  Lucifron  --
----------------
L = DBM:GetModLocalization("Lucifron")

L:SetGeneralLocalization{
	name = "Lúcifron"
}

----------------
--  Magmadar  --
----------------
L = DBM:GetModLocalization("Magmadar")

L:SetGeneralLocalization{
	name = "Magmadar"
}

----------------
--  Gehennas  --
----------------
L = DBM:GetModLocalization("Gehennas")

L:SetGeneralLocalization{
	name = "Geena"
}

------------
--  Garr  --
------------
L = DBM:GetModLocalization("Garr-Classic")

L:SetGeneralLocalization{
	name = "Garr"
}

--------------
--  Geddon  --
--------------
L = DBM:GetModLocalization("Geddon")

L:SetGeneralLocalization{
	name = "Barão Geddon"
}

----------------
--  Shazzrah  --
----------------
L = DBM:GetModLocalization("Shazzrah")

L:SetGeneralLocalization{
	name = "Shazzrah"
}

----------------
--  Sulfuron  --
----------------
L = DBM:GetModLocalization("Sulfuron")

L:SetGeneralLocalization{
	name = "Emissário de Sulfuron"
}

----------------
--  Golemagg  --
----------------
L = DBM:GetModLocalization("Golemagg")

L:SetGeneralLocalization{
	name = "Golemagg, o Incinerador"
}

-----------------
--  Majordomo  --
-----------------
L = DBM:GetModLocalization("Majordomo")

L:SetGeneralLocalization{
	name = "Senescal Executus"
}
L:SetTimerLocalization{
	timerShieldCD		= "Próximo escudo"
}
L:SetOptionLocalization{
	timerShieldCD		= "Mostrar cronômetro para o próximo escudo de dano/reflexão"
}

----------------
--  Ragnaros  --
----------------
L = DBM:GetModLocalization("Ragnaros-Classic")

L:SetGeneralLocalization{
	name = "Ragnaros"
}
L:SetWarningLocalization{
	WarnSubmerge		= "Submergir",
	WarnEmerge			= "Emergir"
}
L:SetTimerLocalization{
	TimerSubmerge		= "Submergir",
	TimerEmerge			= "Emergir",
}
L:SetOptionLocalization{
	WarnSubmerge		= "Mostrar aviso para submergir",
	TimerSubmerge		= "Mostrar cronômetro para submergir",
	WarnEmerge			= "Mostrar aviso para emergir",
	TimerEmerge			= "Mostrar cronômetro para emergir",
}
L:SetMiscLocalization{
	Submerge	= "COME FORTH, MY SERVANTS! DEFEND YOUR MASTER!",
	Pull		= "Impudent whelps! You've rushed headlong to your own deaths! See now, the master stirs!"
}
