-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryArea.lua

require("GameData/StructData/ExportData/ES_StoryArea")

MS_StoryArea = class("MS_StoryArea")
MS_StoryArea.static.AreaLinkMax = 4
MS_StoryArea.static.UseAreaLink = false
MS_StoryArea.storyAreaList = {}
MS_StoryArea.storyAreaLinkList = {}

function MS_StoryArea.Init()
	for k, data in pairs(ES_StoryArea) do
		local storyId = tonumber(data.StoryId)
		local areaId = tonumber(data.Area)

		if MS_StoryArea.storyAreaList[storyId] == nil then
			MS_StoryArea.storyAreaList[storyId] = {}
		end

		MS_StoryArea.storyAreaList[storyId][areaId] = data

		for i = 1, MS_StoryArea.AreaLinkMax do
			local linkArea = tonumber(data["AreaLink" .. i])

			if linkArea > 0 then
				if MS_StoryArea.storyAreaLinkList[storyId] == nil then
					MS_StoryArea.storyAreaLinkList[storyId] = {}
				end

				if MS_StoryArea.storyAreaLinkList[storyId][areaId] == nil then
					MS_StoryArea.storyAreaLinkList[storyId][areaId] = {}
				end

				table.insert(MS_StoryArea.storyAreaLinkList[storyId][areaId], linkArea)
			end
		end
	end
end

function MS_StoryArea.GetStoryArea(storyId, areaId)
	storyId = tonumber(storyId)
	areaId = tonumber(areaId)

	if MS_StoryArea.storyAreaList[storyId] ~= nil and MS_StoryArea.storyAreaList[storyId][areaId] ~= nil then
		return MS_StoryArea.storyAreaList[storyId][areaId]
	end

	return nil
end

function MS_StoryArea.GetStoryAreaSceneId(storyId, areaId)
	storyId = tonumber(storyId)
	areaId = tonumber(areaId)

	if MS_StoryArea.storyAreaList[storyId] ~= nil and MS_StoryArea.storyAreaList[storyId][areaId] ~= nil then
		return tonumber(MS_StoryArea.storyAreaList[storyId][areaId].StageId)
	end

	return 0
end

function MS_StoryArea.GetStoryAreaLink(storyId, areaId)
	storyId = tonumber(storyId)
	areaId = tonumber(areaId)

	if MS_StoryArea.storyAreaLinkList[storyId] ~= nil and MS_StoryArea.storyAreaLinkList[storyId][areaId] ~= nil then
		if DebugDLCSceneAll == true then
			local tmpList = {}

			for tmpId, v in pairs(MS_StoryArea.storyAreaLinkList[storyId]) do
				if tmpId ~= areaId then
					table.insert(tmpList, tmpId)
				end
			end

			return tmpList
		else
			return MS_StoryArea.storyAreaLinkList[storyId][areaId]
		end
	end

	return nil
end
