-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Altar.lua

Altar = class("Altar")
Altar.static.Status = {
	Open = 2,
	Close = 1,
	Empty = 0
}
Altar.static.System = {
	Dedication = 1,
	Alchemy = 2
}
Altar.static.VfxName_Opened = "vfx_save_oppened"
Altar.static.VfxName_Opening = "vfx_save_oppening"
Altar.static.VfxName_Dedication = "vfx_save_alchemy"

function Altar:initialize(id, transform)
	self.tfSelf = transform
	self.id = id
	self.animator = self.tfSelf:GetComponent("Animator")
	self.vfxBoxTF1 = TfFindChild(self.tfSelf, "bipRoot/Dummy002/vfxBox_1")
	self.isOpening = false
end

function Altar:SetFocus(flg)
	if flg == true then
		local status = FS_UserData.story:GetAltarStatus(self.id)

		self.isOpening = false

		if status == Altar.Status.Open then
			self.isOpening = true

			self.animator:SetInteger("trigger", Altar.Status.Open)
		elseif status == Altar.Status.Close then
			self.isOpening = false

			self.animator:SetInteger("trigger", Altar.Status.Close)
		else
			SystemHelper.LogError("=========Altar Status Error!!")
		end
	end
end

function Altar:OpenAltar()
	if self.isOpening == false then
		self.animator:SetInteger("trigger", Altar.Status.Open)
		VfxManager.PlayBindMulti(self.tfSelf, Altar.VfxName_Opening)

		self.isOpening = true

		FS_UserData.story:SetAltarStatus(self.id, Altar.Status.Open)
		AudioCtrl.SetObjectAudio("Object/scene/altar_open", self.tfSelf, self.id)
	end
end

function Altar:Start()
	if self.isOpening then
		self.openedVfx = VfxManager.PlayBindMulti(self.vfxBoxTF1, Altar.VfxName_Opened)
	end
end

function Altar:IsOpening()
	return self.isOpening
end

function Altar:CloseAltar()
	return
end

function Altar:ShowAltar(show)
	self.tfSelf.gameObject:SetActive(show)
end

function Altar:ChangeOpenVfx()
	if self.openedVfx == nil then
		self.openedVfx = VfxManager.PlayBindMulti(self.vfxBoxTF1, Altar.VfxName_Opened)
	end
end

function Altar:Dedicate()
	if self.isOpening == true then
		if self.dedicationVfx ~= nil then
			self.dedicationVfx:Clear()

			self.dedicationVfx = nil
		end

		self.dedicationVfx = VfxManager.PlayBindMulti(self.tfSelf, Altar.VfxName_Dedication)

		self.animator:SetTrigger("dedication")
	end
end

function Altar:DoAlchemy()
	if self.isOpening == true then
		self.animator:SetTrigger("alchemy")
	end
end

function Altar:IsAnimatorEnd()
	if self.animator:GetCurrentAnimatorStateInfo(0):IsName("opened") then
		return true
	end

	return false
end

function Altar:Update()
	return
end

function Altar:Exit()
	self.tfSelf = nil
	self.animator = nil
	self.vfxBoxTF1 = nil

	if self.openedVfx ~= nil then
		self.openedVfx:Clear()

		self.openedVfx = nil
	end

	if self.dedicationVfx ~= nil then
		self.dedicationVfx:Clear()

		self.dedicationVfx = nil
	end
end

return Altar
