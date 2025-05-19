-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/HitData.lua

HitData = class("HitData")

function HitData:initialize()
	self.attackVPlayer = VirtualPlayer:new()
	self.skillData = nil
	self.itemData = nil
	self.hitType = AnimalBase_Define.HitType.None
	self.enable = false
end

function HitData:Set(touchAttackData)
	self.attackVPlayer:Copy(touchAttackData:GetAttackVirtualPlayer())

	self.skillData = touchAttackData:GetSkillData()
	self.itemData = touchAttackData:GetItemData()
	self.hitType = touchAttackData:GetHitType()
	self.enable = true
end

function HitData:GetAttackVirtualPlayer()
	return self.attackVPlayer
end

function HitData:GetSkillData()
	return self.skillData
end

function HitData:GetItemData()
	return self.itemData
end

function HitData:GetHitType()
	return self.hitType
end

function HitData:Disable()
	self.enable = false
end

function HitData:IsEnable()
	return self.enable
end

function HitData:Clear()
	if self.attackVPlayer ~= nil then
		self.attackVPlayer:Exit()
	end

	self.attackVPlayer = nil
	self.skillData = nil
	self.itemData = nil
	self.enable = false
end

return HitData
