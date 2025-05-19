-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryData.lua

MS_StoryData = class("MS_StoryData")
MS_StoryData.static.SelectHeroMax = 2
MS_StoryData.static.LoadHeroMax = 2
MS_StoryData.static.StoryIdInCarriage = 99
MS_StoryData.static.StoryId10003 = 1
MS_StoryData.static.StoryId10006 = 2
MS_StoryData.static.StoryId10007 = 3
MS_StoryData.static.StoryId10004 = 4
MS_StoryData.static.StoryId10008 = 5
MS_StoryData.static.StoryId10010 = 7
MS_StoryData.static.StoryId10011 = 8
MS_StoryData.static.StoryId10012 = 9
MS_StoryData.static.StoryId50001 = 599
MS_StoryData.static.StoryIdForDream = 300
MS_StoryData.static.StoryIdMazeStart = 499
MS_StoryData.static.StoryIdForMaze = 400
MS_StoryData.static.StoryIdForMazeBoss = 500

function MS_StoryData:initialize(data)
	self.storyId = data.StoryId
	self.name = data.Name
	self.stageId = tonumber(data.StageId)
	self.areaId = tonumber(data.AreaId)
	self.description = data.Description
	self.cameraMinY = tonumber(data.CameraMinY)
	self.cameraDistanceRate = tonumber(data.CameraDistanceRate)
	self.selectHeroList = {}
	self.loadHeroList = {}
	self.relatedStoryId = tonumber(data.RelatedStoryId)
	self.StandardTime = data.StandardTime
	self.TotalKillScore2 = data.TotalKillScore2
	self.TotalKillScore3 = data.TotalKillScore3
	self.MonsterCount2 = data.MonsterCount2
	self.MonsterCount3 = data.MonsterCount3
	self.TotalScore2 = data.TotalScore2
	self.TotalScore3 = data.TotalScore3

	for i = 1, MS_StoryData.SelectHeroMax do
		local selectId = tonumber(data["SelectHero_" .. i])

		if selectId > 0 then
			table.insert(self.selectHeroList, selectId)
		end
	end

	for i = 1, MS_StoryData.LoadHeroMax do
		local loadId = tonumber(data["LoadHero_" .. i])

		if loadId > 0 then
			table.insert(self.loadHeroList, loadId)
		end
	end
end

function MS_StoryData:GetSelectHeroList()
	return self.selectHeroList
end

function MS_StoryData:GetLoadHeroList()
	return self.loadHeroList
end

function MS_StoryData:GetName()
	return self.name
end

function MS_StoryData:GetStageId()
	return self.stageId
end

function MS_StoryData:GetAreaId()
	return self.areaId
end

function MS_StoryData:GetDescription()
	return self.description
end

function MS_StoryData:GetCameraDistanceRate()
	return self.cameraDistanceRate
end

function MS_StoryData:GetRelatedStoryId()
	return self.relatedStoryId
end
