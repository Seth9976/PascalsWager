-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_ParserJson.lua

FS_ParserJson = class("FS_ParserJson")

function FS_ParserJson.isValidKey(p_val, key)
	if p_val ~= nil and p_val[key] ~= nil then
		return true
	end

	return false
end

function FS_ParserJson.toInt(p_val, key)
	local v_val = 0

	if p_val ~= nil and p_val[key] ~= nil then
		v_val = tonumber(p_val[key])
	end

	return v_val
end

function FS_ParserJson.updateInt(p_val, key, retData)
	if p_val ~= nil and p_val[key] ~= nil then
		retData = tonumber(p_val[key])
	end

	return retData
end

function FS_ParserJson.toBool(p_val, key)
	local v_val = 0

	if p_val ~= nil and p_val[key] ~= nil then
		local isString = type(p_val[key]) == "string"

		if isString then
			local str = tostring(p_val[key])

			if string.lower(str) == "true" then
				return true
			elseif string.lower(str) == "false" then
				return false
			end
		end

		v_val = tonumber(p_val[key])
	end

	if v_val > 0 then
		return true
	end

	return false
end

function FS_ParserJson.updateBool(p_val, key, retData)
	if p_val ~= nil and p_val[key] ~= nil then
		local tmp = tonumber(p_val[key])

		retData = tmp > 0 and true or false
	end

	return retData
end

function FS_ParserJson.toFloat(p_val, key)
	local v_val = 0

	if p_val ~= nil and p_val[key] ~= nil then
		v_val = tonumber(p_val[key])
	end

	return v_val
end

function FS_ParserJson.updateFloat(p_val, key, retData)
	if p_val ~= nil and p_val[key] ~= nil then
		retData = tonumber(p_val[key])
	end

	return retData
end

function FS_ParserJson.toString(p_val, key)
	local v_val = ""

	if p_val ~= nil and p_val[key] ~= nil then
		v_val = tostring(p_val[key])
	end

	return v_val
end

function FS_ParserJson.updateString(p_val, key, retData)
	if p_val ~= nil and p_val[key] ~= nil then
		retData = tostring(p_val[key])
	end

	return retData
end

function FS_ParserJson.toDateTime(p_val, key)
	local v_val = ""
	local ret = os.time()

	if p_val ~= nil and p_val[key] ~= nil then
		v_val = tostring(p_val[key])
	end

	if v_val ~= "" then
		ret = TimeHelper.ParseDataTime(v_val)
	end

	return ret
end

function FS_ParserJson.updateDateTime(p_val, key, retData)
	if p_val ~= nil and p_val[key] ~= nil then
		local p_str = tostring(p_val[key])

		if p_str ~= "" then
			retData = TimeHelper.ParseDataTime(p_str)
		end
	end

	return retData
end

function FS_ParserJson.toTable(p_val, key, d_val)
	ret = nil

	if p_val and p_val[key] then
		ret = SystemHelper.DeepCopy(p_val[key])
	elseif d_val then
		ret = SystemHelper.DeepCopy(d_val)
	end

	return ret
end

return FS_ParserJson
