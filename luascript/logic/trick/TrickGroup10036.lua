-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10036.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10036_Define")

TrickGroup10036 = class("TrickGroup10036", TrickGroupBase)

function TrickGroup10036:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Down
	self.playMode = TrickGroupBase.PlayMode.AutoLoop
	self.hitTime = {}
end

function TrickGroup10036:OpenAuto()
	TrickGroupBase.OpenAuto(self)
	self:OpenDelay(TrickGroup10036_Define.DelayTime)
end

function TrickGroup10036:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	self:OpenTrickAll()
	self:Start()

	return true
end

function TrickGroup10036:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickList == nil or #self.trickList <= 0 or self.hitTime == nil then
		return
	end

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if self.hitTime[i] == nil or self.hitTime[i] <= 0 then
			if trick:IsHitAnimal() == true then
				self.hitTime[i] = TimeHelper.getNowTime()
			end
		else
			local nowTime = TimeHelper.getNowTime()

			if nowTime >= self.hitTime[i] + TrickGroup10036_Define.HitClearTime then
				trick:ClearHitAnimal()

				self.hitTime[i] = 0
			end
		end
	end
end

function TrickGroup10036:Exit()
	self.hitTime = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10036
