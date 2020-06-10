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
	YellPull = "Qué casualidad. Generalmente, debo salir de mi guarida para poder comer.",
	YellP2 = "Este ejercicio sin sentido me aburre. ¡Los incineraré a todos desde arriba!",
	YellP3 = "¡Parece ser que van a necesitar otra lección, mortales!"
}

