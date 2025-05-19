-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Battle_Frame.lua

require("LuaScript/StructData/FS_Battle_FramePacket")

FS_Battle_Frame = class("FS_Battle_Frame")
FS_Battle_Frame.framePacketList = nil
FS_Battle_Frame.frameRealMax = 0
FS_Battle_Frame.frameMax = 0

function FS_Battle_Frame.initialize()
	FS_Battle_Frame.framePacketList = {}
	FS_Battle_Frame.frameRealMax = 0
	FS_Battle_Frame.frameMax = 0
end

function FS_Battle_Frame.Parse(p_val)
	if FS_Battle_Frame.framePacketList == nil then
		return
	end

	if p_val ~= nil and p_val.framePacket ~= nil then
		local num = #p_val.framePacket

		if num > 0 then
			for i = 1, num do
				local packet = p_val.framePacket[i]
				local key = FS_Battle_Frame.GetKey(packet.index)

				if FS_Battle_Frame.framePacketList[key] ~= nil then
					FS_Battle_Frame.framePacketList[key]:parse(packet)
				else
					local v_packetData = FS_Battle_FramePacket:new()

					v_packetData:parse(packet)

					FS_Battle_Frame.framePacketList[key] = v_packetData
				end

				if packet.index > FS_Battle_Frame.frameMax then
					FS_Battle_Frame.frameMax = packet.index
				end
			end

			FS_Battle_Frame.UpdateFrameMax()
		end
	end
end

function FS_Battle_Frame.GetKey(index)
	return "f" .. index
end

function FS_Battle_Frame.GetFrameData(userId, frameIndex)
	local key = FS_Battle_Frame.GetKey(frameIndex)

	if FS_Battle_Frame.framePacketList ~= nil and FS_Battle_Frame.framePacketList[key] ~= nil then
		local packet = FS_Battle_Frame.framePacketList[key]

		return packet:getFrameData(userId)
	end

	return nil
end

function FS_Battle_Frame.UseFrameData(userId, frameIndex)
	if frameIndex >= 0 then
		local key = FS_Battle_Frame.GetKey(frameIndex)

		if FS_Battle_Frame.framePacketList ~= nil and FS_Battle_Frame.framePacketList[key] ~= nil then
			FS_Battle_Frame.framePacketList[key] = nil
		end
	end
end

function FS_Battle_Frame.IsGetFrameData(frameIndex, allNum)
	local key = FS_Battle_Frame.GetKey(frameIndex)

	if FS_Battle_Frame.framePacketList ~= nil and FS_Battle_Frame.framePacketList[key] ~= nil then
		local packet = FS_Battle_Frame.framePacketList[key]
		local num = packet:getFrameDataNum()

		if num == allNum then
			return true
		end
	end

	return false
end

function FS_Battle_Frame.UpdateFrameMax()
	local num = table.nums(FS_Battle_Frame.framePacketList)
	local diffFrame = FS_Battle_Frame.frameMax - FS_Battle_Frame.frameRealMax
	local checkNum = Mathf.Min(num, diffFrame)

	if checkNum > 0 then
		local newIndex = FS_Battle_Frame.frameRealMax

		for i = 1, checkNum do
			newIndex = newIndex + 1

			local key = FS_Battle_Frame.GetKey(newIndex)

			if FS_Battle_Frame.framePacketList[key] ~= nil then
				FS_Battle_Frame.frameRealMax = newIndex
			end
		end
	end
end

function FS_Battle_Frame.GetFrameMax()
	return FS_Battle_Frame.frameMax
end

function FS_Battle_Frame.GetFrameRealMax()
	return FS_Battle_Frame.frameRealMax
end
