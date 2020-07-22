if GetLocale() ~= "zhCN" then return end
local L

---------------
-- Kurinnaxx --
---------------
L = DBM:GetModLocalization("Kurinnaxx")

L:SetGeneralLocalization{
	name 		= "库林纳克斯"
}

------------
-- Rajaxx --
------------
L = DBM:GetModLocalization("Rajaxx")

L:SetGeneralLocalization{
	name 		= "拉贾克斯将军"
}
L:SetWarningLocalization{
	WarnWave	= "进攻次数%s",
}
L:SetOptionLocalization{
	WarnWave	= "为下一次进攻显示提示"
}
L:SetMiscLocalization{
	Wave12		= "它们来了。尽量别被它们干掉，新兵。",
	Wave3		= "我们惩罚的时刻就在眼前!让黑暗支配敌人的内心吧!",
	Wave4		= "我们不需在被禁堵的门与石墙后等待了!我们的复仇将不再被否认!巨龙将在我们的愤怒之前颤抖!",
	Wave5		= "恐惧是给敌人的!恐惧与死亡!",
	Wave6		= "鹿盔将为了活命而啜泣、乞求，就像他的儿子一样!一千年的不公将在今日结束!",
	Wave7		= "范达尔!你的时候到了!躲进翡翠梦境祈祷我们永远不会找到你吧!",
	Wave8		= "厚颜无耻的笨蛋!我要亲手杀了你!"
}

----------
-- Moam --
----------
L = DBM:GetModLocalization("Moam")

L:SetGeneralLocalization{
	name 		= "莫阿姆"
}

----------
-- Buru --
----------
L = DBM:GetModLocalization("Buru")

L:SetGeneralLocalization{
	name 		= "吞咽者布鲁"
}
L:SetWarningLocalization{
	WarnPursue		= ">%s<被追击了",
	SpecWarnPursue	= "你被追击了",
	WarnDismember	= ">%2$s<中了%1$s(%s)"
}
L:SetOptionLocalization{
	WarnPursue		= "提示被追击的目标",
	SpecWarnPursue	= "当你被追击的时候显示特別警告"
}
L:SetMiscLocalization{
	PursueEmote 	= "%s凝视着%s!"
}

-------------
-- Ayamiss --
-------------
L = DBM:GetModLocalization("Ayamiss")

L:SetGeneralLocalization{
	name 		= "狩猎者阿亚米斯"
}

--------------
-- Ossirian --
--------------
L = DBM:GetModLocalization("Ossirian")

L:SetGeneralLocalization{
	name 		= "无疤者奥斯里安"
}
L:SetWarningLocalization{
	WarnVulnerable	= "%s"
}
L:SetTimerLocalization{
	TimerVulnerable	= "%s"
}
L:SetOptionLocalization{
	WarnVulnerable	= "提示虛弱",
	TimerVulnerable	= "为虛弱显示计时器"
}

----------------
-- AQ20 Trash --
----------------
L = DBM:GetModLocalization("AQ20Trash")

L:SetGeneralLocalization{
	name = "AQ20 Trash"
}
