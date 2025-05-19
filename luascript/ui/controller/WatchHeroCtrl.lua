-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/WatchHeroCtrl.lua

WatchHeroCtrl = class("WatchHeroCtrl", UICtrlBase)

local this = WatchHeroCtrl
local sceneController

function WatchHeroCtrl.OnCreate()
	sceneController = ST_Lobby.GetSceneController()

	local btn = this.mainComponent:GetButton("Button_Back")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.Close("WatchHero")
		sceneController:ChangeSceneStatus(ControllerLobby.SceneStatus.Main)
	end, 0)

	local scrollHeroObj = this.mainComponent:GetGameObject("Scroll_Hero")
	local scrollHero = XScrollRect:new(scrollHeroObj)
	local heroList = MS_HeroData.GetAllIconHeroList()

	loaderHeroList = this.mainComponent:GetLoader("Scroll_Hero_Viewport_Content")
	loaderHeroList.loadCount = #heroList

	local group = XGroup:new()

	group:SetMode(XGroup.GroupMode.Button)

	function loaderHeroList.loadCallback(index, com, data)
		local heroId = heroList[index]
		local selectBtn = com:GetButton("Button_Select")

		group:Add(selectBtn)
		selectBtn:SetEventCallBack(EventTriggerType.PointerDown, function(obj, data)
			selectBtn:SetSelected(true)
			sceneController:LoadHero(heroId)
		end)
		selectBtn:SetParentScroll(scrollHero)

		local Image_Hero = com:GetGameObject("Image_Hero")
		local img = XImage:new(Image_Hero)
		local sprite = XObjectPool.GetIcon("photo" .. heroId)

		if sprite ~= nil then
			img:SetSprite(sprite)
		end

		heroId = tonumber(heroId)

		if heroId == 10001 or heroId == 10002 or heroId == 10003 then
			-- block empty
		else
			selectBtn:SetDisabled()
		end
	end

	loaderHeroList:Load()

	local touchBtn = this.mainComponent:GetButton("Panel_Touch")

	touchBtn:SetAudioEnable(false)
	touchBtn:SetEventCallBack(EventTriggerType.Drag, function(obj, data)
		sceneController:RotatePlayer(data)
	end)
end

return WatchHeroCtrl
