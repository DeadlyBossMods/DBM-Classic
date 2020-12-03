if GetLocale() ~= "ptBR" then return end
local L

-- Lord Kazzak (Badlands)
L = DBM:GetModLocalization("KazzakClassic")

L:SetGeneralLocalization{
	name = "Lorde Kazzak"
}

L:SetMiscLocalization({
	Pull		= "Pela Legião! Por Kil'Jaeden!"
})

-- Azuregos (Azshara)
L = DBM:GetModLocalization("Azuregos")

L:SetGeneralLocalization{
	name = "Azuregos"
}

L:SetMiscLocalization({
	Pull		= "Este lugar está sob minha proteção. Os mistérios do arcano devem permanecer intactos."
})

-- Taerar (Ashenvale)
L = DBM:GetModLocalization("Taerar")

L:SetGeneralLocalization{
	name = "Taerar"
}

L:SetMiscLocalization({
	Pull		= "A paz é um sonho efêmero! Que os PESADELOS reinem soberanos!"
})

-- Ysondre (Feralas)
L = DBM:GetModLocalization("Ysondre")

L:SetGeneralLocalization{
	name = "Ysondra"
}

L:SetMiscLocalization({
	Pull		= "Os fios da VIDA foram cortados! Os Sonhadores serão vingados!"
})

-- Lethon (Hinterlands)
L = DBM:GetModLocalization("Lethon")

L:SetGeneralLocalization{
	name = "Lethon"
}

L:SetMiscLocalization({
	Pull		= "Eu sinto as TREVAS no coração de vocês. Não há descanso para os perversos!"
})

-- Emeriss (Duskwood)
L = DBM:GetModLocalization("Emeriss")

L:SetGeneralLocalization{
	name = "Emeriss"
}

L:SetMiscLocalization({
	Pull		= "A esperança é uma DOENÇA da alma! Estas terras definharão até a morte!"
})
