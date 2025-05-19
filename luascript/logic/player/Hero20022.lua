-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20022.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20022_Define")

Hero20022 = class("Hero20022", AnimalBase)

function Hero20022:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.skillDownPos = Vector3.zero
	self.skillDownShootPos = Vector3.zero
	self.skillDownShootTarget = Vector3.zero
	self.bulletSList = nil
	self.bulletSSpeedVec3 = Vector3.zero
	self.bulletSSpeedVec3.z = Hero20022_Define.BulletSSpeed
	self.bulletDownShootIndex = 0
	self.bulletDownShootSpeedVec3 = Vector3.zero
	self.bulletDownShootSpeedVec3.z = Hero20022_Define.BulletDownShootSpeed
	self.unlockCameraTimeEnd = 0
end

function Hero20022:Start()
	AnimalBase.Start(self)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20022:StartBattle()
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

function Hero20022:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20022:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20022:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20022:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20022:ExitBattle()
	self.cameraScene:LockSkillingPlayer(nil)
	self.scene:StopTrick(Hero20022_Define.TrickId_SkillOP)
	self.scene:StopTrick(Hero20022_Define.TrickId_SkillO)
	self.scene:StopTrick(Hero20022_Define.TrickId_SkillGiantHand)
	self.scene:StopTrick(Hero20022_Define.TrickId_SkillNH2)
	AnimalBase.ExitBattle(self)
end

function Hero20022:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
end

function Hero20022:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
end

function Hero20022:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20022:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade > 1 then
		self:SetBodyHairVisible(AnimalBase_Define.VisibleType.Grade, true)
		self:SetBodyPartsVisible(AnimalBase_Define.VisibleType.Grade, false)
	else
		self:SetBodyHairVisible(AnimalBase_Define.VisibleType.Grade, false)
		self:SetBodyPartsVisible(AnimalBase_Define.VisibleType.Grade, true)
	end
end

function Hero20022:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true then
		if self.skillIndex == Hero20022_Define.SkillType.SkillS1 or self.skillIndex == Hero20022_Define.SkillType.SkillS2 then
			if self.bulletSList ~= nil then
				for k, v in pairs(self.bulletSList) do
					if v ~= nil and v:IsReadying() == true then
						local startPos = v:GetPosition()
						local targetPos = GameAI.GetFootTargetByStraightLine(self, startPos, Hero20022_Define.BulletSRangeMin, Hero20022_Define.BulletSRangeMin, Hero20022_Define.BulletSRangeMax, 999)

						v:SetEndPosition(targetPos)

						targetPos = nil
					end
				end
			end
		elseif self.skillIndex == Hero20022_Define.SkillType.SkillOP then
			if self.skillCombo == 1 then
				self:JumpToScenePoint(9, Hero20022_Define.JumpStartTime_SkillOP_9, Hero20022_Define.JumpEndTime_SkillOP_9)
			end
		elseif self.skillIndex == Hero20022_Define.SkillType.SkillO then
			if self.skillCombo == 1 then
				self:JumpToScenePoint(7, Hero20022_Define.JumpStartTime_SkillO_7, Hero20022_Define.JumpEndTime_SkillO_7)
			elseif self.skillCombo == 2 then
				self:JumpToScenePoint(8, Hero20022_Define.JumpStartTime_SkillO_8, Hero20022_Define.JumpEndTime_SkillO_8)
			end
		elseif self.skillIndex == Hero20022_Define.SkillType.SkillNOP then
			if self.skillCombo == 1 then
				self:JumpToScenePoint(1, Hero20022_Define.JumpStartTime_SkillNOP_1, Hero20022_Define.JumpEndTime_SkillNOP_1)
			elseif self.skillCombo == 2 then
				self:JumpToScenePoint(2, Hero20022_Define.JumpStartTime_SkillNOP_2, Hero20022_Define.JumpEndTime_SkillNOP_2)
			elseif self.skillCombo == 3 then
				self:JumpToScenePoint(3, Hero20022_Define.JumpStartTime_SkillNOP_3, Hero20022_Define.JumpEndTime_SkillNOP_3)
			elseif self.skillCombo == 4 then
				self:JumpToScenePoint(7, Hero20022_Define.JumpStartTime_SkillNOP_7, Hero20022_Define.JumpEndTime_SkillNOP_7)
			end
		elseif self.skillIndex == Hero20022_Define.SkillType.SkillNO then
			if self.skillCombo == 1 then
				self:JumpToScenePoint(4, Hero20022_Define.JumpStartTime_SkillNO_4, Hero20022_Define.JumpEndTime_SkillNO_4)
			elseif self.skillCombo == 2 then
				self:JumpToScenePoint(5, Hero20022_Define.JumpStartTime_SkillNO_5, Hero20022_Define.JumpEndTime_SkillNO_5)
			elseif self.skillCombo == 3 then
				self:JumpToScenePoint(6, Hero20022_Define.JumpStartTime_SkillNO_6, Hero20022_Define.JumpEndTime_SkillNO_6)
			elseif self.skillCombo == 4 then
				self:JumpToScenePoint(8, Hero20022_Define.JumpStartTime_SkillNO_8, Hero20022_Define.JumpEndTime_SkillNO_8)
			end
		elseif self.skillIndex == Hero20022_Define.SkillType.SkillGiantHand then
			if self.skillCombo == 1 then
				if self.animatorTrigger <= 2 then
					self:JumpToScenePoint(7, Hero20022_Define.JumpStartTime_SkillGiantHand_7, Hero20022_Define.JumpEndTime_SkillGiantHand_7)
				else
					local tmpTargetPos = self.scene:GetSceneSkillPointPos(11)

					self:SetPosByWorldPos(tmpTargetPos, true)
				end
			end
		elseif self.skillIndex == Hero20022_Define.SkillType.SkillDownShoot then
			if self.skillCombo == 2 then
				self:JumpToTargetPoint(self.skillDownPos, Hero20022_Define.JumpStartTime_SkillDownShoot, Hero20022_Define.JumpEndTime_SkillDownShoot)
			end
		elseif self.skillIndex == Hero20022_Define.SkillType.SkillDown and self.skillCombo == 2 then
			self:JumpToTargetPoint(self.skillDownPos, Hero20022_Define.JumpStartTime_SkillDown, Hero20022_Define.JumpEndTime_SkillDown)
		end
	end

	if self.unlockCameraTimeEnd > 0 then
		local nowTime = TimeHelper.getNowTime()

		if nowTime > self.unlockCameraTimeEnd then
			self.cameraScene:LockSkillingPlayer(nil)
		end

		self.unlockCameraTimeEnd = 0
	end
end

function Hero20022:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20022_Define.SkillType.SkillOP then
		self:SetMoveThroughAll(true)

		if self.skillCombo == 1 then
			self:LookAtScenePointBehind(9, true)
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillO then
		self:SetMoveThroughAll(true)
		self:SetMoveFly(true)

		if self.skillCombo == 1 then
			self:LookAtScenePoint(7, true)
		elseif self.skillCombo == 2 then
			self:LookAtScenePoint(8, true)
		end

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillNOP then
		self:SetMoveThroughAll(true)
		self:SetMoveFly(true)

		if self.skillCombo == 1 then
			self:LookAtScenePoint(1, true)
		elseif self.skillCombo == 2 then
			self:LookAtScenePoint(2, true)
		elseif self.skillCombo == 3 then
			self:LookAtScenePoint(3, true)
		elseif self.skillCombo == 4 then
			self:LookAtScenePoint(7, true)
		end

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillNO then
		self:SetMoveThroughAll(true)
		self:SetMoveFly(true)

		if self.skillCombo == 1 then
			self:LookAtScenePoint(4, true)
		elseif self.skillCombo == 2 then
			self:LookAtScenePoint(5, true)
		elseif self.skillCombo == 3 then
			self:LookAtScenePoint(6, true)
		elseif self.skillCombo == 4 then
			self:LookAtScenePoint(8, true)
		end

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillGiantHand then
		if self.skillCombo == 1 then
			self:LookAtScenePoint(7, true)
			self:SetMoveThroughAll(true)
			self:SetMoveFly(true)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillDown or self.skillIndex == Hero20022_Define.SkillType.SkillDownShoot then
		if self.skillCombo == 1 then
			local tmpTargetPos = self.scene:GetSceneSkillPointPos(9)
			local targetAnimal = GameAI.GetSkillTargetByPos(self, tmpTargetPos)

			if targetAnimal ~= nil then
				self.skillDownPos:SetVector3(targetAnimal:GetPosByWorldPos())

				local tmpDis = Vector3.DistanceSquare(self.skillDownPos, tmpTargetPos)

				if tmpDis < Hero20022_Define.SceneInnerRadius * Hero20022_Define.SceneInnerRadius then
					local tmpDir = Vector3.forward
					local angle = MathHelper.getRandom(0, 360)
					local rot = Quaternion.Euler(0, angle, 0)

					tmpDir:MulQuat(rot)
					tmpDir:SetNormalize()
					tmpDir:Mul(Hero20022_Define.SkillDownDis)
					tmpDir:Add(targetAnimal:GetPosByWorldPos())
					self:SetPosByWorldPos(tmpDir, true)

					rot = nil
				else
					local tmpDir = tmpTargetPos - self.skillDownPos

					tmpDir.y = 0

					tmpDir:SetNormalize()
					tmpDir:Mul(Hero20022_Define.SkillDownDis)
					tmpDir:Add(targetAnimal:GetPosByWorldPos())
					self:SetPosByWorldPos(tmpDir, true)
				end
			else
				self.skillDownPos:SetVector3(tmpTargetPos)

				local tmpDir = self:GetPosByWorldPos() - self.skillDownPos

				tmpDir.y = 0

				tmpDir:SetNormalize()
				tmpDir:Mul(Hero20022_Define.SkillDownDis)
				tmpDir:Add(self.skillDownPos)
				self:SetPosByWorldPos(tmpDir, true)
			end

			self:LookAtTargetPoint(self.skillDownPos, true)
			self:SetMoveFly(true)
			self:SetMoveThroughAll(true)

			if self.skillIndex == Hero20022_Define.SkillType.SkillDownShoot then
				local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

				self.skillDownShootPos:SetVector3(self:GetPosByWorldPos())

				self.skillDownShootPos.y = self.skillDownShootPos.y + Hero20022_Define.SkillDownHeight

				local dir = self.skillDownPos - self.skillDownShootPos
				local tmpDis = dir.magnitude

				dir:SetNormalize()
				dir:Mul(tmpDis + 10)
				self.skillDownShootTarget:SetVector3(self.skillDownShootPos)
				self.skillDownShootTarget:Add(dir)

				local eff = VfxManager.PlayFreezeMulti(skillData[AnimalBase_Define.VfxSkillKey1], self.skillDownPos, nil, nil)

				if eff ~= nil then
					if skillData[AnimalBase_Define.VfxSkillDelayKey1] > 0 then
						eff:SetDelayClear(true, nil)
					end

					self:AddSkillEffectLoop(AnimalBase_Define.VfxSkillKey1, eff)
				end
			end

			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
		elseif self.skillCombo == 2 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
			self:PlaySkillEffect(true)
		end
	end
end

function Hero20022:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20022:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20022:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20022_Define.SkillType.SkillS1 then
		if trigger == 1 then
			local tfBox = self:GetWeaponBox(2)
			local startPos = tfBox.position
			local targetPos = GameAI.GetFootTargetByStraightLine(self, startPos, Hero20022_Define.BulletSRangeMin, Hero20022_Define.BulletSRangeMin, Hero20022_Define.BulletSRangeMax, 999)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSSpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()

					if self.bulletSList == nil then
						self.bulletSList = {}
					end

					table.insert(self.bulletSList, bullet)
				end
			end
		elseif trigger == 2 and self.bulletSList ~= nil then
			for k, v in pairs(self.bulletSList) do
				if v ~= nil then
					v:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillS2 then
		if trigger < 4 then
			local tfBox = self:GetWeaponBox(2)
			local startPos = tfBox.position
			local targetPos = GameAI.GetFootTargetByStraightLine(self, startPos, Hero20022_Define.BulletSRangeMin, Hero20022_Define.BulletSRangeMin, Hero20022_Define.BulletSRangeMax, 999)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSSpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()

					if self.bulletSList == nil then
						self.bulletSList = {}
					end

					table.insert(self.bulletSList, bullet)
				end
			end
		elseif trigger == 4 and self.bulletSList ~= nil then
			for k, v in pairs(self.bulletSList) do
				if v ~= nil then
					v:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillNH2 then
		if trigger == 1 then
			self.scene:OpenTrick(Hero20022_Define.TrickId_SkillNH2, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillOP then
		if self.skillCombo == 2 and trigger == 1 then
			self.scene:OpenDelayTrick(Hero20022_Define.TrickId_SkillOP, Hero20022_Define.TrickDelayTime_SkillOP)
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillO then
		if self.skillCombo == 1 then
			if trigger == 1 then
				self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
				self:PlaySkillEffect(true)
			end
		elseif self.skillCombo == 2 then
			if trigger == 1 then
				self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
				self:PlaySkillEffect(true)
			elseif trigger == 2 then
				self.scene:OpenTrick(Hero20022_Define.TrickId_SkillO)
			elseif trigger == 3 then
				self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
				self:PlaySkillEffect(true)
			end
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillNOP then
		if self.skillCombo == 4 and trigger == 1 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:PlaySkillEffect(true)
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillNO then
		if self.skillCombo == 4 and trigger == 1 then
			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self:PlaySkillEffect(true)
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillGiantHand then
		if self.skillCombo == 1 then
			if trigger == 1 then
				self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
				self:PlaySkillEffect(true)
			elseif trigger == 2 then
				self.scene:OpenTrick(Hero20022_Define.TrickId_SkillGiantHand)
			elseif trigger == 3 then
				self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
				self:PlaySkillEffect(true)
			end
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillDownShoot then
		if self.skillCombo == 1 then
			if trigger == 1 then
				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLineWeapon, self, skillData, nil, self.skillDownShootPos, self.skillDownShootTarget, self.bulletDownShootSpeedVec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:Ready()
						bullet:SetColliderMoveWithAnimal(false)
						bullet:Start()

						self.bulletDownShootIndex = bulletIndex
					end
				end

				self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20022_Define.WeaponIndex, false)
			end
		elseif self.skillCombo == 3 and trigger == 1 then
			if self.bulletDownShootIndex > 0 then
				self.controllerBullet:ClearBullet(self.bulletDownShootIndex)
			end

			self.bulletDownShootIndex = 0

			self:ClearSkillEffectLoop(AnimalBase_Define.VfxSkillKey1)
			self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, Hero20022_Define.WeaponIndex, true)
		end
	end
end

function Hero20022:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20022_Define.SkillType.SkillDownShoot and self.skillCombo == 2 or self.skillIndex == Hero20022_Define.SkillType.SkillDown and self.skillCombo == 2 then
		self:SetMoveThroughAll(false)
		self:SetMoveFly(false)
		self:SetPosByWorldPos(self.skillDownPos, true)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillOP and self.skillCombo == 1 then
		-- block empty
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillSP and self.skillCombo == 2 or self.skillIndex == Hero20022_Define.SkillType.SkillNHP1 and self.skillCombo == 2 or self.skillIndex == Hero20022_Define.SkillType.SkillNHP2 and self.skillCombo == 2 or self.skillIndex == Hero20022_Define.SkillType.SkillNLP and self.skillCombo == 1 then
		self:StopSkillAudio()
		self:ClearSkillEffectLoopAll()
		self:ClearSkillEffectAll()
	end

	if self.skillIndex == Hero20022_Define.SkillType.SkillS1 and skillIndexNext ~= Hero20022_Define.SkillType.SkillS1 or self.skillIndex == Hero20022_Define.SkillType.SkillS2 and skillIndexNext ~= Hero20022_Define.SkillType.SkillS2 then
		if self.bulletSList ~= nil then
			for k, v in pairs(self.bulletSList) do
				if v ~= nil then
					v:Exit()
				end
			end

			self.bulletSList = nil
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillDownShoot and skillIndexNext ~= Hero20022_Define.SkillType.SkillDownShoot then
		if self.bulletDownShootIndex > 0 then
			self.controllerBullet:ClearBullet(self.bulletDownShootIndex)
		end

		self.bulletDownShootIndex = 0

		self:ClearSkillEffectLoop(AnimalBase_Define.VfxSkillKey1)
		self:SetMoveThroughAll(false)
		self:SetMoveFly(false)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillDown and skillIndexNext ~= Hero20022_Define.SkillType.SkillDown then
		self:SetMoveThroughAll(false)
		self:SetMoveFly(false)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillOP and skillIndexNext ~= Hero20022_Define.SkillType.SkillOP then
		self:SetMoveThroughAll(false)
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillO and skillIndexNext ~= Hero20022_Define.SkillType.SkillO then
		if self.skillCombo == self.animalConfig.skillComboMax[self.skillIndex] then
			self:AddSkillNextWaitTime(Hero20022_Define.SkillType.SkillDown, Hero20022_Define.WaitTime_SkillO_SkillDown)
		else
			self:SetMoveThroughAll(false)
			self:SetMoveFly(false)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillNOP and skillIndexNext ~= Hero20022_Define.SkillType.SkillNOP then
		if self.skillCombo == self.animalConfig.skillComboMax[self.skillIndex] then
			self:AddSkillNextWaitTime(Hero20022_Define.SkillType.SkillDownShoot, Hero20022_Define.WaitTime_SkillNOP_SkillDownShoot)
		else
			self:SetMoveThroughAll(false)
			self:SetMoveFly(false)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillNO and skillIndexNext ~= Hero20022_Define.SkillType.SkillNO then
		if self.skillCombo == self.animalConfig.skillComboMax[self.skillIndex] then
			self:AddSkillNextWaitTime(Hero20022_Define.SkillType.SkillGiantHand, Hero20022_Define.WaitTime_SkillNO_SkillGiantHand)
			self:KeepLockCamera(self.skillIndex, self.skillCombo)
		else
			self:SetMoveThroughAll(false)
			self:SetMoveFly(false)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)
		end
	elseif self.skillIndex == Hero20022_Define.SkillType.SkillGiantHand and skillIndexNext ~= Hero20022_Define.SkillType.SkillGiantHand then
		self:AddSkillNextWaitTime(Hero20022_Define.SkillType.SkillDown, Hero20022_Define.WaitTime_SkillGiantHand_SkillDown)

		local tmpTargetPos = self.scene:GetSceneSkillPointPos(11)

		self:SetPosByWorldPos(tmpTargetPos, true)
		self:KeepLockCamera(self.skillIndex, self.skillCombo)
		self:UnlockCameraDelay(Hero20022_Define.WaitTime_SkillGiantHand_UnlockCamera)
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20022:UnlockCameraDelay(time)
	if self.boss > 0 then
		self.unlockCameraTimeEnd = TimeHelper.getNowTime() + time
	end
end

function Hero20022:KeepLockCamera(skillIndex, skillCombo)
	if self.boss > 0 and self.isHost == false then
		self.cameraScene:LockSkillingPlayer(self)

		local skillData = MS_SkillData.GetSkillData(self.heroId, skillIndex, skillCombo)

		if skillData ~= nil then
			self.cameraScene:SetBossCameraDistanceSkill(skillData.CameraDistance)
		end

		self.sceneController:UnlockPlayer(self)
	end
end

function Hero20022:LookAtTargetPoint(pos, immediately)
	local tmpDir = pos - self:GetPosByWorldPos()

	tmpDir.y = 0

	if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
		self:LookAt(tmpDir, immediately)
	end

	tmpDir = nil
end

function Hero20022:LookAtScenePoint(id, immediately)
	local tmpTargetPos = self.scene:GetSceneSkillPointPos(id)
	local tmpDir = tmpTargetPos - self:GetPosByWorldPos()

	tmpDir.y = 0

	if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
		self:LookAt(tmpDir, immediately)
	end

	tmpDir = nil
end

function Hero20022:LookAtScenePointBehind(id, immediately)
	local tmpTargetPos = self.scene:GetSceneSkillPointPos(id)
	local tmpDir = self:GetPosByWorldPos() - tmpTargetPos

	tmpDir.y = 0

	if MathHelper.IsZero(tmpDir.sqrMagnitude) == false then
		self:LookAt(tmpDir, immediately)
	end

	tmpDir = nil
end

function Hero20022:JumpToTargetPoint(pos, startTime, endTime)
	if startTime <= self.animatorTime then
		XAnimator.SetMatchTarget(self:GetAnimalId(), self.animatorLayer, pos.x, pos.y, pos.z, self.animatorTime, endTime)
	end
end

function Hero20022:JumpToScenePoint(id, startTime, endTime)
	if startTime <= self.animatorTime then
		local tmpTargetPos = self.scene:GetSceneSkillPointPos(id)

		XAnimator.SetMatchTarget(self:GetAnimalId(), self.animatorLayer, tmpTargetPos.x, tmpTargetPos.y, tmpTargetPos.z, self.animatorTime, endTime)
	end
end

function Hero20022:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20022:UpdateFootEffect()
	if self:IsDead() == true then
		return
	end

	if self.moveOnGround == false or self:IsOnStair() == true or self:IsStanding() == true or self.moveStateNow == AnimalBase_Define.MoveStateType.Fly then
		return
	end

	local leftFootWeight = math.floor(self:GetAnimatorParam(AnimalBase_Define.ParamType.LeftFoot) + 0.5)
	local rightFootWeight = math.floor(self:GetAnimatorParam(AnimalBase_Define.ParamType.RightFoot) + 0.5)

	if leftFootWeight < 1 and self.lastLeftFootWeight >= 1 then
		AudioCtrl.SetFootstepsAudio(self.modelName, self.tfModel, self:GetAnimalId(), self.moveTouchGroundType, self.type, 0)

		if self:GetMoveSpeed() <= AnimalBase_Define.MotionRunSpeed then
			VfxManager.PlayFreezeMulti("vfx_20022_self_1", self:GetPosByWorldPos(), self:GetRotation(), nil)
		else
			VfxManager.PlayFreezeMulti("vfx_20022_self_2", self:GetPosByWorldPos(), self:GetRotation(), nil)
		end
	end

	if rightFootWeight < 1 and self.lastRightFootWeight >= 1 then
		AudioCtrl.SetFootstepsAudio(self.modelName, self.tfModel, self:GetAnimalId(), self.moveTouchGroundType, self.type, 1)
	end

	self.lastLeftFootWeight = leftFootWeight
	self.lastRightFootWeight = rightFootWeight
end

function Hero20022:Exit()
	if self.bulletDownShootIndex > 0 then
		self.controllerBullet:ClearBullet(self.bulletDownShootIndex)
	end

	self.bulletDownShootIndex = 0
	self.skillDownPos = nil
	self.skillDownShootPos = nil
	self.skillDownShootTarget = nil
	self.bulletSList = nil
	self.bulletSSpeedVec3 = nil
	self.bulletDownShootSpeedVec3 = nil

	AnimalBase.Exit(self)
end

return Hero20022
