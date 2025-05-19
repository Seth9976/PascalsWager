-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10048.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10048_Define")

TrickGroup10048 = class("TrickGroup10048", TrickGroupBase)
TrickGroup10048.static.Status = {
	Down = 3,
	Up = 1,
	Trace = 2,
	Attack = 4,
	clear = 5,
	Empty = 0
}

function TrickGroup10048:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Down
	self.playMode = TrickGroupBase.PlayMode.Single
	self.trickActive = nil
	self.trickStatus = TrickGroup10048.Status.Empty
	self.trickTargetId = 0
	self.trickDir = Vector3.forward
	self.explodTime = 0
	self.shellList = {}
	self.swordList = {}
	self.wallList = {}
	self.controllerShell = self.sceneController:GetControllerShell()
end

function TrickGroup10048:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	self.trickStatus = TrickGroup10048.Status.Up
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

		local wallRoot = tfModel:Find("wall_group/opaque_group")

		if wallRoot ~= nil then
			for i = 0, wallRoot.childCount - 1 do
				local _tf = wallRoot:GetChild(i)

				if _tf ~= nil then
					_tf.gameObject:SetActive(true)
					table.insert(self.wallList, _tf)
				end
			end
		end

		self.trickActive:SetUseCast(true)
		self.trickActive:OpenCollider()

		local target = self.sceneController:GetHostPlayer()

		if target ~= nil then
			local dir = target:GetAimPosition() - pos

			dir.y = 0

			self.trickDir:SetVector3(dir)
			self.trickDir:SetNormalize()

			self.trickTargetId = target:GetAnimalId()
		end

		self:Start()

		return true
	end

	return false
end

function TrickGroup10048:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickActive == nil or self.trickTargetId <= 0 then
		self:Stop()

		return
	end

	if self.trickStatus == TrickGroup10048.Status.Up then
		local stateInfo = self.trickActive.animator:GetCurrentAnimatorStateInfo(0)

		if stateInfo:IsName(TrickGroup10048_Define.TraceAnimName) then
			self.trickStatus = TrickGroup10048.Status.Trace
			self.startTraceTime = TimeHelper.getNowTime()
		end
	elseif self.trickStatus == TrickGroup10048.Status.Trace then
		local targetAnimal = self.sceneController:FindPlayerById(self.trickTargetId)

		if targetAnimal ~= nil then
			local targetPos = Vector3.zero

			targetPos:SetVector3(targetAnimal:GetAimPosition())

			local trickPos = self.trickActive:GetPosition()

			if targetAnimal:IsDead() == false and targetAnimal:IsShow() == true then
				local nowTime = TimeHelper.getNowTime()

				if nowTime > self.startTraceTime + TrickGroup10048_Define.TraceLifeTime then
					local TracePos = Vector3.zero

					TracePos:SetVector3(targetPos)

					TracePos.y = trickPos.y

					self.trickActive:SetPosition(TracePos)

					local tmpDis = Vector3.Distance2DSquare(targetPos, trickPos)

					if tmpDis < TrickGroup10048_Define.TraceDistance * TrickGroup10048_Define.TraceDistance then
						self.trickActive:SetParamTrigger(TrickGroup10048_Define.AnimParam)

						if self.swordList ~= nil then
							for k, v in pairs(self.swordList) do
								local shellId = self.controllerShell:CreateShell(v.transform, 0, 2, TrickGroup10048_Define.ShellId, ControllerShell.ShellShape.Capsule)
								local shell = self.controllerShell:GetShell(shellId)

								if shell ~= nil then
									table.insert(self.shellList, shell)
								end
							end
						end

						self.trickStatus = TrickGroup10048.Status.Down
						self.startAttackTime = TimeHelper.getNowTime()

						return
					end
				end

				local relative = targetPos - trickPos

				relative.y = 0

				local tmpSpeed = TrickGroup10048_Define.TraceSpeed * ControllerMain.GetLogicDeltaTime()

				if tmpSpeed < relative.sqrMagnitude then
					relative:SetNormalize()

					local angle = Vector3.Angle(self.trickDir, relative)
					local tmpAngleSpeed = TrickGroup10048_Define.TraceAngleSpeed * ControllerMain.GetLogicDeltaTime()

					if tmpAngleSpeed < angle then
						local axis = Vector3.Cross(self.trickDir, relative)
						local rot = Quaternion.AngleAxis(tmpAngleSpeed, axis)

						relative:SetVector3(self.trickDir)
						relative:MulQuat(rot)
						relative:SetNormalize()

						rot = nil
						axis = nil
					end

					self.trickDir:SetVector3(relative)
					relative:Mul(tmpSpeed)
					relative:Add(trickPos)
					self.trickActive:SetPosition(relative)
				else
					local TracePos = Vector3.zero

					TracePos:SetVector3(targetPos)

					TracePos.y = trickPos.y

					self.trickActive:SetPosition(TracePos)
				end
			else
				local tmpSpeed = TrickGroup10048_Define.TraceSpeed * ControllerMain.GetLogicDeltaTime()
				local relative = self.trickDir:Clone()

				relative:SetNormalize()
				relative:Mul(tmpSpeed)
				relative:Add(trickPos)
				self.trickActive:SetPosition(relative)

				relative = nil
			end
		end
	elseif self.trickStatus == TrickGroup10048.Status.Down then
		local nowTime = TimeHelper.getNowTime()

		if nowTime > self.startAttackTime + TrickGroup10048_Define.DelayAttackTime then
			self.trickActive:SetParamTrigger(TrickGroup10048_Define.AnimParam)

			self.trickStatus = TrickGroup10048.Status.Attack
			self.startAttackTime = TimeHelper.getNowTime()
		end
	elseif self.trickStatus == TrickGroup10048.Status.Attack then
		local nowTime = TimeHelper.getNowTime()

		if nowTime > self.startAttackTime + TrickGroup10048_Define.ClearSwordTime then
			for k, v in pairs(self.swordList) do
				local sword = v

				if sword ~= nil then
					local vfxSword = sword:Find(TrickGroup10048_Define.VfxName_Sword)

					if vfxSword ~= nil then
						local animator = vfxSword:GetComponent("Animator")

						if animator ~= nil then
							animator:SetTrigger(TrickGroup10048_Define.AnimParam)
						end
					end

					local vfxTrail = sword:Find(TrickGroup10048_Define.VfxName_Trail)

					if vfxTrail ~= nil then
						local animator = vfxTrail:GetComponent("Animator")

						if animator ~= nil then
							animator:SetTrigger(TrickGroup10048_Define.AnimParam)
						end
					end
				end
			end

			self.trickStatus = TrickGroup10048.Status.Clear
		end
	end

	if self.trickStatus == TrickGroup10048.Status.Down or self.trickStatus == TrickGroup10048.Status.Attack then
		for k, v in pairs(self.shellList) do
			local shell = v

			if shell ~= nil and shell:IsWillDead() == true then
				local shellId = shell:GetShellId()

				GoDestroyImmediate(shell.tfSelf.gameObject)
				self.controllerShell:RemoveShell(shellId)

				self.shellList[k] = nil

				local sword = self.swordList[k]

				if sword ~= nil then
					local vfxSword = sword:Find(TrickGroup10048_Define.VfxName_Sword)

					if vfxSword ~= nil then
						local animator = vfxSword:GetComponent("Animator")

						if animator ~= nil then
							animator:SetTrigger(TrickGroup10048_Define.AnimParam)
						end
					end

					local vfxTrail = sword:Find(TrickGroup10048_Define.VfxName_Trail)

					if vfxTrail ~= nil then
						local animator = vfxTrail:GetComponent("Animator")

						if animator ~= nil then
							animator:SetTrigger(TrickGroup10048_Define.AnimParam)
						end
					end

					local lastIndex = k + 1

					if lastIndex > #self.swordList then
						lastIndex = 1
					end

					local sword_last = self.swordList[lastIndex]

					if sword_last ~= nil then
						local vfxTrail = sword_last:Find(TrickGroup10048_Define.VfxName_Trail)

						if vfxTrail ~= nil then
							local animator = vfxTrail:GetComponent("Animator")

							if animator ~= nil then
								animator:SetTrigger(TrickGroup10048_Define.AnimParam)
							end
						end
					end
				end

				local wall = self.wallList[k]

				if wall ~= nil then
					wall.gameObject:SetActive(false)
				end
			end
		end
	end
end

function TrickGroup10048:Stop()
	if self.sceneController ~= nil then
		for k, v in pairs(self.shellList) do
			local shell = v

			if shell ~= nil then
				local shellId = shell:GetShellId()

				GoDestroyImmediate(shell.tfSelf.gameObject)
				self.controllerShell:RemoveShell(shellId)

				self.shellList[k] = nil
			end
		end

		self.shellList = {}
		self.swordList = {}
		self.wallList = {}
	end

	self.trickActive = nil
	self.trickTargetId = 0

	TrickGroupBase.Stop(self)
end

function TrickGroup10048:Exit()
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
	self.wallList = nil

	TrickGroupBase.Exit(self)
end

return TrickGroup10048
