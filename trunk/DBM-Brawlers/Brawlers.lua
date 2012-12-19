local mod	= DBM:NewMod("Brawlers", "DBM-Brawlers")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
--mod:SetCreatureID(60491)
--mod:SetModelID(41448)
mod:SetZone()

mod:RegisterEvents(
	"CHAT_MSG_MONSTER_YELL",
	"UNIT_SPELLCAST_SUCCEEDED"
)

local specWarnYourTurn			= mod:NewSpecialWarning("specWarnYourTurn")

local berserkTimer				= mod:NewBerserkTimer(120)--all fights have a 2 min enrage to 134545. some fights have an earlier berserk though.

mod:AddBoolOption("SpectatorMode", true)
mod:RemoveOption("HealthFrame")
mod:RemoveOption("SpeedKillTimer")

local matchActive = false
local lastMatch = 0
local playerIsFighting = false
local currentRank = 0--Used to stop bars for the right sub mod based on dynamic rank detection from pulls

function mod:PlayerFighting() -- for external mods
	return playerIsFighting
end

function mod:CHAT_MSG_MONSTER_YELL(msg, npc, _, _, target)
--	"<17.2 15:06:00> [CHAT_MSG_MONSTER_YELL] CHAT_MSG_MONSTER_YELL#Now entering the arena: a Rank 1 human warrior, Omegal! Omegal is pretty new around here, so go easy!#Bizmo###Omegal##0#0##0#988##0#false#false"
	local isMatchBegin = true
	if msg:find(L.Rank1) then
		currentRank = 1
	elseif msg:find(L.Rank2) then
		currentRank = 2
	elseif msg:find(L.Rank3) then
		currentRank = 3
	elseif msg:find(L.Rank4) then
		currentRank = 4
	elseif msg:find(L.Rank5) then
		currentRank = 5
	elseif msg:find(L.Rank6) then
		currentRank = 6
	elseif msg:find(L.Rank7) then
		currentRank = 7
	elseif msg:find(L.Rank8) then
		currentRank = 8
	else
		isMatchBegin = false
	end
	if isMatchBegin then
		if target == UnitName("player") then
			specWarnYourTurn:Show()
			playerIsFighting = true
		end
		self:SendSync("MatchBegin")
	elseif matchActive and (msg:find(L.Victory1) or msg:find(L.Victory2) or msg:find(L.Victory3) or msg:find(L.Victory4) or msg:find(L.Victory5) or msg:find(L.Victory6) or msg:find(L.Lost1) or msg:find(L.Lost2) or msg:find(L.Lost3) or msg:find(L.Lost4) or msg:find(L.Lost5) or msg:find(L.Lost6) or msg:find(L.Lost7) or msg:find(L.Lost8) or msg:find(L.Lost9)) then
		self:SendSync("MatchEnd")
	end
end

--Only fires for target, focus, mouseover. So we still need all the yells for the average user not targeting player.
--None the less, this rendency should catch more match ends if "player" casting it is in a buff group with us.
function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, _, _, spellId)
	--"<43.1 01:41:37> [UNIT_SPELLCAST_SUCCEEDED] All�nnar [[focus:General Trigger 1::0:136195]]", -- [251]
	if spellId == 136195 and self:AntiSpam() then
		print("Brawlers: Teleport Detected")
		if playerIsFighting then--We check playerIsFighting to filter bar brawls, this should only be true if we were ported into ring.
			playerIsFighting = false
		end
		if GetTime() - lastMatch < 10 then
			self:SendSync("MatchEnd", "T")
		end
	end
end

--Most group up for this so they can buff eachother for matches. Syncing should greatly improve reliability, especially for match end since the person fighting definitely should detect that (probably missing yells still)
function mod:OnSync(msg, source)
	if msg == "MatchBegin" then
		lastMatch = GetTime()
		self:Stop()--Sometimes bizmo doesn't yell when a match ends too early, if a new match begins we stop on begin before starting new stuff
		matchActive = true
		berserkTimer:Start()
	elseif msg == "MatchEnd" then
		if source == "T" and GetTime() - lastMatch < 10 then return end--Try to ignore teleport casts from player/monster porting into ring on match start
		matchActive = false
		self:Stop()
		local mod2 = DBM:GetModByName("BrawlRank" .. currentRank)
		if mod2 then
			mod2:Stop()--Stop all timers and warnings
		end
	end
end
