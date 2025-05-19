-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10049.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10049_Define")

TrickGroup10049 = class("TrickGroup10049", TrickGroupBase)
TrickGroup10049.static.Status = {
	Clear = 3,
	Attack = 2,
	Wait = 1,
	Empty = 0
}

function TrickGroup10049:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Period
	self.hitType = AnimalBase_Define.HitType.Dizzy
	self.playMode = TrickGroupBase.PlayMode.AutoLoop
	self.statusList = nil
end

function TrickGroup10049:OpenAuto()
	TrickGroupBase.OpenAuto(self)
	self:OpenDelay(TrickGroup10049_Define.DelayTime)
end

function TrickGroup10049:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	if self.statusList == nil then
		self.statusList = {}
	end

	for i = 1, #self.trickList do
		self.statusList[i] = TrickGroup10049.Status.Wait
	end

	self:OpenTrickAll()
	self:Start()

	return true
end

function TrickGroup10049:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickList == nil or #self.trickList <= 0 then
		return
	end

	local target = self.sceneController:GetHostPlayer()

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil then
			local trickPos = trick:GetPosition()

			if self.statusList[i] == TrickGroup10049.Status.Wait then
				if target ~= nil then
					local targetPos = target:GetPosByWorldPos()
					local tmpDis = Vector3.DistanceSquare(targetPos, trickPos)

					if tmpDis < TrickGroup10049_Define.AttackDistance * TrickGroup10049_Define.AttackDistance then
						trick:SetParamTrigger(TrickGroup10049_Define.AnimParam)
						trick:SetUsed(true)
						AudioCtrl.SetObjectAudio(TrickGroup10049_Define.AudioName, trick.tfSelf, i)

						self.statusList[i] = TrickGroup10049.Status.Attack
					end
				end
			elseif self.statusList[i] == TrickGroup10049.Status.Attack and target ~= nil and trick:IsHaveHitAnimal(target) == true then
				target:SetPosByWorldPos(trickPos, true)
				target:KeepHitPeriod()
				AudioCtrl.SetObjectAudio(TrickGroup10049_Define.HitAudioName, target:GetModel(), target:GetAnimalId())

				self.statusList[i] = TrickGroup10049.Status.Clear
			end
		end
	end
end

function TrickGroup10049:Exit()
	TrickGroupBase.Exit(self)
end

return TrickGroup10049
