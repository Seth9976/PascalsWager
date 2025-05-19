-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_AnimalAnimator.lua

require("GameData/StructData/ExportData/ES_AnimalAnimator")
require("GameData/StructData/ExportData/ES_AnimalAnimatorSpeedTest")

MS_AnimalAnimator = class("MS_AnimalAnimator")
MS_AnimalAnimator.animatorList = {}
MS_AnimalAnimator.paramList = {}
MS_AnimalAnimator.stateNameList = {}
MS_AnimalAnimator.ParamLoop = nil
MS_AnimalAnimator.ParamSpeed = nil
MS_AnimalAnimator.ParamBlend = nil
MS_AnimalAnimator.ParamOffset = nil
MS_AnimalAnimator.ParamDataKeyTime = "time"
MS_AnimalAnimator.ParamDataKeyValue = "value"

function MS_AnimalAnimator.Init()
	XAnimator.Init()
	MS_AnimalAnimator.InitParam()
	MS_AnimalAnimator.InitStateName()

	AnimalBase_Define.ParamType = {}

	for k, param in pairs(AnimalBase_Define.ParamTypeTemple) do
		local paramHash = MS_AnimalAnimator.GetParamHash(param)

		AnimalBase_Define.ParamType[k] = paramHash
	end

	MS_AnimalAnimator.ParamLoop = MS_AnimalAnimator.GetParamHash("loop")
	MS_AnimalAnimator.ParamSpeed = MS_AnimalAnimator.GetParamHash("speed")
	MS_AnimalAnimator.ParamBlend = MS_AnimalAnimator.GetParamHash("blend")
	MS_AnimalAnimator.ParamOffset = MS_AnimalAnimator.GetParamHash("offset")

	for heroName, animatorData in pairs(ES_AnimalAnimator) do
		local heroId = BattleData.ConvertHeroNameToId(heroName)
		local animatorDataNew = {}

		for stateName, stateData in pairs(animatorData) do
			local stateHash = MS_AnimalAnimator.GetStateNameHash(stateName)

			if animatorDataNew[stateHash] == nil then
				local stateDataNew = {}

				for param, paramData in pairs(stateData) do
					local paramHash = MS_AnimalAnimator.GetParamHash(param)

					if stateDataNew[paramHash] == nil then
						stateDataNew[paramHash] = paramData
					else
						SystemHelper.LogError("=========stateDataNew====error !!!=stateName=" .. stateName .. "=param=" .. param)
					end
				end

				animatorDataNew[stateHash] = stateDataNew
			else
				SystemHelper.LogError("=========animatorDataNew====error !!!==stateName=" .. stateName)
			end
		end

		MS_AnimalAnimator.animatorList[heroId] = animatorDataNew
	end

	if DebugSkillAnimatorSpeed then
		for heroName, animatorData in pairs(ES_AnimalAnimatorSpeedTest) do
			local heroId = BattleData.ConvertHeroNameToId(heroName)

			if MS_AnimalAnimator.animatorList[heroId] ~= nil then
				for stateName, stateData in pairs(animatorData) do
					local stateHash = MS_AnimalAnimator.GetStateNameHash(stateName)

					if MS_AnimalAnimator.animatorList[heroId][stateHash] ~= nil then
						for param, paramData in pairs(stateData) do
							local paramHash = MS_AnimalAnimator.GetParamHash(param)

							if MS_AnimalAnimator.animatorList[heroId][stateHash][paramHash] ~= nil then
								MS_AnimalAnimator.animatorList[heroId][stateHash][paramHash] = paramData
							elseif param == "skillSpeed" then
								MS_AnimalAnimator.animatorList[heroId][stateHash][paramHash] = paramData
							end
						end
					end
				end
			end
		end
	end
end

function MS_AnimalAnimator.InitParam()
	MS_AnimalAnimator.paramList = {}
end

function MS_AnimalAnimator.GetParamHash(key)
	if MS_AnimalAnimator.paramList[key] == nil then
		local hash = XAnimator.StringToHash(key)

		MS_AnimalAnimator.paramList[key] = hash
	end

	return MS_AnimalAnimator.paramList[key]
end

function MS_AnimalAnimator.InitStateName()
	MS_AnimalAnimator.stateNameList = {}
end

function MS_AnimalAnimator.GetStateNameHash(key)
	if MS_AnimalAnimator.stateNameList[key] == nil then
		local hash = XAnimator.StringToHash(key)

		MS_AnimalAnimator.stateNameList[key] = hash
	end

	return MS_AnimalAnimator.stateNameList[key]
end

function MS_AnimalAnimator.IsAnimatorLoop(heroId, stateHash)
	local animatorData = MS_AnimalAnimator.animatorList[heroId]

	if animatorData == nil then
		return false
	end

	local stateData = animatorData[stateHash]

	if stateData ~= nil then
		if stateData[MS_AnimalAnimator.ParamLoop] > 0 then
			return true
		else
			return false
		end
	end

	return false
end

function MS_AnimalAnimator.GetAnimatorBlendTime(heroId, stateHash)
	local animatorData = MS_AnimalAnimator.animatorList[heroId]

	if animatorData == nil then
		return 0
	end

	local stateData = animatorData[stateHash]

	if stateData ~= nil and stateData[MS_AnimalAnimator.ParamBlend] ~= nil then
		return stateData[MS_AnimalAnimator.ParamBlend]
	end

	return 0
end

function MS_AnimalAnimator.GetAnimatorOffsetTime(heroId, stateHash)
	local animatorData = MS_AnimalAnimator.animatorList[heroId]

	if animatorData == nil then
		return 0
	end

	local stateData = animatorData[stateHash]

	if stateData ~= nil and stateData[MS_AnimalAnimator.ParamOffset] ~= nil then
		return stateData[MS_AnimalAnimator.ParamOffset]
	end

	return 0
end

function MS_AnimalAnimator.GetAnimatorData(heroId, stateHash, time, param)
	if time < 0 or time > 1 then
		SystemHelper.LogError("=========GetAnimatorData==error==time=" .. time)

		return 0
	end

	local animatorData = MS_AnimalAnimator.animatorList[heroId]

	if animatorData == nil then
		return 0
	end

	local stateData = animatorData[stateHash]

	if stateData == nil then
		return 0
	end

	local frameData = stateData[param]

	if frameData == nil or #frameData <= 0 then
		return 0
	end

	local ret = 0

	for i = 1, #frameData do
		local frameTime = frameData[i][MS_AnimalAnimator.ParamDataKeyTime]

		if frameTime <= time then
			ret = frameData[i][MS_AnimalAnimator.ParamDataKeyValue]
		else
			break
		end
	end

	return ret
end

function MS_AnimalAnimator.GetAnimatorTimeByValue(heroId, stateHash, param, value)
	local animatorData = MS_AnimalAnimator.animatorList[heroId]

	if animatorData ~= nil then
		local stateData = animatorData[stateHash]

		if stateData ~= nil then
			local frameData = stateData[param]

			if frameData ~= nil and #frameData > 0 then
				for i = 1, #frameData do
					local tmpValue = frameData[i][MS_AnimalAnimator.ParamDataKeyValue]

					if tmpValue == value then
						return frameData[i][MS_AnimalAnimator.ParamDataKeyTime]
					end
				end
			end
		end
	end

	if value == 0 then
		return 0
	else
		return -1
	end
end

function MS_AnimalAnimator.IsInTimeRange(heroId, stateHash, time, param1, value1, param2, value2)
	local time1 = MS_AnimalAnimator.GetAnimatorTimeByValue(heroId, stateHash, param1, value1)

	if time1 < 0 then
		return false
	end

	if param2 == nil or value2 == nil then
		if time1 <= time then
			return true
		end
	else
		local time2 = MS_AnimalAnimator.GetAnimatorTimeByValue(heroId, stateHash, param2, value2)

		if time2 < 0 then
			if time1 <= time then
				return true
			end
		elseif time1 <= time and time <= time2 then
			return true
		end
	end

	return false
end

function MS_AnimalAnimator.ConvertParamHashToString(hash)
	for k, v in pairs(AnimalBase_Define.ParamType) do
		if v == hash then
			return k
		end
	end

	return ""
end
