-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10004.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10004_Define")

TrickGroup10004 = class("TrickGroup10004", TrickGroupBase)

function TrickGroup10004:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Down
	self.playMode = TrickGroupBase.PlayMode.Single
end

function TrickGroup10004:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	local ret = false

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == false then
			self:AimPlayer(trick)
			trick:CloseCollider()
			trick:Play()

			ret = true

			break
		end
	end

	if ret == true then
		self:Start()
	end

	return ret
end

function TrickGroup10004:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == true then
			local tmpTime = trick:GetTime()

			if tmpTime < TrickGroup10004_Define.AimEndTime then
				self:AimPlayer(trick)
			end

			if tmpTime > TrickGroup10004_Define.AttackBoxEnd then
				if trick:IsColliderOpen() == true then
					trick:CloseCollider()
				end
			elseif tmpTime > TrickGroup10004_Define.AttackBoxStart and trick:IsColliderOpen() == false then
				trick:OpenCollider()
			end
		end
	end
end

function TrickGroup10004:AimPlayer(trick)
	local target = self.sceneController:GetHostPlayer()

	if target ~= nil then
		local targetPos = target:GetPosByWorldPos()
		local tmpScenePoint = self.scene:GetSceneSkillPointPos(10)
		local tmpDir = tmpScenePoint - targetPos

		tmpDir.y = 0

		tmpDir:SetNormalize()
		tmpDir:Mul(TrickGroup10004_Define.ArmLen)

		local tmpPosNew = tmpDir + targetPos

		trick:SetPosition(tmpPosNew)
		tmpDir:Unm()
		trick:LookAt(tmpDir)

		tmpDir = nil
		tmpPosNew = nil
	end
end

return TrickGroup10004
