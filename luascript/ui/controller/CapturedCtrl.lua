-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/CapturedCtrl.lua

require("LuaScript/UI/Controller/UICtrlBase")

CapturedCtrl = class("CapturedCtrl", UICtrlBase)

local this = CapturedCtrl
local showCaptured = false
local capturedImage

function CapturedCtrl.OnCreate()
	showCaptured = false
	capturedImage = this.mainComponent:GetGameObject("CapturedImage")

	if capturedImage then
		capturedImage:SetActive(showCaptured)
	end

	this.loadFinish = true
end

function CapturedCtrl.Show(show)
	if DebugRenderInIdle then
		return
	end

	if show ~= showCaptured and capturedImage then
		showCaptured = show

		capturedImage:SetActive(show)
	end
end

return CapturedCtrl
