-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/SceneOutdoors.lua

require("LuaScript/Logic/Scene/SceneBase")
require("LuaScript/Logic/Camera/CameraMain")

SceneOutdoors = class("SceneOutdoors", SceneBase)

local tfGroundCollider, tfGroundRigidBody

function SceneOutdoors:initialize(transform, name)
	SceneBase.initialize(self, transform, name)

	local prefabLightRealTime = self.tfSelf:GetComponent("PrefabLightRealtimeData")

	if prefabLightRealTime ~= nil then
		prefabLightRealTime:Apply()
	end
end

function SceneOutdoors:Update()
	SceneBase.Update(self)
end

function SceneOutdoors:Exit()
	SceneBase.Exit(self)
end
