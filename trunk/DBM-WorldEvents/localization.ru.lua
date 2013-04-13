﻿if GetLocale() ~= "ruRU" then return end

local L

------------
--  Omen  --
------------
L = DBM:GetModLocalization("Omen")

L:SetGeneralLocalization({
	name = "Омен"
})

-----------------------
--  Apothecary Trio  --
-----------------------
L = DBM:GetModLocalization("ApothecaryTrio")

L:SetGeneralLocalization({
	name = "Трое аптекарей"
})

L:SetTimerLocalization{
	HummelActive		= "Хаммел вступает в бой",
	BaxterActive		= "Бакстер вступает в бой",
	FryeActive			= "Фрай вступает в бой"
}

L:SetOptionLocalization({
	TrioActiveTimer		= "Отсчет времени до вступления Троих аптекарей в бой"
})

L:SetMiscLocalization({
	SayCombatStart		= "Тебе хоть сказали, кто я и чем занимаюсь?"
})

-------------
--  Ahune  --
-------------
L = DBM:GetModLocalization("Ahune")

L:SetGeneralLocalization({
	name = "Ахун"
})

L:SetWarningLocalization({
	Submerged		= "Ахун исчез",
	Emerged			= "Ахун появился",
	specWarnAttack	= "Ахун уязвим - атакуйте сейчас!"
})

L:SetTimerLocalization{
	SubmergTimer	= "Исчезновение",
	EmergeTimer		= "Появление",
	TimerCombat		= "Начало боя"
}

L:SetOptionLocalization({
	Submerged		= "Предупреждение, когда Ахун исчезает",
	Emerged			= "Предупреждение, когда Ахун появляется",
	specWarnAttack	= "Спец-предупреждение, когда Ахун становится уязвим",
	SubmergTimer	= "Отсчет времени до исчезновения",
	EmergeTimer		= "Отсчет времени до появления",
	TimerCombat		= "Отсчет времени до начала боя",
})

L:SetMiscLocalization({
	Pull			= "Камень Льда растаял!"
})

----------------------
--  Coren Direbrew  --
----------------------
L = DBM:GetModLocalization("CorenDirebrew")

L:SetGeneralLocalization({
	name = "Корен Худовар"
})

L:SetWarningLocalization({
	specWarnBrew		= "Избавьтесь от варева прежде, чем она бросит вам другое!",
	specWarnBrewStun	= "СОВЕТ: Вы получили удар, не забудьте выпить варево в следующий раз!"
})

L:SetOptionLocalization({
	specWarnBrew		= "Спец-предупреждение для $spell:47376",
	specWarnBrewStun	= "Спец-предупреждение для $spell:47340",
	YellOnBarrel		= "Кричать, когда на вас $spell:51413"
})

L:SetMiscLocalization({
	YellBarrel			= "Бочка на мне!"
})

-------------------------
--  Headless Horseman  --
-------------------------
L = DBM:GetModLocalization("HeadlessHorseman")

L:SetGeneralLocalization({
	name = "Всадник без головы"
})

L:SetWarningLocalization({
	WarnPhase				= "Фаза %d",
	warnHorsemanSoldiers	= "Призыв Пульсирующих тыкв",
	warnHorsemanHead		= "Появилась голова всадника!"
})

L:SetTimerLocalization{
	TimerCombatStart		= "Начало боя"
}

L:SetOptionLocalization({
	WarnPhase				= "Предупреждение о смене фаз",
	TimerCombatStart		= "Отсчет времени до начала боя",
	warnHorsemanSoldiers	= "Предупреждать о призыве Пульсирующих тыкв",
	warnHorsemanHead		= "Спец-предупрежение о появлении головы всадника"
})

L:SetMiscLocalization({
	HorsemanSummon			= "Всадник встает…",
	HorsemanSoldiers		= "Восстаньте слуги, устремитесь в бой! Пусть павший рыцарь обретет покой!"
})

------------------------------
--  The Abominable Greench  --
------------------------------
L = DBM:GetModLocalization("Greench")

L:SetGeneralLocalization({
	name = "Омерзительный Гринч"
})

--------------------------
--  Blastenheimer 5000  --
--------------------------
L = DBM:GetModLocalization("Cannon")

L:SetGeneralLocalization({
	name = "Подрывайстер 5000"
})

-------------
--  Gnoll  --
-------------
L = DBM:GetModLocalization("Gnoll")

L:SetGeneralLocalization({
	name = "Гноллобой"
})

L:SetWarningLocalization({
	warnGameOverQuest	= "Заработано %d из %d возможных появившихся очков",
	warnGameOverNoQuest	= "Игра окончилась с всего %d возможных появившихся очков",
	warnGnoll			= "Гнолл появился",
	warnHogger			= "Хоггер появился",
	specWarnHogger		= "Хоггер появился!"
})

L:SetOptionLocalization({
	warnGameOver	= "Объявлять общее возможное число очков при завершении игры",
	warnGnoll		= "Объявлять появление Гнолла",
	warnHogger		= "Объявлять появление Хоггера",
	specWarnHogger	= "Спец-предупреждение при появлении Хоггера"
})

------------------------
--  Shooting Gallery  --
------------------------
L = DBM:GetModLocalization("Shot")

L:SetGeneralLocalization({
	name = "Тир"
})

L:SetOptionLocalization({
	SetBubbles			= "Автоматически отключать сообщения в облачках во время $spell:101871\n(восстанавливает их после завершения игры)"
})

----------------------
--  Tonk Challenge  --
----------------------
L = DBM:GetModLocalization("Tonks")

L:SetGeneralLocalization({
	name = "Танковые баталии"
})

-----------------------
--  Darkmoon Rabbit  --
-----------------------
L = DBM:GetModLocalization("Rabbit")

L:SetGeneralLocalization({
	name = "Кролик ярмарки Новолуния"
})

--------------------------
--  Plants Vs. Zombies  --
--------------------------
L = DBM:GetModLocalization("PlantsVsZombies")

L:SetGeneralLocalization({
	name = "Растения против зомби"
})

L:SetWarningLocalization({
	warnTotalAdds	= "Всего появилось зомби с прошлой большой волны: %d",
	specWarnWave	= "Большая волна!"
})

L:SetTimerLocalization{
	timerWave		= "След. большая волна"
}

L:SetOptionLocalization({
	warnTotalAdds	= "Объявлять общее число появившихся аддов между каждой большой волной",
	specWarnWave	= "Спец-предупреждение когда начинается большая волна",
	timerWave		= "Отсчет времени до следующей большой волны"
})

L:SetMiscLocalization({
	MassiveWave		= "Приближается большая волна зомби!"
})