-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryGuideSort.lua

require("GameData/StructData/ExportData/ES_StoryGuideSort")

MS_StoryGuideSort = class("MS_StoryGuideSort")
MS_StoryGuideSort.static.TutorialIdDelAcc = 3000
MS_StoryGuideSort.sortList = {}
MS_StoryGuideSort.listCount = 0

function MS_StoryGuideSort.Init()
	local count = 0

	for k, data in pairs(ES_StoryGuideSort) do
		local idx = tonumber(data.GuideSort)
		local pageId = tonumber(data.GuideId)

		MS_StoryGuideSort.sortList[idx] = pageId
		count = count + 1
	end

	if SdkHelper.CHANNEL == "IOS_TIPS" then
		count = count + 1
		MS_StoryGuideSort.sortList[count] = MS_StoryGuideSort.TutorialIdDelAcc
	end

	MS_StoryGuideSort.listCount = count
end

function MS_StoryGuideSort.GetGuideList()
	return MS_StoryGuideSort.sortList
end

function MS_StoryGuideSort.RefreshLanguage()
	MS_StoryTutorial.RefreshLanguage()
	MS_StoryGuide.RefreshLanguage()
end

function MS_StoryGuideSort.GetGuidePage(idx)
	local pageId = MS_StoryGuideSort.sortList[idx]

	if pageId then
		if pageId > 0 and pageId < 2000 or pageId > 9100 then
			return MS_StoryTutorial.GetTutorialData(pageId)
		elseif pageId == MS_StoryGuideSort.TutorialIdDelAcc then
			return MS_StoryTutorial.GetTutorialData(pageId)
		elseif pageId >= 2000 then
			return MS_StoryGuide.GetGuideDataById(pageId)
		end
	else
		return nil
	end
end
