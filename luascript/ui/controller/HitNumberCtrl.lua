-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/HitNumberCtrl.lua

HitNumberCtrl = class("HitNumberCtrl", UICtrlBase)
HitNumberCtrl.static.Type = {
	NormalHit = 1,
	CriticalHit = 3,
	AddHP = 2
}

local this = HitNumberCtrl
local numberLoader, animator

this.uilayer = UICtrlBase.UILayer.Base

function HitNumberCtrl.OnCreate()
	this.loadFinish = false
	numberLoader = this.mainComponent:GetLoader("Loader_Number")
	numberLoader.clearContentOnLoad = false

	function numberLoader.loadCallback(index, com, data)
		this.OnLoad(com, data.position, data.text, data.style)
	end

	numberLoader:PreloadTemplate(function()
		this.loadFinish = true
	end)
	numberLoader:SetCacheNumMax(1, 10)
end

function HitNumberCtrl.Create(position, num, style)
	if type(num) ~= "number" then
		return
	end

	if num == 0 then
		return
	end

	local text = Mathf.Floor(num)

	if Mathf.Abs(text) < 1 then
		text = num < 0 and -1 or 1
	end

	numberLoader:Load({
		position = position,
		text = text,
		style = style
	})
end

function HitNumberCtrl.OnLoad(com, position, text, style)
	if style == nil then
		style = 1
	end

	local textStyle = {}

	for i = 1, 3 do
		textStyle[i] = com:GetGameObject(string.format("Style%d", i))

		textStyle[i]:SetActive(false)
	end

	local textCom = com:GetText(string.format("Style%d", style))

	textCom:SetContent(text)
	textStyle[style]:SetActive(true)

	if style == 3 then
		animator = com:GetGameObject("Style3"):GetComponent("Animator")

		animator:SetTrigger("Init")
	end

	local tween = Tween:new(textCom.transform)
	local tbl = {}

	tween:MoveTo(tbl, 1)
	tween:OnComplete(function(progress)
		com:ReturnToPool()
	end)
	tween:Start()

	local sceneController = ST_Main.GetSceneController()
	local camera = sceneController:GetCamera()

	com.gameObject:SetActive(false)

	local sp = camera:WorldToScreenPoint(position)

	if sp.x > SystemHelper.GetScreenWidth() or sp.x < 0 or sp.y > SystemHelper.GetScreenHeight() or sp.y < 0 or sp.z < 0 then
		return
	end

	local uiPos
	local canvas = this.transform:GetComponent("Canvas")
	local uiCamera = canvas.worldCamera
	local ret, uiPos = RectTransformUtility.ScreenPointToWorldPointInRectangle(com.transform.parent:GetComponent("RectTransform"), sp, uiCamera, uiPos)

	if ret then
		com.gameObject:SetActive(true)

		com.transform.position = uiPos
	end
end

function HitNumberCtrl.Close(uiName)
	numberLoader:ClearTemplate()
	UICtrlBase.Close("HitNumber")
end

return HitNumberCtrl
