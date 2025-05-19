-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryTutorial.lua

require("GameData/StructData/ExportData/ES_StoryTutorial")

MS_StoryTutorial = class("MS_StoryTutorial")
MS_StoryTutorial.storyTutorialList = {}
MS_StoryTutorial.storyTutorialOpenRage = {}
MS_StoryTutorial.static.GetDocumentId = 1999
MS_StoryTutorial.static.FirstTimeLevelUp = 1998
MS_StoryTutorial.static.FirstTimeFrog = 1997
MS_StoryTutorial.static.FirstTimeBless = 1996
MS_StoryTutorial.static.FirstTimeNorwood = 1995
MS_StoryTutorial.static.FirstTimeViola = 1994
MS_StoryTutorial.static.TutorialIdDelAcc = 3000
MS_StoryTutorial.static.RecordSkillType = {
	SkillEnd = 2,
	SkillStart = 1,
	SkillTrigger = 0
}
MS_StoryTutorial.static.GuideType = {
	Tutorial = 1,
	Guide = 2
}

function MS_StoryTutorial.Init()
	for k, data in pairs(ES_StoryTutorial) do
		local tutorialId = tonumber(data.TutorialId)
		local heroId = tonumber(data.HeroId)

		if Platform == PlatformType.MAC or Platform == PlatformType.PC then
			data.DescriptionTouch = data.DescriptionKeyboard
		end

		MS_StoryTutorial.storyTutorialList[tutorialId] = data

		if data.OpenRage > 0 and data.CompleteQuestId ~= "" then
			local questList = StringHelper.Split(data.CompleteQuestId, ";")

			MS_StoryTutorial.storyTutorialOpenRage[heroId] = tonumber(questList[1])
		end

		local delAccData = {}

		delAccData.ImageId = 10055
		delAccData.Title = ""
		delAccData.DescriptionJoystick = ""
		delAccData.DescriptionTouch = ""
		MS_StoryTutorial.storyTutorialList[MS_StoryTutorial.TutorialIdDelAcc] = delAccData
	end
end

function MS_StoryTutorial.GetStoryTutorial(isOnlyInMaze)
	local ret = {}

	for k, v in pairs(MS_StoryTutorial.storyTutorialList) do
		if isOnlyInMaze then
			if v.MazeOnly == 1 then
				ret[k] = v
			end
		elseif v.MazeOnly == 0 then
			ret[k] = v
		end
	end

	return ret
end

function MS_StoryTutorial.RefreshLanguage()
	if GameTextData.StoryTutorial == nil then
		return
	end

	if Platform == PlatformType.MAC or Platform == PlatformType.PC then
		for k, v in pairs(MS_StoryTutorial.storyTutorialList) do
			if GameTextData.StoryTutorial[tostring(k) .. "DescriptionKeyboard"] ~= nil then
				v.DescriptionTouch = GameTextData.StoryTutorial[tostring(k) .. "DescriptionKeyboard"]
			end

			if GameTextData.StoryTutorial[tostring(k) .. "DescriptionJoystick"] ~= nil then
				v.DescriptionJoystick = GameTextData.StoryTutorial[tostring(k) .. "DescriptionJoystick"]
			end

			if GameTextData.StoryTutorial[tostring(k) .. "Title"] ~= nil then
				v.Title = GameTextData.StoryTutorial[tostring(k) .. "Title"]
			end
		end
	else
		for k, v in pairs(MS_StoryTutorial.storyTutorialList) do
			if GameTextData.StoryTutorial[tostring(k) .. "DescriptionTouch"] ~= nil then
				v.DescriptionTouch = GameTextData.StoryTutorial[tostring(k) .. "DescriptionTouch"]
			end

			if GameTextData.StoryTutorial[tostring(k) .. "DescriptionJoystick"] ~= nil then
				v.DescriptionJoystick = GameTextData.StoryTutorial[tostring(k) .. "DescriptionJoystick"]
			end

			if GameTextData.StoryTutorial[tostring(k) .. "Title"] ~= nil then
				v.Title = GameTextData.StoryTutorial[tostring(k) .. "Title"]
			end
		end

		local delAccData = MS_StoryTutorial.storyTutorialList[MS_StoryTutorial.TutorialIdDelAcc]

		delAccData.Title = GameText.UI_SAVE_IOS_BUTTON_UNBINDING
		delAccData.DescriptionJoystick = GameText.UI_SAVE_GUIDE_CONTENT
		delAccData.DescriptionTouch = GameText.UI_SAVE_GUIDE_CONTENT
		MS_StoryTutorial.storyTutorialList[MS_StoryTutorial.TutorialIdDelAcc] = delAccData
	end
end

function MS_StoryTutorial.GetTutorialData(tutorialId)
	tutorialId = tonumber(tutorialId)

	if MS_StoryTutorial.storyTutorialList ~= nil and MS_StoryTutorial.storyTutorialList[tutorialId] ~= nil then
		return MS_StoryTutorial.storyTutorialList[tutorialId]
	end

	return nil
end

function MS_StoryTutorial.GetTutorialImageIdList()
	local tutorialImageIdList = {}

	for k, v in pairs(MS_StoryTutorial.storyTutorialList) do
		if v.ImageId ~= 0 then
			table.insert(tutorialImageIdList, v.ImageId)
		end
	end

	return tutorialImageIdList
end

function MS_StoryTutorial.GetOpenRageQuestId(heroId)
	if MS_StoryTutorial.storyTutorialOpenRage ~= nil and MS_StoryTutorial.storyTutorialOpenRage[heroId] ~= nil then
		return MS_StoryTutorial.storyTutorialOpenRage[heroId]
	end

	return 0
end
