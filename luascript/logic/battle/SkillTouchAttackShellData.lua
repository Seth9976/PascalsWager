-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/SkillTouchAttackShellData.lua

SkillTouchAttackShellData = class("SkillTouchAttackShellData")

function SkillTouchAttackShellData:initialize(hitShell, attVPlayer, skillData, itemData, attackDir)
	self.skillDir = Vector3.zero
	self.attackVPlayer = VirtualPlayer:new()
	self.bulletDirection = Vector3.zero

	self:Reset(shell, attVPlayer, skillData, itemData, attackDir)
end

function SkillTouchAttackShellData:Reset(hitShell, attVPlayer, skillData, itemData, attackDir)
	self.hostShell = hitShell

	self.attackVPlayer:Copy(attVPlayer)

	self.skillData = skillData
	self.itemData = itemData
	self.damageType = AnimalBase_Define.DamageType.None
	self.damageAdd = 0
	self.skillTypeForAI = AnimalBase_Define.SkillTypeForAI.None

	if self.skillData ~= nil then
		self.skillTypeForAI = AnimalBase.GetSkillTypeForAIById(self.attackVPlayer:GetHeroId(), self.skillData.SkillIndex, self.skillData.SkillCombo)
	end

	self.skillHitHand = false
	self.attackDistance = 0

	self.skillDir:SetVector3(attackDir)

	self.fromBullet = false

	self.bulletDirection:Set(0, 0, 0)

	self.checkFlg = false
	self.enable = true
end

function SkillTouchAttackShellData:GetSkillData()
	return self.skillData
end

function SkillTouchAttackShellData:GetItemData()
	return self.itemData
end

function SkillTouchAttackShellData:SetDamageType(type)
	self.damageType = type
end

function SkillTouchAttackShellData:GetDamageType()
	return self.damageType
end

function SkillTouchAttackShellData:SetDamageAdd(add)
	self.damageAdd = add
end

function SkillTouchAttackShellData:GetDamageAdd()
	return self.damageAdd
end

function SkillTouchAttackShellData:SetChecked()
	self.checkFlg = true
end

function SkillTouchAttackShellData:IsChecked()
	return self.checkFlg
end

function SkillTouchAttackShellData:SetSkillHitHand(flg)
	self.skillHitHand = flg
end

function SkillTouchAttackShellData:IsSkillHitHand()
	return self.skillHitHand
end

function SkillTouchAttackShellData:GetSkillDir()
	return self.skillDir
end

function SkillTouchAttackShellData:GetSkillTypeForAI()
	return self.skillTypeForAI
end

function SkillTouchAttackShellData:GetAttackVirtualPlayer()
	return self.attackVPlayer
end

function SkillTouchAttackShellData:GetHitShell()
	return self.hostShell
end

function SkillTouchAttackShellData:GetAttackDistance()
	return self.attackDistance
end

function SkillTouchAttackShellData:SetAttackDistance(dis)
	self.attackDistance = dis
end

function SkillTouchAttackShellData:SetFromBullet(flg)
	self.fromBullet = flg
end

function SkillTouchAttackShellData:IsFromBullet()
	return self.fromBullet
end

function SkillTouchAttackShellData:SetBulletDirection(dir)
	self.bulletDirection:SetVector3(dir)
end

function SkillTouchAttackShellData:GetBulletDirection()
	return self.bulletDirection
end

function SkillTouchAttackShellData:Disable()
	self.enable = false
	self.hostShell = nil
	self.skillData = nil
	self.itemData = nil
end

function SkillTouchAttackShellData:IsEnable()
	return self.enable
end

function SkillTouchAttackShellData:Clear()
	self.hostShell = nil

	if self.attackVPlayer ~= nil then
		self.attackVPlayer:Exit()
	end

	self.attackVPlayer = nil
	self.skillData = nil
	self.itemData = nil
	self.skillDir = nil
	self.attackDistance = 0
	self.bulletDirection = nil
	self.enable = false
end

return SkillTouchAttackShellData
