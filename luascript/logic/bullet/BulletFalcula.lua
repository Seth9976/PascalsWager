-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletFalcula.lua

require("LuaScript/Logic/Bullet/BulletBase")

BulletFalcula = class("BulletFalcula", BulletBase)
BulletFalcula.static.FalculaStatus = {
	Disappear = 4,
	Arrived = 2,
	Back = 3,
	Start = 0,
	Intercepted = 1
}

function BulletFalcula:initialize(tf, animal, skillData, itemData)
	BulletBase.initialize(self, tf, animal, skillData, itemData)
	self:SetRotationType(BulletBase.RotationType.StartToFly)
	self:SetThroughBody(true)

	self.isBackFlg = false
	self.falculaEffect = nil
	self.falculaStartTf = nil
	self.falculaStatus = BulletFalcula.FalculaStatus.Start
	self.isPullfalcula = false
end

function BulletFalcula:PullBackFalcula(clearBlockEff, isHit)
	self.isPullfalcula = isHit

	if isHit == true then
		self.isBackFlg = false
	else
		self.isBackFlg = true

		self:SetRotationType(BulletBase.RotationType.EndToFly)

		if self.falculaStartTf ~= nil then
			self:SetEndPosition(self.falculaStartTf.position)
		end

		self.falculaStatus = BulletFalcula.FalculaStatus.Back
	end

	self:ResetHitAnimal()
	self:ResetHitShell()

	if clearBlockEff == true and self.effectBlock ~= nil then
		self.effectBlock:Clear()

		self.effectBlock = nil
	end
end

function BulletFalcula:PullArriveFalcula()
	self.isBackFlg = false

	local endPos = Vector3.zero

	endPos:SetVector3(self:GetPosition())
	self:SetEndPosition(endPos)
end

function BulletFalcula:IsPullfalculas()
	return self.isPullfalcula
end

function BulletFalcula:GetFalculaStatus()
	return self.falculaStatus
end

function BulletFalcula:SetFalculaStatus(status)
	self.falculaStatus = status
end

function BulletFalcula:Fly(pos)
	self:SetStartPosition(pos)
end

function BulletFalcula:AddFalculaEffect(effName, hostTf)
	self.falculaEffect = VfxManager.PlayTransformFreezeMulti(self.tfSelf, effName)

	if self.falculaEffect ~= nil then
		self.falculaEffect:AddMultipleBind(1, hostTf)
		self.falculaEffect:AddMultipleBind(2, self.tfSelf)

		self.falculaStartTf = hostTf
	end
end

function BulletFalcula:Update()
	BulletBase.Update(self)

	if self:IsRunning() == false then
		return
	end

	if self.isBackFlg == false then
		if self:IsArrived() == false and self:IsIntercepted() == false then
			if self.falculaStartTf ~= nil then
				self:SetStartPosition(self.falculaStartTf.position)
			end

			self:UpdateMovePosition()
		else
			if self:IsIntercepted() == true then
				if self.falculaStartTf ~= nil then
					self:SetStartPosition(self.falculaStartTf.position)
				end

				self:SetPosition(self:GetInterceptPosition(), false)

				self.falculaStatus = BulletFalcula.FalculaStatus.Intercepted
			elseif self:IsArrived() == true then
				self.falculaStatus = BulletFalcula.FalculaStatus.Arrived
			end

			self:SetColliderMoveEnable(false)
		end
	elseif self:IsArrived() == false then
		self:UpdateMovePosition()
	else
		self.falculaStatus = BulletFalcula.FalculaStatus.Disappear

		self:SetDead(true)
	end
end

function BulletFalcula:UpdateMovePosition()
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

function BulletFalcula:Exit()
	if self.exitFlg == true then
		return
	end

	if self.falculaEffect ~= nil then
		self.falculaEffect:ClearMultipleBind()
		self.falculaEffect:Clear()

		self.falculaEffect = nil
	end

	self.falculaStartTf = nil

	BulletBase.Exit(self)
end

return BulletFalcula
