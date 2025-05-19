-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10008.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10008_Define")

TrickGroup10008 = class("TrickGroup10008", TrickGroupBase)

function TrickGroup10008:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Heavy
	self.playMode = TrickGroupBase.PlayMode.Sequence
end

function TrickGroup10008:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	local nowTime = TimeHelper.getNowTime()
	local rndList = {}

	for i = 1, TrickGroup10008_Define.Pattern do
		table.insert(rndList, i)
	end

	rndList = table.shuffle(rndList)

	if self.usedList == nil then
		self.usedList = {}
	end

	if self.timeList == nil then
		self.timeList = {}
	end

	if self.paramList == nil then
		self.paramList = {}
	end

	for i = 1, #self.trickList do
		self.timeList[i] = nowTime + TrickGroup10008_Define.IntervalTime * (i - 1)

		local index = i % #rndList + 1

		self.paramList[i] = rndList[index]
		self.usedList[i] = false
	end

	rndList = nil

	self:Start()

	return true
end

function TrickGroup10008:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	local target = self.sceneController:GetHostPlayer()
	local nowTime = TimeHelper.getNowTime()

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == false and self.usedList[i] == false and nowTime >= self.timeList[i] then
			local diffX = MathHelper.getRandomFloat(TrickGroup10008_Define.RangeX * -1, TrickGroup10008_Define.RangeX, i)
			local diffZ = MathHelper.getRandomFloat(TrickGroup10008_Define.RangeZ * -1, TrickGroup10008_Define.RangeZ, i)

			trick:SetPosition(target:GetPosByWorldPos(), diffX, diffZ)
			trick:Play()
			trick:SetParamInteger(TrickGroup10008_Define.Param, self.paramList[i])

			self.usedList[i] = true

			if i >= #self.trickList then
				self:StopReady()
			end
		end
	end
end

function TrickGroup10008:Exit()
	self.usedList = nil
	self.timeList = nil
	self.paramList = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10008
