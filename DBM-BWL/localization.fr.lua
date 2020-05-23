if GetLocale() ~= "frFR" then return end
local L

-----------------
--  Razorgore  --
-----------------
L = DBM:GetModLocalization("Razorgore")

L:SetGeneralLocalization{
	name = "Razorgore the Untamed"
}
L:SetTimerLocalization{
	TimerAddsSpawn	= "Adds spawning"
}
L:SetOptionLocalization{
	TimerAddsSpawn	= "Show timer for first adds spawning"
}
L:SetMiscLocalization{
	Phase2Emote	= "flee as the controlling power of the orb is drained.",
	YellEgg1 = "Vous allez payer pour m’avoir forcé à faire ça !",
	YellEgg2 = "Imbéciles ! Vous n’avez pas idée de la valeur de ces œufs !",
	YellEgg3 = "Non, pas un autre ! J’aurai vos têtes pour venger cette atrocité !",
	YellPull = "La chambre des œufs est envahie ! Sonnez l’alarme ! Protégez les œufs à tout prix !\r\n"--Yes this yell actually has a return and new line in it. as grabbed by transcriptor
}
-------------------
--  Vaelastrasz  --
-------------------
L = DBM:GetModLocalization("Vaelastrasz")

L:SetGeneralLocalization{
	name				= "Vaelastrasz the Corrupt"
}

L:SetMiscLocalization{
	Event				= "Too late, friends! Nefarius' corruption has taken hold...I cannot...control myself."
}
-----------------
--  Broodlord  --
-----------------
L = DBM:GetModLocalization("Broodlord")

L:SetGeneralLocalization{
	name	= "Broodlord Lashlayer"
}

L:SetMiscLocalization{
	Pull	= "None of your kind should be here!  You've doomed only yourselves!"
}

---------------
--  Firemaw  --
---------------
L = DBM:GetModLocalization("Firemaw")

L:SetGeneralLocalization{
	name = "Firemaw"
}

---------------
--  Ebonroc  --
---------------
L = DBM:GetModLocalization("Ebonroc")

L:SetGeneralLocalization{
	name = "Ebonroc"
}

----------------
--  Flamegor  --
----------------
L = DBM:GetModLocalization("Flamegor")

L:SetGeneralLocalization{
	name = "Flamegor"
}


-----------------------
--  Vulnerabilities  --
-----------------------
-- Chromaggus, Death Talon Overseer and Death Talon Wyrmguard
L = DBM:GetModLocalization("TalonGuards")

L:SetGeneralLocalization{
	name = "Talon Guards"
}
L:SetWarningLocalization{
	WarnVulnerable		= "%s Vulnerability"
}
L:SetOptionLocalization{
	WarnVulnerable		= "Show warning for spell vulnerabilities"
}
L:SetMiscLocalization{
	Fire		= "Fire",
	Nature		= "Nature",
	Frost		= "Frost",
	Shadow		= "Shadow",
	Arcane		= "Arcane",
	Holy		= "Holy"
}


------------------
--  Chromaggus  --
------------------
L = DBM:GetModLocalization("Chromaggus")

L:SetGeneralLocalization{
	name = "Chromaggus"
}
L:SetWarningLocalization{
	WarnBreath		= "%s",
	WarnVulnerable	= "%s Vulnerability"
}
L:SetTimerLocalization{
	TimerBreathCD	= "%s CD",
	TimerBreath		= "%s cast",
	TimerVulnCD		= "Vulnerability CD"
}
L:SetOptionLocalization{
	WarnBreath		= "Show warning when Chromaggus casts one of his Breaths",
	WarnVulnerable	= "Show warning for spell vulnerabilities",
	TimerBreathCD	= "Show Breath CD",
	TimerBreath		= "Show Breath cast",
	TimerVulnCD		= "Show Vulnerability CD"
}
L:SetMiscLocalization{
	Breath1		= "First Breath",
	Breath2		= "Second Breath",
	VulnEmote	= "%s flinches as its skin shimmers.",
	Fire		= "Fire",
	Nature		= "Nature",
	Frost		= "Frost",
	Shadow		= "Shadow",
	Arcane		= "Arcane",
	Holy		= "Holy"
}

----------------
--  Nefarian  --
----------------
L = DBM:GetModLocalization("Nefarian-Classic")

L:SetGeneralLocalization{
	name = "Nefarian"
}
L:SetWarningLocalization{
	WarnAddsLeft		= "%d kills remaining",
	WarnClassCall		= "%s call"
}
L:SetTimerLocalization{
	TimerClassCall		= "%s call ends"
}
L:SetOptionLocalization{
	TimerClassCall		= "Show timer for class call duration",
	WarnAddsLeft		= "Announce kills remaining until Stage 2 is triggered",
	WarnClassCall		= "Announce class calls"
}
L:SetMiscLocalization{
    YellP1			= "Que les jeux commencent !",
    YellP2			= "Beau travail ! Le courage des mortels commence à faiblir ! Voyons maintenant s'ils peuvent lutter contre le véritable seigneur du pic Blackrock !",
    YellP3			= "C'est impossible ! Relevez-vous, serviteurs ! Servez une nouvelle fois votre maître !",
    YellShaman		= "Chamans, montrez-moi ce que vos totems peuvent faire !",
    YellPaladin		= "Les paladins... J'en entendu dire que vous aviez de nombreuses vies... Montrez-moi.",
    YellDruid		= "Les druides et leur stupides changements de forme. Voyons ce qu'ils donnent en vrai...",
    YellPriest		= "Prêtres ! Si vous continuez à soigner comme ça, nous pourrions rendre le processus plus intéressant !",
    YellWarrior		= "Guerriers, je sais que vous pouvez frapper plus fort que ça ! Voyons ça !",
    YellRogue		= "Voleurs, arrêtez de vous cacher et affrontez-moi !",
    YellWarlock		= "Démonistes, vous ne devriez pas jouer avec une magie qui vous dépasse. Vous voyez ce qui arrive ?",
    YellHunter		= "Ah, les chasseurs et les stupides sarbacanes !",
    YellMage		= "Les mages aussi ? Vous devriez être plus prudents lorsque vous jouez avec la magie."
}
