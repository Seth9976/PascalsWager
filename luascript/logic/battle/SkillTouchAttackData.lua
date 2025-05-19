-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/SkillTouchAttackData.lua

SkillTouchAttackData = class("SkillTouchAttackData")
SkillTouchAttackData.static.BlockStatus = {
	Break = 1,
	Fail = 2,
	Success = 0
}
SkillTouchAttackData.static.HitHandStatus = {
	NoDamage = 3,
	Break = 1,
	Fail = 2,
	Success = 0
}

function SkillTouchAttackData:initialize(hitPlayer, attVPlayer, skillData, itemData, attackDir, colliderIndexList)
	self.skillDir = Vector3.zero
	self.attackVPlayer = VirtualPlayer:new()
	self.bulletDirection = Vector3.zero

	self:Reset(hitPlayer, attVPlayer, skillData, itemData, attackDir, colliderIndexList)
end

function SkillTouchAttackData:Reset(hitPlayer, attVPlayer, skillData, itemData, attackDir, colliderIndexList)
	self.hostPlayer = hitPlayer

	self.attackVPlayer:Copy(attVPlayer)

	self.skillData = skillData
	self.itemData = itemData
	self.damageType = AnimalBase_Define.DamageType.None
	self.damageAdd = 0
	self.hitType = AnimalBase_Define.HitType.None
	self.itemHitType = AnimalBase_Define.HitType.None

	if self.itemData ~= nil then
		self.itemHitType = self.itemData.HitType
	end

	self.skillHitType = AnimalBase_Define.HitType.None
	self.skillTypeForAI = AnimalBase_Define.SkillTypeForAI.None

	if self.skillData ~= nil then
		self.skillHitType = AnimalBase.GetSkillHitType(self.attackVPlayer:GetHeroId(), self.skillData.SkillIndex, self.skillData.SkillCombo)
		self.skillTypeForAI = AnimalBase.GetSkillTypeForAIById(self.attackVPlayer:GetHeroId(), self.skillData.SkillIndex, self.skillData.SkillCombo)
	end

	self.skillBlocked = false
	self.skillBlockedData = nil
	self.skillBlockedParam = 0
	self.skillBlockStatus = SkillTouchAttackData.BlockStatus.Success
	self.skillHitHand = false
	self.skillHitHandData = nil
	self.skillHitHandStatus = SkillTouchAttackData.HitHandStatus.Success
	self.attackFromBehind = false
	self.attackDistance = 0

	self.skillDir:SetVector3(attackDir)

	self.colliderIndexList = colliderIndexList
	self.fromBullet = false

	self.bulletDirection:Set(0, 0, 0)

	self.bulletHitEffect = ""
	self.bulletHitCritEffect = ""
	self.bulletHitEffectRoot = 0
	self.bulletHitEffectBind = 0
	self.bulletHitAudio = ""
	self.bulletHitCritAudio = ""
	self.crit = false
	self.checkFlg = false
	self.enable = true
end

function SkillTouchAttackData:GetSkillData()
	return self.skillData
end

function SkillTouchAttackData:GetItemData()
	return self.itemData
end

function SkillTouchAttackData:SetDamageType(type)
	self.damageType = type
end

function SkillTouchAttackData:GetDamageType()
	return self.damageType
end

function SkillTouchAttackData:SetDamageAdd(add)
	self.damageAdd = add
end

function SkillTouchAttackData:GetDamageAdd()
	return self.damageAdd
end

function SkillTouchAttackData:SetHitType(type)
	self.hitType = type
end

function SkillTouchAttackData:GetHitType()
	if self.hitType ~= AnimalBase_Define.HitType.None then
		return self.hitType
	end

	if self.itemHitType ~= AnimalBase_Define.HitType.None then
		return self.itemHitType
	end

	return self.skillHitType
end

function SkillTouchAttackData:SetChecked()
	self.checkFlg = true
end

function SkillTouchAttackData:IsChecked()
	return self.checkFlg
end

function SkillTouchAttackData:SetSkillBlocked(flg, skillData, param)
	self.skillBlocked = flg
	self.skillBlockedData = skillData
	self.skillBlockedParam = param
end

function SkillTouchAttackData:IsSkillBlocked()
	if self.skillBlocked == true and self.skillBlockedData ~= nil then
		return true
	end

	return false
end

function SkillTouchAttackData:GetSkillBlockedData()
	return self.skillBlockedData, self.skillBlockedParam
end

function SkillTouchAttackData:SetSkillBlockStatus(status)
	self.skillBlockStatus = status
end

function SkillTouchAttackData:GetSkillBlockStatus()
	return self.skillBlockStatus
end

function SkillTouchAttackData:SetAttackFromBehind(flg)
	self.attackFromBehind = flg
end

function SkillTouchAttackData:IsAttackFromBehind()
	return self.attackFromBehind
end

function SkillTouchAttackData:SetSkillHitHand(flg, skillData)
	self.skillHitHand = flg
	self.skillHitHandData = skillData
end

function SkillTouchAttackData:IsSkillHitHand()
	if self.skillHitHand == true and self.skillHitHandData ~= nil then
		return true
	end

	return false
end

function SkillTouchAttackData:GetSkillHitHandData()
	return self.skillHitHandData
end

function SkillTouchAttackData:SetSkillHitHandStatus(status)
	self.skillHitHandStatus = status
end

function SkillTouchAttackData:GetSkillHitHandStatus()
	return self.skillHitHandStatus
end

function SkillTouchAttackData:GetSkillDir()
	return self.skillDir
end

function SkillTouchAttackData:GetSkillTypeForAI()
	return self.skillTypeForAI
end

function SkillTouchAttackData:GetAttackVirtualPlayer()
	return self.attackVPlayer
end

function SkillTouchAttackData:GetHitPlayer()
	return self.hostPlayer
end

function SkillTouchAttackData:GetAttackDistance()
	return self.attackDistance
end

function SkillTouchAttackData:SetAttackDistance(dis)
	self.attackDistance = dis
end

function SkillTouchAttackData:GetColliderIndexList()
	return self.colliderIndexList
end

function SkillTouchAttackData:SetCrit(flg)
	self.crit = flg
end

function SkillTouchAttackData:IsCrit()
	return self.crit
end

function SkillTouchAttackData:SetFromBullet(flg)
	self.fromBullet = flg
end

function SkillTouchAttackData:IsFromBullet()
	return self.fromBullet
end

function SkillTouchAttackData:SetBulletDirection(dir)
	self.bulletDirection:SetVector3(dir)
end

function SkillTouchAttackData:GetBulletDirection()
	return self.bulletDirection
end

function SkillTouchAttackData:AddBulletHitEffect(effName, effCritName, effRoot, effBind)
	self.bulletHitEffect = effName
	self.bulletHitCritEffect = effCritName
	self.bulletHitEffectRoot = tonumber(effRoot)
	self.bulletHitEffectBind = tonumber(effBind)
end

function SkillTouchAttackData:AddBulletHitAudio(hitAudio, hitCritAudio)
	self.bulletHitAudio = hitAudio
	self.bulletHitCritAudio = hitCritAudio
end

function SkillTouchAttackData:GetBulletHitEffectAndAudio(crit)
	local hitEffect = ""
	local hitAudio = ""

	if DebugHitCritSelf == true then
		crit = true
	end

	if crit == true and self.bulletHitCritEffect ~= "" then
		hitEffect = self.bulletHitCritEffect
	else
		hitEffect = self.bulletHitEffect
	end

	if crit == true and self.bulletHitCritAudio ~= "" then
		hitAudio = self.bulletHitCritAudio
	else
		hitAudio = self.bulletHitAudio
	end

	return hitEffect, self.bulletHitEffectRoot, self.bulletHitEffectBind, hitAudio
end

function SkillTouchAttackData:Disable()
	self.enable = false
	self.hostPlayer = nil
	self.skillData = nil
	self.itemData = nil
	self.skillBlockedData = nil
	self.skillHitHandData = nil
	self.colliderIndexList = nil
end

function SkillTouchAttackData:IsEnable()
	return self.enable
end

function SkillTouchAttackData:Clear()
	self.hostPlayer = nil

	if self.attackVPlayer ~= nil then
		self.attackVPlayer:Exit()
	end

	self.attackVPlayer = nil
	self.skillData = nil
	self.itemData = nil
	self.skillDir = nil
	self.skillBlockedData = nil
	self.skillHitHandData = nil
	self.attackDistance = 0
	self.colliderIndexList = nil
	self.bulletDirection = nil
	self.enable = false
end

return SkillTouchAttackData
