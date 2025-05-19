-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10057.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10057_Define")

TrickGroup10057 = class("TrickGroup10057", TrickGroupBase)

function TrickGroup10057:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.None
	self.hitType = AnimalBase_Define.HitType.None
	self.playMode = TrickGroupBase.PlayMode.AutoLoop
	self.trickActive = nil
	self.shellList = {}
	self.swordList = {}
	self.tfWall = {}
	self.gameController = nil
end

function TrickGroup10057:OpenAuto()
	TrickGroupBase.OpenAuto(self)

	self.gameController = self.sceneController:GetGameController()

	self:SetDelayClear(1, true)
	self:OpenDelay(TrickGroup10057_Define.DelayTime)
end

function TrickGroup10057:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	self.trickActive = self:OpenTrickSingle(pos, rot)

	if self.trickActive ~= nil then
		local tfModel = self.trickActive:GetTrickModel()
		local tfs = tfModel:GetComponentsInChildren(typeof("UnityEngine.Transform"), true)
		local len = tfs.Length

		for i = 0, len - 1 do
			local _tf = tfs[i]
			local childName = _tf.name

			if StringHelper.StartsWith(childName, "sword") == true then
				table.insert(self.swordList, _tf)
			end
		end

		if self.swordList ~= nil then
			for k, v in pairs(self.swordList) do
				local shellId = self.controllerShell:CreateShell(v.transform, 0, 2, TrickGroup10057_Define.ShellId, ControllerShell.ShellShape.Capsule)
				local shell = self.controllerShell:GetShell(shellId)

				if shell ~= nil then
					table.insert(self.shellList, shell)
				end
			end
		end

		self.tfWall = tfModel:Find("wall_group")

		self:Start()

		return true
	end

	return false
end

function TrickGroup10057:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickActive == nil then
		self:Stop()

		return
	end

	for k, v in pairs(self.shellList) do
		local shell = v

		if shell ~= nil and shell:IsWillDead() == true then
			for i, shell in pairs(self.shellList) do
				local shellId = shell:GetShellId()

				self.shellList[i] = nil

				GoDestroyImmediate(shell.tfSelf.gameObject)
				self.controllerShell:RemoveShell(shellId)
			end

			self.tfWall.gameObject:SetActive(false)
			self.trickActive:StopDelay()
			self.trickActive:SetUsed(true)

			local trickData = MS_TrickData.GetTrickData(self.trickActive.trickId)

			if trickData ~= nil and self.gameController ~= nil then
				self.gameController:CompleteQuest(trickData.CompleteQuestId)
			end
		end
	end
end

function TrickGroup10057:Stop()
	if self.sceneController ~= nil then
		for k, v in pairs(self.shellList) do
			local shell = v

			if shell ~= nil then
				local shellId = shell:GetShellId()

				GoDestroyImmediate(shell.tfSelf.gameObject)
				self.controllerShell:RemoveShell(shellId)
			end
		end

		self.shellList = {}
		self.swordList = {}
		self.tfWall = nil
	end

	self.trickActive = nil
	self.trickTargetId = 0

	TrickGroupBase.Stop(self)
end

function TrickGroup10057:Exit()
	self.trickActive = nil
	self.trickDir = nil
	self.trickTargetId = 0

	for k, v in pairs(self.shellList) do
		local shell = v

		if shell ~= nil then
			local shellId = shell:GetShellId()

			self.controllerShell:RemoveShell(shellId)
		end
	end

	self.shellList = nil
	self.swordList = nil
	self.tfWall = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10057
