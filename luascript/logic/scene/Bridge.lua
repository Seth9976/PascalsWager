-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Bridge.lua

Bridge = class("Bridge")
Bridge.static.Status = {
	Open = 2,
	Close = 1,
	Empty = 0
}

function Bridge:initialize(id, transform)
	self.tfSelf = transform
	self.id = id
	self.animator = self.tfSelf:GetComponent("Animator")
	self.bridgeData = MS_StoryBridge.GetStoryBridge(FS_UserData.story:GetStoryId(), self.id)
	self.navmeshCutClose = self.tfSelf:Find("virtual/navmeshCut_close")
	self.isOpening = false
	self.tfAuido = self.tfSelf:Find("visible/audio")

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and self.bridgeData ~= nil and self.bridgeData.ArcadeDefaultOpen == 1 then
		self.animator:SetInteger("trigger", Bridge.Status.Open)
		FS_UserData.story:SetBridgeStatus(self.id, Bridge.Status.Open)

		self.isOpening = true

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end
	end
end

function Bridge:SetFocus(flg)
	if flg == true then
		local status = FS_UserData.story:GetBridgeStatus(self.id)

		self.isOpening = false

		if status == Bridge.Status.Open then
			self.isOpening = true

			self.animator:SetInteger("trigger", Bridge.Status.Open)

			if self.navmeshCutClose ~= nil then
				self.navmeshCutClose.gameObject:SetActive(false)
			end
		elseif status == Bridge.Status.Close then
			self.isOpening = false

			self.animator:SetInteger("trigger", Bridge.Status.Close)

			if self.navmeshCutClose ~= nil then
				self.navmeshCutClose.gameObject:SetActive(true)
			end
		else
			SystemHelper.LogError("=========Bridge Status Error!!")
		end
	end
end

function Bridge:OpenBridge()
	if self.isOpening == false then
		self.animator:SetInteger("trigger", Bridge.Status.Open)
		FS_UserData.story:SetBridgeStatus(self.id, Bridge.Status.Open)

		self.isOpening = true

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end

		if self.tfAuido ~= nil then
			AudioCtrl.SetObjectAudio("Object/other/trigger", self.tfAuido, self.id)
		end

		AudioCtrl.SetObjectAudio("Object/scene/bridge/bridge_open", self.tfSelf, self.id)
	end
end

function Bridge:IsOpening()
	return self.isOpening
end

function Bridge:SetState(status, instantly)
	if status == Bridge.Status.Open then
		self.isOpening = true

		if instantly == true then
			self.animator:Play("opened", 0, 0)
		else
			AudioCtrl.SetObjectAudio("Object/scene/bridge/bridge_open", self.tfSelf, self.id)
		end

		self.animator:SetInteger("trigger", Bridge.Status.Open)

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end
	elseif status == Bridge.Status.Close then
		self.isOpening = false

		if instantly == true then
			self.animator:Play("closed", 0, 0)
		end

		self.animator:SetInteger("trigger", Bridge.Status.Close)

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(true)
		end
	end
end

function Bridge:CloseBridge()
	return
end

function Bridge:Update()
	return
end

function Bridge:Exit()
	self.tfSelf = nil
	self.animator = nil
end

return Bridge
