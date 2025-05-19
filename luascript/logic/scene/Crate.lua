-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Crate.lua

Crate = class("Crate")
Crate.static.Status = {
	Open = 2,
	Unlock = 4,
	Close = 1,
	Lock = 3,
	Empty = 0
}
Crate.static.Type = {
	Common = 0,
	Maze = 1
}
Crate.static.VfxLockName = "vfx_maze_crate"

function Crate:initialize(id, type, transform)
	self.tfSelf = transform
	self.id = id
	self.animator = self.tfSelf:GetComponent("Animator")
	self.vfxLock = nil
	self.type = type
	self.position = self.tfSelf.position
	self.rotation = self.tfSelf.rotation
	self.standPosition = self.position:Clone()
	self.forward = Vector3.forward

	self.forward:MulQuat(self.rotation)

	self.mazeCrate = nil
	self.locatorData = nil
	self.monsterList = {}
	self.showFlg = true
	self.isOpening = false

	if self.type == Crate.Type.Common then
		self.locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Crate, self.id)

		if self.locatorData ~= nil then
			self.standPosition:SetVector3(self.locatorData.StandPosition)
			self.forward:SetVector3(self.locatorData.Orientation)
		end
	end
end

function Crate:SetFocus(flg)
	if flg == true then
		local status = FS_UserData.story:GetCrateStatus(self.id)

		self.isOpening = false

		if status == Crate.Status.Open then
			self.isOpening = true

			self.animator:SetInteger("trigger", Crate.Status.Open)
		elseif status == Crate.Status.Close then
			self.animator:SetInteger("trigger", Crate.Status.Close)
		elseif status == Crate.Status.Lock then
			self.animator:SetInteger("trigger", Crate.Status.Close)
		elseif status == Crate.Status.Unlock then
			self.animator:SetInteger("trigger", Crate.Status.Close)
		else
			SystemHelper.LogError("=========Crate Status Error!!")
		end
	end
end

function Crate:GetType()
	return self.type
end

function Crate:GetStatus()
	return FS_UserData.story:GetCrateStatus(self.id)
end

function Crate:GetMazeData()
	return self.mazeCrate
end

function Crate:SetMazeData(locatorId, crateIndex)
	if self.type == Crate.Type.Maze then
		self.mazeCrate = MS_StoryMazeCrate.GetMazeCrateData(FS_UserData.story:GetMazeLevel(), self.id, crateIndex)
		self.locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Crate, locatorId)

		if DLC_Maze == true and self.locatorData ~= nil then
			FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Crate][3] = locatorId

			FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Crate][4]:SetVector3(self.locatorData.Position)
		end
	end
end

function Crate:DebugRefresh(locatorId)
	if self.type == Crate.Type.Maze and self.showFlg == true then
		FS_UserData.story:SetCrateStatus(self.id, Crate.Status.Close)
		self.animator:SetInteger("trigger", Crate.Status.Close)

		self.isOpening = false

		if self.vfxLock ~= nil then
			self.vfxLock:Clear()

			self.vfxLock = nil
		end

		self.locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Crate, locatorId)

		if self.monsterList ~= nil then
			local gameController = ST_Main.GetSceneController():GetGameController()

			for monsterId, v in pairs(self.monsterList) do
				if gameController ~= nil then
					gameController:DestroyMonster(monsterId)
				end
			end

			self.monsterList = {}
		end

		self:Show()
	end
end

function Crate:OpenCrate()
	local status = FS_UserData.story:GetCrateStatus(self.id)

	if self.type == Crate.Type.Common then
		if status == Crate.Status.Close then
			self.animator:SetInteger("trigger", Crate.Status.Open)
			FS_UserData.story:SetCrateStatus(self.id, Crate.Status.Open)

			self.isOpening = true

			AudioCtrl.SetObjectAudio("Object/scene/treasure_open", self.tfSelf, self.id)
		end
	elseif self.type == Crate.Type.Maze then
		if status == Crate.Status.Close then
			FS_UserData.story:SetCrateStatus(self.id, Crate.Status.Lock)

			if self.vfxLock == nil then
				self.vfxLock = VfxManager.PlayBindMulti(self.tfSelf, Crate.VfxLockName)

				if self.vfxLock ~= nil then
					self.vfxLock:SetDelayClear(true, nil)
				end
			end
		elseif status == Crate.Status.Unlock then
			self.animator:SetInteger("trigger", Crate.Status.Open)
			FS_UserData.story:SetCrateStatus(self.id, Crate.Status.Open)

			self.isOpening = true

			AudioCtrl.SetObjectAudio("Object/scene/treasure_open", self.tfSelf, self.id)
		end
	end
end

function Crate:UnlockCrate()
	if self.type == Crate.Type.Maze then
		local status = FS_UserData.story:GetCrateStatus(self.id)

		if status == Crate.Status.Lock then
			FS_UserData.story:SetCrateStatus(self.id, Crate.Status.Unlock)

			if self.vfxLock ~= nil then
				self.vfxLock:Clear()

				self.vfxLock = nil
			end
		end
	end
end

function Crate:IsOpening()
	return self.isOpening
end

function Crate:IsShow()
	return self.showFlg
end

function Crate:IsLocking()
	if self.type == Crate.Type.Maze then
		local status = FS_UserData.story:GetCrateStatus(self.id)

		if status == Crate.Status.Lock then
			return true
		end
	end

	return false
end

function Crate:Show()
	if self.locatorData == nil then
		return
	end

	self.position:SetVector3(self.locatorData.Position)
	self.forward:SetVector3(self.locatorData.Orientation)
	self.standPosition:SetVector3(self.locatorData.StandPosition)

	local rot = Quaternion.LookRotation(self.forward)

	self.rotation:SetQuaternion(rot)

	rot = nil

	if self.tfSelf ~= nil then
		self.tfSelf.position = self.position
		self.tfSelf.rotation = self.rotation

		self.tfSelf.gameObject:SetActive(true)

		self.showFlg = true
	end

	local status = FS_UserData.story:GetCrateStatus(self.id)

	if status == Crate.Status.Lock then
		if self.vfxLock == nil then
			self.vfxLock = VfxManager.PlayBindMulti(self.tfSelf, Crate.VfxLockName)

			if self.vfxLock ~= nil then
				self.vfxLock:SetDelayClear(true, nil)
			end
		end
	elseif self.vfxLock ~= nil then
		self.vfxLock:Clear()

		self.vfxLock = nil
	end
end

function Crate:Hide()
	if self.tfSelf ~= nil then
		self.tfSelf.gameObject:SetActive(false)

		self.showFlg = false
	end

	if self.vfxLock ~= nil then
		self.vfxLock:Clear()

		self.vfxLock = nil
	end
end

function Crate:GetPosition()
	return self.position
end

function Crate:GetForward()
	return self.forward
end

function Crate:GetRotation()
	return self.rotation
end

function Crate:GetStandPosition()
	return self.standPosition
end

function Crate:AddMonster(monsterId)
	if self.monsterList ~= nil and self.monsterList[monsterId] == nil then
		self.monsterList[monsterId] = 1
	end
end

function Crate:GetMonster()
	return self.monsterList
end

function Crate:Update()
	return
end

function Crate:Exit()
	if self.vfxLock ~= nil then
		self.vfxLock:Clear()

		self.vfxLock = nil
	end

	self.tfSelf = nil
	self.position = nil
	self.standPosition = nil
	self.rotation = nil
	self.forward = nil
	self.animator = nil
	self.monsterList = nil
	self.mazeCrate = nil
	self.locatorData = nil
end

return Crate
