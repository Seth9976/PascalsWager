-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/TimeLine.lua

TimeLine = class("TimeLine")
TimeLine.static.Status = {
	Open = 2,
	Close = 1,
	Empty = 0
}
Door.static.Type = {
	Wood = 1,
	Metal = 2
}

function TimeLine:initialize(id, transform)
	self.tfSelf = transform
	self.id = id
	self.storyId = 0

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		self.storyId = FS_UserData.story:GetStoryId()
	end

	self.sceneController = ST_Main.GetSceneController()
	self.timeLineController = self.tfSelf:GetComponent("TimeLineController")

	self.timeLineController:Init()

	local cameraStart = TfFindChild(self.tfSelf, "camera_root/cameraStart")

	self.cameraStartPos = cameraStart.position
	self.cameraStartRot = cameraStart.rotation

	local cameraEnd = TfFindChild(self.tfSelf, "camera_root/cameraEnd")

	self.cameraEndPos = cameraEnd.position
	self.cameraEndRot = cameraEnd.rotation
	self.tfShadow = TfFindChild(self.tfSelf, "prop_root/shadow")
	self.controlPlayer = false
	self.resetPlayer = false
	self.controlCrow = false
	self.switchPlayer = false
	self.useTransition = false
	self.inBattleMode = false
	self.colliderIgnore = false
	self.controlPlayer, self.resetPlayer, self.controlCrow, self.switchPlayer, self.useTransition, self.inBattleMode, self.colliderIgnore = self.timeLineController:GetParamInfo(self.controlPlayer, self.resetPlayer, self.controlCrow, self.switchPlayer, self.useTransition, self.inBattleMode, self.colliderIgnore)
	self.director = self.tfSelf:GetComponent("PlayableDirector")

	self.tfSelf.gameObject:SetActive(false)

	self.timeLineData = MS_StoryTimeLine.GetStoryTimeLine(self.storyId, self.id)
	self.playing = false
	self.exit = false
	self.time = 0
	self.subtitleList = nil
	self.subtitleIndex = 1
	self.isSubtitlePlaying = false
	self.hostPlayer1 = nil
	self.hostPlayer2 = nil
	self.animalList = nil
	self.tmpPlayerTf = nil
end

function TimeLine:GetTimeLineId()
	return self.id
end

function TimeLine:IsControlPlayer()
	return self.controlPlayer
end

function TimeLine:IsColliderIgnore()
	return self.colliderIgnore
end

function TimeLine:IsResetPlayer()
	return self.resetPlayer
end

function TimeLine:IsControlCrow()
	return self.controlCrow
end

function TimeLine:IsSwitchPlayer()
	return self.switchPlayer
end

function TimeLine:IsUseTransition()
	return self.useTransition
end

function TimeLine:IsPlayerInBattleMode()
	return self.inBattleMode
end

function TimeLine:GetToArea()
	return self.timeLineData.ToArea
end

function TimeLine:GetBindMonsterIdList()
	local monsterIdList
	local retNum = 0

	if self.timeLineController ~= nil then
		retNum, monsterIdList = self.timeLineController:GetMonsterIdList(monsterIdList)
	end

	return retNum, monsterIdList
end

function TimeLine:Stop()
	if self.exit == true then
		return
	end

	self.exit = true

	if self.timeLineController ~= nil then
		self.timeLineController:Stop()
	end

	self.playing = false

	self.tfSelf.gameObject:SetActive(false)

	self.time = 0
	self.subtitleList = nil
	self.subtitleIndex = 1
	self.isSubtitlePlaying = false

	AudioCtrl.SetTimelineAudio(true)
	AudioCtrl.StopMovieSubtitleAudio(self.storyId, self.id, AudioCtrl.SubtitleType.TimeLine)

	if self.tmpPlayerTf ~= nil then
		GoDestroyImmediate(self.tmpPlayerTf.gameObject)
	end

	self.tmpPlayerTf = nil
end

function TimeLine:Ready(camera, hostPlayer1, transition)
	if self.playing == false and self.timeLineController ~= nil then
		self.exit = false

		local ret = false

		if hostPlayer1 ~= nil then
			local pos, rot

			if transition == false then
				hostPlayer1:ChangeToTimeLine(transition)
			end

			local bindingHeroId = hostPlayer1:GetHeroId()

			if bindingHeroId == 10001 then
				bindingHeroId = hostPlayer1:GetHeroIdWithSkin()
			end

			ret, pos, rot = self.timeLineController:SetBindingHero(bindingHeroId, hostPlayer1:GetTransform(), pos, rot)

			if ret == true then
				if transition == true then
					hostPlayer1:ChangeToTimeLineMove(pos, rot)
				elseif self:IsResetPlayer() == true then
					hostPlayer1:SetPosByWorldPos(pos, true)
					hostPlayer1:SetRotation(rot, true)
				end
			end
		end

		self.hostPlayer1 = hostPlayer1

		if camera ~= nil then
			ret = self.timeLineController:SetBindingCamera(camera:GetCameraRoot())

			if ret == true and transition == true then
				camera:SetCameraTargetPosAndRot(self.cameraStartPos, self.cameraStartRot)
			end
		end

		return true
	end

	return false
end

function TimeLine:Play(hostPlayer2, crow, animalList)
	if self.playing == false and self.timeLineController ~= nil then
		self.playing = true
		self.exit = false

		local ret = false
		local colliderIgnore = self:IsColliderIgnore()

		if hostPlayer2 ~= nil then
			local pos, rot

			hostPlayer2:ChangeToTimeLine(false)

			local bindingHeroId = hostPlayer2:GetHeroId()

			if bindingHeroId == 10001 then
				bindingHeroId = hostPlayer2:GetHeroIdWithSkin()
			end

			ret, pos, rot = self.timeLineController:SetBindingHero(bindingHeroId, hostPlayer2:GetTransform(), pos, rot)

			if ret == true then
				hostPlayer2:SetPosByWorldPos(pos, true)
				hostPlayer2:SetRotation(rot, true)
			end

			if colliderIgnore == true then
				hostPlayer2:SetMoveGhost(true)
			end
		end

		self.hostPlayer2 = hostPlayer2

		if crow ~= nil then
			local pos, rot

			crow:ChangeToTimeLine(false)

			ret, pos, rot = self.timeLineController:SetBindingCrow(crow:GetTransform(), pos, rot)

			if ret == true then
				crow:SetPosition(pos)
				crow:SetRotation(rot)
				crow:RefreshTransform()
			end
		end

		if animalList ~= nil then
			for monsterId, tmpAnimal in pairs(animalList) do
				if tmpAnimal ~= nil then
					local pos, rot

					tmpAnimal:ChangeToTimeLine(false)

					ret, pos, rot = self.timeLineController:SetBindingAnimal(tmpAnimal:GetStoryMonsterId(), tmpAnimal:GetTransform(), pos, rot)

					if ret == true then
						tmpAnimal:SetPosByWorldPos(pos, true)
						tmpAnimal:SetRotation(rot, true)
					end

					if colliderIgnore == true then
						tmpAnimal:SetMoveGhost(true)
					end
				end
			end
		end

		self.animalList = animalList
		self.subtitleList = MS_StoryTimeLineSubtitle.GetSubtitleList(self.storyId, self.id)

		UIManager.SendMessage("Subtitle", "ClearAllTexts")
		AudioCtrl.SetTimelineAudio(false)

		if MS_StoryList.IsStoryDLC(self.storyId) == false then
			FmodManager.PlaySceneSe("Timeline/story" .. self.storyId .. "/timeline_" .. self.id .. "/sfx")

			local sfxName = "Timeline/story" .. self.storyId .. "/timeline_" .. self.id .. "/sfx_2"

			if AudioCtrl.isAudioExist(sfxName) == true then
				FmodManager.PlaySceneSe(sfxName)
			end
		end

		self.tfSelf.gameObject:SetActive(true)
		self.timeLineController:Play()
	end
end

function TimeLine:PlaySecondaryPlayer(loadHeroId, bindingHeroId)
	local ret = self.sceneController:GetLoadCharacterManager():IsHaveCharacterInTemplate(loadHeroId)

	if ret == true then
		local tfCharaObj = self.sceneController:GetLoadCharacterManager():LoadCharacter(loadHeroId, LoadCharacterManager.LoadType.TimeLine)

		if tfCharaObj ~= nil then
			local ret = false
			local pos, rot

			self:InitTimeLinePlayer(tfCharaObj)

			ret, pos, rot = self.timeLineController:SetBindingHero(bindingHeroId, tfCharaObj, pos, rot)
			self.tmpPlayerTf = tfCharaObj

			return ret
		end
	end

	return false
end

function TimeLine:IsPlaying()
	return self.playing
end

function TimeLine:GetCameraStartInfo()
	return self.cameraStartPos, self.cameraStartRot
end

function TimeLine:GetCameraEndInfo()
	return self.cameraEndPos, self.cameraEndRot
end

function TimeLine:GetShadowPosition()
	if self.tfShadow ~= nil then
		return self.tfShadow.position
	end

	return nil
end

function TimeLine:PlaySubtitle()
	if self.subtitleList ~= nil then
		local subtitleDate = self.subtitleList[self.subtitleIndex]

		if subtitleDate ~= nil then
			local time = tonumber(self.time)

			if time >= tonumber(subtitleDate.Begin) and time < tonumber(subtitleDate.End) and self.isSubtitlePlaying == false then
				local context = subtitleDate["Context_" .. LS_Setting.GetLanguage()]

				if DebugLogVoiceId == true and subtitleDate.Audio ~= nil then
					context = subtitleDate.Audio .. "/" .. context
				end

				if context ~= nil then
					UIManager.SendMessage("Subtitle", "SetSubtitle", context, subtitleDate.PanelIndex, false, self.controlPlayer)
				end

				AudioCtrl.SetMovieSubtitleAudio(self.storyId, subtitleDate.TimeLineId, subtitleDate.Audio, LS_Setting.GetVoiceLanguage(), AudioCtrl.SubtitleType.TimeLine)

				self.isSubtitlePlaying = true
			elseif time >= tonumber(subtitleDate.End) then
				local text = UIManager.SendMessage("Subtitle", "GetSubtitleContent", subtitleDate.PanelIndex)

				if text ~= nil and text ~= "" then
					local context = subtitleDate["Context_" .. LS_Setting.GetLanguage()]

					if context == text then
						UIManager.SendMessage("Subtitle", "SetSubtitle", "", subtitleDate.PanelIndex, false, self.controlPlayer)
					end
				end

				self.subtitleIndex = self.subtitleIndex + 1
				self.isSubtitlePlaying = false
			end
		end
	end
end

function TimeLine:GetHeroTargetEnd(hostPlayer)
	local pos, rot
	local ret = false

	if hostPlayer ~= nil then
		ret, pos, rot = self.timeLineController:GetHeroTargetEnd(hostPlayer:GetHeroId(), pos, rot)
	end

	return ret, pos, rot
end

function TimeLine:Skip(hostPlayer1, hostPlayer2, animalList)
	if self.timeLineController ~= nil then
		local pos, rot
		local ret = false

		ret, pos, rot = self:GetHeroTargetEnd(hostPlayer1)

		if ret == true and pos ~= nil and rot ~= nil then
			hostPlayer1:SetPosByWorldPos(pos, true)
			hostPlayer1:SetRotation(rot, true)
		end

		ret, pos, rot = self:GetHeroTargetEnd(hostPlayer2)

		if ret == true and pos ~= nil and rot ~= nil then
			hostPlayer2:SetPosByWorldPos(pos, true)
			hostPlayer2:SetRotation(rot, true)
		end

		if animalList ~= nil then
			for monsterId, tmpAnimal in pairs(animalList) do
				if tmpAnimal ~= nil then
					local pos, rot

					ret, pos, rot = self.timeLineController:GetAnimalTargetEnd(tmpAnimal:GetStoryMonsterId(), pos, rot)

					if ret == true then
						tmpAnimal:SetPosByWorldPos(pos, true)
						tmpAnimal:SetRotation(rot, true)
					end
				end
			end
		end

		FmodManager.StopSceneSe("Timeline/story" .. self.storyId .. "/timeline_" .. self.id .. "/sfx", "")
		FmodManager.StopSceneSe("Timeline/story" .. self.storyId .. "/timeline_" .. self.id .. "/sfx_2", "")
	end
end

function TimeLine:Update()
	if self.playing == true then
		self.time = self.time + Time.deltaTime

		if self.timeLineController ~= nil then
			self.playing = self.timeLineController:IsPlaying()

			if self.playing == false then
				if self.controlPlayer == false then
					self:Stop()
				end
			else
				self:PlaySubtitle()
			end
		end
	end
end

function TimeLine:InitTimeLinePlayer(tfChara)
	local goChara = tfChara.gameObject

	tfChara.localScale = Vector3.one
	tfChara.localPosition = Vector3.zero
	tfChara.localRotation = Quaternion.identity

	local tfPuppetMaster = TfFindChild(tfChara, tfChara.name .. "_PuppetMaster")

	if tfPuppetMaster ~= nil then
		tfPuppetMaster.gameObject:SetActive(false)
	end

	local tfLips = TfFindChild(tfChara, "lipsyncs")

	if tfLips ~= nil then
		tfLips.gameObject:SetActive(false)
	end

	local finalIkLookAtIK = tfChara:GetComponent("RootMotion.FinalIK.LookAtIK")

	if finalIkLookAtIK ~= nil then
		finalIkLookAtIK.enabled = false
	end

	goChara:SetActive(true)
end

function TimeLine:Exit()
	self.tfSelf = nil
	self.sceneController = nil
	self.timeLineController = nil
	self.director = nil
	self.timeLineData = nil
	self.subtitleList = nil
	self.hostPlayer1 = nil
	self.hostPlayer2 = nil
	self.animalList = nil
end

return TimeLine
