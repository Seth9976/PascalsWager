-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20053.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20053_Define")

Hero20053 = class("Hero20053", AnimalBase)

function Hero20053:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSpeedVec3 = Vector3.zero
	self.bulletSpeedVec3.z = Hero20053_Define.BulletSpeed
	self.bulletSPList = nil
	self.bulletSwordList = {}
	self.bulletSPSpeedVec3 = Vector3.zero
	self.bulletSPSpeedVec3.z = Hero20053_Define.BulletSPSpeed
	self.isCrazy = false
	self.isRampage = false
	self.bulletSkillSPCnt = 0
	self.bulletSkillSPTime = 0
	self.bulletSwordTime = 0
	self.bulletNHOList = nil
	self.bulletNHOSpeedVec3 = Vector3.zero
	self.bulletNHOSpeedVec3.z = Hero20053_Define.BulletNHOSpeed
	self.shootSwordTime = 0
	self.weakEnable = false
	self.vfxTail = nil
	self.isCrazyPostEffect = false
	self.isUsePost = false
end

function Hero20053:Start()
	AnimalBase.Start(self)

	self.weakEnable = true
	self.animalValue.weakEnable = true
	self.characterColliderWeak = true

	if self.animalGrade > 1 then
		self:SetSkillConditionAll(2)
	else
		self:SetSkillConditionAll(1)
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20053:StartBattle()
	AnimalBase.StartBattle(self)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) then
		self:ResetGrade()
		self:AddGrade(true)
	end
end

function Hero20053:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20053:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)

	if self.animalGrade > 1 then
		self.isCrazy = false
		self.isRampage = false

		local max = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)
		local hp = max * Hero20053_Define.SkillNO2HpPer

		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, hp - 1)
		self:SetSkillConditionAll(2)
		self:ClearSelfEffectLoop("self_1")
		self:ClearSelfEffectLoop("self_2")
		self:ClearSelfEffectLoop("self_3")
		self:ClearStatusById(Hero20053_Define.StatusId_SkillOP)
	end
end

function Hero20053:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
end

function Hero20053:ResetGrade()
	AnimalBase.ResetGrade(self)

	if self.animalGrade < 2 then
		-- block empty
	end
end

function Hero20053:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self:IsSkillingSkill() == true and self.skillIndex == Hero20053_Define.SkillType.SkillSP and self.bulletSPList ~= nil then
		for k, v in pairs(self.bulletSPList) do
			if v ~= nil and v:IsReadying() == true then
				local startPos = v:GetPosition()
				local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20053_Define.BulletSPRangeMax, Hero20053_Define.BulletSPRangeMax, Hero20053_Define.BulletSPRangeMax, 999)

				v:SetEndPosition(targetPos)

				targetPos = nil
			end
		end
	end

	local nowTime = TimeHelper.getNowTime()

	if self.bulletSkillSPCnt > 0 then
		local diffTime = nowTime - self.bulletSkillSPTime

		if diffTime > Hero20053_Define.BulletSPIntervalTime then
			local bullet = self.bulletSPList[self.bulletSkillSPCnt]

			if bullet ~= nil and bullet:IsReadying() == true then
				bullet:SetDelayTime(Hero20053_Define.BulletDelayExplodeTime)
				bullet:Start()
			end

			self.bulletSkillSPTime = nowTime
			self.bulletSkillSPCnt = self.bulletSkillSPCnt - 1
		end
	end

	if self.bulletSwordList ~= nil then
		for k, v in pairs(self.bulletSwordList) do
			if v ~= nil and v:IsReadying() == true then
				local startPos = v:GetPosition()
				local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20053_Define.BulletRangeMax, Hero20053_Define.BulletRangeMax, Hero20053_Define.BulletRangeMax, 999)

				v:SetEndPosition(targetPos)

				targetPos = nil
			end
		end
	end

	if self.bulletSwordList ~= nil and #self.bulletSwordList > 0 then
		local diffTime = nowTime - self.bulletSwordTime

		if diffTime > 0.5 then
			for k, v in pairs(self.bulletSwordList) do
				if v ~= nil and v:IsReadying() == true then
					v:Start()

					self.bulletSwordTime = nowTime

					table.remove(self.bulletSwordList, k)
				end
			end
		end
	end

	if self.animalGrade > 1 then
		local nowTime = TimeHelper.getNowTime()
		local brain = self:GetBrain()

		if brain == nil or brain.behaviourState ~= GameAI.BehaviourState.CircleRound or self:IsSkilling() == true then
			self.shootSwordTime = nowTime
		end

		local diffTime = nowTime - self.shootSwordTime

		if diffTime > Hero20053_Define.ShootSwordIntervalTime and self:IsSkilling() == false then
			local target = GameAI.GetClosestTarget(self)

			if target ~= nil then
				self.shootSwordTime = nowTime

				self:SetSkillTarget(target)

				local skillData = MS_SkillData.GetSkillData(self.heroId, Hero20053_Define.SkillType.SkilShootSword, 1)
				local startPos = self:GetWeaponBox(5).position
				local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20053_Define.BulletRangeMax, Hero20053_Define.BulletRangeMax, Hero20053_Define.BulletRangeMax, 999)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.DelayExplode, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:SetDelayTime(Hero20053_Define.BulletDelayExplodeTime)
						bullet:Ready()
						table.insert(self.bulletSwordList, bullet)

						self.bulletSwordTime = nowTime
					end
				end
			end
		end
	end

	if self.isCrazy == true and self:IsHaveStatusById(AnimalBase_Define.StatusIdClearCrazy) == true then
		self.isCrazy = false

		if self.animalGrade > 1 then
			self:SetSkillConditionAll(2)
		else
			self:SetSkillConditionAll(1)
		end

		self:ClearStatusById(Hero20053_Define.StatusId_SkillOP)
		self:ClearSelfEffectLoop("self_1")
		self:ClearSelfEffectLoop("self_2")
		self:ClearSelfEffectLoop("self_3")
	end

	self:UpdateCrazyEffect()
end

function Hero20053:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20053_Define.SkillType.SkillS then
		if self.skillCombo == 1 and trigger == 1 then
			local startPos = self:GetWeaponBox(4).position
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20053_Define.BulletRangeMax, Hero20053_Define.BulletRangeMax, Hero20053_Define.BulletRangeMax, Hero20053_Define.BulletAngleMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.DelayExplode, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:SetDelayTime(Hero20053_Define.BulletDelayExplodeTime)
					bullet:Ready()
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillOP then
		if self.skillCombo == 1 and trigger == 1 then
			self.isCrazy = true

			if self.animalGrade > 1 then
				self:SetSkillConditionAll(3)
			else
				self:SetSkillConditionAll(2)
			end

			self:AddStatus(self:GetVirtualPlayer(), Hero20053_Define.StatusId_SkillOP, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
			self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(8), Hero20053_Define.VfxName_Eye)
			self:CreateSelfEffectLoop("self_2", self:GetWeaponBox(9), Hero20053_Define.VfxName_Eye)
			self:CreateSelfEffectLoop("self_3", self:GetEffectRoot(AnimalBase_Define.EffectRootType.Chest), Hero20053_Define.VfxName_SkillOP)
		end
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillSP then
		if trigger < Hero20053_Define.BulletSPBulletNum + 1 then
			local tfBox = self:GetWeaponBox(7)
			local startPos = tfBox.position
			local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero20053_Define.BulletSPRangeMax, Hero20053_Define.BulletSPRangeMax, Hero20053_Define.BulletSPRangeMax, 999)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.DelayExplode, self, skillData, nil, startPos, targetPos, self.bulletSPSpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()

					if self.bulletSPList == nil then
						self.bulletSPList = {}
					end

					table.insert(self.bulletSPList, bullet)
				end
			end
		elseif trigger == Hero20053_Define.BulletSPBulletNum + 1 then
			self.bulletSkillSPCnt = Hero20053_Define.BulletSPBulletNum
			self.bulletSkillSPTime = 0
		end
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillNHO then
		if trigger == 1 then
			for i = 1, Hero20053_Define.BulletNHOBulletNum do
				local startPos = self:GetWeaponBox(2).position
				local shootPos = Vector3.zero
				local target = GameAI.GetAttackTarget(self)

				if target ~= nil then
					shootPos:SetVector3(target:GetPosByWorldPos())
				else
					shootPos:SetVector3(self:GetPosByWorldPos())
					shootPos:Add(self:GetForward():SetNormalize():Mul(3))
				end

				local shootDir = shootPos - startPos
				local diffAngle = 360 * (Hero20053_Define.BulletNHOBulletNum - i) / Hero20053_Define.BulletNHOBulletNum
				local rot = Quaternion.AngleAxis(diffAngle, shootDir)
				local tmpUp = Vector3.forward

				tmpUp:MulQuat(rot)

				local targetPos = shootDir + tmpUp

				targetPos:SetNormalize()
				targetPos:Mul(Hero20053_Define.BulletNHORangeMax)
				targetPos:Add(startPos)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.DelayExplode, self, skillData, nil, startPos, targetPos, self.bulletNHOSpeedVec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:Ready()

						if self.bulletNHOList == nil then
							self.bulletNHOList = {}
						end

						table.insert(self.bulletNHOList, bullet)
					end
				end
			end
		elseif trigger == 2 and self.bulletNHOList ~= nil then
			for k, v in pairs(self.bulletNHOList) do
				if v ~= nil then
					v:SetDelayTime(Hero20053_Define.BulletDelayExplodeTime)
					v:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillHHH2 or self.skillIndex == Hero20053_Define.SkillType.SkillHHH2S then
		if self.skillCombo == 3 then
			local pos = self:GetWeaponBox(4).position

			pos.y = self:GetGroundY()

			if trigger == 2 then
				self.scene:OpenTrick(Hero20053_Define.TrickId_SkillHHH2, pos, self:GetRotation())
			end
		end
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillNO2 then
		if self.skillCombo == 1 and trigger == 1 then
			self.isRampage = true
			self.isCrazy = false

			local max = self.animalValue:GetPropertyMax(MS_HeroData.Property.Hp)
			local hp = max * Hero20053_Define.SkillOOHpPer

			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, hp - 1)
			self:SetSkillConditionAll(3)
			self:AddStatus(self:GetVirtualPlayer(), Hero20053_Define.StatusId_SkillNO2, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
			self:AddStatus(self:GetVirtualPlayer(), Hero20053_Define.StatusId_Blood, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
			self:ClearStatusById(Hero20053_Define.StatusId_SkillOP)
			self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(8), Hero20053_Define.VfxName_Eye)
			self:CreateSelfEffectLoop("self_2", self:GetWeaponBox(9), Hero20053_Define.VfxName_Eye)
			self:CreateSelfEffectLoop("self_3", self:GetEffectRoot(AnimalBase_Define.EffectRootType.Chest), Hero20053_Define.VfxName_SkillOP)
			self:CreateSelfEffectLoop("self_4", self:GetEffectRoot(AnimalBase_Define.EffectRootType.Chest), Hero20053_Define.VfxName_SkillNO2)
		end
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillNOP2 then
		if self.skillCombo == 1 then
			self.sceneController:UnlockPlayer(self)
		end
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillOO and self.skillCombo == 4 and trigger == 1 and self.animalGrade > 1 and self.isRampage == true then
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, -1)
		self.animalValue:SetPropertyToZero(MS_HeroData.Property.Hp)
	end
end

function Hero20053:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20053_Define.SkillType.SkillOP and self.skillCombo == 1 or self.skillIndex == Hero20053_Define.SkillType.SkillNO2 and self.skillCombo == 1 then
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
		self.controllerTimer:SetTimeScale(ControllerTimer.Priority.Skill, Hero20053_Define.CrazyTimeScale, Hero20053_Define.CrazyTimeScaleEnterTime, Hero20053_Define.CrazyTimeScaleKeepTime, Hero20053_Define.CrazyTimeScaleExitTime)
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillOO and self.skillCombo == 1 or self.skillIndex == Hero20053_Define.SkillType.SkillNLP and self.skillCombo == 1 then
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillSP then
		if self.bulletSPList ~= nil then
			for k, v in pairs(self.bulletSPList) do
				if v ~= nil then
					v:Exit()
				end
			end

			self.bulletSPList = nil
		end
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillNHO then
		if self.bulletNHOList ~= nil then
			for k, v in pairs(self.bulletNHOList) do
				if v ~= nil then
					v:Exit()
				end
			end

			self.bulletNHOList = nil
		end
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillNOP2 then
		local skillPointPos = self.scene:GetSceneSkillPointPos(1)

		self.scene:OpenTrick(Hero20053_Define.TrickId_SkillNOP2, self:GetPosByWorldPos(), Quaternion.identity)
	end
end

function Hero20053:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20053:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20053_Define.SkillType.SkillOP and self.skillCombo == 1 or self.skillIndex == Hero20053_Define.SkillType.SkillNO2 and self.skillCombo == 1 then
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)
		self.controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.Skill)
		self:UpdateCrazyEffect()
	elseif self.skillIndex == Hero20053_Define.SkillType.SkillNLP and skillComboNext ~= Hero20053_Define.SkillType.SkillNLP then
		self.isCrazy = false

		if self.animalGrade > 1 then
			self:SetSkillConditionAll(2)
		else
			self:SetSkillConditionAll(1)
		end

		self:ClearStatusById(Hero20053_Define.StatusId_SkillOP)
		self:ClearSelfEffectLoop("self_1")
		self:ClearSelfEffectLoop("self_2")
		self:ClearSelfEffectLoop("self_3")
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20053:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20053:IsCrazy()
	return self.isCrazy
end

function Hero20053:IsRampage()
	return self.isRampage
end

function Hero20053:SetWeakEnable(flg)
	if self.weakEnable ~= flg then
		self.weakEnable = flg

		if flg == false then
			self.characterColliderWeak = false

			self:ChangeHit(AnimalBase_Define.HitType.BodyBreak, nil, nil, AnimalBase_Define.MoveStateChangeLevel.LowAndEqual)
		end
	end
end

function Hero20053:GetWeakEnable()
	return self.weakEnable
end

function Hero20053:OnHitTrigger(trigger)
	AnimalBase.OnHitTrigger(self, trigger)

	if self.moveHitType == AnimalBase_Define.HitType.BodyBreak and trigger == 1 then
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Act, 1, false)

		if self.bodyHandBoxConfig[Hero20053_Define.WeakWeaponHandId] ~= nil then
			for i, config in pairs(self.bodyHandBoxConfig[Hero20053_Define.WeakWeaponHandId]) do
				if self.bodyHandBoxConfig[Hero20053_Define.WeakWeaponHandId][i] ~= nil then
					self.bodyHandBoxConfig[Hero20053_Define.WeakWeaponHandId][i]:HideAttackBox(false)
				end
			end
		end

		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.gameController:CheckHideQuestComplete(Hero20053_Define.BodyBreakQusetId) == false then
			self.gameController:CompleteQuest(Hero20053_Define.BodyBreakQusetId)
		end

		self.vfxTail = VfxManager.PlayFreezeMulti(Hero20053_Define.BodyBreakVfxName, self:GetPosByWorldPos(), self:GetRotation(), nil)
	end
end

function Hero20053:UpdateCrazyEffect()
	if LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Medium then
		local useFlg = false
		local timeScale = 1

		useFlg, timeScale = self.controllerTimer:GetTimeScaleByPriority(ControllerTimer.Priority.Skill)

		if useFlg == true then
			self.crazyPostEffect = true

			local intensity = MathHelper.getValueInRadioRange(timeScale, 1, Hero20053_Define.CrazyTimeScale, 0, 1)

			self.scene:InterpChromaticAberrationIntensity(true, intensity)
			log("====Intensity==" .. intensity)
		elseif self.crazyPostEffect == true then
			self.crazyPostEffect = false

			self.scene:RecoveryChromaticAberrationIntensity()
			log("===Recovery=Intensity==")
		end
	end
end

function Hero20053:ExitBattle()
	self.scene:StopTrick(Hero20053_Define.TrickId_SkillHHH2)
	self.scene:StopTrick(Hero20053_Define.TrickId_SkillNOP2)

	if self.vfxTail ~= nil then
		self.vfxTail:Clear()
	end

	AnimalBase.ExitBattle(self)
end

function Hero20053:Exit()
	self.bulletSpeedVec3 = nil

	if self.bulletSPList ~= nil then
		for k, v in pairs(self.bulletSPList) do
			if v ~= nil then
				v:Exit()
			end
		end

		self.bulletSPList = nil
	end

	if self.bulletSwordList ~= nil then
		for k, v in pairs(self.bulletSwordList) do
			if v ~= nil then
				v:Exit()
			end
		end

		self.bulletSwordList = nil
	end

	self.bulletSPSpeedVec3 = nil

	if self.bulletNHOList ~= nil then
		for k, v in pairs(self.bulletNHOList) do
			if v ~= nil then
				v:Exit()
			end
		end

		self.bulletNHOList = nil
	end

	self.bulletNHOSpeedVec3 = nil

	if self.vfxTail ~= nil then
		self.vfxTail:Clear()
	end

	AnimalBase.Exit(self)
end

return Hero20053
