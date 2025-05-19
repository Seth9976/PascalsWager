-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10019.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10019_Define")

TrickGroup10019 = class("TrickGroup10019", TrickGroupBase)

function TrickGroup10019:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Heavy
	self.playMode = TrickGroupBase.PlayMode.SingleLoop
	self.windDir = Vector3.forward
	self.trickActive = nil
	self.stopLogic = false
end

function TrickGroup10019:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	self.trickActive = self:OpenTrickSingle(pos, rot)

	if self.trickActive ~= nil then
		self:Start()

		self.stopLogic = false

		return true
	end

	return false
end

function TrickGroup10019:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickActive == nil then
		self:Stop()

		return
	end

	if self.stopLogic == true then
		return
	end

	local targetList = self.trickActive:GetTargetList()

	if targetList ~= nil then
		local pos = self.trickActive:GetPosition()

		for k, player in pairs(targetList) do
			if player ~= nil then
				player:SetWindDir(Vector3.s_zero)

				if player:IsDead() == false and player:IsShow() == true then
					local nowPos = player:GetPosByWorldPos()

					self.windDir:SetVector3(pos)
					self.windDir:Sub(nowPos)
					self.windDir:SetNormalize()
					self.windDir:Mul(TrickGroup10019_Define.WindForce)

					if player:IsHost() == true then
						if player:IsHostBack() == false then
							player:SetWindDir(self.windDir)
						end
					else
						player:SetWindDir(self.windDir)
					end
				end
			end
		end
	end
end

function TrickGroup10019:Stop()
	TrickGroupBase.Stop(self)

	if self.trickActive ~= nil then
		local targetList = self.trickActive:GetTargetList()

		if targetList ~= nil then
			for k, player in pairs(targetList) do
				if player ~= nil then
					player:SetWindDir(Vector3.s_zero)
				end
			end
		end
	end

	self.stopLogic = true
end

function TrickGroup10019:StopDelay(time)
	TrickGroupBase.StopDelay(self, time)

	if self.trickActive ~= nil then
		local targetList = self.trickActive:GetTargetList()

		if targetList ~= nil then
			for k, player in pairs(targetList) do
				if player ~= nil then
					player:SetWindDir(Vector3.s_zero)
				end
			end
		end
	end

	self.stopLogic = true
end

function TrickGroup10019:Exit()
	if self.trickActive ~= nil then
		local targetList = self.trickActive:GetTargetList()

		if targetList ~= nil then
			for k, player in pairs(targetList) do
				if player ~= nil then
					player:SetWindDir(Vector3.s_zero)
				end
			end
		end
	end

	self.trickActive = nil
	self.windDir = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10019
