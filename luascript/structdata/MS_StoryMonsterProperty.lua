-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryMonsterProperty.lua

require("GameData/StructData/ExportData/ES_StoryMonsterProperty")

MS_StoryMonsterProperty = class("MS_StoryMonsterProperty")
MS_StoryMonsterProperty.storyMonsterPropertyList = {}

function MS_StoryMonsterProperty.Init()
	for k, data in pairs(ES_StoryMonsterProperty) do
		local storyId = tonumber(data.StoryId)
		local monsterId = tonumber(data.StoryMonsterId)
		local grade = tonumber(data.Grade)

		if MS_StoryMonsterProperty.storyMonsterPropertyList[storyId] == nil then
			MS_StoryMonsterProperty.storyMonsterPropertyList[storyId] = {}
		end

		if MS_StoryMonsterProperty.storyMonsterPropertyList[storyId][monsterId] == nil then
			MS_StoryMonsterProperty.storyMonsterPropertyList[storyId][monsterId] = {}
		end

		MS_StoryMonsterProperty.storyMonsterPropertyList[storyId][monsterId][grade] = data
	end
end

function MS_StoryMonsterProperty.GetStoryMonsterProperty(storyId, monsterId, grade)
	storyId = tonumber(storyId)

	if MS_StoryMonsterProperty.storyMonsterPropertyList[storyId] ~= nil and MS_StoryMonsterProperty.storyMonsterPropertyList[storyId][monsterId] ~= nil and MS_StoryMonsterProperty.storyMonsterPropertyList[storyId][monsterId][grade] ~= nil then
		return MS_StoryMonsterProperty.storyMonsterPropertyList[storyId][monsterId][grade]
	end

	return nil
end
