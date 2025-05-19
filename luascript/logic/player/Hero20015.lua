-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/Hero20015.lua

require("LuaScript/Logic/Player/AnimalBase")
require("GameData/PlayerDefine/Hero20015_Define")

Hero20015 = class("Hero20015", AnimalBase)

function Hero20015:initialize(transformSelf, transformModel, id, name, teamId, isHost)
	AnimalBase.initialize(self, transformSelf, transformModel, id, name, teamId, isHost, AnimalBase_Define.Type.Monster)
end

function Hero20015:Start()
	AnimalBase.Start(self)
end

function Hero20015:Show()
	AnimalBase.Show(self)
	AudioCtrl.SetHeroAudio(self.modelName .. "/grunts", self.tfModel, self:GetAnimalId())
end

function Hero20015:Hide()
	AnimalBase.Hide(self)
	AudioCtrl.StopHeroAudio(self.modelName .. "/grunts", self:GetAnimalId())
end

function Hero20015:OnBlock(isFirst, attackerData)
	AnimalBase.OnBlock(self, isFirst, attackerData)
end

function Hero20015:UpdateMoveStateLogic()
	AnimalBase.UpdateMoveStateLogic(self)

	if self:IsDead() == true then
		return
	end
end

function Hero20015:OnSkillStart()
	AnimalBase.OnSkillStart(self)

	if self.skillIndex == Hero20015_Define.SkillType.SkillH then
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, 1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, 1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, 1)
		self:SetMoveNoDamage(true)
	end
end

function Hero20015:OnSkillOffsetStart()
	AnimalBase.OnSkillOffsetStart(self)

	if self:IsSkillingSkill() == false then
		return
	end

	if self.skillIndex == Hero20015_Define.SkillType.SkillH then
		self:PlaySkillAudio(true)
	else
		self:PlaySkillAudio()
	end

	self:PlaySkillEffect(false)
end

function Hero20015:OnSkillRecoveryOffsetStart()
	AnimalBase.OnSkillRecoveryOffsetStart(self)

	if self:IsSkillingRecovery() == false then
		return
	end
end

function Hero20015:OnSkillTrigger(trigger)
	AnimalBase.OnSkillTrigger(self, trigger)

	if self:IsSkilling() == false then
		return
	end

	local skillData = MS_SkillData.GetSkillData(self.heroId, self.skillIndex, self.skillCombo)

	if self.skillIndex == Hero20015_Define.SkillType.SkillH then
		if self.skillCombo == 1 then
			if trigger == 1 then
				local weaponBox = self:GetWeaponBox(1)
				local attPos = weaponBox.position

				if self.gameController ~= nil then
					local tmpCallList

					if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
						local monsterData = MS_StoryMonster.GetMonsterData(self.storyId, self.pattern, self:GetStoryMonsterId())

						if monsterData ~= nil then
							tmpCallList = monsterData.CallMonsterIdList
						end
					else
						local heroData = MS_HeroData.GetHero(self:GetHeroId())

						if heroData ~= nil then
							tmpCallList = heroData.CallHeroIdList
						end
					end

					if tmpCallList ~= nil and #tmpCallList > 0 then
						for i = 1, #tmpCallList do
							local callId = tonumber(tmpCallList[i])

							if callId > 0 then
								local callPlayer = self.gameController:CallAnimal(self, callId, true)

								if callPlayer ~= nil then
									callPlayer:SetMoveFix(false)
									callPlayer:SetPosByWorldPos(attPos, true)
									callPlayer:LookAt(self:GetForward(), true)
									callPlayer:SetRebornPosition(self:GetRebornPosition())
									callPlayer:SetRebornLook(self:GetRebornLook())

									if self.isHost == true and self.isHostBack == false then
										self:SetHostBack(true)
										callPlayer:SetHostBack(false)
										self.sceneController:ChangeHostPlayer(callPlayer)
									end

									callPlayer:Start()
									XCollider.AddRouteColliderIgnore(self:GetAnimalId(), callPlayer:GetAnimalId())
								end
							end
						end
					end
				end
			elseif trigger == 2 then
				-- block empty
			end
		end
	elseif self.skillIndex == Hero20015_Define.SkillType.SkillO and self.skillCombo == 1 and trigger == 1 and self.animalGrade < Hero20015_Define.GradeBaby then
		self:AddGrade(false)
	end
end

function Hero20015:ShowGradeEffect()
	AnimalBase.ShowGradeEffect(self)

	if self.animalGrade >= Hero20015_Define.GradeBaby then
		self:CreateSelfEffectLoop("self_1", self:GetWeaponBox(1), "vfx_20015_self_1")
	else
		self:ClearSelfEffectLoop("self_1")
	end
end

function Hero20015:OnSkillEnd(skillIndexNext, skillComboNext)
	if self.skillIndex == Hero20015_Define.SkillType.SkillH then
		self:SetMoveNoDamage(false)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Hp, -1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Toughness, -1)
		self.animalValue:SetPropertyLockMin(MS_HeroData.Property.Weakness, -1)

		if self.skillCombo == 1 and self.animatorEnd == true then
			self:SkillDeadReady(AnimalBase_Define.DeadReason.CallAnimal)
		end
	end

	AnimalBase.OnSkillEnd(self, skillIndexNext, skillComboNext)
end

function Hero20015:SetUI()
	AnimalBase.SetUI(self)
end

function Hero20015:Exit()
	AnimalBase.Exit(self)
end

return Hero20015
