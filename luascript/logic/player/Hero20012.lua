-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20012.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20012_Define")

Hero20012 = class("Hero20012", AnimalBase)

function Hero20012:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletNHSpeed1Vec3 = Vector3.zero
	self.bulletNHSpeed1Vec3.z = Hero20012_Define.BulletNHSpeed1
	self.bulletNHSpeed2Vec3 = Vector3.zero
	self.bulletNHSpeed2Vec3.z = Hero20012_Define.BulletNHSpeed2
	self.bulletNHAcc2Vec3 = Vector3.zero
	self.bulletNHAcc2Vec3.z = Hero20012_Define.BulletNHAcc2
	self.bulletNHIndex = 0
	self.bulletNHStatus = BulletChain.ChainStatus.Start
end

function Hero20012:Start()
	AnimalBase.Start(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		self:SetSkillCondition(Hero20012_Define.SkillType.SkillSP, AnimalBase_Define.SkillCallCondition)
		self:SetSkillCondition(Hero20012_Define.SkillType.SkillSPC, AnimalBase_Define.SkillCallCondition)
		self:SetLockDisable(true)
		self:SetBodyCollider(false)
	else
		self:SetSkillCondition(Hero20012_Define.SkillType.SkillSP, 1)
		self:SetSkillCondition(Hero20012_Define.SkillType.SkillSPC, 1)

		if self.heroVariety > 1 and self.characterConfig ~= nil then
			local mat = self.characterConfig:GetOtherMaterial(self.heroVariety - 1)

			if mat ~= nil then
				self:ChangeMaterial(mat)
			end
		end
	end
end

function Hero20012:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20012:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20012:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20012:GetGradeThreshold()
	return 0
end

function Hero20012:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self.skillIndex == Hero20012_Define.SkillType.SkillNH then
		local bullet = self.controllerBullet:GetBullet(self.bulletNHIndex)

		if bullet ~= nil then
			local status = bullet:GetChainStatus()

			if status == BulletChain.ChainStatus.Back then
				local bulletPos = bullet:GetPosition()
				local nowPos = self:GetPosByWorldPos()
				local radius = self:GetRadius()
				local targetAnimal = self:GetSkillTarget()

				if targetAnimal ~= nil and targetAnimal:IsWillDead() == false and targetAnimal:IsShow() == true then
					local tmpPos = targetAnimal:GetPosByWorldPos()
					local tmpDir = nowPos - tmpPos
					local tmpDis = tmpDir.magnitude
					local tmpRadius = targetAnimal:GetRadius()

					if tmpDis > radius + tmpRadius then
						local tmpDirBullet = bulletPos - tmpPos
						local tmpDirBulletProj = Vector3.Project(tmpDirBullet, tmpDir)
						local dot = Vector3.Dot(tmpDirBulletProj, tmpDir)

						if dot > 0 then
							if tmpDirBulletProj.magnitude > tmpDis - radius then
								tmpDirBulletProj:SetNormalize()
								tmpDirBulletProj:Mul(tmpDis - radius)
							end

							local targetPos = tmpDirBulletProj + tmpPos

							targetAnimal:PullToPos(targetPos, self:GetBack())

							targetPos = nil
						end

						tmpDirBullet = nil
						tmpDirBulletProj = nil
					end

					tmpDir = nil
				end
			end
		end
	end
end

function Hero20012:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self.skillIndex == Hero20012_Define.SkillType.SkillNH then
		local bullet = self.controllerBullet:GetBullet(self.bulletNHIndex)

		if bullet ~= nil then
			local status = bullet:GetChainStatus()

			if self.bulletNHStatus ~= status then
				if status == BulletChain.ChainStatus.Disappear then
					self.controllerBullet:ClearBullet(self.bulletNHIndex)

					self.bulletNHIndex = 0

					self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20012_Define.WeaponIndex, true)
				elseif status == BulletChain.ChainStatus.Back then
					self:SetSkillTarget(nil)
				end

				self.bulletNHStatus = status
			end

			if status == BulletChain.ChainStatus.Back then
				local bulletPos = bullet:GetPosition()
				local nowPos = self:GetPosByWorldPos()
				local radius = self:GetRadius()
				local targetAnimal = self:GetSkillTarget()

				if targetAnimal == nil then
					local hitList = bullet:GetHitAnimalList()

					if hitList ~= nil then
						for k, animal in pairs(hitList) do
							if animal ~= nil and animal:IsWillDead() == false and animal:IsShow() == true and animal:IsHitBySkill(self, self.skillIndex, 0) then
								self:SetSkillTarget(animal)

								break
							end
						end
					end
				end

				targetAnimal = self:GetSkillTarget()

				if targetAnimal ~= nil then
					targetAnimal:ChangePullHit(AnimalBase_Define.HitType.PullFrontFreeze, self:GetBack())
				end
			end
		end

		local targetAnimal = self:GetSkillTarget()

		if targetAnimal ~= nil then
			targetAnimal:KeepHitPeriod()
		end
	end
end

function Hero20012:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	if self.skillIndex ~= Hero20012_Define.SkillType.SkillNH then
		self:PlaySkillEffect(false)
	end

	self:PlaySkillAudio()
end

function Hero20012:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20012:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20012_Define.SkillType.SkillNH then
		if self.skillCombo == 1 then
			if trigger == 1 then
				local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
				local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20012_Define.BulletNHRangeMax, Hero20012_Define.BulletNHRangeMin, Hero20012_Define.BulletNHRangeMax, AnimalBase_Define.ShootTargetAngleMax)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Chain, self, skillData, nil, startPos, targetPos, self.bulletNHSpeed1Vec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:AddChainEffect(skillData[AnimalBase_Define.VfxSkillKey1], self:GetWeaponBox(1))
						bullet:Ready()
						bullet:Start()

						self.bulletNHIndex = bulletIndex
					end

					self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20012_Define.WeaponIndex, false)
				end
			elseif trigger == 2 then
				local bullet = self.controllerBullet:GetBullet(self.bulletNHIndex)

				if bullet ~= nil then
					bullet:PullBackChain(true)
					bullet:SetSpeed(self.bulletNHSpeed2Vec3, self.bulletNHAcc2Vec3)
				end
			end
		end
	elseif self.skillIndex == Hero20012_Define.SkillType.SkillSPC and self.skillCombo == 3 and trigger == 4 then
		self:Stop()
		self:DissolveEnd(AnimalBase_Define.NightmareEndTime)
	end
end

function Hero20012:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20012_Define.SkillType.SkillNH and self.skillCombo == 1 then
		if self.bulletNHIndex > 0 then
			self.controllerBullet:ClearBullet(self.bulletNHIndex)
		end

		self.bulletNHIndex = 0
		self.bulletNHStatus = BulletChain.ChainStatus.Start
	end
end

function Hero20012:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20012_Define.SkillType.SkillNH and skillIndexNext ~= Hero20012_Define.SkillType.SkillNH then
		if self.bulletNHIndex > 0 then
			self.controllerBullet:ClearBullet(self.bulletNHIndex)
		end

		self.bulletNHIndex = 0

		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20012_Define.WeaponIndex, true)
		self:SetSkillTarget(nil)
	elseif (self.skillIndex == Hero20012_Define.SkillType.SkillSP or self.skillIndex == Hero20012_Define.SkillType.SkillSPC) and self.skillCombo == 2 then
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20012:GetShootDistanceMax()
	return Hero20012_Define.BulletRangeMax
end

function Hero20012:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20012:Exit()
	if self.bulletNHIndex > 0 then
		self.controllerBullet:ClearBullet(self.bulletNHIndex)
	end

	self.bulletNHIndex = 0
	self.bulletNHSpeed1Vec3 = nil
	self.bulletNHSpeed2Vec3 = nil
	self.bulletNHAcc2Vec3 = nil

	AnimalBase.Exit(self)
end

return Hero20012
