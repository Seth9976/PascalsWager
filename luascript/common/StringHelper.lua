-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/StringHelper.lua

StringHelper = {}

function StringHelper.Split(str, delimiter)
	str = tostring(str)
	delimiter = tostring(delimiter)

	if delimiter == "" then
		return false
	end

	local pos, arr = 0, {}

	for st, sp in function()
		return string.find(str, delimiter, pos, true)
	end do
		table.insert(arr, string.sub(str, pos, st - 1))

		pos = sp + 1
	end

	table.insert(arr, string.sub(str, pos))

	return arr
end

function StringHelper.StartsWith(str, pre)
	if string.find(str, pre) == 1 then
		return true
	else
		return false
	end
end

function StringHelper.EndsWith(str, ext)
	local index = string.find(str, ext)
	local strLen = string.len(str)
	local strExt = string.len(ext)

	if strLen - strExt + 1 == index then
		return true
	else
		return false
	end
end

function StringHelper.Substring(str, posBegin, posEnd)
	return string.sub(str, posBegin, posEnd)
end

function StringHelper.GetFileNameWithoutExtension(name)
	local nameArr = StringHelper.Split(name, ".")

	return nameArr[1]
end

function StringHelper.ToUpperFirst(str)
	local strLen = string.len(str)
	local strRet = string.sub(str, 1, 1):upper() .. string.sub(str, 2, strLen)

	return strRet
end

function StringHelper.GetStringWordNum(str)
	local lenInByte = #str
	local count = 0
	local i = 1

	while true do
		local curByte = string.byte(str, i)

		if lenInByte < i then
			break
		end

		local byteCount = 1

		if curByte > 0 and curByte < 128 then
			byteCount = 1
		elseif curByte >= 128 and curByte < 224 then
			byteCount = 2
		elseif curByte >= 224 and curByte < 240 then
			byteCount = 3
		elseif curByte >= 240 and curByte <= 247 then
			byteCount = 4
		else
			break
		end

		i = i + byteCount
		count = count + 1
	end

	return count
end
