-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryTips.lua

require("GameData/StructData/ExportData/ES_StoryTips")

MS_StoryTips = class("MS_StoryTips")
MS_StoryTips.tipsList = {}
MS_StoryTips.static.TipsMax = 3

function MS_StoryTips.Init()
	for k, data in pairs(ES_StoryTips) do
		local TipsId = tonumber(data.TipsId)

		if Platform == PlatformType.MAC or Platform == PlatformType.PC then
			data.DescriptionTouch = data.DescriptionKeyboard
		end

		MS_StoryTips.tipsList[TipsId] = data
	end
end

function MS_StoryTips.RefreshLanguage()
	if GameTextData.StoryTips == nil then
		return
	end

	if Platform == PlatformType.MAC or Platform == PlatformType.PC then
		for k, v in pairs(MS_StoryTips.tipsList) do
			if GameTextData.StoryTips[tostring(k) .. "DescriptionKeyboard"] ~= nil then
				v.DescriptionTouch = GameTextData.StoryTips[tostring(k) .. "DescriptionKeyboard"]
			end

			if GameTextData.StoryTips[tostring(k) .. "DescriptionJoystick"] ~= nil then
				v.DescriptionJoystick = GameTextData.StoryTips[tostring(k) .. "DescriptionJoystick"]
			end
		end
	else
		for k, v in pairs(MS_StoryTips.tipsList) do
			if GameTextData.StoryTips[tostring(k) .. "DescriptionTouch"] ~= nil then
				v.DescriptionTouch = GameTextData.StoryTips[tostring(k) .. "DescriptionTouch"]
			end

			if GameTextData.StoryTips[tostring(k) .. "DescriptionJoystick"] ~= nil then
				v.DescriptionJoystick = GameTextData.StoryTips[tostring(k) .. "DescriptionJoystick"]
			end
		end
	end
end

function MS_StoryTips.GetRandomTips()
	local random = MathHelper.getRandom(1, MS_StoryTips.TipsMax)

	return MS_StoryTips.tipsList[random]
end
