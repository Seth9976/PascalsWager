-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/LoadingCtrl.lua

LoadingCtrl = class("LoadingCtrl", UICtrlBase)

local this = LoadingCtrl

this.uilayer = UICtrlBase.UILayer.Loading

local teamData = {}
local loaderTeam = {}
local loadingProgress = {}
local loaderPvpLoading, mapName, loadingMain, simpleLoading, loadingBGB, loadingBGT, loadingBgMask, sceneController, loadingIcon, loadingAnim, iconLittle
local showIconLittle = true
local tipsText, extraText
local showExtraText = false

function LoadingCtrl.OnCreate()
	loaderTeam = {}
	teamData = {}
	teamData[1] = {}
	teamData[2] = {}
	loadingProgress = {}
	loadingProgress[1] = {}
	loadingProgress[2] = {}
	loaderPvpLoading = this.mainComponent:GetLoader("Loader_Pvp")
	simpleLoading = this.mainComponent:GetGameObject("Loading_little")
	loadingMain = this.mainComponent:GetGameObject("Loading_Main")
	loadingBGB = this.mainComponent:GetGameObject("Loading_little_BGB")
	loadingBGT = this.mainComponent:GetGameObject("Loading_little_BGT")
	loadingBgMask = this.mainComponent:GetGameObject("Loading_Main_Image_Bg_Mask")
	loadingBGT = this.mainComponent:GetGameObject("Loading_little_BGT")
	tipsText = this.mainComponent:GetText("Loading_Main_TipsText")
	extraText = this.mainComponent:GetText("Loading_Main_Text_Tips_B")
	loadingIcon = this.mainComponent:GetGameObject("Loading_Main_Image_Loading_B")
	loadingAnim = loadingIcon:GetComponent("Animator")
	iconLittle = this.mainComponent:GetGameObject("Loading_little_icon")
	showIconLittle = true

	local uiGo = GoFind("UIRoot/Element_Loading/Loading")
	local rectTf = uiGo:GetComponent("Canvas")
	local scaleFactor = rectTf.scaleFactor
	local rectTf = loadingBgMask:GetComponent("RectTransform")
	local rect = rectTf.rect
	local width = rect.width
	local height = rect.height
	local newWidth = rect.width

	if width > 1494 then
		newWidth = 1494
		rectTf.sizeDelta = Vector2.New(newWidth - width, height)
	end

	this.loadFinish = true
end

function LoadingCtrl.SetActive(flag)
	if this.gameObject.activeSelf == false and flag then
		if MS_StoryTips then
			local rndData = MS_StoryTips.GetRandomTips()

			if rndData then
				if LS_Setting.isJoystickConnected then
					local rtext = SystemHelper.ConvertCustomRichText(rndData.DescriptionJoystick, 20, 2, 10001)

					tipsText:SetContent(rtext)
					tipsText.gameObject:SetActive(false)
					tipsText.gameObject:SetActive(true)
				else
					local rtext = SystemHelper.ConvertCustomRichText(rndData.DescriptionTouch, 20, 2, 10001)

					tipsText:SetContent(rtext)
					tipsText.gameObject:SetActive(false)
					tipsText.gameObject:SetActive(true)
				end
			else
				tipsText:SetContent("")
			end
		else
			tipsText:SetContent("")
		end
	end

	this.gameObject:SetActive(flag)

	if flag then
		loadingAnim:StopPlayback()
		loadingAnim:SetTrigger("Reset")
	else
		loadingAnim:ResetTrigger("Reset")
	end

	loadingMain:SetActive(flag)

	if flag == false and loaderPvpLoading ~= nil then
		loaderPvpLoading.gameObject:SetActive(false)
	end
end

function LoadingCtrl.OpenPvp()
	this.gameObject:SetActive(true)
	loaderPvpLoading.gameObject:SetActive(true)

	function loaderPvpLoading.loadCallback(index, com, data)
		for teamIndex = 1, 2 do
			loaderTeam[teamIndex] = com:GetLoader("Pvp_Panel_Team" .. teamIndex)

			this.LoadTeam(teamIndex)
		end

		ST_Scene.ChangeScene(ST_Scene.SceneType.Main)
	end

	loaderPvpLoading:Load()

	teamData[1] = FS_Battle_MatchGame.GetTeamPlayer(true)
	teamData[2] = FS_Battle_MatchGame.GetTeamPlayer(false)
end

function LoadingCtrl.LoadTeam(teamIndex)
	loaderTeam[teamIndex].loadCallback = function(index, com, data)
		local slider = com:GetGameObject("HeroLoading_Slider"):GetComponent("Slider")

		slider.value = 0
		loadingProgress[teamIndex][index] = slider

		local player = teamData[teamIndex][index]
		local heroPhoto = com:GetGameObject("hero")
		local photoImg = XImage:new(heroPhoto)
		local heroId = player:choosedHeroId()
		local sprite = XObjectPool.GetIcon("portrait" .. heroId)

		photoImg:SetSprite(sprite)

		local heroData = MS_HeroData.GetHero(heroId)
		local heroName = com:GetText("name")

		heroName:SetContent(player:getUserName())

		if not player:isMine() then
			heroName:SetColor(1, 1, 1, 1)
		end

		local heroTitle = com:GetText("hero_name")

		heroTitle:SetContent(heroData.Name)
	end
	loaderTeam[teamIndex].loadCount = #teamData[teamIndex]

	loaderTeam[teamIndex]:Load()
end

function LoadingCtrl.UpdatePvpProgress()
	for teamIndex = 1, 2 do
		local team = loadingProgress[teamIndex]

		for _k, _v in pairs(team) do
			_v.value = teamData[teamIndex][_k]:getProgress() / 100
		end
	end
end

function LoadingCtrl.SimpleLoading(flag, bgTranslucent, hideIcon)
	this.gameObject:SetActive(flag)
	simpleLoading:SetActive(flag)

	if bgTranslucent then
		loadingBGB:SetActive(not bgTranslucent)
		loadingBGT:SetActive(bgTranslucent)
	else
		loadingBGB:SetActive(not bgTranslucent)
		loadingBGT:SetActive(bgTranslucent)
	end

	if hideIcon ~= nil then
		showIconLittle = not hideIcon
	else
		showIconLittle = true
	end

	iconLittle:SetActive(showIconLittle)
end

function LoadingCtrl.SetLoadingText(show, content)
	if content and extraText then
		showExtraText = show

		extraText.gameObject:SetActive(show)
		extraText:SetContent(content)
	end
end

function LoadingCtrl.ClearLoadingText()
	if extraText then
		extraText:SetContent("")
	end
end

return LoadingCtrl
