-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/SkillTouchHitShellData.lua

SkillTouchHitShellData = class("SkillTouchHitShellData")

function SkillTouchHitShellData:initialize(attackPlayer, shellId, skillData, itemData, attackDir)
	self.skillDir = Vector3.zero
	self.sceneController = ST_Main.GetSceneController()

	self:Reset(attackPlayer, shellId, skillData, itemData, attackDir)
end

function SkillTouchHitShellData:Reset(attackPlayer, shellId, skillData, itemData, attackDir)
	self.hostPlayer = attackPlayer
	self.hitShellId = shellId
	self.skillData = skillData
	self.itemData = itemData

	self.skillDir:SetVector3(attackDir)

	self.hitHand = false
	self.attackDistance = 0
	self.checkFlg = false
	self.enable = true
end

function SkillTouchHitShellData:SetHitHand(flg)
	self.hitHand = flg
end

function SkillTouchHitShellData:GetSkillData()
	return self.skillData
end

function SkillTouchHitShellData:GetItemData()
	return self.itemData
end

function SkillTouchHitShellData:IsHitHand()
	return self.hitHand
end

function SkillTouchHitShellData:GetHitShellId()
	return self.hitShellId
end

function SkillTouchHitShellData:GetHitShell()
	if self.hitShellId > 0 then
		return self.sceneController:FindShellById(self.hitShellId)
	end

	return nil
end

function SkillTouchHitShellData:GetSkillDir()
	return self.skillDir
end

function SkillTouchHitShellData:GetAttackDistance()
	return self.attackDistance
end

function SkillTouchHitShellData:SetAttackDistance(dis)
	self.attackDistance = dis
end

function SkillTouchHitShellData:SetChecked()
	self.checkFlg = true
end

function SkillTouchHitShellData:IsChecked()
	return self.checkFlg
end

function SkillTouchHitShellData:Disable()
	self.enable = false
	self.hostPlayer = nil
	self.skillData = nil
	self.itemData = nil
end

function SkillTouchHitShellData:IsEnable()
	return self.enable
end

function SkillTouchHitShellData:Clear()
	self.hostPlayer = nil
	self.sceneController = nil
	self.skillData = nil
	self.itemData = nil
	self.skillDir = nil
end

return SkillTouchHitShellData
