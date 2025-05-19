-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletChain.lua

require("LuaScript/Logic/Bullet/BulletBase")

BulletChain = class("BulletChain", BulletBase)
BulletChain.static.ChainStatus = {
	Disappear = 4,
	Arrived = 2,
	Back = 3,
	Start = 0,
	Intercepted = 1
}

function BulletChain:initialize(tf, animal, skillData, itemData)
	BulletBase.initialize(self, tf, animal, skillData, itemData)
	self:SetRotationType(BulletBase.RotationType.StartToFly)
	self:SetThroughBody(true)

	self.isBackFlg = false
	self.chainEffect = nil
	self.chainStartTf = nil
	self.chainStatus = BulletChain.ChainStatus.Start
end

function BulletChain:PullBackChain(clearBlockEff)
	self.isBackFlg = true

	self:SetRotationType(BulletBase.RotationType.EndToFly)
	self:SetColliderMoveEnable(true)
	self:ResetHitAnimal()
	self:ResetHitShell()

	if self.chainStartTf ~= nil then
		self:SetEndPosition(self.chainStartTf.position)
	end

	if clearBlockEff == true and self.effectBlock ~= nil then
		self.effectBlock:Clear()

		self.effectBlock = nil
	end

	self.chainStatus = BulletChain.ChainStatus.Back
end

function BulletChain:GetChainStatus()
	return self.chainStatus
end

function BulletChain:Fly(pos)
	self:SetStartPosition(pos)
end

function BulletChain:AddChainEffect(effName, hostTf)
	self.chainEffect = VfxManager.PlayTransformFreezeMulti(self.tfSelf, effName)

	if self.chainEffect ~= nil then
		self.chainEffect:AddMultipleBind(1, hostTf)
		self.chainEffect:AddMultipleBind(2, self.tfSelf)

		self.chainStartTf = hostTf
	end
end

function BulletChain:Update()
	BulletBase.Update(self)

	if self:IsRunning() == false then
		return
	end

	if self.isBackFlg == false then
		if self:IsArrived() == false and self:IsIntercepted() == false then
			if self.chainStartTf ~= nil then
				self:SetStartPosition(self.chainStartTf.position)
			end

			self:UpdateMovePosition()
		else
			if self:IsIntercepted() == true then
				if self.chainStartTf ~= nil then
					self:SetStartPosition(self.chainStartTf.position)
				end

				self:SetPosition(self:GetInterceptPosition(), false)

				self.chainStatus = BulletChain.ChainStatus.Intercepted
			elseif self:IsArrived() == true then
				self.chainStatus = BulletChain.ChainStatus.Arrived
			end

			self:SetColliderMoveEnable(false)
		end
	elseif self:IsArrived() == false then
		self:UpdateMovePosition()
	else
		self.chainStatus = BulletChain.ChainStatus.Disappear

		self:SetDead(true)
	end
end

function BulletChain:UpdateMovePosition()
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

function BulletChain:Exit()
	if self.exitFlg == true then
		return
	end

	if self.chainEffect ~= nil then
		self.chainEffect:ClearMultipleBind()
		self.chainEffect:Clear()

		self.chainEffect = nil
	end

	self.chainStartTf = nil

	BulletBase.Exit(self)
end

return BulletChain
