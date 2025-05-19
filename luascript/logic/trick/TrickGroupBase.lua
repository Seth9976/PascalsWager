-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroupBase.lua

require("LuaScript/Logic/Trick/Trick")

TrickGroupBase = class("TrickGroupBase")
TrickGroupBase.static.PlayMode = {
	Sequence = 5,
	Single = 1,
	MultiplyLoop = 4,
	AutoLoop = 7,
	SingleLoop = 2,
	SequenceLoop = 6,
	Multiply = 3
}

function TrickGroupBase:initialize(scene)
	self.trickList = {}
	self.isOpen = false
	self.openDelayTime = 0
	self.scene = scene
	self.sceneController = ST_Main.GetSceneController()
	self.controllerShell = self.sceneController:GetControllerShell()
	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Light
	self.stopCnt = 0
	self.stopReady = false
	self.stopDelayTime = 0
	self.playMode = TrickGroupBase.PlayMode.Single
	self.relativeTrickId = 0
	self.viewDistance = 0
	self.cameraCtrl = nil
end

function TrickGroupBase:SetViewDistance(dis)
	self.viewDistance = dis
	self.cameraCtrl = self.sceneController:GetCameraCtrl()
end

function TrickGroupBase:GetPlayMode()
	return self.playMode
end

function TrickGroupBase:AddTrick(trickId, trickTf)
	local trick = Trick:new(self.scene, trickId, trickTf)

	if trick ~= nil then
		trick:SetDamageType(self.damageType)
		trick:SetHitType(self.hitType)
		table.insert(self.trickList, trick)
	end
end

function TrickGroupBase:IsOpening()
	return self.isOpen
end

function TrickGroupBase:OpenDelay(time)
	if self.isOpen == false then
		self.openDelayTime = TimeHelper.getNowTime() + time
	end
end

function TrickGroupBase:OpenAuto()
	return
end

function TrickGroupBase:Open(pos, rot)
	return
end

function TrickGroupBase:SynchronizePosAndRot(pos, rot)
	return
end

function TrickGroupBase:SetRelativeTrickId(id)
	self.relativeTrickId = id
end

function TrickGroupBase:GetPosition()
	return nil
end

function TrickGroupBase:CheckOpen()
	if self:IsOpening() == true then
		if self.playMode == TrickGroupBase.PlayMode.Sequence or self.playMode == TrickGroupBase.PlayMode.SequenceLoop then
			self:Stop()
		elseif self.playMode == TrickGroupBase.PlayMode.Single or self.playMode == TrickGroupBase.PlayMode.SingleLoop then
			return false
		elseif self.playMode == TrickGroupBase.PlayMode.Multiply or self.playMode == TrickGroupBase.PlayMode.MultiplyLoop then
			return true
		else
			return false
		end
	end

	return true
end

function TrickGroupBase:Start()
	if self:IsOpening() == false then
		self.isOpen = true
		self.openDelayTime = 0
		self.stopCnt = 0
		self.stopReady = false
		self.stopDelayTime = 0
	end
end

function TrickGroupBase:OpenTrickAll()
	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == false then
			trick:Play()
		end
	end
end

function TrickGroupBase:OpenTrickSingle(pos, rot)
	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == false then
			if pos ~= nil then
				trick:SetPosition(pos)
			end

			if rot ~= nil then
				trick:SetRotation(rot)
			end

			trick:Play()

			return trick
		end
	end

	return nil
end

function TrickGroupBase:StopReady()
	if self:IsHaveTrickPlaying() == false then
		self:Stop()
	else
		self.stopReady = true
	end
end

function TrickGroupBase:Stop()
	self.isOpen = false
	self.openDelayTime = 0

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil then
			trick:Stop()
		end
	end

	self.stopReady = false
	self.stopDelayTime = 0
end

function TrickGroupBase:StopDelay(time)
	self.stopDelayTime = TimeHelper.getNowTime() + time
end

function TrickGroupBase:StopOne(i)
	if self.trickList[i] ~= nil then
		self.trickList[i]:Stop()

		self.stopCnt = self.stopCnt + 1

		if self.playMode == TrickGroupBase.PlayMode.Single or self.playMode == TrickGroupBase.PlayMode.SingleLoop then
			self:StopReady()
		end

		self:CheckStopAll()
	end
end

function TrickGroupBase:StopOneDelay(i)
	if self.trickList[i] ~= nil then
		self.trickList[i]:StopDelay()
	end
end

function TrickGroupBase:SetDelayClear(index, flag)
	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil then
			trick:SetDelayClear(index, flag)
		end
	end
end

function TrickGroupBase:IsHaveTrickPlaying()
	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == true then
			return true
		end
	end

	return false
end

function TrickGroupBase:CheckStopAll()
	if self.stopReady == true then
		if self:IsHaveTrickPlaying() == false then
			self:Stop()
		end
	elseif self.playMode == TrickGroupBase.PlayMode.Sequence and self.stopCnt >= #self.trickList then
		self:Stop()
	end
end

function TrickGroupBase:IsTrickHitTarget()
	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsHitAnimal() == true then
			return true
		end
	end

	return false
end

function TrickGroupBase:Update()
	if self:IsOpening() == false then
		if self.openDelayTime > 0 then
			local nowTime = TimeHelper.getNowTime()

			if nowTime > self.openDelayTime then
				self:Open()
			end
		end
	else
		if self.cameraCtrl ~= nil and self.playMode == TrickGroupBase.PlayMode.AutoLoop and self.viewDistance > 0 then
			local camPos = self.cameraCtrl:GetCameraRealPosition()

			for i = 1, #self.trickList do
				local trick = self.trickList[i]
				local disSquare = Vector3.DistanceSquare(camPos, trick:GetPosition())

				if trick:IsPlaying() == true then
					if disSquare > self.viewDistance * self.viewDistance then
						trick:Stop()
					else
						local ret = trick:Update()

						if ret == false then
							trick:Stop()
						end
					end
				elseif trick:IsUsed() == false and disSquare <= self.viewDistance * self.viewDistance then
					trick:Play()
				end
			end
		else
			for i = 1, #self.trickList do
				local trick = self.trickList[i]

				if trick ~= nil and trick:IsPlaying() == true then
					local ret = trick:Update()

					if ret == false then
						self:StopOne(i)
					elseif self.stopReady == true and (self.playMode == TrickGroupBase.PlayMode.SingleLoop or self.playMode == TrickGroupBase.PlayMode.SequenceLoop or self.playMode == TrickGroupBase.PlayMode.MultiplyLoop or self.playMode == TrickGroupBase.PlayMode.AutoLoop) and trick:IsLoopEnd() == true then
						self:StopOne(i)
					end
				end
			end
		end

		if self.stopDelayTime > 0 then
			local nowTime = TimeHelper.getNowTime()

			if nowTime > self.stopDelayTime then
				self:Stop()
			end
		end
	end
end

function TrickGroupBase:LateUpdate()
	if self:IsOpening() == false then
		return
	end

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == true then
			trick:LateUpdate()
		end
	end
end

function TrickGroupBase:Exit()
	if self.trickList ~= nil then
		for i, trick in pairs(self.trickList) do
			if trick ~= nil then
				trick:Exit()
			end
		end
	end

	self.trickList = nil
	self.sceneController = nil
	self.controllerShell = nil
	self.cameraCtrl = nil
end

return TrickGroupBase
