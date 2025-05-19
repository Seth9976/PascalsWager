-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10007.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10007_Define")

TrickGroup10007 = class("TrickGroup10007", TrickGroupBase)
TrickGroup10007.static.Status = {
	End = 4,
	Loop = 3,
	Ready = 1,
	Start = 2,
	Wait = 0
}

function TrickGroup10007:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Period
	self.hitType = AnimalBase_Define.HitType.Dizzy
	self.playMode = TrickGroupBase.PlayMode.Sequence
	self.statusList = nil
	self.timeList = nil
	self.posList = nil
	self.hitList = nil
end

function TrickGroup10007:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	if self.statusList == nil then
		self.statusList = {}
	end

	if self.timeList == nil then
		self.timeList = {}
	end

	if self.posList == nil then
		self.posList = {}
	end

	if self.hitList == nil then
		self.hitList = {}
	end

	local nowTime = TimeHelper.getNowTime()

	for i = 1, #self.trickList do
		self.statusList[i] = TrickGroup10007.Status.Wait
		self.timeList[i] = nowTime + TrickGroup10007_Define.IntervalTime * (i - 1)
		self.posList[i] = Vector3.zero
		self.hitList[i] = nil
	end

	self:Start()

	return true
end

function TrickGroup10007:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	local target = self.sceneController:GetHostPlayer()
	local nowTime = TimeHelper.getNowTime()

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil then
			if self.statusList[i] == TrickGroup10007.Status.Wait then
				if nowTime >= self.timeList[i] then
					self.statusList[i] = TrickGroup10007.Status.Ready
					self.timeList[i] = nowTime

					self.posList[i]:SetVector3(target:GetPosByWorldPos())

					self.hitList[i] = nil
				end
			elseif self.statusList[i] == TrickGroup10007.Status.Ready then
				local diffTime = nowTime - self.timeList[i]

				if diffTime > TrickGroup10007_Define.BeforeTime and self.stopReady == false and self.isOpen == true then
					self.statusList[i] = TrickGroup10007.Status.Start

					local dis = Vector3.Distance(self.posList[i], target:GetPosByWorldPos())
					local speed = dis / diffTime

					dis = speed * TrickGroup10007_Define.ColliderStartTime

					self.posList[i]:SetVector3(target:GetForward())
					self.posList[i]:Mul(dis)
					self.posList[i]:Add(target:GetPosByWorldPos())
					trick:SetPosition(self.posList[i])
					trick:Play()

					self.timeList[i] = nowTime
				end
			elseif self.statusList[i] == TrickGroup10007.Status.Start then
				if trick:IsPlaying() == true and self.stopReady == false and self.isOpen == true and trick:IsHaveHitAnimal(target) == true then
					self.hitList[i] = target
					self.timeList[i] = nowTime

					trick:SetParamTrigger(TrickGroup10007_Define.Param)

					self.statusList[i] = TrickGroup10007.Status.Loop

					target:SetPosByWorldPos(self.posList[i], true)

					local tmpPos = target:GetPosByWorldPos()

					target:KeepHitPeriod()
					self:StopReady()
				end
			elseif self.statusList[i] == TrickGroup10007.Status.Loop then
				if trick:IsPlaying() == true then
					if self.hitList[i] ~= nil then
						self.hitList[i]:KeepHitPeriod()
						self.hitList[i]:SetPosByWorldPos(self.posList[i], true)
					end

					if nowTime - self.timeList[i] > TrickGroup10007_Define.LoopTime then
						self.statusList[i] = TrickGroup10007.Status.End

						trick:ClearHitAnimal()
						trick:SetParamTrigger(TrickGroup10007_Define.Param)
					end
				end
			elseif self.statusList[i] == TrickGroup10007.Status.End then
				-- block empty
			end
		end
	end
end

function TrickGroup10007:Exit()
	self.statusList = nil
	self.timeList = nil
	self.posList = nil
	self.hitList = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10007
