-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/CurtainCtrl.lua

CurtainCtrl = class("CurtainCtrl", UICtrlBase)

local this = CurtainCtrl

this.uilayer = UICtrlBase.UILayer.Curtain
CurtainCtrl.static.LayerName = "Curtain"

local blackCurtain, currentTween
local forcedStop = false

function CurtainCtrl.OnCreate()
	blackCurtain = {}
	blackCurtain.show = false

	local go = this.mainComponent:GetGameObject("Curtain_Black")

	blackCurtain.go = go
	blackCurtain.cg = go:GetComponent("CanvasGroup")
	blackCurtain.cg.alpha = 1

	blackCurtain.go:SetActive(blackCurtain.show)

	this.loadFinish = true

	UILayerCtrl.Add(CurtainCtrl.LayerName)
end

function CurtainCtrl.BlackFadeIn(fadingDuration, delayTime, cbFunc, stepFadeAlpha)
	SystemHelper.Log("BlackFadeIn......" .. fadingDuration)

	if fadingDuration > 0 then
		local tween = Tween:new(blackCurtain.cg)

		tween:SetAutoKill(true)

		if delayTime and delayTime > 0 then
			SystemHelper.Log("Delay: " .. delayTime)
			tween:Delay(delayTime)
		end

		tween:OnComplete(function()
			SystemHelper.Log("BlackFadeIn......Completed")

			blackCurtain.cg.alpha = 1

			if cbFunc then
				cbFunc()
			end
		end)

		if stepFadeAlpha == nil or stepFadeAlpha < 0 then
			stepFadeAlpha = 1
		end

		tween:MoveTo({
			alpha = stepFadeAlpha
		}, fadingDuration)

		currentTween = tween
		blackCurtain.cg.alpha = 0
		blackCurtain.show = true

		blackCurtain.go:SetActive(true)
		UILayerCtrl.Push(CurtainCtrl.LayerName, nil, true)
		tween:Start()
	else
		blackCurtain.cg.alpha = 1
		blackCurtain.show = true

		blackCurtain.go:SetActive(true)
		UILayerCtrl.Push(CurtainCtrl.LayerName, nil, true)
	end
end

function CurtainCtrl.BlackFadeOut(fadingDuration, delayTime, cbFunc, stepFadeAlpha)
	SystemHelper.Log("BlackFadeOut......" .. fadingDuration)

	if fadingDuration > 0 then
		local tween = Tween:new(blackCurtain.cg)

		tween:SetAutoKill(true)

		if delayTime and delayTime > 0 then
			SystemHelper.Log("Delay: " .. delayTime)
			tween:Delay(delayTime)
		end

		tween:OnComplete(function()
			SystemHelper.Log("BlackFadeOut......Completed")

			blackCurtain.cg.alpha = 0
			blackCurtain.show = false

			blackCurtain.go:SetActive(false)
			UILayerCtrl.Pop(true)
			UILayerCtrl.Pop(true)
			UIManager.SendMessage("Mainmenu", "ClearSkillTrigger")

			if cbFunc then
				cbFunc()
			end
		end)

		if stepFadeAlpha == nil or stepFadeAlpha < 0 then
			stepFadeAlpha = 0
		end

		tween:MoveTo({
			alpha = stepFadeAlpha
		}, fadingDuration)

		currentTween = tween
		blackCurtain.cg.alpha = 1
		blackCurtain.show = true

		blackCurtain.go:SetActive(true)
		tween:Start()
	else
		blackCurtain.cg.alpha = 0
		blackCurtain.show = false

		blackCurtain.go:SetActive(false)
		UILayerCtrl.Pop(true)
		UILayerCtrl.Pop(true)
		UIManager.SendMessage("Mainmenu", "ClearSkillTrigger")
	end
end

function CurtainCtrl.BlackFadeInAndOut(keepingDuration, afterFadingOutDuration, stepAlpha)
	if blackCurtain and blackCurtain.cg then
		local tween = Tween:new(blackCurtain.cg)

		if currentTween then
			currentTween:Stop()

			currentTween = nil
		end

		tween:SetAutoKill(true)
		UILayerCtrl.Push(CurtainCtrl.LayerName, nil, true)

		blackCurtain.cg.alpha = 1
		blackCurtain.show = true

		blackCurtain.go:SetActive(true)

		if keepingDuration > 0 then
			tween:Delay(keepingDuration)
		end

		tween:MoveTo({
			alpha = 0
		}, 1)
		tween:OnStart(function()
			return
		end)
		tween:OnUpdate(function(time)
			return
		end)
		tween:OnComplete(function()
			if afterFadingOutDuration and type(afterFadingOutDuration) == "number" then
				local tw = Tween:new(blackCurtain.cg)

				tw:SetAutoKill(true)
				tw:MoveTo({
					alpha = 0
				}, afterFadingOutDuration)
				tw:OnComplete(function()
					blackCurtain.show = false

					blackCurtain.go:SetActive(false)
					UILayerCtrl.Pop(true)
					UIManager.SendMessage("Mainmenu", "ClearSkillTrigger")
				end)
				tw:OnStop(function()
					blackCurtain.show = false

					blackCurtain.go:SetActive(false)
					UILayerCtrl.Pop(true)
					UIManager.SendMessage("Mainmenu", "ClearSkillTrigger")
				end)

				currentTween = tw

				tw:Start()
			else
				blackCurtain.show = false

				blackCurtain.go:SetActive(false)
				UILayerCtrl.Pop(true)
				UIManager.SendMessage("Mainmenu", "ClearSkillTrigger")
			end
		end)
		tween:OnStop(function()
			blackCurtain.show = false

			blackCurtain.go:SetActive(false)
			UILayerCtrl.Pop(true)
			UIManager.SendMessage("Mainmenu", "ClearSkillTrigger")
		end)

		currentTween = tween

		tween:Start()
	else
		SystemHelper.Log("___________________________BlackCurtain hasn't been initialized...")
	end
end

function CurtainCtrl.IsInBlackCurtain()
	return blackCurtain.show
end

return CurtainCtrl
