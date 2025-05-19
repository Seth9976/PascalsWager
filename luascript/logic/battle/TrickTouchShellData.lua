-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/TrickTouchShellData.lua

TrickTouchShellData = class("TrickTouchShellData")

function TrickTouchShellData:initialize(hitShell, trick, trickDir)
	self.trickDir = Vector3.zero

	self:Reset(hitShell, trick, trickDir)
end

function TrickTouchShellData:Reset(hitShell, trick, trickDir)
	self.hostShell = hitShell
	self.trick = trick
	self.trickData = self.trick:GetTrickData()
	self.damageType = self.trick:GetDamageType()

	self.trickDir:SetVector3(trickDir)

	self.checkFlg = false
	self.enable = true
end

function TrickTouchShellData:GetTrick()
	return self.trick
end

function TrickTouchShellData:GetTrickData()
	return self.trickData
end

function TrickTouchShellData:SetDamageType(type)
	self.damageType = type
end

function TrickTouchShellData:GetDamageType()
	return self.damageType
end

function TrickTouchShellData:SetChecked()
	self.checkFlg = true
end

function TrickTouchShellData:IsChecked()
	return self.checkFlg
end

function TrickTouchShellData:GetTrickDir()
	return self.trickDir
end

function TrickTouchShellData:GetHitShell()
	return self.hostShell
end

function TrickTouchShellData:Disable()
	self.enable = false
	self.hostShell = nil
	self.trick = nil
	self.trickData = nil
end

function TrickTouchShellData:IsEnable()
	return self.enable
end

function TrickTouchShellData:Clear()
	self.hostShell = nil
	self.trick = nil
	self.trickData = nil
	self.trickDir = nil
	self.enable = false
end
