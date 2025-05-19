-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Audio/AudioCtrl.lua

AudioCtrl = class("AudioCtrl")
AudioCtrl.ButtonClickType = {
	TalentChoose = 8,
	PageSwitch = 5,
	MainPageSwitch = 4,
	MapSelect = 10,
	EquipmentChoose = 7,
	ItemChoose = 6,
	Common = 1,
	Option = 3,
	DialogueChoose = 9,
	Back = 2,
	None = 0
}
AudioCtrl.FootstepsType = {
	River = "river",
	Branch = "Branch",
	Grass = "grass",
	Slurry = "slurry",
	Wood = "wood",
	Carpet = "carpet",
	Mud = "mud",
	Water = "water",
	Unknown = "",
	Gold = "Gold",
	Stone = "stone",
	Lake = "lake",
	WetLand = "WetLand"
}
AudioCtrl.GetHitType = {
	Unknown = 0,
	Metal = 1,
	Bleed = 2,
	Stone = 3,
	Wood = 4
}
AudioCtrl.SubtitleType = {
	TimeLine = 2,
	Unknown = 0,
	Movie = 1
}
AudioCtrl.static.HighAltitude = 15
AudioCtrl.static.LowAltitude = 13
AudioCtrl.static.DepressAudioRadio = 0.6
AudioCtrl.FmodInstanceList = {}

function AudioCtrl.SetListenerPos(pos, rot)
	FmodManager.SetListenerPosition(pos, rot)
end

function AudioCtrl.isAudioExist(name)
	if name ~= nil and name ~= "" then
		name = tostring(name)

		local isExit = FmodManager.isEvenExist(name)

		return isExit
	end

	return false
end

function AudioCtrl.SetFootstepsAudio(modelName, transformOrPosition, animalId, footstepsType, type, footIndex)
	if type == AnimalBase_Define.Type.Hero then
		local fsType = AudioCtrl.FootstepsType.Mud

		if footstepsType == SceneBase.GroundType.Mud or footstepsType == SceneBase.GroundType.SlowMud or footstepsType == SceneBase.GroundType.PoisonMud then
			fsType = AudioCtrl.FootstepsType.Mud
		elseif footstepsType == SceneBase.GroundType.Wood then
			fsType = AudioCtrl.FootstepsType.Wood
		elseif footstepsType == SceneBase.GroundType.Stone then
			fsType = AudioCtrl.FootstepsType.Stone
		elseif footstepsType == SceneBase.GroundType.Grass then
			fsType = AudioCtrl.FootstepsType.Grass
		elseif footstepsType == SceneBase.GroundType.Water then
			fsType = AudioCtrl.FootstepsType.Water
		elseif footstepsType == SceneBase.GroundType.River then
			fsType = AudioCtrl.FootstepsType.River
		elseif footstepsType == SceneBase.GroundType.Lake then
			fsType = AudioCtrl.FootstepsType.Water
		elseif footstepsType == SceneBase.GroundType.Carpet then
			fsType = AudioCtrl.FootstepsType.Carpet
		elseif footstepsType == SceneBase.GroundType.Slurry then
			fsType = AudioCtrl.FootstepsType.Slurry
		elseif footstepsType == SceneBase.GroundType.Branch then
			fsType = AudioCtrl.FootstepsType.Branch
		elseif footstepsType == SceneBase.GroundType.WetLand then
			fsType = AudioCtrl.FootstepsType.Water
		elseif footstepsType == SceneBase.GroundType.Gold then
			fsType = AudioCtrl.FootstepsType.Gold
		end

		FmodManager.PlayHeroSe("Character/" .. modelName .. "/footsteps/footsteps_" .. fsType, transformOrPosition, "hero" .. animalId, "footstepsIndex", footIndex)
	else
		local audioName = "Character/" .. modelName .. "/footsteps"
		local isExist = AudioCtrl.isAudioExist(audioName)

		if isExist == true then
			FmodManager.PlayHeroSe(audioName, transformOrPosition, "hero" .. animalId, "footstepsIndex", footIndex)
		end
	end
end

function AudioCtrl.SetHeroAudio(name, transformOrPosition, animalId, paramName, param, isOneshot)
	if name ~= nil then
		animalId = tostring(animalId)

		local audioName = "Character/" .. name

		FmodManager.PlayHeroSe(audioName, transformOrPosition, "hero" .. animalId, paramName or "", param or 0, isOneshot or false)
	end
end

function AudioCtrl.StopHeroAudio(name, animalId)
	if name ~= nil then
		local audioName = "Character/" .. name
		local paramValue = "hero" .. animalId

		FmodManager.StopSceneSe(audioName, paramValue)
	end
end

function AudioCtrl.SetSceneBGM(name, storyId)
	if name ~= nil then
		name = string.lower(name)

		local audioName = ""

		if storyId ~= nil and storyId > 0 then
			if MS_StoryList.IsStoryMazeStart(storyId) == true then
				return
			elseif BattleData.IsDarkForestScene() == true or MS_StoryList.IsStoryMaze(storyId) == true then
				audioName = "BGM/main_story_san"
			else
				audioName = "BGM/story" .. storyId .. "/" .. name .. "_level_" .. storyId
			end
		else
			audioName = "BGM/" .. name
		end

		FmodManager.PlaySceneBgm(audioName)
	else
		FmodManager.StopBgm()
	end
end

function AudioCtrl.SetBattleBGM(storyId, isPlay)
	local bgmId = 0

	if MS_StoryList.IsStoryMazeBoss(storyId) == true then
		local storyData = MS_StoryList.GetStoryData(storyId)

		if storyData:GetRelatedStoryId() > 0 then
			storyId = storyData:GetRelatedStoryId()
			bgmId = storyId
		else
			bgmId = storyId
		end
	elseif MS_StoryList.IsStoryDLC(storyId) == true then
		local areaId = FS_UserData.story:GetAreaId()

		if areaId == 4 then
			bgmId = "9_2"
		elseif areaId == 6 then
			bgmId = "9_3"
		elseif areaId == 5 then
			bgmId = "9_1"
		end
	elseif MS_StoryList.IsBossChallenge(storyId) == true then
		local storyData = MS_StoryList.GetStoryData(storyId)

		if storyData:GetRelatedStoryId() > 0 then
			storyId = storyData:GetRelatedStoryId()
			bgmId = storyId
		else
			bgmId = storyId
		end
	else
		bgmId = storyId
	end

	local BattleName = "BGM/story" .. storyId .. "/story_bossbattle_level_" .. bgmId

	if isPlay == true then
		FmodManager.PauseBgm(true)
		FmodManager.SetSnapshot("BGM_Bossbattle_Control", "switchIndex", 1)
		FmodManager.PlaySceneSe(BattleName)
	else
		FmodManager.PauseBgm(false)
		FmodManager.SetSnapshot("BGM_Bossbattle_Control", "switchIndex", 0)
	end
end

function AudioCtrl.SetSFXAudio(value)
	FmodManager.SetParameterValue("SFX", "switchIndex", value)
end

function AudioCtrl.SetBGMAudio(value)
	FmodManager.SetParameterValue("BGM", "switchIndex", value)
end

function AudioCtrl.DepressOrRiseAudio(isDepress)
	if isDepress == true then
		FmodManager.SetParameterValue("SFX", "switchIndex", AudioCtrl.DepressAudioRadio)
		FmodManager.SetParameterValue("BGM", "switchIndex", AudioCtrl.DepressAudioRadio)
	else
		FmodManager.SetParameterValue("SFX", "switchIndex", 1)
		FmodManager.SetParameterValue("BGM", "switchIndex", 1)
	end
end

function AudioCtrl.SetPause(isPause)
	if isPause == true then
		FmodManager.SetSnapshot("Pause", "pause", 1)
		FmodManager.SetPaused_Menu(true)
	else
		FmodManager.SetSnapshot("Pause", "pause", 0)
		FmodManager.SetPaused_Menu(false)
	end
end

function AudioCtrl.SetMovieAudio(isOut)
	if isOut == false then
		FmodManager.SetParameterValue("Movie", "switchIndex", 1)
		FmodManager.SetParameterValue("BGM", "switchIndex", 0)
		FmodManager.SetParameterValue("SFX", "switchIndex", 0)
	else
		FmodManager.SetParameterValue("Movie", "switchIndex", 0)
		FmodManager.SetParameterValue("BGM", "switchIndex", 1)
		FmodManager.SetParameterValue("SFX", "switchIndex", 1)
	end
end

function AudioCtrl.SetTimelineAudio(isOut)
	if isOut == false then
		FmodManager.SetParameterValue("Movie", "switchIndex", 1)
		FmodManager.SetParameterValue("BGM", "switchIndex", 0)
	else
		FmodManager.SetParameterValue("Movie", "switchIndex", 0)
		FmodManager.SetParameterValue("BGM", "switchIndex", 1)
	end
end

function AudioCtrl.SetMovieSubtitleAudio(storyId, sceneId, name, language, subtitleType)
	local subtitleFolder = ""

	if subtitleType == AudioCtrl.SubtitleType.Movie then
		subtitleFolder = "Movie/story" .. storyId .. "/" .. sceneId .. "/subtitle/"
	elseif subtitleType == AudioCtrl.SubtitleType.TimeLine then
		subtitleFolder = "TimeLine/story" .. storyId .. "/timeline_" .. sceneId .. "/subtitle/"
	end

	if name ~= nil and name ~= "" and DebugNoVoice == false then
		local audioName = subtitleFolder .. language .. "/" .. name .. "_" .. language
		local isExit = AudioCtrl.isAudioExist(audioName)

		if isExit == true then
			FmodManager.PlaySceneSe(audioName)
		end
	end
end

function AudioCtrl.StopMovieSubtitleAudio(storyId, sceneId, subtitleType)
	local subtitleFolder = ""

	if subtitleType == AudioCtrl.SubtitleType.Movie then
		subtitleFolder = "Movie/story" .. storyId .. "/" .. sceneId .. "/subtitle/"
	elseif subtitleType == AudioCtrl.SubtitleType.TimeLine then
		subtitleFolder = "TimeLine/story" .. storyId .. "/timeline_" .. sceneId .. "/subtitle/"
	end

	FmodManager.StopSceneSe(subtitleFolder, nil, true)
end

function AudioCtrl.SetDialogueAudio(dialogType, storyId, id, tf, modelName)
	id = tonumber(id)

	local length = 0
	local fmodInstance

	if id ~= nil and id > 0 then
		if MS_StoryList.IsStoryMaze(storyId) == true or MS_StoryList.IsStoryMazeBoss(storyId) == true then
			storyId = MS_StoryData.StoryIdMazeStart
		end

		local audioName = ""

		if dialogType == MS_StoryDialog.Type.HostWhisper then
			audioName = "ADR/monologue/story" .. storyId .. "/" .. id
		elseif dialogType == MS_StoryDialog.Type.NpcWhisper or dialogType == MS_StoryDialog.Type.CrowWhisper then
			audioName = "ADR/monologue/story" .. storyId .. "/" .. id
		else
			audioName = "ADR/dialogue/story" .. storyId .. "/" .. id
		end

		local isExit = AudioCtrl.isAudioExist(audioName)

		if isExit == true then
			fmodInstance = FmodManager.GetCustomInstance(audioName)

			if fmodInstance ~= nil then
				table.insert(AudioCtrl.FmodInstanceList, fmodInstance)

				if DebugNoVoice == false then
					fmodInstance:Play(0, tf)
				end
			end

			length = FmodManager.GetSeLength(audioName)
		end
	end

	return length, fmodInstance
end

function AudioCtrl.StopDialogueAudio(dialogType, storyId, id, modelName)
	if AudioCtrl.FmodInstanceList ~= nil then
		local audioName = ""

		if dialogType == MS_StoryDialog.Type.HostWhisper then
			audioName = "ADR/monologue/story" .. storyId .. "/" .. id
		elseif dialogType == MS_StoryDialog.Type.NpcWhisper or dialogType == MS_StoryDialog.Type.CrowWhisper then
			audioName = "ADR/monologue/story" .. storyId .. "/" .. id
		else
			audioName = "ADR/dialogue/story" .. storyId .. "/" .. id
		end

		for i, instance in pairs(AudioCtrl.FmodInstanceList) do
			if instance ~= nil and instance:GetEventName() == audioName then
				instance:Stop()
				table.remove(AudioCtrl.FmodInstanceList, i)

				instance = nil

				break
			end
		end
	end
end

function AudioCtrl.StopDialogueAudioAll()
	if AudioCtrl.FmodInstanceList ~= nil then
		for k, instance in pairs(AudioCtrl.FmodInstanceList) do
			if instance ~= nil then
				instance:Stop()

				instance = nil
			end
		end
	end

	AudioCtrl.FmodInstanceList = {}
end

function AudioCtrl.SetSceneAmbienceAudio(storyId)
	if storyId == 1 then
		FmodManager.OpenReverb(true)
		FmodManager.SetSnapshot("Reverb/Story1_reverb")
		FmodManager.SetSnapshot("Ambience/Ambience_switch_story1", "switchIndex", 0)
		FmodManager.PlaySceneSe("Ambience/cave_noise_story1")
		FmodManager.PlaySceneSe("Ambience/weather")
	elseif storyId == 2 then
		FmodManager.OpenReverb(true)
		FmodManager.SetSnapshot("Reverb/Story2_reverb")
		FmodManager.SetSnapshot("Ambience/Ambience_switch_story2", "switchIndex", 0)
		FmodManager.PlaySceneSe("Ambience/weather")
	elseif storyId == 3 then
		FmodManager.OpenReverb(true)
		FmodManager.SetSnapshot("Reverb/Story3_reverb")
		FmodManager.SetSnapshot("Ambience/Ambience_switch_story3", "switchIndex", 0)
		FmodManager.PlaySceneSe("Ambience/weather")
	elseif storyId == 4 then
		FmodManager.OpenReverb(true)
		FmodManager.SetSnapshot("Reverb/Story4_reverb")
		FmodManager.SetSnapshot("Ambience/Ambience_switch_story4", "switchIndex", 0)
		FmodManager.PlaySceneSe("Ambience/weather")
	elseif storyId == 5 then
		FmodManager.OpenReverb(true)
		FmodManager.SetSnapshot("Reverb/Story5_reverb")
		FmodManager.SetSnapshot("Ambience/Ambience_switch_story5", "switchIndex", 0)
		FmodManager.PlaySceneSe("Ambience/weather")
	elseif storyId == 6 then
		FmodManager.OpenReverb(true)
		FmodManager.SetSnapshot("Reverb/Story6_reverb")
		FmodManager.SetSnapshot("Ambience/Ambience_switch_story6", "switchIndex", 0)
		FmodManager.PlaySceneSe("Ambience/weather")
	elseif storyId == 7 then
		FmodManager.OpenReverb(true)
		FmodManager.SetSnapshot("Reverb/Story7_reverb")
		FmodManager.SetSnapshot("Ambience/Ambience_switch_story7", "switchIndex", 0)
		FmodManager.PlaySceneSe("Ambience/cave_noise_story7")
	elseif storyId == 8 then
		FmodManager.OpenReverb(true)
		FmodManager.SetSnapshot("Reverb/Story8_reverb")
		FmodManager.SetSnapshot("Ambience/Ambience_switch_story8", "switchIndex", 0)
		FmodManager.PlaySceneSe("Ambience/weather")
	elseif storyId == 9 then
		FmodManager.OpenReverb(true)
		FmodManager.SetSnapshot("Reverb/Story9_reverb")
		FmodManager.SetSnapshot("Ambience/Ambience_switch_story9", "switchIndex", 0)
		FmodManager.PlaySceneSe("Ambience/weather")
	elseif storyId == 98 then
		FmodManager.PlaySceneSe("Ambience/weather")
	elseif MS_StoryList.IsStoryCarriage(storyId) == true then
		FmodManager.PlaySceneSe("Ambience/carriage")
	elseif MS_StoryList.IsStoryMazeStart(storyId) == true then
		FmodManager.PlaySceneSe("Ambience/weather")
	elseif BattleData.IsDarkForestScene() == true or MS_StoryList.IsStoryDream(storyId) == true then
		FmodManager.OpenReverb(true)
		FmodManager.PlaySceneSe("Ambience/fog")
		FmodManager.SetSnapshot("Reverb/Common_reverb", "timeIndex", 1)
		FmodManager.SetSnapshot("Reverb/Common_reverb", "volIndex", 1)
		FmodManager.SetSnapshot("Ambience/Common_reverb", "switchIndex", 1)
	end
end

function AudioCtrl.SetObjectAudio(name, transformOrPosition, refName, paramName, param)
	if name ~= nil then
		refName = tostring(refName)

		FmodManager.PlayObjectSe(name, transformOrPosition, refName or "", paramName or "", param or 0)
	end
end

function AudioCtrl.StopObjectAudio(name, refName)
	if name ~= nil then
		refName = tostring(refName)

		FmodManager.StopSceneSe(name, refName)
	end
end

function AudioCtrl.SetReverb(storyId, areaType, areaTypeOld, reverbId, reverbIdOld)
	local reverbName = "Reverb/Story" .. storyId .. "_reverb"
	local ambienceSwitchName = "Ambience/Ambience_switch_story" .. storyId
	local bgmName = "BGM/story" .. storyId .. "/main_story_level_" .. storyId

	if BattleData.IsDarkForestScene() == true or MS_StoryList.IsStoryDream(storyId) == true then
		return
	elseif areaType ~= areaTypeOld then
		if areaType == SceneBase.Area.InDoor or storyId == MS_StoryData.StoryId10010 then
			FmodManager.SetParameterValue(reverbName, "timeIndex", reverbId)
			FmodManager.SetParameterValue(reverbName, "volIndex", reverbId)
			FmodManager.SetParameterValue(ambienceSwitchName, "switchIndex", 1)

			if storyId == MS_StoryData.StoryId10006 then
				FmodManager.SetParameterValue(bgmName, "BGMIndex", 1)
			end
		elseif areaType == SceneBase.Area.OutDoor then
			FmodManager.SetParameterValue(reverbName, "timeIndex", 0)
			FmodManager.SetParameterValue(reverbName, "volIndex", 0)
			FmodManager.SetParameterValue(ambienceSwitchName, "switchIndex", 0)

			if storyId == MS_StoryData.StoryId10006 then
				FmodManager.SetParameterValue(bgmName, "BGMIndex", 0)
			end
		end
	elseif reverbId ~= reverbIdOld and reverbId > 0 and (areaType == SceneBase.Area.InDoor or storyId == MS_StoryData.StoryId10010) then
		FmodManager.SetParameterValue(reverbName, "timeIndex", reverbId)
		FmodManager.SetParameterValue(reverbName, "volIndex", reverbId)
	end
end

function AudioCtrl.SetAmbienceChange(storyId, isHight)
	if storyId == 1 then
		if isHight == true then
			FmodManager.SetParameterValue("Ambience/weather", "windIndex", 1)
			FmodManager.SetParameterValue("Ambience/weather", "thunderIndex", 1)
		else
			FmodManager.SetParameterValue("Ambience/weather", "windIndex", 0)
			FmodManager.SetParameterValue("Ambience/weather", "thunderIndex", 0)
		end
	elseif storyId == 2 then
		if isHight == true then
			FmodManager.SetParameterValue("Ambience/weather", "windIndex", 1)
		else
			FmodManager.SetParameterValue("Ambience/weather", "windIndex", 0)
		end
	elseif storyId == 9 then
		local areaId = FS_UserData.story:GetAreaId()

		if areaId == 1 or areaId == 2 or areaId == 6 then
			if isHight == true then
				FmodManager.SetParameterValue("Ambience/weather", "windIndex", 1)
			else
				FmodManager.SetParameterValue("Ambience/weather", "windIndex", 0)
			end
		elseif areaId == 4 or areaId == 5 then
			if isHight == true then
				FmodManager.SetParameterValue("Ambience/weather", "windIndex", 2)
			else
				FmodManager.SetParameterValue("Ambience/weather", "windIndex", 0)
			end
		end
	end
end

function AudioCtrl.SetButtonClickAudio(buttonAudioType)
	if buttonAudioType == AudioCtrl.ButtonClickType.None then
		return
	elseif buttonAudioType == AudioCtrl.ButtonClickType.Common then
		FmodManager.PlaySceneSe("UI/button/common")
	elseif buttonAudioType == AudioCtrl.ButtonClickType.Back then
		FmodManager.PlaySceneSe("UI/button/back")
	elseif buttonAudioType == AudioCtrl.ButtonClickType.Option then
		FmodManager.PlaySceneSe("UI/button/option")
	elseif buttonAudioType == AudioCtrl.ButtonClickType.MainPageSwitch then
		FmodManager.PlaySceneSe("UI/button/main_page_switch")
	elseif buttonAudioType == AudioCtrl.ButtonClickType.PageSwitch then
		FmodManager.PlaySceneSe("UI/button/page_switch")
	elseif buttonAudioType == AudioCtrl.ButtonClickType.ItemChoose then
		FmodManager.PlaySceneSe("UI/button/item_choose")
	elseif buttonAudioType == AudioCtrl.ButtonClickType.EquipmentChoose then
		FmodManager.PlaySceneSe("UI/button/equipment_choose")
	elseif buttonAudioType == AudioCtrl.ButtonClickType.TalentChoose then
		FmodManager.PlaySceneSe("UI/button/talent_choose")
	elseif buttonAudioType == AudioCtrl.ButtonClickType.DialogueChoose then
		FmodManager.PlaySceneSe("UI/button/dialogue_choose")
	elseif buttonAudioType == AudioCtrl.ButtonClickType.MapSelect then
		FmodManager.PlaySceneSe("UI/button/map_select")
	end
end

function AudioCtrl.SetUIAudio(name, paramName, param)
	FmodManager.PlaySceneSe("UI/" .. name, paramName or "", param or 0)
end

return AudioCtrl
