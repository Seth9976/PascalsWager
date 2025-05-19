-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20017.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20017_Define")

Hero20017 = class("Hero20017", AnimalBase)

function Hero20017:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)

	self.blockCount = 0
end

function Hero20017:InitHeroVariety()
	AnimalBase.InitHeroVariety(self)

	if self.heroVariety == 4 or self.heroVariety == 2 then
		self:SetBodyPartsVisible(AnimalBase_Define.VisibleType.Variety, true)
	else
		self:SetBodyPartsVisible(AnimalBase_Define.VisibleType.Variety, false)
	end
end

function Hero20017:Start()
	AnimalBase.Start(self)
	self:SetSkillCondition(Hero20017_Define.SkillType.SkillOOO, 1)
	self:SetSkillCondition(Hero20017_Define.SkillType.SkillOO, 1)

	if self.heroVariety > 2 then
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 1, 0, 0)
	else
		self:SetAnimatorParamFloat(AnimalBase_Define.ParamType.Pose, 0, 0, 0)
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) and self.gameController:IsBossMode() == true and self.gameController:GetBossId() == self:GetStoryMonsterId() then
		self:StartBattle()
	end
end

function Hero20017:Show()
	AnimalBase.Show(self)

	local tfRoot = self:GetWeaponBox(1)

	self:CreateSelfEffectLoop("self_1", tfRoot, "vfx_hero20017_self_1")
end

function Hero20017:Hide()
	AnimalBase.Hide(self)
	self:ClearSelfEffectLoop("self_1")
end

function Hero20017:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)

	if self:IsSkilling() == true and self:IsSkillingById(Hero20017_Define.SkillType.SkillDefence, 0) == true then
		self.blockCount = self.blockCount + 1
	end
end

function Hero20017:GetGradeThreshold()
	return 0
end

function Hero20017:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20017:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	self:PlaySkillEffect(false)
	self:PlaySkillAudio()
end

function Hero20017:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20017:IsSkillCounterAttackedStart(attackVPlayer, skillIndex, skillCombo)
	if self:IsSkilling() == true and self:IsSkillingById(Hero20017_Define.SkillType.SkillDefence, 0) == true and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and MS_StoryList.IsStoryMazeBoss(self.storyId) == false and FS_UserData.story:GetLoop() <= 1 and FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.BossTimeChallenge) == false and self.blockCount < Hero20017_Define.SkillSP_BlockCountToCounterAttack then
		return false
	end

	return AnimalBase.IsSkillCounterAttackedStart(self, attackVPlayer, skillIndex, skillCombo)
end

function Hero20017:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end
end

function Hero20017:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20017_Define.SkillType.SkillLP or self.skillIndex == Hero20017_Define.SkillType.SkillXHP then
		if self.skillCombo == 2 then
			self:StopSkillAudio()
			self:ClearSkillEffectLoopAll()
			self:ClearSkillEffectAll()
		end
	elseif self.skillIndex == Hero20017_Define.SkillType.SkillOOO then
		if (self.skillCombo == 1 or self.skillCombo == 2) and (skillIndexNext == AnimalBase_Define.SkillType.Dodge or skillIndexNext == AnimalBase_Define.SkillType.DodgeSpecial) then
			self:SetSkillCondition(Hero20017_Define.SkillType.SkillOOO, 2)
			self:SetSkillCondition(Hero20017_Define.SkillType.SkillOO, 2)
		end
	elseif self.skillIndex == AnimalBase_Define.SkillType.Dodge or self.skillIndex == AnimalBase_Define.SkillType.DodgeSpecial then
		self:SetSkillCondition(Hero20017_Define.SkillType.SkillOOO, 1)
		self:SetSkillCondition(Hero20017_Define.SkillType.SkillOO, 1)
	elseif self.skillIndex == AnimalBase_Define.SkillType.Relax then
		if self.skillCombo == 2 then
			self:StopSkillAudio()
		end
	elseif self.skillIndex == Hero20017_Define.SkillType.SkillDefence and skillIndexNext ~= Hero20017_Define.SkillType.SkillDefence then
		self.blockCount = 0
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20017:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20017:Exit()
	AnimalBase.Exit(self)
end

return Hero20017
