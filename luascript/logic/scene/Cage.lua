-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Cage.lua

Cage = class("Cage")

function Cage:initialize(id, transform)
	self.tfSelf = transform
	self.id = id
	self.statusData = FS_UserData.story:GetCageStatus(id)
	self.statusDataTemp = SystemHelper.DeepCopy(self.statusData)
	self.toAnimatorTimes = {
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.animatorSpeed = {
		1,
		1,
		1,
		1,
		1,
		1
	}
	self.statusMax = {
		2,
		2,
		4,
		2,
		2,
		4
	}
	self.gearAnimator = {}
	self.gearAnimator[1] = self.tfSelf:Find("Arena10010_Gear_02"):GetComponent("Animator")
	self.gearAnimator[4] = self.tfSelf:Find("Arena10010_Gear_05"):GetComponent("Animator")
	self.gearAnimatorMain = self.tfSelf:Find("Arena10010_Gear_01"):GetComponent("Animator")
	self.cageAnimator = {}
	self.cageAnimator[1] = self.tfSelf:Find("Arena10010_ironcage_0" .. 1):GetComponent("Animator")
	self.cageAnimator[5] = self.tfSelf:Find("Arena10010_ironcage_0" .. 5):GetComponent("Animator")
	self.cageAnimator[4] = self.tfSelf:Find("Arena10010_ironcage_0" .. 2):GetComponent("Animator")
	self.isRunning = false
	self.tfAuido = {}
	self.tfAuido[1] = self.tfSelf:Find("Arena10010_ironcage_01/visible/audio")
	self.tfAuido[2] = self.tfSelf:Find("Arena10010_ironcage_02/visible/audio")
	self.tfAuido[5] = self.tfSelf:Find("Arena10010_ironcage_05/visible/audio")
	self.tfAuidoTrigger = {}
	self.tfAuidoTrigger[1] = self.tfSelf:Find("Arena10010_Gear_02/visible/audio")
	self.tfAuidoTrigger[4] = self.tfSelf:Find("Arena10010_Gear_05/visible/audio")
end

function Cage:SetFocus(flg)
	if flg == true then
		self.cageAnimator[1]:SetInteger("trigger", self.statusData[1])
		self.cageAnimator[5]:SetInteger("trigger", self.statusData[5])
		self.cageAnimator[4]:SetInteger("trigger", self.statusData[4])
	end
end

function Cage:SetTriggerAudio(switchIndex)
	if self.tfAuidoTrigger[switchIndex] ~= nil then
		AudioCtrl.SetObjectAudio("Object/other/trigger", self.tfAuidoTrigger[switchIndex], self.id)
	end
end

function Cage:Call(switchIndex, gameController)
	if self.isRunning == true then
		return false
	end

	self.gameController = gameController

	self.gearAnimator[switchIndex]:SetTrigger("trigger")
	self.gearAnimatorMain:SetTrigger("trigger")

	self.switchIndex = switchIndex

	if switchIndex == 1 then
		self.toAnimatorTimes[1] = 1
	elseif switchIndex == 4 then
		self.toAnimatorTimes[5] = 1
	end

	for i = 1, 6 do
		local m = MathHelper.Mod(self.statusData[i] + self.toAnimatorTimes[i], self.statusMax[i])

		if m == 0 then
			self.statusData[i] = self.statusMax[i]
		else
			self.statusData[i] = m
		end
	end

	if self.statusData[1] == 2 then
		self.statusData[4] = 2
	else
		self.statusData[4] = 1
	end

	FS_UserData.story:SetCageStatus(self.id, self.statusData)

	self.isRunning = true

	return true
end

function Cage:Update()
	if self.isRunning == true then
		local over = true
		local finish = true

		for i = 1, 6 do
			if i == 1 or i == 5 then
				local stateInfo = self.cageAnimator[i]:GetCurrentAnimatorStateInfo(0)

				if self.toAnimatorTimes[i] > 0 then
					if stateInfo:IsName("state_" .. self.statusDataTemp[i]) then
						self.statusDataTemp[i] = self.statusDataTemp[i] + 1

						if self.statusDataTemp[i] > self.statusMax[i] then
							self.statusDataTemp[i] = self.statusDataTemp[i] - self.statusMax[i]
						end

						self.toAnimatorTimes[i] = self.toAnimatorTimes[i] - 1

						self.gearAnimatorMain:SetTrigger("trigger")

						self.cageAnimator[i].speed = self.animatorSpeed[i]

						self.cageAnimator[i]:SetInteger("trigger", self.statusDataTemp[i])

						if self.tfAuido[i] ~= nil then
							AudioCtrl.SetObjectAudio("Object/scene/cage/cage", self.tfAuido[i], self.id, "cageIndex", 0)
						end
					end

					over = false
				end

				if not stateInfo:IsName("state_" .. self.statusData[i]) then
					over = false
				end
			end
		end

		if over then
			if self.switchIndex == 4 and self.tfAuido[5] ~= nil then
				AudioCtrl.SetObjectAudio("Object/scene/cage/cage", self.tfAuido[5], self.id, "cageIndex", 1)
			end

			local stateInfo = self.cageAnimator[4]:GetCurrentAnimatorStateInfo(0)

			if stateInfo:IsName("state_" .. self.statusData[4]) then
				finish = true
			else
				finish = false

				if self.statusDataTemp[4] ~= self.statusData[4] then
					if self.switchIndex == 1 then
						if self.tfAuido[1] ~= nil then
							AudioCtrl.SetObjectAudio("Object/scene/cage/cage", self.tfAuido[1], self.id, "cageIndex", 1)
						end

						if self.tfAuido[2] ~= nil then
							AudioCtrl.SetObjectAudio("Object/scene/cage/cage", self.tfAuido[2], self.id, "cageIndex", 0)
						end
					end

					self.statusDataTemp[4] = self.statusData[4]

					self.gearAnimatorMain:SetTrigger("trigger")
					self.cageAnimator[4]:SetInteger("trigger", self.statusData[4])

					if self.gameController then
						self.gameController:StartSceneCamera(MS_SceneData.LocatorType.Cage, self.id, 99)
					end
				end
			end

			if finish then
				if self.switchIndex == 1 and self.tfAuido[2] ~= nil then
					AudioCtrl.SetObjectAudio("Object/scene/cage/cage", self.tfAuido[2], self.id, "cageIndex", 1)
				end

				if self.gameController then
					self.gameController:ExitSceneCamera()
					self.gameController:ChangeStatus(ControllerStoryMode.Status.Normal)

					self.gameController = nil
				end

				self.isRunning = false
			end
		end
	end
end

function Cage:IsRunning()
	return self.isRunning
end

function Cage:Exit()
	self.tfSelf = nil
	self.statusData = nil
	self.statusMax = nil
	self.statusDataTemp = nil
	self.toAnimatorTimes = nil
	self.gameController = nil
	self.gearAnimator = nil
	self.animatorSpeed = nil
	self.gearAnimatorMain = nil
	self.cageAnimator = nil
end

return Cage
