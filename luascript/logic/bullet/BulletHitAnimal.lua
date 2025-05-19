-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletHitAnimal.lua

BulletHitAnimal = class("BulletHitAnimal")

function BulletHitAnimal:initialize(animal, posX, posY, posZ, dis, colliderIndexList)
	self.hitPosition = Vector3.zero

	self:Reset(animal, posX, posY, posZ, dis, colliderIndexList)
end

function BulletHitAnimal:Reset(animal, posX, posY, posZ, dis, colliderIndexList)
	self.hitAnimal = animal

	self.hitPosition:Set(posX, posY, posZ)

	self.hitColliderIndexList = colliderIndexList
	self.hitDistance = dis
	self.enable = true
end

function BulletHitAnimal:GetHitAnimal()
	return self.hitAnimal
end

function BulletHitAnimal:GetHitDistance()
	return self.hitDistance
end

function BulletHitAnimal:GetColliderIndexList()
	return self.hitColliderIndexList
end

function BulletHitAnimal:GetHitPosition()
	return self.hitPosition
end

function BulletHitAnimal:Disable()
	self.enable = false
	self.hitAnimal = nil
	self.hitColliderIndexList = nil
end

function BulletHitAnimal:IsEnable()
	return self.enable
end

function BulletHitAnimal:Clear()
	self.hitAnimal = nil
	self.hitPosition = nil
	self.hitColliderIndexList = nil
end

return BulletHitAnimal
