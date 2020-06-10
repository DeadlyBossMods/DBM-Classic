if GetLocale() ~= "ptBR" then return end
local L

--------------
--  Onyxia  --
--------------
L = DBM:GetModLocalization("Onyxia")

L:SetGeneralLocalization{
	name = "Onyxia"
}

L:SetWarningLocalization{
	WarnWhelpsSoon		= "Dragonete Onyxiano em breve"
}

L:SetTimerLocalization{
	TimerWhelps	= "Dragonete Onyxiano"
}

L:SetOptionLocalization{
	TimerWhelps				= "Mostrar cronômetro para os seguintes Dragonetes Onyxiano",
	WarnWhelpsSoon			= "Mostrar aviso prévio para os seguintes Dragonetes Onyxiano",
	SoundWTF3				= "Reproduzir sons engraçados de um lendário raide clássico de Onyxia"
}

L:SetMiscLocalization{
	Breath = "%s takes in a deep breath...",
	YellPull = "How fortuitous. Usually, I must leave my lair in order to feed.",
	YellP2 = "This meaningless exertion bores me. I'll incinerate you all from above!",
	YellP3 = "It seems you'll need another lesson, mortals!"
}

