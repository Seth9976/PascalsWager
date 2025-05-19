-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10054.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10054_Define")

TrickGroup10054 = class("TrickGroup10054", TrickGroupBase)

function TrickGroup10054:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.FrontFly
	self.playMode = TrickGroupBase.PlayMode.AutoLoop
end

function TrickGroup10054:OpenAuto()
	TrickGroupBase.OpenAuto(self)
	self:OpenDelay(TrickGroup10054_Define.DelayTime)
end

function TrickGroup10054:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	self:OpenTrickAll()
	self:Start()

	return true
end

function TrickGroup10054:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickList == nil or #self.trickList <= 0 then
		return
	end

	local target = self.sceneController:GetHostPlayer()

	if target ~= nil then
		local targetPos = target:GetPosByWorldPos()

		for i = 1, #self.trickList do
			local trick = self.trickList[i]
			local trickPos = trick:GetPosition()
			local tmpDis = Vector3.DistanceSquare(targetPos, trickPos)

			if tmpDis < TrickGroup10054_Define.AttackDistance * TrickGroup10054_Define.AttackDistance then
				trick:SetParamTrigger(TrickGroup10054_Define.AnimParam)
				trick:SetUsed(true)
			end

			if trick:IsHaveHitAnimal(target) == true then
				target:KeepHitPeriod()
			end
		end
	end
end

function TrickGroup10054:Exit()
	TrickGroupBase.Exit(self)
end

return TrickGroup10054
