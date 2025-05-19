-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10011.lua

require("LuaScript/Logic/Trick/TrickGroupBase")

TrickGroup10011 = class("TrickGroup10011", TrickGroupBase)

function TrickGroup10011:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Heavy
	self.playMode = TrickGroupBase.PlayMode.Single
end

function TrickGroup10011:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	local ret = false

	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == false then
			trick:SetPosition(pos)
			trick:SetRotation(rot)
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

function TrickGroup10011:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end
end

return TrickGroup10011
