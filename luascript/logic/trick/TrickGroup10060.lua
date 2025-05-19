-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10060.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10060_Define")

TrickGroup10060 = class("TrickGroup10060", TrickGroupBase)

function TrickGroup10060:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Up
	self.playMode = TrickGroupBase.PlayMode.Multiply
	self.signalPos = nil
	self.signalIndex = 0
end

function TrickGroup10060:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	local target = self.sceneController:GetHostPlayer()

	if target == nil then
		return false
	end

	local trick = self:OpenTrickSingle(pos, rot)

	if trick == nil then
		return false
	end

	trick:SetStepAndTime(Trick.Step.Ready, TimeHelper.getNowTime())
	trick:SetStepTargetPosition(target:GetPosByWorldPos())
	self:Start()

	return true
end

function TrickGroup10060:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == true then
			local step = trick:GetStep()
			local stepTime = trick:GetStepTime()
			local stepPos = trick:GetStepTargetPosition()

			if step == Trick.Step.Ready then
				local nowTime = TimeHelper.getNowTime()

				if nowTime > stepTime + TrickGroup10060_Define.BeforeTime then
					local target = self.sceneController:GetHostPlayer()

					if target ~= nil then
						local targetPos = target:GetPosByWorldPos()
						local targetDir = targetPos - stepPos

						targetDir.y = 0

						local sPos

						if MathHelper.IsZero(targetDir.sqrMagnitude) == false then
							local dis = targetDir.magnitude
							local diffTime = nowTime - stepTime
							local speed = dis / diffTime

							dis = speed * TrickGroup10060_Define.ShowTime

							targetDir:SetNormalize()
							targetDir:Mul(dis)
							targetDir:Add(targetPos)

							local tmpRet, tmpGroundPos, tmpGroundN, tmpGroundInstanceID = self.scene:GetGroundPosition(targetDir, targetDir.y + TrickGroup10060_Define.TrickCheckGroundOffsetY, TrickGroup10060_Define.TrickCheckGroundDistance)

							if tmpRet == true then
								sPos = tmpGroundPos
							else
								sPos = targetDir
							end
						else
							sPos = targetPos
						end

						if sPos ~= nil then
							trick:SetPosition(sPos)

							self.signalIndex = self.signalIndex + 1

							if self.signalPos == nil then
								self.signalPos = {}
							end

							if self.signalPos[self.signalIndex] ~= nil then
								self.signalPos[self.signalIndex]:SetVector3(sPos)
							else
								self.signalPos[self.signalIndex] = sPos:Clone()
							end
						end

						trick:SetStepAndTime(Trick.Step.Start, nowTime)

						targetDir = nil
						targetPos = nil
					end
				end
			end
		end
	end
end

function TrickGroup10060:Reset()
	self.signalPos = nil
	self.signalIndex = 0
end

function TrickGroup10060:Stop()
	TrickGroupBase.Stop(self)
end

function TrickGroup10060:GetSignalPos(index)
	if self.signalPos ~= nil and self.signalPos[index] ~= nil then
		return self.signalPos[index]
	end

	return nil
end

function TrickGroup10060:GetSignalCnt()
	return self.signalIndex
end

function TrickGroup10060:Exit()
	self.signalPos = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10060
