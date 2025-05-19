-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryMazeStatue.lua

require("GameData/StructData/ExportData/ES_StoryMazeStatue")

MS_StoryMazeStatue = class("MS_StoryMazeStatue")
MS_StoryMazeStatue.storyMazeStatueList = {}

function MS_StoryMazeStatue.Init()
	for k, data in pairs(ES_StoryMazeStatue) do
		local statueId = tonumber(data.StatueId)

		if MS_StoryMazeStatue.storyMazeStatueList[statueId] == nil then
			MS_StoryMazeStatue.storyMazeStatueList[statueId] = {}
		end

		table.insert(MS_StoryMazeStatue.storyMazeStatueList[statueId], data)
	end
end

function MS_StoryMazeStatue.RefreshLanguage()
	if GameTextData.StoryMazeStatue == nil then
		return
	end

	for _k, _v in pairs(MS_StoryMazeStatue.storyMazeStatueList) do
		for k, v in pairs(_v) do
			if GameTextData.StoryMazeStatue[tostring(_k) .. v.Index .. "Title"] ~= nil then
				v.Title = GameTextData.StoryMazeStatue[tostring(_k) .. v.Index .. "Title"]
			end

			if GameTextData.StoryMazeStatue[tostring(_k) .. v.Index .. "Description"] ~= nil then
				v.Description = GameTextData.StoryMazeStatue[tostring(_k) .. v.Index .. "Description"]
			end
		end
	end
end

function MS_StoryMazeStatue.GetMazeStatueNum(statueId)
	statueId = tonumber(statueId)

	if MS_StoryMazeStatue.storyMazeStatueList[statueId] ~= nil then
		return #MS_StoryMazeStatue.storyMazeStatueList[statueId]
	end

	return 0
end

function MS_StoryMazeStatue.GetMazeStatueData(statueId, index)
	statueId = tonumber(statueId)
	index = tonumber(index)

	if MS_StoryMazeStatue.storyMazeStatueList[statueId] ~= nil and MS_StoryMazeStatue.storyMazeStatueList[statueId][index] ~= nil then
		return MS_StoryMazeStatue.storyMazeStatueList[statueId][index]
	end

	return nil
end
