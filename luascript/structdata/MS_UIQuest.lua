-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_UIQuest.lua

require("GameData/StructData/ExportData/ES_UIQuest")

MS_UIQuest = class("MS_UIQuest")
MS_UIQuest.questList = {}
MS_UIQuest.static.QuestType = {
	BranchGoal = 4,
	BranchTitle = 3,
	DocumentTitle = 5,
	DocumentGoal = 6,
	MainTitle = 1,
	MainGoal = 2
}

function MS_UIQuest.Init()
	for k, data in pairs(ES_UIQuest) do
		local questId = tonumber(data.QuestId)

		if MS_UIQuest.questList[questId] == nil then
			MS_UIQuest.questList[questId] = {}
		end

		MS_UIQuest.questList[questId] = data
	end
end

function MS_UIQuest.GetQuest(questId)
	local qid = tonumber(questId)

	if MS_UIQuest.questList[qid] ~= nil then
		return MS_UIQuest.questList[qid]
	end

	return nil
end

function MS_UIQuest.GetMainQuestTitleAll()
	local tmpList = {}

	for k, data in pairs(MS_UIQuest.questList) do
		if data.QuestType == MS_UIQuest.QuestType.MainTitle then
			table.insert(tmpList, data)
		end
	end

	table.sort(tmpList, function(a, b)
		return tonumber(a.QuestSort) < tonumber(b.QuestSort)
	end)

	return tmpList
end

function MS_UIQuest.GetDocumentTitleAll()
	local tmpList = {}

	for k, data in pairs(MS_UIQuest.questList) do
		if data.QuestType == MS_UIQuest.QuestType.DocumentTitle then
			table.insert(tmpList, data)
		end
	end

	table.sort(tmpList, function(a, b)
		return tonumber(a.QuestSort) < tonumber(b.QuestSort)
	end)

	return tmpList
end

function MS_UIQuest.GetGoalList(titleId)
	local tmpList = {}

	for k, data in pairs(MS_UIQuest.questList) do
		if (data.QuestType == MS_UIQuest.QuestType.MainGoal or data.QuestType == MS_UIQuest.QuestType.BranchGoal or data.QuestType == MS_UIQuest.QuestType.DocumentGoal) and math.floor(titleId / 100) == math.floor(data.QuestId / 100) then
			table.insert(tmpList, data)
		end
	end

	return tmpList
end

function MS_UIQuest.GetMainGoalList()
	local tmpList = {}

	for k, data in pairs(MS_UIQuest.questList) do
		if data.QuestType == MS_UIQuest.QuestType.MainGoal then
			table.insert(tmpList, data)
		end
	end

	table.sort(tmpList, function(a, b)
		return tonumber(a.QuestSort) < tonumber(b.QuestSort)
	end)

	return tmpList
end

function MS_UIQuest.GetGoalListByOrder(titleId, orderList)
	local tmpList = {}

	for k, v in pairs(orderList) do
		if math.floor(titleId / 100) == math.floor(MS_UIQuest.questList[v].QuestId / 100) then
			table.insert(tmpList, MS_UIQuest.questList[v])
		end
	end

	return tmpList
end

function MS_UIQuest.GetBranchQuestTitleAll()
	local tmpList = {}

	for k, data in pairs(MS_UIQuest.questList) do
		if data.QuestType == MS_UIQuest.QuestType.BranchTitle then
			table.insert(tmpList, data)
		end
	end

	table.sort(tmpList, function(a, b)
		return tonumber(a.QuestSort) < tonumber(b.QuestSort)
	end)

	return tmpList
end

function MS_UIQuest.GetMainTaskTitleIconList()
	local ret = {}

	for k, data in pairs(MS_UIQuest.questList) do
		if data.QuestType == MS_UIQuest.QuestType.MainTitle then
			table.insert(ret, data.QuestId)
		end
	end

	return ret
end

function MS_UIQuest.GetGoalByShowQuest(showQuestId)
	for k, data in pairs(MS_UIQuest.questList) do
		if data.ShowQuestId == showQuestId then
			return data.QuestId
		end
	end
end

function MS_UIQuest.RefreshLanguage()
	if GameTextData.UIQuest == nil then
		return
	end

	for k, v in pairs(MS_UIQuest.questList) do
		if GameTextData.UIQuest[tostring(k) .. "Name"] ~= nil then
			v.Name = GameTextData.UIQuest[tostring(k) .. "Name"]
		end

		if GameTextData.UIQuest[tostring(k) .. "Description"] ~= nil then
			v.Description = GameTextData.UIQuest[tostring(k) .. "Description"]
		end
	end
end
