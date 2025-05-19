-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryGuide.lua

require("GameData/StructData/ExportData/ES_StoryGuide")

MS_StoryGuide = class("MS_StoryGuide")
MS_StoryGuide.storyGuideList = {}
MS_StoryGuide.static.AttributeGuideId = 1006

function MS_StoryGuide.Init()
	for k, data in pairs(ES_StoryGuide) do
		local guideId = tonumber(data.GuideId)
		local menuId = tonumber(data.MenuId)

		if MS_StoryGuide.storyGuideList[menuId] == nil then
			MS_StoryGuide.storyGuideList[menuId] = {}
		end

		if Platform == PlatformType.MAC or Platform == PlatformType.PC then
			data.DescriptionTouch = data.DescriptionKeyboard
		end

		MS_StoryGuide.storyGuideList[menuId][guideId] = data
	end
end

function MS_StoryGuide.RefreshLanguage()
	if GameTextData.StoryGuide == nil then
		return
	end

	if Platform == PlatformType.MAC or Platform == PlatformType.PC then
		for k, v in pairs(MS_StoryGuide.storyGuideList) do
			for _k, _v in pairs(v) do
				if GameTextData.StoryGuide[tostring(_k) .. "DescriptionKeyboard"] ~= nil then
					_v.DescriptionTouch = GameTextData.StoryGuide[tostring(_k) .. "DescriptionKeyboard"]
				end

				if GameTextData.StoryGuide[tostring(_k) .. "DescriptionJoystick"] ~= nil then
					_v.DescriptionJoystick = GameTextData.StoryGuide[tostring(_k) .. "DescriptionJoystick"]
				end

				if GameTextData.StoryGuide[tostring(_k) .. "Title"] ~= nil then
					_v.Title = GameTextData.StoryGuide[tostring(_k) .. "Title"]
				end
			end
		end
	else
		for k, v in pairs(MS_StoryGuide.storyGuideList) do
			for _k, _v in pairs(v) do
				if GameTextData.StoryGuide[tostring(_k) .. "DescriptionTouch"] ~= nil then
					_v.DescriptionTouch = GameTextData.StoryGuide[tostring(_k) .. "DescriptionTouch"]
				end

				if GameTextData.StoryGuide[tostring(_k) .. "DescriptionJoystick"] ~= nil then
					_v.DescriptionJoystick = GameTextData.StoryGuide[tostring(_k) .. "DescriptionJoystick"]
				end

				if GameTextData.StoryGuide[tostring(_k) .. "Title"] ~= nil then
					_v.Title = GameTextData.StoryGuide[tostring(_k) .. "Title"]
				end
			end
		end
	end
end

function MS_StoryGuide.GetGuideImageIdList()
	local GuideImageIdList = {}

	for k, v in pairs(MS_StoryGuide.storyGuideList) do
		for _k, _v in pairs(v) do
			if _v.ImageId ~= 0 then
				table.insert(GuideImageIdList, _v.ImageId)
			end
		end
	end

	return GuideImageIdList
end

function MS_StoryGuide.GetGuideDataList(menuId)
	return MS_StoryGuide.storyGuideList[menuId]
end

function MS_StoryGuide.GetGuideDataById(guideId)
	for k, v in pairs(MS_StoryGuide.storyGuideList) do
		for _k, _v in pairs(v) do
			if _k == guideId then
				return _v
			end
		end
	end

	return nil
end

function MS_StoryGuide.GetGuideCompleteQuest(menuId)
	if MS_StoryGuide.storyGuideList[menuId] ~= nil then
		for k, v in pairs(MS_StoryGuide.storyGuideList[menuId]) do
			return v.CompleteQuestId
		end
	end

	return ""
end
