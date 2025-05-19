-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero10002.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero10002_Define")

Hero10002 = class("Hero10002", AnimalBase)

function Hero10002:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Hero)

	self.bulletSpeedVec3 = Vector3.zero
	self.bulletSpeedVec3.z = Hero10002_Define.BulletSpeed
	self.bulletType = Hero10002_Define.BulletType.White
	self.bulletMax = {}
	self.bulletNow = {}
	self.bulletSPNum = 0
end

function Hero10002:Ready()
	AnimalBase.Ready(self)
	self:InitBullet()
end

function Hero10002:Start()
	AnimalBase.Start(self)
end

function Hero10002:Reborn(reset, propertyRateList)
	AnimalBase.Reborn(self, reset, propertyRateList)
	self:InitBullet()
end

function Hero10002:OnSkillHit(isFirst, hitData)
	AnimalBase.OnSkillHit(self, isFirst, hitData)

	if isFirst == true and self:IsSkillingSkill() == true and (self.skillIndex == Hero10002_Define.SkillType.SkillLH or self.skillIndex == Hero10002_Define.SkillType.SkillLHT) and self.skillCombo == 1 then
		local hitPlayer = hitData:GetHitPlayer()

		if hitPlayer ~= nil and hitPlayer:GetValue():IsToughnessEmpty() == true then
			self:SetSkillTarget(hitPlayer)
			self:ChangeSkillState(AnimalBase_Define.MoveStateType.Skill, self.skillIndex, self.skillCombo + 1, MS_SkillData.PressType.PressDown, 0)
		end
	end
end

function Hero10002:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		self:ClearBulletSPNum()

		return
	end
end

function Hero10002:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	if (self.skillIndex == Hero10002_Define.SkillType.SkillSP6 or self.skillIndex == Hero10002_Define.SkillType.SkillSP5 or self.skillIndex == Hero10002_Define.SkillType.SkillSP4 or self.skillIndex == Hero10002_Define.SkillType.SkillSP3 or self.skillIndex == Hero10002_Define.SkillType.SkillSP2 or self.skillIndex == Hero10002_Define.SkillType.SkillSP1 or self.skillIndex == Hero10002_Define.SkillType.SkillSP6T or self.skillIndex == Hero10002_Define.SkillType.SkillSP5T or self.skillIndex == Hero10002_Define.SkillType.SkillSP4T or self.skillIndex == Hero10002_Define.SkillType.SkillSP3T or self.skillIndex == Hero10002_Define.SkillType.SkillSP2T or self.skillIndex == Hero10002_Define.SkillType.SkillSP1T or self.skillIndex == Hero10002_Define.SkillType.SkillHHH1) and self.skillCombo == 3 then
		self:ClearSkillEffectAll()
		self:StopSkillAudio()
	end

	self:PlaySkillAudio()
	self:PlaySkillEffect(false)
end

function Hero10002:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero10002:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if (self.skillIndex == Hero10002_Define.SkillType.SkillSP6 or self.skillIndex == Hero10002_Define.SkillType.SkillSP5 or self.skillIndex == Hero10002_Define.SkillType.SkillSP4 or self.skillIndex == Hero10002_Define.SkillType.SkillSP3 or self.skillIndex == Hero10002_Define.SkillType.SkillSP2 or self.skillIndex == Hero10002_Define.SkillType.SkillSP1 or self.skillIndex == Hero10002_Define.SkillType.SkillSP6T or self.skillIndex == Hero10002_Define.SkillType.SkillSP5T or self.skillIndex == Hero10002_Define.SkillType.SkillSP4T or self.skillIndex == Hero10002_Define.SkillType.SkillSP3T or self.skillIndex == Hero10002_Define.SkillType.SkillSP2T or self.skillIndex == Hero10002_Define.SkillType.SkillSP1T) and self.skillCombo == 1 then
		self:ClearBulletSPNum()
	end
end

function Hero10002:OnSkillEnd(skillIndexNext, skillComboNext)
	if skillIndexNext > 0 and skillComboNext > 0 then
		if self.skillIndex == Hero10002_Define.SkillType.SkillSP6 or self.skillIndex == Hero10002_Define.SkillType.SkillSP5 or self.skillIndex == Hero10002_Define.SkillType.SkillSP4 or self.skillIndex == Hero10002_Define.SkillType.SkillSP3 or self.skillIndex == Hero10002_Define.SkillType.SkillSP2 or self.skillIndex == Hero10002_Define.SkillType.SkillSP1 or self.skillIndex == Hero10002_Define.SkillType.SkillSP6T or self.skillIndex == Hero10002_Define.SkillType.SkillSP5T or self.skillIndex == Hero10002_Define.SkillType.SkillSP4T or self.skillIndex == Hero10002_Define.SkillType.SkillSP3T or self.skillIndex == Hero10002_Define.SkillType.SkillSP2T or self.skillIndex == Hero10002_Define.SkillType.SkillSP1T then
			if skillIndexNext ~= Hero10002_Define.SkillType.SkillSP6 and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP5 and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP4 and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP3 and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP2 and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP1 and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP6T and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP5T and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP4T and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP3T and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP2T and skillIndexNext ~= Hero10002_Define.SkillType.SkillSP1T then
				if self.skillCombo == 2 then
					self:ClearSkillEffectAll()
					self:StopSkillAudio()
				end

				self:ClearBulletSPNum()
			end
		elseif self.skillIndex == Hero10002_Define.SkillType.SkillS1 or self.skillIndex == Hero10002_Define.SkillType.SkillS2 or self.skillIndex == Hero10002_Define.SkillType.SkillS3 then
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero10002_Define.SkillType.SkillSP6 or self.skillIndex == Hero10002_Define.SkillType.SkillSP5 or self.skillIndex == Hero10002_Define.SkillType.SkillSP4 or self.skillIndex == Hero10002_Define.SkillType.SkillSP3 or self.skillIndex == Hero10002_Define.SkillType.SkillSP2 or self.skillIndex == Hero10002_Define.SkillType.SkillSP1 or self.skillIndex == Hero10002_Define.SkillType.SkillSP6T or self.skillIndex == Hero10002_Define.SkillType.SkillSP5T or self.skillIndex == Hero10002_Define.SkillType.SkillSP4T or self.skillIndex == Hero10002_Define.SkillType.SkillSP3T or self.skillIndex == Hero10002_Define.SkillType.SkillSP2T or self.skillIndex == Hero10002_Define.SkillType.SkillSP1T then
		self:ClearBulletSPNum()
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero10002:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero10002_Define.SkillType.SkillS1 or self.skillIndex == Hero10002_Define.SkillType.SkillS2 or self.skillIndex == Hero10002_Define.SkillType.SkillH1 or self.skillIndex == Hero10002_Define.SkillType.SkillH3 then
		if trigger == 1 then
			self:ReloadBullet()
		end
	elseif self.skillIndex == Hero10002_Define.SkillType.SkillHP1 and self.skillCombo == 3 or self.skillIndex == Hero10002_Define.SkillType.SkillHP2 and self.skillCombo == 2 or self.skillIndex == Hero10002_Define.SkillType.SkillHP3 and self.skillCombo == 3 then
		if trigger == 1 then
			local startPos = self:GetAttackBoxPosition(self.skillIndex, 1)
			local targetPos = self:AdjustShootTargetByDistance(startPos, self:GetSkillButtonTarget(), self:GetShootDistanceMax())

			if self.controllerBullet ~= nil then
				if self.bulletType == Hero10002_Define.BulletType.Blue then
					skillData = MS_SkillData.GetSkillSpecialData(self.heroId, self.skillIndex + Hero10002_Define.BulletBlueSkillAdd, self.skillCombo)
				elseif self.bulletType == Hero10002_Define.BulletType.Red then
					skillData = MS_SkillData.GetSkillSpecialData(self.heroId, self.skillIndex + Hero10002_Define.BulletRedSkillAdd, self.skillCombo)
				end

				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
					self:PlaySkillEffect(true)

					if self.isHost == true and self.isHostBack == false then
						self:CustomizedShake(Hero10002_Define.CameraShakeTemplateAim, true, CameraBase.AnimatorPurpose.Shake, Hero10002_Define.ControllerShakeTemplate)
					end
				end
			end
		end
	elseif self.skillIndex == Hero10002_Define.SkillType.SkillHHH1 or self.skillIndex == Hero10002_Define.SkillType.SkillHHH2 or self.skillIndex == AnimalBase_Define.SkillType.CounterAttack or self.skillIndex == Hero10002_Define.SkillType.SkillDH or self.skillIndex == Hero10002_Define.SkillType.SkillLH and self.skillCombo == 2 or self.skillIndex == Hero10002_Define.SkillType.SkillHL and self.skillCombo == 2 or self.skillIndex == Hero10002_Define.SkillType.SkillLHT and self.skillCombo == 2 or self.skillIndex == Hero10002_Define.SkillType.SkillHLT and self.skillCombo == 2 then
		if trigger > 0 then
			if self.bulletType == Hero10002_Define.BulletType.Blue then
				skillData = MS_SkillData.GetSkillSpecialData(self.heroId, self.skillIndex + Hero10002_Define.BulletBlueSkillAdd, self.skillCombo)
			elseif self.bulletType == Hero10002_Define.BulletType.Red then
				skillData = MS_SkillData.GetSkillSpecialData(self.heroId, self.skillIndex + Hero10002_Define.BulletRedSkillAdd, self.skillCombo)
			end

			local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
			local targetPos

			if self.skillIndex == Hero10002_Define.SkillType.SkillLH or self.skillIndex == Hero10002_Define.SkillType.SkillLHT then
				if trigger > 1 then
					return
				end

				targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero10002_Define.BulletRangeMax, Hero10002_Define.BulletRangeMax, Hero10002_Define.BulletRangeMax, 60)
			else
				targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero10002_Define.BulletRangeMax, Hero10002_Define.BulletRangeMax, Hero10002_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)
			end

			if self.controllerBullet ~= nil and targetPos ~= nil then
				local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
				local bullet = self.controllerBullet:GetBullet(bulletIndex)

				if bullet ~= nil then
					bullet:Ready()
					bullet:Start()
					self:PlaySkillEffect(true)

					if self.skillIndex == Hero10002_Define.SkillType.SkillHHH1 or self.skillIndex == Hero10002_Define.SkillType.SkillHHH2 or self.skillIndex == Hero10002_Define.SkillType.SkillDH then
						self:SubBulletNum()
					end
				end
			end
		end
	elseif self.skillIndex == Hero10002_Define.SkillType.SkillSP6 or self.skillIndex == Hero10002_Define.SkillType.SkillSP5 or self.skillIndex == Hero10002_Define.SkillType.SkillSP4 or self.skillIndex == Hero10002_Define.SkillType.SkillSP3 or self.skillIndex == Hero10002_Define.SkillType.SkillSP2 or self.skillIndex == Hero10002_Define.SkillType.SkillSP1 or self.skillIndex == Hero10002_Define.SkillType.SkillSP6T or self.skillIndex == Hero10002_Define.SkillType.SkillSP5T or self.skillIndex == Hero10002_Define.SkillType.SkillSP4T or self.skillIndex == Hero10002_Define.SkillType.SkillSP3T or self.skillIndex == Hero10002_Define.SkillType.SkillSP2T or self.skillIndex == Hero10002_Define.SkillType.SkillSP1T then
		if self.skillCombo == 2 then
			if trigger > 0 then
				self:AddBulletSPNum(skillData)
			end
		elseif self.skillCombo > 2 and trigger > 0 then
			if self.bulletType == Hero10002_Define.BulletType.Blue then
				skillData = MS_SkillData.GetSkillSpecialData(self.heroId, self.skillIndex + Hero10002_Define.BulletBlueSkillAdd, self.skillCombo)
			elseif self.bulletType == Hero10002_Define.BulletType.Red then
				skillData = MS_SkillData.GetSkillSpecialData(self.heroId, self.skillIndex + Hero10002_Define.BulletRedSkillAdd, self.skillCombo)
			end

			if self.bulletSPNum > 0 then
				local startPos = self:GetAttackBoxPosition(self.skillIndex, self.skillCombo)
				local targetPos = GameAI.GetChestTargetByStraightLine(self, startPos, Hero10002_Define.BulletRangeMax, Hero10002_Define.BulletRangeMax, Hero10002_Define.BulletRangeMax, AnimalBase_Define.ShootTargetAngleMax)

				if self.controllerBullet ~= nil then
					local bulletIndex = self.controllerBullet:CreateBullet(ControllerBullet.BulletType.StraightLine, self, skillData, nil, startPos, targetPos, self.bulletSpeedVec3, Vector3.s_zero)
					local bullet = self.controllerBullet:GetBullet(bulletIndex)

					if bullet ~= nil then
						bullet:Ready()
						bullet:Start()
						self:SubBulletSPNum()
					end
				end
			end
		end
	elseif self.skillIndex == Hero10002_Define.SkillType.SkillO then
		if trigger == 1 then
			self:SwitchBulletType(nil)
		end
	elseif self.skillIndex == Hero10002_Define.SkillType.SkillS3 or self.skillIndex == Hero10002_Define.SkillType.SkillH2 or self.skillIndex == Hero10002_Define.SkillType.SkillH4 then
		if trigger == 1 then
			self:SwitchBulletType(Hero10002_Define.BulletType.White)
		end
	elseif (self.skillIndex == AnimalBase_Define.SkillType.Execute or self.skillIndex == AnimalBase_Define.SkillType.Backstab) and self.skillCombo == 1 and trigger == 1 then
		local statusId = Hero10002_Define.ExecuteBackstabStatusId
		local statusIdAdd = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.StatusChange, statusId, 0)

		if statusIdAdd > 0 then
			statusId = statusId + statusIdAdd - 1

			self:AddStatus(self:GetVirtualPlayer(), statusId, 0, MS_StatusData.SourceType.Skill, self.skillIndex, false)
		end
	end
end

function Hero10002:InitBullet()
	local colorBulletMax = Hero10002_Define.BulletColorMax
	local tmpTalentMax = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.ColorBulletMaxAdd, 0, 0)

	if tmpTalentMax > 0 then
		colorBulletMax = colorBulletMax + tmpTalentMax
	end

	self.bulletMax[Hero10002_Define.BulletType.White] = 99999
	self.bulletMax[Hero10002_Define.BulletType.Blue] = colorBulletMax
	self.bulletMax[Hero10002_Define.BulletType.Red] = colorBulletMax

	for i = 1, Hero10002_Define.BulletTypeMax do
		self.bulletNow[i] = Hero10002_Define.BulletReloadMax
	end

	self.bulletSPNum = 0

	self:UpdateShootSkillCondition()

	if self.isHost == true and self.isHostBack == false then
		UIManager.SendMessage("Mainmenu", "BulletSetLoaded", self.bulletType, self.bulletNow[self.bulletType], self.bulletMax[Hero10002_Define.BulletType.Blue])
	end
end

function Hero10002:LoadSaveBullet()
	local isCallHero = self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero)

	if self.isHost == true or isCallHero == true then
		if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Normal) == true then
			local tmpWhiteNow = FS_UserData.story:GetHeroProperty(self.heroId, MS_HeroData.SpecialProperty.BulletWhiteNow, isCallHero)

			if tmpWhiteNow ~= nil then
				self.bulletNow[Hero10002_Define.BulletType.White] = Mathf.Min(tonumber(tmpWhiteNow), self.bulletNow[Hero10002_Define.BulletType.White])
			end

			local tmpBlueNow = FS_UserData.story:GetHeroProperty(self.heroId, MS_HeroData.SpecialProperty.BulletBlueNow, isCallHero)

			if tmpBlueNow ~= nil then
				self.bulletNow[Hero10002_Define.BulletType.Blue] = Mathf.Min(tonumber(tmpBlueNow), self.bulletNow[Hero10002_Define.BulletType.Blue])
			end

			local tmpBlueMax = FS_UserData.story:GetHeroProperty(self.heroId, MS_HeroData.SpecialProperty.BulletBlueMax, isCallHero)

			if tmpBlueMax ~= nil then
				self.bulletMax[Hero10002_Define.BulletType.Blue] = Mathf.Min(tonumber(tmpBlueMax), self.bulletMax[Hero10002_Define.BulletType.Blue])
			end

			local tmpRedNow = FS_UserData.story:GetHeroProperty(self.heroId, MS_HeroData.SpecialProperty.BulletRedNow, isCallHero)

			if tmpRedNow ~= nil then
				self.bulletNow[Hero10002_Define.BulletType.Red] = Mathf.Min(tonumber(tmpRedNow), self.bulletNow[Hero10002_Define.BulletType.Red])
			end
		end

		self.bulletMax[Hero10002_Define.BulletType.Red] = self.bulletMax[Hero10002_Define.BulletType.Blue]
	end
end

function Hero10002:SaveProperty()
	AnimalBase.SaveProperty(self)

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		local isCall = false

		if self.isHost == false then
			isCall = self:IsMonsterType(AnimalBase_Define.MonsterType.CallHero)
		end

		if self.isHost == true or isCall == true then
			FS_UserData.story:SetHeroProperty(self.heroId, MS_HeroData.SpecialProperty.BulletWhiteNow, self:GetBulletNum(Hero10002_Define.BulletType.White), isCall)
			FS_UserData.story:SetHeroProperty(self.heroId, MS_HeroData.SpecialProperty.BulletWhiteMax, self:GetBulletMax(Hero10002_Define.BulletType.White), isCall)
			FS_UserData.story:SetHeroProperty(self.heroId, MS_HeroData.SpecialProperty.BulletBlueNow, self:GetBulletNum(Hero10002_Define.BulletType.Blue), isCall)
			FS_UserData.story:SetHeroProperty(self.heroId, MS_HeroData.SpecialProperty.BulletBlueMax, self:GetBulletMax(Hero10002_Define.BulletType.Blue), isCall)
			FS_UserData.story:SetHeroProperty(self.heroId, MS_HeroData.SpecialProperty.BulletRedNow, self:GetBulletNum(Hero10002_Define.BulletType.Red), isCall)
			FS_UserData.story:SetHeroProperty(self.heroId, MS_HeroData.SpecialProperty.BulletRedMax, self:GetBulletMax(Hero10002_Define.BulletType.Red), isCall)
		end
	end
end

function Hero10002:UpdateShootSkillCondition()
	if self.bulletNow[self.bulletType] > 0 then
		for i = 1, #Hero10002_Define.ShootSkillAll do
			self:SetSkillCondition(Hero10002_Define.ShootSkillAll[i], 1)
		end

		self:SetSkillCondition(Hero10002_Define.SkillType.SkillS1, 1)
		self:SetSkillCondition(Hero10002_Define.SkillType.SkillS2, 0)
		self:SetSkillCondition(Hero10002_Define.SkillType.SkillH1, 0)
		self:SetSkillCondition(Hero10002_Define.SkillType.SkillS3, 0)
		self:SetSkillCondition(Hero10002_Define.SkillType.SkillH2, 0)
		self:SetSkillCondition(Hero10002_Define.SkillType.SkillHP1, 1)
		self:SetSkillCondition(Hero10002_Define.SkillType.SkillHP3, 0)
		self:SetSkillCondition(Hero10002_Define.SkillType.SkillH3, 0)
		self:SetSkillCondition(Hero10002_Define.SkillType.SkillH4, 0)
	else
		for i = 1, #Hero10002_Define.ShootSkillAll do
			self:SetSkillCondition(Hero10002_Define.ShootSkillAll[i], 0)
		end

		if self.bulletMax[self.bulletType] > 0 then
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillS1, 0)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillS2, 1)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillH1, 1)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillS3, 0)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillH2, 0)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillHP1, 0)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillHP3, 1)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillH3, 1)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillH4, 0)
		else
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillS1, 0)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillS2, 0)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillH1, 0)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillS3, 1)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillH2, 1)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillHP1, 0)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillHP3, 1)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillH3, 0)
			self:SetSkillCondition(Hero10002_Define.SkillType.SkillH4, 1)
		end
	end
end

function Hero10002:PickUpBullet(addNum)
	AnimalBase.PickUpBullet(self, addNum)

	if addNum > 0 and self:IsBulletMax() == false then
		local num = self.bulletMax[Hero10002_Define.BulletType.Blue]

		self.bulletMax[Hero10002_Define.BulletType.Blue] = self.bulletMax[Hero10002_Define.BulletType.Blue] + addNum
		self.bulletMax[Hero10002_Define.BulletType.Blue] = Mathf.Min(self:GetBulletMaxNum(), self.bulletMax[Hero10002_Define.BulletType.Blue])
		self.bulletMax[Hero10002_Define.BulletType.Red] = self.bulletMax[Hero10002_Define.BulletType.Blue]

		local diff = self.bulletMax[Hero10002_Define.BulletType.Blue] - num

		if self.isHost == true and self.isHostBack == false and diff > 0 then
			UIManager.SendMessage("Mainmenu", "BulletAddSupply", diff)
			UIManager.SendMessage("Mainmenu", "BulletSetRemainingCount", self.bulletMax[Hero10002_Define.BulletType.Blue], self.bulletType)
		end

		return diff
	end

	return 0
end

function Hero10002:IsBulletMax()
	local colorBulletMax = self:GetBulletMaxNum()
	local num = self.bulletMax[Hero10002_Define.BulletType.Blue]

	if colorBulletMax <= num then
		return true
	end

	return false
end

function Hero10002:GetBulletMaxNum()
	local colorBulletMax = Hero10002_Define.BulletColorMax
	local tmpTalentMax = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.ColorBulletMaxAdd, 0, 0)

	if tmpTalentMax > 0 then
		colorBulletMax = colorBulletMax + tmpTalentMax
	end

	return colorBulletMax
end

function Hero10002:ClearBulletSPNum()
	if self.bulletSPNum > 0 then
		self.bulletSPNum = 0

		if self.isHost == true and self.isHostBack == false then
			UIManager.SendMessage("Mainmenu", "BulletDisableCharging")
		end
	end

	self:UpdateShootSkillCondition()
end

function Hero10002:SubBulletNum()
	local useBullet = true
	local noBulletRate = self.sceneController:GetTalentValue(self.animalId, MS_HeroTalent.Type.NoBullet, 0, 0)

	if noBulletRate > 0 then
		local ret = MathHelper.getRandomResult(noBulletRate, self.animalId)

		if ret == true then
			if self.isHost == true and self.isHostBack == false then
				UIManager.SendMessage("Mainmenu", "BulletSpecialShooting")
			end

			useBullet = false
		end
	end

	if useBullet == true then
		self.bulletNow[self.bulletType] = self.bulletNow[self.bulletType] - 1

		if self.bulletNow[self.bulletType] < 0 then
			self.bulletNow[self.bulletType] = 0
		end

		self:LogTest("====SubBulletNum===bullet num= " .. self.bulletNow[self.bulletType] .. ",max=" .. self.bulletMax[self.bulletType] .. ",type=" .. self.bulletType)

		if self.isHost == true and self.isHostBack == false then
			UIManager.SendMessage("Mainmenu", "BulletSingleShooting")
		end
	end

	self:UpdateShootSkillCondition()
end

function Hero10002:SubBulletSPNum()
	self.bulletSPNum = self.bulletSPNum - 1

	if self.bulletSPNum < 0 then
		self.bulletSPNum = 0
	end

	self.bulletNow[self.bulletType] = self.bulletNow[self.bulletType] - 1

	if self.bulletNow[self.bulletType] < 0 then
		self.bulletNow[self.bulletType] = 0
	end

	self:LogTest("=====SubBulletSPNum==bullet num= " .. self.bulletSPNum .. ",type=" .. self.bulletType)

	if self.isHost == true and self.isHostBack == false then
		UIManager.SendMessage("Mainmenu", "BulletMultiShooting", self.bulletSPNum)
	end

	self:UpdateShootSkillCondition()
end

function Hero10002:AddBulletSPNum(skillData)
	local tmpTalentCondition = Hero10002_Define.BulletReloadMax

	tmpTalentCondition = Mathf.Min(self.bulletNow[self.bulletType], tmpTalentCondition)

	if tmpTalentCondition > self.bulletSPNum then
		self.bulletSPNum = self.bulletSPNum + 1

		for i = Hero10002_Define.SkillType.SkillSP6, Hero10002_Define.SkillType.SkillSP1 do
			self:SetSkillCondition(i, self.bulletSPNum)
		end

		for i = Hero10002_Define.SkillType.SkillSP6T, Hero10002_Define.SkillType.SkillSP1T do
			self:SetSkillCondition(i, self.bulletSPNum)
		end

		if self.isHost == true and self.isHostBack == false then
			UIManager.SendMessage("Mainmenu", "BulletMultiShooting", self.bulletSPNum)
		end

		if tmpTalentCondition <= self.bulletSPNum then
			local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

			self:PressUpSkillButton(skillData.BtnIndex)
		end
	end
end

function Hero10002:GetBulletNum(type)
	if self.bulletNow[type] ~= nil then
		return self.bulletNow[type]
	end

	return 0
end

function Hero10002:GetBulletMax(type)
	if self.bulletMax[type] ~= nil then
		return self.bulletMax[type]
	end

	return 0
end

function Hero10002:GetBulletNow()
	if self.bulletNow ~= nil then
		return self.bulletNow[self.bulletType]
	end

	return 0
end

function Hero10002:ReloadBullet()
	if self.bulletNow[self.bulletType] < Hero10002_Define.BulletReloadMax then
		local add = Hero10002_Define.BulletReloadMax - self.bulletNow[self.bulletType]

		if self.bulletType == Hero10002_Define.BulletType.Red or self.bulletType == Hero10002_Define.BulletType.Blue then
			local max = self.bulletMax[Hero10002_Define.BulletType.Blue]

			add = Mathf.Clamp(add, 0, max)
			self.bulletNow[self.bulletType] = self.bulletNow[self.bulletType] + add
			self.bulletMax[Hero10002_Define.BulletType.Blue] = self.bulletMax[Hero10002_Define.BulletType.Blue] - add
			self.bulletMax[Hero10002_Define.BulletType.Red] = self.bulletMax[Hero10002_Define.BulletType.Blue]
		else
			self.bulletNow[self.bulletType] = self.bulletNow[self.bulletType] + add
		end

		self:LogTest("=======ReloadBullet====self.bulletType=" .. self.bulletType .. ",add=" .. add .. ",self.bulletNow=" .. self.bulletNow[self.bulletType] .. ",self.bulletMax=" .. self.bulletMax[self.bulletType])

		if self.isHost == true and self.isHostBack == false then
			UIManager.SendMessage("Mainmenu", "BulletReloading", self.bulletNow[self.bulletType], self.bulletMax[Hero10002_Define.BulletType.Blue])
		end

		self:UpdateShootSkillCondition()
	end
end

function Hero10002:SwitchBulletType(type)
	if type ~= nil then
		self.bulletType = type
	else
		self.bulletType = self.bulletType % Hero10002_Define.BulletTypeMax + 1
	end

	self:LogTest("=======SwitchBulletType======self.bulletType=" .. self.bulletType .. ",self.bulletNow=" .. self.bulletNow[self.bulletType] .. ",self.bulletMax = " .. self.bulletMax[self.bulletType])
	self:UpdateShootSkillCondition()

	if self.isHost == true and self.isHostBack == false then
		UIManager.SendMessage("Mainmenu", "BulletChangeType", self.bulletType, self.bulletNow[self.bulletType], self.bulletMax[Hero10002_Define.BulletType.Blue])
	end
end

function Hero10002:OnDeadFinish()
	AnimalBase.OnDeadFinish(self)

	if self:IsBornReason(AnimalBase_Define.BornReason.CallAnimal) == true and self.callFromAnimalId > 0 and self.callFromHeroId == AnimalBase_Define.CallHost_10006 then
		local fromPlayer = self.sceneController:FindPlayerById(self.callFromAnimalId)

		if fromPlayer ~= nil then
			fromPlayer:CallNotifySanHeroDead()
		end
	end
end

function Hero10002:GetHitUpUpTimeConfig()
	return Hero10002_Define.HitUpUpTimeHitTime1, Hero10002_Define.HitUpUpTimeHitTime2, Hero10002_Define.HitUpUpTimeResetTime1, Hero10002_Define.HitUpUpTimeResetTime2
end

function Hero10002:SetUI()
	AnimalBase.SetUI(self)

	if self.isHost == true and self.isHostBack == false then
		UIManager.SendMessage("Mainmenu", "BulletSetLoaded", self.bulletType, self.bulletNow[self.bulletType], self.bulletMax[Hero10002_Define.BulletType.Blue])
	end
end

function Hero10002:GetBulletReloadMax()
	return Hero10002_Define.BulletReloadMax
end

function Hero10002:GetShootDistanceMax()
	return Hero10002_Define.BulletRangeMax
end

function Hero10002:Exit()
	self.bulletMax = nil
	self.bulletNow = nil

	AnimalBase.Exit(self)
end

return Hero10002
