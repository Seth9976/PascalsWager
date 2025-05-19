-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/LS_BehaviorLog.lua

LS_BehaviorLog = class("LS_BehaviorLog")
LS_BehaviorLog.keyName = "templog"
LS_BehaviorLog.keyUserId = ""
LS_BehaviorLog.keyFull = ""
LS_BehaviorLog.errno = 0
LS_BehaviorLog.tempLogList = {}
LS_BehaviorLog.tempLogSkill = {}
LS_BehaviorLog.static.Type = {
	CompleteQuest = 2,
	GameMode = 1,
	Save = 6,
	GetItem = 4,
	Death = 7,
	UseItem = 5,
	ChangePlayer = 8,
	KillMonster = 3
}

function LS_BehaviorLog.GetKey()
	return LS_BehaviorLog.keyFull
end

function LS_BehaviorLog.CreateKey()
	LS_BehaviorLog.keyFull = LS_BehaviorLog.keyName .. "_" .. os.time()
	LS_BehaviorLog.tempLogList = {}
	LS_BehaviorLog.tempLogSkill = {}
end

function LS_BehaviorLog.Save()
	local retStr = LS_BehaviorLog.GetLogString()

	SystemHelper.LogTest("=========GetLogString retStr")
	Recorder.write(LS_BehaviorLog.GetKey(), retStr)
end

function LS_BehaviorLog.GetLogString()
	local skillStr = ""

	if LS_BehaviorLog.tempLogSkill ~= nil then
		local tmpList = {}

		for heroId, skillData in pairs(LS_BehaviorLog.tempLogSkill) do
			if skillData ~= nil then
				for tmpKey, tmpCount in pairs(skillData) do
					local tmpStrList = StringHelper.Split(tmpKey, "_")
					local skillIndex = tmpStrList[1]
					local skillCombo = tmpStrList[2]
					local tmpStr = heroId .. "," .. skillIndex .. "," .. skillCombo .. "," .. tmpCount

					table.insert(tmpList, tmpStr)
				end
			end
		end

		SystemHelper.LogTest("=========GetLogString #tmpList=" .. #tmpList)

		skillStr = table.concat(tmpList, "\n")
	end

	local logStr = ""

	if LS_BehaviorLog.tempLogList ~= nil then
		for type, logData in pairs(LS_BehaviorLog.tempLogList) do
			if logData ~= nil then
				SystemHelper.LogTest("=========GetLogString type=" .. type .. ",#logData=" .. #logData)

				logStr = logStr .. "\n" .. table.concat(logData, "\n")
			end
		end
	end

	return skillStr .. logStr
end

function LS_BehaviorLog.Log(type, param1, param2)
	if LS_BehaviorLog.tempLogList[type] == nil then
		LS_BehaviorLog.tempLogList[type] = {}
	end

	local nowTime = os.time()
	local str = nowTime .. "," .. type .. "," .. param1 .. "," .. param2

	table.insert(LS_BehaviorLog.tempLogList[type], str)
end

function LS_BehaviorLog.LogSkill(heroId, skillIndex, skillCombo)
	if LS_BehaviorLog.tempLogSkill[heroId] == nil then
		LS_BehaviorLog.tempLogSkill[heroId] = {}
	end

	local key = skillIndex .. "_" .. skillCombo

	if LS_BehaviorLog.tempLogSkill[heroId][key] == nil then
		LS_BehaviorLog.tempLogSkill[heroId][key] = 1
	else
		LS_BehaviorLog.tempLogSkill[heroId][key] = LS_BehaviorLog.tempLogSkill[heroId][key] + 1
	end
end

return LS_BehaviorLog
