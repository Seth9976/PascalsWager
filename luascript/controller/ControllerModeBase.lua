-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerModeBase.lua

require("LuaScript/Controller/ControllerBase")

ControllerModeBase = class("ControllerModeBase", ControllerBase)
ControllerModeBase.static.ColliderRouteRadiusAdd = 0.2
ControllerModeBase.callIdStart = 0
ControllerModeBase.CameraScreenRatioKey = "_169"

function ControllerModeBase:initialize()
	ControllerBase.initialize(self)

	self.sceneController = ST_Main.GetSceneController()
	self.loadCharacterManager = self.sceneController:GetLoadCharacterManager()
	self.hostPlayerDeadFinish = false
	self.scene = self.sceneController:GetScene()
	self.camera = self.sceneController:GetCamera()
	self.cameraScene = self.sceneController:GetCameraCtrl()
	self.controllerTimer = self.sceneController:GetControllerTimer()
	self.logIndex = 0
	self.logHeroId = {}
	self.logRecordSkillType = {}
	self.logSkillIndex = {}
	self.logSkillCombo = {}
	self.selectHostPlayerEnable = {}
	self.dialogMemberList = nil
	self.stopAttack = false
	self.shadowPosition = Vector3.zero
	self.shadowSize = ControllerMain.CameraShadowSize
	ControllerModeBase.callIdStart = BattleData.AnimalId_Call

	if SystemHelper.isSubquadrateScrAS() == true then
		ControllerModeBase.CameraScreenRatioKey = "_43"
	end

	self:UpdateHostPlayer(false)
end

function ControllerModeBase:SetScene(tmpScene)
	self.scene = tmpScene
end

function ControllerModeBase:ExitScene(tmpScene)
	return
end

function ControllerModeBase:Start()
	return
end

function ControllerModeBase:UpdateHostPlayer(isReborn)
	self.hostPlayer = self.sceneController:GetHostPlayer()

	self:ResumeAttack()
end

function ControllerModeBase:HideOrShowAnimal(animal, isShow)
	if isShow == true then
		animal:Show()
	else
		animal:Hide()
	end
end

function ControllerModeBase:IsHaveFinalHit(isBoss, isHost)
	return false
end

function ControllerModeBase:FinalHit()
	return false
end

function ControllerModeBase:IsStopAttack()
	return self.stopAttack
end

function ControllerModeBase:StopAttack()
	self.stopAttack = true
end

function ControllerModeBase:ResumeAttack()
	self.stopAttack = false
end

function ControllerModeBase:IsHaveBossMovie(movieType, monsterId)
	return false
end

function ControllerModeBase:HostPlayerNotNormal(flg)
	return
end

function ControllerModeBase:HostPlayerCrazy(flg)
	return
end

function ControllerModeBase:HostPlayerDead()
	return true
end

function ControllerModeBase:HostPlayerDeadFinish()
	self.hostPlayerDeadFinish = true
end

function ControllerModeBase:HostPlayerReborn()
	self.hostPlayerDeadFinish = false

	self:ResumeAttack()
end

function ControllerModeBase:OnMenuReborn()
	return
end

function ControllerModeBase:BossDead()
	return
end

function ControllerModeBase:IsHaveGradeUpMovie(animal)
	return false
end

function ControllerModeBase:BossGradeUpReady(animal)
	return
end

function ControllerModeBase:BossGradeUp(animal)
	return
end

function ControllerModeBase:BossGradeUpAfter(animal)
	self:ResumeAttack()
end

function ControllerModeBase:EnterBossMode(id)
	return
end

function ControllerModeBase:ExitBossMode()
	self:ResumeAttack()
end

function ControllerModeBase:SanMonsterDead()
	return
end

function ControllerModeBase:CloseTutorial()
	return
end

function ControllerModeBase:UpdateQuality(force)
	return
end

function ControllerModeBase:IsInMovie()
	return
end

function ControllerModeBase:StartSave()
	return
end

function ControllerModeBase:IsSaveEnd()
	return
end

function ControllerModeBase:OpenSaveMenu()
	return
end

function ControllerModeBase:GetShadowPosition()
	if self.hostPlayer ~= nil then
		return self.hostPlayer:GetPosByWorldPos()
	end

	return nil
end

function ControllerModeBase:GetShadowSize()
	return ControllerMain.CameraShadowSize
end

function ControllerModeBase:StartDialog(dialogData)
	if dialogData ~= nil and self.dialogMemberList ~= nil then
		local meetingId = dialogData.MeetingId
		local meetingCameraId = dialogData.MeetingCameraId
		local aperture = dialogData.Aperture
		local meetingData = self:GetMeetingData(dialogData.DialogId)

		if meetingData ~= nil then
			for tmpStandIndex, tmpMember in pairs(self.dialogMemberList) do
				local bind = meetingData["StandMonsterBind" .. tmpStandIndex]
				local reset = meetingData["ResetPosition" .. tmpStandIndex]

				if tmpMember ~= nil then
					if tmpStandIndex > 10 then
						tmpMember:Show()

						if reset ~= nil and reset > 0 then
							tmpMember:RecordPosAndRotBeforeDialog(true)
						else
							tmpMember:RecordPosAndRotBeforeDialog(false)
						end

						if bind ~= nil and bind > 0 then
							tmpMember:ChangeToDialog(meetingData["StandPosition" .. tmpStandIndex], meetingData["StandOrientation" .. tmpStandIndex])
						else
							tmpMember:ChangeToDialog(tmpMember:GetPosByWorldPos(), tmpMember:GetForward())
						end
					elseif tmpStandIndex > 0 then
						tmpMember:ChangeToDialog(meetingData["StandPosition" .. tmpStandIndex], meetingData["StandOrientation" .. tmpStandIndex])

						if dialogData.HideAllHero == 1 then
							tmpMember:SetRenderAllVisible(AnimalBase_Define.VisibleType.Dialog, false)
						else
							local heroId = FS_UserData.story:GetSelectHeroId(tmpStandIndex)

							if heroId == dialogData.HideHeroId then
								tmpMember:Hide()
							elseif dialogData.HideHeroId == 10000 and heroId ~= FS_SaveStory.DefaultHeroId then
								tmpMember:Hide()
							else
								tmpMember:Show()
							end
						end
					else
						tmpMember:Show()
						tmpMember:ChangeToDialog(tmpMember:GetPosByWorldPos(), tmpMember:GetForward())
					end
				end
			end

			self.scene:SetPostProcessType(SceneBase.PostProcessType.Dialog)

			if LS_Setting.graphics.quality <= LS_Setting.QualityLevel.Low and Platform == PlatformType.ANDROID then
				self.scene:SetDepthOfFieldEnable(false)
			else
				self.scene:SetDepthOfFieldEnable(true)
			end

			self.cameraScene:SetMode(CameraMain.ModeType.Dialog)
			self:SwitchDialogCameraId(dialogData.DialogId, meetingCameraId, aperture)
			UIManager.SendMessage("Mainmenu", "ShowGameUI", false)
			self.sceneController:OpenDialog(dialogData.DialogId, self.dialogMemberList)
			UIManager.SendMessage("Mainmenu", "ShowActionButton", ControllerMain.AssistButton.Dialog, false)

			return true
		end
	end

	return false
end

function ControllerModeBase:SwitchDialogCameraId(dialogId, meetingCameraId, aperture, animatorId)
	if self.cameraScene == nil then
		return
	end

	local meetingData = self:GetMeetingData(dialogId)

	if meetingData ~= nil and meetingCameraId > 0 and self.cameraScene:IsMode(CameraMain.ModeType.Dialog) == true then
		self.cameraScene:EndAnimator()
		self.cameraScene:SynchronizePosAndRot(meetingData["CameraPosition" .. meetingCameraId .. ControllerModeBase.CameraScreenRatioKey], meetingData["CameraRotation" .. meetingCameraId .. ControllerModeBase.CameraScreenRatioKey])

		if aperture ~= nil and aperture > 0 then
			self.scene:SetDepthOfFieldAperture(aperture)
		end

		if animatorId ~= nil and animatorId > 0 then
			self.cameraScene:SetAnimatorTemplate(meetingData["CameraAnimator" .. meetingCameraId .. "_" .. animatorId .. ControllerModeBase.CameraScreenRatioKey], true, CameraBase.AnimatorPurpose.Dialog, nil)
			self.cameraScene:StartAnimator()
		end

		local shadowPos = meetingData["ShadowPosition" .. meetingCameraId]
		local shadowSize = meetingData["ShadowSize" .. meetingCameraId]

		if shadowPos ~= nil and shadowSize ~= nil then
			self.shadowPosition:SetVector3(shadowPos)

			self.shadowSize = shadowSize
		else
			self.shadowPosition:SetVector3(self.hostPlayer:GetPosByWorldPos())

			self.shadowSize = ControllerMain.CameraShadowSize
		end
	end
end

function ControllerModeBase:ExitDialogFinish()
	return
end

function ControllerModeBase:ExitDialog()
	self.cameraScene:EndAnimator()
	self.cameraScene:SetMode(CameraMain.ModeType.Following)

	if LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Ultra then
		self.scene:SetPostProcessType(SceneBase.PostProcessType.MainSuper)
	elseif LS_Setting.graphics.quality >= LS_Setting.QualityLevel.Medium then
		self.scene:SetPostProcessType(SceneBase.PostProcessType.MainPro)
	else
		self.scene:SetPostProcessType(SceneBase.PostProcessType.Main)
	end

	UIManager.SendMessage("Mainmenu", "ShowGameUI", true)

	if self.dialogMemberList ~= nil then
		local endPos

		for tmpStandIndex, tmpMember in pairs(self.dialogMemberList) do
			if tmpMember ~= nil then
				if tmpStandIndex == 1 then
					endPos = tmpMember:GetPosByWorldPos():Clone()
				end

				tmpMember:StopDialog()
				tmpMember:ResetPosAndRotAfterDialog()

				if tmpMember:IsHost() == true then
					tmpMember:SetRenderAllVisible(AnimalBase_Define.VisibleType.Dialog, true)

					if tmpMember ~= self.hostPlayer then
						tmpMember:Hide()
					else
						if endPos then
							tmpMember:SetPosByWorldPos(endPos, true)

							endPos = nil
						end

						tmpMember:Show()
					end
				end
			end
		end
	end
end

function ControllerModeBase:StartSceneCamera(locatorType, locatorId, cameraId)
	if self.cameraScene == nil then
		return
	end

	if self.cameraScene then
		self.cameraScene:SetMode(CameraMain.ModeType.Menu)
	end

	UIManager.SendMessage("Mainmenu", "ShowBaseUI", false)

	local locatorData = MS_SceneData.GetData(locatorType, locatorId)

	if locatorData ~= nil and cameraId > 0 and self.cameraScene:IsMode(CameraMain.ModeType.Menu) == true then
		self.cameraScene:SetAnimatorBack()
		self.cameraScene:SynchronizePosAndRot(locatorData["CameraPosition" .. cameraId .. ControllerModeBase.CameraScreenRatioKey], locatorData["CameraRotation" .. cameraId .. ControllerModeBase.CameraScreenRatioKey])
	end
end

function ControllerModeBase:ExitSceneCamera()
	if self.cameraScene then
		self.cameraScene:SetAnimatorBack()
		self.cameraScene:SetMode(CameraMain.ModeType.Following)
	end

	self:ChangeStatus(ControllerStoryMode.Status.Normal)
	UIManager.SendMessage("Mainmenu", "ShowBaseUI", true)
end

function ControllerModeBase:StartSceneCameraAnimator(locatorType, locatorId, cameraId, animatorId, CB)
	if self.cameraScene == nil then
		return
	end

	if self.cameraScene then
		self.cameraScene:SetMode(CameraMain.ModeType.Menu)
	end

	local locatorData = MS_SceneData.GetData(locatorType, locatorId)

	if locatorData ~= nil and cameraId > 0 and self.cameraScene:IsMode(CameraMain.ModeType.Menu) == true then
		self.cameraScene:ClearCallBack()
		self.cameraScene:EndAnimator()
		self.cameraScene:SynchronizePosAndRot(locatorData["CameraPosition" .. cameraId .. ControllerModeBase.CameraScreenRatioKey], locatorData["CameraRotation" .. cameraId .. ControllerModeBase.CameraScreenRatioKey])

		if animatorId ~= nil and animatorId > 0 and locatorData["CameraAnimator" .. cameraId .. "_" .. animatorId .. ControllerModeBase.CameraScreenRatioKey] ~= nil then
			self.cameraScene:SetAnimatorTemplate(locatorData["CameraAnimator" .. cameraId .. "_" .. animatorId .. ControllerModeBase.CameraScreenRatioKey], false, CameraBase.AnimatorPurpose.Event, nil)
			self.cameraScene:StartAnimator(CB)
		elseif CB then
			CB()
		end
	end
end

function ControllerModeBase:OpenLocatorCameraAnimator(locatorType, locatorId, cameraId, animatorId, CB)
	if self.cameraScene == nil then
		return
	end

	local locatorData = MS_SceneData.GetData(locatorType, locatorId)

	if locatorData ~= nil then
		self.cameraScene:ClearCallBack()
		self.cameraScene:EndAnimator()

		if animatorId ~= 2 and locatorData["CameraPosition" .. cameraId .. ControllerModeBase.CameraScreenRatioKey] ~= nil and locatorData["CameraRotation" .. cameraId .. ControllerModeBase.CameraScreenRatioKey] ~= nil then
			self.cameraScene:SynchronizePosAndRot(locatorData["CameraPosition" .. cameraId .. ControllerModeBase.CameraScreenRatioKey], locatorData["CameraRotation" .. cameraId .. ControllerModeBase.CameraScreenRatioKey])
		end

		if locatorData["CameraAnimator" .. cameraId .. "_" .. animatorId .. ControllerModeBase.CameraScreenRatioKey] ~= nil then
			if self.cameraScene then
				self.cameraScene:SetMode(CameraMain.ModeType.Menu)
			end

			self:ChangeStatus(ControllerStoryMode.Status.Locator)
			self.cameraScene:SetAnimatorTemplate(locatorData["CameraAnimator" .. cameraId .. "_" .. animatorId .. ControllerModeBase.CameraScreenRatioKey], false, CameraBase.AnimatorPurpose.Event, nil)
			self.cameraScene:StartAnimator(function()
				if CB then
					CB()
				else
					self:ExitSceneCamera()
					self:ChangeStatus(ControllerStoryMode.Status.Normal)
				end
			end)
		elseif CB then
			CB()
		end
	end
end

function ControllerModeBase:CheckShowQuestComplete(questStr)
	if questStr ~= "" then
		local questList = StringHelper.Split(questStr, ";")

		for i, qId in pairs(questList) do
			if FS_UserData.story:IsQuestComplete(qId) == false then
				return false
			end
		end

		return true
	else
		return true
	end
end

function ControllerModeBase:CheckHideQuestComplete(questStr)
	if questStr ~= "" then
		local questList = StringHelper.Split(questStr, ";")

		for i, qId in pairs(questList) do
			if FS_UserData.story:IsQuestComplete(qId) == true then
				return true
			end
		end
	end

	return false
end

function ControllerModeBase:IsQuestAllComplete(questStr)
	if questStr ~= "" then
		local questList = StringHelper.Split(questStr, ";")

		for i, qId in pairs(questList) do
			if FS_UserData.story:IsQuestComplete(qId) == false then
				return false
			end
		end

		return true
	end

	return false
end

function ControllerModeBase:CompleteQuest(questStr)
	if questStr ~= "" then
		local questList = StringHelper.Split(questStr, ";")

		for i, qId in pairs(questList) do
			self:CompleteQuestEach(tonumber(qId))
		end
	end
end

function ControllerModeBase:RevertCompleteQuest(questStr)
	if questStr ~= "" then
		local questList = StringHelper.Split(questStr, ";")

		for i, qId in pairs(questList) do
			self:RevertCompleteQuestEach(tonumber(qId))
		end
	end
end

function ControllerModeBase:IsPermitRageMax(heroId)
	return true
end

function ControllerModeBase:RecordHeroSkillLog(heroId, recordSkillType, skillIndex, skillCombo)
	self.logIndex = self.logIndex % 2 + 1
	self.logHeroId[self.logIndex] = heroId
	self.logRecordSkillType[self.logIndex] = recordSkillType
	self.logSkillIndex[self.logIndex] = skillIndex
	self.logSkillCombo[self.logIndex] = skillCombo
end

function ControllerModeBase:IsHaveHeroSkillLog(heroId, recordSkillType, skillIndex, skillCombo)
	if self.logIndex > 0 then
		for i = 1, #self.logHeroId do
			if self.logHeroId[i] == heroId and self.logRecordSkillType[i] == recordSkillType and self.logSkillIndex[i] == skillIndex and self.logSkillCombo[i] == skillCombo then
				return true
			end
		end
	end

	return false
end

function ControllerModeBase:IsHaveStoryRule(rule)
	return false
end

function ControllerModeBase:ClearHeroSkillLog()
	for i = 1, #self.logHeroId do
		self.logHeroId[i] = 0
		self.logRecordSkillType[i] = 0
		self.logSkillIndex[i] = 0
		self.logSkillCombo[i] = 0
	end

	self.logIndex = 0
end

function ControllerModeBase:CallAnimalDynamic(fromAnimal, id, toBorn)
	return
end

function ControllerModeBase:CallAnimal(fromAnimal, id, toBorn)
	return
end

function ControllerModeBase:GetMonsterIncludeDead(id)
	return nil
end

function ControllerModeBase:InitArea()
	return
end

function ControllerModeBase:EnterArea(changeScene)
	return
end

function ControllerModeBase:ExitArea()
	return
end

function ControllerModeBase:ShowIcon(type, id, index, x, y, z)
	return
end

function ControllerModeBase:ClearIconAll()
	return
end

function ControllerModeBase:IsIconVisible(type, id, index, x, y, z)
	return false
end

function ControllerModeBase:GameResultSubmit()
	return
end

function ControllerModeBase:Update()
	ControllerBase.Update(self)
end

function ControllerModeBase:UpdateLoadArea()
	ControllerBase.UpdateLoadArea(self)
end

function ControllerModeBase:Exit()
	self.sceneController = nil
	self.loadCharacterManager = nil
	self.hostPlayer = nil
	self.scene = nil
	self.camera = nil
	self.cameraScene = nil
	self.logHeroId = nil
	self.logRecordSkillType = nil
	self.logSkillIndex = nil
	self.logSkillCombo = nil
	self.selectHostPlayerEnable = nil
	self.dialogMemberList = nil
	self.shadowPosition = nil

	ControllerBase.Exit(self)
end

return ControllerModeBase
