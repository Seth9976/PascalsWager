-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Bullet/BulletHitShell.lua

BulletHitShell = class("BulletHitShell")

function BulletHitShell:initialize(shell, posX, posY, posZ, dis)
	self.hitPosition = Vector3.zero

	self:Reset(shell, posX, posY, posZ, dis)
end

function BulletHitShell:Reset(shell, posX, posY, posZ, dis)
	self.hitShell = shell

	self.hitPosition:Set(posX, posY, posZ)

	self.hitDistance = dis
	self.enable = true
end

function BulletHitShell:GetHitShell()
	return self.hitShell
end

function BulletHitShell:GetHitDistance()
	return self.hitDistance
end

function BulletHitShell:GetHitPosition()
	return self.hitPosition
end

function BulletHitShell:Disable()
	self.enable = false
	self.hitShell = nil
end

function BulletHitShell:IsEnable()
	return self.enable
end

function BulletHitShell:Clear()
	self.hitShell = nil
	self.hitPosition = nil
end

return BulletHitShell
