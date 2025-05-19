-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletTrace.lua

require("LuaScript/Logic/Bullet/BulletBase")

BulletTrace = class("BulletTrace", BulletBase)

function BulletTrace:initialize(tf, animal, skillData, itemData)
	BulletBase.initialize(self, tf, animal, skillData, itemData)
	self:SetRotationType(BulletBase.RotationType.ByFly)
	self:SetBulletParryEnable(true)

	self.lockY = false
	self.revertBaseLine = Vector3.forward
	self.revertAxis = nil
	self.revertMode = false
	self.revertSign = false
	self.revertAngleSpeed = 0
	self.revertAngle = 0
	self.revertAngleMax = 0
end

function BulletTrace:SetLockY(flg)
	self.lockY = flg
end

function BulletTrace:SetRevertBaseLine(line, speed)
	self.revertMode = true

	self.revertBaseLine:SetVector3(line)

	self.revertAngleSpeed = speed
	self.revertAxis = Vector3.Cross(self.flyDirection, self.revertBaseLine)
	self.revertAngle = Vector3.Angle(self.flyDirection, self.revertBaseLine)
	self.revertAngleMax = self.revertAngle
	self.revertSign = true
end

function BulletTrace:SetSkillTargetAnimal(animal, immediately)
	BulletBase.SetSkillTargetAnimal(self, animal)

	if immediately == true and self.skillTargetAnimal ~= nil and self.skillTargetAnimal:IsDead() == false and self.skillTargetAnimal:IsShow() == true then
		local targetPos = self.skillTargetAnimal:GetAimPosition()
		local relative = targetPos - self.flyPosition

		if self.lockY == true then
			relative.y = 0
		end

		if MathHelper.IsZero(relative.sqrMagnitude) == false then
			self.flyDirection:SetVector3(relative)
			self.flyDirection:SetNormalize()
		end

		relative = nil
		targetPos = nil
	end
end

function BulletTrace:LateUpdate()
	BulletBase.LateUpdate(self)

	if self:IsRunning() == false then
		return
	end

	if self:IsArrived() == false and self:IsIntercepted() == false then
		if self.skillTargetAnimal ~= nil and self.skillTargetAnimal:IsDead() == false and self.skillTargetAnimal:IsShow() == true then
			local targetPos = self.skillTargetAnimal:GetAimPosition()
			local relative = targetPos - self.flyPosition

			if self.lockY == true then
				relative.y = 0
			end

			if MathHelper.IsZero(relative.sqrMagnitude) == false then
				local tmpSpeed = self.speedVec3.z * ControllerMain.GetLogicDeltaTime()

				relative:SetNormalize()

				local angle = Vector3.Angle(self.flyDirection, relative)
				local tmpAngleSpeed = self.speedAngle * ControllerMain.GetLogicDeltaTime()

				if tmpAngleSpeed < angle then
					local axis = Vector3.Cross(self.flyDirection, relative)
					local rot = Quaternion.AngleAxis(tmpAngleSpeed, axis)

					relative:SetVector3(self.flyDirection)
					relative:MulQuat(rot)
					relative:SetNormalize()

					rot = nil
					axis = nil
				end

				relative:Mul(tmpSpeed)
				relative:Add(self.flyPosition)
				self:SetPosition(relative, false)
			else
				self:SetPosition(targetPos, false)
				self:SetEndPosition(targetPos)
			end

			targetPos = nil
			relative = nil
		else
			if self.skillTargetAnimal ~= nil then
				self:SetSkillTargetAnimal(nil)
			end

			local tmpSpeed = self.speedVec3.z * ControllerMain.GetLogicDeltaTime()
			local relative = self.flyDirection:Clone()

			if self.revertMode == true then
				local tmpAngleSpeed = self.revertAngleSpeed * ControllerMain.GetLogicDeltaTime()

				if self.revertSign == true then
					self.revertAngle = self.revertAngle - tmpAngleSpeed
				else
					self.revertAngle = self.revertAngle + tmpAngleSpeed
				end

				if Mathf.Abs(self.revertAngle) >= self.revertAngleMax then
					self.revertAngle = Mathf.Sign(self.revertAngle) * self.revertAngleMax
					self.revertSign = not self.revertSign
				end

				local rot = Quaternion.AngleAxis(self.revertAngle, self.revertAxis)

				relative:SetVector3(self.revertBaseLine)
				relative:MulQuat(rot)

				rot = nil
			end

			relative:SetNormalize()
			relative:Mul(tmpSpeed)
			relative:Add(self.flyPosition)
			self:SetPosition(relative, false)

			relative = nil
		end
	else
		self:SetDead(true)
	end
end

function BulletTrace:Update()
	BulletBase.Update(self)

	if self:IsRunning() == false then
		return
	end
end

function BulletTrace:Exit()
	if self.exitFlg == true then
		return
	end

	self.revertBaseLine = nil
	self.revertAxis = nil

	BulletBase.Exit(self)
end

return BulletTrace
