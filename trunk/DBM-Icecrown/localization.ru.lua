﻿if GetLocale() ~= "ruRU" then return end

local L

---------------------------
--  Trash - Lower Spire  --
---------------------------
L = DBM:GetModLocalization("LowerSpireTrash")

L:SetGeneralLocalization{
	name = "Треш-мобы Шпиля"
}

L:SetWarningLocalization{
}

L:SetOptionLocalization{
	SetIconOnDarkReckoning	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(69483)
}

L:SetMiscLocalization{
	WarderTrap1		= "Кто... идет?",
	WarderTrap2		= "Я пробудился..."
}

---------------------------
--  Trash - Plagueworks  --
---------------------------
L = DBM:GetModLocalization("PlagueworksTrash")

L:SetGeneralLocalization{
	name = "Прелесть & Вонючка"
}

L:SetWarningLocalization{
}

L:SetOptionLocalization{
}

----------------------
--  Lord Marrowgar  --
----------------------
L = DBM:GetModLocalization("LordMarrowgar")

L:SetGeneralLocalization{
	name = "Лорд Ребрад"
}

L:SetTimerLocalization{
	achievementBoned	= "Время до освобождения"
}

L:SetWarningLocalization{
	WarnImpale			= "Прокалывание: >%s<"
}

L:SetOptionLocalization{
	WarnImpale			= "Объявлять цели заклинания $spell:69062",
	achievementBoned	= "Отсчет времени для достижения Косточка попалась",
	SetIconOnImpale		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(69062)
}

-------------------------
--  Lady Deathwhisper  --
-------------------------
L = DBM:GetModLocalization("Deathwhisper")

L:SetGeneralLocalization{
	name = "Леди Смертный Шепот"
}

L:SetTimerLocalization{
	TimerAdds	= "Призыв помощников"
}

L:SetWarningLocalization{
	WarnReanimating				= "Помощник трансформируется",			-- Reanimating an adherent or fanatic
	WarnTouchInsignificance		= "%s на |3-5(>%s<) (%s)",		-- Touch of Insignificance on >args.destName< (args.amount)
	WarnAddsSoon				= "Скоро призыв помощников"
}

L:SetOptionLocalization{
	WarnAddsSoon				= "Предупреждать заранее о призыве помощников",
	WarnReanimating				= "Предупреждать, при трансформации помощника",											-- Reanimated Adherent/Fanatic spawning
	TimerAdds					= "Отсчет времени до призыва помощников",
	ShieldHealthFrame			= "Показывать здоровье босса с индикатором здоровья для \n$spell:70842",
	WarnTouchInsignificance		= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(71204, GetSpellInfo(71204) or "unknown"),	
	SetIconOnDominateMind		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(71289),
	SetIconOnDeformedFanatic	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(70900),
	SetIconOnEmpoweredAdherent	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(70901)
}

L:SetMiscLocalization{
	YellPull				= "Как вы смеете ступать в эти священные покои? Это место станет вашей могилой!",
	YellReanimatedFanatic	= "Восстань и обрети истинную форму!",
	ShieldPercent			= "Барьер маны"--Translate Spell id 70842
}

----------------------
--  Gunship Battle  --
----------------------
L = DBM:GetModLocalization("GunshipBattle")

L:SetGeneralLocalization{
	name = "Боевой корабль"
}

L:SetWarningLocalization{
	WarnBattleFury	= "%s (%d)",
	WarnAddsSoon	= "Скоро призыв помощников"
}

L:SetOptionLocalization{
	WarnBattleFury		= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(69638, GetSpellInfo(69638) or "Battle Fury"),
	TimerCombatStart	= "Отсчет времени до начала боя",
	WarnAddsSoon		= "Предупреждать заранее о призыве помощников",
	TimerAdds			= "Отсчет времени до новых помощников"
}

L:SetTimerLocalization{
	TimerCombatStart	= "Начало боя",
	TimerAdds			= "Призыв помощников"
}

L:SetMiscLocalization{
	PullAlliance	= "Запускайте двигатели! Летим навстречу судьбе.",
	KillAlliance	= "Ну не говорите потом, что я не предупреждал. В атаку, братья и сестры!",
	PullHorde		= "Rise up, sons and daughters of the Horde! Today we battle a hated enemy! LOK'TAR OGAR!",
	KillHorde		= "The Alliance falter. Onward to the Lich King!"
}

-----------------------------
--  Deathbringer Saurfang  --
-----------------------------
L = DBM:GetModLocalization("Deathbringer")

L:SetGeneralLocalization{
	name = "Саурфанг Смертоносный"
}

L:SetWarningLocalization{
	warnFrenzySoon	= "Скоро Бешенство"
}

L:SetTimerLocalization{
	TimerCombatStart		= "Начало боя"
}

L:SetOptionLocalization{
	TimerCombatStart		= "Отсчет времени до начала боя",
	warnFrenzySoon			= "Предупреждать о скором Бешенстве (на ~33%)",
	SetIconOnBoilingBlood	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(72441),
	SetIconOnMarkCast		= "Устанавливать метки на цели заклинания $spell:72444 \n во время его применения",
	RangeFrame				= "Показывать окно допустимой дистанции (11 м)",
	RunePowerFrame			= "Показывать здоровье босса + индикатор для $spell:72371"
}

L:SetMiscLocalization{
	RunePower			= "Сила крови",
	PullAlliance		= "Все павшие воины Орды, все дохлые псы Альянса – все пополнят армию Короля-лича. Даже сейчас валь'киры воскрешают ваших покойников, чтобы те стали частью Плети!"
}

-----------------
--  Festergut  --
-----------------
L = DBM:GetModLocalization("Festergut")

L:SetGeneralLocalization{
	name = "Тухлопуз"
}

L:SetWarningLocalization{
	InhaledBlight		= "Гнилостные испарения в легких >%d<",
	WarnGastricBloat	= "%s на |3-5(>%s<) (%s)",		-- Gastric Bloat on >args.destName< (args.amount)
}

L:SetOptionLocalization{
	InhaledBlight		= "Предупреждение для $spell:71912",
	WarnGastricBloat	= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(72551, GetSpellInfo(72551) or "unknown"),	
	SetIconOnGasSpore	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(69279)
}

---------------
--  Rotface  --
---------------
L = DBM:GetModLocalization("Rotface")

L:SetGeneralLocalization{
	name = "Гниломорд"
}

L:SetWarningLocalization{
	WarnOozeSpawn				= "Малый слизнюк",
	WarnUnstableOoze			= "%s на |3-5(>%s<) (%s)"			-- Unstable Ooze on >args.destName< (args.amount)
}

L:SetTimerLocalization{
	NextPoisonSlimePipes		= "След. трубы для подачи ядовитой слизи"
}

L:SetOptionLocalization{
	NextPoisonSlimePipes		= "Отсчет времени до следующих труб для подачи ядовитой слизи",
	WarnOozeSpawn				= "Предупреждение при появлении Малого слизнюка",
	WarnUnstableOoze			= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(69558, GetSpellInfo(69558) or "unknown"),
	InfectionIcon				= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(71224),
	ExplosionIcon				= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(69839)
}

L:SetMiscLocalization{
	YellSlimePipes1	= "Отличные новости, народ! Я починил трубы для подачи ядовитой слизи!",	-- Professor Putricide
	YellSlimePipes2	= "Отличные новости, народ! Слизь снова потекла!"	-- Professor Putricide
}

---------------------------
--  Professor Putricide  --
---------------------------
L = DBM:GetModLocalization("Putricide")

L:SetGeneralLocalization{
	name = "Профессор Мерзоцид"
}

L:SetWarningLocalization{
	WarnPhase2Soon		= "Скоро фаза 2",
	WarnPhase3Soon		= "Скоро фаза 3",
	WarnMutatedPlague	= "%s на |3-5(>%s<) (%s)"			-- Mutated Plague on >args.destName< (args.amount)
}

L:SetOptionLocalization{
	WarnPhase2Soon			= "Предупреждать заранее о фазе 2 (на ~83%)",
	WarnPhase3Soon			= "Предупреждать заранее о фазе 3 (на ~38%)",
	WarnMutatedPlague		= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(72451, GetSpellInfo(72451) or "unknown"),
	OozeAdhesiveIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(70447),
	GaseousBloatIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(70672)
}

L:SetMiscLocalization{
	YellPull	= "Отличные новости, народ! Я усовершенствовал штамм чумы, которая уничтожит весь Азерот!"
}

----------------------------
--  Blood Prince Council  --
----------------------------
L = DBM:GetModLocalization("BPCouncil")

L:SetGeneralLocalization{
	name = "Кровавый Совет"
}

L:SetWarningLocalization{
	WarnTargetSwitch		= "Switch target to: %s",		-- Ugh, no nice spellname/id to use for general localization :(
	WarnTargetSwitchSoon	= "Target switch soon",			-- Spellname = Invocation of Blood   or   Spellname = Invocation of Blood (X) Move  (server side script where X indicates the first letter of the Prince name
	SpecWarnResonance		= "Теневой резонанс - бегите"
}

L:SetTimerLocalization{
	TimerTargetSwitch	= "Possible target switch"
}

L:SetOptionLocalization{
	WarnTargetSwitch		= "Show warning to switch targets",								-- Warn when another Prince needs to be damaged
	WarnTargetSwitchSoon	= "Show pre-warning to switch targets",							-- Every ~31 secs, you have to dps a different Prince
	TimerTargetSwitch		= "Show timer for target switch cooldown",
	SpecWarnResonance		= "Show special warning when a Dark Nucleus is following you"	-- If it follows you, you have to move to the tank
}

L:SetMiscLocalization{
	Keleseth	= "Принц Келесет",
	Taldaram	= "Принц Талдарам",
	Valanar		= "Принц Валанар"
}

-----------------------------
--  Blood-Queen Lana'thel  --
-----------------------------
L = DBM:GetModLocalization("Lanathel")

L:SetGeneralLocalization{
	name = "Королева Лана'тель"
}

L:SetWarningLocalization{
	SpecWarnPactDarkfallen	= "Pact of the Darkfallen on you"
}

L:SetOptionLocalization{
	SpecWarnPactDarkfallen	= "Show special warning when you are affected by Pact of the Darkfallen"
}

-----------------------------
--  Valithria Dreamwalker  --
-----------------------------
L = DBM:GetModLocalization("Valithria")

L:SetGeneralLocalization{
	name = "Валитрия Сноходица"
}

L:SetWarningLocalization{
}

L:SetOptionLocalization{
}

------------------
--  Sindragosa  --
------------------
L = DBM:GetModLocalization("Sindragosa")

L:SetGeneralLocalization{
	name = "Синдрагоса"
}

L:SetTimerLocalization{
	TimerNextAirphase		= "Воздушная фаза",
	TimerNextGroundphase	= "Наземная фаза"
}

L:SetWarningLocalization{
	WarnAirphase			= "Воздушная фаза",
	SpecWarnBlisteringCold	= "Blistering Cold - Run away",
	SpecWarnFrostBeacon		= "Frost Beacon on you",
	WarnGroundphaseSoon		= "Синдрагоса приземляется",
	SpecWarnUnchainedMagic	= "Unchained Magic on you"
}

L:SetOptionLocalization{
	WarnAirphase			= "Предупреждать о воздушной фазе",
	SpecWarnBlisteringCold	= "Show special warning for Blistering Cold",
	SpecWarnFrostBeacon		= "Show special warning when you are affected by Frost Beacon",
	WarnGroundphaseSoon		= "Заранее предупреждать о наземной фазе",
	TimerNextAirphase		= "Отсчет времени до воздушной фазы",
	TimerNextGroundphase	= "Отсчет времени до наземной фазы",
	SpecWarnUnchainedMagic	= "Show special warning when you are affected by Unchained Magic"
}

L:SetMiscLocalization{
	YellAirphase	= "Your incursion ends here! None shall survive!",
	YellPull		= "You are fools to have come to this place. The icy winds of Northrend will consume your souls!"
}

---------------------
--  The Lich King  --
---------------------
L = DBM:GetModLocalization("LichKing")

L:SetGeneralLocalization{
	name = "Король-лич"
}

L:SetWarningLocalization{
}

L:SetOptionLocalization{
}

