-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_UIHeroInfo.lua

require("GameData/StructData/ExportData/ES_UIHeroInfo")

MS_UIHeroInfo = class("MS_UIHeroInfo")
MS_UIHeroInfo.skillInfoList = {}

function MS_UIHeroInfo.Init()
	for k, data in pairs(ES_UIHeroInfo) do
		local heroId = tonumber(data.HeroId)

		if MS_UIHeroInfo.skillInfoList[heroId] == nil then
			MS_UIHeroInfo.skillInfoList[heroId] = {}
		end

		table.insert(MS_UIHeroInfo.skillInfoList[heroId], data)
	end
end

function MS_UIHeroInfo.GetSkillInfoList(heroId)
	if MS_UIHeroInfo.skillInfoList[heroId] ~= nil then
		return MS_UIHeroInfo.skillInfoList[heroId]
	end

	return nil
end

function MS_UIHeroInfo.RefreshLanguage()
	if GameTextData.UIHeroInfo == nil then
		return
	end

	for k, v in pairs(MS_UIHeroInfo.skillInfoList) do
		for _k, _v in pairs(v) do
			if GameTextData.UIHeroInfo[tostring(k) .. tostring(_v.JoystickIcon)] ~= nil then
				_v.Description = GameTextData.UIHeroInfo[tostring(k) .. tostring(_v.JoystickIcon)]
			end
		end
	end
end
