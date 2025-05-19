-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20039.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20039_Define")

Hero20039 = class("Hero20039", AnimalBase)

function Hero20039:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
	self:SetSkillConditionAll(1)

	self.isbossFinal = true
end

function Hero20039:Start()
	AnimalBase.Start(self)

	if self.heroVariety > 1 then
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 2, 0, 0)
	else
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
	end

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and MS_StoryList.IsStoryMazeBoss(self.storyId) == false and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) == false then
		local monsterData = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, self:GetStoryMonsterId())

		if monsterData ~= nil and monsterData.FinalHit ~= nil then
			self.isbossFinal = monsterData.FinalHit <= 0
		end
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20039:Show()
	AnimalBase.Show(self)
end

function Hero20039:Hide()
	AnimalBase.Hide(self)
end

function Hero20039:GetGradeThreshold()
	return 0
end

function Hero20039:IsbossFinal()
	return self.isbossFinal
end

function Hero20039:LateUpdateMoveStateLogic()
	AnimalBase.LateUpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20039:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20039:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20039:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20039:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20039_Define.SkillType.SkillH1 and self.skillCombo == 1 then
		if trigger > 1 then
			self:SetSkillConditionAll(2)
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 1, 0, 0)
		end
	elseif self.skillIndex == Hero20039_Define.SkillType.SkillLP2 and self.skillCombo == 1 and trigger > 1 then
		self:SetSkillConditionAll(1)
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
	end
end

function Hero20039:OnSkillParryBullet(bullet)
	if self:IsSkillingSkill() == false then
		return
	end

	local vfxRoot = self:GetEffectRoot(AnimalBase_Define.EffectRootType.Root)

	if vfxRoot ~= nil then
		VfxManager.PlayBindMulti(vfxRoot, Hero20039_Define.VfxParryBullet)
	end

	AudioCtrl.SetHeroAudio("hero20039/skill_105_stinger", self:GetPosByWorldPos(), self.animalId)
	self:StartAnimatorDelay(0, Hero20039_Define.ParryFrameFreeze, Hero20039_Define.ParryFrameFadeOut, Hero20039_Define.ParryFrameFreezeSpeed)
end

function Hero20039:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20039_Define.SkillType.SkillS1 then
		if self.skillCombo == 1 then
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.IsLeft, 1, 0, 0)
		end
	elseif self.skillIndex == Hero20039_Define.SkillType.SkillSP1 then
		if self.skillCombo == 1 then
			self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.IsLeft, 0, 0, 0)
		end
	elseif self.skillIndex == Hero20039_Define.SkillType.SkillDP then
		local skillDir = Vector3.zero

		if self.moveFlg == true then
			if self:IsLockingPlayer() == true then
				if self.isHost == true and self.cameraScene ~= nil then
					local camRotInverse = self.cameraScene:GetCameraRotationInverse()

					skillDir:SetVector3(self.moveDir)
					skillDir:MulQuat(camRotInverse)
					skillDir:SetNormalize()
				else
					skillDir:SetVector3(self.moveDir)
					skillDir:MulQuat(self:GetRotationInverse())
					skillDir:SetNormalize()
				end
			else
				skillDir:SetVector3(Vector3.s_forward)
			end
		else
			skillDir:SetVector3(Vector3.s_back)
		end

		self.moveSpeedHorizontalSkill = skillDir.x * 2
		self.moveSpeedVerticalSkill = skillDir.z * 2
	end
end

function Hero20039:OnSkillEnd(skillIndexNext, skillComboNext)
	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20039:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20039:Exit()
	AnimalBase.Exit(self)
end

return Hero20039
