-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryPatch.lua

require("GameData/StructData/ExportData/ES_StoryPatch")

MS_StoryPatch = class("MS_StoryPatch")
MS_StoryPatch.patchList = {}

function MS_StoryPatch.Init()
	for k, data in pairs(ES_StoryPatch) do
		local patchId = data.PatchId

		MS_StoryPatch.patchList[patchId] = data
	end
end

function MS_StoryPatch.GetPatchList()
	return MS_StoryPatch.patchList
end
