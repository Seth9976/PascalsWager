-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Entrance.lua

Entrance = class("Entrance")
Entrance.static.VfxName = "vfx_maze_entrance"
Entrance.static.VfxName2 = "vfx_maze_entrance2"
Entrance.static.VfxName3 = "vfx_maze_entrance3"
Entrance.static.Type = {
	Final = 2,
	Common = 1,
	Additional = 3
}

function Entrance:initialize(pos, type)
	self.position = pos:Clone()
	self.type = type
	self.effect = nil

	self:PlayEffect()
end

function Entrance:OpenEntrance()
	return
end

function Entrance:GetPosition()
	return self.position
end

function Entrance:SetPosition(pos)
	self.position:SetVector3(pos)
	self:PlayEffect()
end

function Entrance:PlayEffect()
	if self.effect ~= nil then
		self.effect:Clear()

		self.effect = nil
	end

	if self.type == Entrance.Type.Common then
		self.effect = VfxManager.PlayFreezeMulti(Entrance.VfxName, self.position, nil, nil)
	elseif self.type == Entrance.Type.Final then
		self.effect = VfxManager.PlayFreezeMulti(Entrance.VfxName2, self.position, nil, nil)
	elseif self.type == Entrance.Type.Additional then
		self.effect = VfxManager.PlayFreezeMulti(Entrance.VfxName3, self.position, nil, nil)
	end

	if self.effect ~= nil then
		AudioCtrl.SetObjectAudio("Object/scene/lightBeam_show", self.position)
	end
end

function Entrance:GetType()
	return self.type
end

function Entrance:Exit()
	self.position = nil

	if self.effect ~= nil then
		self.effect:Clear()

		self.effect = nil

		AudioCtrl.StopObjectAudio("Object/scene/lightBeam_show", "")
	end
end

return Entrance
