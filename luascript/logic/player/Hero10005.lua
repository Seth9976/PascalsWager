-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero10005.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero10005_Define")

Hero10005 = class("Hero10005", AnimalBase)

function Hero10005:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Hero)

	self.commonSkillCondition = 0
	self.finalSkillCondition = 0
	self.finalSkillParamMax = 0
	self.changeBuffer = 0
	self.changeBufferShow = 0
	self.skillPose = 1
	self.reserveRage = false
	self.skillComboAttack = 0
	self.bulletSpeedVec3 = Vector3.zero
	self.bulletSpeedVec3.z = Hero10005_Define.BulletSpeed
	self.bulletSkillData = nil
	self.bulletCnt = 0
	self.bulletTime = 0
	self.paramResetTime = 0
	self.dodgeCnt = 0
	self.dodgePostEffect = false

	self:SetParamThreshold(AnimalBase_Define.ParamType.RunExit, self.dodgeCnt)

	self.dodgeSkillList = {}

	table.insert(self.dodgeSkillList, AnimalBase_Define.SkillType.Dodge)
	table.insert(self.dodgeSkillList, AnimalBase_Define.SkillType.DodgeSpecial)
	table.insert(self.dodgeSkillList, AnimalBase_Define.SkillType.DodgeJump)
	table.insert(self.dodgeSkillList, AnimalBase_Define.SkillType.DodgeJumpSpecial)
end

function Hero10005:Start()
	AnimalBase.Start(self)
	self:ResetAttackSkillCondition()

	if self.heroVariety > 1 then
		self:SetWeaponVisible(AnimalBase_Define.VisibleType.Variety, 1, false)
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 11, 0, 0)
	else
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
	end

	if self.isHost == true and self.isHostBack == false then
		UIManager.SendMessage("Mainmenu", "SetRageJBar", self.changeBufferShow)
	end

	for _, skillIndex in pairs(self.dodgeSkillList) do
		self:SetSkillCondition(skillIndex, 1)
	end
end

function Hero10005:GetChangeCnt()
	local cnt = Mathf.Ceil(Mathf.Ceil(self.changeBuffer) / 10)

	cnt = Mathf.Clamp(cnt, 0, Hero10005_Define.ChangeCntMax)

	return cnt
end

function Hero10005:UpdateChangeBuffer()
	if self:GetGrade() > 1 then
		return
	end

	local cnt = self:GetChangeCnt()

	if cnt > 0 then
		local speed = Hero10005_Define.ChangeCntSpeed[cnt]

		self.changeBuffer = self.changeBuffer - speed * ControllerMain.GetLogicDeltaTime()

		if self.changeBuffer <= 0 then
			self.changeBuffer = 0
		end

		cnt = self:GetChangeCnt()

		if cnt <= 0 then
			self:ClearChangeBuffer()
		end
	else
		self:ClearChangeBuffer()
	end

	self:ShowChangeBuffer()
end

function Hero10005:ShowChangeBuffer()
	if self.isHost == true and self.isHostBack == false then
		local old = self.changeBufferShow

		self.changeBufferShow = self:GetChangeCnt()

		if self.changeBufferShow ~= old then
			UIManager.SendMessage("Mainmenu", "SetRageJBar", self.changeBufferShow)
		end
	end
end

function Hero10005:SubChangeBuffer()
	if self:GetGrade() > 1 then
		return
	end

	local cnt = self:GetChangeCnt()

	if cnt > 1 then
		self.changeBuffer = Hero10005_Define.ChangeCntTimeMax[cnt - 1]
	else
		self.changeBuffer = 0
	end

	self:ShowChangeBuffer()
end

function Hero10005:ClearChangeBuffer()
	self.changeBuffer = 0

	self:SetAttackSkillCondition(self.commonSkillCondition, self.finalSkillCondition)
	self:ClearSelfEffectLoop(Hero10005_Define.EffectSelfKey1)
	self:ShowChangeBuffer()
end

function Hero10005:AddChangeBuffer(add)
	local cnt = self:GetChangeCnt()

	if cnt <= 0 and add > 0 then
		self:CreateSelfEffectLoop(Hero10005_Define.EffectSelfKey1, self:GetWeaponBox(2), Hero10005_Define.EffectSelfName1)
	end

	cnt = cnt + add

	if cnt > Hero10005_Define.ChangeCntMax then
		cnt = Hero10005_Define.ChangeCntMax
	else
		local vfxRoot = self:GetWeaponBox(2)

		if vfxRoot ~= nil then
			local eff = self:PlayEffect(vfxRoot, Hero10005_Define.EffectNameAddBuffer, 1)

			if eff ~= nil then
				self:AddSkillEffect(Hero10005_Define.EffectKeyAddBuffer, eff)
			end
		end
	end

	self.changeBuffer = Hero10005_Define.ChangeCntTimeMax[cnt]

	self:LogTest("====AddChangeBuffer===========self.changeBuffer=" .. self.changeBuffer)
	self:SetAttackSkillCondition(self.commonSkillCondition, self.finalSkillCondition)
	self:ShowChangeBuffer()
end

function Hero10005:SetWeaponAllVisible(type, flg)
	AnimalBase.SetWeaponAllVisible(self, type, flg)

	if type == AnimalBase_Define.VisibleType.Act or type == AnimalBase_Define.VisibleType.Dialog then
		if flg == false then
			self:ClearSelfEffectLoop(Hero10005_Define.EffectSelfKey1)
		else
			local cnt = self:GetChangeCnt()

			if cnt > 0 then
				self:CreateSelfEffectLoop(Hero10005_Define.EffectSelfKey1, self:GetWeaponBox(2), Hero10005_Define.EffectSelfName1)
			end
		end
	end
end

function Hero10005:ResetAttackSkillCondition()
	self:SetAttackSkillCondition(1, 0)
end

function Hero10005:SetAttackSkillCondition(commonSkillParam, finalSkillParam)
	local changeFlg = false
	local gradeUpLimit = 10

	if finalSkillParam > 0 then
		self.finalSkillParamMax = Mathf.Max(self.finalSkillParamMax, finalSkillParam)
	else
		self.finalSkillParamMax = 0
	end

	finalSkillParam = self.finalSkillParamMax
	self.commonSkillCondition = commonSkillParam
	self.finalSkillCondition = finalSkillParam

	if self:GetGrade() > 1 then
		changeFlg = true
	elseif self.changeBuffer > 0 then
		changeFlg = true
	end

	if changeFlg == true then
		if commonSkillParam > 0 and commonSkillParam < gradeUpLimit then
			commonSkillParam = commonSkillParam + gradeUpLimit
		end

		if finalSkillParam > 0 and finalSkillParam < gradeUpLimit then
			finalSkillParam = finalSkillParam + gradeUpLimit
		end
	end

	for _, skillIndex in pairs(Hero10005_Define.CommonSkillType) do
		self:SetSkillCondition(skillIndex, commonSkillParam)
	end

	for _, skillIndex in pairs(Hero10005_Define.FinalSkillType) do
		self:SetSkillCondition(skillIndex, finalSkillParam)
	end
end

function Hero10005:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true then
		if self.skillIndex == Hero10005_Define.SkillType.SkillLP1 or self.skillIndex == Hero10005_Define.SkillType.SkillLP2 then
			if self.skillCombo == 3 then
				local hitPlayer = hitData:GetHitPlayer()

				if hitPlayer ~= nil then
					self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
				end
			end
		elseif self.skillIndex == AnimalBase_Define.SkillType.Backstab or self.skillIndex == AnimalBase_Define.SkillType.Execute then
			local hitPlayer = hitData:GetHitPlayer()

			if hitPlayer ~= nil then
				local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillAddStatus, self.skillIndex, self.skillCombo)

				if statusIdAdd > 0 then
					local statusId = Hero10005_Define.TalentDarkClearStatusId

					hitPlayer:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
				end
			end
		end
	end
end

function Hero10005:OnHit(isFirst, attackerData)
	AnimalBase.OnHit(self, isFirst, attackerData)

	if isFirst == true and attackerData ~= nil then
		self:ResetDodgeCnt()
	end
end

function Hero10005:OnHitHand(isFirst, attackerData)
	local retHitHand = AnimalBase.OnHitHand(self, isFirst, attackerData)

	if retHitHand ~= AnimalBase_Define.HitHandType.Fail then
		self:AddChangeBuffer(1)
	end
end

function Hero10005:OnHitHandTrick(isFirst, touchData)
	local retHitHand = AnimalBase.OnHitHandTrick(self, isFirst, touchData)

	if retHitHand ~= AnimalBase_Define.HitHandType.Fail then
		self:AddChangeBuffer(1)
	end
end

function Hero10005:OnCounterAttack(isFirst, attackerData)
	AnimalBase.OnCounterAttack(self, isFirst, attackerData)

	if isFirst == true and attackerData ~= nil and self:IsSkillingSkill() == true and self.skillIndex == Hero10005_Define.SkillType.SkillS21 and self.animatorTrigger < 1 and self:IsHeroSanNotNormal(10005) == true then
		local tmpTalentReserve = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SanRageReserve, 0, 0)

		if tmpTalentReserve > 0 then
			self.reserveRage = true
		end
	end
end

function Hero10005:OnBeatBack(isFirst, attackerData)
	AnimalBase.OnBeatBack(self, isFirst, attackerData)
	self:LogTest("============OnBeatBack===========self.skillIndex=" .. self.skillIndex .. ",self.skillCombo=" .. self.skillCombo)

	if isFirst == true and self:IsSkillingSkill() == true then
		local addCombo = 0

		if self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial or self.skillIndex == AnimalBase_Define.SkillType.Dodge then
			if self.skillCombo == 1 then
				addCombo = 2
			elseif self.skillCombo == 2 then
				addCombo = 3
			elseif self.skillCombo == 4 then
				addCombo = 1
			end
		elseif (self.skillIndex == AnimalBase_Define.SkillType.DodgeJumpSpecial or self.skillIndex == AnimalBase_Define.SkillType.DodgeJump) and self.skillCombo == 1 then
			addCombo = 1
		end

		if addCombo > 0 then
			if self.isHost == true then
				local tmpTrophyEnergy = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.DodgeEnergyAdd)

				if tmpTrophyEnergy > 0 then
					self.animalValue:AddProperty(MS_HeroData.Property.Energy, Hero10005_Define.DodgeAddEnergy)
				end
			end

			local nextSkillCombo = self.skillCombo + addCombo
			local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, nextSkillCombo)

			self:LogTest("============OnBeatBack=====Success!!!=====self.skillIndex=" .. self.skillIndex .. ",nextSkillCombo=" .. nextSkillCombo)
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, nextSkillCombo, skillData.BtnPressType, skillData.BtnIndex)
		elseif (self.skillIndex == Hero10005_Define.SkillType.SkillLH11T or self.skillIndex == Hero10005_Define.SkillType.SkillLH21T or self.skillIndex == Hero10005_Define.SkillType.SkillLH11 or self.skillIndex == Hero10005_Define.SkillType.SkillLH21) and self.isHost == true and self.isHostBack == false then
			self.controllerTimer:SetTimeScale(ControllerTimer.Priority.Skill, Hero10005_Define.DodgeTimeScale, Hero10005_Define.DodgeTimeScaleEnterTime, Hero10005_Define.DodgeTimeScaleKeepTime, Hero10005_Define.DodgeTimeScaleExitTime)
		end

		local talentChangeBuffer = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.BeatbackChangeBuffer, 0, 0)

		if talentChangeBuffer > 0 then
			self:AddChangeBuffer(1)
		end
	end
end

function Hero10005:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	self:UpdateChangeBuffer()
	self:ShootBullet()

	local nowTime = TimeHelper.getNowTime()

	if self:IsSkillingById(AnimalBase_Define.SkillType.Dodge, 0) == true or self:IsSkillingById(AnimalBase_Define.SkillType.DodgeSpecial, 0) == true or self:IsSkillingById(AnimalBase_Define.SkillType.DodgeJump, 0) == true or self:IsSkillingById(AnimalBase_Define.SkillType.DodgeJumpSpecial, 0) == true then
		local isRunExit = self:GetAnimatorParam(AnimalBase_Define.ParamType.RunExit)

		if isRunExit > 0 then
			if nowTime > self.paramResetTime then
				self:ResetDodgeCnt()
			end
		else
			self.paramResetTime = nowTime + Hero10005_Define.DodgeResetCntTime
		end
	elseif nowTime > self.paramResetTime then
		self:ResetDodgeCnt()
	end

	if self.isHost == true and self.isHostBack == false then
		self:UpdateDodgeEffect()
	end

	if self:IsSkillingById(AnimalBase_Define.SkillType.SkillSP11, 0) == false then
		self.animalValue:RecoveryPower()
	end
end

function Hero10005:UpdateDodgeEffect()
	if LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Medium then
		local useFlg = false
		local timeScale = 1

		useFlg, timeScale = self.controllerTimer:GetTimeScaleByPriority(ControllerTimer.Priority.Skill)

		if useFlg == true then
			self.dodgePostEffect = true

			local intensity = MathHelper.getValueInRadioRange(timeScale, 1, Hero10005_Define.DodgeTimeScale, 0, 1)

			self.scene:InterpChromaticAberrationIntensity(true, intensity)
		elseif self.dodgePostEffect == true then
			self.dodgePostEffect = false

			self.scene:RecoveryChromaticAberrationIntensity()
		end
	end
end

function Hero10005:ResetDodgeCnt()
	self.paramResetTime = TimeHelper.getNowTime() + Hero10005_Define.DodgeResetCntTime
	self.dodgeCnt = 0

	for _, skillIndex in pairs(self.dodgeSkillList) do
		self:SetSkillCondition(skillIndex, 1)
	end
end

function Hero10005:AddDodgeCnt()
	self.dodgeCnt = self.dodgeCnt + 1

	SystemHelper.LogTest("======AddDodgeCnt====self.dodgeCnt=" .. self.dodgeCnt)

	if self.dodgeCnt >= Hero10005_Define.DodgeResetCntMax then
		for _, skillIndex in pairs(self.dodgeSkillList) do
			self:SetSkillCondition(skillIndex, 2)
		end
	end
end

function Hero10005:SubDodgeCnt()
	self.dodgeCnt = self.dodgeCnt - 1

	if self.dodgeCnt < 0 then
		self.dodgeCnt = 0
	end

	SystemHelper.LogTest("======SubDodgeCnt====self.dodgeCnt=" .. self.dodgeCnt)

	if self.dodgeCnt < Hero10005_Define.DodgeResetCntMax then
		for _, skillIndex in pairs(self.dodgeSkillList) do
			self:SetSkillCondition(skillIndex, 1)
		end
	end
end

function Hero10005:OnSkillStart()
	AnimalBase.OnSkillStart(self)
	self:LogTest("====OnSkillStart=====self.skillIndex=" .. self.skillIndex .. ",self.skillCombo=" .. self.skillCombo)

	if (self.skillIndex == Hero10005_Define.SkillType.SkillLP1 or self.skillIndex == Hero10005_Define.SkillType.SkillLP2) and self.skillCombo == 2 then
		self:CreateSelfEffectLoop(Hero10005_Define.EffectSelfKey2, self:GetWeaponBox(2), Hero10005_Define.EffectSelfName2)
	end

	for _, skillIndex in pairs(Hero10005_Define.CommonSkillType) do
		if self.skillIndex == skillIndex then
			self:ResetDodgeCnt()

			break
		end
	end

	if self.skillIndex == Hero10005_Define.SkillType.SkillL21 and self.skillCombo == 2 or self.skillIndex == Hero10005_Define.SkillType.SkillL22 or self.skillIndex == Hero10005_Define.SkillType.SkillL23 or self.skillIndex == Hero10005_Define.SkillType.SkillL24 or self.skillIndex == Hero10005_Define.SkillType.SkillL25 or self.skillIndex == Hero10005_Define.SkillType.SkillL26 and self.skillCombo == 2 or self.skillIndex == Hero10005_Define.SkillType.SkillH21 or self.skillIndex == Hero10005_Define.SkillType.SkillH22 or self.skillIndex == Hero10005_Define.SkillType.SkillH23 or self.skillIndex == Hero10005_Define.SkillType.SkillH24 or self.skillIndex == Hero10005_Define.SkillType.SkillH25 or self.skillIndex == Hero10005_Define.SkillType.SkillDL2 or self.skillIndex == Hero10005_Define.SkillType.SkillDH2 or self.skillIndex == Hero10005_Define.SkillType.SkillLH21T or self.skillIndex == Hero10005_Define.SkillType.SkillLH22T or self.skillIndex == Hero10005_Define.SkillType.SkillLH23T or self.skillIndex == Hero10005_Define.SkillType.SkillHL21T or self.skillIndex == Hero10005_Define.SkillType.SkillHL22T or self.skillIndex == Hero10005_Define.SkillType.SkillHL23T or self.skillIndex == Hero10005_Define.SkillType.SkillLH21 or self.skillIndex == Hero10005_Define.SkillType.SkillLH22 or self.skillIndex == Hero10005_Define.SkillType.SkillLH23 or self.skillIndex == Hero10005_Define.SkillType.SkillHL21 or self.skillIndex == Hero10005_Define.SkillType.SkillHL22 or self.skillIndex == Hero10005_Define.SkillType.SkillHL23 or self.skillIndex == Hero10005_Define.SkillType.SkillHL24 and self.skillCombo == 1 or self.skillIndex == Hero10005_Define.SkillType.SkillHL24T and self.skillCombo == 1 then
		self:SubChangeBuffer()
	end

	if self.skillIndex == Hero10005_Define.SkillType.SkillLP1 or self.skillIndex == Hero10005_Define.SkillType.SkillLP2 or self.skillIndex == Hero10005_Define.SkillType.SkillL11 or self.skillIndex == Hero10005_Define.SkillType.SkillL21 or self.skillIndex == Hero10005_Define.SkillType.SkillL16 or self.skillIndex == Hero10005_Define.SkillType.SkillL26 then
		if self.skillCombo == 1 then
			self:SetAttackSkillCondition(self.commonSkillCondition, self.finalSkillCondition)
		elseif self.skillCombo == 2 then
			self:SetAttackSkillCondition(2, 1)
		end
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillDL1 or self.skillIndex == Hero10005_Define.SkillType.SkillDL2 then
		if self.skillCombo == 1 then
			self:SetAttackSkillCondition(2, 1)
		end
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillL12 or self.skillIndex == Hero10005_Define.SkillType.SkillL22 then
		self:SetAttackSkillCondition(3, 1)
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillL13 or self.skillIndex == Hero10005_Define.SkillType.SkillL23 then
		self:SetAttackSkillCondition(4, 2)
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillL14 or self.skillIndex == Hero10005_Define.SkillType.SkillL24 then
		self:SetAttackSkillCondition(5, 2)
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillL15 or self.skillIndex == Hero10005_Define.SkillType.SkillL25 then
		self:SetAttackSkillCondition(1, 3)
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillH11 or self.skillIndex == Hero10005_Define.SkillType.SkillH21 or self.skillIndex == Hero10005_Define.SkillType.SkillDH1 or self.skillIndex == Hero10005_Define.SkillType.SkillDH2 then
		self:SetAttackSkillCondition(2, 6)
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillH12 or self.skillIndex == Hero10005_Define.SkillType.SkillH22 then
		self:SetAttackSkillCondition(3, 7)
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillH13 or self.skillIndex == Hero10005_Define.SkillType.SkillH23 then
		self:SetAttackSkillCondition(4, 8)
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillH14 or self.skillIndex == Hero10005_Define.SkillType.SkillH24 then
		self:SetAttackSkillCondition(5, 8)
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillH15 or self.skillIndex == Hero10005_Define.SkillType.SkillH25 then
		self:SetAttackSkillCondition(1, 9)
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillLH11T or self.skillIndex == Hero10005_Define.SkillType.SkillLH12T or self.skillIndex == Hero10005_Define.SkillType.SkillLH13T or self.skillIndex == Hero10005_Define.SkillType.SkillLH21T or self.skillIndex == Hero10005_Define.SkillType.SkillLH22T or self.skillIndex == Hero10005_Define.SkillType.SkillLH23T or self.skillIndex == Hero10005_Define.SkillType.SkillHL11T or self.skillIndex == Hero10005_Define.SkillType.SkillHL12T or self.skillIndex == Hero10005_Define.SkillType.SkillHL13T or self.skillIndex == Hero10005_Define.SkillType.SkillHL14T or self.skillIndex == Hero10005_Define.SkillType.SkillHL21T or self.skillIndex == Hero10005_Define.SkillType.SkillHL22T or self.skillIndex == Hero10005_Define.SkillType.SkillHL23T or self.skillIndex == Hero10005_Define.SkillType.SkillHL24T or self.skillIndex == Hero10005_Define.SkillType.SkillLH11 or self.skillIndex == Hero10005_Define.SkillType.SkillLH12 or self.skillIndex == Hero10005_Define.SkillType.SkillLH13 or self.skillIndex == Hero10005_Define.SkillType.SkillLH21 or self.skillIndex == Hero10005_Define.SkillType.SkillLH22 or self.skillIndex == Hero10005_Define.SkillType.SkillLH23 or self.skillIndex == Hero10005_Define.SkillType.SkillHL11 or self.skillIndex == Hero10005_Define.SkillType.SkillHL12 or self.skillIndex == Hero10005_Define.SkillType.SkillHL13 or self.skillIndex == Hero10005_Define.SkillType.SkillHL14 or self.skillIndex == Hero10005_Define.SkillType.SkillHL21 or self.skillIndex == Hero10005_Define.SkillType.SkillHL22 or self.skillIndex == Hero10005_Define.SkillType.SkillHL23 or self.skillIndex == Hero10005_Define.SkillType.SkillHL24 then
		self:ResetAttackSkillCondition()
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillS11 or self.skillIndex == Hero10005_Define.SkillType.SkillS12 or self.skillIndex == Hero10005_Define.SkillType.SkillS13 or self.skillIndex == Hero10005_Define.SkillType.SkillS14 then
		local tmpTalentCombo = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SpecialCombo, 0, 0)

		if tmpTalentCombo <= 0 then
			self:ResetAttackSkillCondition()
		else
			self:SetAttackSkillCondition(self.commonSkillCondition, self.finalSkillCondition)
		end

		if self.skillIndex == Hero10005_Define.SkillType.SkillS11 and self.skillCombo == 2 or self.skillIndex == Hero10005_Define.SkillType.SkillS12 and self.skillCombo == 2 or self.skillIndex == Hero10005_Define.SkillType.SkillS13 and self.skillCombo == 2 or self.skillIndex == Hero10005_Define.SkillType.SkillS14 and self.skillCombo == 2 then
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, self.skillPose, 0, 0)

			self.skillPose = self.skillPose % Hero10005_Define.PoseMax + 1
		end
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillS21 then
		self.reserveRage = false
	elseif self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial or self.skillIndex == AnimalBase_Define.SkillType.Dodge then
		if self.skillCombo == 3 or self.skillCombo == 5 then
			if self.isHost == true and self.isHostBack == false then
				self.controllerTimer:SetTimeScale(ControllerTimer.Priority.Skill, Hero10005_Define.DodgeTimeScale, Hero10005_Define.DodgeTimeScaleEnterTime, Hero10005_Define.DodgeTimeScaleKeepTime, Hero10005_Define.DodgeTimeScaleExitTime)
			end

			self:SubDodgeCnt()
		else
			self:AddDodgeCnt()
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.DodgeJumpSpecial or self.skillIndex == AnimalBase_Define.SkillType.DodgeJump then
		if self.skillCombo == 2 and self.isHost == true and self.isHostBack == false then
			self.controllerTimer:SetTimeScale(ControllerTimer.Priority.Skill, Hero10005_Define.DodgeTimeScale, Hero10005_Define.DodgeTimeScaleEnterTime, Hero10005_Define.DodgeTimeScaleKeepTime, Hero10005_Define.DodgeTimeScaleExitTime)
		end

		self:ResetAttackSkillCondition()
		self:ResetDodgeCnt()
	end
end

function Hero10005:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero10005:OnSkillEnd(skillIndexNext, skillComboNext)
	if (self.skillIndex == Hero10005_Define.SkillType.SkillLP1 or self.skillIndex == Hero10005_Define.SkillType.SkillLP2) and self.skillIndex ~= skillIndexNext then
		self:ClearSelfEffectLoop(Hero10005_Define.EffectSelfKey2)
	end

	if skillIndexNext <= 0 then
		self:ResetAttackSkillCondition()

		self.skillComboAttack = 0

		self:ClearBullet()
	end

	if self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial or self.skillIndex == AnimalBase_Define.SkillType.Dodge then
		if (self.skillCombo == 3 or self.skillCombo == 5) and self.isHost == true and self.isHostBack == false then
			self.controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.Skill)
			self:UpdateDodgeEffect()
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.DodgeJumpSpecial or self.skillIndex == AnimalBase_Define.SkillType.DodgeJump then
		if self.skillCombo == 2 and self.isHost == true and self.isHostBack == false then
			self.controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.Skill)
			self:UpdateDodgeEffect()
		end
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillLH11T or self.skillIndex == Hero10005_Define.SkillType.SkillLH21T or self.skillIndex == Hero10005_Define.SkillType.SkillLH11 or self.skillIndex == Hero10005_Define.SkillType.SkillLH21 then
		if self.isHost == true and self.isHostBack == false then
			self.controllerTimer:RecoveryTimeScale(ControllerTimer.Priority.Skill)
			self:UpdateDodgeEffect()
		end
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillS11 or self.skillIndex == Hero10005_Define.SkillType.SkillS12 or self.skillIndex == Hero10005_Define.SkillType.SkillS13 or self.skillIndex == Hero10005_Define.SkillType.SkillS14 then
		self:StopSkillAudio()
	end

	local cnt = self:GetChangeCnt()

	if cnt <= 0 then
		self:ClearSelfEffectLoop(Hero10005_Define.EffectSelfKey1)
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero10005:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero10005_Define.SkillType.SkillSP11 then
		if self.skillCombo == 2 and trigger == 1 then
			self:AddChangeBuffer(Hero10005_Define.ChangeCntMax)
			self:AddGrade(false)
		end
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillS21 and self.skillCombo == 1 and trigger == 1 then
		self:ResetGrade()

		if self.reserveRage == false then
			self.animalValue:SetPropertyToZero(MS_HeroData.Property.Rage)
		end
	end

	if self.skillIndex == Hero10005_Define.SkillType.SkillS11 and self.skillCombo == 2 or self.skillIndex == Hero10005_Define.SkillType.SkillS12 and self.skillCombo == 2 then
		if trigger == 1 then
			self:AddChangeBuffer(1)
		elseif trigger == 2 then
			local tmpTalentAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.AddChangeBuffer, 0, 0)

			if tmpTalentAdd > 0 then
				self:AddChangeBuffer(1)
			end
		end
	end

	if self.skillIndex == Hero10005_Define.SkillType.SkillHL14T or self.skillIndex == Hero10005_Define.SkillType.SkillHL21T or self.skillIndex == Hero10005_Define.SkillType.SkillHL22T or self.skillIndex == Hero10005_Define.SkillType.SkillHL23T or self.skillIndex == Hero10005_Define.SkillType.SkillHL21 or self.skillIndex == Hero10005_Define.SkillType.SkillHL22 or self.skillIndex == Hero10005_Define.SkillType.SkillHL23 or self.skillIndex == Hero10005_Define.SkillType.SkillHL14 then
		if self.skillCombo == 1 and trigger == 1 then
			self:SetBullet(skillData, 1)
		end
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillHL24 then
		if self.skillCombo == 1 and trigger == 1 then
			self:SetBullet(skillData, Hero10005_Define.BulletNum)
		end
	elseif self.skillIndex == Hero10005_Define.SkillType.SkillHL24T then
		if self.skillCombo == 1 and trigger == 1 then
			self:SetBullet(skillData, Hero10005_Define.BulletNumT)
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial or self.skillIndex == AnimalBase_Define.SkillType.Dodge then
		if (self.skillCombo == 3 or self.skillCombo == 5) and trigger == 1 then
			self:PlaySkillEffect(true)

			if self.skillEffect ~= nil then
				for i = 1, AnimalBase_Define.VfxSkillKeyNum do
					local tmpKey = AnimalBase_Define.VfxSkillTriggerKey .. i

					if self.skillEffect[tmpKey] ~= nil then
						local rot = Quaternion.LookRotation(self.moveDirDodge)

						self.skillEffect[tmpKey]:SetRotation(rot.x, rot.y, rot.z, rot.w)

						rot = nil
					end
				end
			end
		end
	elseif (self.skillIndex == AnimalBase_Define.SkillType.DodgeJumpSpecial or self.skillIndex == AnimalBase_Define.SkillType.DodgeJump) and self.skillCombo == 2 and trigger == 1 then
		self:PlaySkillEffect(true)

		if self.skillEffect ~= nil then
			for i = 1, AnimalBase_Define.VfxSkillKeyNum do
				local tmpKey = AnimalBase_Define.VfxSkillTriggerKey .. i

				if self.skillEffect[tmpKey] ~= nil then
					local rot = Quaternion.LookRotation(self.moveDirDodge)

					self.skillEffect[tmpKey]:SetRotation(rot.x, rot.y, rot.z, rot.w)

					rot = nil
				end
			end
		end
	end
end

function Hero10005:SetBullet(skillData, cnt)
	self.bulletSkillData = skillData
	self.bulletCnt = cnt
	self.bulletTime = TimeHelper.getNowTime()
end

function Hero10005:ClearBullet()
	self.bulletSkillData = nil
	self.bulletCnt = 0
	self.bulletTime = 0
end

function Hero10005:ShootBullet()
	if self.bulletSkillData == nil or self.bulletCnt <= 0 then
		return
	end

	local nowTime = TimeHelper.getNowTime()
	local diff = nowTime - self.bulletTime

	if diff < Hero10005_Define.BulletIntervalTime then
		return
	end

	local startPos = self:GetBodyChest().position
	local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero10005_Define.BulletRangeMax, Hero10005_Define.BulletRangeMax, Hero10005_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

	if self.controllerBullet ~= nil then
		local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, self.bulletSkillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
		local bullet = self.controllerBullet:GetBullet(bulletIndex)

		if bullet ~= nil then
			bullet:Ready()
			bullet:Start()

			self.bulletTime = nowTime + Hero10005_Define.BulletIntervalTime
			self.bulletCnt = self.bulletCnt - 1
		end
	end

	startPos = nil
	targetPos = nil
end

function Hero10005:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	self.changeBuffer = 0

	self:ShowChangeBuffer()
end

function Hero10005:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
	self:ResetAttackSkillCondition()
end

function Hero10005:ResetGrade()
	AnimalBase.ResetGrade(self)
	self:ClearChangeBuffer()
	self:ClearSelfEffectLoop(Hero10005_Define.EffectGradeSelfKey)
end

function Hero10005:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade > 1 then
		self:CreateSelfEffectLoop(Hero10005_Define.EffectGradeSelfKey, self:GetEffectRoot(AnimalBase_Define.EffectRootType.Chest), Hero10005_Define.EffectGradeSelfName)
	end
end

function Hero10005:AddSkillComboAttack(skillIndex, skillCombo)
	local skillData = MS_SkillData.GetSkillData(self.heroId, skillIndex, skillCombo)

	if skillData ~= nil and skillData.Attack > 0 then
		self.skillComboAttack = self.skillComboAttack + 1
	end
end

function Hero10005:GetSkillComboAttack()
	return self.skillComboAttack
end

function Hero10005:GetSkillRequiredRage(skillData)
	local needRage = AnimalBase.GetSkillRequiredRage(self, skillData)

	if self:GetGrade() > 1 then
		return 0
	end

	if needRage > 0 and self.isHost == true and self.isHostBack == false then
		local tmpTalentRage = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillRageSub, skillData.SkillIndex, skillData.SkillCombo)

		if tmpTalentRage > 0 then
			needRage = MathHelper.subValuePermil(needRage, tmpTalentRage)
		end
	end

	return needRage
end

function Hero10005:GetHitUpUpTimeConfig()
	return Hero10005_Define.HitUpUpTimeHitTime1, Hero10005_Define.HitUpUpTimeHitTime2, Hero10005_Define.HitUpUpTimeResetTime1, Hero10005_Define.HitUpUpTimeResetTime2
end

function Hero10005:GetUIRageLineDiff()
	local skillData = MS_SkillData.GetSkillData(self.heroId, Hero10005_Define.SkillType.SkillLH11T, 1)
	local tmpRage = skillData.RageSub

	if tmpRage > 0 then
		local tmpTalentRage = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.SkillRageSub, Hero10005_Define.SkillType.SkillLH11T, 1)

		if tmpTalentRage > 0 then
			local tmpRage2 = MathHelper.subValuePermil(tmpRage, tmpTalentRage)

			return tmpRage - tmpRage2
		end
	end

	return 0
end

function Hero10005:GetFinalSkillParamMax()
	return self.finalSkillParamMax
end

function Hero10005:SetUI()
	AnimalBase.SetUI(self)
end

function Hero10005:Exit()
	self.bulletTraceVec3 = nil

	self:ClearBullet()
	AnimalBase.Exit(self)
end

return Hero10005
