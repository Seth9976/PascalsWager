-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10001.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10001_Define")

TrickGroup10001 = class("TrickGroup10001", TrickGroupBase)

function TrickGroup10001:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.createTime = 0
	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Light
	self.playMode = TrickGroupBase.PlayMode.SequenceLoop
end

function TrickGroup10001:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	local nowTime = TimeHelper.getNowTime()

	self.createTime = nowTime + MathHelper.getRandom(TrickGroup10001_Define.TimeIntervalMin, TrickGroup10001_Define.TimeIntervalMax, 5)

	self:Start()

	return true
end

function TrickGroup10001:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	local nowTime = TimeHelper.getNowTime()

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil then
			if trick:IsPlaying() == false then
				if nowTime > self.createTime then
					local target = self.sceneController:GetHostPlayer()
					local targetPos = target:GetPosByWorldPos()
					local tmpPos = Vector3.forward

					if MathHelper.getRandomResult(TrickGroup10001_Define.HitTargetRate, 1) then
						tmpPos:SetVector3(targetPos)
					else
						local tmpRot1 = Quaternion.Euler(0, MathHelper.getRandom(0, 360, 2), 0)

						tmpPos:MulQuat(tmpRot1)
						tmpPos:Mul(MathHelper.getRandom(TrickGroup10001_Define.TrickDisMin, TrickGroup10001_Define.TrickDisMax, 3))
						tmpPos:Add(targetPos)
					end

					local tmpRet, tmpGroundPos, tmpGroundN, tmpGroundInstanceID = self.scene:GetGroundPosition(tmpPos, tmpPos.y + TrickGroup10001_Define.TrickCheckGroundOffsetY, TrickGroup10001_Define.TrickCheckGroundDistance)

					tmpPos = nil
					tmpRot1 = nil
					targetPos = nil

					if tmpRet == true then
						local tmpRot2 = Quaternion.Euler(0, MathHelper.getRandom(0, 360, 4), 0)

						trick:SetPosition(tmpGroundPos)
						trick:SetRotation(tmpRot2)
						trick:Play()

						self.createTime = nowTime + MathHelper.getRandom(TrickGroup10001_Define.TimeIntervalMin, TrickGroup10001_Define.TimeIntervalMax, 5)
						tmpRot2 = nil
						tmpGroundPos = nil
						tmpGroundN = nil

						break
					end

					tmpGroundPos = nil
					tmpGroundN = nil
				end
			elseif trick:IsTriggerTime(TrickGroup10001_Define.TrapNormalizeTime) then
				trick:AddTrap(trick:GetPosition())
			end
		end
	end
end

return TrickGroup10001
