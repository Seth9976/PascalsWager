-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20014.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20014_Define")

Hero20014 = class("Hero20014", AnimalBase)

function Hero20014:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletDPSpeed1Vec3 = Vector3.zero
	self.bulletDPSpeed1Vec3.z = Hero20014_Define.BulletDPSpeed1
	self.bulletDPUpSpeed1Vec3 = Vector3.zero
	self.bulletDPUpSpeed1Vec3.z = Hero20014_Define.BulletDPUpSpeed
	self.bulletDPSpeed2Vec3 = Vector3.zero
	self.bulletDPSpeed2Vec3.z = Hero20014_Define.BulletDPSpeed2
	self.bulletDPAcc2Vec3 = Vector3.zero
	self.bulletDPAcc2Vec3.z = Hero20014_Define.BulletDPAcc2
	self.bulletSPSpeedVec3 = Vector3.zero
	self.bulletSPSpeedVec3.z = Hero20014_Define.BulletSPSpeed
	self.bulletSSpeedVec3 = Vector3.zero
	self.bulletSAccVec3 = Vector3.zero
	self.bulletSAccVec3.y = Hero20014_Define.BulletSGravity
	self.bulletDPIndex = 0
	self.bulletDPStatus = BulletChain.ChainStatus.Start
	self.bulletDPFreezeTimeEnd = 0
	self.enchantTimeEnd = 0
	self.enchantFlg = false

	self:SetSkillConditionAll(1)
end

function Hero20014:Start()
	AnimalBase.Start(self)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20014:StartBattle()
	AnimalBase.StartBattle(self)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		if MS_StoryList.IsStoryMazeBoss(self.storyId) == true then
			self:ResetGrade()
			self:AddGrade(true)
		elseif FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
			self:ResetGrade()
			self:AddGrade(true)
		end
	end
end

function Hero20014:Show()
	AnimalBase.Show(self)
end

function Hero20014:Hide()
	AnimalBase.Hide(self)
end

function Hero20014:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20014:IsEnchant()
	return self.enchantFlg
end

function Hero20014:SetEnchant(flg)
	self.enchantFlg = flg

	if self.enchantFlg == true then
		self.enchantTimeEnd = TimeHelper.getNowTime() + Hero20014_Define.EnchantTime

		self:SetSkillConditionAll(2)
	else
		self:SetSkillConditionAll(1)
	end

	self:ShowEnchantEffect()
end

function Hero20014:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20014:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20014:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
	self:SetEnchant(false)
	self.scene:OpenTrick(Hero20014_Define.TrickId)
end

function Hero20014:ResetGrade()
	AnimalBase.ResetGrade(self)
	self:SetEnchant(false)
end

function Hero20014:ExitBattle()
	self.scene:StopTrick(Hero20014_Define.TrickId)
	AnimalBase.ExitBattle(self)
end

function Hero20014:ShowEnchantEffect()
	if self.enchantFlg == true then
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(5), "vfx_20014_self_1")
		self:CreateSelfEffectLoop("self_2", self:GetWeaponBox(3), "vfx_20014_self_2")
	else
		self:ClearSelfEffectLoop("self_1")
		self:ClearSelfEffectLoop("self_2")
	end
end

function Hero20014:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade > 1 then
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Grade, Hero20014_Define.WeaponIndexLeft, false)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Grade, Hero20014_Define.WeaponIndexRight, false)
		self:CreateSelfEffectLoop("self_3", self:GetWeaponBox(6), "vfx_20014_self_3")
		self:CreateSelfEffectLoop("self_4", self:GetWeaponBox(7), "vfx_20014_self_4")
	else
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Grade, Hero20014_Define.WeaponIndexLeft, true)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Grade, Hero20014_Define.WeaponIndexRight, true)
		self:ClearSelfEffectLoop("self_3")
		self:ClearSelfEffectLoop("self_4")
	end

	self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.animalGrade - 1, 0, 0)
end

function Hero20014:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true then
		if self.skillIndex == Hero20014_Define.SkillType.SkillHP3 then
			if self.skillCombo == 1 and self.animatorTrigger >= 1 and self.animatorTrigger < 2 then
				local targetAnimal = self:GetSkillTarget()

				if targetAnimal == nil then
					local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
					local attPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
					local captureOffset, captureDis, captureHeight = self:GetCaptureDistanceAndHeight()

					targetAnimal = GameAI.GetSkillCaptureTarget(self, skillData, attPos, captureOffset, captureDis, captureHeight, false)

					if targetAnimal ~= nil then
						self:SetSkillTargetReady(targetAnimal)
					end
				end
			end
		elseif self.skillIndex == Hero20014_Define.SkillType.SkillDP1 or self.skillIndex == Hero20014_Define.SkillType.SkillDP2 then
			local bullet = self.controllerBullet:GetBullet(self.bulletDPIndex)

			if bullet ~= nil then
				local targetAnimal = self:GetSkillTarget()

				if targetAnimal ~= nil and self.bulletDPStatus == BulletChain.ChainStatus.Start then
					local targetPos = targetAnimal:GetAimPosition()

					bullet:SetEndPosition(targetPos)
				end
			end
		end
	end
end

function Hero20014:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true then
		if self.skillIndex == Hero20014_Define.SkillType.SkillDP1 or self.skillIndex == Hero20014_Define.SkillType.SkillDP2 then
			local targetAnimal = self:GetSkillTarget()
			local bullet = self.controllerBullet:GetBullet(self.bulletDPIndex)

			if bullet ~= nil then
				if targetAnimal == nil then
					local hitAnimalList = bullet:GetHitAnimalList()

					if hitAnimalList ~= nil then
						for k, animal in pairs(hitAnimalList) do
							if animal ~= nil and animal:IsWillDead() == false and animal:IsShow() == true and animal:IsHitBySkill(self, self.skillIndex, 0) then
								self:SetSkillTarget(animal)
								bullet:SetColliderMoveEnable(false)

								break
							end
						end
					end
				end

				local status = bullet:GetChainStatus()

				if self.bulletDPStatus ~= status then
					if status == BulletChain.ChainStatus.Disappear then
						self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20014_Define.WeaponIndexLeft, true)
						self.controllerBullet:ClearBullet(self.bulletDPIndex)

						self.bulletDPIndex = 0
					end

					self.bulletDPStatus = status
				end
			end

			targetAnimal = self:GetSkillTarget()

			if targetAnimal ~= nil then
				if self.skillCombo == 1 then
					self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 2, MS_SkillData.PressType.PressDown, 0)
				end

				targetAnimal:KeepHitPeriod()
			end
		elseif self.skillIndex == Hero20014_Define.SkillType.SkillHP3 then
			local targetAnimal = self:GetSkillTarget()

			if targetAnimal == nil and self.skillCombo == 1 then
				local targetAnimalReady = self:GetSkillTargetReady()

				if targetAnimalReady ~= nil then
					local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)
					local hitType = AnimalBase.GetSkillHitType(self:GetHeroId(), self.skillIndex, self.skillCombo)
					local attackDir = self:GetSkillDirection(targetAnimalReady:GetPosByWorldPos())
					local ret = targetAnimalReady:ChangeHitSimple(self, hitType, skillData, attackDir, false)

					if ret == true then
						self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
						self:SetSkillTarget(targetAnimalReady)
						XCollider.AddRouteColliderIgnore(self:GetAnimalId(), targetAnimalReady:GetAnimalId())
						XCollider.AddRouteColliderIgnore(targetAnimalReady:GetAnimalId(), self:GetAnimalId())

						local attBoxTF = self:GetAttackBoxTF(self.skillIndex, 1)

						targetAnimalReady:SetMoveFix(true)
						targetAnimalReady:SetFixBoneHost(AnimalBase_Define.FixBoneType.Chest, attBoxTF, true)
					end

					self:SetSkillTargetReady(nil)
				end
			end

			targetAnimal = self:GetSkillTarget()

			if targetAnimal ~= nil then
				targetAnimal:KeepHitPeriod()
			end
		end
	end

	if self.enchantFlg == true then
		local nowTime = TimeHelper.getNowTime()

		if nowTime > self.enchantTimeEnd then
			self:SetEnchant(false)
		end
	end
end

function Hero20014:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20014:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20014:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20014_Define.SkillType.SkillDP1 or self.skillIndex == Hero20014_Define.SkillType.SkillDP2 then
		if self.skillCombo == 1 then
			if trigger == 1 then
				local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
				local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20014_Define.BulletDPRange, Hero20014_Define.BulletDPRangeMin, Hero20014_Define.BulletDPRangeMax, Hero20014_Define.BulletAngleMax)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Chain, self, skillData, nil, startPos, targetPos, self.bulletDPSpeed1Vec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:AddChainEffect(skillData[AnimalBase_Define.VfxSkillKey1], self:GetWeaponBox(1))
						bullet:Ready()
						bullet:Start()

						self.bulletDPIndex = bulletIndex
					end

					self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20014_Define.WeaponIndexLeft, false)
				end
			end
		elseif self.skillCombo == 2 or self.skillCombo == 4 then
			if trigger == 1 then
				local bullet = self.controllerBullet:GetBullet(self.bulletDPIndex)

				if bullet ~= nil then
					bullet:PullBackChain(true)
					bullet:SetSpeed(self.bulletDPSpeed2Vec3, self.bulletDPAcc2Vec3)
				end
			end
		elseif self.skillCombo == 3 and trigger > 0 then
			local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20014_Define.BulletRangeMax, Hero20014_Define.BulletRangeMax, Hero20014_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletDPUpSpeed1Vec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20014_Define.SkillType.SkillSP1 or self.skillIndex == Hero20014_Define.SkillType.SkillSP3 then
		if trigger > 0 then
			local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20014_Define.BulletRangeMax, Hero20014_Define.BulletRangeMax, Hero20014_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSPSpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
					self:PlaySkillEffect(true)
				end
			end
		end
	elseif self.skillIndex == Hero20014_Define.SkillType.SkillS then
		if trigger > 0 then
			local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
			local targetPos = GameAI.GetFootTargetByParabola(self, startPos, Hero20014_Define.BulletSRange, Hero20014_Define.BulletSRangeMin, Hero20014_Define.BulletSRangeMax, Hero20014_Define.BulletAngleMax)
			local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, Hero20014_Define.BulletSAngle, Hero20014_Define.BulletSGravity)

			self.bulletSSpeedVec3:Set(0, tmpSpeedY, tmpSpeedZ)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.bulletSSpeedVec3, self.bulletSAccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:AddTrap(skillData.TrapId)
					bullet:SetThroughBody(true)
					bullet:Ready()
					bullet:Start()
					self:PlaySkillEffect(true)
				end
			end
		end
	elseif self.skillIndex == Hero20014_Define.SkillType.SkillLP3 then
		if self.skillCombo == 2 and trigger == 1 and skillData.TrapId > 0 then
			local nowPos = self:GetPosByWorldPos()
			local tmpVPlayer = self:GetVirtualPlayer()

			self.scene:AddTrap(skillData.TrapId, nowPos, tmpVPlayer, tmpVPlayer:GetTeamId())
		end
	elseif self.skillIndex == Hero20014_Define.SkillType.SkillHP3 and self.skillCombo > 1 and trigger == 1 then
		local targetAnimal = self:GetSkillTarget()

		if targetAnimal ~= nil then
			local hitType = AnimalBase.GetSkillHitType(self:GetHeroId(), self.skillIndex, self.skillCombo)
			local attackDir = self:GetSkillDirection(targetAnimal:GetPosByWorldPos())

			targetAnimal:ChangeHitSimple(self, hitType, skillData, attackDir, false)

			if self.skillCombo == 3 then
				targetAnimal:SetMoveFix(false)
				targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.None, nil, false)
				self:SetSkillTarget(nil)
			end
		end
	end
end

function Hero20014:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20014_Define.SkillType.SkillOP then
		if self.skillCombo == 3 then
			self:SetEnchant(true)
		end
	elseif self.skillIndex == Hero20014_Define.SkillType.SkillSP1 or self.skillIndex == Hero20014_Define.SkillType.SkillSP2 then
		if self.skillCombo == 1 then
			self.bulletDPStatus = BulletChain.ChainStatus.Start

			if self.bulletDPIndex > 0 then
				self.controllerBullet:ClearBullet(self.bulletDPIndex)
			end

			self.bulletDPIndex = 0

			self:SetSkillTarget(nil)
		end
	elseif self.skillIndex == Hero20014_Define.SkillType.SkillHP3 then
		if self.skillCombo == 1 then
			self:SetSkillTarget(nil)
		elseif self.skillCombo == 2 then
			self:StopSkillAudio()
		end
	end
end

function Hero20014:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20014_Define.SkillType.SkillDP1 and skillIndexNext ~= Hero20014_Define.SkillType.SkillDP1 or self.skillIndex == Hero20014_Define.SkillType.SkillDP2 and skillIndexNext ~= Hero20014_Define.SkillType.SkillDP2 then
		if self.bulletDPIndex > 0 then
			self.controllerBullet:ClearBullet(self.bulletDPIndex)
		end

		self.bulletDPIndex = 0

		self:SetSkillTarget(nil)
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20014_Define.WeaponIndexLeft, true)
	elseif self.skillIndex == Hero20014_Define.SkillType.SkillHP3 and skillIndexNext ~= Hero20014_Define.SkillType.SkillHP3 then
		local targetAnimal = self:GetSkillTarget()

		if targetAnimal ~= nil then
			targetAnimal:SetMoveFix(false)
			targetAnimal:SetFixBoneHost(AnimalBase_Define.FixBoneType.None, nil, false)
			targetAnimal:ChangeToDrop(true)
		end

		self:SetSkillTarget(nil)
	elseif (self.skillIndex == Hero20014_Define.SkillType.SkillOP or self.skillIndex == Hero20014_Define.SkillType.SkillDP3) and self.skillCombo == 2 then
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20014:GetShootDistanceMax()
	return Hero20014_Define.BulletRangeMax
end

function Hero20014:GetCaptureDistanceAndHeight()
	return Hero20014_Define.SkillCaptureOffset, Hero20014_Define.SkillCaptureDistance, Hero20014_Define.SkillCaptureHeight
end

function Hero20014:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20014:Exit()
	if self.bulletDPIndex > 0 then
		self.controllerBullet:ClearBullet(self.bulletDPIndex)
	end

	self.bulletDPIndex = 0
	self.bulletDPSpeed1Vec3 = nil
	self.bulletDPUpSpeed1Vec3 = nil
	self.bulletDPSpeed2Vec3 = nil
	self.bulletDPAcc2Vec3 = nil
	self.bulletSPSpeedVec3 = nil
	self.bulletSSpeedVec3 = nil
	self.bulletSAccVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20014
