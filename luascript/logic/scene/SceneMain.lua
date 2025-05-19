-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/SceneMain.lua

require("LuaScript/Logic/Scene/SceneBase")
require("LuaScript/Logic/Camera/CameraMain")

SceneMain = class("SceneMain", SceneBase)

local tfGroundCollider, tfGroundRigidBody

function SceneMain:initialize(transform, name)
	SceneBase.initialize(self, transform, name)
end

function SceneMain:UpdateRender()
	SceneBase.UpdateRender(self)
end

function SceneMain:LateUpdateRender()
	SceneBase.LateUpdateRender(self)
end

function SceneMain:Exit()
	SceneBase.Exit(self)
end
