-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_TransactionData.lua

require("GameData/StructData/ExportData/ES_TransactionData")

MS_TransactionData = class("MS_TransactionData")
MS_TransactionData.TransactionList = {}

function MS_TransactionData.Init()
	for k, data in pairs(ES_TransactionData) do
		local transactionId = tonumber(data.TransactionId)

		if MS_TransactionData.TransactionList[transactionId] == nil then
			MS_TransactionData.TransactionList[transactionId] = {}
		end

		data.ItemId = data.ItemId_1
		data.Num = data.Num_1
		data.IsRefresh = data.IsRefresh_1
		data.PriceType = data.PriceType_1
		data.Price = data.Price_1
		data.ShowQuestId = data.ShowQuestId_1
		data.HideQuestId = data.HideQuestId_1
		MS_TransactionData.TransactionList[transactionId] = data
	end
end

function MS_TransactionData.SetLoop(loop)
	for k, v in pairs(MS_TransactionData.TransactionList) do
		v.ItemId = v["ItemId_" .. loop]
		v.Num = v["Num_" .. loop]
		v.IsRefresh = v["IsRefresh_" .. loop]
		v.PriceType = v["PriceType_" .. loop]
		v.Price = v["Price_" .. loop]
		v.ShowQuestId = v["ShowQuestId_" .. loop]
		v.HideQuestId = v["HideQuestId_" .. loop]
	end
end

function MS_TransactionData.GetTransactionList()
	return MS_TransactionData.TransactionList
end

function MS_TransactionData.IsNeedRefresh(transactionId)
	if MS_TransactionData.TransactionList[transactionId] ~= nil then
		return MS_TransactionData.TransactionList[transactionId].IsRefresh == 1
	else
		return false
	end
end

function MS_TransactionData.GetNumMax(transactionId)
	if MS_TransactionData.TransactionList[transactionId] ~= nil then
		return MS_TransactionData.TransactionList[transactionId].Num
	else
		return 0
	end
end

function MS_TransactionData.IsNeedReset(transactionId)
	if MS_TransactionData.TransactionList[transactionId] ~= nil then
		return MS_TransactionData.TransactionList[transactionId].NotReset == 0
	else
		return true
	end
end
