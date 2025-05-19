-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletStraightLineWeapon.lua

require("LuaScript/Logic/Bullet/BulletBase")

BulletStraightLineWeapon = class("BulletStraightLineWeapon", BulletBase)

function BulletStraightLineWeapon:initialize(tf, animal, skillData, itemData)
	BulletBase.initialize(self, tf, animal, skillData, itemData)
	self:SetRotationType(BulletBase.RotationType.StartToFly)
	self:SetThroughBody(true)
end

function BulletStraightLineWeapon:Update()
	BulletBase.Update(self)

	if self:IsRunning() == false then
		return
	end

	if self:IsArrived() == false and self:IsIntercepted() == false then
		local relative = self.endPosition - self.flyPosition
		local tmpSpeed = self.speedVec3.z * ControllerMain.GetLogicDeltaTime()

		if relative.sqrMagnitude <= tmpSpeed * tmpSpeed then
			self:SetPosition(self.endPosition, false)
		else
			relative:SetNormalize()
			relative:Mul(tmpSpeed)
			relative:Add(self.flyPosition)
			self:SetPosition(relative, false)
		end

		relative = nil
	else
		if self:IsIntercepted() == true then
			self:SetPosition(self:GetInterceptPosition(), false)
		end

		self:SetColliderMoveEnable(false)
	end
end

return BulletStraightLineWeapon
