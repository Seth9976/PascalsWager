-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryCoverKick.lua

require("GameData/StructData/ExportData/ES_StoryCoverKick")

MS_StoryCoverKick = class("MS_StoryCoverKick")
MS_StoryCoverKick.storyCoverKickList = {}

function MS_StoryCoverKick.Init()
	for k, data in pairs(ES_StoryCoverKick) do
		local storyId = tonumber(data.StoryId)
		local coverKickId = tonumber(data.CoverKickId)

		if MS_StoryCoverKick.storyCoverKickList[storyId] == nil then
			MS_StoryCoverKick.storyCoverKickList[storyId] = {}
		end

		MS_StoryCoverKick.storyCoverKickList[storyId][coverKickId] = data
	end
end

function MS_StoryCoverKick.GetStoryCoverKick(storyId, coverKickId)
	storyId = tonumber(storyId)
	coverKickId = tonumber(coverKickId)

	if MS_StoryCoverKick.storyCoverKickList[storyId] ~= nil and MS_StoryCoverKick.storyCoverKickList[storyId][coverKickId] ~= nil then
		return MS_StoryCoverKick.storyCoverKickList[storyId][coverKickId]
	end

	return nil
end
