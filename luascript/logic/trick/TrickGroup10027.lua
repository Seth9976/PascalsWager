-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10027.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("LuaScript/Logic/Trick/Trick10027")
require("GameData/TrickDefine/TrickGroup10027_Define")

TrickGroup10027 = class("TrickGroup10027", TrickGroupBase)
TrickGroup10027.static.Status = {
	Trace = 1,
	Up = 3,
	Clear = 2,
	Empty = 0
}

function TrickGroup10027:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Tackle
	self.playMode = TrickGroupBase.PlayMode.Single
	self.trickActive = nil
	self.trickStatus = TrickGroup10027.Status.Empty
	self.trickTargetId = 0
	self.trickDir = Vector3.forward
end

function TrickGroup10027:AddTrick(trickId, trickTf)
	local trick = Trick10027:new(self.scene, trickId, trickTf)

	if trick ~= nil then
		trick:SetDamageType(self.damageType)
		trick:SetHitType(self.hitType)
		table.insert(self.trickList, trick)
	end
end

function TrickGroup10027:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	self.trickStatus = TrickGroup10027.Status.Trace
	self.createTime = TimeHelper.getNowTime()
	self.trickActive = self:OpenTrickSingle(pos, rot)

	if self.trickActive ~= nil then
		self.trickActive:SetUseCast(true)
		self.trickActive:OpenCollider()

		local target = self.sceneController:GetHostPlayer()

		if target ~= nil then
			local dir = target:GetAimPosition() - pos

			dir.y = 0

			self.trickDir:SetVector3(dir)
			self.trickDir:SetNormalize()

			self.trickTargetId = target:GetAnimalId()
		end

		self:Start()

		return true
	end

	return false
end

function TrickGroup10027:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickActive == nil or self.trickTargetId <= 0 then
		self:Stop()

		return
	end

	if self.trickStatus == TrickGroup10027.Status.Trace then
		local targetAnimal = self.sceneController:FindPlayerById(self.trickTargetId)

		if targetAnimal ~= nil then
			local hitFlg = self.trickActive:IsHaveHitAnimal(targetAnimal)

			if hitFlg == true and targetAnimal:IsHit() == true and targetAnimal:IsHitByType(self.hitType) then
				local targetPos = targetAnimal:GetAimPosition()

				self.trickActive:CloseCollider()
				self.trickActive:SetPosition(targetPos)
				self.trickActive:SetParamTrigger(TrickGroup10027_Define.TraceParam)
				self.trickActive:PlayEffect(2)

				self.trickStatus = TrickGroup10027.Status.Up

				targetAnimal:KeepHitPeriod()
				targetAnimal:SetHitLock(true)

				local tfList = self.trickActive:GetAttackBoxTfList()

				if #tfList > 0 then
					targetAnimal:SetMoveFix(true)
					targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.Chest, tfList[1], false)
				end

				return
			end

			local nowTime = TimeHelper.getNowTime()

			if nowTime > self.createTime + TrickGroup10027_Define.TraceLifeTime then
				self.trickActive:CloseCollider()
				self.trickActive:StopDelay()

				self.trickStatus = TrickGroup10027.Status.Clear

				return
			end

			local trickPos = self.trickActive:GetPosition()

			if targetAnimal:IsDead() == false and targetAnimal:IsShow() == true then
				local targetPos = targetAnimal:GetAimPosition()
				local relative = targetPos - trickPos

				relative.y = 0

				local tmpSpeed = TrickGroup10027_Define.TraceSpeed * ControllerMain.GetLogicDeltaTime()

				if tmpSpeed < relative.sqrMagnitude then
					relative:SetNormalize()

					local angle = Vector3.Angle(self.trickDir, relative)
					local tmpAngleSpeed = TrickGroup10027_Define.TraceAngleSpeed * ControllerMain.GetLogicDeltaTime()

					if tmpAngleSpeed < angle then
						local axis = Vector3.Cross(self.trickDir, relative)
						local rot = Quaternion.AngleAxis(tmpAngleSpeed, axis)

						relative:SetVector3(self.trickDir)
						relative:MulQuat(rot)
						relative:SetNormalize()

						rot = nil
						axis = nil
					end

					self.trickDir:SetVector3(relative)
					relative:Mul(tmpSpeed)
					relative:Add(trickPos)
					self.trickActive:SetPosition(relative)
				else
					self.trickActive:SetPosition(targetPos)
				end
			else
				local tmpSpeed = TrickGroup10027_Define.TraceSpeed * ControllerMain.GetLogicDeltaTime()
				local relative = self.trickDir:Clone()

				relative:SetNormalize()
				relative:Mul(tmpSpeed)
				relative:Add(trickPos)
				self.trickActive:SetPosition(relative)

				relative = nil
			end
		end
	elseif self.trickStatus == TrickGroup10027.Status.Up then
		local targetAnimal = self.sceneController:FindPlayerById(self.trickTargetId)

		if targetAnimal ~= nil then
			targetAnimal:KeepHitPeriod()
		end
	end
end

function TrickGroup10027:Stop()
	TrickGroupBase.Stop(self)

	if self.sceneController ~= nil and self.trickTargetId > 0 and self.trickStatus == TrickGroup10027.Status.Up then
		local targetAnimal = self.sceneController:FindPlayerById(self.trickTargetId)

		if targetAnimal ~= nil then
			targetAnimal:SetMoveFix(false)
			targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.None, nil, false)
			targetAnimal:ChangeToDrop(true)
		end
	end

	self.trickActive = nil
	self.trickTargetId = 0
end

function TrickGroup10027:Exit()
	if self.sceneController ~= nil and self.trickTargetId > 0 and self.trickStatus == TrickGroup10027.Status.Up then
		local targetAnimal = self.sceneController:FindPlayerById(self.trickTargetId)

		if targetAnimal ~= nil then
			targetAnimal:SetMoveFix(false)
			targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.None, nil, false)
			targetAnimal:ChangeToDrop(true)
		end
	end

	self.trickActive = nil
	self.trickDir = nil
	self.trickTargetId = 0

	TrickGroupBase.Exit(self)
end

return TrickGroup10027
