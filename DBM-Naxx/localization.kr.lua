if GetLocale() ~= "koKR" then return end

local L

-------------------
--  아눕레칸     --
-------------------
L = DBM:GetModLocalization("Anub'Rekhan")

L:SetGeneralLocalization({
	name = "아눕레칸"
})

L:SetOptionLocalization({
	ArachnophobiaTimer	= "거미의 공포 타이머 바 보기 (업적)"
})


L:SetMiscLocalization({
	ArachnophobiaTimer	= "거미의 공포",
	Pull1				= "그래, 도망쳐! 더 신선한 피가 솟구칠 테니!",
	Pull2				= "어디 맛 좀 볼까..."
})

---------------------
--  귀부인 펠리나  --
---------------------
L = DBM:GetModLocalization("Faerlina")

L:SetGeneralLocalization({
	name = "귀부인 펠리나"
})

L:SetWarningLocalization({
	WarningEmbraceExpire	= "5초 후 귀부인의 은총 종료",
	WarningEmbraceExpired	= "귀부인의 은총 종료"
})

L:SetOptionLocalization({
	WarningEmbraceExpire	= "귀부인의 은총 종료 사전 경고 보기",
	WarningEmbraceExpired	= "귀부인의 은총 종료 경고 보기"
})

L:SetMiscLocalization({
	Pull					= "내 앞에 무릎을 꿇어라, 벌레들아!"
})

---------------
--  맥스나   --
---------------
L = DBM:GetModLocalization("Maexxna")

L:SetGeneralLocalization({
	name = "맥스나"
})

L:SetWarningLocalization({
	WarningSpidersSoon	= "5초 후 맥스나의 새끼 거미",
	WarningSpidersNow	= "맥스나의 새끼 거미"
})

L:SetTimerLocalization({
	TimerSpider		= "다음 맥스나의 새끼 거미"
})

L:SetOptionLocalization({
	WarningSpidersSoon	= "맥스나의 새끼 거미 사전 경고 보기",
	WarningSpidersNow	= "맥스나의 새끼 거미 경고 보기",
	TimerSpider			= "다음 맥스나의 새끼 거미 타이머 바 보기"
})

L:SetMiscLocalization({
	ArachnophobiaTimer	= "거미의 공포"
})

---------------------
--  역병술사 노스  --
---------------------
L = DBM:GetModLocalization("Noth")

L:SetGeneralLocalization({
	name = "역병술사 노스"
})

L:SetWarningLocalization({
	WarningTeleportNow	= "순간이동",
	WarningTeleportSoon	= "20초 후 순간이동"
})

L:SetTimerLocalization({
	TimerTeleport		= "순간이동",
	TimerTeleportBack	= "방으로 복귀"
})

L:SetOptionLocalization({
	WarningTeleportNow		= "순간이동 경고 보기",
	WarningTeleportSoon		= "순간이동 사전 경고 보기",
	TimerTeleport			= "순간이동 타이머 바 보기",
	TimerTeleportBack		= "방으로 복귀 타이머 바 보기"
})

L:SetMiscLocalization({
	Pull				= "죽어라, 침입자들아!",
	AddsYell			= "일어나라, 병사들이여! 다시 일어나 싸워라!",
--	Adds				= "summons forth Skeletal Warriors!",
--	AddsTwo				= "raises more skeletons!"
})

--------------------------
--  부정의 헤이건  --
--------------------------
L = DBM:GetModLocalization("Heigan")

L:SetGeneralLocalization({
	name = "부정의 헤이건"
})

L:SetWarningLocalization({
	WarningTeleportNow	= "순간이동",
	WarningTeleportSoon	= "%d초 후 순간이동"
})

L:SetTimerLocalization({
	TimerTeleport		= "순간이동"
})

L:SetOptionLocalization({
	WarningTeleportNow		= "순간이동 경고 보기",
	WarningTeleportSoon		= "순간이동 사전 경고 보기",
	TimerTeleport			= "순간이동 타이머 바 보기"
})

L:SetMiscLocalization({
	Pull				= "이제 넌 내 것이다."
})

----------------
--  로데브  --
----------------
L = DBM:GetModLocalization("Loatheb")

L:SetGeneralLocalization({
	name = "로데브"
})

L:SetWarningLocalization({
	WarningHealSoon		= "3초 후 치유 가능",
	WarningHealNow		= "힐 하세요"
})

L:SetOptionLocalization({
	WarningHealSoon		= "3초 치유 가능 시간 사전 경고 보기",
	WarningHealNow		= "3초 치유 가능 시간 경고 보기"
})

-----------------
--  패치워크  --
-----------------
L = DBM:GetModLocalization("Patchwerk")

L:SetGeneralLocalization({
	name = "패치워크"
})

L:SetOptionLocalization({
})

L:SetMiscLocalization({
	yell1			= "패치워크랑 놀아줘!",
	yell2			= "켈투자드님이 패치워크 싸움꾼으로 만들었다."
})

-----------------
--  그라불루스  --
-----------------
L = DBM:GetModLocalization("Grobbulus")

L:SetGeneralLocalization({
	name = "그라불루스"
})

-------------
--  글루스  --
-------------
L = DBM:GetModLocalization("Gluth")

L:SetGeneralLocalization({
	name = "글루스"
})

----------------
--  타디우스  --
----------------
L = DBM:GetModLocalization("Thaddius")

L:SetGeneralLocalization({
	name = "타디우스"
})

L:SetMiscLocalization({
	Yell	= "스탈라그, 박살낸다!",
	Emote	= "%s 과부하 상태가 됩니다.",
	Emote2	= "테슬라 코일이 과부하 상태가 됩니다.",
	Boss1	= "퓨진",
	Boss2	= "스탈라그",
	Charge1	= "음전하",
	Charge2	= "양전하"
})

L:SetOptionLocalization({
	WarningChargeChanged	= "극성이 바뀔때 특수 알림 보기",
	WarningChargeNotChanged	= "극성이 바뀌지 않으면 특수 알림 보기",
	ArrowsEnabled			= "$spell:28089 동안 화살표 보기",
	TwoCamp					= "화살표 보기 (일반 \"2점\" 택틱)",
	ArrowsRightLeft			= "\"4점\" 택틱 왼쪽/오른쪽 화살표 보기 (극성이 바뀌면 왼쪽 화살표가 나오고 바뀌지 않으면 오른쪽이 나옴)",
	ArrowsInverse			= "역 \"4점\" 택틱 (극성이 바뀌면 오른쪽 화살표가 나오고 바뀌지 않으면 왼쪽이 나옴)"
})

L:SetWarningLocalization({
	WarningChargeChanged	= "극성 변경: %s",
	WarningChargeNotChanged	= "극성 변경 안됨"
})

---------------------------
--  훈련교관 라주비어스  --
---------------------------
L = DBM:GetModLocalization("Razuvious")

L:SetGeneralLocalization({
	name = "훈련교관 라주비어스"
})

L:SetMiscLocalization({
	Yell1 = "절대 봐주지 마라!",
	Yell2 = "훈련은 끝났다! 배운 걸 보여줘라!",
	Yell3 = "훈련받은 대로 해!",
	Yell4 = "다리를 후려 차라! 무슨 문제 있나?"
})

L:SetOptionLocalization({
	WarningShieldWallSoon	= "뼈 보호막 종료 사전 경고 보기"
})

L:SetWarningLocalization({
	WarningShieldWallSoon	= "뼈 보호막 종료 5초 전"
})

------------------------
--  영혼 착취자 고딕  --
------------------------
L = DBM:GetModLocalization("Gothik")

L:SetGeneralLocalization({
	name = "영혼 착취자 고딕"
})

L:SetOptionLocalization({
	TimerWave			= "다음 병력 타이머 바 보기",
	TimerPhase2			= "2단계 타이머 바 보기",
	WarningWaveSoon		= "병력 사전 경고 보기",
	WarningWaveSpawned	= "병력 등장시 경고 보기",
	WarningRiderDown	= "무자비한 죽음의 기병을 잡으면 경고 보기",
	WarningKnightDown	= "무자비한 죽음의 기사를 잡으면 경고 보기"
})

L:SetTimerLocalization({
	TimerWave	= "%d번 병력",
	TimerPhase2	= "2단계"
})

L:SetWarningLocalization({
	WarningWaveSoon		= "%d번 병력: %s 3초 전",
	WarningWaveSpawned	= "%d번 병력: %s",
	WarningRiderDown	= "기병 잡음",
	WarningKnightDown	= "기사 잡음",
	WarningPhase2		= "2단계"
})

L:SetMiscLocalization({
	yell			= "어리석은 것들, 스스로 죽음을 자초하다니!",
	WarningWave2	= "%d %s, %d %s",
	WarningWave3	= "%d %s, %d %s, %d %s",
	Trainee			= "수련생",
	Knight			= "기사",
	Horse			= "말 망령",
	Rider			= "기병"
})

--------------------
--  4인의 기사단  --
--------------------
L = DBM:GetModLocalization("Horsemen")

L:SetGeneralLocalization({
	name = "4인의 기사단"
})

L:SetOptionLocalization({
	WarningMarkSoon				= "징표 사전 경고 보기",
	SpecialWarningMarkOnPlayer	= "징표가 4개 이상 걸리면 특수 알림 보기",
	timerMark					= "다음 기사의 징표 타이머 바 보기 (횟수 포함)",
})

L:SetWarningLocalization({
	timerMark	= "%d번 징표",
})

L:SetWarningLocalization({
	WarningMarkSoon				= "3초 후 %d번 징표",
})

L:SetMiscLocalization({
	Korthazz	= "영주 코스아즈",
	Rivendare	= "남작 리븐데어",
	Blaumeux	= "여군주 블라미우스",
	Zeliek		= "젤리에크 경"
})

--------------
--  사피론  --
--------------
L = DBM:GetModLocalization("Sapphiron")

L:SetGeneralLocalization({
	name = "사피론"
})

L:SetOptionLocalization({
	WarningAirPhaseSoon		= "비행 단계 사전 경고 보기",
	WarningAirPhaseNow		= "비행 단계 알림 보기",
	WarningLanded			= "지상 단계 알림 보기",
	TimerAir				= "비행 단계 타이머 바 보기",
	TimerLanding			= "착지 중 타이머 바 보기",
	TimerIceBlast			= "냉기 숨결 타이머 바 보기",
	WarningDeepBreath		= "냉기 숨결 특수 알림 보기"
})

L:SetMiscLocalization({
	EmoteBreath				= "숨을 깊게 들이마십니다."
})

L:SetWarningLocalization({
	WarningAirPhaseSoon		= "비행 단계 10초 전",
	WarningAirPhaseNow		= "비행 단계",
	WarningLanded			= "사피론 내려옴",
	WarningDeepBreath		= "냉기 숨결"
})

L:SetTimerLocalization({
	TimerAir				= "비행 단계",
	TimerLanding			= "착지 중",
	TimerIceBlast			= "냉기 숨결"
})

------------------
--  켈투자드  --
------------------
L = DBM:GetModLocalization("Kel'Thuzad")

L:SetGeneralLocalization({
	name = "켈투자드"
})

L:SetOptionLocalization({
	TimerPhase2			= "2단계 타이머 바 보기",
	specwarnP2Soon		= "켈투자드 전투 개시 10초 전에 특수 알림 보기",
	warnAddsSoon		= "얼음왕관의 수호자 사전 경고 보기"
})

L:SetMiscLocalization({
	Yell 				= "어둠의 문지기와 하수인, 그리고 병사들이여! 나 켈투자드가 부르니 명을 받들라!"
})

L:SetWarningLocalization({
	specwarnP2Soon		= "10초 후 켈투자드 전투 개시",
	warnAddsSoon		= "곧 얼음왕관의 수호자 등장"
})

L:SetTimerLocalization({
	TimerPhase2			= "2단계"
})
