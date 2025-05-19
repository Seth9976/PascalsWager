-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/RoadSign.lua

RoadSign = class("RoadSign")
RoadSign.static.CommonVfxName = "vfx_common_guide_1"
RoadSign.static.DirVfxName = "vfx_common_guide_2"
RoadSign.static.NoDirVfxName = "vfx_common_guide_3"

function RoadSign:initialize(id, pos, rot)
	self.position = pos
	self.rotation = rot
	self.id = id
	self.commonEffect = VfxManager.PlayFreezeMulti(RoadSign.CommonVfxName, self.position, self.rotation, nil)
end

function RoadSign:Approach(useDir)
	if useDir then
		if self.dirEffect ~= nil then
			self.dirEffect:Clear()

			self.dirEffect = nil
		end

		self.dirEffect = VfxManager.PlayFreezeMulti(RoadSign.DirVfxName, self.position, self.rotation, nil)

		self.dirEffect:SetDelayClear(true, nil)
	else
		if self.noDirEffect ~= nil then
			self.noDirEffect:Clear()
		end

		self.noDirEffect = VfxManager.PlayFreezeMulti(RoadSign.NoDirVfxName, self.position, self.rotation, nil)
	end
end

function RoadSign:FarAway()
	if self.dirEffect ~= nil then
		self.dirEffect:Clear()

		self.dirEffect = nil
	end
end

function RoadSign:Exit()
	self.position = nil
	self.rotation = nil

	if self.commonEffect ~= nil then
		self.commonEffect:Clear()

		self.commonEffect = nil
	end

	if self.dirEffect ~= nil then
		self.dirEffect:ClearForce()

		self.dirEffect = nil
	end

	if self.noDirEffect ~= nil then
		self.noDirEffect:ClearForce()

		self.noDirEffect = nil
	end
end

return RoadSign
