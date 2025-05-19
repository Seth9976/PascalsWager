-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/Status122.lua

require("LuaScript/Logic/Status/StatusBase")

Status122 = class("Status122", StatusBase)
Status122.static.FogStart = 0
Status122.static.FogEnd = 40
Status122.static.FogChangeSpeed = 4

function Status122:initialize(fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)
	StatusBase.initialize(self, fromAnimalId, hitPlayer, status_id, damage, srcType, srcId)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local storyId = FS_UserData.story:GetStoryId()

		if (MS_StoryList.IsStoryMazeStart(storyId) == true or MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true) and self.sceneController ~= nil then
			self.sceneController:SetSpecialChangeConfig(Status122.FogStart, Status122.FogEnd)
			self.sceneController:StartSpecialChangeConfig(Status122.FogChangeSpeed)
		end
	end
end

function Status122:Clear()
	if self.clearFlg == true then
		return
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local storyId = FS_UserData.story:GetStoryId()

		if (MS_StoryList.IsStoryMazeStart(storyId) == true or MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true) and self.sceneController ~= nil then
			self.sceneController:EndSpecialChangeConfig(false)
		end
	end

	StatusBase.Clear(self)
end

return Status122
