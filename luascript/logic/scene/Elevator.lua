-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Elevator.lua

Elevator = class("Elevator")
Elevator.static.SpeedX = 1
Elevator.static.Type = {
	SmallWood = 3,
	RoundWood = 2,
	Stone = 4,
	Wood = 1,
	None = 0
}

function Elevator:initialize(id, transform)
	self.tfSelf = transform
	self.id = id
	self.sceneController = ST_Main.GetSceneController()
	self.elevatorData = MS_StoryElevator.GetStoryElevator(FS_UserData.story:GetStoryId(), self.id)

	local statusData = FS_UserData.story:GetElevatorStatus(self.id)

	self.floor = 1
	self.floorMove = 1
	self.floorMax = 2
	self.lastFloor = 1

	if self.elevatorData ~= nil then
		self.floor = tonumber(self.elevatorData.DefaultParam)
		self.floorMove = self.floor
		self.floorMax = tonumber(self.elevatorData.FloorMax)
	end

	if statusData ~= nil then
		self.floor = tonumber(statusData)
		self.floorMove = self.floor
	end

	self.animator = self.tfSelf:GetComponent("Animator")
	self.tfAuido = self.tfSelf:Find("visible/audio")
	self.animationUVList = nil

	local tfVfxRoot = self.tfSelf:Find("visible/vfx_bind_1")

	if tfVfxRoot ~= nil then
		if self.animationUVList == nil then
			self.animationUVList = {}
		end

		local animUV = tfVfxRoot:GetComponent("AnimationUV")

		if animUV ~= nil then
			animUV:SetAutoPlay(false)
			table.insert(self.animationUVList, animUV)
		end

		local len = tfVfxRoot.childCount

		if len > 0 then
			for i = 0, len - 1 do
				local _tf = tfVfxRoot:GetChild(i)
				local _animUV = _tf:GetComponent("AnimationUV")

				if _animUV ~= nil then
					_animUV:SetAutoPlay(false)
					table.insert(self.animationUVList, _animUV)
				end
			end
		end
	end

	self.tfItem = self.tfSelf:Find("virtual/item_group/item_1")
	self.elevatorType = self.elevatorData.ElevatorType
	self.running = false
	self.arrived = true
	self.itemScene = nil
	self.vfxFire = self.tfSelf:Find("visible/Bone001/vfx_elevator_fire")

	if self.vfxFire ~= nil then
		self.vfxFire.gameObject:SetActive(false)

		self.vfxFireAnim = self.vfxFire:GetComponent("Animator")
	end

	local groundGroup = self.tfSelf:Find("virtual/ground_group")
	local groundLen = groundGroup.childCount

	self.moveGround = nil
	self.moveGroundLastY = 0
	self.moveGroundDeltaY = 0

	if groundLen > 0 then
		self.moveGround = groundGroup:GetChild(0)

		if self.moveGround ~= nil then
			self.moveGroundLastY = self.moveGround.position.y
		end
	end
end

function Elevator:SetFocus(flg)
	if flg == true then
		self.animator:SetInteger("trigger", self.floor)
	end
end

function Elevator:IsRunning()
	return self.running
end

function Elevator:SetItemScene(item)
	self.itemScene = item
end

function Elevator:GetFloor()
	return self.floor
end

function Elevator:Call(floorCall, isInner, switchIndex)
	if self.running == true then
		return false
	end

	floorCall = tonumber(floorCall)
	isInner = tonumber(isInner)

	local floorTarget = 1

	if isInner > 0 then
		if self.floorMove >= self.floorMax then
			floorTarget = self.floorMax * 2 - self.floorMove - 1
		else
			floorTarget = self.floorMove + 1
		end
	else
		floorTarget = floorCall
	end

	if self.floor == floorTarget then
		return false
	end

	self.lastFloor = self.floor

	if isInner > 0 then
		self.floor = floorTarget
		self.floorMove = self.floorMove + 1

		if self.floorMove > self.floorMax * 2 - 2 then
			self.floorMove = 1
		end
	else
		self.floor = floorTarget

		if floorTarget > self.lastFloor then
			self.floorMove = floorTarget
		elseif floorTarget > 1 and floorTarget < self.floorMax then
			self.floorMove = self.floorMax * 2 - floorTarget
		else
			self.floorMove = floorTarget
		end
	end

	self.running = true
	self.arrived = false

	FS_UserData.story:SetElevatorStatus(self.id, self.floor)
	self.animator:SetInteger("trigger", self.floor)

	if self.animationUVList ~= nil then
		for i = 1, #self.animationUVList do
			local animUV = self.animationUVList[i]

			if animUV ~= nil then
				if self.floor > self.lastFloor then
					animUV:SetUVSpeed(Elevator.SpeedX, 0)
				else
					animUV:SetUVSpeed(Elevator.SpeedX * -1, 0)
				end

				animUV:SetAutoPlay(true)
			end
		end
	end

	if self.vfxFire ~= nil then
		self.vfxFire.gameObject:SetActive(true)
	end

	if self.tfAuido ~= nil then
		for i = 0, self.tfAuido.childCount - 1 do
			local tf = self.tfAuido:GetChild(i)

			if StringHelper.StartsWith(tf.name, "main") then
				AudioCtrl.SetObjectAudio("Object/scene/elevator/elevator_run_" .. self.elevatorType, tf, self.id .. i, "elevatorIndex", 0)
			elseif tf.name == "trigger" .. switchIndex then
				AudioCtrl.SetObjectAudio("Object/other/trigger", tf, self.id .. i)
			end
		end
	end

	return true
end

function Elevator:Update()
	if self.running == true then
		local stateInfo = self.animator:GetCurrentAnimatorStateInfo(0)

		if stateInfo:IsName("switch" .. self.floor) then
			if self.vfxFire ~= nil then
				self.vfxFire.gameObject:SetActive(false)
			end

			self.running = false
		elseif stateInfo:IsName("switch" .. self.lastFloor .. "_" .. self.floor) then
			if self.arrived == false and self.animator:GetFloat("isArrived") >= 1 then
				self.arrived = true

				if self.animationUVList ~= nil then
					for i = 1, #self.animationUVList do
						local animUV = self.animationUVList[i]

						if animUV ~= nil then
							animUV:SetAutoPlay(false)
						end
					end
				end

				if self.vfxFireAnim ~= nil then
					self.vfxFireAnim:Play("elevator_fire_clear", 0, 0)
				end

				if self.tfAuido ~= nil then
					for i = 0, self.tfAuido.childCount - 1 do
						local tf = self.tfAuido:GetChild(i)

						if StringHelper.StartsWith(tf.name, "main") then
							AudioCtrl.SetObjectAudio("Object/scene/elevator/elevator_run_" .. self.elevatorType, tf, self.id .. i, "elevatorIndex", 1)

							if self.floor > self.lastFloor then
								AudioCtrl.SetObjectAudio("Object/scene/elevator/elevator_up_" .. self.elevatorType, tf, self.id .. i)
							else
								AudioCtrl.SetObjectAudio("Object/scene/elevator/elevator_down_" .. self.elevatorType, tf, self.id .. i)
							end
						end
					end
				end
			end

			local bottom = self.animator:GetFloat("bottom")

			if bottom == 1 or bottom == 2 then
				local hostPlayer = self.sceneController:GetHostPlayer()

				if hostPlayer ~= nil and hostPlayer:IsWillDead() == false and hostPlayer:IsShow() == true then
					local groundType, zoneType, zoneId = hostPlayer:GetTouchGroundDataSimple()

					if zoneType == SceneBase.ZoneType.ZoneElevatorBottom and zoneId == self.id * 10 + bottom then
						hostPlayer:GetValue():SetPropertyToZero(MS_HeroData.Property.Hp)
						hostPlayer:HitElevator()
					end
				end
			end
		end
	end

	if self.itemScene ~= nil and self.tfItem ~= nil then
		self.itemScene:SetPosition(self.tfItem.position)
	end

	if self.moveGround ~= nil then
		local pos = self.moveGround.position

		self.moveGroundDeltaY = pos.y - self.moveGroundLastY
		self.moveGroundLastY = pos.y
	end
end

function Elevator:GetMoveGroundDeltaY()
	return self.moveGroundDeltaY
end

function Elevator:Exit()
	self.tfSelf = nil
	self.animator = nil
	self.stateInfo = nil
	self.tfAuido = nil
	self.animationUVList = nil
	self.elevatorData = nil
	self.itemScene = nil
	self.vfxFireAnim = nil
end

return Elevator
