-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletRay.lua

require("LuaScript/Logic/Bullet/BulletBase")

BulletRay = class("BulletRay", BulletBase)

function BulletRay:initialize(tf, animal, skillData, itemData)
	BulletBase.initialize(self, tf, animal, skillData, itemData)
	self:SetRotationType(BulletBase.RotationType.StartToEnd)
end

function BulletRay:Update()
	BulletBase.Update(self)

	if self:IsRunning() == false then
		return
	end

	if self:IsArrived() == false and self:IsIntercepted() == false then
		self:SetPosition(self.endPosition, false)
	else
		self:SetDead(true)
	end
end

return BulletRay
