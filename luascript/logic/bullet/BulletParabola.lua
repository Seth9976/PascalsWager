-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletParabola.lua

require("LuaScript/Logic/Bullet/BulletBase")

BulletParabola = class("BulletParabola", BulletBase)
BulletParabola.static.ParryDistance = 5
BulletParabola.static.ParryAngle = 20
BulletParabola.static.ParryGravity = -15

function BulletParabola:initialize(tf, animal, skillData, itemData)
	BulletBase.initialize(self, tf, animal, skillData, itemData)
	self:SetRotationType(BulletBase.RotationType.StartToEndForward)
	self:SetBulletParryEnable(true)
end

function BulletParabola:Update()
	BulletBase.Update(self)

	if self:IsRunning() == false then
		return
	end

	if self:IsArrived() == false and self:IsIntercepted() == false then
		local relative = self.endPosition - self.startPosition

		relative.y = 0

		relative:SetNormalize()
		relative:Mul(self.moveVec3.z * ControllerMain.GetLogicDeltaTime())

		local pos = self.flyPosition + relative

		pos.y = pos.y + self.moveVec3.y * ControllerMain.GetLogicDeltaTime()

		self:SetPosition(pos, false)

		self.moveVec3.y = self.moveVec3.y + self.accelerateVec3.y * ControllerMain.GetLogicDeltaTime()
	else
		self:SetDead(true)
	end
end

function BulletParabola:SetParryTarget(hitAnimal, posX, posY, posZ)
	local reboundPos = Vector3.New(posX, posY, posZ)
	local targetPos = hitAnimal:GetForward():Clone()

	targetPos:Mul(BulletParabola.ParryDistance)
	targetPos:Add(reboundPos)

	local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(reboundPos, targetPos, BulletParabola.ParryAngle, BulletParabola.ParryGravity)

	self.speedVec3:Set(0, tmpSpeedY, tmpSpeedZ)
	self.accelerateVec3:Set(0, BulletParabola.ParryGravity, 0)
	self.moveVec3:SetVector3(self.speedVec3)
	self:SetStartPosition(reboundPos)
	self:SetEndPosition(targetPos)
	self:SetSkillTargetAnimal(nil)
end

return BulletParabola
