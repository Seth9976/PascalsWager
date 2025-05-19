-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Honeypot.lua

Honeypot = class("Honeypot")
Honeypot.static.VfxName = "vfx_maze_honeypot"
Honeypot.static.VfxOpenName = "vfx_maze_honeypot_open"
Honeypot.static.VfxAppearName = "vfx_maze_honeypot_appear"
Honeypot.static.Status = {
	Open = 1,
	Close = 2,
	Empty = 0
}
Honeypot.static.Radius = 0.8

function Honeypot:initialize(id, transform)
	self.id = id
	self.tfSelf = transform
	self.position = Vector3.zero
	self.vfxStatus = nil
	self.vfxOpen = nil
	self.showFlg = false
	self.isOpening = false
	self.heroId = 0
	self.heroType = ControllerStoryMode.CallHeroType.Friend
end

function Honeypot:IsOpening()
	return self.isOpening
end

function Honeypot:IsShow()
	return self.showFlg
end

function Honeypot:TouchHoneypot()
	local status = FS_UserData.story:GetHoneypotStatus(self.id)

	if status == Honeypot.Status.Open then
		if self.vfxStatus ~= nil then
			self.vfxStatus:Clear()

			self.vfxStatus = nil
		end

		if self.vfxOpen == nil then
			self.vfxOpen = VfxManager.PlayBindMulti(self.tfSelf, Honeypot.VfxOpenName)
		end

		AudioCtrl.SetObjectAudio("Object/scene/honeypot", self.tfSelf, self.id)
	end
end

function Honeypot:TouchHoneypotAfter()
	local status = FS_UserData.story:GetHoneypotStatus(self.id)

	if status == Honeypot.Status.Open then
		FS_UserData.story:SetHoneypotStatus(self.id, Honeypot.Status.Close)

		self.isOpening = false

		if self.vfxStatus ~= nil then
			self.vfxStatus:Clear()

			self.vfxStatus = nil
		end
	end
end

function Honeypot:SetHeroData(heroId, heroType)
	if heroId > 0 then
		self.heroId = heroId
		self.heroType = heroType
	end
end

function Honeypot:GetHeroData()
	return self.heroId, self.heroType
end

function Honeypot:DebugRefresh(pos)
	if self.showFlg == true then
		FS_UserData.story:SetHoneypotStatus(self.id, Honeypot.Status.Open)

		if self.vfxStatus ~= nil then
			self.vfxStatus:Clear()

			self.vfxStatus = nil
		end

		self:Show(pos)

		local hostPlayer = ST_Main.GetSceneController():GetHostPlayer()

		if hostPlayer ~= nil then
			hostPlayer:ClearStatusByType(MS_StatusData.LogicType.CallHero)
		end

		local gameController = ST_Main.GetSceneController():GetGameController()

		if gameController ~= nil then
			gameController:DestroyCallHero(true)
		end
	end
end

function Honeypot:Show(pos)
	self.position:SetVector3(pos)

	if self.tfSelf ~= nil then
		self.tfSelf.position = pos

		self.tfSelf.gameObject:SetActive(true)

		self.showFlg = true
	end

	local status = FS_UserData.story:GetHoneypotStatus(self.id)

	if status == Honeypot.Status.Open then
		self.isOpening = true

		if self.vfxStatus == nil then
			self.vfxStatus = VfxManager.PlayBindMulti(self.tfSelf, Honeypot.VfxName)

			if self.vfxStatus ~= nil then
				self.vfxStatus:SetDelayClear(true, nil)
			end
		end

		AudioCtrl.SetObjectAudio("Object/scene/honeypot", self.tfSelf, self.id)
	else
		self.isOpening = false

		if self.vfxStatus ~= nil then
			self.vfxStatus:Clear()

			self.vfxStatus = nil
		end

		AudioCtrl.StopObjectAudio("Object/scene/honeypot", self.id)
	end
end

function Honeypot:Hide()
	if self.tfSelf ~= nil then
		self.tfSelf.gameObject:SetActive(false)

		self.showFlg = false
	end

	if self.vfxStatus ~= nil then
		self.vfxStatus:Clear()

		self.vfxStatus = nil
	end

	AudioCtrl.StopObjectAudio("Object/scene/honeypot", self.id)
end

function Honeypot:GetPosition()
	return self.position
end

function Honeypot:Exit()
	if self.vfxStatus ~= nil then
		self.vfxStatus:Clear()

		self.vfxStatus = nil
	end

	if self.vfxOpen ~= nil then
		self.vfxOpen:Clear()

		self.vfxOpen = nil
	end

	self.position = nil
	self.tfSelf = nil

	AudioCtrl.StopObjectAudio("Object/scene/honeypot", self.id)
end

return Honeypot
