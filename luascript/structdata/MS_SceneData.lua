-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_SceneData.lua

MS_SceneData = class("MS_SceneData")
MS_SceneData.SceneDataList = {}
MS_SceneData.static.LocatorType = {
	Honeypot = 37,
	Movie = 8,
	Save = 5,
	HomeBase = 14,
	ProtectSan = 26,
	EnemySpace = 1,
	Curtain = 10,
	BornEnemyMaxCount = 28,
	Water = 29,
	Bridge = 23,
	Item = 7,
	VirtualWall = 31,
	Fountain = 36,
	Cage = 33,
	Meeting = 13,
	Wander = 6,
	RoadSign = 34,
	ZoneB = 15,
	Statue = 35,
	BornEnemy = 2,
	SkillPoint = 25,
	Entrance = 38,
	BornHost = 3,
	Rain = 40,
	Crate = 21,
	BornNpc = 4,
	Door = 19,
	CoverKick = 27,
	StairKick = 18,
	ZoneC = 16,
	Carriage = 11,
	Gate = 22,
	Stair = 17,
	BornSan = 24,
	TimeLine = 32,
	Bonefire = 39,
	Dialog = 9,
	CrowFixed = 30,
	Elevator = 20,
	Map = 12
}

function MS_SceneData.Init()
	MS_SceneData.InitSceneData("Cave1002")
	MS_SceneData.InitSceneData("Arena10001")
	MS_SceneData.InitSceneData("Arena10002")

	local sceneList = MS_StoryList.GetSceneList()

	for sceneId, v in pairs(sceneList) do
		MS_SceneData.InitSceneData("Arena" .. sceneId)
	end
end

function MS_SceneData.InitSceneData(sceneName)
	if MS_SceneData.SceneDataList[sceneName] == nil then
		MS_SceneData.SceneDataList[sceneName] = {}
	end

	local sceneData = require("GameData/StructData/ExportData/ES_" .. sceneName)

	for key, value in pairs(sceneData) do
		local type = tonumber(value.Type)
		local id = tonumber(value.Id)

		if MS_SceneData.SceneDataList[sceneName][type] == nil then
			MS_SceneData.SceneDataList[sceneName][type] = {}
		end

		MS_SceneData.SceneDataList[sceneName][type][id] = value
	end

	for k, v in pairs(MS_SceneData.LocatorType) do
		if MS_SceneData.SceneDataList[sceneName][v] == nil then
			MS_SceneData.SceneDataList[sceneName][v] = {}
		end
	end
end

function MS_SceneData.GetGroupData(type)
	local sceneName = BattleData.GetSceneName(BattleData.GetSceneId())

	if MS_SceneData.SceneDataList[sceneName] ~= nil and MS_SceneData.SceneDataList[sceneName][type] ~= nil then
		return MS_SceneData.SceneDataList[sceneName][type]
	end

	return nil
end

function MS_SceneData.GetData(type, id)
	local sceneName = BattleData.GetSceneName(BattleData.GetSceneId())

	if MS_SceneData.SceneDataList[sceneName] ~= nil and MS_SceneData.SceneDataList[sceneName][type] ~= nil then
		if type == MS_SceneData.LocatorType.Map and id == 1 and SystemHelper.isSubquadrateScrAS() == true then
			id = 2
		end

		if MS_SceneData.SceneDataList[sceneName][type][id] ~= nil then
			return MS_SceneData.SceneDataList[sceneName][type][id]
		end
	end

	return nil
end

function MS_SceneData.GetDataByName(type, Name)
	local sceneName = BattleData.GetSceneName(BattleData.GetSceneId())

	if MS_SceneData.SceneDataList[sceneName] ~= nil and MS_SceneData.SceneDataList[sceneName][type] ~= nil and MS_SceneData.SceneDataList[sceneName][type][Name] ~= nil then
		return MS_SceneData.SceneDataList[sceneName][type][Name]
	end

	return nil
end
