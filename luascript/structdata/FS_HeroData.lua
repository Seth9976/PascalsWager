-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_HeroData.lua

require("LuaScript/StructData/FS_TalentData")

FS_HeroData = class("FS_HeroData")
FS_HeroData.static.QuickMenuMax = 7

function FS_HeroData:initialize(id, heroId)
	self.id = tonumber(id)
	self.heroNo = tonumber(heroId)
	self.level = 1
	self.exp = 0
	self.attributeAdd = {}

	for i = 1, MS_HeroData.AttributeMax do
		table.insert(self.attributeAdd, 0)
	end

	self.attribPoints = 0
	self.talentPoints = 0
	self.talentTree = {}
	self.mainShortcutId = 1
	self.shortcut = {}

	for i = 1, FS_HeroData.QuickMenuMax do
		table.insert(self.shortcut, 0)
	end

	self.hpAddNum = 0
	self.hpAddMax = 0
	self.mpAddNum = 0
	self.mpAddMax = 0
	self.property = {}

	for i = 1, MS_HeroData.PropertyMax do
		table.insert(self.property, 0)
	end

	self.attribute = {}

	for i = 1, MS_HeroData.AttributeMax do
		table.insert(self.attribute, 0)
	end

	self:Reset()
end

function FS_HeroData:Clear()
	self.attributeAdd = nil
	self.talentTree = nil
	self.shortcut = nil
	self.property = nil
	self.attribute = nil
end

function FS_HeroData:Reset()
	self.level = 1
	self.exp = 0
	self.attribPoints = 0
	self.talentPoints = 100

	for i = 1, MS_HeroData.AttributeMax do
		self.attributeAdd[i] = 0
	end

	for i = 1, FS_HeroData.QuickMenuMax do
		self.shortcut[i] = 0
	end

	self.attribute = FS_HeroData.GetAttributeAllByList(self.heroNo, self.attributeAdd)
	self.property = FS_HeroData.GetPropertyAllByList(self.heroNo, self.attribute, true)
	self.talentTree = {}

	self:InitTalentTree(nil)

	local heroData = MS_HeroData.GetHero(self.heroNo)

	if heroData ~= nil then
		self.hpAddNum = heroData.HpAddNum
		self.hpAddMax = heroData.HpAddNum
		self.mpAddNum = heroData.MpAddNum
		self.mpAddMax = heroData.MpAddNum
	end
end

function FS_HeroData:Encode(isExit)
	local ret = {}

	ret.heroNo = self.heroNo
	ret.level = self.level
	ret.exp = self.exp
	ret.att_add = self.attributeAdd
	ret.att_pt = self.attribPoints
	ret.talent_pt = self.talentPoints
	ret.talent_tree = {}

	if self.talentTree ~= nil then
		for k, v in pairs(self.talentTree) do
			if v ~= nil and v:GetTalentLevel() > 0 then
				ret.talent_tree[tonumber(k)] = v:GetTalentLevel()
			end
		end
	end

	ret.shortcut_id = self.mainShortcutId
	ret.shortcut = self.shortcut
	ret.hp_add = self.hpAddNum
	ret.mp_add = self.mpAddNum

	return ret
end

function FS_HeroData:Decode(data)
	self:Clear()

	self.heroNo = data.heroNo
	self.level = data.level
	self.exp = data.exp
	self.attributeAdd = data.att_add
	self.attribPoints = data.att_pt
	self.talentPoints = data.talent_pt
	self.talentTree = {}

	self:InitTalentTree(data.talent_tree)

	self.mainShortcutId = data.shortcut_id
	self.shortcut = data.shortcut
	self.hpAddNum = data.hp_add
	self.mpAddNum = data.mp_add
	self.attribute = FS_HeroData.GetAttributeAllByList(self.heroNo, self.attributeAdd)
	self.property = FS_HeroData.GetPropertyAllByList(self.heroNo, self.attribute, true)
end

function FS_HeroData:GetLevel()
	return self.level
end

function FS_HeroData:GetExp()
	return self.exp
end

function FS_HeroData:ResetAttribute()
	for i = 1, MS_HeroData.AttributeMax do
		self.attributeAdd[i] = 0
	end

	self.attribPoints = self.level - 1
	self.attribute = FS_HeroData.GetAttributeAllByList(self.heroNo, self.attributeAdd)
	self.property = FS_HeroData.GetPropertyAllByList(self.heroNo, self.attribute, true)
end

function FS_HeroData:HaveAttributePoints()
	return self.attribPoints > 0
end

function FS_HeroData:AddHpToMax()
	local numMax = self.hpAddMax
	local tmpTalentHpAdd = self:GetHeroTalentValue(MS_HeroTalent.Type.ItemHpMaxAdd, 0, 0)

	if tmpTalentHpAdd > 0 then
		numMax = numMax + tmpTalentHpAdd
	end

	self.hpAddNum = numMax
end

function FS_HeroData:IsHpNumMax()
	local numMax = self.hpAddMax
	local tmpTalentHpAdd = self:GetHeroTalentValue(MS_HeroTalent.Type.ItemHpMaxAdd, 0, 0)

	if tmpTalentHpAdd > 0 then
		numMax = numMax + tmpTalentHpAdd
	end

	if numMax <= self.hpAddNum then
		return true
	end

	return false
end

function FS_HeroData:GetHpNum()
	return self.hpAddNum
end

function FS_HeroData:GetMpNum()
	return self.mpAddNum
end

function FS_HeroData:AddHpNum(num)
	local tmpTalentHpAdd = self:GetHeroTalentValue(MS_HeroTalent.Type.ItemHpMaxAdd, 0, 0)
	local old = self.hpAddNum

	self.hpAddNum = self.hpAddNum + num
	self.hpAddNum = Mathf.Clamp(self.hpAddNum, 0, self.hpAddMax + tmpTalentHpAdd)

	return self.hpAddNum - old
end

function FS_HeroData:SubHpNum(num)
	local old = self.hpAddNum

	if num <= self.hpAddNum then
		self.hpAddNum = self.hpAddNum - num

		return old - self.hpAddNum
	else
		SystemHelper.Log("[ item not enough ]")

		return 0
	end
end

function FS_HeroData:IsMpNumMax()
	local numMax = self.mpAddNum
	local tmpTalentMpAdd = self:GetHeroTalentValue(MS_HeroTalent.Type.ItemMpMaxAdd, 0, 0)

	if tmpTalentMpAdd > 0 then
		numMax = numMax + tmpTalentMpAdd
	end

	if numMax <= self.mpAddNum then
		return true
	end

	return false
end

function FS_HeroData:AddMpNum(num)
	local tmpTalentMpAdd = self:GetHeroTalentValue(MS_HeroTalent.Type.ItemMpMaxAdd, 0, 0)
	local old = self.mpAddNum

	self.mpAddNum = self.mpAddNum + num
	self.mpAddNum = Mathf.Clamp(self.mpAddNum, 0, self.mpAddMax + tmpTalentMpAdd)

	return self.mpAddNum - old
end

function FS_HeroData:SubMpNum(num)
	local old = self.mpAddNum

	if num <= self.mpAddNum then
		self.mpAddNum = self.mpAddNum - num

		return old - self.mpAddNum
	else
		SystemHelper.Log("[ item not enough ]")

		return 0
	end
end

function FS_HeroData:InitTalentTree(data)
	local talentDataList = MS_HeroTalent.GetHeroTalent(self.heroNo)

	if talentDataList ~= nil then
		for k, v in pairs(talentDataList) do
			local tmpId = tonumber(v.TalentId)
			local tmpParent = tonumber(v.TalentParent)

			if tmpParent == 0 then
				local tmpLevel = 0

				if data ~= nil and data[tostring(tmpId)] ~= nil then
					tmpLevel = tonumber(data[tostring(tmpId)])
				end

				local ntmpid = tonumber(tmpId)
				local v_talentData = FS_TalentData:new(ntmpid, tmpLevel)

				self.talentTree[ntmpid] = v_talentData
			end
		end
	end

	for k, v in pairs(self.talentTree) do
		local preId = v:GetPreTalentId()

		if preId ~= 0 and self.talentTree[preId] ~= nil then
			v:SetPreTalent(self.talentTree[preId])
		end
	end
end

function FS_HeroData:ParseAttribute(p_val)
	if p_val ~= nil then
		if p_val.heroNo ~= nil then
			self.attribPoints = FS_Parser.toInt(p_val.attribPoints, self.attribPoints)
			self.attributeAdd[MS_HeroData.Attribute.Strength] = FS_Parser.toInt(p_val.attrib1, self.attributeAdd[MS_HeroData.Attribute.Strength])
			self.attributeAdd[MS_HeroData.Attribute.Spirit] = FS_Parser.toInt(p_val.attrib2, self.attributeAdd[MS_HeroData.Attribute.Spirit])
			self.attributeAdd[MS_HeroData.Attribute.Brave] = FS_Parser.toInt(p_val.attrib3, self.attributeAdd[MS_HeroData.Attribute.Brave])
			self.attributeAdd[MS_HeroData.Attribute.Dexterous] = FS_Parser.toInt(p_val.attrib4, self.attributeAdd[MS_HeroData.Attribute.Dexterous])
			self.attributeAdd[MS_HeroData.Attribute.Tolerant] = FS_Parser.toInt(p_val.attrib5, self.attributeAdd[MS_HeroData.Attribute.Tolerant])
			self.attributeAdd[MS_HeroData.Attribute.Generous] = FS_Parser.toInt(p_val.attrib6, self.attributeAdd[MS_HeroData.Attribute.Generous])
			self.attributeAdd[MS_HeroData.Attribute.Hidden] = FS_Parser.toInt(p_val.attrib7, self.attributeAdd[MS_HeroData.Attribute.Hidden])
		end

		self.attribute = FS_HeroData.GetAttributeAllByList(self.heroNo, self.attributeAdd)
		self.property = FS_HeroData.GetPropertyAllByList(self.heroNo, self.attribute, true)
	end
end

function FS_HeroData:ParseTalent(p_val)
	self.talentTree[p_val.talentId]:TalentLevelUp(p_val.level)
end

function FS_HeroData:AddTalentToMax()
	for k, v in pairs(self.talentTree) do
		v:AddToMax()
	end
end

function FS_HeroData:AddTalentToMaxWithOutSan()
	for k, v in pairs(self.talentTree) do
		local talentData = v:GetTalentData()
		local partIndex = math.floor(talentData.TalentPos / 100)

		if partIndex ~= 4 then
			v:AddToMax()
		end
	end
end

function FS_HeroData:AddLevelTo(level)
	self.level = level
end

function FS_HeroData:AddAttributeTo(valueList)
	local heroData = MS_HeroData.GetHero(self.heroNo)

	self.attributeAdd[MS_HeroData.Attribute.Strength] = valueList[1] - heroData.Attribute_1
	self.attributeAdd[MS_HeroData.Attribute.Spirit] = valueList[2] - heroData.Attribute_2
	self.attributeAdd[MS_HeroData.Attribute.Brave] = valueList[3] - heroData.Attribute_3
	self.attributeAdd[MS_HeroData.Attribute.Dexterous] = valueList[4] - heroData.Attribute_4
	self.attributeAdd[MS_HeroData.Attribute.Tolerant] = valueList[5] - heroData.Attribute_5
	self.attributeAdd[MS_HeroData.Attribute.Generous] = valueList[6] - heroData.Attribute_6
	self.attributeAdd[MS_HeroData.Attribute.Hidden] = valueList[7] - heroData.Attribute_7
	self.attribute = FS_HeroData.GetAttributeAllByList(self.heroNo, self.attributeAdd)
	self.property = FS_HeroData.GetPropertyAllByList(self.heroNo, self.attribute, true)
end

function FS_HeroData:IsAllTalentMax()
	if self.talentTree == nil or table.nums(self.talentTree) == 0 then
		return false
	end

	for k, v in pairs(self.talentTree) do
		if not v:IsTalentMax() then
			return false
		end
	end

	return true
end

function FS_HeroData:IsAllTalentMaxWithOutSan()
	if self.talentTree == nil or table.nums(self.talentTree) == 0 then
		return false
	end

	for k, v in pairs(self.talentTree) do
		local talentData = v:GetTalentData()
		local partIndex = math.floor(talentData.TalentPos / 100)

		if partIndex ~= 4 and not v:IsTalentMax() then
			return false
		end
	end

	return true
end

function FS_HeroData:IsTalentStoneEnough(stoneLevel)
	if self.talentTree == nil or table.nums(self.talentTree) == 0 then
		return false
	end

	for k, v in pairs(self.talentTree) do
		if not v:IsStoneEnough(stoneLevel) then
			return false
		end
	end

	return true
end

function FS_HeroData:GetHeroTalentTree()
	return self.talentTree
end

function FS_HeroData:GetHeroTalentLevel(talentId)
	talentId = tonumber(talentId)

	if self.talentTree[talentId] ~= nil then
		return self.talentTree[talentId].talentLevel
	end

	return 0
end

function FS_HeroData:GetHeroTalentValue(type, param1, param2)
	local talentDataList = MS_HeroTalent.GetHeroTalent(self.heroNo)
	local ret = 0

	if talentDataList ~= nil then
		for k, v in pairs(talentDataList) do
			local tmpId = tonumber(v.TalentId)
			local tmpType = tonumber(v.Type)

			if tmpType ~= MS_HeroTalent.Type.TalentGroup then
				local tmpParentId = tonumber(v.TalentParent)
				local tmpLevel = self:GetHeroTalentLevel(tmpId)

				if tmpParentId > 0 then
					tmpLevel = self:GetHeroTalentLevel(tmpParentId)
				end

				if DebugTalentOpenAll == true then
					tmpLevel = Mathf.Max(1, tmpLevel)
				end

				if tmpLevel > 0 and tmpType == type then
					local permit = v.Condition:IsConditionPermit(tonumber(param1), tonumber(param2))

					if permit == true then
						ret = ret + tonumber(v.Value) + tonumber(v.ValueAdd) * (tmpLevel - 1)
					end
				end
			end
		end
	end

	return ret
end

function FS_HeroData:GetHeroTalentValueByLevel(type, param1, param2, level)
	local talentDataList = MS_HeroTalent.GetHeroTalent(self.heroNo)
	local ret = 0

	if talentDataList ~= nil then
		for k, v in pairs(talentDataList) do
			local tmpId = tonumber(v.TalentId)
			local tmpType = tonumber(v.Type)

			if tmpType ~= MS_HeroTalent.Type.TalentGroup then
				local tmpParentId = tonumber(v.TalentParent)
				local tmpLevel = self:GetHeroTalentLevel(tmpId)

				if tmpParentId > 0 then
					tmpLevel = self:GetHeroTalentLevel(tmpParentId)
				end

				if DebugTalentOpenAll == true then
					tmpLevel = Mathf.Max(1, tmpLevel)
				end

				if tmpLevel > 0 and tmpType == type then
					local permit = v.Condition:IsConditionPermit(tonumber(param1), tonumber(param2))

					if permit == true then
						ret = ret + tonumber(v.Value) + tonumber(v.ValueAdd) * (level - 1)
					end
				end
			end
		end
	end

	return ret
end

function FS_HeroData:ParseLevelExp(p_val)
	if p_val ~= nil and p_val.heroNo ~= nil then
		self.level = FS_Parser.toInt(p_val.lev, self.level)
		self.exp = FS_Parser.toInt(p_val.exp, self.exp)
		self.attribPoints = FS_Parser.toInt(p_val.attribPoints, self.attribPoints)
	end
end

function FS_HeroData:GetPropertyList()
	return self.property
end

function FS_HeroData:GetProperty(propertyId)
	propertyId = tonumber(propertyId)

	if self.property[propertyId] ~= nil then
		return self.property[propertyId]
	end

	return 0
end

function FS_HeroData:GetAttributeList()
	return self.attribute
end

function FS_HeroData:GetAttribute(attributeId)
	local heroData = MS_HeroData.GetHero(self.heroNo)
	local attribute = tonumber(heroData["Attribute_" .. attributeId])

	if self.attribute[attributeId] ~= nil then
		return self.attribute[attributeId]
	end

	return 0
end

function FS_HeroData:GetShortcut(i)
	return self.shortcut[tonumber(i)]
end

function FS_HeroData:GetMainShortcutIndex()
	return self.mainShortcutId
end

function FS_HeroData:IsShowcutEmpty()
	local ret = true

	for j = 1, #self.shortcut do
		if self.shortcut[j] > 0 then
			ret = false

			break
		end
	end

	return ret
end

function FS_HeroData:SetShortcut(i, itemId)
	for j = 1, #self.shortcut do
		if self.shortcut[j] == itemId then
			self.shortcut[j] = 0
		end
	end

	self.shortcut[tonumber(i)] = itemId
end

function FS_HeroData:SetMainShortcutIndex(index)
	self.mainShortcutId = index
end

function FS_HeroData:SyncLevelExp(heroData)
	self.level = heroData:GetLevel()
	self.exp = heroData:GetExp()
	self.attributeAdd = {}

	for i = 1, MS_HeroData.AttributeMax do
		table.insert(self.attributeAdd, 0)
	end

	self.attribPoints = self.level - 1
end

function FS_HeroData.GetPropertyAll(heroId, level, isHost)
	local attributeList = {}
	local heroData = MS_HeroData.GetHero(heroId)

	for attrId = 1, MS_HeroData.AttributeMax do
		if attrId ~= MS_HeroData.Attribute.Hidden then
			attributeList[attrId] = tonumber(heroData["Attribute_" .. attrId]) + (level - 1)
		else
			attributeList[attrId] = tonumber(heroData["Attribute_" .. attrId])
		end

		if attributeList[attrId] > MS_HeroData.AttributeValueMax then
			attributeList[attrId] = MS_HeroData.AttributeValueMax
		end
	end

	return FS_HeroData.GetPropertyAllByList(heroId, attributeList, isHost)
end

function FS_HeroData.GetPropertyAllByList(heroId, attributeList, isHost)
	if attributeList == nil or #attributeList ~= MS_HeroData.AttributeMax then
		return nil
	end

	local retProperty = {}

	for i = 1, MS_HeroData.PropertyMax do
		retProperty[i] = 0

		for attrId = 1, MS_HeroData.AttributeMax do
			local rate = MS_HeroPropertyData.GetValue(heroId, i, attrId)

			if rate > 0 then
				local point = tonumber(attributeList[attrId])
				local tmpValue = 0

				if isHost == true then
					tmpValue = rate * MS_HeroAttributeData.GetValue(attrId, point, i)
				else
					tmpValue = rate * MS_EnemyAttributeData.GetValue(attrId, point, i)
				end

				retProperty[i] = retProperty[i] + tmpValue
			end
		end

		if retProperty[i] > 0 then
			retProperty[i] = Mathf.Floor(retProperty[i] / 1000)
		end
	end

	return retProperty
end

function FS_HeroData.GetAttributeAll(heroId)
	local retAttribute = {}
	local heroData = MS_HeroData.GetHero(heroId)

	for attrId = 1, MS_HeroData.AttributeMax do
		retAttribute[attrId] = tonumber(heroData["Attribute_" .. attrId])
	end

	return retAttribute
end

function FS_HeroData.GetAttributeAllByList(heroId, attributeAddList)
	local attributeList = FS_HeroData.GetAttributeAll(heroId)

	for attrId = 1, MS_HeroData.AttributeMax do
		attributeList[attrId] = attributeList[attrId] + attributeAddList[attrId]
	end

	return attributeList
end

return FS_HeroData
