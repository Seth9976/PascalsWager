-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_SkillIconData.lua

require("GameData/StructData/ExportData/ES_SkillIconData")

MS_SkillIconData = class("MS_SkillIconData")
MS_SkillIconData.iconList = {}

function MS_SkillIconData.Init()
	for k, data in pairs(ES_SkillIconData) do
		local heroId = tonumber(data.HeroId)

		if MS_SkillIconData.iconList[heroId] == nil then
			MS_SkillIconData.iconList[heroId] = {}
		end

		local btnIndex = tonumber(data.BtnIndex)

		if MS_SkillIconData.iconList[heroId][btnIndex] == nil then
			MS_SkillIconData.iconList[heroId][btnIndex] = {}
		end

		local statusIndex = tonumber(data.Status)

		MS_SkillIconData.iconList[heroId][btnIndex][statusIndex] = tonumber(data.Icon)
	end
end

function MS_SkillIconData.GetSkillList(heroId)
	local tbl = {}

	if MS_SkillIconData.iconList[heroId] then
		local btnIconData = MS_SkillIconData.iconList[heroId]

		for btnIndex, iconData in pairs(btnIconData) do
			for statusIndex, iconId in pairs(iconData) do
				table.insert(tbl, "skill" .. iconId)
			end
		end
	end

	return tbl
end

function MS_SkillIconData.GetSkillListDef(heroId)
	local tbl = {}

	if MS_SkillIconData.iconList[heroId] then
		local btnIconData = MS_SkillIconData.iconList[heroId]

		for btnIndex, data in pairs(btnIconData) do
			table.insert(tbl, "skill" .. data[1])
		end
	end

	return tbl
end

function MS_SkillIconData.GetSkillIconList(heroId)
	local tbl = {}

	if MS_SkillIconData.iconList[heroId] then
		local btnIconData = MS_SkillIconData.iconList[heroId]

		for btnIndex, data in pairs(btnIconData) do
			for status, icon in pairs(data) do
				table.insert(tbl, "skill" .. icon)
			end
		end

		table.insert(tbl, "rage" .. heroId .. 1)

		if heroId == 10002 then
			table.insert(tbl, "rage" .. heroId .. 2)
			table.insert(tbl, "rage" .. heroId .. 3)
		elseif heroId == 10003 then
			table.insert(tbl, "rage" .. heroId .. 2)
		end
	end

	return tbl
end

function MS_SkillIconData.GetSkillIcon(heroId, btnIndex, status)
	if MS_SkillIconData.iconList[heroId] and MS_SkillIconData.iconList[heroId][btnIndex] then
		return MS_SkillIconData.iconList[heroId][btnIndex][status]
	end

	return nil
end
