-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletStraightLineMultiply.lua

require("LuaScript/Logic/Bullet/BulletBase")

BulletStraightLineMultiply = class("BulletStraightLineMultiply", BulletBase)
BulletStraightLineMultiply.static.ReboundTargetDis = 20
BulletStraightLineMultiply.static.ReboundShootDis = 30

function BulletStraightLineMultiply:initialize(tf, animal, skillData, itemData)
	BulletBase.initialize(self, tf, animal, skillData, itemData)
	self:SetRotationType(BulletBase.RotationType.StartToEnd)
	self:SetBulletParryEnable(true)

	self.reboundCnt = 1
end

function BulletStraightLineMultiply:SetReboundTimes(cnt)
	self.reboundCnt = cnt
end

function BulletStraightLineMultiply:ReboundTarget()
	if self.reboundCnt <= 0 then
		return false
	end

	if self.skillTargetAnimal == nil or self.skillTargetAnimal:IsDead() == true or self.skillTargetAnimal:IsShow() == false then
		return false
	end

	local targetPos = self.skillTargetAnimal:GetAimPosition()
	local relative = targetPos - self.flyPosition

	if MathHelper.IsZero(relative.sqrMagnitude) == false then
		relative:SetNormalize()
		self.flyDirection:SetVector3(relative)
	else
		relative:SetVector3(self.flyDirection)
	end

	relative:Mul(BulletStraightLineMultiply.ReboundShootDis)
	relative:Add(self.flyPosition)
	self:SetStartPosition(self.flyPosition)
	self:SetEndPosition(relative)
	self.flyPositionOld:SetVector3(self.flyPosition)

	if self.effectBullet ~= nil then
		self.effectBullet:Clear()
	end

	self.effectBullet = nil

	if self.skillData ~= nil then
		self:AddEffect(self.skillData.SkillEffectBullet)
	end

	self.intercepted = false

	self.interceptPosition:Set(0, 0, 0)

	self.interceptDistance = 0
	self.interceptLayer = 0
	self.startTime = TimeHelper.getNowTime()
	relative = nil
	targetPos = nil
	self.reboundCnt = self.reboundCnt - 1

	return true
end

function BulletStraightLineMultiply:Update()
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
		local ret = self:ReboundTarget()

		if ret == false then
			self:SetDead(true)
		end
	end
end

return BulletStraightLineMultiply
