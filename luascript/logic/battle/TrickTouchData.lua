-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/TrickTouchData.lua

TrickTouchData = class("TrickTouchData")
TrickTouchData.static.HitHandStatus = {
	NoDamage = 3,
	Break = 1,
	Fail = 2,
	Success = 0
}

function TrickTouchData:initialize(hitPlayer, trick, trickDir, colliderIndexList)
	self.trickDir = Vector3.zero

	self:Reset(hitPlayer, trick, trickDir, colliderIndexList)
end

function TrickTouchData:Reset(hitPlayer, trick, trickDir, colliderIndexList)
	self.hostPlayer = hitPlayer
	self.trick = trick
	self.trickData = self.trick:GetTrickData()
	self.damageType = self.trick:GetDamageType()
	self.hitType = self.trick:GetHitType()
	self.attackFromBehind = false

	self.trickDir:SetVector3(trickDir)

	self.colliderIndexList = colliderIndexList
	self.skillHitHand = false
	self.skillHitHandData = nil
	self.skillHitHandStatus = TrickTouchData.HitHandStatus.Success
	self.checkFlg = false
	self.enable = true
end

function TrickTouchData:GetTrick()
	return self.trick
end

function TrickTouchData:GetTrickData()
	return self.trickData
end

function TrickTouchData:SetDamageType(type)
	self.damageType = type
end

function TrickTouchData:GetDamageType()
	return self.damageType
end

function TrickTouchData:SetHitType(type)
	self.hitType = type
end

function TrickTouchData:GetHitType()
	return self.hitType
end

function TrickTouchData:SetChecked()
	self.checkFlg = true
end

function TrickTouchData:IsChecked()
	return self.checkFlg
end

function TrickTouchData:SetAttackFromBehind(flg)
	self.attackFromBehind = flg
end

function TrickTouchData:IsAttackFromBehind()
	return self.attackFromBehind
end

function TrickTouchData:GetTrickDir()
	return self.trickDir
end

function TrickTouchData:GetHitPlayer()
	return self.hostPlayer
end

function TrickTouchData:SetSkillHitHand(flg, skillData)
	self.skillHitHand = flg
	self.skillHitHandData = skillData
end

function TrickTouchData:IsSkillHitHand()
	if self.skillHitHand == true and self.skillHitHandData ~= nil then
		return true
	end

	return false
end

function TrickTouchData:GetSkillHitHandData()
	return self.skillHitHandData
end

function TrickTouchData:SetSkillHitHandStatus(status)
	self.skillHitHandStatus = status
end

function TrickTouchData:GetSkillHitHandStatus()
	return self.skillHitHandStatus
end

function TrickTouchData:GetColliderIndexList()
	return self.colliderIndexList
end

function TrickTouchData:Disable()
	self.enable = false
	self.hostPlayer = nil
	self.trick = nil
	self.trickData = nil
	self.skillHitHandData = nil
	self.colliderIndexList = nil
end

function TrickTouchData:IsEnable()
	return self.enable
end

function TrickTouchData:Clear()
	self.hostPlayer = nil
	self.trick = nil
	self.trickData = nil
	self.trickDir = nil
	self.skillHitHandData = nil
	self.colliderIndexList = nil
	self.enable = false
end
