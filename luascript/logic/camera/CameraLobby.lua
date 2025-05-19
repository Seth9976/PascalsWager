-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Camera/CameraLobby.lua

require("LuaScript/Logic/Camera/CameraBase")

CameraLobby = class("CameraLobby", CameraBase)
CameraLobby.ModeType = {
	Default = 0,
	Following = 1
}

local followingTarget
local animationName = ""
local sceneIndex = 0

function CameraLobby:initialize(tf_cameraVirtual, tf_cameraRoot)
	CameraBase.initialize(self, tf_cameraVirtual, tf_cameraRoot)

	if self.brownianMotion ~= nil then
		self.brownianMotion.rotationFrequency = 0.2
		self.brownianMotion.rotationAmplitude = 2
	end
end

function CameraLobby:SetTarget(target)
	followingTarget = target

	self:SynchronizePosAndRot(followingTarget.transform.position, followingTarget.transform.rotation)

	local camera = followingTarget.transform:GetComponent("Camera")

	self.camera.fieldOfView = camera.fieldOfView
	camera.enabled = false
	self.cameraAnimation = followingTarget.transform:GetComponent("Animation")
end

function CameraLobby:Update()
	CameraBase.Update(self)

	if followingTarget == nil then
		return
	end

	if IsNil(followingTarget) then
		return
	end

	self:SynchronizePosAndRot(followingTarget.transform.position, followingTarget.transform.rotation)
end

function CameraLobby:UpdateQuality(force)
	CameraBase.UpdateQuality(self, force)

	if LS_Setting.graphics.antialiasing > 1 then
		Common.SetCameraDepthAndMSAA(self.camera, true, true, false)
	else
		Common.SetCameraDepthAndMSAA(self.camera, false, true, false)
	end
end

function CameraLobby:SetBlurEnabled(flag)
	return
end

function CameraLobby:Exit()
	CameraBase.Exit(self)
end
