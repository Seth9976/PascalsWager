-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryCrate.lua

require("GameData/StructData/ExportData/ES_StoryCrate")

MS_StoryCrate = class("MS_StoryCrate")
MS_StoryCrate.storyCrateList = {}

function MS_StoryCrate.Init()
	for k, data in pairs(ES_StoryCrate) do
		local storyId = tonumber(data.StoryId)
		local crateId = tonumber(data.CrateId)

		if MS_StoryCrate.storyCrateList[storyId] == nil then
			MS_StoryCrate.storyCrateList[storyId] = {}
		end

		MS_StoryCrate.storyCrateList[storyId][crateId] = data
	end
end

function MS_StoryCrate.GetStoryCrate(storyId, crateId)
	storyId = tonumber(storyId)
	crateId = tonumber(crateId)

	if MS_StoryCrate.storyCrateList[storyId] ~= nil and MS_StoryCrate.storyCrateList[storyId][crateId] ~= nil then
		return MS_StoryCrate.storyCrateList[storyId][crateId]
	end

	return nil
end
