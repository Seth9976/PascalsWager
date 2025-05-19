-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletStraightLine.lua

require("LuaScript/Logic/Bullet/BulletBase")

BulletStraightLine = class("BulletStraightLine", BulletBase)

function BulletStraightLine:initialize(tf, animal, skillData, itemData)
	BulletBase.initialize(self, tf, animal, skillData, itemData)
	self:SetRotationType(BulletBase.RotationType.StartToEnd)
	self:SetBulletParryEnable(true)
end

function BulletStraightLine:Update()
	BulletBase.Update(self)

	if self:IsRunning() == false then
		return
	end

	if self:IsArrived() == false and self:IsIntercepted() == false then
		local relative = self.endPosition - self.flyPosition
		local tmpSpeed = self.moveVec3.z * ControllerMain.GetLogicDeltaTime()

		if relative.sqrMagnitude > tmpSpeed * tmpSpeed then
			relative:SetNormalize()
			relative:Mul(tmpSpeed)
			relative:Add(self.flyPosition)
		else
			relative:SetVector3(self.endPosition)
		end

		if MathHelper.IsZero(self.moveY) == false and relative.y > self.flyHeightMin and relative.y < self.flyHeightMax then
			relative.y = relative.y + self.moveY * ControllerMain.GetLogicDeltaTime()
			self.endPosition.y = relative.y
		end

		self:SetPosition(relative, false)

		if self.accelerateVec3.z > 0 then
			self.moveVec3.z = self.moveVec3.z + self.accelerateVec3.z * ControllerMain.GetLogicDeltaTime()
		end

		if MathHelper.IsZero(self.speedY) == false and MathHelper.IsZero(self.accY) == false then
			self.moveY = self.moveY + self.accY * ControllerMain.GetLogicDeltaTime()

			if self.speedY > 0 then
				self.moveY = Mathf.Max(0, self.moveY)
			else
				self.moveY = Mathf.Min(0, self.moveY)
			end
		end

		relative = nil
	else
		self:SetDead(true)
	end
end

return BulletStraightLine
