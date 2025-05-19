-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/UICtrlBase.lua

local UICtrlBase = class("UICtrlBase")
local this = UICtrlBase

UICtrlBase.static.UILayer = {
	Tips = 4,
	Dialog = 1,
	Loading = 5,
	Base = 0,
	Curtain = 3,
	Normal = 2
}

function UICtrlBase.LoadPrefab(uiName)
	local uiCtrl = UIManager.GetCtrl(uiName)

	if uiCtrl == nil then
		return
	end

	uiCtrl.loadFinish = false

	local config = require("GameData/UI/View/" .. tostring(uiName))

	uiCtrl.UIConfig = config

	for _k, _v in pairs(config.mainComponent) do
		if _v.type == "prefab" then
			uiCtrl.abName = _v.abName
			uiCtrl.assetName = _v.assetName

			break
		end
	end

	local uilayer = uiCtrl.uilayer

	if uilayer == nil then
		uilayer = UICtrlBase.UILayer.Normal
	end

	local renderMode = UnityEngine.RenderMode.ScreenSpaceCamera

	if uilayer >= UICtrlBase.UILayer.Curtain then
		renderMode = UnityEngine.RenderMode.ScreenSpaceOverlay
	end

	panelMgr:CreatePanel(uiCtrl.abName, uiCtrl.assetName, uilayer, renderMode, function(obj, siblingIndex)
		uiCtrl.gameObject = obj
		uiCtrl.transform = obj.transform
		uiCtrl.uiIndex = 1000 * siblingIndex

		this.SetCameraEnabled(obj)

		uiCtrl.mainComponent = XComponent:new(uiCtrl.gameObject)

		uiCtrl.mainComponent:InitComponent(uiCtrl.UIConfig)

		uiCtrl.loadFinish = true

		local canvasScaler = uiCtrl.gameObject:GetComponent("CanvasScaler")

		if SystemHelper.isSubquadrateScrAS() then
			canvasScaler.matchWidthOrHeight = 0
		else
			canvasScaler.matchWidthOrHeight = 1
		end

		uiCtrl.OnCreate()

		if DebugLog then
			SystemHelper.Log(" *" .. uiCtrl.uiIndex .. " ===> " .. uiName)
		end
	end)
end

function UICtrlBase.LoadByObj(uiName, obj)
	local uiCtrl = UIManager.GetCtrl(uiName)

	if uiCtrl == nil then
		return
	end

	uiCtrl.loadFinish = false

	local config = require("GameData/UI/View/" .. tostring(uiName))

	uiCtrl.UIConfig = config

	for _k, _v in pairs(config.mainComponent) do
		if _v.type == "prefab" then
			uiCtrl.abName = _v.abName
			uiCtrl.assetName = _v.assetName

			break
		end
	end

	local uilayer = uiCtrl.uilayer

	if uilayer == nil then
		uilayer = UICtrlBase.UILayer.Normal
	end

	local renderMode = UnityEngine.RenderMode.ScreenSpaceCamera

	if uilayer >= UICtrlBase.UILayer.Curtain then
		renderMode = UnityEngine.RenderMode.ScreenSpaceOverlay
	end

	panelMgr:MovePanel(uiName, obj, uilayer, renderMode, function(obj, siblingIndex)
		uiCtrl.gameObject = obj
		uiCtrl.transform = obj.transform
		uiCtrl.uiIndex = 1000 * siblingIndex

		this.SetCameraEnabled(obj)

		uiCtrl.mainComponent = XComponent:new(uiCtrl.gameObject)

		uiCtrl.mainComponent:InitComponent(uiCtrl.UIConfig)

		local canvasScaler = uiCtrl.gameObject:GetComponent("CanvasScaler")

		if SystemHelper.isSubquadrateScrAS() then
			canvasScaler.matchWidthOrHeight = 0
		else
			canvasScaler.matchWidthOrHeight = 1
		end

		uiCtrl.OnCreate()

		if DebugLog then
			SystemHelper.Log(" >" .. uiCtrl.uiIndex .. " ===> " .. uiName)
		end
	end)
end

function UICtrlBase.LoadUi(uiName, adapted)
	local uiCtrl = UIManager.GetCtrl(uiName)

	if uiCtrl then
		uiCtrl.loadFinish = false

		local config = require("GameData/UI/View/" .. tostring(uiName))

		uiCtrl.UIConfig = config

		for _k, _v in pairs(config.mainComponent) do
			if _v.type == "prefab" then
				uiCtrl.abName = _v.abName
				uiCtrl.assetName = _v.assetName

				break
			end
		end

		local uilayer = uiCtrl.uilayer

		if uilayer == nil then
			uilayer = UICtrlBase.UILayer.Normal
		end

		local renderMode = UnityEngine.RenderMode.ScreenSpaceCamera

		if uilayer >= UICtrlBase.UILayer.Curtain then
			renderMode = UnityEngine.RenderMode.ScreenSpaceOverlay
		end

		local obj = ST_Base.GetUi(uiName, uiName)

		panelMgr:MovePanelEx(uiName, obj, uilayer, renderMode, function(obj, siblingIndex)
			uiCtrl.gameObject = obj
			uiCtrl.transform = obj.transform
			uiCtrl.uiIndex = 1000 * siblingIndex

			this.SetCameraEnabled(obj)

			uiCtrl.mainComponent = XComponent:new(uiCtrl.gameObject)

			uiCtrl.mainComponent:InitComponent(uiCtrl.UIConfig, nil, uiName, adapted)

			uiCtrl.loadFinish = true

			local canvasScaler = uiCtrl.gameObject:GetComponent("CanvasScaler")

			if SystemHelper.isSubquadrateScrAS() then
				canvasScaler.matchWidthOrHeight = 0
			else
				canvasScaler.matchWidthOrHeight = 1
			end

			uiCtrl.OnCreate()

			if DebugLog then
				SystemHelper.Log(string.format("[ >> LoadUi: %d_%s ]", uiCtrl.uiIndex, uiName))
			end
		end)
	end
end

function UICtrlBase.LoadUiPrefabs(uiName, go)
	local tf = go.transform
	local count = tf.childCount - 1
	local uiList = {}

	for i = count, 0, -1 do
		local _tf = tf:GetChild(i)
		local name = _tf.name

		table.insert(uiList, name)
		UIManager.CreateCtrlByObj(name, _tf.gameObject)
	end

	panelMgr:ClosePanel(uiName)

	return uiList
end

function UICtrlBase.LoadUiPanels(tfUiElem)
	if DebugLog then
		SystemHelper.Log("[ Load UI Panels: ]")
	end

	local tf = TfFindChild(tfUiElem, "UIPanels")
	local count = tf.childCount - 1
	local uiList = {}

	for i = 0, count do
		local _tf = tf:GetChild(i)
		local name = _tf.name

		if DebugLog then
			SystemHelper.Log("[ |- " .. name .. " ]")
		end

		table.insert(uiList, name)
		UIManager.CreateCtrl(name, _tf.gameObject)
	end

	return uiList
end

function UICtrlBase.SetCameraEnabled(canvasObj)
	local goCanvas = canvasObj:GetComponent("Canvas")

	if goCanvas.renderMode == UnityEngine.RenderMode.ScreenSpaceCamera or goCanvas.renderMode == UnityEngine.RenderMode.WorldSpace then
		goCanvas.worldCamera.enabled = true
	end
end

function UICtrlBase.Close(uiName)
	local uiCtrl = UIManager.GetCtrl(uiName)

	if uiCtrl then
		uiCtrl.mainComponent:ClearAllLoaderChild()

		uiCtrl.loadFinish = false

		panelMgr:ClosePanel(uiCtrl.assetName)
	elseif DebugLog then
		SystemHelper.Log("???????????????????? " .. uiName)
	end
end

function UICtrlBase.CloseAndRelease(uiName)
	local uiCtrl = UIManager.GetCtrl(uiName)

	if uiCtrl then
		uiCtrl.loadFinish = false

		panelMgr:ClosePanelAndRelease(uiCtrl.assetName)
	end

	UIManager.ClearUi(uiName)
end

function UICtrlBase:SetBlurEnabled(flag, cbOnComplete)
	return
end

function UICtrlBase:SetBlurEnabledImmediately(flag, cbOnComplete)
	return
end

function UICtrlBase.Revalidate(uiName)
	local uiCtrl = UIManager.GetCtrl(uiName)

	if uiCtrl then
		uiCtrl.mainComponent:RefreshJoystickIcon(LS_Setting.platform)
	end
end

function UICtrlBase.SimpleAdapt(uiName)
	local uiCtrl = UIManager.GetCtrl(uiName)

	if uiCtrl == nil then
		return
	end

	local canvasScaler = uiCtrl.gameObject:GetComponent("CanvasScaler")

	if SystemHelper.isSubquadrateScrAS() then
		canvasScaler.matchWidthOrHeight = 0
	else
		canvasScaler.matchWidthOrHeight = 1
	end
end

return UICtrlBase
