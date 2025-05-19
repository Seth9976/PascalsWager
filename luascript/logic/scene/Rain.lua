-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Rain.lua

Rain = class("Rain")
Rain.static.CommonVfxHeavyName = "vfx_common_rain1"
Rain.static.CommonVfxSmallName = "vfx_common_rain1"
Rain.static.RainType = {
	Small = 1,
	Heavy = 2,
	None = 0
}

function Rain:initialize(id, pos, rot, type)
	self.position = pos
	self.rotation = rot
	self.type = type
	self.id = id
	self.commonEffect = nil
end

function Rain:Approach()
	if self.commonEffect == nil then
		if self.type == Rain.RainType.Heavy then
			self.commonEffect = VfxManager.PlayFreezeMulti(Rain.CommonVfxHeavyName, self.position, self.rotation, nil)
		elseif self.type == Rain.RainType.Small then
			self.commonEffect = VfxManager.PlayFreezeMulti(Rain.CommonVfxSmallName, self.position, self.rotation, nil)
		end
	end
end

function Rain:FarAway()
	if self.commonEffect ~= nil then
		self.commonEffect:Clear()

		self.commonEffect = nil
	end
end

function Rain:Exit()
	self.position = nil
	self.rotation = nil

	if self.commonEffect ~= nil then
		self.commonEffect:Clear()

		self.commonEffect = nil
	end
end

return Rain
