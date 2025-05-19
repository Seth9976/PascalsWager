-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerLoadCharacter.lua

ControllerLoadCharacter = class("ControllerLoadCharacter")
ControllerLoadCharacter.static.DelayTime = 0
ControllerLoadCharacter.static.Status = {
	LoadPrefab = 5,
	LoadDelay = 7,
	LoadAnimatorUI = 3,
	LoadPrefabWait = 6,
	Start = 0,
	LoadAnimatorUIWait = 4,
	LoadAnimator = 1,
	Finish = 8,
	LoadAnimatorWait = 2
}

local loadStatus = ControllerLoadCharacter.Status.Start
local loadProgressStep = 0
local isUseLoadProgress = false
local loadPackageList, loadAnimPackageList, loadAnimUIPackageList, loadAssetList, loadAnimAssetList, loadAnimUIAssetList, loadHeroIdList
local loadPackageCnt = 0
local loadManager
local loadDelayTime = 0
local loadTimeTest = 0
local this = ControllerLoadCharacter

function ControllerLoadCharacter.Init(loader)
	loadManager = loader
end

function ControllerLoadCharacter.LoadStart(heroIdList, loadStep, useProgress)
	loadStatus = ControllerLoadCharacter.Status.Start
	loadProgressStep = loadStep
	isUseLoadProgress = useProgress
	loadPackageCnt = 0
	loadPackageList = {}
	loadAnimPackageList = {}
	loadAnimUIPackageList = {}
	loadAssetList = {}
	loadAnimAssetList = {}
	loadAnimUIAssetList = {}
	loadHeroIdList = {}

	local tmpList = {}
	local loadUI = false

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local storyId = FS_UserData.story:GetStoryId()

		if MS_StoryList.IsStoryMazeStart(storyId) == true or MS_StoryList.IsStoryCarriage(storyId) == true then
			loadUI = true
		end
	end

	for heroId, v in pairs(heroIdList) do
		if tmpList[heroId] == nil and loadManager:IsHaveCharacterInTemplate(heroId) == false then
			local modelName = BattleData.GetHeroName(heroId)
			local tmpPackage = "character/" .. modelName .. ".unity3d"
			local tmpAnimPackage = 0
			local tmpAnimUIPackage = 0
			local tmpAsset = {
				modelName .. ".prefab"
			}
			local tmpAnimAsset = 0
			local tmpAnimUIAsset = 0

			if BattleData.IsHeroIdNpc(heroId) == true then
				tmpAnimPackage = "character/" .. modelName .. "_anim_npc.unity3d"
				tmpAnimAsset = {
					modelName .. "_npc.controller"
				}
			else
				tmpAnimPackage = "character/" .. modelName .. "_anim.unity3d"
				tmpAnimAsset = {
					modelName .. ".controller"
				}
			end

			if loadUI == true and heroId < 20000 then
				tmpAnimUIPackage = "character/" .. modelName .. "_anim_ui.unity3d"
				tmpAnimUIAsset = {
					"ui_" .. modelName .. ".controller"
				}
			end

			table.insert(loadPackageList, tmpPackage)
			table.insert(loadAnimPackageList, tmpAnimPackage)
			table.insert(loadAnimUIPackageList, tmpAnimUIPackage)
			table.insert(loadAssetList, tmpAsset)
			table.insert(loadAnimAssetList, tmpAnimAsset)
			table.insert(loadAnimUIAssetList, tmpAnimUIAsset)
			table.insert(loadHeroIdList, heroId)

			tmpList[heroId] = 1
		end
	end

	loadStatus = ControllerLoadCharacter.Status.LoadAnimator
end

function ControllerLoadCharacter.IsFinish()
	if loadPackageCnt >= #loadPackageList then
		ControllerLoadCharacter.LoadFinish()

		return true
	end

	return false
end

function ControllerLoadCharacter.LoadFinish()
	ControllerLoadCharacter.Exit()
end

function ControllerLoadCharacter.Update()
	if loadStatus == ControllerLoadCharacter.Status.LoadAnimator then
		if loadPackageCnt < #loadAnimPackageList then
			local tmpPackage = loadAnimPackageList[loadPackageCnt + 1]
			local tmpAsset = loadAnimAssetList[loadPackageCnt + 1]
			local progressCB

			if isUseLoadProgress == true then
				LoadProgress.CreateAndAddItem(loadProgressStep, tmpPackage, tmpAsset)

				function progressCB(packageName, index, request, isFinish)
					LoadProgress.SetSubItemRequest(loadProgressStep, packageName, index, request, isFinish)
				end
			end

			resMgr:LoadPrefabWithProgress(tmpPackage, tmpAsset, true, function(objs)
				local tmpHeroId = loadHeroIdList[loadPackageCnt + 1]

				loadManager:InitAnimator(tmpHeroId, objs[0])

				loadStatus = ControllerLoadCharacter.Status.LoadAnimatorUI
			end, progressCB)

			loadStatus = ControllerLoadCharacter.Status.LoadAnimatorWait
		else
			loadStatus = ControllerLoadCharacter.Status.Finish
		end
	elseif loadStatus == ControllerLoadCharacter.Status.LoadAnimatorUI then
		if loadPackageCnt < #loadAnimUIPackageList then
			local tmpPackage = loadAnimUIPackageList[loadPackageCnt + 1]
			local tmpAsset = loadAnimUIAssetList[loadPackageCnt + 1]

			if tmpPackage == 0 or tmpAsset == 0 then
				loadStatus = ControllerLoadCharacter.Status.LoadPrefab
			else
				local progressCB

				if isUseLoadProgress == true then
					LoadProgress.CreateAndAddItem(loadProgressStep, tmpPackage, tmpAsset)

					function progressCB(packageName, index, request, isFinish)
						LoadProgress.SetSubItemRequest(loadProgressStep, packageName, index, request, isFinish)
					end
				end

				resMgr:LoadPrefabWithProgress(tmpPackage, tmpAsset, true, function(objs)
					local tmpHeroId = loadHeroIdList[loadPackageCnt + 1]

					loadManager:InitAnimatorUI(tmpHeroId, objs[0])

					loadStatus = ControllerLoadCharacter.Status.LoadPrefab
				end, progressCB)

				loadStatus = ControllerLoadCharacter.Status.LoadAnimatorUIWait
			end
		else
			loadStatus = ControllerLoadCharacter.Status.Finish
		end
	elseif loadStatus == ControllerLoadCharacter.Status.LoadPrefab then
		if loadPackageCnt < #loadPackageList then
			local tmpPackage = loadPackageList[loadPackageCnt + 1]
			local tmpAsset = loadAssetList[loadPackageCnt + 1]
			local progressCB

			if isUseLoadProgress == true then
				LoadProgress.CreateAndAddItem(loadProgressStep, tmpPackage, tmpAsset)

				function progressCB(packageName, index, request, isFinish)
					LoadProgress.SetSubItemRequest(loadProgressStep, packageName, index, request, isFinish)
				end
			end

			resMgr:LoadPrefabWithProgress(tmpPackage, tmpAsset, true, function(objs)
				local goChara = GoInstantiate(objs[0])
				local tmpHeroId = loadHeroIdList[loadPackageCnt + 1]

				if goChara ~= nil then
					loadManager:InitModel(tmpHeroId, goChara.transform)
				end

				loadPackageCnt = loadPackageCnt + 1

				if loadPackageCnt >= #loadPackageList then
					loadStatus = ControllerLoadCharacter.Status.Finish
				else
					loadStatus = ControllerLoadCharacter.Status.LoadDelay
					loadDelayTime = TimeHelper.getNowTime() + ControllerLoadCharacter.DelayTime
				end
			end, progressCB)

			loadStatus = ControllerLoadCharacter.Status.LoadPrefabWait
		else
			loadStatus = ControllerLoadCharacter.Status.Finish
		end
	elseif loadStatus == ControllerLoadCharacter.Status.LoadDelay then
		local nowTime = TimeHelper.getNowTime()

		if nowTime > loadDelayTime then
			loadStatus = ControllerLoadCharacter.Status.LoadAnimator
		end
	end
end

function ControllerLoadCharacter.Exit()
	loadHeroIdList = nil
	loadAnimPackageList = nil
	loadAnimUIPackageList = nil
	loadPackageList = nil
	loadAssetList = nil
	loadAnimAssetList = nil
	loadAnimUIAssetList = nil
	loadManager = nil
end

return ControllerLoadCharacter
