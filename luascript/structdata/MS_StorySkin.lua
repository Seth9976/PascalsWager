-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StorySkin.lua

require("GameData/StructData/ExportData/ES_StorySkin")

MS_StorySkin = class("MS_StorySkin")
MS_StorySkin.storySkinList = {}
MS_StorySkin.heroSkinMax = {}
MS_StorySkin.heroSkinList = {}

function MS_StorySkin.Init()
	for k, data in pairs(ES_StorySkin) do
		local skinId = tonumber(data.SkinId)
		local heroIdWithSkin = tonumber(data.HeroId)
		local heroId = BattleData.ConvertHeroIdWithoutSkin(heroIdWithSkin)
		local skinIndex = skinId % 1000

		MS_StorySkin.storySkinList[skinId] = data

		if MS_StorySkin.heroSkinList[heroId] == nil then
			MS_StorySkin.heroSkinList[heroId] = {}
		end

		if skinIndex > 0 then
			if MS_StorySkin.heroSkinMax[heroId] == nil then
				MS_StorySkin.heroSkinMax[heroId] = 0
			end

			MS_StorySkin.heroSkinMax[heroId] = MS_StorySkin.heroSkinMax[heroId] + 1
		end

		MS_StorySkin.heroSkinList[heroId][skinIndex + 1] = skinId
	end
end

function MS_StorySkin.RefreshLanguage()
	if GameTextData.StorySkin == nil then
		return
	end

	for k, v in pairs(MS_StorySkin.storySkinList) do
		if GameTextData.StorySkin[tostring(k) .. "Title"] ~= nil then
			v.Title = GameTextData.StorySkin[tostring(k) .. "Title"]
		end

		if GameTextData.StorySkin[tostring(k) .. "Text"] ~= nil then
			v.Text = GameTextData.StorySkin[tostring(k) .. "Text"]
		end
	end
end

function MS_StorySkin.GetSkin(skinId)
	return MS_StorySkin.storySkinList[skinId]
end

function MS_StorySkin.GetSkinId(heroId)
	return MS_StorySkin.heroSkinList[heroId]
end

function MS_StorySkin.GetDefaultOpen(heroId)
	for k, v in pairs(MS_StorySkin.storySkinList) do
		if v.HeroId == heroId and v.Enable == 1 then
			return true
		end
	end

	return false
end

function MS_StorySkin.GetSkinList()
	local tmpList = {}

	for k, v in pairs(MS_StorySkin.storySkinList) do
		if v.SkinId < 5000 then
			table.insert(tmpList, v)
		end
	end

	table.sort(tmpList, function(a, b)
		return tonumber(a.SkinId) < tonumber(b.SkinId)
	end)

	return tmpList
end

function MS_StorySkin.GetSkinListByHero(heroId)
	local tmpList = {}
	local skinIdList = MS_StorySkin.heroSkinList[heroId]
	local count = table.nums(skinIdList)

	for i = 1, count do
		local skinId = skinIdList[i]

		table.insert(tmpList, MS_StorySkin.storySkinList[skinId])
	end

	table.sort(tmpList, function(a, b)
		return tonumber(a.SkinId) < tonumber(b.SkinId)
	end)

	return tmpList
end

function MS_StorySkin.GetSkinMax(heroId)
	local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)

	if MS_StorySkin.heroSkinMax[tmpHeroId] ~= nil then
		return MS_StorySkin.heroSkinMax[tmpHeroId]
	end

	return 0
end
