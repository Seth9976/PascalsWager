-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10042.lua

require("LuaScript/Logic/Trick/TrickGroupBase")

TrickGroup10042 = class("TrickGroup10042", TrickGroupBase)

function TrickGroup10042:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Heavy
	self.playMode = TrickGroupBase.PlayMode.Sequence
end

function TrickGroup10042:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		trick:Play()
		trick:SetUseCast(true)
	end

	self:Start()

	return true
end

function TrickGroup10042:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		if self.openDelayTime > 0 and self.relativeTrickId > 0 then
			local relativeTrick = self.scene:GetTrick(self.relativeTrickId)

			if relativeTrick ~= nil and relativeTrick:IsOpening() == true then
				local pos = relativeTrick:GetPosition()

				if pos ~= nil then
					for i = 1, #self.trickList do
						local trick = self.trickList[i]

						trick:SetPosition(pos)
					end
				end
			end
		end

		return
	end
end

function TrickGroup10042:Exit()
	TrickGroupBase.Exit(self)
end

return TrickGroup10042
