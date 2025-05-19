-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/SkillTouchHitComboData.lua

SkillTouchHitComboData = class("SkillTouchHitComboData")

function SkillTouchHitComboData:initialize(attVPlayer, skillData)
	self.attackVPlayer = VirtualPlayer:new()

	self:Reset(hitPlayer, attVPlayer, skillData)
end

function SkillTouchHitComboData:Reset(attVPlayer, skillData)
	self.attackVPlayer:Copy(attVPlayer)

	self.skillData = skillData
	self.combo = 1
	self.lastTime = TimeHelper.getNowTime()
	self.enable = true
end

function SkillTouchHitComboData:AddCombo(skillData)
	local nowTime = TimeHelper.getNowTime()
	local diffTime = nowTime - self.lastTime

	self.skillData = skillData

	if diffTime > AnimalBase_Define.SkillTouchHitComboTime then
		self.combo = 1
	else
		self.combo = self.combo + 1
	end
end

function SkillTouchHitComboData:GetCombo()
	return self.combo
end

function SkillTouchHitComboData:IsAttacker(attVPlayer)
	if attVPlayer ~= nil and attVPlayer:GetAnimalId() == self.attackVPlayer:GetAnimalId() then
		return true
	end

	return false
end

function SkillTouchHitComboData:Reset()
	self.combo = 1
end

function SkillTouchHitComboData:Clear()
	self.attackVPlayer = nil
	self.skillData = nil
end

return SkillTouchHitComboData
