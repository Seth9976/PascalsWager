-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_SkillData.lua

require("GameData/StructData/ExportData/ES_SkillData")

MS_SkillData = class("MS_SkillData")
MS_SkillData.static.ButtonComboMax = 5
MS_SkillData.static.ParamMax = 3
MS_SkillData.static.SpecialStart = 1000
MS_SkillData.static.DefenceType = {
	DarkResist = 5,
	ArcaneResist = 4,
	PhysicResist = 1,
	Other = 0,
	FireResist = 2,
	PoisonResist = 3,
	PierceResist = 6
}
MS_SkillData.static.AttackType = {
	PoisonDamage = 3,
	PierceDamage = 6,
	ArcaneDamage = 4,
	Other = 0,
	DarkDamage = 5,
	FireDamage = 2,
	PhysicDamage = 1
}
MS_SkillData.static.PressType = {
	PressDown = 0,
	LongPress = 2,
	PressUp = 1
}
MS_SkillData.skillList = {}
MS_SkillData.skillSpecialList = {}

function MS_SkillData.Init()
	for k, data in pairs(ES_SkillData) do
		local heroId = tonumber(data.HeroId)
		local skillIndex = tonumber(data.SkillIndex)
		local skillCombo = tonumber(data.SkillCombo)
		local skillGrade = data.SkillGrade
		local skillCondition = data.SkillCondition

		data.SkillGrade = nil

		if skillGrade ~= "" then
			local skillGradeList = StringHelper.Split(skillGrade, ";")

			for i = 1, #skillGradeList do
				local grade = tonumber(skillGradeList[i])

				if grade > 0 then
					if data.SkillGrade == nil then
						data.SkillGrade = {}
					end

					table.insert(data.SkillGrade, grade)
				end
			end
		end

		data.SkillCondition = nil

		if skillCondition ~= "" then
			local skillConditionList = StringHelper.Split(skillCondition, ";")

			for i = 1, #skillConditionList do
				local condition = tonumber(skillConditionList[i])

				if condition > 0 then
					if data.SkillCondition == nil then
						data.SkillCondition = {}
					end

					table.insert(data.SkillCondition, condition)
				end
			end
		end

		if skillIndex < MS_SkillData.SpecialStart then
			if MS_SkillData.skillList[heroId] == nil then
				MS_SkillData.skillList[heroId] = {}
			end

			if MS_SkillData.skillList[heroId][skillIndex] == nil then
				MS_SkillData.skillList[heroId][skillIndex] = {}
			end

			MS_SkillData.skillList[heroId][skillIndex][skillCombo] = data
			MS_SkillData.skillList[heroId][skillIndex][skillCombo].SkillIndexReal = skillIndex
		else
			if MS_SkillData.skillSpecialList[heroId] == nil then
				MS_SkillData.skillSpecialList[heroId] = {}
			end

			if MS_SkillData.skillSpecialList[heroId][skillIndex] == nil then
				MS_SkillData.skillSpecialList[heroId][skillIndex] = {}
			end

			MS_SkillData.skillSpecialList[heroId][skillIndex][skillCombo] = {}

			for k, v in pairs(data) do
				MS_SkillData.skillSpecialList[heroId][skillIndex][skillCombo][k] = v
			end

			local newIndex = MS_SkillData.skillSpecialList[heroId][skillIndex][skillCombo].SkillIndex

			newIndex = newIndex - Mathf.Floor(newIndex / MS_SkillData.SpecialStart) * MS_SkillData.SpecialStart
			MS_SkillData.skillSpecialList[heroId][skillIndex][skillCombo].SkillIndexReal = skillIndex
			MS_SkillData.skillSpecialList[heroId][skillIndex][skillCombo].SkillIndex = newIndex
		end
	end
end

function MS_SkillData.GetSkillList(heroId)
	if MS_SkillData.skillList[heroId] ~= nil then
		return MS_SkillData.skillList[heroId]
	end

	SystemHelper.LogError("======GetSkillList====error!!!!!!!heroId=" .. heroId)
	SystemHelper.LogError("======GetSkillList====error!!!!!!!heroId=" .. heroId .. ", t=" .. t)

	return nil
end

function MS_SkillData.GetSkillSpecialList(heroId)
	if MS_SkillData.skillSpecialList[heroId] ~= nil then
		return MS_SkillData.skillSpecialList[heroId]
	end

	SystemHelper.LogError("======GetSkillSpecialList====error!!!!!!!heroId=" .. heroId)
	SystemHelper.LogError("======GetSkillSpecialList====error!!!!!!!heroId=" .. heroId .. ", t=" .. t)

	return nil
end

function MS_SkillData.GetSkillData(heroId, skillIndex, skillCombo)
	if MS_SkillData.skillList[heroId] ~= nil and MS_SkillData.skillList[heroId][skillIndex] ~= nil and MS_SkillData.skillList[heroId][skillIndex][skillCombo] ~= nil then
		return MS_SkillData.skillList[heroId][skillIndex][skillCombo]
	end

	SystemHelper.LogError("======GetSkillData====error!!!!!!!heroId=" .. heroId .. ",skillIndex=" .. skillIndex .. ",skillCombo=" .. skillCombo)
	SystemHelper.LogError("======GetSkillData====error!!!!!!!heroId=" .. heroId .. ",skillIndex=" .. skillIndex .. ",skillCombo=" .. skillCombo .. ", t=" .. t)

	return nil
end

function MS_SkillData.GetSkillSpecialData(heroId, skillIndex, skillCombo)
	if MS_SkillData.skillSpecialList[heroId] ~= nil and MS_SkillData.skillSpecialList[heroId][skillIndex] ~= nil and MS_SkillData.skillSpecialList[heroId][skillIndex][skillCombo] ~= nil then
		return MS_SkillData.skillSpecialList[heroId][skillIndex][skillCombo]
	end

	return nil
end
