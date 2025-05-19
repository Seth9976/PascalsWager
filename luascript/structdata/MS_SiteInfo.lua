-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_SiteInfo.lua

require("GameData/StructData/ExportData/ES_SiteInfo")

MS_SiteInfo = class("MS_SiteInfo")
MS_SiteInfo.static.CarriageId = 99
MS_SiteInfo.static.DarkFogIdBase = 100
MS_SiteInfo.static.CgBase = 300
MS_SiteInfo.static.Key = "SiteInfo"
MS_SiteInfo.siteList = {}
MS_SiteInfo.portalList = {}
MS_SiteInfo.darkFogList = {}
MS_SiteInfo.portalListByStory = {}

function MS_SiteInfo.Init()
	for _, data in pairs(ES_SiteInfo) do
		local siteId = tonumber(data.SiteId)

		if siteId == MS_SiteInfo.CarriageId then
			MS_SiteInfo.siteList[siteId] = data
		elseif siteId > 10000 then
			local storyId = Mathf.Floor(siteId / 100)

			MS_SiteInfo.darkFogList[siteId] = data
		elseif siteId % 100 == 0 then
			MS_SiteInfo.siteList[siteId] = data
		else
			MS_SiteInfo.portalList[siteId] = data

			local storyId = Mathf.Floor(siteId / 100)

			if MS_SiteInfo.portalListByStory[storyId] == nil then
				MS_SiteInfo.portalListByStory[storyId] = {}
			end

			table.insert(MS_SiteInfo.portalListByStory[storyId], data)
		end
	end
end

function MS_SiteInfo.RefreshLanguage()
	local keySiteInfo = MS_SiteInfo.Key

	if GameTextData[keySiteInfo] == nil then
		return
	end

	local textData = GameTextData[keySiteInfo]

	for k, v in pairs(MS_SiteInfo.siteList) do
		local siteId = tostring(k)
		local name = GameTextData[keySiteInfo][siteId .. "Name"]
		local description = GameTextData[keySiteInfo][siteId .. "Description"]

		if name then
			v.Name = name
		end

		if description then
			v.Description = description
		end
	end

	for k, v in pairs(MS_SiteInfo.portalList) do
		local siteId = tostring(k)
		local name = GameTextData[keySiteInfo][siteId .. "Name"]
		local description = GameTextData[keySiteInfo][siteId .. "Description"]

		if name then
			v.Name = name
		end

		if description then
			v.Description = description
		end
	end

	for k, v in pairs(MS_SiteInfo.darkFogList) do
		local siteId = tostring(k)
		local name = GameTextData[keySiteInfo][siteId .. "Name"]
		local description = GameTextData[keySiteInfo][siteId .. "Description"]

		if name then
			v.Name = name
		end

		if description then
			v.Description = description
		end
	end
end

function MS_SiteInfo.SiteCount()
	local count = table.nums(MS_SiteInfo.siteList) - 2

	return count
end

function MS_SiteInfo.PortalCount()
	return table.nums(MS_SiteInfo.portalList)
end

function MS_SiteInfo.GetSite(storyId)
	local sid = tonumber(storyId)
	local siteData

	if sid > MS_SiteInfo.DarkFogIdBase then
		sid = sid * 100
		siteData = MS_SiteInfo.darkFogList[sid]
	elseif sid == MS_SiteInfo.CarriageId then
		siteData = MS_SiteInfo.siteList[sid]
	elseif sid < MS_SiteInfo.CarriageId then
		sid = sid * 100
		siteData = MS_SiteInfo.siteList[sid]
	end

	return siteData
end

function MS_SiteInfo.GetPortal(siteId)
	siteId = tonumber(siteId)

	local portalData = MS_SiteInfo.portalList[siteId]

	if portalData then
		return portalData
	end

	return nil
end

function MS_SiteInfo.GetStoryPortalList(storyId)
	storyId = tonumber(storyId)

	if MS_SiteInfo.portalListByStory[storyId] ~= nil then
		return MS_SiteInfo.portalListByStory[storyId]
	end

	return nil
end

return MS_SiteInfo
