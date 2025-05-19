-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_SceneEffect.lua

require("GameData/StructData/ExportData/ES_SceneEffect")

MS_SceneEffect = class("MS_SceneEffect")
MS_SceneEffect.sceneList = {}

function MS_SceneEffect.Init()
	for k, data in pairs(ES_SceneEffect) do
		if MS_SceneEffect.sceneList[data.scene_id] == nil then
			MS_SceneEffect.sceneList[data.scene_id] = {}
		end

		table.insert(MS_SceneEffect.sceneList[data.scene_id], data)
	end
end

function MS_SceneEffect.GetSceneEffect(sceneId)
	if MS_SceneEffect.sceneList[sceneId] ~= nil then
		return MS_SceneEffect.sceneList[sceneId]
	end

	return nil
end
