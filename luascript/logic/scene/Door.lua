-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Door.lua

Door = class("Door")
Door.static.Status = {
	Open = 2,
	Close = 1,
	Empty = 0
}
Door.static.DoorType = {
	Round = 8,
	Gear = 10,
	Metal = 3,
	Rotate = 9,
	Brick = 5,
	Wood = 1,
	Coffin = 6,
	Trick = 2,
	Sluice = 4,
	Narrow = 7
}

function Door:initialize(id, transform)
	self.tfSelf = transform
	self.id = id
	self.animator = self.tfSelf:GetComponent("Animator")
	self.doorData = MS_StoryDoor.GetStoryDoor(FS_UserData.story:GetStoryId(), self.id)
	self.navmeshCutClose = self.tfSelf:Find("virtual/navmeshCut_close")
	self.navmeshCutOpen = self.tfSelf:Find("virtual/navmeshCut_open")
	self.switchable = self.doorData ~= nil and self.doorData.Switchable == 1
	self.tfAuido = self.tfSelf:Find("visible/audio")
	self.isOpening = false
	self.running = false
end

function Door:SetFocus(flg)
	if flg == true then
		local status = FS_UserData.story:GetDoorStatus(self.id)

		self.isOpening = false

		if status == Door.Status.Open then
			self.isOpening = true

			self.animator:SetInteger("trigger", Door.Status.Open)

			if self.navmeshCutClose ~= nil then
				self.navmeshCutClose.gameObject:SetActive(false)
			end

			if self.navmeshCutOpen ~= nil then
				self.navmeshCutOpen.gameObject:SetActive(false)
			end
		elseif status == Door.Status.Close then
			self.isOpening = false

			self.animator:SetInteger("trigger", Door.Status.Close)

			if self.navmeshCutClose ~= nil then
				self.navmeshCutClose.gameObject:SetActive(false)
			end

			if self.navmeshCutOpen ~= nil then
				self.navmeshCutOpen.gameObject:SetActive(false)
			end
		else
			SystemHelper.LogError("=========Door Status Error!!")
		end
	end
end

function Door:OpenDoor(animatorType)
	if self.isOpening == false then
		self.animator:SetInteger("trigger", Door.Status.Open)

		if animatorType and animatorType ~= 0 then
			self.animator:SetInteger("type", animatorType)
		end

		self.isOpening = true

		FS_UserData.story:SetDoorStatus(self.id, Door.Status.Open)

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end

		if self.navmeshCutOpen ~= nil then
			self.navmeshCutOpen.gameObject:SetActive(false)
		end

		self:SetTriggerAudio()
		self:SetAudio()
	end
end

function Door:SwitchDoor(animatorType)
	if self.isOpening == false then
		self.animator:SetInteger("trigger", Door.Status.Open)

		if animatorType and animatorType ~= 0 then
			self.animator:SetInteger("type", animatorType)
		end

		self.isOpening = true
		self.running = true

		FS_UserData.story:SetDoorStatus(self.id, Door.Status.Open)

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end

		if self.navmeshCutOpen ~= nil then
			self.navmeshCutOpen.gameObject:SetActive(false)
		end

		self:SetTriggerAudio()
		self:SetAudio()
	else
		self.animator:SetInteger("trigger", Door.Status.Close)

		if animatorType and animatorType ~= 0 then
			self.animator:SetInteger("type", animatorType)
		end

		self.isOpening = false
		self.running = true

		FS_UserData.story:SetDoorStatus(self.id, Door.Status.Close)

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end

		if self.navmeshCutOpen ~= nil then
			self.navmeshCutOpen.gameObject:SetActive(false)
		end

		self:SetTriggerAudio()
		self:SetAudio()
	end
end

function Door:SetState(status, instantly)
	if status == Door.Status.Open then
		self.isOpening = true

		if instantly == true then
			self.animator:Play("opened", 0, 0)
		else
			self:SetAudio()
		end

		self.animator:SetInteger("trigger", Door.Status.Open)

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end

		if self.navmeshCutOpen ~= nil then
			self.navmeshCutOpen.gameObject:SetActive(false)
		end
	elseif status == Door.Status.Close then
		self.isOpening = false

		if instantly == true then
			self.animator:Play("closed", 0, 0)
		else
			self:SetAudio()
		end

		self.animator:SetInteger("trigger", Door.Status.Close)

		if self.navmeshCutClose ~= nil then
			self.navmeshCutClose.gameObject:SetActive(false)
		end

		if self.navmeshCutOpen ~= nil then
			self.navmeshCutOpen.gameObject:SetActive(false)
		end
	end
end

function Door:SetTriggerAudio()
	if self.tfAuido ~= nil and self.doorData ~= nil then
		if self.doorData.Type == Door.DoorType.Rotate then
			local triggerRoot = self.tfAuido:Find("trigger")

			if triggerRoot ~= nil then
				for i = 0, triggerRoot.childCount - 1 do
					local tfTrigger = triggerRoot:GetChild(i)

					if tfTrigger ~= nil then
						AudioCtrl.SetObjectAudio("Object/other/trigger", tfTrigger, self.id .. i)
					end
				end
			end
		elseif self.doorData.Type ~= Door.DoorType.Gear then
			AudioCtrl.SetObjectAudio("Object/other/trigger", self.tfAuido, self.id)
		end
	end
end

function Door:SetAudio()
	if self.doorData ~= nil and self.doorData.Type > 0 then
		if self.doorData.Type == Door.DoorType.Wood then
			AudioCtrl.SetObjectAudio("Object/scene/door/door_wood_open", self.tfSelf, self.id)
		elseif self.doorData.Type == Door.DoorType.Trick then
			AudioCtrl.SetObjectAudio("Object/scene/door/door_trick_open", self.tfSelf, self.id)
		elseif self.doorData.Type == Door.DoorType.Metal then
			AudioCtrl.SetObjectAudio("Object/scene/door/door_metal_open", self.tfSelf, self.id)
		elseif self.doorData.Type == Door.DoorType.Sluice then
			AudioCtrl.SetObjectAudio("Object/scene/door/door_sluice_open", self.tfSelf, self.id)
		elseif self.doorData.Type == Door.DoorType.Brick then
			AudioCtrl.SetObjectAudio("Object/scene/door/door_brick_open", self.tfSelf, self.id)
		elseif self.doorData.Type == Door.DoorType.Coffin then
			AudioCtrl.SetObjectAudio("Object/scene/door/door_metal_coffin_open", self.tfSelf, self.id)
		elseif self.doorData.Type == Door.DoorType.Narrow then
			AudioCtrl.SetObjectAudio("Object/scene/door/door_metal_narrow_open", self.tfSelf, self.id)
		elseif self.doorData.Type == Door.DoorType.Round then
			AudioCtrl.SetObjectAudio("Object/scene/door/door_metal_round_open", self.tfSelf, self.id)
		elseif self.doorData.Type == Door.DoorType.Gear then
			if self.tfAuido ~= nil then
				AudioCtrl.SetObjectAudio("Object/scene/door/door_gear_open", self.tfAuido, self.id)
			end
		elseif self.doorData.Type == Door.DoorType.Rotate and self.tfAuido ~= nil then
			local doorRoot = self.tfAuido:Find("door")

			if doorRoot ~= nil then
				for i = 0, doorRoot.childCount - 1 do
					local tfDoor = doorRoot:GetChild(i)

					if tfDoor ~= nil then
						AudioCtrl.SetObjectAudio("Object/scene/door/door_rotate_open", tfDoor, self.id .. i)
					end
				end
			end
		end
	end
end

function Door:IsOpening()
	return self.isOpening
end

function Door:IsRunning()
	return self.running
end

function Door:IsSwitchable()
	return self.switchable
end

function Door:CloseDoor()
	return
end

function Door:Update()
	if self:IsRunning() then
		local stateInfo = self.animator:GetCurrentAnimatorStateInfo(0)

		if self.isOpening and stateInfo:IsName("opened") then
			self.running = false
		elseif self.isOpening == false and stateInfo:IsName("closed") then
			self.running = false
		end
	end
end

function Door:Exit()
	self.tfSelf = nil
	self.animator = nil
	self.tfAuido = nil
end

return Door
