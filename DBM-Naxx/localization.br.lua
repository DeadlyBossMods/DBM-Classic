if GetLocale() ~= "ptBR" then return end
local L

-----------------
-- Anub'Rekhan --
-----------------
L = DBM:GetModLocalization("Anub'Rekhan")

L:SetGeneralLocalization({
	name = "Anub'Rekhan"
})

L:SetWarningLocalization({
	SpecialLocust		= "Nuvem de Gafanhotos",
	WarningLocustFaded	= "Nuvem de Gafanhotos terminou"
})

L:SetOptionLocalization({
	SpecialLocust		= "Exibir aviso especial para $spell:28785",
	WarningLocustFaded	= "Exibir aviso cuando termina $spell:28785",
	ArachnophobiaTimer	= "Exibir cronômetro para a conquista 'Aracnofobia'"
})

L:SetMiscLocalization({
	ArachnophobiaTimer	= "Conquista: Aracnofobia",
	Pull1				= "¡Eso, corred! ¡Así la sangre circula más rápido!",
	Pull2				= "Solo un bocado..."
})

-------------------------
-- Gran Viuda Faerlina --
-------------------------
L = DBM:GetModLocalization("Faerlina")

L:SetGeneralLocalization({
	name = "Grã-viúva Faerlina"
})

L:SetWarningLocalization({
	WarningEmbraceExpire	= "Abraço da Viúva expirando em 5 s",
	WarningEmbraceExpired	= "Abraço da Viúva expirou"
})

L:SetOptionLocalization({
	WarningEmbraceExpire	= "Exibir aviso prévio para quando expira Abraço da Viúva",
	WarningEmbraceExpired	= "Exibir aviso cuando expira Abraço da Viúvaex"
})

L:SetMiscLocalization({
	Pull					= "¡Arrodíllate ante mí, sabandija!"--Not actually pull trigger, but often said on pull
})

-------------
-- Maexxna --
-------------
L = DBM:GetModLocalization("Maexxna")

L:SetGeneralLocalization({
	name = "Maexxna"
})

L:SetWarningLocalization({
	WarningSpidersSoon	= "Prole de Maexxna em 5 s",
	WarningSpidersNow	= "Proles de Maexxna"
})

L:SetTimerLocalization({
	TimerSpider	= "Próximos proles"
})

L:SetOptionLocalization({
	WarningSpidersSoon	= "Exibir aviso prévio para quando os Proles de Maexxna aparecerem",
	WarningSpidersNow	= "Exibir aviso quando Proles de Maexxna aparecem",
	TimerSpider			= "Exibir cronômetro para os seguintes Proles de Maexxna"
})

L:SetMiscLocalization({
	ArachnophobiaTimer	= "Conquista: Aracnofobia"
})

-----------------------
-- Noth el Pesteador --
-----------------------
L = DBM:GetModLocalization("Noth")

L:SetGeneralLocalization({
	name = "Noth, o Pestífero"
})

L:SetWarningLocalization({
	WarningTeleportNow	= "Teleporte",
	WarningTeleportSoon	= "Teleporte em 20 s"
})

L:SetTimerLocalization({
	TimerTeleport		= "Teleporte: Sacada",
	TimerTeleportBack	= "Teleporte: Chão"
})

L:SetOptionLocalization({
	WarningTeleportNow	= "Exibir aviso para Teleporte",
	WarningTeleportSoon	= "Exibir aviso prévio para Teleporte",
	TimerTeleport		= "Exibir cronômetro para o próximo Teleporte: Sacada",
	TimerTeleportBack	= "Exibir cronômetro para Teleporte: Chão"
})

L:SetMiscLocalization({
	Pull				= "¡Muere, intruso!"
})

----------------------
-- Heigan el Impuro --
----------------------
L = DBM:GetModLocalization("Heigan")

L:SetGeneralLocalization({
	name = "Heigan, o Sujo"
})

L:SetWarningLocalization({
	WarningTeleportNow	= "Teleporte",
	WarningTeleportSoon	= "Teleporte em %d s"
})

L:SetTimerLocalization({
	TimerTeleport	= "Teleporte"
})

L:SetOptionLocalization({
	WarningTeleportNow	= "Exibir aviso para Teleporte",
	WarningTeleportSoon	= "Exibir aviso prévio para Teleporte",
	TimerTeleport		= "Exibir aviso para Teleporte"
})

L:SetMiscLocalization({
	Pull				= "Ahora me perteneces."
})

-------------
-- Loatheb --
-------------
L = DBM:GetModLocalization("Loatheb")

L:SetGeneralLocalization({
	name = "Repugnaz"
})

L:SetWarningLocalization({
	WarningHealSoon	= "Cura possível em 3 s",
	WarningHealNow	= "Cure agora!"
})

L:SetOptionLocalization({
	WarningHealSoon		= "Exibir aviso prévio para janela de cura de 3 segundos",
	WarningHealNow		= "Exibir aviso prévio para janela de cura"
})

---------------
-- Retalhoso --
---------------
L = DBM:GetModLocalization("Patchwerk")

L:SetGeneralLocalization({
	name = "Retalhoso"
})

L:SetOptionLocalization({
})

L:SetMiscLocalization({
	yell1 = "¡Remendejo quiere jugar!",
	yell2 = "¡Remendejo es la encarnación de guerra de Kel'Thuzad!"
})

---------------
-- Grobbulus --
---------------
L = DBM:GetModLocalization("Grobbulus")

L:SetGeneralLocalization({
	name = "Grobbulus"
})

-----------
-- Gluth --
-----------
L = DBM:GetModLocalization("Gluth")

L:SetGeneralLocalization({
	name = "Gluth"
})

--------------
-- Thaddius --
--------------
L = DBM:GetModLocalization("Thaddius")

L:SetGeneralLocalization({
	name = "Thaddius"
})

L:SetMiscLocalization({
	Yell	= "¡Stalagg aplasta!",
	Emote	= "¡%s se sobrecarga!",
	Emote2	= "¡Espiral Tesla se sobrecarga!",
	Boss1	= "Feugen",
	Boss2	= "Stalagg",
	Charge1 = "negativo",
	Charge2 = "positivo"
})

L:SetOptionLocalization({
	WarningChargeChanged	= "Exibir aviso especial quando sua polaridade mudar",
	WarningChargeNotChanged	= "Exibir aviso especial quando sua polaridade não mudar",
	ArrowsEnabled			= "Exibir setas (estratégia típica de dois grupos)",
	ArrowsRightLeft			= "Exibe as setas para a esquerda e direita (estratégia de quatro grupos; mostra a seta para a esquerda se a polaridade mudar, seta para a direita se não mudar)",
	ArrowsInverse			= "Exibe as setas esquerda e direita reversas (estratégia de quatro grupos; mostra a seta para a direita se a polaridade mudar, a seta para a esquerda se não mudar)"
})

L:SetWarningLocalization({
	WarningChargeChanged	= "Polaridade alterada para %s",
	WarningChargeNotChanged	= "Sua polaridade não mudou"
})

--------------------------
-- Instructor Razuvious --
--------------------------
L = DBM:GetModLocalization("Razuvious")

L:SetGeneralLocalization({
	name = "Instrutor Razúvio"
})

L:SetMiscLocalization({
	Yell1 = "¡No tengáis piedad!",
	Yell2 = "¡El tiempo de practicar ha pasado! ¡Quiero ver lo que habéis aprendido!",
	Yell3 = "¡Poned en práctica lo que os he enseñado!",
	Yell4 = "Un barrido con pierna... ¿Tienes algún problema?"
})

L:SetOptionLocalization({
	WarningShieldWallSoon	= "Exibir aviso prévio para quando termina $spell:29061"
})

L:SetWarningLocalization({
	WarningShieldWallSoon	= "Barreira de ossos termina em 5 s"
})

--------------------------
-- Gothik el Cosechador --
--------------------------
L = DBM:GetModLocalization("Gothik")

L:SetGeneralLocalization({
	name = "Gothik, o Ceifador"
})

L:SetOptionLocalization({
	TimerWave			= "Exibir cronômetro para a próxima onda de lacaios",
	TimerPhase2			= "Exibir cronômetro para mudar para a Fase 2",
	WarningWaveSoon		= "Exibir aviso prévio para a próxima onda de lacaios",
	WarningWaveSpawned	= "Exibir aviso quando uma onda de lacaios começar",
	WarningRiderDown	= "Exibir aviso quando um Cavalgante Implacável morre",
	WarningKnightDown	= "Exibir aviso quando um Cavaleiro da Morte Implacável morre"
})

L:SetTimerLocalization({
	TimerWave	= "Onda %d",
	TimerPhase2	= "Fase 2"
})

L:SetWarningLocalization({
	WarningWaveSoon		= "Onda %d: %s em 3 s",
	WarningWaveSpawned	= "Onda %d: %s",
	WarningRiderDown	= "Cavalgante morto",
	WarningKnightDown	= "Cavaleiro morto",
	WarningPhase2		= "Fase 2"
})

L:SetMiscLocalization({
	yell			= "Tú mismo has buscado tu final.",
	WarningWave1	= "%d %s",
	WarningWave2	= "%d %s y %d %s",
	WarningWave3	= "%d %s, %d %s y %d %s",
	Trainee			= "Aprendiz",
	Knight			= "Cavaleiro",
	Rider			= "Cavalgante"
})

------------------------
-- Os Quatro Cavaleiros --
------------------------
L = DBM:GetModLocalization("Horsemen")

L:SetGeneralLocalization({
	name = "Os Quatro Cavaleiros"
})

L:SetOptionLocalization({
	WarningMarkSoon				= "Exibir aviso prévio para marcas",
	SpecialWarningMarkOnPlayer	= "Exibir um aviso especial quando você for afetado por mais de quatro marcas"
})

L:SetTimerLocalization({
})

L:SetWarningLocalization({
	WarningMarkSoon				= "Marca %d em 3 s",
	SpecialWarningMarkOnPlayer	= "%s: %s"
})

L:SetMiscLocalization({
	Korthazz	= "Thane Korth'azz",
	Rivendare	= "Barão Rivendare",
	Blaumeux	= "Lady Blaumeux",
	Zeliek		= "Sir Zeliek"
})

---------------
-- Sapphiron --
---------------
L = DBM:GetModLocalization("Sapphiron")

L:SetGeneralLocalization({
	name = "Sapphiron"
})

L:SetOptionLocalization({
	WarningAirPhaseSoon	= "Exibir aviso prévio para mudança de fase de ar",
	WarningAirPhaseNow	= "Anunciar mudança para fase de ar",
	WarningLanded		= "Anunciar mudança de fase no solo",
	TimerAir			= "Exibir cronômetro para mudança para fase de ar",
	TimerLanding		= "Exibir cronômetro para mudança de fase no terra",
	TimerIceBlast		= "Exibir cronômetro para $spell:28524",
	WarningDeepBreath	= "Exibir aviso especial para $spell:28524",
	WarningIceblock		= "Grite quando te afeta $spell:28522"
})

L:SetMiscLocalization({
	EmoteBreath			= "%s respira hondo.",
	WarningYellIceblock	= "Eu sou um bloco de gelo!"
})

L:SetWarningLocalization({
	WarningAirPhaseSoon	= "Fase aérea em 10 s",
	WarningAirPhaseNow	= "Fase aérea",
	WarningLanded		= "Fase em terra",
	WarningDeepBreath	= "Sopro Gélido"
})

L:SetTimerLocalization({
	TimerAir		= "Fase aérea",
	TimerLanding	= "Fase em terra",
	TimerIceBlast	= "Sopro Gélido"
})

----------------
-- Kel'Thuzad --
----------------

L = DBM:GetModLocalization("Kel'Thuzad")

L:SetGeneralLocalization({
	name = "Kel'Thuzad"
})

L:SetOptionLocalization({
	TimerPhase2			= "Exibir cronômetro para mudar para a Fase 2",
	specwarnP2Soon		= "Exibir aviso especial 10 s antes de mudar para a Fase 2",
	warnAddsSoon		= "Exibir aviso prévio para quando os Guardiões da Coroa de Gelo aparecerem"
})

L:SetMiscLocalization({
	Yell = "¡Esbirros, sirvientes, soldados de la fría oscuridad! ¡Obedeced la llamada de Kel'Thuzad!"
})

L:SetWarningLocalization({
	specwarnP2Soon	= "Fase 2 em 10 s",
	warnAddsSoon	= "Guardiões da Coroa de Gelo em breve"
})

L:SetTimerLocalization({
	TimerPhase2	= "Fase 2"
})
