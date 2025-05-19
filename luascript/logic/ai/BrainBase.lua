-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/BrainBase.lua

BrainBase = class("BrainBase")

function BrainBase:initialize(instance)
	self.instance = instance
	self.heroExtData = nil
	self.behaviorTree = nil
	self.animalTarget = nil
	self.animalCompanion = nil
	self.isCrazy = false
end

function BrainBase:createTree()
	return
end

function BrainBase:GetAnimalTarget()
	return self.animalTarget
end

function BrainBase:ClearAnimalTarget()
	self.animalTarget = nil
end

function BrainBase:GetAnimalCompanion()
	return self.animalCompanion
end

function BrainBase:ClearAnimalCompanion()
	self.animalCompanion = nil
end

function BrainBase:SetAnimalTarget(animal)
	if animal ~= nil then
		self.animalTarget = animal
	end
end

function BrainBase:SetAnimalCrazy(flag)
	if flag ~= nil then
		self.isCrazy = flag
	end
end

function BrainBase:IsAnimalCrazy()
	return self.isCrazy
end

function BrainBase:GetBehaviorTree()
	return self.behaviorTree
end

function BrainBase:SetBehaviorTree(tree)
	self.behaviorTree = tree
end

function BrainBase:SetHeroExtData(data)
	self.heroExtData = data
end

function BrainBase:GetHeroExtData()
	return self.heroExtData
end

function BrainBase:Exit()
	self.instance = nil
	self.heroExtData = nil
	self.behaviorTree = nil
	self.animalTarget = nil
	self.animalCompanion = nil
end

return BrainBase
