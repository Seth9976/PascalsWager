-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_SaveStoryData.lua

require("LuaScript/StructData/FS_ItemData")

FS_SaveStoryData = class("FS_SaveStoryData")

function FS_SaveStoryData:initialize()
	self.storyId = 0
	self.questList = {}
end

function FS_SaveStoryData:Clear()
	self.questList = nil
end

function FS_SaveStoryData:Parse(p_val)
	if p_val ~= nil and p_val.stageNo ~= nil then
		self.questList = {}
		self.storyId = FS_Parser.toInt(p_val.stageNo, self.storyId)

		local num = #p_val.stageTaskNo

		if num > 0 then
			for i = 1, num do
				local tmpTaskId = tonumber(p_val.stageTaskNo[i])

				table.insert(self.questList, tmpTaskId)
			end
		end
	end
end

return FS_SaveStoryData
