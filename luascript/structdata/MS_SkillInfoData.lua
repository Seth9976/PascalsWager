-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_SkillInfoData.lua

require("GameData/StructData/ExportData/ES_SkillInfoData")

MS_SkillInfoData = class("MS_SkillInfoData")
MS_SkillInfoData.skillInfoList = {}

function MS_SkillInfoData.Init()
	for k, data in pairs(ES_SkillInfoData) do
		local heroId = tonumber(data.HeroId)

		if MS_SkillInfoData.skillInfoList[heroId] == nil then
			MS_SkillInfoData.skillInfoList[heroId] = {}
		end

		MS_SkillInfoData.skillInfoList[heroId] = data
	end
end

function MS_SkillInfoData.GetSkillInfoList(heroId)
	if MS_SkillInfoData.skillInfoList[heroId] ~= nil then
		return MS_SkillInfoData.skillInfoList[heroId]
	end

	return nil
end
