-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletDelayExplode.lua

require("LuaScript/Logic/Bullet/BulletBase")

BulletDelayExplode = class("BulletDelayExplode", BulletBase)
BulletDelayExplode.static.DelayExplodeStatus = {
	Flying = 1,
	Arrived = 3,
	Explode = 4,
	Start = 0,
	Intercepted = 2
}
BulletDelayExplode.static.ShellId = 10001

function BulletDelayExplode:initialize(tf, animal, skillData, itemData)
	BulletBase.initialize(self, tf, animal, skillData, itemData)
	self:SetRotationType(BulletBase.RotationType.StartToEnd)
	self:SetThroughBody(true)

	self.delayTime = 0
	self.delayExplodeStatus = BulletDelayExplode.DelayExplodeStatus.Start
	self.bulletShellId = 0
end

function BulletDelayExplode:GetDelayExplodeStatus()
	return self.delayExplodeStatus
end

function BulletDelayExplode:Fly(pos)
	self:SetStartPosition(pos)
end

function BulletDelayExplode:SetDelayTime(time)
	self.delayTime = time
end

function BulletDelayExplode:Update()
	BulletBase.Update(self)

	if self:IsRunning() == false then
		return
	end

	if self:IsArrived() == false and self:IsIntercepted() == false then
		self:UpdateMovePosition()
		self:SetStatus(BulletDelayExplode.DelayExplodeStatus.Flying)
	else
		if self:IsIntercepted() == true then
			self:SetPosition(self:GetInterceptPosition(), false)

			self.tfSelf.rotation = Quaternion.Euler(75, self.tfSelf.localEulerAngles.y, self.tfSelf.localEulerAngles.z)

			self:SetStatus(BulletDelayExplode.DelayExplodeStatus.Intercepted)

			if self.delayTime > 0 then
				self.delayTime = Mathf.Max(0, self.delayTime - ControllerMain.GetLogicDeltaTime())
			end

			if self.bulletShellId > 0 then
				local shell = self.controllerShell:GetShell(self.bulletShellId)

				if shell ~= nil and shell:IsWillDead() == true then
					SystemHelper.LogTest("======shell=======SetDead !!!!!!!!!========")
					self:SetDead(true)
				end
			end
		elseif self:IsArrived() == true then
			self:SetStatus(BulletDelayExplode.DelayExplodeStatus.Arrived)
			self:SetDead(true)
		end

		self:SetColliderMoveEnable(true)
	end
end

function BulletDelayExplode:SetStatus(status)
	if self.delayExplodeStatus ~= status then
		if status == BulletDelayExplode.DelayExplodeStatus.Intercepted then
			self.bulletShellId = self.controllerShell:CreateShell(self.tfSelf, self.fromVPlayer:GetAnimalId(), self.fromVPlayer:GetTeamId(), BulletDelayExplode.ShellId, ControllerShell.ShellShape.Capsule)

			self:ExplodeIntercepted(self.interceptPosition, self.interceptLayer)
		end

		self.delayExplodeStatus = status
	end
end

function BulletDelayExplode:Explode(isIntercepted, isBlock, targetAnimal, targetShell, hitPosition, colliderIndexList)
	if self.delayTime <= 0 and self.controllerCollider ~= nil and self.colliderBombRadius > 0 then
		local colliderIndex = self.controllerCollider:CreateCollider(ControllerCollider.ColliderType.Sphere, self.fromVPlayer, self.originVPlayer, self.skillData, self.itemData, self.interceptPosition, BulletBase.BulletExplodeInterceptTime, self.colliderBombRadius, self.colliderBombRadius, self.colliderBombRadius)

		self:SetDead(true)
	end

	if targetShell ~= nil then
		self:AddHitShell(targetShell)
	elseif targetAnimal ~= nil then
		self:AddHitAnimal(targetAnimal)
	end
end

function BulletDelayExplode:UpdateMovePosition()
	local relative = self.endPosition - self.flyPosition
	local tmpSpeed = self.moveVec3.z * ControllerMain.GetLogicDeltaTime()

	if relative.sqrMagnitude <= tmpSpeed * tmpSpeed then
		self:SetPosition(self.endPosition, false)
	else
		relative:SetNormalize()
		relative:Mul(tmpSpeed)
		relative:Add(self.flyPosition)
		self:SetPosition(relative, false)
	end

	self.moveVec3.z = self.moveVec3.z + self.accelerateVec3.z * ControllerMain.GetLogicDeltaTime()
	relative = nil
end

function BulletDelayExplode:Exit()
	if self.exitFlg == true then
		return
	end

	if self.bulletShellId > 0 then
		self.controllerShell:RemoveShell(self.bulletShellId)
	end

	self.bulletShellId = 0

	BulletBase.Exit(self)
end

return BulletDelayExplode
