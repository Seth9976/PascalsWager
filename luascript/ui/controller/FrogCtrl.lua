-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/FrogCtrl.lua

FrogCtrl = class("FrogCtrl", UICtrlBase)
FrogCtrl.static.FrogSelectionType = {
	Health = 1,
	FogCoin = 3,
	Bone = 2,
	Sanity = 4
}
FrogCtrl.static.IconList = {
	40100,
	40001,
	40011,
	40101
}
FrogCtrl.static.AnimationName = {
	In = MS_AnimalAnimator.GetStateNameHash("in"),
	Happy = MS_AnimalAnimator.GetStateNameHash("happy"),
	Unhappy = MS_AnimalAnimator.GetStateNameHash("unhappy"),
	Over = MS_AnimalAnimator.GetStateNameHash("over"),
	Common = MS_AnimalAnimator.GetStateNameHash("common"),
	Complete = MS_AnimalAnimator.GetStateNameHash("complete"),
	OnGround = MS_AnimalAnimator.GetStateNameHash("OnGround")
}
FrogCtrl.static.AudioName = {
	CommonIdle = "common_idle",
	Happy = "happy",
	UnhappyIdle = "unhappy_idle",
	Complete = "complete",
	Over = "over",
	Common = "common",
	In = "in",
	Unhappy = "unhappy",
	HappyIdle = "happy_idle"
}
FrogCtrl.static.AudioNamePrefixSimple = "hero90008/"
FrogCtrl.static.AudioNamePrefix = "Character/hero90008/"

local this = FrogCtrl
local btnLoader, backBtn, targetMonster, sceneController, gameController
local lastAxis = 0
local canOperate = false
local isOpen = false
local isQuit = false
local beforeCloseFunc, finishTime, currentFrogId, itemGroup, itemNumGroup, currentExistType, closeUITime, isBackToIdle, btnGroupGO, JoystickRT, Animatorframe, isInTransition, Animatortime
local CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.CommonIdle

function FrogCtrl.ClosePanel()
	if not canOperate then
		return
	end

	this.CloseSelf()
end

function FrogCtrl.OnCreate()
	UILayerCtrl.Add("Frog", FrogCtrl.ClosePanel)

	btnLoader = this.mainComponent:GetLoader("FrogPanel_BtnGroup")
	backBtn = this.mainComponent:GetButton("FrogPanel_back")

	backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)

	btnGroupGO = this.mainComponent:GetGameObject("FrogPanel_BtnGroup")
	JoystickRT = this.mainComponent:GetGameObject("FrogPanel_GamePadIconGroup"):GetComponent("RectTransform")
	sceneController = ST_Main.GetSceneController()
	gameController = sceneController:GetGameController()

	backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		FrogCtrl.ClosePanel()
	end)
	UILayerCtrl.AddIndividual("Frog", "FrogPanel_back", backBtn)
	this.gameObject:SetActive(false)

	itemGroup = {}
	itemNumGroup = {}
	currentExistType = {}

	local tempGO = this.mainComponent:GetGameObject("hp")

	itemGroup[FrogCtrl.FrogSelectionType.Health] = tempGO
	tempGO = this.mainComponent:GetGameObject("bone")
	itemGroup[FrogCtrl.FrogSelectionType.Bone] = tempGO
	tempGO = this.mainComponent:GetGameObject("coin")
	itemGroup[FrogCtrl.FrogSelectionType.FogCoin] = tempGO
	tempGO = this.mainComponent:GetGameObject("san")
	itemGroup[FrogCtrl.FrogSelectionType.Sanity] = tempGO

	local tempNum = this.mainComponent:GetText("num1")

	itemNumGroup[FrogCtrl.FrogSelectionType.Health] = tempNum
	tempNum = this.mainComponent:GetText("num2")
	itemNumGroup[FrogCtrl.FrogSelectionType.Bone] = tempNum
	tempNum = this.mainComponent:GetText("num3")
	itemNumGroup[FrogCtrl.FrogSelectionType.FogCoin] = tempNum
	tempNum = this.mainComponent:GetText("num4")
	itemNumGroup[FrogCtrl.FrogSelectionType.Sanity] = tempNum
end

function FrogCtrl.Open(backCB, storyMonsterId, monster)
	gameController = sceneController:GetGameController()
	backBtn.callback = backCB
	targetMonster = monster

	AudioCtrl.StopHeroAudio(targetMonster:GetModelName() .. "/grunts", targetMonster:GetAnimalId())
	this.gameObject:SetActive(true)
	btnGroupGO:SetActive(true)

	currentFrogId = storyMonsterId

	this.LoadSelection(storyMonsterId)

	canOperate = true
	isOpen = true
	finishTime = 0
	closeUITime = 0

	UILayerCtrl.Push("Frog", "selectionBtn1")
	gameController:OpenSpecialTutorial(MS_StoryTutorial.FirstTimeFrog)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(JoystickRT)
	inputMgr:SetInMenuMode()
	inputMgr:SetPointerLocked(false)
end

function FrogCtrl.CloseSelf()
	if beforeCloseFunc then
		beforeCloseFunc()

		beforeCloseFunc = nil
	end

	AudioCtrl.StopHeroAudio(CurrentAudioName, targetMonster:GetAnimalId())
	AudioCtrl.SetHeroAudio(targetMonster:GetModelName() .. "/grunts", targetMonster:GetModel(), targetMonster:GetAnimalId())
	this.gameObject:SetActive(false)

	isOpen = false

	UILayerCtrl.Pop()

	if backBtn.callback ~= nil then
		backBtn.callback()

		backBtn.callback = nil
		targetMonster = nil
	end

	inputMgr:SetInGameMode()
	inputMgr:SetPointerLocked(true)
end

function FrogCtrl.LoadSelection(frogId)
	currentExistType = {}

	local frogData = MS_StoryFrog.GetStoryFrog(frogId)

	XAnimator.PlayAnimator(targetMonster:GetAnimalId(), FrogCtrl.AnimationName.In, 0, 0, 0, 0, false)
	AudioCtrl.StopHeroAudio(CurrentAudioName, targetMonster:GetAnimalId())

	if gameController:GetFrogSatisfy(frogId) == 2 then
		AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.UnhappyIdle, targetMonster:GetTransform(), targetMonster:GetAnimalId())

		CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.UnhappyIdle
	elseif gameController:GetFrogSatisfy(frogId) == 3 then
		AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.CommonIdle, targetMonster:GetTransform(), targetMonster:GetAnimalId())

		CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.CommonIdle
	elseif gameController:GetFrogSatisfy(frogId) == 4 then
		AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.HappyIdle, targetMonster:GetTransform(), targetMonster:GetAnimalId())

		CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.HappyIdle
	end

	targetMonster:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, gameController:GetFrogSatisfy(frogId), 0, 0)

	btnLoader.loadCount = 3

	function btnLoader.loadCallback(index, com, data)
		local type = frogData["SelectType" .. index]
		local value = frogData["SelectValue" .. index]
		local satisfyDelta = frogData["SatisfyAdd" .. index]

		table.insert(currentExistType, type)

		local img = com:GetGameObject("Icon")

		img = XImage:new(img)

		local sprite = XObjectPool.GetIcon("item" .. FrogCtrl.IconList[type])

		img:SetSprite(sprite)

		local title = com:GetText("Content")

		title:SetContent(GameText["UI_FROG_TYPE_TITLE" .. type])

		local num = com:GetText("Num")

		num:SetContent(value)

		local des = com:GetText("Description")

		des:SetContent(GameText["UI_FROG_TYPE_DESCRIPTION" .. type])

		local isEnough = FrogCtrl.IsEnoughCondition(type, value)
		local mask = com:GetGameObject("Mask")

		mask:SetActive(not isEnough)

		local btn = com:GetButton("FrogBtn")

		btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
			if not canOperate then
				return
			end

			UILayerCtrl.OnSelect("selectionBtn" .. index)

			if not isEnough then
				UIManager.SendMessage("MsgBoxSimple", "OpenSimple", GameText.UI_FROG_LACK_OF_ITEM)

				return
			end

			canOperate = false
			isBackToIdle = false
			isQuit = false
			closeUITime = 0

			btnGroupGO:SetActive(false)
			FrogCtrl.DecreaseFrogRequire(type, value)
			gameController:SetFrogSatisfy(frogId, gameController:GetFrogSatisfy(frogId) + satisfyDelta)
			FrogCtrl.InitItemNum(true)
			AudioCtrl.StopHeroAudio(CurrentAudioName, targetMonster:GetAnimalId())

			if gameController:GetFrogSatisfy(frogId) == 5 then
				function beforeCloseFunc()
					FS_UserData.story:SetFrogFinish(frogId)
					gameController:CompleteQuest(frogData.CompleteQuestId)
					gameController:DestroyMonster(frogId)
					gameController:RemoveDialogMonster(frogId)
				end

				VfxManager.PlayBindMulti(targetMonster:GetTransform(), "vfx_90008_relaxtion")
				XAnimator.PlayAnimator(targetMonster:GetAnimalId(), FrogCtrl.AnimationName.Complete, 0, 0, 0, 0, false)
				AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.Complete, targetMonster:GetTransform(), targetMonster:GetAnimalId())

				CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.Complete
				finishTime = TimeHelper.getNowTime() + 12
				closeUITime = TimeHelper.getNowTime() + 2
				isBackToIdle = false
				isQuit = true

				return
			end

			if gameController:GetFrogSatisfy(frogId) == 1 then
				function beforeCloseFunc()
					FS_UserData.story:AddMonsterDead(frogId)
					gameController:DestroyMonster(frogId)
					gameController:RemoveDialogMonster(frogId)
				end

				VfxManager.PlayBindMulti(targetMonster:GetTransform(), "vfx_90008_leave")
				XAnimator.PlayAnimator(targetMonster:GetAnimalId(), FrogCtrl.AnimationName.Over, 0, 0, 0, 0, false)
				AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.Over, targetMonster:GetTransform(), targetMonster:GetAnimalId())

				CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.Over
				finishTime = TimeHelper.getNowTime() + 9
				closeUITime = TimeHelper.getNowTime() + 2
				isBackToIdle = false
				isQuit = true

				return
			end

			if satisfyDelta > 0 then
				XAnimator.PlayAnimator(targetMonster:GetAnimalId(), FrogCtrl.AnimationName.Happy, 0, 0, 0, 0, false)
				targetMonster:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, gameController:GetFrogSatisfy(frogId), 0, 0)
				AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.Happy, targetMonster:GetTransform(), targetMonster:GetAnimalId())

				CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.Happy
				finishTime = TimeHelper.getNowTime() + 2
				isBackToIdle = true
			elseif satisfyDelta < 0 then
				XAnimator.PlayAnimator(targetMonster:GetAnimalId(), FrogCtrl.AnimationName.Unhappy, 0, 0, 0, 0, false)
				targetMonster:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, gameController:GetFrogSatisfy(frogId), 0, 0)
				AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.Unhappy, targetMonster:GetTransform(), targetMonster:GetAnimalId())

				CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.Unhappy
				finishTime = TimeHelper.getNowTime() + 2
				isBackToIdle = true
			else
				XAnimator.PlayAnimator(targetMonster:GetAnimalId(), FrogCtrl.AnimationName.Common, 0, 0, 0, 0, false)
				targetMonster:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, gameController:GetFrogSatisfy(frogId), 0, 0)
				AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.Common, targetMonster:GetTransform(), targetMonster:GetAnimalId())

				CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.Common
				finishTime = TimeHelper.getNowTime() + 2
				isBackToIdle = true
			end
		end)
		UILayerCtrl.AddButton("Frog", "selectionBtn" .. index, btn)

		if index == 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "selectionBtn" .. btnLoader.loadCount)
		end

		if index > 1 then
			btn:SetAdjacent(XButton.Adjacent.UP, "selectionBtn" .. index - 1)
		end

		if index < btnLoader.loadCount then
			btn:SetAdjacent(XButton.Adjacent.DOWN, "selectionBtn" .. index + 1)
		end

		if index == btnLoader.loadCount then
			btn:SetAdjacent(XButton.Adjacent.DOWN, "selectionBtn1")
			UILayerCtrl.OnSelect("selectionBtn1")
			btnGroupGO:SetActive(true)
		end
	end

	btnLoader:Load()
	FrogCtrl.InitItemNum()
end

function FrogCtrl.InitItemNum(hasAnimator)
	local player = sceneController:GetHostPlayer()
	local heroData = FS_UserData.heroList:GetHero(player:GetHeroId())
	local hpNum = heroData:GetHpNum()
	local sanNum = player:GetValue():GetProperty(MS_HeroData.Property.San)
	local sanMax = player:GetValue():GetPropertyMax(MS_HeroData.Property.San)
	local sanRet

	sanRet = sanNum <= sanMax / 2 and 0 or (sanNum - sanMax / 2) * 2

	if hasAnimator then
		itemNumGroup[FrogCtrl.FrogSelectionType.Health]:SetContentAnim(Mathf.Ceil(hpNum))
		itemNumGroup[FrogCtrl.FrogSelectionType.Bone]:SetContentAnim(FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[1]))
		itemNumGroup[FrogCtrl.FrogSelectionType.FogCoin]:SetContentAnim(FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[5]))
		itemNumGroup[FrogCtrl.FrogSelectionType.Sanity]:SetContentAnim(Mathf.Ceil(sanRet))
	else
		itemNumGroup[FrogCtrl.FrogSelectionType.Health]:SetContent(Mathf.Ceil(hpNum))
		itemNumGroup[FrogCtrl.FrogSelectionType.Bone]:SetContent(FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[1]))
		itemNumGroup[FrogCtrl.FrogSelectionType.FogCoin]:SetContent(FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[5]))
		itemNumGroup[FrogCtrl.FrogSelectionType.Sanity]:SetContent(Mathf.Ceil(sanRet))
	end

	for k, v in pairs(itemGroup) do
		v:SetActive(false)
	end

	for k, v in pairs(currentExistType) do
		itemGroup[v]:SetActive(true)
	end
end

function FrogCtrl.IsEnoughCondition(type, value)
	if type == FrogCtrl.FrogSelectionType.Health then
		local player = sceneController:GetHostPlayer()
		local heroData = FS_UserData.heroList:GetHero(player:GetHeroId())

		return value <= heroData:GetHpNum()
	elseif type == FrogCtrl.FrogSelectionType.Bone then
		return value <= FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[1])
	elseif type == FrogCtrl.FrogSelectionType.FogCoin then
		return value <= FS_UserData.itemList:GetItemNum(MS_ItemData.ItemID_ExpAddList[5])
	elseif type == FrogCtrl.FrogSelectionType.Sanity then
		local player = sceneController:GetHostPlayer()
		local sanNum = player:GetValue():GetProperty(MS_HeroData.Property.San)
		local sanMax = player:GetValue():GetPropertyMax(MS_HeroData.Property.San)
		local sanRet

		sanRet = sanNum <= sanMax / 2 and 0 or (sanNum - sanMax / 2) * 2

		return value < sanRet
	end

	return false
end

function FrogCtrl.DecreaseFrogRequire(type, value)
	if type == FrogCtrl.FrogSelectionType.Health then
		local player = sceneController:GetHostPlayer()
		local heroData = FS_UserData.heroList:GetHero(player:GetHeroId())

		heroData:SubHpNum(value)
		sceneController:GetGameController():UpdateUIBag()
	elseif type == FrogCtrl.FrogSelectionType.Bone then
		gameController:UseBagItem(MS_ItemData.ItemID_ExpAddList[1], value)
	elseif type == FrogCtrl.FrogSelectionType.FogCoin then
		gameController:UseBagItem(MS_ItemData.ItemID_ExpAddList[5], value)
	elseif type == FrogCtrl.FrogSelectionType.Sanity then
		local player = sceneController:GetHostPlayer()

		player:GetValue():SubProperty(MS_HeroData.Property.San, value / 2)
	end
end

function FrogCtrl.Update()
	if not isOpen then
		return
	end

	if not this.loadFinish then
		return
	end

	this.UpdateFrogAnimator()
	this.GamePadControl()
end

function FrogCtrl.UpdateFrogAnimator()
	if isBackToIdle then
		Animatortime, Animatorframe, isInTransition = XAnimator.GetTime(targetMonster:GetAnimalId(), 0, Animatorframe, isInTransition)

		if isInTransition then
			AudioCtrl.StopHeroAudio(CurrentAudioName, targetMonster:GetAnimalId())

			if gameController:GetFrogSatisfy(currentFrogId) == 2 then
				AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.UnhappyIdle, targetMonster:GetTransform(), targetMonster:GetAnimalId())

				CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.UnhappyIdle
			elseif gameController:GetFrogSatisfy(currentFrogId) == 3 then
				AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.CommonIdle, targetMonster:GetTransform(), targetMonster:GetAnimalId())

				CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.CommonIdle
			elseif gameController:GetFrogSatisfy(currentFrogId) == 4 then
				AudioCtrl.SetHeroAudio(FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.HappyIdle, targetMonster:GetTransform(), targetMonster:GetAnimalId())

				CurrentAudioName = FrogCtrl.AudioNamePrefixSimple .. FrogCtrl.AudioName.HappyIdle
			end

			isBackToIdle = false
		end
	end

	if finishTime > 0 and TimeHelper.getNowTime() > finishTime then
		if isQuit then
			this.CloseSelf()
		else
			targetMonster:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, gameController:GetFrogSatisfy(currentFrogId), 0, 0)
			btnLoader:Load()

			canOperate = true
		end

		finishTime = 0
	end

	if closeUITime > 0 and TimeHelper.getNowTime() > closeUITime then
		this.gameObject:SetActive(false)

		closeUITime = 0
	end
end

function FrogCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	if UILayerCtrl.IsCurrentLayerCurtain() or UIManager.IsMovieMode() then
		return
	end

	if not canOperate then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName == "Frog" then
		local nowSkillAxis = inputMgr:GetAxis(LS_Setting.Btn.MY)

		if inputMgr:GetButtonUp(GBKey.B) then
			UILayerCtrl.OnButtonClick("FrogPanel_back")

			return
		elseif inputMgr:GetButtonUp(GBKey.A) or inputMgr:GetKeyConfirmDown() then
			UILayerCtrl.OnCursorClick()
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.DU) or inputMgr:GetKeyDown(KMKey.MOVEW) or inputMgr:GetKeyDown(KMKey.CAMPU) or inputMgr:GetKeyDown(XKeyCode.UpArrow) then
			UILayerCtrl.Select(1)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
		elseif inputMgr:GetButtonUp(LS_Setting.Btn.DD) or inputMgr:GetKeyDown(KMKey.MOVES) or inputMgr:GetKeyDown(KMKey.CAMPD) or inputMgr:GetKeyDown(XKeyCode.DownArrow) then
			UILayerCtrl.Select(2)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
		elseif nowSkillAxis < 0.38 and lastAxis > 0.38 then
			UILayerCtrl.Select(1)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
		elseif nowSkillAxis > -0.38 and lastAxis < -0.38 then
			UILayerCtrl.Select(2)
			AudioCtrl.SetButtonClickAudio(AudioCtrl.ButtonClickType.DialogueChoose)
		end

		lastAxis = nowSkillAxis
	end
end

return FrogCtrl
