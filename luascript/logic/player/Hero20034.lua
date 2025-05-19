-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20034.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20034_Define")

Hero20034 = class("Hero20034", AnimalBase)

function Hero20034:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.bulletSP2SpeedVec3 = Vector3.zero
	self.bulletSP2SpeedVec3.z = Hero20034_Define.BulletSP2Speed
	self.bulletS2SpeedVec3 = Vector3.zero
	self.bulletS2SpeedVec3.z = Hero20034_Define.BulletS2Speed
	self.bulletNS2SpeedVec3 = Vector3.zero
	self.bulletNS2AccVec3 = Vector3.zero
	self.bulletNS2AccVec3.y = Hero20034_Define.BulletNS2Gravity
	self.skillTargetPos = Vector3.zero
	self.weakEnable = false
	self.weakOpening = false
	self.weakMaterial = nil
	self.weakColor = Color.black
	self.weakColorRatio = 0
end

function Hero20034:Start()
	AnimalBase.Start(self)

	self.weakEnable = true
	self.animalValue.weakEnable = true
	self.weakOpening = false

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Normal) == true then
		if FS_UserData.story:IsQuestComplete(Hero20034_Define.WeakShowQuestId) == true or MS_StoryList.IsStoryMazeBoss(self.storyId) == true or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) == true then
			local render = self:GetEquipmentRender(Hero20034_Define.WeakEquipmentId)

			if render ~= nil then
				self.weakMaterial = render.sharedMaterial
				self.weakColor = Hero20034_Define.WeakColorL

				self.weakMaterial:SetColor("_EmissionColor", self.weakColor)

				self.characterColliderWeak = true
			end
		else
			self.characterColliderWeak = false

			self:SetEquipmentVisible(AnimalBase_Define.VisibleType.Variety, Hero20034_Define.WeakEquipmentId, false)
		end
	else
		local render = self:GetEquipmentRender(Hero20034_Define.WeakEquipmentId)

		if render ~= nil then
			self.weakMaterial = render.sharedMaterial
			self.weakColor = Hero20034_Define.WeakColorL

			self.weakMaterial:SetColor("_EmissionColor", self.weakColor)

			self.characterColliderWeak = true
		end
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) and self:IsHost() == false and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20034:StartBattle()
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

function Hero20034:Show()
	AnimalBase.Show(self)
end

function Hero20034:Hide()
	AnimalBase.Hide(self)
end

function Hero20034:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20034:CheckSkillCommand()
	local buttonPressDown, buttonPressUp, buttonPressUpTime, buttonLongPress, buttonLongPressTime = AnimalBase.CheckSkillCommand(self)

	if self.isHost == true and buttonPressDown == ControllerMain.SkillButton.Threat then
		if self.animalGrade <= 1 then
			self:AddGrade(false)
		else
			self:ResetGrade()
		end
	end
end

function Hero20034:AddGrade(isStart)
	AnimalBase.AddGrade(self, isStart)
	self:ChangeToNormal()
end

function Hero20034:AddGradeAfter(fromMovie)
	AnimalBase.AddGradeAfter(self, fromMovie)
	self:ResetState()
end

function Hero20034:ChangeToNormal()
	self:SetBodyCollider(true)
	self:SetMoveMuteki(false)
	self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, true)
	self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
	self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)
	self:SetMoveNoWeakness(false)
end

function Hero20034:ResetGrade()
	AnimalBase.ResetGrade(self)
end

function Hero20034:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade > 1 then
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(1), "vfx_20034_self_1")
	else
		self:ClearSelfEffectLoop("self_1")
	end
end

function Hero20034:ExitBattle()
	AnimalBase.ExitBattle(self)
end

function Hero20034:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20034:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end

	if self.weakMaterial ~= nil and self.weakEnable == true then
		if self.weakOpening == true then
			self.weakColorRatio = self.weakColorRatio + Hero20034_Define.WeakColorInitSpeed * ControllerMain.GetLogicDeltaTime()
			self.weakColorRatio = Mathf.Clamp(self.weakColorRatio, 0, 1)
			self.weakColor = Color.Lerp(Color.black, Hero20034_Define.WeakColorL, self.weakColorRatio)

			self.weakMaterial:SetColor("_EmissionColor", self.weakColor)

			if self.weakColorRatio >= 1 then
				self.weakColorRatio = 0
				self.weakOpening = false
			end
		else
			self.weakColorRatio = self.weakColorRatio + Hero20034_Define.WeakColorSpeed * ControllerMain.GetLogicDeltaTime()

			local ratio = Mathf.Clamp(MathHelper.GetFloat(self.weakColorRatio), 0, 1)

			if ratio > 0.5 then
				ratio = 1 - ratio
			end

			self.weakColor = Color.Lerp(Hero20034_Define.WeakColorL, Hero20034_Define.WeakColorR, ratio * 2)

			self.weakMaterial:SetColor("_EmissionColor", self.weakColor)
		end
	end
end

function Hero20034:OnSkillStart()
	AnimalBase.OnSkillStart(self)
end

function Hero20034:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20034:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20034:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20034_Define.SkillType.SkillNHHH2 then
		if self.skillCombo == 1 then
			if trigger == 1 then
				local box = self:GetWeaponBox(8)

				self.scene:OpenTrick(Hero20034_Define.TrickIdSkillNHHH2, box.position, box.rotation)
			end
		elseif self.skillCombo == 2 then
			if trigger == 1 then
				local box = self:GetWeaponBox(9)

				self.scene:OpenTrick(Hero20034_Define.TrickIdSkillNHHH2, box.position, box.rotation)
			end
		elseif self.skillCombo == 3 and trigger == 3 then
			local box = self:GetWeaponBox(10)

			self.scene:OpenTrick(Hero20034_Define.TrickIdSkillNHHH2, box.position, box.rotation)
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillHP2 then
		if self.skillCombo == 1 and trigger == 1 then
			self.scene:OpenTrick(Hero20034_Define.TrickIdSkillHP2, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillSP2 then
		if self.skillCombo == 2 and trigger > 0 then
			local box = self:GetWeaponBox(3)
			local startPos = box.position
			local startRot = box.rotation
			local targetPos = GameAI.GetShootTargetByRot(startPos, startRot, Hero20034_Define.BulletRangeMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSP2SpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillS2 then
		if self.skillCombo == 1 and trigger > 0 then
			local box = self:GetWeaponBox(2)
			local startPos = box.position
			local startRot = box.rotation
			local targetPos = GameAI.GetShootTargetByRot(startPos, startRot, Hero20034_Define.BulletRangeMax)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSP2SpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
				end
			end
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillNSP2 then
		if self.skillCombo == 1 and trigger == 1 then
			self.scene:OpenTrick(Hero20034_Define.TrickIdSkillNSP2, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillNS2 then
		if trigger > 0 then
			local box = self:GetWeaponBox(7)
			local startPos = box.position
			local targetPos = GameAI.GetFootTargetByParabolaRound(self, startPos, Hero20034_Define.BulletNS2Range, Hero20034_Define.BulletNS2RangeMin, Hero20034_Define.BulletNS2RangeMax)
			local tmpSpeedZ, tmpSpeedY = MathHelper.GetParabolaParam(startPos, targetPos, Hero20034_Define.BulletNS2Angle, Hero20034_Define.BulletNS2Gravity)

			self.bulletNS2SpeedVec3:Set(0, tmpSpeedY, tmpSpeedZ)

			if self.controllerBullet ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.Parabola, self, skillData, nil, startPos, targetPos, self.bulletNS2SpeedVec3, self.bulletNS2AccVec3)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
					self:PlaySkillEffect(true)
				end
			end
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillLL2 then
		if self.skillCombo == 1 then
			if trigger == 1 then
				self.scene:OpenTrick(Hero20034_Define.TrickIdSkillLL2_1, self:GetPosByWorldPos(), self:GetRotation())
			end
		elseif self.skillCombo == 2 and trigger == 1 then
			self.scene:OpenTrick(Hero20034_Define.TrickIdSkillLL2_2, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillHH2 then
		if self.skillCombo == 1 then
			if trigger == 1 then
				self.scene:OpenTrick(Hero20034_Define.TrickIdSkillHH2_1, self:GetPosByWorldPos(), self:GetRotation())
			end
		elseif self.skillCombo == 2 and trigger == 1 then
			self.scene:OpenTrick(Hero20034_Define.TrickIdSkillHH2_2, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillNLL2 then
		if self.skillCombo == 1 then
			if trigger == 1 then
				self.scene:OpenTrick(Hero20034_Define.TrickIdSkillNLL2_1, self:GetPosByWorldPos(), self:GetRotation())
			end
		elseif self.skillCombo == 2 and trigger == 1 then
			self.scene:OpenTrick(Hero20034_Define.TrickIdSkillNLL2_2, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillNO2 then
		if trigger == 1 then
			self.scene:OpenTrick(Hero20034_Define.TrickIdSkillNO2, self:GetPosByWorldPos(), self:GetRotation())
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillDP and self.skillCombo == 1 and trigger == 1 then
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
		self:SetMoveNoWeakness(true)
	end
end

function Hero20034:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20034_Define.SkillType.SkillSP2 then
		if self.skillCombo == 2 then
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillDP then
		if skillIndexNext == self.skillIndex and self.skillCombo == 1 then
			self:SetBodyCollider(false)
			self:SetMoveMuteki(true)

			if self.animalGrade > 1 then
				self:ClearSelfEffectLoop("self_1")
			end

			self:SetRenderAllVisible(AnimalBase_Define.VisibleType.Act, false)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
			self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
			self:SetMoveNoWeakness(true)
		elseif self.skillCombo == 2 then
			if self.isHost == false then
				if DebugMonsterAISkill == true then
					self:SetPosByWorldPos(self:GetPosByWorldPos(), true)
				else
					self:SetPosByWorldPos(self.skillTargetPos, true)
				end

				local targetAnimal = GameAI.GetAttackTarget(self)

				if targetAnimal ~= nil then
					local lookDir = targetAnimal:GetPosByWorldPos() - self:GetPosByWorldPos()

					lookDir.y = 0

					self:LookAt(lookDir, true)
				end

				self:SetSkillTarget(nil)
			end

			self:ChangeToNormal()

			if self.animalGrade > 1 then
				self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(1), "vfx_20034_self_1")
			end
		end
	elseif self.skillIndex == Hero20034_Define.SkillType.SkillNHHH2 and skillIndexNext ~= Hero20034_Define.SkillType.SkillNHHH2 then
		self.scene:StopReadyTrick(Hero20034_Define.TrickIdSkillNHHH2)
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20034:SetSkillTargetPos(pos)
	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local centerPos = self.scene:GetSceneSkillPointPos(1)

		if centerPos ~= nil then
			pos.x = Mathf.Clamp(pos.x, centerPos.x - 10, centerPos.x + 10)
			pos.z = Mathf.Clamp(pos.z, centerPos.z - 10, centerPos.z + 10)
		end
	end

	self.skillTargetPos:SetVector3(pos)
end

function Hero20034:SetWeakEnable(flg)
	if self.weakEnable ~= flg then
		self.weakEnable = flg

		if flg == true then
			if self.weakMaterial ~= nil then
				self.weakColor = Color.black

				self.weakMaterial:SetColor("_EmissionColor", self.weakColor)

				self.weakOpening = true
			end

			self.characterColliderWeak = true
		else
			if self.weakMaterial ~= nil then
				self.weakColor = Color.black

				self.weakMaterial:SetColor("_EmissionColor", self.weakColor)

				self.weakOpening = false
			end

			self.characterColliderWeak = false

			VfxManager.PlayBindMulti(self:GetWeaponBox(Hero20034_Define.WeakWeaponBoxId), Hero20034_Define.WeakBreakEffectName)
		end
	end
end

function Hero20034:GetWeakEnable()
	return self.weakEnable
end

function Hero20034:GetShootDistanceMax()
	return Hero20034_Define.BulletRangeMax
end

function Hero20034:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20034:Exit()
	self.bulletSP2SpeedVec3 = nil
	self.bulletS2SpeedVec3 = nil
	self.bulletNS2SpeedVec3 = nil
	self.bulletNS2AccVec3 = nil
	self.skillTargetPos = nil

	AnimalBase.Exit(self)
end

return Hero20034
