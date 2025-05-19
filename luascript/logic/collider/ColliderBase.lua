-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Collider/ColliderBase.lua

ColliderBase = class("ColliderBase")
ColliderBase.static.ColliderLayerMask = LayerMask.GetMask("AnimalBone", "AnimalBodyBone", "Shell", "AnimalSkill")

function ColliderBase:initialize(index, fromVPlayer, originVPlayer, skillData, itemData, pos, time)
	self.exitFlg = false
	self.index = index
	self.fromVPlayer = VirtualPlayer:new()

	self.fromVPlayer:Copy(fromVPlayer)

	self.originVPlayer = VirtualPlayer:new()

	self.originVPlayer:Copy(originVPlayer)

	self.hitAnimalList = nil
	self.hitShellList = nil
	self.skillData = skillData
	self.itemData = itemData
	self.hitType = AnimalBase_Define.HitType.None
	self.itemHitType = AnimalBase_Define.HitType.None

	local vfxBombName = ""
	local audioBombName = ""

	if self.skillData ~= nil then
		vfxBombName = self.skillData.BulletBombEffect
		audioBombName = self.skillData.BulletBombAudio
	end

	if self.itemData ~= nil then
		self.itemHitType = self.itemData.HitType
		vfxBombName = self.itemData.BulletBombEffect
		audioBombName = self.itemData.BulletBombAudio
	end

	self.skillHitType = AnimalBase_Define.HitType.None
	self.targetType = GameAI.SkillTargetType.Enemy

	if self.skillData ~= nil then
		self.skillHitType = AnimalBase.GetSkillHitType(self.originVPlayer:GetHeroId(), self.skillData.SkillIndex, self.skillData.SkillCombo)
		self.targetType = AnimalBase.GetSkillTargetType(self.originVPlayer:GetHeroId(), self.skillData.SkillIndex, self.skillData.SkillCombo)
	end

	self.colliderCube = nil
	self.ignoreAnimalId = 0
	self.position = pos:Clone()
	self.timeEnd = TimeHelper.getNowTime() + time

	if vfxBombName ~= "" then
		VfxManager.PlayFreezeMulti(vfxBombName, self.position, nil, nil)
	end

	if audioBombName ~= "" then
		AudioCtrl.SetHeroAudio(audioBombName, self.position, self.index)
	end
end

function ColliderBase:Exit()
	if self.exitFlg == true then
		return
	end

	self.exitFlg = true

	if self.fromVPlayer ~= nil then
		self.fromVPlayer:Exit()
	end

	self.fromVPlayer = nil

	if self.originVPlayer ~= nil then
		self.originVPlayer:Exit()
	end

	self.originVPlayer = nil
	self.hitShellList = nil
	self.hitAnimalList = nil
	self.skillData = nil
	self.itemData = nil

	if self.colliderCube ~= nil then
		self.colliderCube:Exit()
	end

	self.colliderCube = nil
	self.position = nil
end

function ColliderBase:GetFromVirtualPlayer()
	return self.fromVPlayer
end

function ColliderBase:GetOriginVirtualPlayer()
	return self.originVPlayer
end

function ColliderBase:GetColliderCube()
	return self.colliderCube
end

function ColliderBase:GetSkillData()
	return self.skillData
end

function ColliderBase:GetItemData()
	return self.itemData
end

function ColliderBase:SetHitType(type)
	self.hitType = type
end

function ColliderBase:GetHitType()
	if self.hitType ~= AnimalBase_Define.HitType.None then
		return self.hitType
	end

	if self.itemHitType ~= AnimalBase_Define.HitType.None then
		return self.itemHitType
	end

	return self.skillHitType
end

function ColliderBase:SetIgnoreAnimalId(animalId)
	self.ignoreAnimalId = animalId
end

function ColliderBase:GetIgnoreAnimalId()
	return self.ignoreAnimalId
end

function ColliderBase:AddHitAnimal(animal)
	if animal ~= nil then
		local id = animal:GetAnimalId()

		if self.hitAnimalList == nil then
			self.hitAnimalList = {}
		end

		if self.hitAnimalList[id] == nil then
			self.hitAnimalList[id] = animal
		end
	end
end

function ColliderBase:ResetHitAnimal()
	self.hitAnimalList = nil
end

function ColliderBase:GetHitAnimalList()
	return self.hitAnimalList
end

function ColliderBase:IsHaveHitAnimal(animal)
	if animal == nil then
		return false
	end

	local id = animal:GetAnimalId()

	if self.hitAnimalList ~= nil and self.hitAnimalList[id] == animal then
		return true
	end

	return false
end

function ColliderBase:AddHitShell(shell)
	if shell ~= nil then
		local id = shell:GetShellId()

		if self.hitShellList == nil then
			self.hitShellList = {}
		end

		if self.hitShellList[id] == nil then
			self.hitShellList[id] = shell
		end
	end
end

function ColliderBase:ResetHitShell()
	self.hitShellList = nil
end

function ColliderBase:GetHitShellList()
	return self.hitShellList
end

function ColliderBase:IsHaveHitShell(shell)
	if shell == nil then
		return false
	end

	local id = shell:GetShellId()

	if self.hitShellList ~= nil and self.hitShellList[id] == shell then
		return true
	end

	return false
end

function ColliderBase:GetTargetList()
	local skillTargetList

	if self.skillData ~= nil then
		skillTargetList = GameAI.GetSelectTarget(self.fromVPlayer, self.targetType)
	end

	return skillTargetList
end

function ColliderBase:IsInSelectTarget(animal)
	local retIn = GameAI.IsInSelectTarget(self.fromVPlayer:GetAnimalId(), self.fromVPlayer:GetTeamId(), self.targetType, animal)

	return retIn
end

function ColliderBase:IsInSelectTargetForShell(shell)
	local retIn = GameAI.IsInSelectTargetForShell(self.fromVPlayer:GetAnimalId(), self.fromVPlayer:GetTeamId(), self.targetType, shell)

	return retIn
end

function ColliderBase:GetPosition()
	return self.position
end

function ColliderBase:IsRunning()
	if self.exitFlg == false then
		return true
	end

	return false
end

function ColliderBase:Update()
	if self:IsRunning() == false then
		return false
	end

	local nowTime = TimeHelper.getNowTime()

	if nowTime > self.timeEnd then
		return false
	end

	return true
end

return ColliderBase
