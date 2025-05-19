-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_Bag.lua

local BattleBag_pb = require("LuaScript/Protocol/Protobuf/BattleBag_pb")

NI_Bag = class("NI_Bag")

function NI_Bag.RequestUpdateClientBag(baglist)
	SystemHelper.LogTest("================NI_Hero.RequestUpdateClientBag================")

	if ReqLogin then
		local request = BattleBag_pb.ReqUpdateClientBag()
		local itemStr = ""

		for k, v in pairs(baglist) do
			local item = request.items:add()

			item.id = v:GetItemId()
			item.qty = v:GetNum()
			itemStr = itemStr .. tostring(item.id) .. tostring(item.qty)
		end

		request.updateTime = os.time()
		itemStr = itemStr .. tostring(request.updateTime)
		request.sign = Util.md5(itemStr)

		local msg = request:SerializeToString()
		local buffer = ByteBuffer.New()

		buffer:WriteShort(XProtocol.BattleProtocolToBag.REQ_UPDATE_BATTLE_BAG)
		buffer:WriteBuffer(msg)
		networkMgr:SendMessage(buffer)
	end
end

function NI_Bag.ParseUpdateBagItem(buffer)
	SystemHelper.LogTest("================NI_Bag.ParseUpdateBagItem================")

	local msg

	if ReqLogin then
		local data = buffer:ReadBuffer()

		msg = BattleBag_pb.UpdateBagItem()

		msg:ParseFromString(data)
	else
		msg = buffer
	end

	if msg ~= nil then
		FS_UserData.itemList:ParseUpdateBagItem(msg)
	end
end

function NI_Bag.ParseAddBagItem(buffer)
	SystemHelper.LogTest("================NI_Bag.ParseAddBagItem================")

	local msg

	if ReqLogin then
		local data = buffer:ReadBuffer()

		msg = BattleBag_pb.AddBagItem()

		msg:ParseFromString(data)
	else
		msg = buffer
	end

	if msg ~= nil then
		FS_UserData.itemList:ParseAddBagItem(msg)
	end
end

function NI_Bag.ParseRemoveBagItem(buffer)
	SystemHelper.LogTest("================NI_Bag.ParseRemoveBagItem================")

	local msg

	if ReqLogin then
		local data = buffer:ReadBuffer()

		msg = BattleBag_pb.RemoveBagItem()

		msg:ParseFromString(data)
	else
		msg = buffer
	end

	if msg ~= nil then
		FS_UserData.itemList:ParseRemoveBagItem(msg)
	end
end

function NI_Bag.ParseBattleBagUpdateDone(buffer)
	SystemHelper.LogTest("================NI_Bag.ParseBattleBagUpdateDone================")

	local msg

	if ReqLogin then
		local data = buffer:ReadBuffer()

		msg = BattleBag_pb.BattleBagUpdateDone()

		msg:ParseFromString(data)
	else
		msg = buffer
	end

	if msg ~= nil then
		SystemHelper.Log("[TODO]")
	end
end

function NI_Bag.ParseInitBagItemList(buffer)
	SystemHelper.LogTest("================NI_Bag.ParseInitBagItemList================")

	local msg

	if ReqLogin then
		local data = buffer:ReadBuffer()

		msg = BattleBag_pb.BagItemList()

		msg:ParseFromString(data)
	else
		local itemIDs = {
			{
				20001,
				4,
				1
			},
			{
				40001,
				10,
				0
			}
		}

		msg = BattleBag_pb.BagItemList()

		for i = 1, #itemIDs do
			local item = msg.bagItems:add()

			item.id = i
			item.itemNo = itemIDs[i][1]
			item.qty = itemIDs[i][2]
			item.bagType = itemIDs[i][3]
		end
	end

	if msg ~= nil then
		local itemList = msg.bagItems

		FS_UserData.itemList:Parse(itemList)
	end
end
