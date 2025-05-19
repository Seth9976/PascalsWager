-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_SkillChainData.lua

require("GameData/StructData/ExportData/ES_SkillChainData")

MS_SkillChainData = class("MS_SkillChainData")
MS_SkillChainData.comboList = {}

function MS_SkillChainData.Init()
	for k, data in pairs(ES_SkillChainData) do
		local heroId = tonumber(data.HeroId)

		if MS_SkillChainData.comboList[heroId] == nil then
			MS_SkillChainData.comboList[heroId] = {}
		end

		local tmpSkillIndexPre = data.SkillIndexPre
		local tmpSkillComboPre = data.SkillComboPre
		local tmpSkillIndexNext = data.SkillIndexNext
		local tmpSkillComboNext = data.SkillComboNext

		table.insert(MS_SkillChainData.comboList[heroId], data)
	end
end

function MS_SkillChainData.GetSkillChainData(heroId, skillIndexPre, skillComboPre, skillIndexNext, skillComboNext)
	if MS_SkillChainData.comboList[heroId] ~= nil then
		for i = 1, #MS_SkillChainData.comboList[heroId] do
			local tmpData = MS_SkillChainData.comboList[heroId][i]

			if tmpData.SkillIndexPre == skillIndexPre and tmpData.SkillComboPre == skillComboPre and tmpData.SkillIndexNext == skillIndexNext and tmpData.SkillComboNext == skillComboNext then
				return tmpData
			end
		end
	end

	return nil
end
