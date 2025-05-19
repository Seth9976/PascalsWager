-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Battle_FramePacket.lua

require("LuaScript/StructData/FS_Battle_FrameData")

FS_Battle_FramePacket = class("FS_Battle_FramePacket")

function FS_Battle_FramePacket:initialize()
	self.index = 0
	self.frameList = {}
end

function FS_Battle_FramePacket:parse(p_val)
	if p_val ~= nil then
		self.index = FS_Parser.toInt(p_val.index, self.index)

		if p_val.frames ~= nil then
			local num = #p_val.frames

			if num > 0 then
				for i = 1, num do
					local frame = p_val.frames[i]
					local userId = frame.userId

					if self.frameList[userId] ~= nil then
						self.frameList[userId]:parse(frame)
					else
						local v_frameData = FS_Battle_FrameData:new()

						v_frameData:parse(frame)

						self.frameList[userId] = v_frameData
					end
				end
			end
		end
	end
end

function FS_Battle_FramePacket:getFrameIndex()
	return self.index
end

function FS_Battle_FramePacket:getFrameData(userId)
	if self.frameList ~= nil and self.frameList[userId] ~= nil then
		return self.frameList[userId]
	end

	return nil
end

function FS_Battle_FramePacket:getFrameDataNum()
	if self.frameList ~= nil then
		return table.nums(self.frameList)
	end

	return 0
end

return FS_Battle_FramePacket
