-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/CoverKick.lua

CoverKick = class("CoverKick")
CoverKick.static.Status = {
	Open = 2,
	Close = 1,
	Empty = 0
}

function CoverKick:initialize(id, transform)
	self.tfSelf = transform
	self.id = id
	self.animator = self.tfSelf:GetComponent("Animator")
	self.isOpening = false
end

function CoverKick:SetFocus(flg)
	if flg == true then
		local status = FS_UserData.story:GetCoverStatus(self.id)

		self.isOpening = false

		if status == CoverKick.Status.Open then
			self.isOpening = true

			self.animator:SetInteger("trigger", CoverKick.Status.Open)
		elseif status == CoverKick.Status.Close then
			self.isOpening = false

			self.animator:SetInteger("trigger", CoverKick.Status.Close)
		else
			SystemHelper.LogError("=========CoverKick Status Error!!")
		end
	end
end

function CoverKick:KickCover()
	if self.isOpening == false then
		self.animator:SetInteger("trigger", CoverKick.Status.Open)
		FS_UserData.story:SetCoverStatus(self.id, CoverKick.Status.Open)

		self.isOpening = true

		AudioCtrl.SetObjectAudio("Object/scene/kickCover/kickCover_open", self.tfSelf, self.id)
	end
end

function CoverKick:IsOpening()
	return self.isOpening
end

function CoverKick:CloseCover()
	return
end

function CoverKick:Update()
	return
end

function CoverKick:Exit()
	self.tfSelf = nil
	self.animator = nil
end

return CoverKick
