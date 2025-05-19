-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryMazeBonefire.lua

require("GameData/StructData/ExportData/ES_StoryMazeBonefire")

MS_StoryMazeBonefire = class("MS_StoryMazeBonefire")
MS_StoryMazeBonefire.storyBonefireList = {}

function MS_StoryMazeBonefire.Init()
	for k, data in pairs(ES_StoryMazeBonefire) do
		local storyId = tonumber(data.StoryId)
		local bonefireId = tonumber(data.BonefireId)

		if MS_StoryMazeBonefire.storyBonefireList[storyId] == nil then
			MS_StoryMazeBonefire.storyBonefireList[storyId] = {}
		end

		MS_StoryMazeBonefire.storyBonefireList[storyId][bonefireId] = data
	end
end

function MS_StoryMazeBonefire.GetStoryBonefire(storyId, bonefireId)
	storyId = tonumber(storyId)
	bonefireId = tonumber(bonefireId)

	if MS_StoryMazeBonefire.storyBonefireList[storyId] ~= nil and MS_StoryMazeBonefire.storyBonefireList[storyId][bonefireId] ~= nil then
		return MS_StoryMazeBonefire.storyBonefireList[storyId][bonefireId]
	end

	return nil
end
