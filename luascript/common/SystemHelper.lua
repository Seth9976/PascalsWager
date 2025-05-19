-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/SystemHelper.lua

SystemHelper = {}

local tconcat = table.concat
local tinsert = table.insert
local srep = string.rep
local screenWidth = UnityEngine.Screen.width
local screenHeight = UnityEngine.Screen.height

function SystemHelper.Log(txt)
	if DebugLog == true then
		print(txt)
	end
end

function SystemHelper.LogTest(txt)
	if DebugLog == true then
		Common.LogTest(txt)
	end
end

function SystemHelper.LogError(txt)
	Common.LogError(txt)
end

function SystemHelper.require(_mname)
	local moduleName = string.gsub(_mname, "/", ".")

	if package.loaded[moduleName] then
		-- block empty
	end

	package.loaded[moduleName] = nil

	require(_mname)
end

function SystemHelper.SetResolution(width, height, isFullscreen)
	UnityEngine.Screen.SetResolution(width, height, isFullscreen)
end

function SystemHelper.SetSreenWidthAndHeight(width, height)
	screenWidth = width
	screenHeight = height
end

function SystemHelper.GetScreenWidth()
	return screenWidth
end

function SystemHelper.GetScreenHeight()
	return screenHeight
end

function SystemHelper.iPhoneX()
	local screenRatio = screenWidth / screenHeight

	if screenRatio >= 2.163 and screenRatio <= 2.17 then
		return true
	end

	return false
end

function SystemHelper.isExtraWideScreen()
	local screenRatio = screenWidth / screenHeight

	if Platform == PlatformType.IOS and screenRatio >= 2.16 and screenRatio <= 2.18 then
		return true
	elseif screenRatio > 1.8 then
		return true
	end

	return false
end

function SystemHelper.iPadProGen3()
	local deviceModel = Common.GetDeviceModel()

	if deviceModel ~= nil then
		if deviceModel == "iPad8,1" or deviceModel == "iPad8,2" or deviceModel == "iPad8,3" or deviceModel == "iPad8,4" or deviceModel == "iPad8,5" or deviceModel == "iPad8,6" or deviceModel == "iPad8,7" or deviceModel == "iPad8,8" or deviceModel == "iPad8,9" or deviceModel == "iPad8,10" or deviceModel == "iPad8,11" or deviceModel == "iPad8,12" or deviceModel == "iPad8,13" or deviceModel == "iPad8,14" or deviceModel == "iPad8,15" or deviceModel == "iPad8,16" then
			return true
		end

		local devIdxStart, devIdxEnd = string.find(deviceModel, "iPad")
		local devIdxComma = string.find(deviceModel, ",")

		if devIdxStart ~= nil and devIdxEnd ~= nil then
			local genIndex = devIdxEnd + 1
			local genStr = string.sub(deviceModel, genIndex, devIdxComma - 1)
			local genInt = tonumber(genStr)

			if genInt ~= nil and genInt > 8 and genInt ~= 11 and genInt ~= 13 then
				return true
			end
		end

		local devIdxStart, devIdxEnd = string.find(deviceModel, "iPhone")
		local devIdxComma = string.find(deviceModel, ",")

		if devIdxStart ~= nil and devIdxEnd ~= nil then
			local genIndex = devIdxEnd + 1
			local genStr = string.sub(deviceModel, genIndex, devIdxComma - 1)
			local genInt = tonumber(genStr)

			if genInt ~= nil and genInt > 13 then
				return true
			end
		end

		return false
	end

	return false
end

function SystemHelper.isSubquadrateScrAS()
	local screenRatio = screenWidth / screenHeight

	if screenRatio >= 1 and screenRatio <= 1.72 then
		return true
	end

	return false
end

function SystemHelper.CheckSubquadrateAspect(screenWidth, screenHeight)
	local screenRatio = screenWidth / screenHeight

	if screenRatio >= 1 and screenRatio <= 1.72 then
		return true
	end

	return false
end

function SystemHelper.GetCanvasScalerWidthFactor(value)
	local designWidth = 1920
	local designHeight = 1080
	local phyW = screenWidth
	local phyH = screenHeight
	local aspectRatio = phyW / phyH
	local wFactor = 1
	local hFactor = 1

	if value == 1 then
		wFactor = aspectRatio
	elseif value == 0 then
		hFactor = designHeight * aspectRatio / designWidth
	end

	return wFactor, hFactor
end

function SystemHelper.isFringeScreen()
	local screenRatio = screenWidth / screenHeight

	if screenRatio >= 2.1 and screenRatio <= 2.12 then
		return true
	end

	return false
end

function SystemHelper.GetTouchWorldPosition(pTf, eventData)
	local worldPosition
	local ret, worldPosition = RectTransformUtility.ScreenPointToWorldPointInRectangle(pTf, eventData.position, eventData.pressEventCamera, worldPosition)

	if ret then
		return worldPosition
	end

	return nil
end

function SystemHelper.GetTouchLocalPosition(pTf, eventData)
	local localPosition
	local ret, localPosition = RectTransformUtility.ScreenPointToLocalPointInRectangle(pTf, eventData.position, eventData.pressEventCamera, localPosition)

	if ret then
		return localPosition
	end

	return nil
end

function SystemHelper.GetDirPressed(vec2)
	local currentInput = 0

	if math.abs(vec2.x) > 15 and math.abs(vec2.y) <= 30 then
		if vec2.x < 0 then
			currentInput = 3
		else
			currentInput = 4
		end
	elseif math.abs(vec2.x) <= 30 and math.abs(vec2.y) > 15 then
		currentInput = vec2.y < 0 and 2 or 1
	end

	return currentInput
end

function SystemHelper.GetDirPressedJpad(vec2)
	local currentInput = 0

	if math.abs(vec2.x) > 0.3 and math.abs(vec2.y) <= 0.7 then
		if vec2.x < 0 then
			currentInput = 3
		else
			currentInput = 4
		end
	elseif math.abs(vec2.x) <= 0.7 and math.abs(vec2.y) > 0.3 then
		currentInput = vec2.y < 0 and 2 or 1
	end

	return currentInput
end

function SystemHelper.SelectLineInScrollRect(dir, rowIndex, rowCount, selIndex, listCount, setpGap, isLoop)
	local normalizedY = -1
	local nextRowIndex = rowIndex
	local prevRowIndex = rowIndex
	local stepLength = 1 / (rowCount - listCount)

	if dir == XButton.Adjacent.UP then
		nextRowIndex = (nextRowIndex + rowCount - 2) % rowCount + 1

		if setpGap < selIndex then
			selIndex = selIndex - 1
		end

		if nextRowIndex <= rowCount - (listCount - setpGap) and setpGap < nextRowIndex and selIndex < setpGap + 1 then
			normalizedY = 1 - stepLength * (nextRowIndex - setpGap - 1)
		elseif nextRowIndex == rowCount then
			if isLoop then
				normalizedY = 0
			else
				nextRowIndex = 0
			end
		end
	elseif dir == XButton.Adjacent.DOWN then
		nextRowIndex = nextRowIndex % rowCount + 1

		if selIndex < listCount - setpGap then
			selIndex = selIndex + 1
		end

		if nextRowIndex > listCount - setpGap and nextRowIndex <= rowCount - setpGap and selIndex >= listCount - setpGap then
			normalizedY = 1 - stepLength * (nextRowIndex - listCount)
		elseif nextRowIndex == 1 then
			if isLoop then
				normalizedY = 1
			else
				nextRowIndex = 1
			end
		end
	elseif dir == XButton.Adjacent.LEFT then
		nextRowIndex = (nextRowIndex + rowCount - 2) % rowCount + 1

		if setpGap < selIndex then
			selIndex = selIndex - 1
		end

		if nextRowIndex <= rowCount - (listCount - setpGap) and setpGap < nextRowIndex and selIndex < setpGap + 1 then
			normalizedY = stepLength * (nextRowIndex - setpGap - 1)
		elseif nextRowIndex == rowCount then
			if isLoop then
				normalizedY = 1
			else
				normalizedY = 0
				nextRowIndex = 0
			end
		end
	elseif dir == XButton.Adjacent.RIGHT then
		nextRowIndex = nextRowIndex % rowCount + 1

		if selIndex < listCount - setpGap then
			selIndex = selIndex + 1
		end

		if nextRowIndex > listCount - setpGap and nextRowIndex <= rowCount - setpGap and selIndex >= listCount - setpGap then
			normalizedY = stepLength * (nextRowIndex - listCount + 1)
		elseif nextRowIndex == 1 then
			if isLoop then
				normalizedY = 0
			else
				normalizedY = 1
				nextRowIndex = rowCount
			end
		end
	end

	return normalizedY, nextRowIndex, selIndex, prevRowIndex
end

function SystemHelper.ConvertCustomRichText(originSt, size, width, heroId)
	local convertedText

	if LS_Setting.isJoystickConnected then
		convertedText = string.gsub(originSt, "{(%d%d)}", function(str)
			local value = tonumber(str)

			if value == 99 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.LOCKON) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 0 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.SKILL4) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 98 then
				return "<quad name=" .. LS_Setting.platform .. "_l3p size=" .. size .. " width=" .. width .. " />"
			elseif value == 97 then
				return "<quad name=" .. LS_Setting.platform .. "_r3p size=" .. size .. " width=" .. width .. " />"
			elseif value == 96 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.CHANGEHERO) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 94 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.ITEMS0) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 93 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.PLAYERINFO) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 92 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.SETTINGS) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 91 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.ITEMS1) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 95 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.SKILL5) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 90 then
				return "<quad name=skillView10005 size=" .. size .. " width=" .. width .. " />"
			elseif value == 79 then
				return "<quad name=skillView10021 size=" .. size .. " width=" .. width .. " />"
			elseif value == 80 then
				return "<quad name=" .. LS_Setting.platform .. "_y size=" .. size .. " width=" .. width .. " />"
			elseif value == 81 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.SKILL1) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 82 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.SKILL4) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 83 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.ACTION) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 78 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.ACTION) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 77 then
				return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey.ACTION) .. " size=" .. size .. " width=" .. width .. " />"
			elseif value == 69 then
				return "<quad name=skillView10027 size=" .. size .. " width=" .. width .. " />"
			elseif value == 68 then
				return "<quad name=skillView10026 size=" .. size .. " width=" .. width .. " />"
			elseif value == 67 then
				return "<quad name=skillView10025 size=" .. size .. " width=" .. width .. " />"
			elseif value == 66 then
				return "<quad name=skillView10024 size=" .. size .. " width=" .. width .. " />"
			elseif value == 70 then
				return "<quad name=skillView10028 size=" .. size .. " width=" .. width .. " />"
			elseif value == 71 then
				return "<quad name=skillView10029 size=" .. size .. " width=" .. width .. " />"
			elseif value == 72 then
				return "<quad name=skillView10030 size=" .. size .. " width=" .. width .. " />"
			else
				local skillIconId = math.floor(value / 10)

				if skillIconId then
					return "<quad name=" .. LS_Setting.GetBtnIconName(GPKey["SKILL" .. skillIconId]) .. " size=" .. size .. " width=" .. width .. " />"
				else
					return ""
				end
			end
		end)
	elseif Platform == PlatformType.MAC or Platform == PlatformType.PC then
		convertedText = string.gsub(originSt, "{(%d%d)}", function(str)
			local value = tonumber(str)

			if value == 99 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.LOCKON]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 0 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.SKILL4]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 96 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.CHANGEHERO]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 94 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.ITEMS0]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 93 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.PLAYERINFO]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 92 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.SETTINGS]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 91 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.ITEMS1]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 95 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.SKILL5]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 97 then
				return " <quad name=" .. LS_Setting.GetPCIconName("mouse") .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 90 then
				return " <quad name=skillView10005 size=" .. size .. " width=" .. width .. " /> "
			elseif value == 79 then
				return " <quad name=skillView10021 size=" .. size .. " width=" .. width .. " /> "
			elseif value == 51 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.MOVEW]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 52 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.MOVEA]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 53 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.MOVES]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 54 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.MOVED]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 81 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.SKILL1]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 82 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.SKILL4]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 83 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.ACTION]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 78 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.ACTION]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 77 then
				return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey.ACTION]) .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 80 then
				return " <quad name=" .. LS_Setting.GetPCIconName("f") .. " size=" .. size .. " width=" .. width .. " /> "
			elseif value == 69 then
				return " <quad name=skillView10027 size=" .. size .. " width=" .. width .. " /> "
			elseif value == 68 then
				return " <quad name=skillView10026 size=" .. size .. " width=" .. width .. " /> "
			elseif value == 67 then
				return " <quad name=skillView10025 size=" .. size .. " width=" .. width .. " /> "
			elseif value == 66 then
				return " <quad name=skillView10024 size=" .. size .. " width=" .. width .. " /> "
			elseif value == 70 then
				return " <quad name=skillView10028 size=" .. size .. " width=" .. width .. " /> "
			elseif value == 71 then
				return " <quad name=skillView10029 size=" .. size .. " width=" .. width .. " /> "
			elseif value == 72 then
				return " <quad name=skillView10030 size=" .. size .. " width=" .. width .. " /> "
			elseif value == 73 then
				return " <quad name=" .. LS_Setting.GetPCIconName("lalt") .. " size=" .. size .. " width=" .. width .. " /> "
			else
				local skillIconId = math.floor(value / 10)

				if skillIconId then
					return " <quad name=" .. LS_Setting.GetPCIconName(XKeyIconName[KMKey["SKILL" .. skillIconId]]) .. " size=" .. size .. " width=" .. width .. " /> "
				else
					return ""
				end
			end
		end)
	else
		convertedText = string.gsub(originSt, "{(%d%d)}", function(str)
			local value = tonumber(str)

			if value == 99 then
				return "<quad name=skill99999 size=" .. size .. " width=" .. width + 0.1 .. " />"
			elseif value == 0 then
				return "<quad name=skill00000 size=" .. size .. " width=" .. width + 0.1 .. " />"
			elseif value == 96 then
				return "<quad name=skillView10013 size=" .. size .. " width=" .. width .. " />"
			elseif value == 95 then
				return "<quad name=skill11005 size=" .. size .. " width=" .. width + 0.1 .. " />"
			elseif value == 93 then
				return "<quad name=skillView10018 size=" .. size .. " width=" .. width .. " />"
			elseif value == 92 then
				return "<quad name=skillView10019 size=" .. size .. " width=" .. width .. " />"
			elseif value == 91 then
				return "<quad name=skillView10020 size=" .. size .. " width=" .. width .. " />"
			elseif value == 90 then
				return "<quad name=skillView10017 size=" .. size .. " width=" .. width + 0.1 .. " />"
			elseif value == 79 then
				return "<quad name=skillView10021 size=" .. size .. " width=" .. width .. " />"
			elseif value == 78 then
				return "<quad name=skillView10022 size=" .. size .. " width=" .. width .. " />"
			elseif value == 77 then
				return "<quad name=skillView10023 size=" .. size .. " width=" .. width .. " />"
			elseif value == 69 then
				return "<quad name=skillView10034 size=" .. size .. " width=" .. width + 0.1 .. " />"
			elseif value == 68 then
				return "<quad name=skillView10033 size=" .. size .. " width=" .. width + 0.1 .. " />"
			elseif value == 67 then
				return "<quad name=skillView10032 size=" .. size .. " width=" .. width + 0.1 .. " />"
			elseif value == 66 then
				return "<quad name=skillView10031 size=" .. size .. " width=" .. width + 0.1 .. " />"
			elseif value == 70 then
				return "<quad name=skillView10035 size=" .. size .. " width=" .. width + 0.1 .. " />"
			elseif value == 71 then
				return "<quad name=skillView10029 size=" .. size .. " width=" .. width + 0.1 .. " />"
			elseif value == 72 then
				return "<quad name=skillView10030 size=" .. size .. " width=" .. width .. " />"
			elseif heroId then
				local skillIconId = MS_SkillIconData.GetSkillIcon(tonumber(heroId), math.floor(value / 10), tonumber(value % 10))

				if skillIconId then
					return "<quad name=skill" .. skillIconId .. " size=" .. size .. " width=" .. width + 0.1 .. " />"
				else
					return ""
				end
			else
				return ""
			end
		end)
	end

	return convertedText
end

function SystemHelper.ConvertReplaceRichText(originSt, pattern, match, replaceContent)
	local convertedText = ""

	convertedText = string.gsub(originSt, pattern, function(str)
		local value = tostring(str)

		if value == match then
			return replaceContent
		end
	end)

	return convertedText
end

function SystemHelper.ParseErrorCode(errCode)
	local content

	if errCode ~= nil and type(errCode) == "number" then
		local errCategory = errCode / 100
		local errMsgKey = string.format("ERR_MSG_CODE%d", errCode)
		local errMsgGen = string.format("ERR_MSG_GENERAL%d", errCategory)

		content = GameText[errMsgKey]

		if content == nil and errCategory >= 0 then
			content = GameText[errMsgGen]
		end

		if content == nil then
			content = GameText.ERR_MSG_GENERAL
		end
	else
		content = GameText.ERR_MSG_GENERAL
	end

	return content
end

function SystemHelper.print_r(t)
	local print_r_cache = {}

	local function sub_print_r(t, indent)
		if print_r_cache[tostring(t)] then
			print(indent .. "*" .. tostring(t))
		else
			print_r_cache[tostring(t)] = true

			if type(t) == "table" then
				for pos, val in pairs(t) do
					if type(val) == "table" then
						print(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
						sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
						print(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
					elseif type(val) == "string" then
						print(indent .. "[" .. pos .. "] => \"" .. val .. "\"")
					else
						print(indent .. "[" .. pos .. "] => " .. tostring(val))
					end
				end
			else
				print(indent .. tostring(t))
			end
		end
	end

	if type(t) == "table" then
		print(tostring(t) .. " {")
		sub_print_r(t, "  ")
		print("}")
	else
		sub_print_r(t, "  ")
	end

	print()
end

function SystemHelper.SetSkinnedMeshRenderLayerInChildren(transform, layerName)
	local tfs = transform:GetComponentsInChildren(typeof("UnityEngine.SkinnedMeshRenderer"))
	local len = tfs.Length

	if len > 0 then
		for i = 0, len - 1 do
			local _tf = tfs[i]

			if _tf ~= nil then
				_tf.gameObject.layer = LayerMask.NameToLayer(layerName)
			end
		end
	end
end

function SystemHelper.SetLayerInChildren(transform, layerName)
	if transform ~= nil and layerName ~= "" then
		local tfs = transform:GetComponentsInChildren(typeof("UnityEngine.Transform"), true)
		local layer = LayerMask.NameToLayer(layerName)
		local len = tfs.Length

		if len > 0 then
			for i = 0, len - 1 do
				local _tf = tfs[i]

				if _tf ~= nil then
					_tf.gameObject.layer = layer
				end
			end
		end
	end
end

function SystemHelper.ConvertHttpParam(paramList)
	local ret = ""

	for i = 1, #paramList do
		local tmpList = paramList[i]

		if tmpList ~= nil and #tmpList == 2 then
			if i > 1 then
				ret = ret .. "&"
			end

			ret = ret .. tmpList[1] .. "=" .. tmpList[2]
		end
	end

	return ret
end

function SystemHelper.ChangeLayer(tf, layerName)
	local layerIndex = LayerMask.NameToLayer(layerName)
	local count = tf.childCount - 1

	for i = 0, count do
		local _tf = tf:GetChild(i)

		_tf.gameObject.layer = layerIndex

		if _tf.childCount > 0 then
			SystemHelper.ChangeLayer(_tf, layerIndex)
		end
	end
end

function SystemHelper.DeepCopy(srcTable)
	local retTable

	if type(srcTable) == "table" then
		retTable = {}

		for srcKey, srcValue in pairs(srcTable) do
			retTable[SystemHelper.DeepCopy(srcKey)] = SystemHelper.DeepCopy(srcValue)
		end

		setmetatable(retTable, SystemHelper.DeepCopy(getmetatable(srcTable)))
	else
		retTable = srcTable
	end

	return retTable
end

function SystemHelper.GetRandomValueInTable(table, param)
	if table == nil then
		return nil
	end

	local keyList = {}

	for k, v in pairs(table) do
		table.insert(keyList, k)
	end

	local rndIndex = MathHelper.getRandom(1, #keyList, param)
	local key = keyList[rndIndex]

	keyList = nil

	return table[key]
end

function SystemHelper.LogEvent(tbl, text)
	table.insert(tbl, text)
end

function SystemHelper.GetOriUiPos(lx, ly, oHScrW, oHScrH, mt)
	local tX = lx
	local tY = ly

	if mt == 1 or mt == 4 or mt == 7 then
		tX = oHScrW + lx
	elseif mt == 3 or mt == 6 or mt == 9 then
		tX = lx - oHScrW
	end

	if mt == 1 or mt == 2 or mt == 3 then
		tY = oHScrH + ly
	elseif mt == 7 or mt == 8 or mt == 9 then
		tY = ly - oHScrH
	end

	return tX, tY
end

function SystemHelper.ReCompUiPos(lx, ly, hScrW, hScrH, mt)
	local tX = lx
	local tY = ly

	if mt == 1 or mt == 4 or mt == 7 then
		tX = lx - hScrW
	elseif mt == 3 or mt == 6 or mt == 9 then
		tX = hScrW + lx
	end

	if mt == 1 or mt == 2 or mt == 3 then
		tY = ly - hScrH
	elseif mt == 7 or mt == 8 or mt == 9 then
		tY = hScrH + ly
	end

	return tX, tY
end

function SystemHelper.AdaptX(x, y, name)
	local margin = 48
	local subs = string.split(name, "_")
	local align = subs[#subs]
	local screenRatio = SystemHelper.GetScreenWidth() / SystemHelper.GetScreenHeight()

	if Platform == PlatformType.IOS and align ~= nil and screenRatio >= 2.16 and screenRatio <= 2.18 then
		if align == "L" then
			x = x + margin
		elseif align == "R" then
			x = x - margin
		elseif align == "B" then
			y = y + margin
		elseif align == "LB" then
			x = x + margin
			y = y + margin
		elseif align == "RB" then
			x = x - margin
			y = y + margin
		end
	end

	return x, y
end

function SystemHelper.WriteOriX(x, y, name)
	local margin = 48
	local subs = string.split(name, "_")
	local align = subs[#subs]
	local screenRatio = SystemHelper.GetScreenWidth() / SystemHelper.GetScreenHeight()

	if Platform == PlatformType.IOS and align ~= nil and screenRatio >= 2.16 and screenRatio <= 2.18 then
		if align == "L" then
			x = x - margin
		elseif align == "R" then
			x = x + margin
		elseif align == "B" then
			y = y - margin
		elseif align == "LB" then
			x = x - margin
			y = y - margin
		elseif align == "RB" then
			x = x + margin
			y = y - margin
		end
	end

	return x, y
end
