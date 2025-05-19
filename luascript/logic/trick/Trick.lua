-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/Trick.lua

Trick = class("Trick")
Trick.static.EffectConfig = {
	DelayClear = 2,
	DefaultPlay = 1
}
Trick.static.Step = {
	End = 4,
	Loop = 3,
	Ready = 1,
	Start = 2,
	Wait = 0
}

function Trick:initialize(scene, trickId, trickTf)
	self.trickId = trickId
	self.tfSelf = trickTf
	self.scene = scene
	self.trickPosition = Vector3.zero

	self.trickPosition:SetVector3(trickTf.position)

	self.trickRotation = Quaternion.identity

	self.trickRotation:SetQuaternion(trickTf.rotation)

	self.trickForward = Vector3.forward

	self.trickForward:MulQuat(self.trickRotation)

	self.trickData = MS_TrickData.GetTrickData(self.trickId)
	self.hostTeamId = self.trickData.HostTeamId
	self.targetType = self.trickData.TargetType
	self.tfModel = self.tfSelf:Find("trick_root")
	self.animator = self.tfModel:GetComponent("Animator")
	self.animatorTimeOld = 0
	self.animatorTime = 0
	self.animatorLoopCnt = 0
	self.animatorLoopCntLast = 0
	self.tfAttackBoxList = {}
	self.attackBoxList = {}
	self.attackBoxPosList = {}
	self.attackBoxRotList = {}
	self.attackBoxOpen = true
	self.effectList = {}
	self.effectConfig = {}
	self.effectRoot = {}

	local tfs = self.tfModel:GetComponentsInChildren(typeof("UnityEngine.Transform"), true)
	local len = tfs.Length
	local attackBoxName = "attackBox"
	local vfxBoxName = "vfxBox"

	for i = 0, len - 1 do
		local _tf = tfs[i]
		local childName = _tf.name

		if StringHelper.StartsWith(childName, attackBoxName) == true then
			local tmpCube = XCube.CreateXCube(self.tfSelf.name, _tf, XCube.ShapeType.Cube, XCube.ColliderType.OtherBox)

			if tmpCube ~= nil then
				table.insert(self.attackBoxList, tmpCube)
			end

			local render = _tf.gameObject:GetComponent(typeof("UnityEngine.MeshRenderer"))

			if render ~= nil then
				render.enabled = false
			end

			table.insert(self.tfAttackBoxList, _tf)
		elseif StringHelper.StartsWith(childName, vfxBoxName) == true then
			local boxNames = StringHelper.Split(childName, "_")
			local effectIndex = tonumber(boxNames[2])
			local _len = _tf.childCount

			for j = 0, _len - 1 do
				local _tf_child = _tf:GetChild(j)

				if _tf_child ~= nil then
					local vfx = _tf_child.gameObject:GetComponent(typeof(XEffect))

					if vfx == nil then
						vfx = _tf_child.gameObject:AddComponent(typeof(XEffect))
					end

					if vfx ~= nil then
						vfx:Init(true)

						if self.effectList[effectIndex] == nil then
							self.effectList[effectIndex] = {}
						end

						table.insert(self.effectList[effectIndex], vfx)
					end
				end
			end

			if self.effectConfig[effectIndex] == nil then
				self.effectConfig[effectIndex] = {}
				self.effectConfig[effectIndex][Trick.EffectConfig.DefaultPlay] = true
				self.effectConfig[effectIndex][Trick.EffectConfig.DelayClear] = false
			end

			if self.effectRoot[effectIndex] == nil then
				self.effectRoot[effectIndex] = _tf

				self.effectRoot[effectIndex].gameObject:SetActive(true)
			end
		end
	end

	self.isPlaying = false
	self.stopDelay = false

	self.tfSelf.gameObject:SetActive(false)

	self.sceneController = ST_Main.GetSceneController()
	self.hitAnimalList = nil
	self.hitShellList = nil
	self.damageType = AnimalBase_Define.DamageType.Instant
	self.hitType = AnimalBase_Define.HitType.Light
	self.useCast = false
	self.step = 0
	self.stepTime = 0
	self.stepTargetPos = Vector3.zero
	self.used = false
end

function Trick:GetTrickModel()
	return self.tfModel
end

function Trick:GetTrickId()
	return self.trickId
end

function Trick:GetTrickData()
	return self.trickData
end

function Trick:GetDamageType()
	return self.damageType
end

function Trick:SetDamageType(type)
	self.damageType = type
end

function Trick:GetHitType()
	return self.hitType
end

function Trick:SetHitType(type)
	self.hitType = type
end

function Trick:SetUsed(flg)
	self.used = flg
end

function Trick:IsUsed()
	return self.used
end

function Trick:SetUseCast(flg)
	self.useCast = flg
end

function Trick:SetStepAndTime(st, time)
	self.step = st
	self.stepTime = time
end

function Trick:GetStep()
	return self.step
end

function Trick:GetStepTime()
	return self.stepTime
end

function Trick:SetStepTargetPosition(pos)
	self.stepTargetPos:SetVector3(pos)
end

function Trick:GetStepTargetPosition()
	return self.stepTargetPos
end

function Trick:GetPosition()
	return self.trickPosition
end

function Trick:SetPosition(pos, diffX, diffZ)
	self.trickPosition:SetVector3(pos)

	if diffX ~= nil then
		self.trickPosition.x = self.trickPosition.x + diffX
	end

	if diffZ ~= nil then
		self.trickPosition.z = self.trickPosition.z + diffZ
	end

	self.tfSelf.position = pos
end

function Trick:SetRotation(rot)
	self.trickRotation:SetQuaternion(rot)
	self.trickForward:Set(0, 0, 1)
	self.trickForward:MulQuat(self.trickRotation)

	self.tfSelf.rotation = rot
end

function Trick:LookAt(look)
	if MathHelper.IsZero(look.sqrMagnitude) == false then
		local targetRot = Quaternion.LookRotation(look)

		self:SetRotation(targetRot)

		targetRot = nil
	end
end

function Trick:IsPlaying()
	return self.isPlaying
end

function Trick:PlayEffect(effIndex)
	if self.isPlaying == false then
		return
	end

	if self.tfSelf ~= nil and self.effectConfig ~= nil and self.effectList ~= nil and self.effectConfig[effIndex][Trick.EffectConfig.DefaultPlay] == false and self.effectList[effIndex] ~= nil then
		for i = 1, #self.effectList[effIndex] do
			local tmpEffect = self.effectList[effIndex][i]

			if tmpEffect ~= nil then
				tmpEffect:Play()
			end
		end
	end
end

function Trick:SetDelayClear(effIndex, flag)
	if self.tfSelf ~= nil and self.effectConfig ~= nil and self.effectList ~= nil then
		self.effectConfig[effIndex][Trick.EffectConfig.DelayClear] = flag
	end
end

function Trick:Play()
	if self.isPlaying == true then
		return
	end

	self.animatorTimeOld = 0
	self.animatorTime = 0
	self.animatorLoopCnt = 0
	self.animatorLoopCntLast = 0

	if self.tfSelf ~= nil then
		if self.effectRoot ~= nil then
			for effIndex, effRoot in pairs(self.effectRoot) do
				if effRoot ~= nil then
					effRoot.gameObject:SetActive(true)
				end
			end
		end

		self.tfSelf.gameObject:SetActive(true)

		self.isPlaying = true

		for effIndex, effGroup in pairs(self.effectList) do
			if self.effectConfig[effIndex][Trick.EffectConfig.DefaultPlay] == true then
				for i = 1, #effGroup do
					local tmpEffect = effGroup[i]

					if tmpEffect ~= nil then
						if self.effectConfig[effIndex][Trick.EffectConfig.DelayClear] == true then
							tmpEffect:SetDelayClear(true, nil)
						end

						tmpEffect:Play()
					end
				end
			end
		end

		if self.attackBoxOpen == true then
			for i = 1, #self.attackBoxList do
				local cube = self.attackBoxList[i]

				if cube ~= nil then
					cube:ShowTestCube()
				end
			end
		else
			for i = 1, #self.attackBoxList do
				local cube = self.attackBoxList[i]

				if cube ~= nil then
					cube:HideTestCube()
				end
			end
		end
	end
end

function Trick:StopDelay()
	if self.isPlaying == true then
		if self.effectList ~= nil then
			for effIndex, effGroup in pairs(self.effectList) do
				for i = 1, #effGroup do
					local tmpEffect = effGroup[i]

					if tmpEffect ~= nil then
						tmpEffect:Clear()
					end
				end
			end
		end

		self.stopDelay = true
	end
end

function Trick:Stop()
	if self.isPlaying == true then
		if self.effectList ~= nil then
			for effIndex, effGroup in pairs(self.effectList) do
				for i = 1, #effGroup do
					local tmpEffect = effGroup[i]

					if tmpEffect ~= nil then
						tmpEffect:ClearForce()
					end
				end
			end
		end

		if self.effectRoot ~= nil then
			for effIndex, effRoot in pairs(self.effectRoot) do
				if effRoot ~= nil then
					effRoot.gameObject:SetActive(true)
				end
			end
		end

		if self.tfSelf ~= nil then
			self.tfSelf.gameObject:SetActive(false)
		end

		self.isPlaying = false
		self.stopDelay = false

		for i = 1, #self.attackBoxList do
			local cube = self.attackBoxList[i]

			if cube ~= nil then
				cube:HideTestCube()
			end
		end

		self.attackBoxPosList = {}
		self.attackBoxRotList = {}

		self:ClearHitAnimal()
		self:ClearHitShell()
	end
end

function Trick:IsTriggerTime(time)
	if time >= self.animatorTimeOld and time < self.animatorTime then
		return true
	end

	return false
end

function Trick:GetTime()
	return self.animatorTime
end

function Trick:SetParamTrigger(key)
	if self.isPlaying == false then
		return
	end

	self.animator:SetTrigger(key)
end

function Trick:SetParamInteger(key, value)
	if self.isPlaying == false then
		return
	end

	self.animator:SetInteger(key, value)
end

function Trick:SetParamFloat(key, value)
	if self.isPlaying == false then
		return
	end

	self.animator:SetFloat(key, value)
end

function Trick:IsLoopEnd()
	if self.animatorLoopCnt > self.animatorLoopCntLast then
		return true
	end

	return false
end

function Trick:Update()
	if self.isPlaying == false then
		return false
	end

	local ret = false

	self.animatorTimeOld = self.animatorTime

	local stateInfo = self.animator:GetCurrentAnimatorStateInfo(0)

	if stateInfo == nil then
		return false
	end

	if self.stopDelay == true then
		if self.effectList ~= nil then
			for effIndex, effGroup in pairs(self.effectList) do
				if self.effectConfig[effIndex][Trick.EffectConfig.DelayClear] == true then
					for i = 1, #effGroup do
						local tmpEffect = effGroup[i]

						if tmpEffect:IsPlaying() == true then
							ret = true

							break
						end
					end
				end

				if ret == true then
					break
				end
			end
		end
	else
		if stateInfo.loop == true then
			self.animatorLoopCntLast = self.animatorLoopCnt

			local loopCnt = MathHelper.ToIntCut(stateInfo.normalizedTime)

			self.animatorTime = self.animatorTime - loopCnt

			if loopCnt > self.animatorLoopCnt then
				self.animatorLoopCnt = loopCnt
			end

			ret = true
		else
			self.animatorTime = Mathf.Min(1, stateInfo.normalizedTime)

			if self.animatorTime ~= self.animatorTimeOld or self.animatorTime < 1 then
				ret = true
			end
		end

		if ret == false and self.effectList ~= nil then
			for effIndex, effGroup in pairs(self.effectList) do
				for i = 1, #effGroup do
					local tmpEffect = effGroup[i]

					if tmpEffect:IsSinglePlaying() == true then
						ret = true

						break
					end
				end

				if ret == true then
					break
				end
			end
		end
	end

	if ret == true and self.attackBoxOpen == true then
		self:CheckCollider()

		if self.useCast == true and stateInfo.normalizedTime > 0 then
			local cnt = 1

			for i = 1, #self.attackBoxList do
				local cube = self.attackBoxList[i]

				if cube ~= nil then
					if self.attackBoxPosList[i] ~= nil and self.attackBoxRotList[i] ~= nil then
						self:CheckIntervalSpace(cube, self.attackBoxPosList[i], self.attackBoxRotList[i], cnt)

						cnt = cnt + 1

						self.attackBoxPosList[i]:SetVector3(cube:GetPositionInterpolation(1))
						self.attackBoxRotList[i]:SetQuaternion(cube:GetRotationInterpolation(1))
					else
						self.attackBoxPosList[i] = cube:GetPositionInterpolation(1):Clone()
						self.attackBoxRotList[i] = cube:GetRotationInterpolation(1):Clone()
					end
				end
			end

			self:CheckIntervalSpaceAfter()
		end
	end

	return ret
end

function Trick:LateUpdate()
	if self.isPlaying == false then
		return
	end

	for i = 1, #self.attackBoxList do
		local cube = self.attackBoxList[i]

		if cube ~= nil then
			cube:UpdateInfo(0)
		end
	end
end

function Trick:AddTrap(pos)
	if self.scene ~= nil and self.trickData ~= nil and self.trickData.TrapId > 0 then
		self.scene:AddTrap(self.trickData.TrapId, pos, nil, self.hostTeamId)
	end
end

function Trick:ClearHitAnimal()
	if self.hitAnimalList ~= nil then
		for animalId, v in pairs(self.hitAnimalList) do
			local hitAnimal = self.sceneController:FindPlayerById(animalId)

			if hitAnimal ~= nil then
				hitAnimal:DisableTrickTouch(self)
			end
		end
	end

	self.hitAnimalList = nil
end

function Trick:AddHitAnimal(animal)
	if animal ~= nil then
		local id = animal:GetAnimalId()

		if self.hitAnimalList == nil then
			self.hitAnimalList = {}
		end

		self.hitAnimalList[id] = 1
	end
end

function Trick:IsHaveHitAnimal(animal)
	if animal == nil then
		return false
	end

	local id = animal:GetAnimalId()

	if self.hitAnimalList ~= nil and self.hitAnimalList[id] ~= nil then
		return true
	end

	return false
end

function Trick:IsHitAnimal()
	if self.hitAnimalList ~= nil then
		for i, animal in pairs(self.hitAnimalList) do
			if animal ~= nil then
				return true
			end
		end
	end

	return false
end

function Trick:ClearHitShell()
	if self.hitShellList ~= nil then
		for shellId, v in pairs(self.hitShellList) do
			local hitShell = self.sceneController:FindShellById(shellId)

			if hitShell ~= nil then
				hitShell:DisableTrickTouch(self)
			end
		end
	end

	self.hitShellList = nil
end

function Trick:AddHitShell(hitShell)
	if hitShell ~= nil then
		local id = hitShell:GetShellId()

		if self.hitShellList == nil then
			self.hitShellList = {}
		end

		self.hitShellList[id] = 1
	end
end

function Trick:IsHaveHitShell(hitShell)
	if hitShell == nil then
		return false
	end

	local id = hitShell:GetShellId()

	if self.hitShellList ~= nil and self.hitShellList[id] ~= nil then
		return true
	end

	return false
end

function Trick:IsHitShell()
	if self.hitShellList ~= nil then
		for i, shell in pairs(self.hitShellList) do
			if shell ~= nil then
				return true
			end
		end
	end

	return false
end

function Trick:GetTargetList()
	if self.targetType == GameAI.SkillTargetType.Enemy then
		return self.sceneController:GetEnemyList(self.hostTeamId)
	elseif self.targetType == GameAI.SkillTargetType.Friend then
		return self.sceneController:GetTeamList(self.hostTeamId)
	end

	return nil
end

function Trick:CheckIntervalSpace(cube, oldPos, oldRot, times)
	if cube == nil or oldPos == nil or oldRot == nil then
		return false
	end

	local newPos = cube:GetPositionInterpolation(1)
	local newRot = cube:GetRotationInterpolation(1)
	local halfExtents = cube:GetHalfExtents()
	local hitInfo
	local dir = newPos - oldPos
	local ret = XPhysics.BoxCastAllMultiple(0, 0, oldPos.x, oldPos.y, oldPos.z, halfExtents.x, halfExtents.y, halfExtents.z, oldRot.x, oldRot.y, oldRot.z, oldRot.w, dir.x, dir.y, dir.z, dir.magnitude + 0.01, GameCollider.ColliderLayerMask, times)

	dir = nil

	return ret
end

function Trick:CheckIntervalSpaceAfter()
	local retNum = 0
	local retIdList, retLayerList
	local retNum, retIdList, retLayerList = XPhysics.GetCastColliderAnimal(0, 0, GameCollider.ColliderLayerMask, retIdList, retLayerList)

	return self:CheckHitAnimal(retNum, retIdList, retLayerList)
end

function Trick:CheckCollider()
	local ret = false

	for i = 1, #self.attackBoxList do
		local colliderCube = self.attackBoxList[i]

		if colliderCube ~= nil then
			local colliderCubeList = {
				colliderCube
			}
			local retNum, retIdList, retLayerList = GameCollider.CheckCubeCollider(nil, colliderCubeList, false)

			colliderCubeList = nil

			local hitFlg = self:CheckHitAnimal(retNum, retIdList, retLayerList)

			if hitFlg == true then
				ret = true
			end
		end
	end

	return ret
end

function Trick:IsColliderOpen()
	return self.attackBoxOpen
end

function Trick:OpenCollider()
	self.attackBoxOpen = true

	if self.attackBoxList ~= nil then
		for i = 1, #self.attackBoxList do
			local cube = self.attackBoxList[i]

			if cube ~= nil then
				cube:ShowTestCube()
			end
		end
	end
end

function Trick:CloseCollider()
	self.attackBoxOpen = false

	if self.attackBoxList ~= nil then
		for i = 1, #self.attackBoxList do
			local cube = self.attackBoxList[i]

			if cube ~= nil then
				cube:HideTestCube()
			end
		end
	end
end

function Trick:CheckHitAnimal(hitNum, ownerIdList, hitLayerList)
	local ret = false
	local hitAnimalIdList, hitShellIdList

	if hitNum > 0 and ownerIdList ~= nil and hitLayerList ~= nil then
		for j = 0, hitNum - 1 do
			local ownerId = ownerIdList[j]
			local hitLayer = hitLayerList[j]

			if ownerId ~= nil and hitLayer ~= nil then
				if hitLayer == LayerShell then
					if hitShellIdList == nil then
						hitShellIdList = {}
					end

					hitShellIdList[ownerId] = 1
				elseif hitLayer ~= LayerAnimalSkill then
					if hitAnimalIdList == nil then
						hitAnimalIdList = {}
					end

					hitAnimalIdList[ownerId] = 1
				end
			end
		end
	end

	if hitAnimalIdList ~= nil then
		for tmpAnimalId, _ in pairs(hitAnimalIdList) do
			local animal = self.sceneController:FindPlayerById(tmpAnimalId)

			if animal ~= nil then
				local retIn = GameAI.IsInSelectTarget(0, self.hostTeamId, self.targetType, animal)

				if retIn == true and animal:IsWillDead() == false and animal:IsShow() == true and animal:IsMuteki(nil) == false and self:IsHaveHitAnimal(animal) == false then
					if animal.useHitBone > 0 then
						local colliderIndexList = {}
						local tmpColliderNum, tmpColliderlIdList, tmpLayerList = GameCollider.GetOverlapColliderBone(tmpAnimalId)

						if tmpColliderNum > 0 and tmpColliderlIdList ~= nil then
							for k = 0, tmpColliderNum - 1 do
								local colliderIndex = tmpColliderlIdList[k]

								if colliderIndex ~= nil and colliderIndex >= 0 then
									table.insert(colliderIndexList, colliderIndex)
								end
							end
						end

						if #colliderIndexList > 0 then
							colliderIndexList = table.unique(colliderIndexList, true)
						end

						if #colliderIndexList > 0 then
							GameCollider.SkillColliderTrick(animal, self, self.trickForward, colliderIndexList)
							self:AddHitAnimal(animal)

							ret = true
						end
					else
						GameCollider.SkillColliderTrick(animal, self, self.trickForward, nil)
						self:AddHitAnimal(animal)

						ret = true
					end
				end
			end
		end
	end

	if hitShellIdList ~= nil then
		SystemHelper.LogTest("====hitShellIdList==!!!!!!======")

		for tmpShellId, _ in pairs(hitShellIdList) do
			local hitShell = self.sceneController:FindShellById(tmpShellId)

			if hitShell ~= nil then
				local retIn = GameAI.IsInSelectTargetForShell(0, self.hostTeamId, self.targetType, hitShell)

				if retIn == true and hitShell:IsWillDead() == false and hitShell:IsShow() == true and self:IsHaveHitShell(hitShell) == false then
					GameCollider.SkillColliderShellTrick(hitShell, self, self.trickForward)
					self:AddHitShell(hitShell)

					ret = true
				end
			end
		end
	end

	hitShellIdList = nil
	hitAnimalIdList = nil

	return ret
end

function Trick:GetAttackBoxTfList()
	return self.tfAttackBoxList
end

function Trick:Exit()
	self.trickPosition = nil
	self.trickRotation = nil
	self.trickForward = nil
	self.tfSelf = nil
	self.trickData = nil
	self.tfModel = nil
	self.animator = nil
	self.tfAttackBoxList = nil
	self.attackBoxList = nil
	self.attackBoxPosList = nil
	self.attackBoxRotList = nil

	if self.effectList ~= nil then
		for effIndex, effGroup in pairs(self.effectList) do
			for i = 1, #effGroup do
				local tmpEffect = effGroup[i]

				if tmpEffect ~= nil then
					tmpEffect:Clear()
				end
			end
		end
	end

	self.effectRoot = nil
	self.effectList = nil
	self.effectConfig = nil
	self.sceneController = nil
	self.hitAnimalList = nil
	self.hitShellList = nil
	self.stepTargetPos = nil
end

return Trick
