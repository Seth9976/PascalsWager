-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/LoadProgress.lua

require("LuaScript/Common/LoadProgressItem")
require("LuaScript/Common/LoadProgressSubItem")

LoadProgress = class("LoadProgress")
LoadProgress.ProgressList = {}
LoadProgress.WeightList = {}
LoadProgress.IsFinish = false

function LoadProgress.Init(loadList)
	LoadProgress.ProgressList = {}
	LoadProgress.WeightList = {}
	LoadProgress.IsFinish = false

	for k, value in pairs(loadList) do
		local step = value[1]
		local weight = value[2]

		LoadProgress.ProgressList[step] = {}
		LoadProgress.WeightList[step] = weight
	end
end

function LoadProgress.CreateAndAddItem(step, name, children)
	if children ~= nil and type(children) == "table" then
		local subItemList = {}

		for i = 1, #children do
			local subItemName = children[i]
			local subItem = LoadProgressSubItem:new(subItemName)

			table.insert(subItemList, subItem)
		end

		local item = LoadProgressItem:new(name, subItemList)

		LoadProgress.AddItem(step, item)
	else
		local item = LoadProgressItem:new(name, nil)

		LoadProgress.AddItem(step, item)
	end
end

function LoadProgress.AddItem(step, item)
	if LoadProgress.ProgressList[step] ~= nil and item ~= nil and LoadProgress.ProgressList[step][item.itemName] == nil then
		LoadProgress.ProgressList[step][item.itemName] = item
	end
end

function LoadProgress.GetItem(step, itemName)
	if LoadProgress.ProgressList[step] ~= nil and LoadProgress.ProgressList[step][itemName] ~= nil then
		return LoadProgress.ProgressList[step][itemName]
	end

	return nil
end

function LoadProgress.SetItemProgress(step, itemName, progress)
	local item = LoadProgress.GetItem(step, itemName)

	if item ~= nil and item:isHaveSubItem() == false then
		item:setProgress(progress)
	end
end

function LoadProgress.GetSubItemNameList(step, itemName)
	local item = LoadProgress.GetItem(step, itemName)

	if item ~= nil then
		return item:GetSubItemNameList()
	end

	return nil
end

function LoadProgress.SetSubItemRequest(step, itemName, index, request, isFinish)
	local item = LoadProgress.GetItem(step, itemName)

	if item ~= nil then
		return item:SetSubItemRequest(index, request, isFinish)
	end

	return nil
end

function LoadProgress.GetProgress()
	if LoadProgress.IsFinish == true then
		return 100
	else
		local progress = 0
		local weightAll = 0

		for step, info in pairs(LoadProgress.ProgressList) do
			local weight = LoadProgress.WeightList[step]
			local itemNum = table.nums(info)
			local itemProgressAll = 0

			for itemName, item in pairs(info) do
				if item ~= nil then
					local itemWeight = weight / itemNum
					local itemProgress = 0

					if item:isHaveSubItem() == true then
						local subItemList = item:GetSubItemList()
						local subItemNum = #subItemList
						local subItemProgressAll = 0

						for i = 1, subItemNum do
							local subItem = subItemList[i]
							local subItemWeight = itemWeight / subItemNum
							local subItemProgress = subItem:getProgress()

							subItemProgressAll = subItemProgressAll + subItemWeight * subItemProgress
						end

						itemProgress = subItemProgressAll / itemWeight
					else
						itemProgress = item:getProgress()
					end

					itemProgressAll = itemProgressAll + itemWeight * itemProgress
				end
			end

			progress = progress + itemProgressAll
			weightAll = weightAll + weight
		end

		progress = progress / weightAll

		local retProgress = Mathf.Clamp(Mathf.Ceil(progress), 0, 100)

		return retProgress
	end
end

function LoadProgress.Finish()
	LoadProgress.IsFinish = true
end
