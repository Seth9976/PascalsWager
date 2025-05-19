-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Fountain.lua

Fountain = class("Fountain")
Fountain.static.VfxName = "vfx_maze_fountain"
Fountain.static.AddSanPer = 0.5
Fountain.static.Status = {
	Open = 1,
	Close = 2,
	Empty = 0
}

function Fountain:initialize(id, transform)
	self.id = id
	self.tfSelf = transform
	self.position = Vector3.zero
	self.vfxStatus = nil
	self.showFlg = false
	self.isOpening = false
end

function Fountain:IsOpening()
	return self.isOpening
end

function Fountain:IsShow()
	return self.showFlg
end

function Fountain:DebugRefresh(pos)
	if self.showFlg == true then
		FS_UserData.story:SetFountainStatus(self.id, Fountain.Status.Open)

		if self.vfxStatus ~= nil then
			self.vfxStatus:Clear()

			self.vfxStatus = nil
		end

		self:Show(pos)
	end
end

function Fountain:Show(pos)
	self.position:SetVector3(pos)

	if self.tfSelf ~= nil then
		self.tfSelf.position = pos

		self.tfSelf.gameObject:SetActive(true)

		self.showFlg = true
	end

	local status = FS_UserData.story:GetFountainStatus(self.id)

	if status == Fountain.Status.Open then
		self.isOpening = true

		if self.vfxStatus == nil then
			self.vfxStatus = VfxManager.PlayBindMulti(self.tfSelf, Fountain.VfxName)

			if self.vfxStatus ~= nil then
				self.vfxStatus:SetDelayClear(true, nil)
			end
		end

		AudioCtrl.SetObjectAudio("Object/scene/fountain", self.tfSelf, self.id, "isOpen", 0)
	else
		self.isOpening = false

		if self.vfxStatus ~= nil then
			self.vfxStatus:Clear()

			self.vfxStatus = nil
		end

		AudioCtrl.StopObjectAudio("Object/scene/fountain", self.id)
	end
end

function Fountain:Hide()
	if self.tfSelf ~= nil then
		self.tfSelf.gameObject:SetActive(false)

		self.showFlg = false
	end

	if self.vfxStatus ~= nil then
		self.vfxStatus:Clear()

		self.vfxStatus = nil
	end

	AudioCtrl.StopObjectAudio("Object/scene/fountain", self.id)
end

function Fountain:TouchFountain()
	local status = FS_UserData.story:GetFountainStatus(self.id)

	if status == Fountain.Status.Open then
		FS_UserData.story:SetFountainStatus(self.id, Fountain.Status.Close)

		self.isOpening = false

		if self.vfxStatus ~= nil then
			self.vfxStatus:Clear()

			self.vfxStatus = nil
		end

		AudioCtrl.SetObjectAudio("Object/scene/fountain", self.tfSelf, self.id, "isOpen", 1)
	end
end

function Fountain:GetPosition()
	return self.position
end

function Fountain:Exit()
	if self.vfxStatus ~= nil then
		self.vfxStatus:Clear()

		self.vfxStatus = nil
	end

	self.position = nil
	self.tfSelf = nil

	AudioCtrl.StopObjectAudio("Object/scene/fountain", self.id)
end

return Fountain
