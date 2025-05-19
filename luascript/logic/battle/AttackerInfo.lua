-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/AttackerInfo.lua

AttackerInfo = class("AttackerInfo")
AttackerInfo.static.SaveTime = 30

function AttackerInfo:initialize(vPlayer)
	self.attackVPlayer = VirtualPlayer:new()

	self.attackVPlayer:Copy(vPlayer)

	self.attackDamage = 0
	self.attackFrame = 0
end

function AttackerInfo:Update(damage, frame)
	self.attackDamage = self.attackDamage + damage
	self.attackFrame = frame
end

function AttackerInfo:CheckAssistEnable(lastAttackVPlayer, frame)
	if self.attackVPlayer:GetAnimalId() == lastAttackVPlayer:GetAnimalId() then
		return false
	end

	if frame - self.attackFrame > ControllerMain.ConvertSecondToFrame(AttackerInfo.SaveTime) then
		return false
	end

	return true
end

function AttackerInfo:GetAttackVPlayer()
	return self.attackVPlayer
end
