-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_BattleBattle.lua

require("LuaScript/Logic/Battle/ActionData")

local BattleBattle_pb = require("LuaScript/Protocol/Protobuf/BattleBattle_pb")

NI_BattleBattle = class("NI_BattleBattle")

function NI_BattleBattle.FrameRequest(actionData)
	local requestFrame = BattleBattle_pb.ReqFrame()

	requestFrame.framePacket.index = actionData.frame

	local frame = requestFrame.framePacket.frames:add()

	frame.userId = FS_UserData.playerList:GetUserId()
	frame.isPredicted = false
	frame.moveX = actionData.moveDir.x
	frame.moveY = actionData.moveDir.y
	frame.moveZ = actionData.moveDir.z
	frame.lockId = actionData.lockId
	frame.actionLongPress = actionData:getPackActionLongPress()
	frame.actionPressUp = actionData:getPackActionPressUp()
	frame.actionMove = actionData.actionMove
	frame.actionX = actionData.actionDir.x
	frame.actionY = actionData.actionDir.y
	frame.actionAssist = actionData.actionAssist
	frame.actionItem = actionData.actionItem
	frame.targetX = actionData.actionTargetPos.x
	frame.targetY = actionData.actionTargetPos.y
	frame.targetZ = actionData.actionTargetPos.z

	local msg = requestFrame:SerializeToString()
	local buffer = ByteBuffer.New()

	buffer:WriteShort(XProtocol.BattleProtocolToBattle.REQ_BATTLE_FRAME)
	buffer:WriteInt(FS_UserData.playerList:GetUserId())
	buffer:WriteInt(FS_Battle_MatchRoom.GetSign())
	buffer:WriteBuffer(msg)
	networkMgrBattleUdp:SendMessage(buffer)
end

function NI_BattleBattle.ParseFrameResponse(buffer)
	local data = buffer:ReadBuffer()
	local msg = BattleBattle_pb.RespFrame()

	msg:ParseFromString(data)

	if msg ~= nil then
		FS_Battle_Frame.Parse(msg)
	end
end

function NI_BattleBattle.TestFrameResponse(buffer)
	local data = buffer:ReadBuffer()
	local msg = BattleBattle_pb.ReqFrame()

	msg:ParseFromString(data)

	if msg ~= nil and msg.framePacket ~= nil then
		local framePacket = FS_Battle_FramePacket:new()

		SystemHelper.LogTest("================ framePacket start ===========")
		framePacket:parse(msg.framePacket)
		SystemHelper.LogTest("================ framePacket finish ===========")
	end
end
