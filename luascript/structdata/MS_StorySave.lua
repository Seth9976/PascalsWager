-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StorySave.lua

require("GameData/StructData/ExportData/ES_StorySave")

MS_StorySave = class("MS_StorySave")
MS_StorySave.storySaveList = {}

function MS_StorySave.Init()
	for k, data in pairs(ES_StorySave) do
		local storyId = tonumber(data.StoryId)
		local saveId = tonumber(data.SaveId)

		if MS_StorySave.storySaveList[storyId] == nil then
			MS_StorySave.storySaveList[storyId] = {}
		end

		if MS_StorySave.storySaveList[storyId][saveId] == nil then
			MS_StorySave.storySaveList[storyId][saveId] = {}
		end

		table.insert(MS_StorySave.storySaveList[storyId][saveId], data)
	end
end

function MS_StorySave.GetStorySaveList(storyId, saveId)
	storyId = tonumber(storyId)
	saveId = tonumber(saveId)

	if MS_StorySave.storySaveList[storyId] ~= nil and MS_StorySave.storySaveList[storyId][saveId] ~= nil then
		return MS_StorySave.storySaveList[storyId][saveId]
	end

	return nil
end
