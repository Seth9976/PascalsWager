-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerLoadScene.lua

ControllerLoadScene = class("ControllerLoadScene")
ControllerLoadScene.static.DelayTime = 0.1
ControllerLoadScene.static.Status = {
	LoadWait = 2,
	LoadDelay = 3,
	Load = 1,
	Finish = 4,
	Start = 0
}

local loadStatus = ControllerLoadScene.Status.Start
local loadProgressStep = 0
local isUseLoadProgress = false
local loadPackageList, loadNameList
local loadPackageCnt = 0
local loadManager, sceneController
local loadDelayTime = 0
local this = ControllerLoadScene

function ControllerLoadScene.Init(loader)
	loadManager = loader
	sceneController = ST_Main.GetSceneController()
end

function ControllerLoadScene.LoadStart(sceneList, loadStep, useProgress)
	loadStatus = ControllerLoadScene.Status.Start
	loadProgressStep = loadStep
	isUseLoadProgress = useProgress
	loadPackageCnt = 0
	loadPackageList = {}
	loadNameList = {}

	local tmpList = {}

	for tmpSceneId, v in pairs(sceneList) do
		if tmpList[tmpSceneId] == nil then
			local tmpSceneName = BattleData.GetSceneName(tmpSceneId)
			local tmpPackage = ""

			if DebugUseSceneBuild == false then
				tmpPackage = "Scene/" .. tmpSceneName
			else
				local tmpPath = BattleData.GetScenePath(tmpSceneId)

				tmpPackage = tmpPath .. tmpSceneName
			end

			table.insert(loadPackageList, tmpPackage)
			table.insert(loadNameList, tmpSceneName)

			tmpList[tmpSceneId] = 1
		end
	end

	loadStatus = ControllerLoadScene.Status.Load
end

function ControllerLoadScene.IsFinish()
	if loadPackageCnt >= #loadPackageList then
		ControllerLoadScene.LoadFinish()

		return true
	end

	return false
end

function ControllerLoadScene.LoadFinish()
	loadManager:EndLoad()
	ControllerLoadScene.Exit()
end

function ControllerLoadScene.Update()
	if loadStatus == ControllerLoadScene.Status.Load then
		if loadPackageCnt < #loadPackageList then
			local tmpPackage = loadPackageList[loadPackageCnt + 1]
			local tmpSceneName = loadNameList[loadPackageCnt + 1]

			SystemHelper.LogTest("===########################==ControllerLoadScene=====tmpPackage=" .. tmpPackage .. ",tmpSceneName=" .. tmpSceneName)

			if isUseLoadProgress == true then
				LoadProgress.CreateAndAddItem(loadProgressStep, tmpSceneName, nil)
			end

			local function cbFun(name)
				SystemHelper.LogTest("================load !!!!!!=name=" .. name)
				sceneController:InitScene(name)

				if isUseLoadProgress == true then
					LoadProgress.SetItemProgress(ControllerMain.LoadStep.LoadScene, name, 100)
				end

				loadPackageCnt = loadPackageCnt + 1

				if loadPackageCnt >= #loadPackageList then
					SystemHelper.LogTest("================loadFinish !!!!!!=")

					loadStatus = ControllerLoadScene.Status.Finish
				else
					loadStatus = ControllerLoadScene.Status.LoadDelay
					loadDelayTime = TimeHelper.getNowTime() + ControllerLoadScene.DelayTime
				end

				loadManager:SetFocusScene(name)
			end

			if DebugUseSceneBuild == false then
				loadManager:LoadLevelAppendFromAssetBundle(tmpPackage, tmpSceneName, true, cbFun)
			else
				loadManager:LoadLevelAppend(tmpPackage, tmpSceneName, true, cbFun)
			end

			loadStatus = ControllerLoadScene.Status.LoadWait
		else
			loadStatus = ControllerLoadScene.Status.Finish
		end
	elseif loadStatus == ControllerLoadScene.Status.LoadDelay then
		local nowTime = TimeHelper.getNowTime()

		if nowTime > loadDelayTime then
			loadStatus = ControllerLoadScene.Status.Load
		end
	end
end

function ControllerLoadScene.Exit()
	loadPackageList = nil
	loadNameList = nil
	loadManager = nil
	sceneController = nil
end

return ControllerLoadScene
