-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryCoverKickHint.lua

require("GameData/StructData/ExportData/ES_StoryCoverKickHint")

MS_StoryCoverKickHint = class("MS_StoryCoverKickHint")
MS_StoryCoverKickHint.storyCoverKickHintList = {}

function MS_StoryCoverKickHint.Init()
	for k, data in pairs(ES_StoryCoverKickHint) do
		local storyId = tonumber(data.StoryId)
		local coverKickId = tonumber(data.CoverKickId)

		if MS_StoryCoverKickHint.storyCoverKickHintList[storyId] == nil then
			MS_StoryCoverKickHint.storyCoverKickHintList[storyId] = {}
		end

		MS_StoryCoverKickHint.storyCoverKickHintList[storyId][coverKickId] = data
	end
end

function MS_StoryCoverKickHint.GetStoryCoverKickHint(storyId, coverKickId)
	storyId = tonumber(storyId)
	coverKickId = tonumber(coverKickId)

	if MS_StoryCoverKickHint.storyCoverKickHintList[storyId] ~= nil and MS_StoryCoverKickHint.storyCoverKickHintList[storyId][coverKickId] ~= nil then
		return MS_StoryCoverKickHint.storyCoverKickHintList[storyId][coverKickId]
	end

	return nil
end
