-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Parser.lua

FS_Parser = class("FS_Parser")

function FS_Parser.toInt(p_val, origin)
	if p_val ~= nil then
		origin = tonumber(p_val)
	end

	return origin
end

function FS_Parser.toBool(p_val, origin)
	if p_val ~= nil then
		origin = p_val
	end

	return origin
end

function FS_Parser.toFloat(p_val, origin)
	if p_val ~= nil then
		origin = tonumber(p_val)
	end

	return origin
end

function FS_Parser.toString(p_val, origin)
	if p_val ~= nil and p_val ~= "null" then
		origin = tostring(p_val)
	end

	return origin
end

function FS_Parser.toDateTime(p_val, origin)
	if p_val ~= nil and p_val ~= "null" then
		local v_val = tostring(p_val)

		if v_val ~= "" then
			origin = TimeHelper.ParseDataTime(v_val)
		end
	end

	return origin
end

return FS_Parser
