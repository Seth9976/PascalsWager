-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_UISkillInfo.lua

require("GameData/StructData/ExportData/ES_UISkillInfo")

MS_UISkillInfo = class("MS_UISkillInfo")
MS_UISkillInfo.comboList = {}

function MS_UISkillInfo.Init()
	for k, data in pairs(ES_UISkillInfo) do
		local heroId = tonumber(data.HeroId)

		if MS_UISkillInfo.comboList[heroId] == nil then
			MS_UISkillInfo.comboList[heroId] = {}
		end

		MS_UISkillInfo.comboList[heroId][data.SkillId] = data
	end
end

function MS_UISkillInfo.RefreshLanguage()
	if GameTextData.UISkillInfo == nil then
		return
	end

	for k, v in pairs(MS_UISkillInfo.comboList) do
		for _k, _v in pairs(v) do
			if GameTextData.UISkillInfo[tostring(k) .. tostring(_k)] ~= nil then
				_v.SkillName = GameTextData.UISkillInfo[tostring(k) .. tostring(_k)]
			end
		end
	end
end

function MS_UISkillInfo.GetSkillComboList(heroId)
	if MS_UISkillInfo.comboList[heroId] ~= nil then
		return MS_UISkillInfo.comboList[heroId]
	end

	return nil
end
