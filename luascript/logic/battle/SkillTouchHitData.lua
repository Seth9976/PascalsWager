-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/SkillTouchHitData.lua

SkillTouchHitData = class("SkillTouchHitData")

function SkillTouchHitData:initialize(attackPlayer, hitVPlayer, skillData, itemData, attackDir, colliderIndexList)
	self.skillDir = Vector3.zero
	self.hitVPlayer = VirtualPlayer:new()
	self.sceneController = ST_Main.GetSceneController()

	self:Reset(attackPlayer, hitVPlayer, skillData, itemData, attackDir, colliderIndexList)
end

function SkillTouchHitData:Reset(attackPlayer, hitVPlayer, skillData, itemData, attackDir, colliderIndexList)
	self.hostPlayer = attackPlayer

	self.hitVPlayer:Copy(hitVPlayer)

	self.skillData = skillData
	self.itemData = itemData

	self.skillDir:SetVector3(attackDir)

	self.hitBlock = false
	self.hitCounterAttack = false
	self.hitHand = false
	self.attackDistance = 0
	self.colliderIndexList = colliderIndexList
	self.checkFlg = false
	self.enable = true
end

function SkillTouchHitData:SetHitBlock(flg)
	self.hitBlock = flg
end

function SkillTouchHitData:SetHitCounterAttack(flg)
	self.hitCounterAttack = flg
end

function SkillTouchHitData:SetHitHand(flg)
	self.hitHand = flg
end

function SkillTouchHitData:GetSkillData()
	return self.skillData
end

function SkillTouchHitData:GetItemData()
	return self.itemData
end

function SkillTouchHitData:IsHitBlock()
	return self.hitBlock
end

function SkillTouchHitData:IsHitCounterAttack()
	return self.hitCounterAttack
end

function SkillTouchHitData:IsHitHand()
	return self.hitHand
end

function SkillTouchHitData:GetHitVirtualPlayer()
	return self.hitVPlayer
end

function SkillTouchHitData:GetHitPlayer()
	if self.hitVPlayer ~= nil then
		return self.sceneController:FindPlayerById(self.hitVPlayer:GetAnimalId())
	end

	return nil
end

function SkillTouchHitData:GetSkillDir()
	return self.skillDir
end

function SkillTouchHitData:GetAttackDistance()
	return self.attackDistance
end

function SkillTouchHitData:SetAttackDistance(dis)
	self.attackDistance = dis
end

function SkillTouchHitData:GetColliderIndexList()
	return self.colliderIndexList
end

function SkillTouchHitData:SetChecked()
	self.checkFlg = true
end

function SkillTouchHitData:IsChecked()
	return self.checkFlg
end

function SkillTouchHitData:Disable()
	self.enable = false
	self.hostPlayer = nil
	self.skillData = nil
	self.itemData = nil
	self.colliderIndexList = nil
end

function SkillTouchHitData:IsEnable()
	return self.enable
end

function SkillTouchHitData:Clear()
	self.hostPlayer = nil
	self.sceneController = nil

	if self.hitVPlayer ~= nil then
		self.hitVPlayer:Exit()
	end

	self.hitVPlayer = nil
	self.colliderIndexList = nil
	self.skillData = nil
	self.itemData = nil
	self.skillDir = nil
end

return SkillTouchHitData
