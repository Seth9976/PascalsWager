-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Shell.lua

Shell = class("Shell")

function Shell:initialize(tfSelf, fromAnimalId, fromTeamId, index, id, shape, collider)
	self.tfSelf = tfSelf
	self.fromAnimalId = fromAnimalId
	self.fromTeamId = fromTeamId
	self.shellId = index
	self.id = id
	self.shape = shape
	self.collider = collider
	self.shellData = MS_ShellData.GetShellData(id)
	self.deadFlg = false
	self.showFlg = true
	self.durability = self.shellData.Durability
	self.guard = self.shellData.Guard
	self.vfxName = self.shellData.HitEffect
	self.audioName = self.shellData.HitAudio
	self.vfxDestroyName = self.shellData.DestroyEffect
	self.audioDestroyName = self.shellData.DestroyAudio
	self.hostTeamId = self.shellData.HostTeamId
	self.skillTouchAttackList = nil
	self.trickTouchList = nil
	self.position = tfSelf.position
	self.sceneController = ST_Main.GetSceneController()
end

function Shell:GetShellId()
	return self.shellId
end

function Shell:GetGuard()
	return self.guard
end

function Shell:GetFromAnimalId()
	return self.fromAnimalId
end

function Shell:GetFromTeamId()
	return self.fromTeamId
end

function Shell:SetSize(centerX, centerY, centerZ, param1, param2, param3)
	if self.collider ~= nil then
		if self.shape == ControllerShell.ShellShape.Capsule then
			self.collider.center = Vector3.New(centerX, centerY, centerZ)
			self.collider.radius = param1
			self.collider.height = param2
		elseif self.shape == ControllerShell.ShellShape.Sphere then
			self.collider.center = Vector3.New(centerX, centerY, centerZ)
			self.collider.radius = param1
		elseif self.shape == ControllerShell.ShellShape.Box then
			self.collider.center = Vector3.New(centerX, centerY, centerZ)
			self.collider.size = Vector3.New(param1, param2, param3)
		end
	end
end

function Shell:IsWillDead()
	if self.deadFlg == true then
		return true
	end

	if self.durability <= 0 then
		return true
	end

	return false
end

function Shell:IsShow()
	return self.showFlg
end

function Shell:SetDead(flg)
	self.deadFlg = flg
end

function Shell:WillDead(attackVPlayer, skillData)
	SystemHelper.LogTest("==========WillDead==!!!!=======")

	if self.vfxDestroyName ~= "" then
		local eff = VfxManager.PlayTransformFreezeMulti(self.tfSelf, self.vfxDestroyName)
	end

	if self.audioDestroyName ~= "" then
		AudioCtrl.SetObjectAudio(self.audioDestroyName, self.tfSelf, attackVPlayer:GetAnimalId())
	end
end

function Shell:OnDeadFinish()
	self:ClearSkillTouchAttackPlayer()
	self:ClearTrickTouch()
end

function Shell:GetPosByWorldPos()
	return self.position
end

function Shell:AddSkillTouchAttackPlayer(attVPlayer, skillData, itemData, attackDir)
	local findTouchData

	if self.skillTouchAttackList ~= nil then
		for i, touchAttackData in pairs(self.skillTouchAttackList) do
			if touchAttackData ~= nil and touchAttackData:IsEnable() == false then
				findTouchData = touchAttackData

				break
			end
		end
	end

	if findTouchData == nil then
		findTouchData = SkillTouchAttackData:new(self, attVPlayer, skillData, itemData, attackDir)

		if self.skillTouchAttackList == nil then
			self.skillTouchAttackList = {}
		end

		table.insert(self.skillTouchAttackList, findTouchData)
	else
		findTouchData:Reset(self, attVPlayer, skillData, itemData, attackDir)
	end

	return findTouchData
end

function Shell:ClearSkillTouchAttackPlayer()
	if self.skillTouchAttackList ~= nil then
		for i, touchAttackData in pairs(self.skillTouchAttackList) do
			if touchAttackData ~= nil then
				touchAttackData:Clear()

				touchAttackData = nil
			end
		end
	end

	self.skillTouchAttackList = nil
end

function Shell:DisableSkillTouchAttackPlayer(attPlayer)
	if attPlayer ~= nil and self.skillTouchAttackList ~= nil then
		for i, touchAttackData in pairs(self.skillTouchAttackList) do
			if touchAttackData ~= nil and touchAttackData:IsEnable() == true then
				local tmpAttVPlayer = touchAttackData:GetAttackVirtualPlayer()

				if tmpAttVPlayer:GetAnimalId() == attPlayer.animalId then
					touchAttackData:Disable()
				end
			end
		end
	end
end

function Shell:AddTrickTouch(trick, trickDir)
	local findTouchData

	if self.trickTouchList ~= nil then
		for i, touchTrickData in pairs(self.trickTouchList) do
			if touchTrickData ~= nil and touchTrickData:IsEnable() == false then
				findTouchData = touchTrickData

				break
			end
		end
	end

	if findTouchData == nil then
		findTouchData = TrickTouchShellData:new(self, trick, trickDir)

		if self.trickTouchList == nil then
			self.trickTouchList = {}
		end

		table.insert(self.trickTouchList, findTouchData)
	else
		findTouchData:Reset(self, trick, trickDir)
	end

	return findTouchData
end

function Shell:DisableTrickTouch(trick)
	if self.trickTouchList ~= nil then
		for i, touchData in pairs(self.trickTouchList) do
			if touchData ~= nil and touchData:GetTrick() == trick then
				touchData:Disable()
			end
		end
	end
end

function Shell:ClearTrickTouch()
	if self.trickTouchList ~= nil then
		for i, touchData in pairs(self.trickTouchList) do
			if touchData ~= nil then
				touchData:Clear()

				touchData = nil
			end
		end
	end

	self.trickTouchList = nil
end

function Shell:CheckHit()
	if self:IsWillDead() == true or self:IsShow() == false then
		return
	end

	local hpSub = 0
	local hpAdd = 0
	local isFirstHit = true
	local isFirtHitHand = true

	if self.skillTouchAttackList ~= nil then
		for k, attackerData in pairs(self.skillTouchAttackList) do
			if attackerData ~= nil and attackerData:IsEnable() == true then
				local attackVPlayer = attackerData:GetAttackVirtualPlayer()
				local skillData = attackerData:GetSkillData()
				local itemData = attackerData:GetItemData()
				local hitHandFlg = false

				if attackVPlayer ~= nil and skillData ~= nil and attackerData:IsChecked() == false then
					local damageType = attackerData:GetDamageType()

					if damageType == AnimalBase_Define.DamageType.Instant then
						local tmpHpSub, tmpHpSubReal = self:CalculateDamage(attackerData)
						local isSkillHitHand = attackerData:IsSkillHitHand()

						if isSkillHitHand == true then
							hitHandFlg = self:OnHitHand(isFirtHitHand, attackerData)
							isFirtHitHand = false
						else
							self:OnHit(isFirstHit, attackerData)

							isFirstHit = false
						end
					end
				end

				attackerData:SetChecked()
			end
		end
	end

	if self.trickTouchList ~= nil then
		for k, touchData in pairs(self.trickTouchList) do
			if touchData ~= nil and touchData:IsEnable() == true then
				local trick = touchData:GetTrick()
				local trickData = touchData:GetTrickData()

				if trick ~= nil and trickData ~= nil and touchData:IsChecked() == false then
					local damageType = trick:GetDamageType()

					if damageType == AnimalBase_Define.DamageType.Instant then
						local tmpHpSub, tmpHpSubReal = self:CalculateTrickDamage(touchData)

						self:OnHitTrick(isFirstHit, touchData)

						isFirstHit = false
					end
				end

				touchData:SetChecked()
			end
		end
	end
end

function Shell:OnHit(isFirst, attackerData)
	if isFirst == false then
		return
	end

	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local skillAI = attackerData:GetSkillTypeForAI()
	local skillData = attackerData:GetSkillData()
	local itemData = attackerData:GetItemData()
	local fromBullet = attackerData:IsFromBullet()

	if skillData == nil or attackVPlayer == nil then
		return
	end

	local hitShake = skillData.HitShake

	if itemData ~= nil then
		hitShake = itemData.HitShake
	end

	if attackVPlayer:IsHost() == true and skillAI == AnimalBase_Define.SkillTypeForAI.OffenseClose then
		local attackAnimal = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

		if attackAnimal ~= nil then
			local camera = attackAnimal:GetSceneCamera()

			if camera ~= nil then
				if hitShake > 0 then
					if hitShake == 4 then
						camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit4, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit4)
					elseif hitShake == 3 then
						camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
					elseif hitShake == 2 then
						camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit2, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit2)
					elseif hitShake == 1 then
						camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit1)
					else
						camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit1, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit1)
					end
				else
					camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit2, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit2)
				end

				camera:StartAnimator()
			end
		end
	end

	if self.vfxName ~= "" then
		local eff = VfxManager.PlayTransformFreezeMulti(self.tfSelf, self.vfxName)

		if eff ~= nil then
			local hitDir

			if fromBullet == true then
				hitDir = attackerData:GetBulletDirection()
			else
				hitDir = attackerData:GetSkillDir()
			end

			if hitDir ~= nil then
				local tmpDir = hitDir:Clone()

				tmpDir.y = 0

				tmpDir:Unm()

				if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
					local rot = Quaternion.LookRotation(tmpDir)

					eff:SetRotation(rot.x, rot.y, rot.z, rot.w)

					rot = nil
				end

				tmpDir = nil
			end

			hitDir = nil
		end
	end

	if self.audioName ~= "" then
		AudioCtrl.SetObjectAudio(self.audioName, self.tfSelf, attackVPlayer:GetAnimalId())
	end
end

function Shell:OnHitTrick(isFirst, attackerData)
	if isFirst == false then
		return
	end

	local trickDir = attackerData:GetTrickDir()

	if self.vfxName ~= "" then
		local eff = VfxManager.PlayTransformFreezeMulti(self.tfSelf, self.vfxName)

		if eff ~= nil and trickDir ~= nil then
			local tmpDir = trickDir:Clone()

			tmpDir.y = 0

			tmpDir:Unm()

			if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
				local rot = Quaternion.LookRotation(tmpDir)

				eff:SetRotation(rot.x, rot.y, rot.z, rot.w)

				rot = nil
			end

			tmpDir = nil
		end
	end

	if self.audioName ~= "" then
		AudioCtrl.SetObjectAudio(self.audioName, self.tfSelf, "")
	end

	trickDir = nil
end

function Shell:OnHitHand(isFirst, attackerData)
	local ret = false
	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local skillData = attackerData:GetSkillData()

	if hitHandSkillData ~= nil then
		if isFirst == true then
			self:BlockShake(attackerData)

			local attackAnimal = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

			if attackAnimal ~= nil then
				attackAnimal:StartAnimatorDelay(0, skillData.FrameFreeze, skillData.FrameFadeOut, skillData.FrameFreezeSpeed)
			end

			ret = true
		end

		local eff = VfxManager.PlayTransformFreezeMulti(self.tfSelf, AnimalBase_Define.VfxName_HitBlock)

		if eff ~= nil and attackVPlayer ~= nil then
			local nowPos = self:GetPosByWorldPos()
			local attackPos = attackVPlayer:GetPosition()
			local tmpDir = attackPos - nowPos

			tmpDir.y = 0

			if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
				tmpDir:SetNormalize()

				local rot = Quaternion.LookRotation(tmpDir)

				eff:SetRotation(rot.x, rot.y, rot.z, rot.w)

				rot = nil
			end

			tmpDir = nil
		end
	end

	return ret
end

function Shell:BlockShake(attackerData)
	if DebugDontUseCameraShake == true then
		return
	end

	local attackVPlayer = attackerData:GetAttackVirtualPlayer()

	if attackVPlayer:IsHost() == true then
		local attackAnimal = self.sceneController:FindPlayerById(attackVPlayer:GetAnimalId())

		if attackAnimal ~= nil then
			local camera = attackAnimal:GetSceneCamera()

			if camera ~= nil then
				camera:SetAnimatorTemplate(AnimalBase_Define.CameraShakeTemplateHit3, true, CameraBase.AnimatorPurpose.Shake, AnimalBase_Define.ControllerShakeTemplateHit3)
				camera:StartAnimator()
			end
		end
	end
end

function Shell:CalculateDamage(attackerData)
	if self:IsWillDead() == true or self:IsShow() == false then
		return 0, 0
	end

	local attackVPlayer = attackerData:GetAttackVirtualPlayer()
	local damageType = attackerData:GetDamageType()

	if attackVPlayer == nil or damageType ~= AnimalBase_Define.DamageType.Instant then
		return 0, 0
	end

	local skillData = attackerData:GetSkillData()
	local itemData = attackerData:GetItemData()
	local attackDis = attackerData:GetAttackDistance()
	local damageDisMin = skillData.DamageDisMin
	local damageDisMax = skillData.DamageDisMax
	local hpSub = skillData.DurabilitySub
	local hpSubReal = 0

	if itemData ~= nil then
		hpSub = itemData.DurabilitySub
		damageDisMin = itemData.DamageDisMin
		damageDisMax = itemData.DamageDisMax
	end

	local disRate = 1

	if damageDisMin > 0 and damageDisMax > 0 and damageDisMin < damageDisMax and attackDis > 0 then
		if damageDisMax < attackDis then
			disRate = 0
		elseif attackDis < damageDisMin then
			disRate = 1
		else
			disRate = (attackDis - damageDisMin) / (damageDisMax - damageDisMin)
			disRate = Mathf.Sqrt(1 - disRate * disRate)
		end
	end

	local old = self.durability

	self.durability = Mathf.Max(0, self.durability - hpSub * disRate)
	hpSubReal = old - self.durability

	SystemHelper.LogTest("=============self.durability=" .. self.durability)

	if self:IsWillDead() == true then
		self:WillDead(attackVPlayer, skillData)
	end

	return hpSub, hpSubReal
end

function Shell:CalculateTrickDamage(trickTouchData)
	if self:IsWillDead() == true or self:IsShow() == false then
		return 0, 0
	end

	local damageType = attackerData:GetDamageType()
	local trickData = trickTouchData:GetTrickData()

	if trickData == nil or damageType ~= AnimalBase_Define.DamageType.Instant then
		return 0, 0
	end

	local hpSub = trickData.DurabilitySub
	local hpSubReal = 0
	local old = self.durability

	self.durability = Mathf.Max(0, self.durability - hpSub)
	hpSubReal = old - self.durability

	if self:IsWillDead() == true then
		self:WillDead(nil, nil)
	end

	return hpSub, hpSubReal
end

function Shell:Update()
	if self.deadFlg == true then
		return false
	end

	return true
end

function Shell:Exit()
	self.skillTouchAttackList = nil
	self.trickTouchList = nil
	self.tfSelf = nil
	self.collider = nil
	self.shellData = nil
	self.position = nil
	self.sceneController = nil
end

return Shell
