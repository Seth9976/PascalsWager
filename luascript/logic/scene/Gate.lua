-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Gate.lua

Gate = class("Gate")
Gate.static.Status = {
	Open = 2,
	Close = 1,
	Empty = 0
}
Gate.static.GateType = {
	Wood = 1,
	Stone = 3,
	Metal = 2,
	Trick = 4
}

function Gate:initialize(id, transform)
	self.tfSelf = transform
	self.id = id
	self.animator = self.tfSelf:GetComponent("Animator")
	self.gateData = MS_StoryGate.GetStoryGate(FS_UserData.story:GetStoryId(), self.id)
	self.navmeshCutClose = self.tfSelf:Find("virtual/navmeshCut_close")
	self.navmeshCutOpen = self.tfSelf:Find("virtual/navmeshCut_open")
	self.isOpening = false
end

function Gate:SetFocus(flg)
	if flg == true then
		local status = FS_UserData.story:GetGateStatus(self.id)

		self.isOpening = false

		if status == Gate.Status.Open then
			self.isOpening = true

			self.animator:SetInteger("trigger", Gate.Status.Open)

			if self.navmeshCutClose ~= nil then
				self.navmeshCutClose.gameObject:SetActive(false)
			end

			if self.navmeshCutOpen ~= nil then
				self.navmeshCutOpen.gameObject:SetActive(false)
			end
		elseif status == Gate.Status.Close then
			self.isOpening = false

			self.animator:SetInteger("trigger", Gate.Status.Close)

			if self.navmeshCutClose ~= nil then
				self.navmeshCutClose.gameObject:SetActive(false)
			end

			if self.navmeshCutOpen ~= nil then
				self.navmeshCutOpen.gameObject:SetActive(false)
			end
		else
			SystemHelper.LogError("=========Gate Status Error!!")
		end
	end
end

function Gate:OpenGate()
	if self.isOpening == false then
		self.animator:SetInteger("trigger", Gate.Status.Open)
		FS_UserData.story:SetGateStatus(self.id, Gate.Status.Open)

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end

		if self.navmeshCutOpen ~= nil then
			self.navmeshCutOpen.gameObject:SetActive(false)
		end

		self.isOpening = true

		self:SetAudio()
	end
end

function Gate:IsOpening()
	return self.isOpening
end

function Gate:SetState(status, instantly)
	if status == Gate.Status.Open then
		self.isOpening = true

		if instantly == true then
			self.animator:Rebind()
			self.animator:Play("opened", 0, 0)
		else
			self:SetAudio()
		end

		self.animator:SetInteger("trigger", Gate.Status.Open)

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end

		if self.navmeshCutOpen ~= nil then
			self.navmeshCutOpen.gameObject:SetActive(false)
		end
	elseif status == Gate.Status.Close then
		self.isOpening = false

		if instantly == true then
			self.animator:Rebind()
			self.animator:Play("closed", 0, 0)
		else
			self:SetAudio()
		end

		self.animator:SetInteger("trigger", Gate.Status.Close)

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end

		if self.navmeshCutOpen ~= nil then
			self.navmeshCutOpen.gameObject:SetActive(false)
		end
	end
end

function Gate:SetAudio()
	if self.gateData ~= nil and self.gateData.Type > 0 then
		if self.gateData.Type == Gate.GateType.Wood then
			AudioCtrl.SetObjectAudio("Object/scene/gate/gate_wood_open", self.tfSelf, self.id)
		elseif self.gateData.Type == Gate.GateType.Metal then
			AudioCtrl.SetObjectAudio("Object/scene/gate/gate_metal_open", self.tfSelf, self.id)
		elseif self.gateData.Type == Gate.GateType.Stone then
			AudioCtrl.SetObjectAudio("Object/scene/gate/gate_stone_open", self.tfSelf, self.id)
		elseif self.gateData.Type == Gate.GateType.Trick then
			AudioCtrl.SetObjectAudio("Object/scene/gate/gate_trick_open", self.tfSelf, self.id)
		end
	end
end

function Gate:CloseGate()
	return
end

function Gate:Update()
	return
end

function Gate:Exit()
	self.tfSelf = nil
	self.animator = nil
end

return Gate
