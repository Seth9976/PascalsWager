-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/StairKick.lua

StairKick = class("StairKick")
StairKick.static.Status = {
	Open = 2,
	Close = 1,
	Empty = 0
}
StairKick.static.StairKickType = {
	Wood = 1,
	Metal = 2
}

function StairKick:initialize(id, transform)
	self.tfSelf = transform
	self.id = id
	self.animator = self.tfSelf:GetComponent("Animator")
	self.stairKickData = MS_StoryStairKick.GetStoryStairKick(FS_UserData.story:GetStoryId(), self.id)
	self.isOpening = false

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.stairKickData ~= nil and self.stairKickData.ArcadeDefaultOpen == 1 then
		self.animator:SetInteger("trigger", StairKick.Status.Open)
		FS_UserData.story:SetStairStatus(self.id, StairKick.Status.Open)

		self.isOpening = true
	end
end

function StairKick:SetFocus(flg)
	if flg == true then
		local status = FS_UserData.story:GetStairStatus(self.id)

		self.isOpening = false

		if status == StairKick.Status.Open then
			self.isOpening = true

			self.animator:SetInteger("trigger", StairKick.Status.Open)
		elseif status == StairKick.Status.Close then
			self.isOpening = false

			self.animator:SetInteger("trigger", StairKick.Status.Close)
		else
			SystemHelper.LogError("=========StairKick Status Error!!")
		end
	end
end

function StairKick:KickStair()
	if self.isOpening == false then
		self.animator:SetInteger("trigger", StairKick.Status.Open)
		FS_UserData.story:SetStairStatus(self.id, StairKick.Status.Open)

		self.isOpening = true

		if self.stairKickData ~= nil then
			if self.stairKickData.Type == StairKick.StairKickType.Wood then
				AudioCtrl.SetObjectAudio("Object/scene/kickStair/kickStair_wood_open", self.tfSelf, self.id)
			elseif self.stairKickData.Type == StairKick.StairKickType.Metal then
				AudioCtrl.SetObjectAudio("Object/scene/kickStair/kickStair_metal_open", self.tfSelf, self.id)
			end
		end
	end
end

function StairKick:IsOpening()
	return self.isOpening
end

function StairKick:CloseStair()
	return
end

function StairKick:Update()
	return
end

function StairKick:Exit()
	self.tfSelf = nil
	self.animator = nil
end

return StairKick
