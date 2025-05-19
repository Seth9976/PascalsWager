-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerMovie.lua

ControllerMovie = class("ControllerMovie")
ControllerMovie.static.Status = {
	LoadScene = 2,
	LoadSecondaryCharacter = 4,
	LoadCharacterAnimator = 5,
	PlayMovie = 6,
	Ready = 1,
	FinishMovie = 7,
	LoadCharacter = 3
}
ControllerMovie.static.CameraLayerMask = {
	LayerDefault,
	LayerWater,
	LayerUI,
	LayerItem1,
	LayerItem2,
	LayerItem3,
	LayerEffectMovie,
	LayerMovie,
	LayerDefaultNoShadow
}

function ControllerMovie:initialize()
	self.tfRoot = GoFind("Movie").transform
	self.sceneController = ST_Main.GetSceneController()
	self.scene = self.sceneController:GetScene()
	self.cameraNormal = self.sceneController:GetCamera()
	self.loadCharacterList = nil
	self.tfMovieShadow = nil
	self.tfMovieLight = nil
	self.tfMovieReflectionProbe = nil
	self.tfMovieRoot = nil
	self.tfMovieCharacter = nil
	self.tfMovieSecondaryCharacter = nil
	self.tfMovieVfx = nil
	self.tfCamera = nil
	self.movieConfig = nil
	self.camera = nil
	self.postProcessLayer = nil
	self.cameraRootAnim = nil
	self.cameralist = {}
	self.cameraShadowSize = {}
	self.cameraAnimList = {}
	self.movieRootAnim = nil
	self.movieCharaAnim = nil
	self.movieCharaAnimCtrl = nil
	self.isCarriageMovie = false
	self.storyId = 0
	self.movieId = 0
	self.sceneName = ""
	self.playing = false
	self.cameraIndex = 1
	self.tfScene = nil
	self.tfMovieAudio = nil
	self.subtitleList = nil
	self.subtitleIndex = 1
	self.isSubtitlePlaying = false
	self.cantSkip = false
	self.playTime = 0
	self.heroList = nil
	self.characterList = nil
	self.isCtrlSceneObject = false
	self.screenWidth = 0
	self.screenHeight = 0

	self:ChangeStatus(ControllerMovie.Status.Ready)
end

function ControllerMovie:SetScene(tmpScene)
	self.scene = tmpScene
end

function ControllerMovie:StartMovie(storyId, movieId)
	if self:IsStatus(ControllerMovie.Status.Ready) == true then
		self.storyId = storyId
		self.movieId = movieId

		local movieData = MS_StoryMovie.GetMovieData(self.storyId, self.movieId)

		self.cantSkip = movieData.CantSkip == 1
		self.playing = true

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and MS_StoryList.IsStoryNew(self.storyId) then
			self.storyId = MS_StoryList.ConvertArcadeToNormal(self.storyId)
		end

		self.sceneName = "scene" .. self.storyId .. "_" .. self.movieId

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.story:GetStoryId() == FS_SaveStory.ArcadeStoryIdMax - 1000 then
			if self.sceneName == "scene8_1001" then
				self.sceneName = "scene8_1013"
			elseif self.sceneName == "scene8_1004" then
				self.sceneName = "scene8_1014"
			end
		end

		UIManager.MovieMode(true)
		Common.ClearMemory()

		return true
	end

	return false
end

function ControllerMovie:StartMovieCarriage(storyId, carriageId)
	if self:IsStatus(ControllerMovie.Status.Ready) == true then
		self.storyId = storyId

		if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and MS_StoryList.IsStoryNew(self.storyId) then
			self.storyId = MS_StoryList.ConvertArcadeToNormal(self.storyId)
		end

		self.movieId = carriageId
		self.playing = true
		self.sceneName = "common1_1"
		self.isCarriageMovie = true

		UIManager.MovieMode(true)

		return true
	end

	return false
end

function ControllerMovie:UpdateScreenView(force)
	if self.camera ~= nil then
		local width = SystemHelper.GetScreenWidth()
		local height = SystemHelper.GetScreenHeight()

		if force == true or width ~= self.screenWidth or height ~= self.screenHeight then
			self.screenWidth = width
			self.screenHeight = height

			SystemHelper.LogTest("==============UpdateScreenView==width=" .. width .. ",height=" .. height .. ",self.screenWidth=" .. self.screenWidth .. ",self.screenHeight=" .. self.screenHeight .. ",as=" .. tostring(SystemHelper.isSubquadrateScrAS()))

			local reset = true

			if SystemHelper.isSubquadrateScrAS() == true then
				local tmpHeight = self.screenWidth * ControllerMain.CameraAspectHeight / ControllerMain.CameraAspectWidth

				if tmpHeight > self.screenHeight then
					local tmpWidth = self.screenHeight * ControllerMain.CameraAspectWidth / ControllerMain.CameraAspectHeight
					local tmpWidthRadio = tmpWidth / self.screenWidth

					if tmpWidthRadio < 1 then
						self.camera.rect = UnityEngine.Rect.New((1 - tmpWidthRadio) / 2, 0, tmpWidthRadio, 1)
						reset = false
					end
				elseif tmpHeight < self.screenHeight then
					local tmpHeightRadio = tmpHeight / self.screenHeight

					if tmpHeightRadio < 1 then
						self.camera.rect = UnityEngine.Rect.New(0, (1 - tmpHeightRadio) / 2, 1, tmpHeightRadio)
						reset = false
					end
				end
			end

			if reset == true then
				self.camera.rect = UnityEngine.Rect.New(0, 0, 1, 1)
			end

			UIManager.SendMessage("Subtitle", "UpdateMask")
		end
	end
end

function ControllerMovie:LoadScene()
	local packageName = "movie/" .. self.sceneName .. ".unity3d"
	local assets = {
		self.sceneName .. ".prefab"
	}

	resMgr:LoadPrefab(packageName, assets, true, function(objs)
		local goChara = GoInstantiate(objs[0])
		local tfChara = goChara.transform

		goChara.name = objs[0].name

		tfChara:SetParent(self.tfRoot)

		tfChara.localScale = Vector3.one
		tfChara.localPosition = Vector3.zero
		self.tfMovieRoot = tfChara
		self.tfScene = TfFindChild(self.tfMovieRoot, "Scene")
		self.movieRootAnim = self.tfMovieRoot:GetComponent("Animator")
		self.tfCamera = TfFindChild(self.tfMovieRoot, "CameraMovie")

		local videoPlayerGO = TfFindChild(self.tfMovieRoot, "VideoPlayer")

		if videoPlayerGO ~= nil then
			self.videoPlayerController = videoPlayerGO:GetComponent("VPController")

			if self.sceneName == "scene301_1002" or self.sceneName == "scene8_1015" then
				local suffix = LS_Setting.GetLanguage()

				if suffix == "zhs" then
					self.videoPlayerController:SetUrl("mp4/" .. self.sceneName .. "_zhs.mp4")
				elseif suffix == "jp" then
					self.videoPlayerController:SetUrl("mp4/" .. self.sceneName .. "_jp.mp4")
				else
					self.videoPlayerController:SetUrl("mp4/" .. self.sceneName .. "_us.mp4")
				end
			else
				self.videoPlayerController:SetUrl("mp4/" .. self.sceneName .. ".mp4")
			end

			self.videoPlayerController:SetVolume(LS_Setting.sound / 100)
		end

		if self.sceneName == "scene301_1001" then
			local vfx_SanCameraTF = TfFindChild(self.tfMovieRoot, "UICamera/SanCamera_1")

			if vfx_SanCameraTF ~= nil then
				vfx_SanCameraTF.localScale = Vector3.New(1430 * (9 * SystemHelper.GetScreenWidth() / (16 * SystemHelper.GetScreenHeight())), 1430, 1)
			end
		end

		if self.tfCamera ~= nil then
			self.tfCamera.tag = "MainCamera"
		end

		self.camera = self.tfCamera:GetComponent("Camera")

		if self.camera ~= nil then
			self.camera.cullingMask = Common.GetOneBitLeftMove(ControllerMovie.CameraLayerMask)

			self:UpdateScreenView(true)
		end

		self.postProcessLayer = self.tfCamera:GetComponent("PostProcessLayer")
		self.cameraRootAnim = self.tfCamera:GetComponent("Animator")

		local cameraAnimRoot = TfFindChild(self.tfMovieRoot, "Camera")

		for i = 1, cameraAnimRoot.childCount do
			self.cameralist[i] = cameraAnimRoot:GetChild(i - 1)
			self.cameraAnimList[i] = cameraAnimRoot:GetChild(i - 1):GetComponent("Animator")

			self.cameralist[i].gameObject:SetActive(false)

			local movieShadow = self.cameralist[i].gameObject:GetComponent("MovieShadow")

			if movieShadow ~= nil then
				self.cameraShadowSize[i] = movieShadow:GetShadowSize()
			else
				self.cameraShadowSize[i] = ControllerMain.CameraShadowSize
			end
		end

		for i = 1, self.tfScene.childCount do
			SystemHelper.SetLayerInChildren(self.tfScene:GetChild(i - 1), "Movie")
		end

		self.tfMovieCharacter = TfFindChild(self.tfMovieRoot, "Character")
		self.tfMovieSecondaryCharacter = TfFindChild(self.tfMovieRoot, "SecondaryCharacter")
		self.tfMovieVfx = TfFindChild(self.tfMovieRoot, "Vfx")
		self.tfMovieAudio = TfFindChild(self.tfMovieRoot, "Audio")
		self.tfMovieShadow = TfFindChild(self.tfMovieRoot, "Shadow")
		self.tfMovieLight = TfFindChild(self.tfMovieRoot, "LightMovie")
		self.tfMovieReflectionProbe = TfFindChild(self.tfMovieRoot, "ReflectProbeMovie")

		self.tfMovieAudio.gameObject:SetActive(false)

		local goCharaTemp = GoCreate("CharacterTemp")

		self.tfMovieCharacterTemp = goCharaTemp.transform

		self.tfMovieCharacterTemp:SetParent(self.tfMovieRoot)

		self.tfMovieCharacterTemp.localScale = Vector3.one
		self.tfMovieCharacterTemp.position = Vector3.zero
		self.tfMovieCharacterTemp.rotation = Quaternion.identity

		self.tfMovieRoot.gameObject:SetActive(false)
		self:ChangeNextStatus(ControllerMovie.Status.LoadCharacter)
	end)
end

function ControllerMovie:UpdateQuality(force)
	if LS_Setting.graphics.antialiasing > 1 then
		Common.SetCameraDepthAndMSAA(self.camera, true, true, false)
	else
		Common.SetCameraDepthAndMSAA(self.camera, false, true, false)
	end

	Common.EnableShaderKeyword("WATER_EDGEBLEND_ON")
	Common.DisableShaderKeyword("WATER_EDGEBLEND_OFF")

	if self.tfCamera ~= nil then
		local controller = self.tfCamera:GetComponent("PostProcessingController")

		if controller ~= nil then
			if LS_Setting.graphics.quality <= LS_Setting.QualityLevel.Low and Platform == PlatformType.ANDROID then
				controller:SetDepthOfFieldEnabled(false)
			else
				controller:SetDepthOfFieldEnabled(true)
			end
		end
	end

	if self.postProcessLayer ~= nil then
		if LS_Setting.graphics.antialiasing > 0 then
			self.postProcessLayer.antialiasingMode = UnityEngine.Rendering.PostProcessing.PostProcessLayer.Antialiasing.FastApproximateAntialiasing

			if LS_Setting.graphics.antialiasing == 1 then
				Device.SetAntiAliasing(0)
			elseif LS_Setting.graphics.antialiasing == 2 then
				Device.SetAntiAliasing(2)
			elseif LS_Setting.graphics.antialiasing > 2 then
				Device.SetAntiAliasing(4)
			end
		else
			self.postProcessLayer.antialiasingMode = UnityEngine.Rendering.PostProcessing.PostProcessLayer.Antialiasing.None

			Device.SetAntiAliasing(0)
		end
	end
end

function ControllerMovie:LoadCharacter()
	local loadCnt = 0

	self.heroList = {}
	self.characterList = {}

	if self.tfMovieCharacter.childCount > 0 then
		for i = 1, self.tfMovieCharacter.childCount do
			local charaRoot = self.tfMovieCharacter:GetChild(i - 1)
			local charaName = string.split(charaRoot.gameObject.name, "_")[1]
			local heroId = BattleData.ConvertHeroNameToId(charaName)
			local heroIdSkin = BattleData.ConvertHeroIdWithSkin(heroId)
			local heroIdNoSkin = BattleData.ConvertHeroIdWithoutSkin(heroId)
			local skip = false

			if heroIdSkin == 11007 then
				heroIdSkin = 10007
			end

			if MS_StorySkin.GetSkinMax(heroIdNoSkin) > 0 and heroId ~= heroIdSkin then
				skip = true
			end

			if skip == false then
				table.insert(self.heroList, heroIdSkin)
				table.insert(self.characterList, charaRoot)

				local ret = self.sceneController:GetLoadCharacterManager():IsHaveCharacterInTemplate(heroIdSkin)

				if ret == false then
					local modelName = BattleData.GetHeroName(heroIdSkin)
					local tmpPackage = "character/" .. modelName .. ".unity3d"
					local assets = {
						modelName .. ".prefab"
					}

					resMgr:LoadPrefab(tmpPackage, assets, true, function(objs)
						local goChara = GoInstantiate(objs[0])
						local tmpHeroId = BattleData.ConvertHeroNameToId(objs[0].name)

						if self.tfMovieCharacterTemp ~= nil then
							local tfChara = goChara.transform

							tfChara:SetParent(self.tfMovieCharacterTemp)

							tfChara.name = "hero" .. tmpHeroId
							tfChara.localScale = Vector3.one
							tfChara.position = Vector3.zero
							tfChara.rotation = Quaternion.identity
							loadCnt = loadCnt + 1
						end

						if loadCnt >= self.tfMovieCharacter.childCount then
							if self.tfMovieSecondaryCharacter ~= nil then
								self:ChangeNextStatus(ControllerMovie.Status.LoadSecondaryCharacter)
							else
								self:ChangeNextStatus(ControllerMovie.Status.LoadCharacterAnimator)
							end
						end
					end)
				else
					loadCnt = loadCnt + 1

					if loadCnt >= self.tfMovieCharacter.childCount then
						if self.tfMovieSecondaryCharacter ~= nil then
							self:ChangeNextStatus(ControllerMovie.Status.LoadSecondaryCharacter)
						else
							self:ChangeNextStatus(ControllerMovie.Status.LoadCharacterAnimator)
						end
					end
				end
			else
				loadCnt = loadCnt + 1

				if loadCnt >= self.tfMovieCharacter.childCount then
					if self.tfMovieSecondaryCharacter ~= nil then
						self:ChangeNextStatus(ControllerMovie.Status.LoadSecondaryCharacter)
					else
						self:ChangeNextStatus(ControllerMovie.Status.LoadCharacterAnimator)
					end
				end
			end
		end
	else
		self:ChangeNextStatus(ControllerMovie.Status.PlayMovie)
	end
end

function ControllerMovie:LoadSecondaryCharacter()
	if self.tfMovieSecondaryCharacter ~= nil then
		local heroId = FS_UserData.story:GetSecondaryHeroId()

		if heroId > 0 then
			local movieData = MS_StoryMovie.GetMovieData(self.storyId, self.movieId)

			if movieData ~= nil and movieData.HideHeroId > 0 and tonumber(heroId) == tonumber(movieData.HideHeroId) then
				self:ChangeNextStatus(ControllerMovie.Status.LoadCharacterAnimator)

				return
			end

			local heroIdSkin = BattleData.ConvertHeroIdWithSkin(heroId)
			local ret = self.sceneController:GetLoadCharacterManager():IsHaveCharacterInTemplate(heroIdSkin)

			if ret == true then
				local tfCharaObj = TfFindChild(self.tfMovieCharacterTemp, "hero" .. heroIdSkin)

				if tfCharaObj == nil then
					tfCharaObj = self.sceneController:GetLoadCharacterManager():LoadCharacter(heroIdSkin, LoadCharacterManager.LoadType.Movie)
				end

				if tfCharaObj ~= nil then
					self:InitCharacter(heroIdSkin, tfCharaObj, self.tfMovieSecondaryCharacter, nil)
				end
			end
		end
	end

	self:ChangeNextStatus(ControllerMovie.Status.LoadCharacterAnimator)
end

function ControllerMovie:LoadCharacterAnimator()
	local assets
	local tmpPackage = "movie/" .. self.sceneName .. ".unity3d"

	if self.characterList ~= nil then
		for i = 1, #self.characterList do
			local charaRoot = self.characterList[i]

			if assets == nil then
				assets = {}
			end

			table.insert(assets, charaRoot.gameObject.name .. "@" .. self.storyId .. "_" .. self.movieId .. ".controller")
		end
	end

	if assets ~= nil then
		resMgr:LoadPrefab(tmpPackage, assets, true, function(objs)
			for i = 1, #self.heroList do
				local heroIdSkin = self.heroList[i]
				local charaRoot = self.characterList[i]
				local tfCharaObj = TfFindChild(self.tfMovieCharacterTemp, "hero" .. heroIdSkin)

				if tfCharaObj == nil then
					tfCharaObj = self.sceneController:GetLoadCharacterManager():LoadCharacter(heroIdSkin, LoadCharacterManager.LoadType.Movie)
				end

				if tfCharaObj ~= nil and charaRoot ~= nil then
					self:InitCharacter(heroIdSkin, tfCharaObj, charaRoot, objs[i - 1])
				end
			end

			self:ChangeNextStatus(ControllerMovie.Status.PlayMovie)
		end)
	else
		self:ChangeNextStatus(ControllerMovie.Status.PlayMovie)
	end
end

function ControllerMovie:UnLoadScene()
	if self.movieCharaAnim ~= nil then
		for i = 1, #self.movieCharaAnim do
			local animator = self.movieCharaAnim[i]

			if animator ~= nil then
				animator.runtimeAnimatorController = nil
			end
		end
	end

	self.movieCharaAnim = nil

	if self.movieCharaAnimCtrl ~= nil then
		for i = 1, #self.movieCharaAnimCtrl do
			local animCtrl = self.movieCharaAnimCtrl[i]

			if animCtrl ~= nil then
				GoDestroyImmediate(animCtrl)
			end
		end
	end

	self.movieCharaAnimCtrl = nil

	if self.loadCharacterList ~= nil then
		for i = 1, #self.loadCharacterList do
			local goChara = self.loadCharacterList[i]

			if goChara ~= nil then
				GoDestroyImmediate(goChara)
			end
		end
	end

	self.loadCharacterList = nil

	if self.tfMovieRoot ~= nil then
		GoDestroy(self.tfMovieRoot.gameObject)
	end
end

function ControllerMovie:GetShadowPosition()
	if self.tfMovieShadow ~= nil then
		return self.tfMovieShadow.position
	end

	return Vector3.zero
end

function ControllerMovie:GetShadowSize()
	if self.cameraShadowSize ~= nil and self.cameraShadowSize[self.cameraIndex] ~= nil then
		return self.cameraShadowSize[self.cameraIndex]
	end

	return ControllerMain.CameraShadowSize
end

function ControllerMovie:SetMovieLight(isOpen)
	if self.tfMovieLight ~= nil then
		local scene = self.sceneController:GetScene()

		if scene ~= nil then
			scene:ShowDirLight(not isOpen)
			self.tfMovieLight.gameObject:SetActive(isOpen)
		end
	end
end

function ControllerMovie:SetMovieReflectionProbe(isOpen)
	if self.tfMovieReflectionProbe ~= nil then
		local scene = self.sceneController:GetScene()

		if scene ~= nil then
			scene:ShowReflectionProbe(not isOpen)
			self.tfMovieReflectionProbe.gameObject:SetActive(isOpen)
		end
	end
end

function ControllerMovie:PlayMovieAnimator()
	if self.tfMovieRoot ~= nil then
		self.tfMovieRoot.gameObject:SetActive(true)

		if self.isCarriageMovie == true then
			self.movieRootAnim:Play("scene" .. self.storyId .. "_" .. self.movieId)
		end
	end

	if self.cameralist[1] ~= nil then
		self.cameralist[1].gameObject:SetActive(true)

		self.cameraIndex = 1
	end

	if self.tfMovieAudio ~= nil then
		self.tfMovieAudio.gameObject:SetActive(true)

		if self.isCarriageMovie == true then
			local carriageData = MS_StoryCarriage.GetStoryCarriageData(FS_UserData.story:GetStoryId(), self.movieId)

			if carriageData ~= nil then
				local carriageDir = tonumber(carriageData.Direction)

				if carriageDir > 0 then
					local audioTf = TfFindChild(self.tfMovieAudio, "carriage_" .. carriageDir)

					if self.storyId == MS_StoryData.StoryId10012 then
						audioTf = TfFindChild(self.tfMovieAudio, "boat_" .. carriageDir)
					end

					if audioTf ~= nil then
						audioTf.gameObject:SetActive(true)
					end
				end
			end
		end
	end

	if self.videoPlayerController ~= nil then
		self.videoPlayerController:Play()
	end
end

function ControllerMovie:InitCharacter(heroId, tfChara, goCharaParent, animController)
	local goChara = tfChara.gameObject

	tfChara:SetParent(goCharaParent.transform)

	tfChara.localScale = Vector3.one
	tfChara.localPosition = Vector3.zero
	tfChara.localRotation = Quaternion.identity

	local animator = goChara:GetComponent("Animator")

	if animController ~= nil then
		animator.runtimeAnimatorController = animController

		if self.movieCharaAnimCtrl == nil then
			self.movieCharaAnimCtrl = {}
		end

		table.insert(self.movieCharaAnimCtrl, animController)
	end

	animator.enabled = true

	if self.movieCharaAnim == nil then
		self.movieCharaAnim = {}
	end

	table.insert(self.movieCharaAnim, animator)

	local boxList = {
		"aimBox",
		"aimPinBox",
		"attackBoxSkill",
		"cameraBox",
		"aimTransform",
		"lipsyncs"
	}
	local weaponName = "weapon"
	local equipmentName = "equipment"
	local tfBodyRender, tfBodyHairRender, tfBodyPartsRender
	local tfEquipmentRender = {}
	local tfWeaponRender = {}
	local tfs = tfChara:GetComponentsInChildren(typeof("UnityEngine.Transform"))
	local len = tfs.Length

	for i = 0, len - 1 do
		local _tf = tfs[i]
		local childName = _tf.name

		if StringHelper.StartsWith(childName, "weaponBox") == true then
			local render = _tf.gameObject:GetComponent(typeof("UnityEngine.MeshRenderer"))

			if render ~= nil then
				render.enabled = false
			end
		elseif StringHelper.EndsWith(childName, "_PuppetMaster") == true then
			_tf.gameObject:SetActive(false)
		else
			for j = 1, #boxList do
				local boxName = boxList[j]

				if StringHelper.StartsWith(childName, boxName) == true then
					_tf.gameObject:SetActive(false)

					break
				end
			end
		end

		_tf.gameObject.layer = LayerMovie
	end

	local finalIkAimIK = tfChara:GetComponent("RootMotion.FinalIK.AimIK")

	if finalIkAimIK ~= nil then
		GoDestroy(finalIkAimIK)
	end

	local finalIkBodyTilt = tfChara:GetComponent("RootMotion.FinalIK.BodyTilt")

	if finalIkBodyTilt ~= nil then
		GoDestroy(finalIkBodyTilt)
	end

	local finalIkLookAtIK = tfChara:GetComponent("RootMotion.FinalIK.LookAtIK")

	if finalIkLookAtIK ~= nil then
		GoDestroy(finalIkLookAtIK)
	end

	local finalIkBipedIK = tfChara:GetComponent("RootMotion.FinalIK.FullBodyBipedIK")

	if finalIkBipedIK ~= nil then
		GoDestroy(finalIkBipedIK)
	end

	local dynamicBone = tfChara:GetComponent("DynamicBoneGroup")

	if dynamicBone ~= nil then
		dynamicBone.enabled = false
	end

	local weaponTrail = tfChara:GetComponent("XftWeapon.XWeaponTrail")

	if weaponTrail ~= nil then
		GoDestroy(weaponTrail)
	end

	local characterMove = tfChara:GetComponent("CharacterMove")

	if characterMove ~= nil then
		GoDestroy(characterMove)
	end

	local animalAim = tfChara:GetComponent("AnimalAim")

	if animalAim ~= nil then
		GoDestroy(animalAim)
	end

	goChara:SetActive(true)

	if self.loadCharacterList == nil then
		self.loadCharacterList = {}
	end

	table.insert(self.loadCharacterList, goChara)
end

function ControllerMovie:FinishMovie()
	self:UnLoadScene()

	self.playing = false
	self.storyId = 0
	self.movieId = 0
	self.tfMovieRoot = nil
	self.tfMovieCharacter = nil
	self.tfMovieVfx = nil
	self.tfMovieShadow = nil
	self.tfMovieLight = nil
	self.tfMovieReflectionProbe = nil
	self.tfCamera = nil
	self.movieConfig = nil
	self.camera = nil
	self.postProcessLayer = nil
	self.cameraRootAnim = nil
	self.movieRootAnim = nil
	self.sceneName = ""
	self.cameraAnimList = {}
	self.cameralist = {}
	self.cameraShadowSize = {}
	self.cameraIndex = 1
	self.tfMovieAudio = nil
	self.playTime = 0
	self.subtitleList = nil
	self.subtitleIndex = 1
	self.isSubtitlePlaying = false
	self.isCarriageMovie = false
	self.videoPlayerController = nil

	Common.ClearMemory()
end

function ControllerMovie:PlayMovieSubtitle()
	if self.subtitleList ~= nil then
		local subtitleDate = self.subtitleList[self.subtitleIndex]

		if subtitleDate ~= nil then
			local time = tonumber(self.playTime)

			if time >= tonumber(subtitleDate.Begin) and time < tonumber(subtitleDate.End) and self.isSubtitlePlaying == false then
				local context = subtitleDate["Context_" .. LS_Setting.GetLanguage()]

				if context ~= nil then
					if DebugLogVoiceId == true and subtitleDate.Audio ~= nil then
						context = subtitleDate.Audio .. "/" .. context
					end

					UIManager.SendMessage("Subtitle", "SetSubtitle", context, subtitleDate.PanelIndex)
				end

				AudioCtrl.SetMovieSubtitleAudio(self.storyId, self.movieId, subtitleDate.Audio, LS_Setting.GetVoiceLanguage(), AudioCtrl.SubtitleType.Movie)

				self.isSubtitlePlaying = true
			elseif time >= tonumber(subtitleDate.End) then
				UIManager.SendMessage("Subtitle", "SetSubtitle", "", subtitleDate.PanelIndex)

				self.subtitleIndex = self.subtitleIndex + 1
				self.isSubtitlePlaying = false
			end
		end
	end
end

function ControllerMovie:ChangeNextStatus(status)
	self.statusNext = status
end

function ControllerMovie:ChangeStatus(status)
	self.status = status
	self.statusNext = status

	if self:IsStatus(ControllerMovie.Status.Ready) then
		loadMgr:SetLoadingPriorityHigh(false)
	elseif self:IsStatus(ControllerMovie.Status.LoadScene) then
		self:LoadScene()
	elseif self:IsStatus(ControllerMovie.Status.LoadCharacter) then
		self:LoadCharacter()
	elseif self:IsStatus(ControllerMovie.Status.LoadSecondaryCharacter) then
		self:LoadSecondaryCharacter()
	elseif self:IsStatus(ControllerMovie.Status.LoadCharacterAnimator) then
		self:LoadCharacterAnimator()
	elseif self:IsStatus(ControllerMovie.Status.PlayMovie) then
		Common.ClearMemory()
		UIManager.SendMessage("Mainmenu", "ClearSanityVfx")
		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 0.1)
		Common.CopyCameraLayerCullDistance(self.cameraNormal, self.camera)

		self.movieConfig = self.tfMovieRoot.gameObject:GetComponent("MovieConfig")

		if self.movieConfig ~= nil then
			self.movieConfig:Init(self.sceneController:GetArenaController())
		else
			self.sceneController:StartMovieConfig()
		end

		local movieData = MS_StoryMovie.GetMovieData(self.storyId, self.movieId)

		if movieData ~= nil and movieData.IsReverb > 0 then
			FmodManager.OpenReverb(false)
		end

		AudioCtrl.SetMovieAudio(false)
		self:SetMovieLight(true)
		self:CloseMovieObject()
		self:SetMovieReflectionProbe(true)
		self:SetCameraPosAndRot(self.cameraIndex)
		self:SetCharacterEffect()
		self:PlayMovieAnimator()
		self:ShowLogo()
		UIManager.SendMessage("Subtitle", "Show", true)
		UIManager.SendMessage("Subtitle", "ApplyMask", true)

		self.subtitleList = MS_StorySubtitle.GetSubtitleList(self.storyId, self.movieId)

		if not self.cantSkip or DebugDontDeadSelf then
			UIManager.SendMessage("Subtitle", "SetButtonSkip", true, function()
				self:ChangeNextStatus(ControllerMovie.Status.FinishMovie)
			end)
		else
			UILayerCtrl.Push("Empty")
		end

		UIManager.SendMessage("Subtitle", "ClearAllTexts")
	elseif self:IsStatus(ControllerMovie.Status.FinishMovie) then
		UIManager.SendMessage("Curtain", "BlackFadeInAndOut", 9999)

		if not self.cantSkip or DebugDontDeadSelf then
			UIManager.SendMessage("Subtitle", "SetButtonSkip", false, nil)
		else
			UILayerCtrl.Pop()
		end

		UIManager.SendMessage("Subtitle", "ApplyMask", false)

		local gameController = self.sceneController:GetGameController()

		UIManager.SendMessage("Subtitle", "Show", false, gameController:GetChallengeSuccess())
		UIManager.SendMessage("Subtitle", "ClearAllTexts")
		UIManager.MovieMode(false)
		self:CtrlSceneObject(false)

		if self.movieConfig ~= nil then
			self.movieConfig:Exit()
		else
			self.sceneController:EndMovieConfig()
		end

		local movieData = MS_StoryMovie.GetMovieData(self.storyId, self.movieId)

		if movieData ~= nil then
			if movieData.followOn < 1 then
				AudioCtrl.SetMovieAudio(true)
			end

			if movieData.IsReverb > 0 then
				FmodManager.OpenReverb(true)
			end
		else
			AudioCtrl.SetMovieAudio(true)
		end

		AudioCtrl.StopMovieSubtitleAudio(self.storyId, self.movieId, AudioCtrl.SubtitleType.Movie)
		self:SetMovieLight(false)
		self:SetMovieReflectionProbe(false)
		self:FinishMovie()
		self:ChangeStatus(ControllerMovie.Status.Ready)
		UIManager.SendMessage("Mainmenu", "ResetSanityVfx")
	end
end

function ControllerMovie:SetCameraPosAndRot(index)
	local cameraTemp = self.cameralist[index]

	if cameraTemp ~= nil then
		self.tfCamera.position = cameraTemp.position
		self.tfCamera.rotation = cameraTemp.rotation
	end
end

function ControllerMovie:ChangeCamera()
	if self.cameraAnimList[self.cameraIndex] ~= nil then
		self:SetCameraPosAndRot(self.cameraIndex)

		local stateInfoCamera = self.cameraAnimList[self.cameraIndex]:GetCurrentAnimatorStateInfo(0)

		if stateInfoCamera.normalizedTime >= 1 and self.cameraIndex < #self.cameralist then
			self.cameralist[self.cameraIndex].gameObject:SetActive(false)

			self.cameraIndex = self.cameraIndex + 1

			self.cameralist[self.cameraIndex].gameObject:SetActive(true)
		end
	end
end

function ControllerMovie:SetCharacterEffect()
	if self.tfMovieVfx ~= nil and self.tfMovieVfx.childCount > 0 then
		for i = 0, self.tfMovieVfx.childCount - 1 do
			local vfx = self.tfMovieVfx:GetChild(i)
			local tfName = vfx.transform.name

			if StringHelper.StartsWith(tfName, "vfx_hero") then
				local vfxName = StringHelper.Split(tfName, "_")

				for k, goChara in pairs(self.loadCharacterList) do
					if StringHelper.StartsWith(goChara.name, vfxName[2]) then
						local tfs = goChara.transform:GetComponentsInChildren(typeof("UnityEngine.Transform"))
						local len = tfs.Length

						for i = 0, len - 1 do
							local _tf = tfs[i]
							local childName = _tf.name

							if childName == "weaponBox" .. vfxName[3] then
								local tempVfx = GoInstantiate(vfx)

								tempVfx.transform:SetParent(_tf)

								tempVfx.transform.localScale = Vector3.one
								tempVfx.transform.localPosition = Vector3.zero
								tempVfx.transform.localRotation = Quaternion.identity
							end
						end
					end
				end

				vfx.gameObject:SetActive(false)
			end
		end
	end
end

function ControllerMovie:ShowLogo()
	local logoRoot = TfFindChild(self.tfMovieRoot, "Canvas/Logo")

	if logoRoot ~= nil then
		local logoImage = TfFindChild(logoRoot, "logo_" .. LS_Setting.GetLanguage())

		if logoImage ~= nil then
			logoImage.gameObject:SetActive(true)
		end
	end
end

function ControllerMovie:CtrlSceneObject(isStart)
	if self.scene ~= nil and (self.isCtrlSceneObject == false or isStart == false) then
		local movieData = MS_StoryMovie.GetMovieData(self.storyId, self.movieId)

		if movieData ~= nil then
			local time = movieData.SceneObjectTime

			if time <= 0 or isStart == false or tonumber(self.playTime) > tonumber(time) then
				if movieData.CloseSceneObjectPath ~= "" then
					local pathList = StringHelper.Split(movieData.CloseSceneObjectPath, ";")

					if pathList ~= nil then
						for i, path in pairs(pathList) do
							local tf = self.scene:GetObject(path)

							if tf ~= nil then
								tf.gameObject:SetActive(not isStart)
							else
								SystemHelper.LogTest("=============Movie==CloseSceneObject===Can not find===" .. path)
							end
						end
					end
				end

				if movieData.OpenSceneObjectPath ~= "" then
					local pathList = StringHelper.Split(movieData.OpenSceneObjectPath, ";")

					if pathList ~= nil then
						for i, path in pairs(pathList) do
							local tf = self.scene:GetObject(path)

							if tf ~= nil then
								tf.gameObject:SetActive(isStart)
							else
								SystemHelper.LogTest("=============Movie==OpenSceneObject===Can not find===" .. path)
							end
						end
					end
				end

				if isStart == true then
					self.isCtrlSceneObject = true
				end
			end
		end
	end

	if isStart == false then
		self.isCtrlSceneObject = false
	end
end

function ControllerMovie:CloseMovieObject()
	local movieData = MS_StoryMovie.GetMovieData(self.storyId, self.movieId)
	local isCloseByQuest = false

	if movieData ~= nil and movieData.CloseMovieObjectQuestId ~= "" and movieData.CloseMovieObjectByQuestPath ~= "" and BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and FS_UserData.story:IsQuestComplete(movieData.CloseMovieObjectQuestId) == true then
		isCloseByQuest = true

		local pathList = StringHelper.Split(movieData.CloseMovieObjectByQuestPath, ";")

		for i, path in pairs(pathList) do
			local tf = TfFindChild(self.tfMovieRoot, path)

			if tf ~= nil then
				tf.gameObject:SetActive(false)
			else
				SystemHelper.LogTest("=============Movie==CloseMovieObject===Can not find===" .. path)
			end
		end
	end

	if movieData ~= nil and movieData.CloseMovieObjectPath ~= "" and isCloseByQuest == false then
		local pathList = StringHelper.Split(movieData.CloseMovieObjectPath, ";")

		for i, path in pairs(pathList) do
			local tf = TfFindChild(self.tfMovieRoot, path)

			if tf ~= nil then
				tf.gameObject:SetActive(false)
			else
				SystemHelper.LogTest("=============Movie==CloseMovieObject===Can not find===" .. path)
			end
		end
	end

	local closeItemRoot = TfFindChild(self.tfMovieRoot, "CloseItemBySkin")

	if closeItemRoot ~= nil and closeItemRoot.childCount > 0 then
		for i = 1, closeItemRoot.childCount do
			local closeItem = closeItemRoot:GetChild(i - 1)
			local heroId = BattleData.ConvertHeroNameToId(closeItem.gameObject.name)
			local heroIdSkin = BattleData.ConvertHeroIdWithSkin(heroId)
			local heroIdNoSkin = BattleData.ConvertHeroIdWithoutSkin(heroId)
			local skip = false

			if MS_StorySkin.GetSkinMax(heroIdNoSkin) > 0 and heroId ~= heroIdSkin then
				skip = true
			end

			if skip == true then
				closeItem.gameObject:SetActive(false)
			end
		end
	end
end

function ControllerMovie:IsStatus(status)
	if self.status == status then
		return true
	end

	return false
end

function ControllerMovie:IsPlaying()
	return self.playing
end

function ControllerMovie:UpdateStatus()
	if self:IsStatus(ControllerMovie.Status.Ready) then
		if self:IsPlaying() == true then
			self:ChangeNextStatus(ControllerMovie.Status.LoadScene)
		end
	elseif self:IsStatus(ControllerMovie.Status.LoadScene) then
		-- block empty
	elseif self:IsStatus(ControllerMovie.Status.PlayMovie) then
		local stateInfoRoot = self.movieRootAnim:GetCurrentAnimatorStateInfo(0)

		if stateInfoRoot.normalizedTime >= 1 then
			self:ChangeNextStatus(ControllerMovie.Status.FinishMovie)
		end

		self:PlayMovieSubtitle()
		self:CtrlSceneObject(true)
		self:ChangeCamera()
		self:UpdateScreenView(false)

		if self.playTime <= 0 then
			self:UpdateQuality(false)
		end

		self.playTime = self.playTime + Time.deltaTime
	elseif self:IsStatus(ControllerMovie.Status.FinishMovie) then
		-- block empty
	end

	if self.statusNext ~= self.status then
		self:ChangeStatus(self.statusNext)
	end
end

function ControllerMovie:Update()
	self:UpdateStatus()
end

function ControllerMovie:Exit()
	self.tfRoot = nil
	self.sceneController = nil
	self.scene = nil
	self.cameraNormal = nil
	self.loadCharacterList = nil
	self.tfMovieShadow = nil
	self.tfMovieLight = nil
	self.tfMovieReflectionProbe = nil
	self.tfMovieRoot = nil
	self.tfMovieCharacter = nil
	self.tfMovieSecondaryCharacter = nil
	self.tfMovieVfx = nil
	self.tfCamera = nil
	self.movieConfig = nil
	self.camera = nil
	self.postProcessLayer = nil
	self.cameraRootAnim = nil
	self.cameralist = nil
	self.cameraShadowSize = nil
	self.cameraAnimList = nil
	self.movieRootAnim = nil
	self.movieCharaAnim = nil
	self.heroList = nil
	self.characterList = nil
end

return ControllerMovie
