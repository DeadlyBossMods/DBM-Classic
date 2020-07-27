-- Mini Dragon(projecteurs AT gmail.com) Brilla@金色平原
-- Last update: 2019/08/22

if GetLocale() ~= "zhCN" then return end
local L

------------
-- Skeram --
------------
L = DBM:GetModLocalization("Skeram")

L:SetGeneralLocalization{
	name = "预言者斯克拉姆"
}

----------------
-- Three Bugs --
----------------
L = DBM:GetModLocalization("ThreeBugs")

L:SetGeneralLocalization{
	name = "安其拉三宝"
}
L:SetMiscLocalization{
	Yauj = "亚尔基公主",
	Vem = "维姆",
	Kri = "克里勋爵"
}

-------------
-- Sartura --
-------------
L = DBM:GetModLocalization("Sartura")

L:SetGeneralLocalization{
	name = "沙尔图拉"
}

--------------
-- Fankriss --
--------------
L = DBM:GetModLocalization("Fankriss")

L:SetGeneralLocalization{
	name = "顽强的范克瑞斯"
}

--------------
-- Viscidus --
--------------
L = DBM:GetModLocalization("Viscidus")

L:SetGeneralLocalization{
	name = "维希度斯"
}
L:SetWarningLocalization{
	WarnFreeze	= "冰冻:%d/3",
	WarnShatter	= "打碎:%d/3"
}
L:SetOptionLocalization{
	WarnFreeze	= "提示冰冻状态",
	WarnShatter	= "提示打碎状态"
}
L:SetMiscLocalization{
	Slow	= "开始减速!",
	Freezing= "冻住了",
	Frozen	= "变成冰冻的固体!",
	Phase4 	= "开始爆裂!",
	Phase5 	= "看來准备好毁灭了!",
	Phase6 	= "爆炸."
}
-------------
-- Huhuran --
-------------
L = DBM:GetModLocalization("Huhuran")

L:SetGeneralLocalization{
	name = "哈霍兰公主"
}
---------------
-- Twin Emps --
---------------
L = DBM:GetModLocalization("TwinEmpsAQ")

L:SetGeneralLocalization{
	name = "双子皇帝"
}
L:SetMiscLocalization{
	Veklor = "维克洛尔大帝",
	Veknil = "维克尼拉斯大帝"
}

------------
-- C'Thun --
------------
L = DBM:GetModLocalization("CThun")

L:SetGeneralLocalization{
	name = "克苏恩"
}
L:SetWarningLocalization{
	WarnEyeTentacle			= "眼球触须",
	SpecWarnWeakened		= "克苏恩变得虚弱了!"
}
L:SetTimerLocalization{
	TimerEyeTentacle		= "下一次眼球触须",
	TimerWeakened			= "虛弱結束"
}
L:SetOptionLocalization{
	WarnEyeTentacle			= "为眼球触须显示警告",
	WarnWeakened			= "当首领虚弱時显示警告",
	SpecWarnWeakened		= "当首领虚弱時显示特別警告",
	TimerEyeTentacle		= "为下一次眼球触须显示计时器",
	TimerWeakened			= "为首领虚弱時间显示计时器",
	RangeFrame				= "显示距离框架(10码)"
}
L:SetMiscLocalization{
	Eye			= "克苏恩之眼",
	Weakened 	= "变弱了",
    NotValid	= "AQ40 击杀信息： %s 首领未击杀。"
}
----------------
-- Ouro --
----------------
L = DBM:GetModLocalization("Ouro")

L:SetGeneralLocalization{
	name = "奥罗"
}
L:SetWarningLocalization{
	WarnSubmerge		= "钻地",
	WarnEmerge			= "现身"
}
L:SetTimerLocalization{
	TimerSubmerge		= "钻地",
	TimerEmerge			= "现身"
}
L:SetOptionLocalization{
	WarnSubmerge		= "为钻地显示警告",
	TimerSubmerge		= "为钻地显示计时器",
	WarnEmerge			= "为现身显示警告",
	TimerEmerge			= "为现身显示计时器"
}
----------------
-- AQ40 Trash --
----------------
L = DBM:GetModLocalization("AQ40Trash")

L:SetGeneralLocalization{
	name = "AQ40：全程计时"
}
