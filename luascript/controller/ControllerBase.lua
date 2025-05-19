-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerBase.lua

ControllerBase = class("ControllerBase")

function ControllerBase:initialize()
	self.isLoaded = false
	self.cameraCtrl = nil
end

function ControllerBase:isLoadEnd()
	return self.isLoaded
end

function ControllerBase:FixedUpdate()
	return
end

function ControllerBase:Update()
	return
end

function ControllerBase:UpdateLoadArea()
	return
end

function ControllerBase:LateUpdate()
	return
end

function ControllerBase:LateLateUpdate()
	return
end

function ControllerBase:SetCameraCtrl(cam)
	self.cameraCtrl = cam
end

function ControllerBase:GetCamera()
	if self.cameraCtrl ~= nil then
		return self.cameraCtrl:GetCamera()
	end

	return nil
end

function ControllerBase:GetCameraCtrl()
	return self.cameraCtrl
end

function ControllerBase:UpdateCamera()
	if self.cameraCtrl ~= nil then
		self.cameraCtrl:Update()
	end
end

function ControllerBase:OnChangeScreen(width, height)
	if self.cameraCtrl ~= nil then
		self.cameraCtrl:FoldScreen(width, height)
	end
end

function ControllerBase:UpdateQuality(force)
	if self.cameraCtrl ~= nil then
		self.cameraCtrl:UpdateQuality(force)

		if LS_Setting.graphics.antialiasing > 0 then
			self.cameraCtrl:SetAntialiasing(UnityEngine.Rendering.PostProcessing.PostProcessLayer.Antialiasing.FastApproximateAntialiasing)

			if LS_Setting.graphics.antialiasing == 1 then
				Device.SetAntiAliasing(0)
			elseif LS_Setting.graphics.antialiasing == 2 then
				Device.SetAntiAliasing(2)
			elseif LS_Setting.graphics.antialiasing > 2 then
				Device.SetAntiAliasing(4)
			end
		else
			self.cameraCtrl:SetAntialiasing(UnityEngine.Rendering.PostProcessing.PostProcessLayer.Antialiasing.None)
			Device.SetAntiAliasing(0)
		end
	end
end

function ControllerBase:BackToTitle()
	return
end

function ControllerBase:Exit()
	if self.cameraCtrl ~= nil then
		self.cameraCtrl:Exit()
	end

	self.cameraCtrl = nil
end

return ControllerBase
