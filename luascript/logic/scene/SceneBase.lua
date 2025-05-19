-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/SceneBase.lua

require("LuaScript/Logic/Scene/Door")
require("LuaScript/Logic/Scene/Elevator")
require("LuaScript/Logic/Scene/StairKick")
require("LuaScript/Logic/Scene/CoverKick")
require("LuaScript/Logic/Scene/Crate")
require("LuaScript/Logic/Scene/Gate")
require("LuaScript/Logic/Scene/Bridge")
require("LuaScript/Logic/Scene/Altar")
require("LuaScript/Logic/Scene/TimeLine")
require("LuaScript/Logic/Scene/Cage")
require("LuaScript/Logic/Scene/RoadSign")
require("LuaScript/Logic/Scene/Entrance")
require("LuaScript/Logic/Scene/Statue")
require("LuaScript/Logic/Scene/Fountain")
require("LuaScript/Logic/Scene/Honeypot")
require("LuaScript/Logic/Scene/Rain")
require("GameData/SceneDefine")

SceneBase = class("SceneBase")
SceneBase.static.ReflectionProbeLayerMask = {
	LayerAnimal,
	LayerHost,
	LayerMovie
}
SceneBase.static.DirLightLayerMask = {
	LayerAnimal,
	LayerHost,
	LayerMovie
}
SceneBase.static.ShadowLightLayerMask = {
	LayerDefault,
	LayerWater,
	LayerItem1,
	LayerItem2,
	LayerItem3,
	LayerEffectLight,
	LayerDefaultNoShadow
}
SceneBase.static.PointLightLayerMask = {
	LayerDefault,
	LayerItem2,
	LayerItem3,
	LayerEffectLight,
	LayerDefaultNoShadow
}
SceneBase.static.PointLightLayerMaskUltra = {
	LayerDefault,
	LayerWater,
	LayerItem2,
	LayerItem3,
	LayerEffectLight,
	LayerDefaultNoShadow,
	LayerAnimal
}
SceneBase.static.PointLightMazeLayerMask = {
	LayerDefault,
	LayerItem1,
	LayerItem2,
	LayerItem3,
	LayerEffectLight,
	LayerDefaultNoShadow
}
SceneBase.static.PointLightMazeLayerMaskUltra = {
	LayerDefault,
	LayerItem1,
	LayerItem2,
	LayerItem3,
	LayerEffectLight,
	LayerDefaultNoShadow,
	LayerAnimal
}
SceneBase.static.VirtualRootType = {
	Ground = 0,
	Stair = 7,
	WallOpaque = 1,
	Locator = 6,
	Effect = 5,
	EnemySpace = 8,
	WallInvisible = 3,
	WallTransparent = 2,
	WallMonster = 4
}
SceneBase.static.SlowMudDodge = 0.4
SceneBase.static.PoisonMudDodge = 0.4
SceneBase.static.GroundType = {
	River = 7,
	Wood = 9,
	Mud = 1,
	Slurry = 11,
	Carpet = 10,
	Water = 6,
	Unknown = 0,
	Gold = 16,
	WetLand = 15,
	Branch = 14,
	Metal = 13,
	Cloth = 12,
	Grass = 4,
	PoisonMud = 3,
	SlowMud = 2,
	Stone = 5,
	Lake = 8
}
SceneBase.static.ZoneType = {
	ZoneNoDropDamage = 6,
	ZoneTrick = 7,
	ZoneB = 2,
	ZoneElevator = 4,
	ZoneSlowSkill = 10,
	ZoneC = 3,
	Unknown = 0,
	ZoneCage = 9,
	ZoneA = 1,
	ZoneElevatorBottom = 8,
	ZoneSlow = 5
}
SceneBase.static.StairPoint = {
	UpRot = 2,
	MinY = 6,
	PosX = 7,
	DownPos = 3,
	MaxY = 5,
	PosZ = 8,
	UpPos = 1,
	DownRot = 4
}
SceneBase.static.MovieType = {
	Start = 1,
	End = 2
}
SceneBase.static.CurtainType = {
	StartPos = 1,
	EndPos = 4,
	StartZLook = 2,
	EndZLook = 5,
	EndXLook = 6,
	StartXLook = 3
}
SceneBase.static.AnimatorType = {
	Honeypot = 14,
	Crate = 5,
	Door = 1,
	TimeLine = 10,
	CoverKick = 4,
	Gate = 7,
	StairKick = 3,
	Statue = 12,
	Altar = 9,
	Bridge = 8,
	Rain = 15,
	Trick = 6,
	Fountain = 13,
	Cage = 11,
	Elevator = 2
}
SceneBase.static.AreaInDoor = "InDoor"
SceneBase.static.AreaOutDoor = "OutDoor"
SceneBase.static.Area = {
	InDoor = 1,
	Unknown = 0,
	OutDoor = 2
}
SceneBase.static.PostProcessType = {
	Unknown = 0,
	MainSuper = 3,
	MainPro = 2,
	Main = 1,
	Movie = 4,
	Dialog = 5,
	Map = 6
}
SceneBase.static.PostProcessTypeStart = SceneBase.PostProcessType.Main
SceneBase.static.PostProcessTypeEnd = SceneBase.PostProcessType.MainSuper
SceneBase.static.PostProcessingConfig = {
	{
		CA_Intensity = 0.126,
		CG_Saturation = 18
	},
	{
		CA_Intensity = 0.3,
		CG_Saturation = -20
	},
	{
		CA_Intensity = 1,
		CG_Saturation = -20
	},
	{
		CA_Intensity = 0.126,
		CG_Saturation = 18
	}
}
SceneBase.static.SceneGroundType = {
	mud = SceneBase.GroundType.Mud,
	slowmud = SceneBase.GroundType.SlowMud,
	poisonmud = SceneBase.GroundType.PoisonMud,
	grass = SceneBase.GroundType.Grass,
	stone = SceneBase.GroundType.Stone,
	water = SceneBase.GroundType.Water,
	river = SceneBase.GroundType.River,
	lake = SceneBase.GroundType.Lake,
	wood = SceneBase.GroundType.Wood,
	carpet = SceneBase.GroundType.Carpet,
	slurry = SceneBase.GroundType.Slurry,
	cloth = SceneBase.GroundType.Cloth,
	metal = SceneBase.GroundType.Metal,
	branch = SceneBase.GroundType.Branch,
	wetLand = SceneBase.GroundType.WetLand,
	gold = SceneBase.GroundType.Gold
}
SceneBase.static.SceneZoneType = {
	azone = SceneBase.ZoneType.ZoneA,
	bzone = SceneBase.ZoneType.ZoneB,
	czone = SceneBase.ZoneType.ZoneC,
	dzone = SceneBase.ZoneType.ZoneElevator,
	ezone = SceneBase.ZoneType.ZoneSlow,
	fzone = SceneBase.ZoneType.ZoneNoDropDamage,
	gzone = SceneBase.ZoneType.ZoneTrick,
	hzone = SceneBase.ZoneType.ZoneElevatorBottom,
	jzone = SceneBase.ZoneType.ZoneCage,
	kzone = SceneBase.ZoneType.ZoneSlowSkill
}
SceneBase.static.DefaultGroundPosition = Vector3.NewS(0, -100, 0)
SceneBase.static.DefaultGroundNormal = Vector3.NewS(0, 1, 0)
SceneBase.static.DefaultWaterHeight = -100
SceneBase.static.PointLightIntensitySpeed = 0.8
SceneBase.PointLightIntensity = 1.2
SceneBase.PointLightRange = 15
SceneBase.static.AutoExposureRecoverySpeed = 4
SceneBase.static.AutoExposureValueTarget = -9
SceneBase.static.MazeBossEntrancePoint = 99
SceneBase.static.MazeBossDropItemPoint = 98
SceneBase.static.MazeBossEntrancePoint2 = 97
SceneBase.static.AltarForNextStageId = 99

local debugLoadGraphFile = true

function SceneBase:initialize(transform, name)
	self.tfSelf = transform
	self.sceneName = name
	self.startFlg = false
	self.focusFlg = false
	self.tfVisibleRoot = self.tfSelf:Find("visible")

	if self.tfVisibleRoot == nil then
		return
	end

	self.tfObjectGroup = self.tfSelf:Find("ObjectGroup")
	self.storyId = 0
	self.sceneId = 0

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
		self.storyId = FS_UserData.story:GetStoryId()
		self.sceneId = BattleData.ConvertSceneId(self.sceneName)
	end

	self.sceneController = ST_Main.GetSceneController()
	self.cameraScene = nil
	self.sceneConfig = nil
	self.tfWater = nil
	self.tfWaterPro = nil

	if self.tfVisibleRoot ~= nil then
		self.sceneConfig = self.tfVisibleRoot:GetComponent("SceneConfig")
		self.tfWater = self.tfVisibleRoot:Find("water_group")
		self.tfWaterPro = self.tfVisibleRoot:Find("water_pro_group")
	end

	self.qualityLevel = LS_Setting.QualityLevel.Unknown
	self.tfEffectRootList = {}
	self.doorList = {}
	self.elevatorList = {}
	self.cageList = {}
	self.stairKickList = {}
	self.coverKickList = {}
	self.crateList = {}
	self.gateList = {}
	self.bridgeList = {}
	self.altarList = {}
	self.trickList = {}
	self.timeLineList = {}
	self.plantList = {}
	self.entranceList = nil
	self.statueList = nil
	self.fountainList = nil
	self.honeypotList = nil
	self.groundColliderList = {}
	self.elevatorColliderList = {}
	self.tfVirtualRoot = self.tfSelf:Find("virtual")

	if self.tfVirtualRoot ~= nil then
		self.tfVirtualRoot.gameObject:SetActive(true)

		self.tfVirtualGroundRoot = self.tfVirtualRoot:Find("ground_group")
		self.tfVirtualWallRoot = self.tfVirtualRoot:Find("wall_group")
		self.tfVirtualWallOpaqueRoot = self.tfVirtualWallRoot:Find("opaque_group")
		self.tfVirtualWallTransparentRoot = self.tfVirtualWallRoot:Find("transparent_group")
		self.tfVirtualWallInvisibleRoot = self.tfVirtualWallRoot:Find("invisible_group")
		self.tfVirtualWallMonsterRoot = self.tfVirtualWallRoot:Find("monster_fence_group")
		self.tfVirtualPathRoot = self.tfVirtualRoot:Find("path_group")
	end

	local groundDataList = self.tfSelf:GetComponentsInChildren(typeof(GroundData), true)

	for i = 0, groundDataList.Length - 1 do
		local data = {}
		local groundData = groundDataList[i]

		data.groundType = groundData.groundType
		data.waterHeight = groundData.waterHeight
		data.useZoneType = groundData.useZoneType

		if data.useZoneType then
			data.zoneId = groundData.zoneId
			data.zoneType = groundData.zoneType
			data.area = groundData.area
		end

		data.useReverb = groundData.useReverb

		if data.useReverb then
			data.reverbId = groundData.reverbId
		end

		data.useFog = groundData.useFog

		if data.useFog then
			data.startDistance = groundData.startDistance
			data.endDistance = groundData.endDistance
			data.fogColor = groundData.fogColor
		end

		local tmpId = tonumber(groundData.transform:GetInstanceID())

		data.name = groundData.transform.name
		self.groundColliderList[tmpId] = data

		if data.zoneType == SceneBase.ZoneType.ZoneElevator then
			local tfElevatorRoot = groundData.transform.parent.parent.parent

			if tfElevatorRoot ~= nil then
				local nameList = StringHelper.Split(tfElevatorRoot.name, "_")
				local elevatorId = tonumber(nameList[2])

				self.elevatorColliderList[tmpId] = elevatorId
			end
		end
	end

	if MS_StoryList.IsStoryNew(self.storyId) then
		local checkObjectComponent = self.tfSelf:GetComponent("CheckObjectShouldExist")

		if checkObjectComponent then
			checkObjectComponent:SetAllOldGOActive(false)
			checkObjectComponent:SetAllNewGOActive(true)
		end
	else
		local checkObjectComponent = self.tfSelf:GetComponent("CheckObjectShouldExist")

		if checkObjectComponent then
			checkObjectComponent:SetAllOldGOActive(true)
			checkObjectComponent:SetAllNewGOActive(false)
		end
	end

	if self.tfVisibleRoot ~= nil then
		local plantRoot = self.tfVisibleRoot:Find("Arena_plant_root")

		if plantRoot ~= nil then
			local len = plantRoot.childCount

			for i = 0, len - 1 do
				local plantAreaRoot = plantRoot:GetChild(i)

				if plantAreaRoot ~= nil then
					local areaName = plantAreaRoot.name
					local typeNum = plantAreaRoot.childCount

					for j = 0, typeNum - 1 do
						local plantTypeRoot = plantAreaRoot:GetChild(j)

						if plantTypeRoot ~= nil then
							local meshGroup = plantTypeRoot:GetComponent("MeshGroupInstance")

							if meshGroup ~= nil then
								if self.plantList[areaName] == nil then
									self.plantList[areaName] = {}
								end

								table.insert(self.plantList[areaName], meshGroup)
							end
						end
					end
				end
			end
		end
	end

	self.tfAnimatorRoot = self.tfSelf:Find("animatorRoot")

	if self.tfAnimatorRoot ~= nil then
		self.tfDoorRoot = self.tfAnimatorRoot:Find("door_group")

		self:CheckAnimatorRoot(SceneBase.AnimatorType.Door, self.tfDoorRoot)

		self.tfElevatorRoot = self.tfAnimatorRoot:Find("elevator_group")

		self:CheckAnimatorRoot(SceneBase.AnimatorType.Elevator, self.tfElevatorRoot)

		self.tfCageRoot = self.tfAnimatorRoot:Find("cage_group")

		self:CheckAnimatorRoot(SceneBase.AnimatorType.Cage, self.tfCageRoot)

		self.tfStairKickRoot = self.tfAnimatorRoot:Find("stair_group")

		self:CheckAnimatorRoot(SceneBase.AnimatorType.StairKick, self.tfStairKickRoot)

		self.tfCoverKickRoot = self.tfAnimatorRoot:Find("cover_group")

		self:CheckAnimatorRoot(SceneBase.AnimatorType.CoverKick, self.tfCoverKickRoot)

		self.tfCrateRoot = self.tfAnimatorRoot:Find("crate_group")

		if MS_StoryList.IsStoryMaze(self.storyId) == true then
			self:CheckDynamicAnimatorRoot(SceneBase.AnimatorType.Crate, self.tfCrateRoot)
		else
			self:CheckAnimatorRoot(SceneBase.AnimatorType.Crate, self.tfCrateRoot)
		end

		self.tfGateRoot = self.tfAnimatorRoot:Find("gate_group")

		self:CheckAnimatorRoot(SceneBase.AnimatorType.Gate, self.tfGateRoot)

		self.tfBridgeRoot = self.tfAnimatorRoot:Find("bridge_group")

		self:CheckAnimatorRoot(SceneBase.AnimatorType.Bridge, self.tfBridgeRoot)

		self.tfAltarRoot = self.tfAnimatorRoot:Find("save_group")

		self:CheckAnimatorRoot(SceneBase.AnimatorType.Altar, self.tfAltarRoot)

		self.tfTrickRoot = self.tfAnimatorRoot:Find("trick_group")

		self:CheckTrickGroup(self.tfTrickRoot)

		self.tfTimeLineRoot = self.tfAnimatorRoot:Find("timeline_group")

		self:CheckAnimatorRoot(SceneBase.AnimatorType.TimeLine, self.tfTimeLineRoot)

		self.tfStatueRoot = self.tfAnimatorRoot:Find("statue_group")

		self:CheckDynamicAnimatorRoot(SceneBase.AnimatorType.Statue, self.tfStatueRoot)

		self.tfFountainRoot = self.tfAnimatorRoot:Find("fountain_group")

		self:CheckDynamicAnimatorRoot(SceneBase.AnimatorType.Fountain, self.tfFountainRoot)

		self.tfHoneypotRoot = self.tfAnimatorRoot:Find("honeypot_group")

		self:CheckDynamicAnimatorRoot(SceneBase.AnimatorType.Honeypot, self.tfHoneypotRoot)
	end

	self.tfReflectionProbeGroup = nil
	self.tfSkyBox = nil
	self.tfDirLight = nil
	self.tfPointLight = nil
	self.pointLight = nil
	self.pointLightPosition = Vector3.zero
	self.pointLightIntensity = 0
	self.pointLightEnable = false
	self.groundLayerMask = LayerMask.GetMask("Ground")
	self.tfMixLight = nil
	self.mixLight = nil
	self.mixLightDir = Vector3.back
	self.trapList = nil
	self.sceneFogColor = Color.black
	self.sceneFogStartDis = 0
	self.sceneFogEndDis = 0
	self.iconVisible = nil
	self.exposureMax = 0
	self.exposureValue = 0
	self.exposureRecovery = false
	self.exposureStart = false
	self.exposureSpeed = 0
end

function SceneBase:SetCameraCtrl(camera)
	self.cameraScene = camera
end

function SceneBase:GetSceneName()
	return self.sceneName
end

function SceneBase:GetSceneId()
	return self.sceneId
end

function SceneBase:SetFocus(flg, isFirst)
	if isFirst == true or self.focusFlg ~= flg then
		self.focusFlg = flg

		if DebugDLCSceneAll == false then
			Common.SetRootObjectActiveFromScene(self.sceneName, flg)
		end

		if flg == false then
			self:ShowPointLight(false, true)
		else
			if self.sceneConfig ~= nil then
				self.sceneFogColor, self.sceneFogStartDis, self.sceneFogEndDis = self.sceneConfig:GetOldFogColor(self.sceneFogStartDis, self.sceneFogEndDis)
			end

			if self.doorList ~= nil then
				for id, door in pairs(self.doorList) do
					if door ~= nil then
						door:SetFocus(flg)
					end
				end
			end

			if self.elevatorList ~= nil then
				for id, elevator in pairs(self.elevatorList) do
					if elevator ~= nil then
						elevator:SetFocus(flg)
					end
				end
			end

			if self.cageList ~= nil then
				for id, cage in pairs(self.cageList) do
					if cage ~= nil then
						cage:SetFocus(flg)
					end
				end
			end

			if self.stairKickList ~= nil then
				for id, stairKick in pairs(self.stairKickList) do
					if stairKick ~= nil then
						stairKick:SetFocus(flg)
					end
				end
			end

			if self.coverKickList ~= nil then
				for id, coverKick in pairs(self.coverKickList) do
					if coverKick ~= nil then
						coverKick:SetFocus(flg)
					end
				end
			end

			if self.crateList ~= nil then
				for id, crate in pairs(self.crateList) do
					if crate ~= nil then
						crate:SetFocus(flg)
					end
				end
			end

			if self.gateList ~= nil then
				for id, gate in pairs(self.gateList) do
					if gate ~= nil then
						gate:SetFocus(flg)
					end
				end
			end

			if self.bridgeList ~= nil then
				for id, bridge in pairs(self.bridgeList) do
					if bridge ~= nil then
						bridge:SetFocus(flg)
					end
				end
			end

			if self.altarList ~= nil then
				for id, altar in pairs(self.altarList) do
					if altar ~= nil then
						altar:SetFocus(flg)
					end
				end
			end
		end
	end
end

function SceneBase:Start()
	if self.startFlg == true then
		return
	end

	self.startFlg = true
	self.gameController = self.sceneController:GetGameController()

	if self.trickList ~= nil then
		for id, trickGroup in pairs(self.trickList) do
			if trickGroup ~= nil and trickGroup:GetPlayMode() == TrickGroupBase.PlayMode.AutoLoop then
				local trickData = MS_TrickData.GetTrickData(id)

				if trickData ~= nil and self.gameController:CheckShowQuestComplete(trickData.ShowQuestId) == true and self.gameController:CheckHideQuestComplete(trickData.HideQuestId) == false then
					trickGroup:SetViewDistance(trickData.ViewDistance)
					trickGroup:OpenAuto()
				end
			end
		end
	end

	if MS_StoryList.IsStoryMaze(self.storyId) == true then
		local statueDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Statue)

		if statueDataList ~= nil and self.statueList ~= nil and #self.statueList > 0 then
			local statueData = table.getRandomValue(statueDataList)
			local num = #self.statueList
			local type = MathHelper.getRandom(1, num)

			if statueData ~= nil then
				local tmpId, tmpType, tmpRnd1, tmpRnd2 = FS_UserData.story:GetMazeElementId(FS_SaveMaze.ElementType.Statue, statueData.Id, type)

				if tmpId > 0 and tmpType > 0 and statueDataList[tmpId] ~= nil and self.statueList[tmpType] ~= nil then
					statueData = statueDataList[tmpId]

					if DebugMazeStatue == true and DebugMazeStatueType > 0 and DebugMazeStatueIndex1 > 0 and DebugMazeStatueIndex2 > 0 then
						tmpType = DebugMazeStatueType
					end

					type = tmpType
				else
					statueData = nil
					type = 0
				end

				for i = 1, num do
					local statue = self.statueList[i]

					if i == type and statueData ~= nil then
						statue:Show(statueData.Position, statueData.Orientation)
						statue:SetDataList(tmpRnd1, tmpRnd2)

						if DLC_Maze == true then
							FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Statue][3] = tmpId

							FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Statue][4]:SetVector3(statueData.Position)
						end
					else
						statue:Hide()
					end
				end
			end
		end

		local fountainDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Fountain)

		if fountainDataList ~= nil and self.fountainList ~= nil and #self.fountainList > 0 then
			local fountainData = table.getRandomValue(fountainDataList)
			local fountain = self.fountainList[1]

			if fountainData ~= nil and fountain ~= nil then
				local tmpId, tmpType, tmpRnd1, tmpRnd2 = FS_UserData.story:GetMazeElementId(FS_SaveMaze.ElementType.Fountain, fountainData.Id, 1)

				if tmpId > 0 and fountainDataList[tmpId] ~= nil then
					fountainData = fountainDataList[tmpId]

					fountain:Show(fountainData.Position)

					if DLC_Maze == true then
						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Fountain][3] = tmpId

						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Fountain][4]:SetVector3(fountainData.Position)
					end
				else
					fountain:Hide()
				end
			end
		end

		local honeypotDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Honeypot)

		if honeypotDataList ~= nil and self.honeypotList ~= nil and #self.honeypotList > 0 then
			local honeypotData = table.getRandomValue(honeypotDataList)
			local honeypot = self.honeypotList[1]

			if honeypotData ~= nil and honeypot ~= nil then
				local tmpId, tmpType, tmpRnd1, tmpRnd2 = FS_UserData.story:GetMazeElementId(FS_SaveMaze.ElementType.Honeypot, honeypotData.Id, 1)

				if tmpId > 0 and honeypotDataList[tmpId] ~= nil then
					honeypotData = honeypotDataList[tmpId]

					honeypot:Show(honeypotData.Position)

					local heroId, heroType = FS_UserData.story:GetMazeHeroCallData()

					honeypot:SetHeroData(heroId, heroType)

					if DLC_Maze == true then
						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Honeypot][3] = tmpId

						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Honeypot][4]:SetVector3(honeypotData.Position)
					end
				else
					honeypot:Hide()
				end
			end
		end

		local crateDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Crate)

		if crateDataList ~= nil and self.crateList ~= nil and #self.crateList > 0 then
			local crateData = table.getRandomValue(crateDataList)
			local crateId = 1
			local crate = self.crateList[crateId]
			local num = MS_StoryMazeCrate.GetMazeCrateNum(FS_UserData.story:GetMazeLevel(), crateId)

			if num >= 1 then
				local index = MathHelper.getRandom(1, num)

				if DebugMazeCrate == true and DebugMazeCrateType > 0 then
					index = Mathf.Clamp(DebugMazeCrateType, 1, num)
				end

				if crateData ~= nil and crate ~= nil then
					local tmpId, tmpIndex, tmpRnd1, tmpRnd2 = FS_UserData.story:GetMazeElementId(FS_SaveMaze.ElementType.Crate, crateData.Id, index)

					if tmpId > 0 and crateDataList[tmpId] ~= nil then
						crateData = crateDataList[tmpId]

						crate:SetMazeData(tmpId, tmpIndex)
						crate:Show()

						local status = crate:GetStatus()

						if status == Crate.Status.Lock then
							self.gameController:CreateCrateMonster(crateId)
						end
					else
						crate:Hide()
					end
				end
			end
		end
	end
end

function SceneBase:DebugMazeStatueNext()
	if MS_StoryList.IsStoryMaze(self.storyId) == true then
		local idNow = FS_UserData.story:DebugGetElementId(FS_SaveMaze.ElementType.Statue)

		if idNow <= 0 then
			return
		end

		local findId = 0
		local findNext = false
		local statueDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Statue)

		for id, v in pairs(statueDataList) do
			if findId <= 0 then
				findId = id
			end

			if findNext == false then
				if id == idNow then
					findNext = true
				end
			else
				findId = id

				break
			end
		end

		if findId > 0 and self.statueList ~= nil then
			for k, statue in pairs(self.statueList) do
				if statue ~= nil and statue:IsShow() == true then
					FS_UserData.story:DebugSetElementId(FS_SaveMaze.ElementType.Statue, findId)

					local statueData = statueDataList[findId]

					statue:DebugRefresh(statueData.Position, statueData.Orientation)

					if DLC_Maze == true then
						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Statue][3] = findId

						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Statue][4]:SetVector3(statueData.Position)
					end
				end
			end
		end
	end
end

function SceneBase:DebugMazeFountainNext()
	if MS_StoryList.IsStoryMaze(self.storyId) == true then
		local idNow = FS_UserData.story:DebugGetElementId(FS_SaveMaze.ElementType.Fountain)

		if idNow <= 0 then
			return
		end

		local findId = 0
		local findNext = false
		local fountainDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Fountain)

		for id, v in pairs(fountainDataList) do
			if findId <= 0 then
				findId = id
			end

			if findNext == false then
				if id == idNow then
					findNext = true
				end
			else
				findId = id

				break
			end
		end

		if findId > 0 and self.fountainList ~= nil then
			for k, fountain in pairs(self.fountainList) do
				if fountain ~= nil and fountain:IsShow() == true then
					FS_UserData.story:DebugSetElementId(FS_SaveMaze.ElementType.Fountain, findId)

					local fountainData = fountainDataList[findId]

					fountain:DebugRefresh(fountainData.Position)

					if DLC_Maze == true then
						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Fountain][3] = findId

						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Fountain][4]:SetVector3(fountainData.Position)
					end
				end
			end
		end
	end
end

function SceneBase:DebugMazeHoneypotNext()
	if MS_StoryList.IsStoryMaze(self.storyId) == true then
		local idNow = FS_UserData.story:DebugGetElementId(FS_SaveMaze.ElementType.Honeypot)

		if idNow <= 0 then
			return
		end

		local findId = 0
		local findNext = false
		local honeypotDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Honeypot)

		for id, v in pairs(honeypotDataList) do
			if findId <= 0 then
				findId = id
			end

			if findNext == false then
				if id == idNow then
					findNext = true
				end
			else
				findId = id

				break
			end
		end

		if findId > 0 and self.honeypotList ~= nil then
			for k, honeypot in pairs(self.honeypotList) do
				if honeypot ~= nil and honeypot:IsShow() == true then
					FS_UserData.story:DebugSetElementId(FS_SaveMaze.ElementType.Honeypot, findId)

					local honeypotData = honeypotDataList[findId]

					honeypot:DebugRefresh(honeypotData.Position)

					if DLC_Maze == true then
						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Honeypot][3] = findId

						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Honeypot][4]:SetVector3(honeypotData.Position)
					end
				end
			end
		end
	end
end

function SceneBase:DebugMazeCrateNext()
	if MS_StoryList.IsStoryMaze(self.storyId) == true then
		local idNow = FS_UserData.story:DebugGetElementId(FS_SaveMaze.ElementType.Crate)

		if idNow <= 0 then
			return
		end

		local findId = 0
		local findNext = false
		local crateDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Crate)

		for id, v in pairs(crateDataList) do
			if findId <= 0 then
				findId = id
			end

			if findNext == false then
				if id == idNow then
					findNext = true
				end
			else
				findId = id

				break
			end
		end

		if findId > 0 and self.crateList ~= nil then
			for k, crate in pairs(self.crateList) do
				if crate ~= nil and crate:IsShow() == true then
					FS_UserData.story:DebugSetElementId(FS_SaveMaze.ElementType.Crate, findId)

					local crateData = crateDataList[findId]

					crate:DebugRefresh(findId)

					if DLC_Maze == true then
						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Crate][3] = findId

						FS_SaveMaze.DebugShowList[FS_SaveMaze.ElementType.Crate][4]:SetVector3(crateData.Position)
					end
				end
			end
		end
	end
end

function SceneBase:SetPostProcessing(tfPostProcessing)
	if tfPostProcessing ~= nil then
		self.tfPostProcessRoot = tfPostProcessing
		self.tfPostProcessList = {}
		self.postProcessControllerList = {}
		self.postProcessType = SceneBase.PostProcessType.Unknown

		if self.tfPostProcessRoot ~= nil then
			self:InitPostProcess(SceneBase.PostProcessType.Main, "Main")
			self:InitPostProcess(SceneBase.PostProcessType.MainPro, "MainPro")
			self:InitPostProcess(SceneBase.PostProcessType.MainSuper, "MainSuper")
			self:InitPostProcess(SceneBase.PostProcessType.Movie, "Movie")
			self:InitPostProcess(SceneBase.PostProcessType.Dialog, "Dialog")
			self:InitPostProcess(SceneBase.PostProcessType.Map, "Map")

			self.colorGradingBrightness = LS_Setting.graphics.brightness
			self.colorGradingContrast = 0
			self.colorGradingSaturation = SceneBase.PostProcessingConfig[1].CG_Saturation
			self.chromaticAberrationIntensity = SceneBase.PostProcessingConfig[1].CA_Intensity
		end
	end
end

function SceneBase:InitArea(areaId, prev)
	SystemHelper.LogTest("====InitArea=============areaId=" .. areaId)

	if self.storyId == MS_StoryData.StoryId10008 then
		if self.tfObjectGroup ~= nil then
			local tfTower = self.tfObjectGroup:Find("Tower/Arena10008_tower")

			if tfTower ~= nil then
				if prev == true then
					tfTower.gameObject:SetActive(true)
				elseif areaId == 1 then
					tfTower.gameObject:SetActive(false)
				else
					tfTower.gameObject:SetActive(true)
				end
			end
		end
	elseif self.storyId == MS_StoryData.StoryId50001 then
		local tfWall = self:GetWall("wall_box_1999")

		if tfWall ~= nil then
			if areaId == 4 then
				tfWall.gameObject:SetActive(false)
			else
				tfWall.gameObject:SetActive(true)
			end
		end
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and FS_UserData.story:IsSelectStageGameOver() then
		if self.altarList[SceneBase.AltarForNextStageId] ~= nil then
			self.altarList[SceneBase.AltarForNextStageId]:ShowAltar(true)
			self.altarList[SceneBase.AltarForNextStageId]:SetFocus(true)
		end
	elseif self.altarList[SceneBase.AltarForNextStageId] ~= nil then
		self.altarList[SceneBase.AltarForNextStageId]:ShowAltar(false)
	end
end

function SceneBase:UpdatePlantQuality()
	if self.plantList ~= nil then
		for areaName, areaList in pairs(self.plantList) do
			if areaList ~= nil then
				for i = 1, #areaList do
					local meshGroup = areaList[i]

					if meshGroup ~= nil then
						meshGroup:SetQuality(self.qualityLevel)
					end
				end
			end
		end
	end
end

function SceneBase:InitPostProcess(type, name)
	if self.tfPostProcessRoot ~= nil then
		local tfPostProces = self.tfPostProcessRoot:Find(name)

		if tfPostProces ~= nil then
			local controller = tfPostProces:GetComponent("PostProcessingController")

			if controller ~= nil then
				self.tfPostProcessList[type] = tfPostProces
				self.postProcessControllerList[type] = controller
			end

			if type ~= self.postProcessType then
				tfPostProces.gameObject:SetActive(false)
			end
		end
	end
end

function SceneBase:ShowPostProcess(flg)
	if self.tfPostProcessRoot ~= nil then
		self.tfPostProcessRoot.gameObject:SetActive(flg)
	end
end

function SceneBase:SetPostProcessType(type)
	if type == SceneBase.PostProcessType.MainSuper and self.tfPostProcessList[type] == nil then
		type = SceneBase.PostProcessType.MainPro
	end

	if self.tfPostProcessList[type] ~= nil and type ~= self.postProcessType then
		for i, tfPostProcess in pairs(self.tfPostProcessList) do
			if i ~= type and tfPostProcess ~= nil then
				tfPostProcess.gameObject:SetActive(false)
			end
		end

		self.tfPostProcessList[type].gameObject:SetActive(true)

		self.postProcessType = type

		self:SetBrightness(self.colorGradingBrightness)
	end
end

function SceneBase:GetPostProcessController()
	return self.postProcessControllerList[self.postProcessType]
end

function SceneBase:SetAutoExposureEnable(enable)
	if self.postProcessControllerList[self.postProcessType] ~= nil then
		self.postProcessControllerList[self.postProcessType]:SetAutoExposureEnable(enable)
	end
end

function SceneBase:SetAutoExposureCompensation(value)
	if self.postProcessControllerList[self.postProcessType] ~= nil then
		self.exposureCompensation = value

		self.postProcessControllerList[self.postProcessType]:SetAutoExposureCompensation(value)
	end
end

function SceneBase:StartAutoExposure(speed)
	if self.exposureStart == false then
		for i = SceneBase.PostProcessTypeStart, SceneBase.PostProcessTypeEnd do
			if self.postProcessControllerList[i] ~= nil then
				self.postProcessControllerList[i]:SetAutoExposureEnable(true)
			end
		end
	end

	self.exposureStart = true
	self.exposureRecovery = false
	self.exposureSpeed = speed
end

function SceneBase:IsAutoExposureFinish()
	if self.exposureStart == true and self.exposureValue <= SceneBase.AutoExposureValueTarget then
		return true
	end

	return false
end

function SceneBase:IsAutoExposureStart()
	return self.exposureStart
end

function SceneBase:IsAutoExposureRecovery()
	return self.exposureRecovery
end

function SceneBase:RecoveryAutoExposure()
	self.exposureStart = false
	self.exposureRecovery = true
end

function SceneBase:SetDepthOfFieldAperture(value)
	if self.postProcessControllerList ~= nil and self.postProcessControllerList[self.postProcessType] ~= nil then
		self.postProcessControllerList[self.postProcessType]:SetDepthOfFieldAperture(value)
	end
end

function SceneBase:SetDepthOfFieldAperture(value)
	if self.postProcessControllerList ~= nil and self.postProcessControllerList[self.postProcessType] ~= nil then
		self.postProcessControllerList[self.postProcessType]:SetDepthOfFieldAperture(value)
	end
end

function SceneBase:SetDepthOfFieldEnable(flag)
	if self.postProcessControllerList ~= nil and self.postProcessControllerList[self.postProcessType] ~= nil then
		self.postProcessControllerList[self.postProcessType]:SetDepthOfFieldEnabled(flag)
	end
end

function SceneBase:SetAmbientOcclusionEnable(flag)
	if self.postProcessControllerList ~= nil and self.postProcessControllerList[self.postProcessType] ~= nil then
		self.postProcessControllerList[self.postProcessType]:SetAmbientOcclusionEnabled(flag)
	end
end

function SceneBase:SetVignetteEnable(flag)
	if self.postProcessControllerList ~= nil and self.postProcessControllerList[self.postProcessType] ~= nil then
		self.postProcessControllerList[self.postProcessType]:SetVignetteEnabled(flag)
	end
end

function SceneBase:SetChromaticAberrationEnable(flag)
	if self.postProcessControllerList ~= nil and self.postProcessControllerList[self.postProcessType] ~= nil then
		self.postProcessControllerList[self.postProcessType]:SetChromaticAberrationEnabled(flag)
	end
end

function SceneBase:SetBrightness(value)
	if self.postProcessControllerList ~= nil and self.postProcessControllerList[self.postProcessType] ~= nil then
		self.postProcessControllerList[self.postProcessType]:SetColorGradingBrightness(value)

		self.colorGradingBrightness = value

		self.postProcessControllerList[self.postProcessType]:SetColorGradingContrast(0)

		self.colorGradingContrast = 0
	end
end

function SceneBase:SetSanityEffects(sanityType)
	if MS_StoryList.IsStoryDream(self.storyId) == false then
		local config = SceneBase.PostProcessingConfig[sanityType + 1]

		self:InterpColorGradingSaturation(true, config.CG_Saturation)

		self.colorGradingSaturation = config.CG_Saturation

		self:InterpChromaticAberrationIntensity(true, config.CA_Intensity)

		self.chromaticAberrationIntensity = config.CA_Intensity
	end
end

function SceneBase:SetSanityCustom(sanityType)
	local config = SceneBase.PostProcessingConfig[sanityType + 1]

	self:InterpColorGradingSaturation(true, config.CG_Saturation)
end

function SceneBase:InterpColorGradingSaturation(enabled, saturation)
	if MS_StoryList.IsStoryDream(self.storyId) == false and self.postProcessControllerList ~= nil and self.postProcessControllerList[self.postProcessType] ~= nil then
		self.postProcessControllerList[self.postProcessType]:InterpColorGradingSaturation(enabled, saturation)
	end
end

function SceneBase:InterpChromaticAberrationIntensity(enabled, intensity)
	if MS_StoryList.IsStoryDream(self.storyId) == false and self.postProcessControllerList ~= nil and self.postProcessControllerList[self.postProcessType] ~= nil then
		self.postProcessControllerList[self.postProcessType]:InterpChromaticAberrationIntensity(enabled, intensity)
	end
end

function SceneBase:RecoveryChromaticAberrationIntensity()
	if MS_StoryList.IsStoryDream(self.storyId) == false then
		self:InterpChromaticAberrationIntensity(true, self.chromaticAberrationIntensity)
	end
end

function SceneBase:SetEffectRoot(tfEffRoot)
	self.tfEffectGroupRoot = tfEffRoot

	if self.tfEffectGroupRoot ~= nil then
		self:CheckEffectRoot(self.tfEffectGroupRoot)
	end
end

function SceneBase:SetEnemySpace(tfSpace)
	tfSpace.name = "enemy_group"

	tfSpace:SetParent(self.tfVirtualRoot)

	tfSpace.localPosition = Vector3.zero
	tfSpace.localScale = Vector3.one
	tfSpace.localRotation = Quaternion.identity

	self:CheckVirtualRoot(SceneBase.VirtualRootType.EnemySpace, self.tfVirtualEnemySpaceRoot)
end

function SceneBase:GetObject(name)
	if self.tfSelf ~= nil then
		return self.tfSelf:Find(name)
	end

	return nil
end

function SceneBase:GetVisibleObject(name)
	local ret = self.tfVisibleRoot:Find(name)

	return ret
end

function SceneBase:GetGroundData(instanceID)
	if self.groundColliderList ~= nil then
		return self.groundColliderList[tonumber(instanceID)]
	end

	return nil
end

function SceneBase:IsShow()
	return self.tfVisibleRoot.gameObject.activeSelf
end

function SceneBase:Hide()
	if self.tfVisibleRoot ~= nil then
		self.tfVisibleRoot.gameObject:SetActive(false)
	end
end

function SceneBase:Show()
	if self.tfVisibleRoot ~= nil then
		self.tfVisibleRoot.gameObject:SetActive(true)
	end
end

function SceneBase:GetVisibleRoot()
	return self.tfVisibleRoot
end

function SceneBase:GetDefaultFogData()
	return self.sceneFogColor, self.sceneFogStartDis, self.sceneFogEndDis
end

function SceneBase:CheckTrickGroup(root)
	if root == nil then
		return
	end

	local len = root.childCount

	for i = 0, len - 1 do
		local _tf = root:GetChild(i)
		local nameList = StringHelper.Split(_tf.name, "_")
		local id = tonumber(nameList[2])

		if self.trickList[id] == nil then
			local trickGroup = require("LuaScript/Logic/Trick/TrickGroup" .. id)

			self.trickList[id] = trickGroup:new(self)
		end

		self.trickList[id]:AddTrick(id, _tf)
	end
end

function SceneBase:OpenTrick(id, pos, rot)
	if self.trickList[id] ~= nil then
		self.trickList[id]:Open(pos, rot)
	end
end

function SceneBase:SynchronizeTrick(id, pos, rot)
	if self.trickList[id] ~= nil then
		self.trickList[id]:SynchronizePosAndRot(pos, rot)
	end
end

function SceneBase:OpenDelayTrick(id, time)
	if self.trickList[id] ~= nil then
		self.trickList[id]:OpenDelay(time)
	end
end

function SceneBase:SetRelativeTrick(id, relativeId)
	if self.trickList[id] ~= nil then
		self.trickList[id]:SetRelativeTrickId(relativeId)
	end
end

function SceneBase:StopTrick(id)
	if self.trickList[id] ~= nil then
		self.trickList[id]:Stop()
	end
end

function SceneBase:StopDelayTrick(id, time)
	if self.trickList[id] ~= nil then
		self.trickList[id]:StopDelay(time)
	end
end

function SceneBase:StopReadyTrick(id)
	if self.trickList[id] ~= nil then
		self.trickList[id]:StopReady()
	end
end

function SceneBase:IsTrickHitTarget(id)
	if self.trickList[id] ~= nil then
		return self.trickList[id]:IsTrickHitTarget()
	end

	return false
end

function SceneBase:GetTrick(id)
	if self.trickList[id] ~= nil then
		return self.trickList[id]
	end

	return nil
end

function SceneBase:CheckAnimatorRoot(type, root)
	if root == nil then
		return
	end

	local len = root.childCount

	for i = 0, len - 1 do
		local _tf = root:GetChild(i)
		local nameList = StringHelper.Split(_tf.name, "_")
		local id = tonumber(nameList[2])
		local tmpVirtualRoot = _tf:Find("virtual")

		if tmpVirtualRoot ~= nil then
			tmpVirtualRoot.gameObject:SetActive(true)
		end

		if type == SceneBase.AnimatorType.Door then
			if self.doorList[id] == nil then
				local door = Door:new(id, _tf)

				self.doorList[id] = door
			end
		elseif type == SceneBase.AnimatorType.Elevator then
			local StoryId = FS_UserData.story:GetStoryId()

			if not MS_StoryList.IsStoryArcadeBoss(StoryId) and self.elevatorList[id] == nil then
				local elevator = Elevator:new(id, _tf)

				self.elevatorList[id] = elevator
			end
		elseif type == SceneBase.AnimatorType.Cage then
			if self.cageList[id] == nil then
				local cage = Cage:new(id, _tf)

				self.cageList[id] = cage
			end
		elseif type == SceneBase.AnimatorType.StairKick then
			if self.stairKickList[id] == nil then
				local stairKick = StairKick:new(id, _tf)

				self.stairKickList[id] = stairKick
			end
		elseif type == SceneBase.AnimatorType.CoverKick then
			if self.coverKickList[id] == nil then
				local coverKick = CoverKick:new(id, _tf)

				self.coverKickList[id] = coverKick
			end
		elseif type == SceneBase.AnimatorType.Crate then
			if _tf.gameObject.activeSelf and self.crateList[id] == nil then
				local crate = Crate:new(id, Crate.Type.Common, _tf)

				self.crateList[id] = crate
			end
		elseif type == SceneBase.AnimatorType.Gate then
			if self.gateList[id] == nil then
				local gate = Gate:new(id, _tf)

				self.gateList[id] = gate
			end
		elseif type == SceneBase.AnimatorType.Bridge then
			if self.bridgeList[id] == nil then
				local bridge = Bridge:new(id, _tf)

				self.bridgeList[id] = bridge
			end
		elseif type == SceneBase.AnimatorType.Altar then
			if self.altarList[id] == nil then
				local altar = Altar:new(id, _tf)

				self.altarList[id] = altar
			end
		elseif type == SceneBase.AnimatorType.TimeLine and self.timeLineList[id] == nil then
			local timeLine = TimeLine:new(id, _tf)

			self.timeLineList[id] = timeLine
		end
	end
end

function SceneBase:CheckDynamicAnimatorRoot(type, root)
	if root == nil then
		return
	end

	local len = root.childCount

	for i = 0, len - 1 do
		local _tf = root:GetChild(i)
		local nameList = StringHelper.Split(_tf.name, "_")
		local id = tonumber(nameList[2])
		local tmpVirtualRoot = _tf:Find("virtual")

		if tmpVirtualRoot ~= nil then
			tmpVirtualRoot.gameObject:SetActive(true)
		end

		if type == SceneBase.AnimatorType.Statue then
			local statue = Statue:new(id, _tf)

			if statue ~= nil then
				if self.statueList == nil then
					self.statueList = {}
				end

				table.insert(self.statueList, statue)
			end
		elseif type == SceneBase.AnimatorType.Fountain then
			local fountain = Fountain:new(id, _tf)

			if fountain ~= nil then
				if self.fountainList == nil then
					self.fountainList = {}
				end

				table.insert(self.fountainList, fountain)
			end
		elseif type == SceneBase.AnimatorType.Honeypot then
			local honeypot = Honeypot:new(id, _tf)

			if honeypot ~= nil then
				if self.honeypotList == nil then
					self.honeypotList = {}
				end

				table.insert(self.honeypotList, honeypot)
			end
		elseif type == SceneBase.AnimatorType.Crate then
			local crate = Crate:new(id, Crate.Type.Maze, _tf)

			if crate ~= nil then
				if self.crateList == nil then
					self.crateList = {}
				end

				table.insert(self.crateList, crate)
			end
		end
	end
end

function SceneBase:CheckEffectRoot(root)
	if root == nil then
		return
	end

	local len = root.childCount

	for i = 0, len - 1 do
		local _tf = root:GetChild(i)

		if MS_StoryList.IsStoryNew(self.storyId) then
			local ObjectToCreate = _tf:GetComponent("ObjectToCreate")

			if ObjectToCreate then
				_tf.gameObject:SetActive(true)
			end

			local ObjectToRemove = _tf:GetComponent("ObjectToRemove")

			if ObjectToRemove then
				_tf.gameObject:SetActive(false)
			end
		else
			local ObjectToCreate = _tf:GetComponent("ObjectToCreate")

			if ObjectToCreate then
				_tf.gameObject:SetActive(false)
			end

			local ObjectToRemove = _tf:GetComponent("ObjectToRemove")

			if ObjectToRemove then
				_tf.gameObject:SetActive(true)
			end
		end

		local name = _tf.name

		self.tfEffectRootList[name] = _tf
	end
end

function SceneBase:CheckVirtualRoot(type, root)
	if root == nil then
		return
	end

	local tfs = root:GetComponentsInChildren(typeof("UnityEngine.Transform"))
	local len = tfs.Length

	for i = 0, len - 1 do
		local _tf = tfs[i]

		if _tf ~= nil then
			local render = _tf.gameObject:GetComponent(typeof("UnityEngine.MeshRenderer"))

			if render ~= nil then
				render.enabled = false
			end

			local name = _tf.name

			if name ~= root.name then
				local nameSub = StringHelper.Split(name, "_")
				local layer, colliderType

				if type == SceneBase.VirtualRootType.Ground then
					if string.lower(nameSub[1]) == "ground" then
						layer = LayerGround
					end
				elseif type == SceneBase.VirtualRootType.WallOpaque then
					if string.lower(nameSub[1]) == "wall" then
						layer = LayerWallOpaque
					end
				elseif type == SceneBase.VirtualRootType.WallTransparent then
					if string.lower(nameSub[1]) == "wall" then
						layer = LayerWallTransparent
					end
				elseif type == SceneBase.VirtualRootType.WallInvisible then
					if string.lower(nameSub[1]) == "wall" then
						layer = LayerWallInvisible
					end
				elseif type == SceneBase.VirtualRootType.WallMonster and string.lower(nameSub[1]) == "wall" then
					layer = LayerWallMonster
				end

				if type == SceneBase.VirtualRootType.Ground or type == SceneBase.VirtualRootType.WallOpaque or type == SceneBase.VirtualRootType.WallTransparent or type == SceneBase.VirtualRootType.WallInvisible or type == SceneBase.VirtualRootType.WallMonster then
					local tmpScale = _tf.localScale

					if tmpScale.x <= 0 or tmpScale.y <= 0 or tmpScale.z <= 0 then
						SystemHelper.LogError("========scale <= 0======scene=" .. _tf.name)
					end

					if string.lower(nameSub[2]) == "box" then
						colliderType = typeof("UnityEngine.BoxCollider")
					elseif string.lower(nameSub[2]) == "mesh" then
						colliderType = typeof("UnityEngine.MeshCollider")
					elseif string.lower(nameSub[2]) == "capsule" then
						colliderType = typeof("UnityEngine.CapsuleCollider")
					end
				end

				if colliderType ~= nil then
					local collider = _tf.gameObject:GetComponent(colliderType)

					if collider == nil then
						collider = _tf.gameObject:AddComponent(colliderType)
					end
				end

				if layer ~= nil then
					_tf.gameObject.layer = layer
				end
			end
		end
	end
end

function SceneBase:GetTransformGround()
	return self.tfGround
end

function SceneBase:GetDoor(id)
	return self.doorList[id]
end

function SceneBase:GetElevatorByinstanceID(instanceId)
	if self.elevatorColliderList ~= nil and self.elevatorColliderList[instanceId] ~= nil then
		return self:GetElevator(self.elevatorColliderList[instanceId])
	end

	return nil
end

function SceneBase:GetElevator(id)
	return self.elevatorList[id]
end

function SceneBase:GetCage(id)
	return self.cageList[id]
end

function SceneBase:GetStairKick(id)
	return self.stairKickList[id]
end

function SceneBase:GetCoverKick(id)
	return self.coverKickList[id]
end

function SceneBase:GetCrate(id)
	return self.crateList[id]
end

function SceneBase:GetGate(id)
	return self.gateList[id]
end

function SceneBase:GetBridge(id)
	return self.bridgeList[id]
end

function SceneBase:GetAltar(id)
	return self.altarList[id]
end

function SceneBase:StartAltar()
	if self.altarList ~= nil then
		for k, v in pairs(self.altarList) do
			v:Start()
		end
	end
end

function SceneBase:GetTimeLine(id)
	return self.timeLineList[id]
end

function SceneBase:GetStatue(id)
	return self.statueList[id]
end

function SceneBase:GetFountain(id)
	return self.fountainList[id]
end

function SceneBase:GetHoneypot(id)
	return self.honeypotList[id]
end

function SceneBase:SetPosition(pos)
	if self.tfSelf ~= nil then
		self.tfSelf.position = pos
	end
end

function SceneBase:SetSkyBox(tf_box)
	self.tfSkyBox = tf_box
end

function SceneBase:SetReflectionProbeGroup(tf_reflectionProbeGroup)
	self.tfReflectionProbeGroup = tf_reflectionProbeGroup
end

function SceneBase:ShowReflectionProbe(flg)
	if self.tfReflectionProbeGroup ~= nil then
		self.tfReflectionProbeGroup.gameObject:SetActive(flg)
	end
end

function SceneBase:SetDirLight(tf_light)
	self.tfDirLight = tf_light

	if self.tfDirLight ~= nil then
		local light = self.tfDirLight:GetComponent(typeof("UnityEngine.Light"))

		if light ~= nil then
			light.shadows = UnityEngine.LightShadows.None
			light.cullingMask = Common.GetOneBitLeftMove(SceneBase.DirLightLayerMask)
			light.enabled = true
		end
	end
end

function SceneBase:ShowDirLight(flg)
	if self.tfDirLight ~= nil then
		self.tfDirLight.gameObject:SetActive(flg)
	end
end

function SceneBase:SetPointLight(tf_light)
	self.tfPointLight = tf_light

	if self.tfPointLight ~= nil then
		self.pointLight = self.tfPointLight:GetComponent(typeof("UnityEngine.Light"))

		if self.pointLight ~= nil then
			self.pointLight.shadows = UnityEngine.LightShadows.None
			self.pointLight.range = SceneBase.PointLightRange
			self.pointLight.cullingMask = Common.GetOneBitLeftMove(SceneBase.PointLightMazeLayerMaskUltra)
			SceneBase.PointLightIntensity = self.pointLight.intensity
		end

		self.tfPointLight.gameObject:SetActive(true)

		self.pointLightEnable = true
	end
end

function SceneBase:ShowPointLight(flg, force)
	if self.tfPointLight ~= nil and self.pointLight ~= nil then
		if flg == true then
			if self.pointLightEnable == false or force == true then
				self.pointLightEnable = true

				if force == true then
					self.pointLightIntensity = SceneBase.PointLightIntensity
					self.pointLight.intensity = SceneBase.PointLightIntensity
				else
					self.pointLightIntensity = self.pointLight.intensity
				end

				self.pointLight.range = SceneBase.PointLightRange

				self.tfPointLight.gameObject:SetActive(true)
			end
		elseif self.pointLightEnable == true or force == true then
			self.pointLightEnable = false

			if force == true then
				self.pointLightIntensity = 0
				self.pointLight.intensity = 0

				self.tfPointLight.gameObject:SetActive(false)
			else
				self.pointLightIntensity = self.pointLight.intensity
			end
		end
	end
end

function SceneBase:SetPointLightPosition(pos)
	if self.tfPointLight ~= nil and self.pointLight ~= nil and self.pointLightEnable == true then
		self.tfPointLight.position = pos
	end
end

function SceneBase:SetMixLight(tf_light)
	self.tfMixLight = tf_light

	if self.tfMixLight ~= nil then
		self.mixLight = self.tfMixLight:GetComponent(typeof("UnityEngine.Light"))

		if self.mixLight ~= nil then
			self.mixLight.shadows = UnityEngine.LightShadows.None
			self.mixLight.cullingMask = Common.GetOneBitLeftMove(SceneBase.ShadowLightLayerMask)
		end

		self.mixLightDir:Set(0, 0, -1)
		self.mixLightDir:MulQuat(self.tfMixLight.transform.rotation)
		self.mixLightDir:SetNormalize()
	end
end

function SceneBase:GetMixLightDir()
	return self.mixLightDir
end

function SceneBase:ClearTrapAll()
	if self.trapList ~= nil then
		for id, trap in pairs(self.trapList) do
			if trap ~= nil then
				trap:Exit()
			end
		end

		self.trapList = nil
	end
end

function SceneBase:AddTrap(trapId, pos, fromVPlayer, fromTeamId)
	local trapData = MS_TrapData.GetTrapData(trapId)
	local trap = require("LuaScript/Logic/Trap/Trap" .. trapData.Type)
	local tmpTrap = trap:new(trapId, pos, fromVPlayer, fromTeamId)

	if tmpTrap ~= nil then
		if self.trapList == nil then
			self.trapList = {}
		end

		table.insert(self.trapList, tmpTrap)
	end
end

function SceneBase:CheckTrap(player)
	if player == nil then
		return
	end

	if self.trapList ~= nil then
		for i = 1, #self.trapList do
			local trap = self.trapList[i]

			if trap ~= nil then
				trap:CheckPlayer(player)
			end
		end
	end
end

function SceneBase:UpdateLoadArea()
	for id, timeLine in pairs(self.timeLineList) do
		if timeLine ~= nil then
			timeLine:Update()
		end
	end
end

function SceneBase:UpdateLogic()
	local deleteTrap

	if self.trapList ~= nil then
		for i = 1, #self.trapList do
			local trap = self.trapList[i]

			if trap ~= nil then
				local ret = trap:Update()

				if ret == false then
					if deleteTrap == nil then
						deleteTrap = {}
					end

					table.insert(deleteTrap, i)
				end
			end
		end
	end

	if deleteTrap ~= nil then
		for i, index in pairs(deleteTrap) do
			local trap = self.trapList[index]

			if trap ~= nil then
				trap:Exit()

				trap = nil
			end

			table.remove(self.trapList, index)
		end

		deleteTrap = nil
	end

	for id, trick in pairs(self.trickList) do
		if trick ~= nil then
			trick:Update()
		end
	end

	for id, elevator in pairs(self.elevatorList) do
		if elevator ~= nil then
			elevator:Update()
		end
	end

	for id, cage in pairs(self.cageList) do
		if cage ~= nil then
			cage:Update()
		end
	end

	for id, timeLine in pairs(self.timeLineList) do
		if timeLine ~= nil then
			timeLine:Update()
		end
	end

	for id, door in pairs(self.doorList) do
		if door ~= nil then
			door:Update()
		end
	end

	if self.exposureStart == true then
		local tmpSpeed = self.exposureSpeed * ControllerMain.GetLogicDeltaTime()

		self.exposureValue = self.exposureValue - tmpSpeed

		if self.exposureValue <= SceneBase.AutoExposureValueTarget then
			self.exposureValue = SceneBase.AutoExposureValueTarget
		end

		for i = SceneBase.PostProcessTypeStart, SceneBase.PostProcessTypeEnd do
			if self.postProcessControllerList[i] ~= nil then
				self.postProcessControllerList[i]:SetAutoExposureMinMax(self.exposureValue, self.exposureValue)
			end
		end
	elseif self.exposureRecovery == true then
		local tmpSpeed = SceneBase.AutoExposureRecoverySpeed * ControllerMain.GetLogicDeltaTime()

		self.exposureValue = self.exposureValue + tmpSpeed

		if self.exposureValue >= 0 then
			self.exposureValue = 0
			self.exposureRecovery = false

			for i = SceneBase.PostProcessTypeStart, SceneBase.PostProcessTypeEnd do
				if self.postProcessControllerList[i] ~= nil then
					self.postProcessControllerList[i]:SetAutoExposureMinMax(self.exposureValue, self.exposureValue)
					self.postProcessControllerList[i]:SetAutoExposureEnable(false)
				end
			end
		else
			for i = SceneBase.PostProcessTypeStart, SceneBase.PostProcessTypeEnd do
				if self.postProcessControllerList[i] ~= nil then
					self.postProcessControllerList[i]:SetAutoExposureMinMax(self.exposureValue, self.exposureValue)
				end
			end
		end
	end
end

function SceneBase:UpdateRender()
	if self.pointLight ~= nil then
		if self.pointLightEnable == false then
			if self.pointLightIntensity > 0 then
				self.pointLightIntensity = self.pointLightIntensity - SceneBase.PointLightIntensitySpeed * ControllerMain.GetLogicDeltaTime()

				if self.pointLightIntensity <= 0 then
					self.pointLightIntensity = 0
					self.pointLight.intensity = 0

					self.tfPointLight.gameObject:SetActive(false)
				else
					self.pointLight.intensity = self.pointLightIntensity
				end
			end
		elseif self.pointLightEnable == true and self.pointLightIntensity < SceneBase.PointLightIntensity then
			self.pointLightIntensity = self.pointLightIntensity + SceneBase.PointLightIntensitySpeed * ControllerMain.GetLogicDeltaTime()

			if self.pointLightIntensity >= SceneBase.PointLightIntensity then
				self.pointLightIntensity = SceneBase.PointLightIntensity
			end

			self.pointLight.intensity = self.pointLightIntensity
		end
	end
end

function SceneBase:UpdateQuality(force)
	if force == false and self.qualityLevel == LS_Setting.graphics.quality then
		return
	end

	self.qualityLevel = LS_Setting.graphics.quality

	if LS_Setting.graphics.reflection > 0 then
		if self.tfWater ~= nil then
			self.tfWater.gameObject:SetActive(false)
		end

		if self.tfWaterPro ~= nil then
			self.tfWaterPro.gameObject:SetActive(true)
		end
	else
		if self.tfWater ~= nil then
			self.tfWater.gameObject:SetActive(true)
		end

		if self.tfWaterPro ~= nil then
			self.tfWaterPro.gameObject:SetActive(false)
		end
	end

	self:SetAmbientOcclusionEnable(LS_Setting.graphics.ambientocclusion > 0)
	self:UpdatePlantQuality()
end

function SceneBase:LateUpdateRender()
	for id, trick in pairs(self.trickList) do
		if trick ~= nil then
			trick:LateUpdate()
		end
	end
end

function SceneBase:GetBornSanPosition(nowPos, nowForward)
	local bornSanList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.BornSan)
	local disMin = 9999
	local retId = 0
	local retPos = Vector3.s_zero
	local ret = {}

	if bornSanList ~= nil then
		for id, locatorData in pairs(bornSanList) do
			local pos = locatorData.Position
			local dis = Vector3.Distance(nowPos, pos)

			if dis < SceneDefine.DistanceForSanCreateMax then
				local find = false

				for i = 1, #ret do
					local tmpData = ret[i]

					if dis < tmpData[2] then
						table.insert(ret, i, {
							id,
							dis
						})

						find = true

						break
					end
				end

				if find == false then
					table.insert(ret, {
						id,
						dis
					})
				end
			end
		end
	end

	if #ret > 0 then
		for i = 1, #ret do
			local tmpData = ret[i]

			ret[i] = bornSanList[tmpData[1]].Position
		end
	end

	return ret
end

function SceneBase:CheckSave(nowPos, nowForward)
	local saveDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Save)

	if saveDataList == nil then
		return 0, Vector3.s_zero
	end

	local retId = 0
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for saveId, locatorData in pairs(saveDataList) do
			local pos = locatorData.Position
			local dis = Vector3.DistanceSquare(nowPos, pos)

			if not (dis < SceneDefine.IconDistanceForSave * SceneDefine.IconDistanceForSave) or FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and saveId == SceneBase.AltarForNextStageId and FS_UserData.story:IsSelectStageGameOver() == false then
				-- block empty
			else
				self.gameController:ShowIcon(MS_SceneData.LocatorType.Save, saveId, 0, pos.x, pos.y + SceneDefine.IconHeightForSave, pos.z)
			end

			if retId <= 0 and dis < SceneDefine.DistanceForSave * SceneDefine.DistanceForSave then
				local tmpDir = nowPos - pos

				tmpDir.y = 0

				if Vector3.Dot(tmpDir, nowForward) <= 0 then
					tmpDir = nil
					retId = saveId
					retPos = pos
				end

				tmpDir = nil
			end
		end
	end

	return retId, retPos
end

function SceneBase:GetSaveData(id)
	if id > 0 then
		local saveDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Save)

		if saveDataList[id] ~= nil then
			return saveDataList[id]
		end
	end

	return nil
end

function SceneBase:CheckCarriage(nowPos, nowForward)
	local carriageDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Carriage)
	local retId = 0
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for carriageId, locatorData in pairs(carriageDataList) do
			local pos = locatorData.Position
			local dis = Vector3.DistanceSquare(nowPos, pos)

			if dis < SceneDefine.IconDistanceForCarriage * SceneDefine.IconDistanceForCarriage then
				self.gameController:ShowIcon(MS_SceneData.LocatorType.Carriage, carriageId, 0, pos.x, pos.y + SceneDefine.IconHeightForCarriage, pos.z)
			end

			if retId <= 0 and dis < SceneDefine.DistanceForCarriage * SceneDefine.DistanceForCarriage then
				local tmpDir = nowPos - pos

				tmpDir.y = 0

				if Vector3.Dot(tmpDir, nowForward) <= 0 then
					tmpDir = nil
					retId = carriageId
					retPos = pos
				end

				tmpDir = nil
			end
		end
	end

	return retId, retPos
end

function SceneBase:CheckElevator(nowPos, nowForward)
	local elevatorDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Elevator)
	local retId = 0
	local retTargetFloor = 0
	local retInner = 0
	local retPos = Vector3.s_zero
	local retIndex = 0
	local autoFlg = false

	if self.gameController ~= nil then
		for id, locatorData in pairs(elevatorDataList) do
			local elevator = self:GetElevator(id)

			if elevator ~= nil and elevator:IsRunning() == false then
				local floorNow = elevator:GetFloor()
				local elevatorData = MS_StoryElevator.GetStoryElevator(self.storyId, id)

				if elevatorData ~= nil and self.gameController:CheckShowQuestComplete(elevatorData.ShowQuestId) == true and self.gameController:CheckHideQuestComplete(elevatorData.HideQuestId) == false then
					for i = 1, #locatorData.SwitchIndex do
						local index = locatorData.SwitchIndex[i]
						local pos = locatorData["Position" .. index]
						local look = locatorData["Orientation" .. index]
						local switchFloorTarget = tonumber(locatorData["FloorTarget" .. index])
						local switchFloorNow = tonumber(locatorData["FloorNow" .. index])
						local inner = tonumber(locatorData["Inner" .. index])
						local dontNeedDir = tonumber(locatorData["DontNeedDir" .. index]) == 1
						local autoRange = tonumber(locatorData["AutoRange" .. index])
						local checkFlg = true

						if inner <= 0 and floorNow == switchFloorNow then
							checkFlg = false
						elseif inner > 0 and floorNow ~= switchFloorNow then
							checkFlg = false
						end

						if checkFlg == true then
							local dis = Vector3.DistanceSquare(nowPos, pos)

							if autoRange ~= nil and autoRange > 0 then
								local hightAbs = Mathf.Abs(nowPos.y - pos.y)

								if dis < autoRange * autoRange and hightAbs < 2 then
									retId = id
									retTargetFloor = switchFloorTarget
									retInner = inner
									retPos = pos
									retIndex = index
									autoFlg = true
								end
							else
								if dis < SceneDefine.IconDistanceForElevator * SceneDefine.IconDistanceForElevator then
									self.gameController:ShowIcon(MS_SceneData.LocatorType.Elevator, id, index, pos.x, pos.y + SceneDefine.IconHeightForElevator, pos.z)
								end

								if retId <= 0 and dis < SceneDefine.DistanceForElevator * SceneDefine.DistanceForElevator then
									local tmpDir = nowPos - pos

									tmpDir.y = 0

									if dontNeedDir and Vector3.Dot(tmpDir, nowForward) <= 0 or Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
										tmpDir = nil
										retId = id
										retTargetFloor = switchFloorTarget
										retInner = inner
										retPos = pos
										retIndex = index
										autoFlg = false
									end

									tmpDir = nil
								end
							end
						end
					end
				end
			end
		end
	end

	return retId, retTargetFloor, retInner, retPos, retIndex, autoFlg
end

function SceneBase:CheckCage(nowPos, nowForward)
	local cageDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Cage)
	local retId = 0
	local retIndex = 0
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for id, locatorData in pairs(cageDataList) do
			for i = 1, #locatorData.SwitchIndex do
				local index = locatorData.SwitchIndex[i]
				local pos = locatorData["Position" .. index]
				local look = locatorData["Orientation" .. index]
				local dis = Vector3.DistanceSquare(nowPos, pos)
				local standPosition = locatorData["StandPosition" .. index]
				local standLook = locatorData["StandOrientation" .. index]

				if dis < SceneDefine.IconDistanceForCage * SceneDefine.IconDistanceForCage then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.Cage, id, index, pos.x, pos.y + SceneDefine.IconHeightForCage, pos.z)
				end

				if retId <= 0 and dis < SceneDefine.DistanceForCage * SceneDefine.DistanceForCage then
					local tmpDir = nowPos - pos

					tmpDir.y = 0

					if index == 1 then
						retId = id
						retIndex = index
						retPos = pos
					end

					if Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
						tmpDir = nil
						retId = id
						retIndex = index
						retPos = pos
					end

					tmpDir = nil
				end
			end
		end
	end

	return retId, retIndex, retPos
end

function SceneBase:CheckBridge(nowPos, nowForward)
	local bridgeDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Bridge)
	local retId = 0
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for id, locatorData in pairs(bridgeDataList) do
			local bridge = self:GetBridge(id)

			if bridge ~= nil and bridge:IsOpening() == false then
				local pos = locatorData.Position
				local look = locatorData.Orientation
				local dis = Vector3.DistanceSquare(nowPos, pos)

				if dis < SceneDefine.IconDistanceForBridge * SceneDefine.IconDistanceForBridge then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.Bridge, id, 0, pos.x, pos.y + SceneDefine.IconHeightForBridge, pos.z)
				end

				if retId <= 0 and dis < SceneDefine.DistanceForBridge * SceneDefine.DistanceForBridge then
					local tmpDir = nowPos - pos

					tmpDir.y = 0

					if Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
						tmpDir = nil
						retId = id
						retPos = pos
					end

					tmpDir = nil
				end
			end
		end
	end

	return retId, retPos
end

function SceneBase:CheckDoor(nowPos, nowForward)
	local doorDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Door)
	local retId = 0
	local switchId = 0
	local aniType = 0
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for id, locatorData in pairs(doorDataList) do
			local door = self:GetDoor(id)

			if door ~= nil and (door:IsOpening() == false or door:IsSwitchable()) and door:IsRunning() == false then
				for i = 1, #locatorData.SwitchIndex do
					local index = locatorData.SwitchIndex[i]
					local pos = locatorData["Position" .. index]
					local look = locatorData["Orientation" .. index]
					local dis = Vector3.DistanceSquare(nowPos, pos)

					if dis < SceneDefine.IconDistanceForDoor * SceneDefine.IconDistanceForDoor then
						self.gameController:ShowIcon(MS_SceneData.LocatorType.Door, id, i, pos.x, pos.y + SceneDefine.IconHeightForDoor, pos.z)
					end

					if retId <= 0 and dis < SceneDefine.DistanceForDoor * SceneDefine.DistanceForDoor then
						local tmpDir = nowPos - pos

						tmpDir.y = 0

						if Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
							tmpDir = nil
							retId = id
							switchId = index
							retPos = pos

							if locatorData["AnimatorType" .. index] ~= nil then
								aniType = locatorData["AnimatorType" .. index]
							end
						end

						tmpDir = nil
					end
				end
			end
		end
	end

	return retId, retPos, switchId, aniType
end

function SceneBase:CheckDoorHint(nowPos, nowForward)
	local doorDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Door)

	for id, locatorData in pairs(doorDataList) do
		local door = self:GetDoor(id)

		if door ~= nil and door:IsOpening() == false then
			local pos = locatorData.HintPosition
			local look = locatorData.HintOrientation
			local dis = Vector3.DistanceSquare(nowPos, pos)

			if dis < SceneDefine.DistanceForDoor * SceneDefine.DistanceForDoor then
				local tmpDir = nowPos - pos

				tmpDir.y = 0

				if Vector3.Dot(tmpDir, look) > 0 and Vector3.Dot(nowForward, look) < 0 then
					tmpDir = nil

					return id, pos, true
				elseif Vector3.Dot(tmpDir, look) < 0 and Vector3.Dot(nowForward, look) > 0 then
					tmpDir = nil

					return id, pos, false
				end

				tmpDir = nil
			end
		end
	end

	return 0, Vector3.s_zero, true
end

function SceneBase:CheckGate(nowPos, nowForward)
	local gateDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Gate)
	local retId = 0
	local retStandPos = Vector3.s_zero
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for id, locatorData in pairs(gateDataList) do
			local gate = self:GetGate(id)

			if gate ~= nil and gate:IsOpening() == false then
				local pos = locatorData.Position
				local look = locatorData.Orientation
				local standPos = locatorData.StandPosition
				local dis = Vector3.DistanceSquare(nowPos, pos)

				if dis < SceneDefine.IconDistanceForGate * SceneDefine.IconDistanceForGate then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.Gate, id, 0, pos.x, pos.y + SceneDefine.IconHeightForGate, pos.z)
				end

				if retId <= 0 and dis < SceneDefine.DistanceForGate * SceneDefine.DistanceForGate then
					local tmpDir = nowPos - pos

					tmpDir.y = 0

					if Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
						tmpDir = nil
						retId = id
						retStandPos = standPos
						retPos = pos
					end

					tmpDir = nil
				end
			end
		end
	end

	return retId, retStandPos, retPos
end

function SceneBase:CheckGateHint(nowPos, nowForward)
	local gateDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Gate)

	for id, locatorData in pairs(gateDataList) do
		local gate = self:GetGate(id)

		if gate ~= nil and gate:IsOpening() == false then
			local pos = locatorData.HintPosition
			local look = locatorData.HintOrientation
			local dis = Vector3.DistanceSquare(nowPos, pos)

			if dis < SceneDefine.DistanceForGate * SceneDefine.DistanceForGate then
				local tmpDir = nowPos - pos

				tmpDir.y = 0

				if Vector3.Dot(tmpDir, look) > 0 and Vector3.Dot(nowForward, look) < 0 then
					tmpDir = nil

					return id, pos, true
				elseif Vector3.Dot(tmpDir, look) < 0 and Vector3.Dot(nowForward, look) > 0 then
					tmpDir = nil

					return id, pos, false
				end

				tmpDir = nil
			end
		end
	end

	return 0, Vector3.s_zero, true
end

function SceneBase:CheckVirtualWall(nowPos, nowForward)
	local virtualWallDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.VirtualWall)
	local retId = 0
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for id, locatorData in pairs(virtualWallDataList) do
			local pos = locatorData.Position
			local look = locatorData.Orientation
			local dis = Vector3.DistanceSquare(nowPos, pos)

			if dis < SceneDefine.IconDistanceForVirtualWall * SceneDefine.IconDistanceForVirtualWall then
				local virtualWallData = MS_StoryVirtualWall.GetStoryVirtualWall(self.storyId, id)

				if virtualWallData ~= nil and self.gameController:CheckShowQuestComplete(virtualWallData.ShowQuestId) == true and self.gameController:CheckHideQuestComplete(virtualWallData.HideQuestId) == false then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.VirtualWall, id, 0, pos.x, pos.y + SceneDefine.IconHeightForVirtualWall, pos.z)
				end
			end

			if retId <= 0 and dis < SceneDefine.DistanceForVirtualWall * SceneDefine.DistanceForVirtualWall then
				local tmpDir = nowPos - pos

				tmpDir.y = 0

				if Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
					tmpDir = nil
					retId = id
					retPos = pos
				end

				tmpDir = nil
			end
		end
	end

	return retId, retPos
end

function SceneBase:CheckVirtualWallHint(nowPos, nowForward)
	local virtualWallDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.VirtualWall)
	local retId = 0
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for id, locatorData in pairs(virtualWallDataList) do
			local pos = locatorData.HintPosition
			local look = locatorData.HintOrientation
			local dis = Vector3.DistanceSquare(nowPos, pos)

			if dis < SceneDefine.IconDistanceForVirtualWall * SceneDefine.IconDistanceForVirtualWall then
				local virtualWallHintData = MS_StoryVirtualWallHint.GetStoryVirtualWallHint(self.storyId, id)

				if virtualWallHintData ~= nil and self.gameController:CheckShowQuestComplete(virtualWallHintData.ShowQuestId) == true and self.gameController:CheckHideQuestComplete(virtualWallHintData.HideQuestId) == false and (virtualWallHintData.DialogId > 0 or virtualWallHintData.CompleteQuestId ~= "") then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.VirtualWall, id, 0, pos.x, pos.y + SceneDefine.IconHeightForVirtualWall, pos.z)
				end
			end

			if retId <= 0 and dis < SceneDefine.DistanceForVirtualWall * SceneDefine.DistanceForVirtualWall then
				local tmpDir = nowPos - pos

				tmpDir.y = 0

				if Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
					tmpDir = nil
					retId = id
					retPos = pos
				end

				tmpDir = nil
			end
		end
	end

	return retId, retPos
end

function SceneBase:CheckStairKick(nowPos, nowForward)
	local stairKickDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.StairKick)
	local retId = 0
	local retStandPos = Vector3.s_zero
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for id, locatorData in pairs(stairKickDataList) do
			local stairKick = self:GetStairKick(id)

			if stairKick ~= nil and stairKick:IsOpening() == false then
				local pos = locatorData.Position
				local look = locatorData.Orientation
				local standPos = locatorData.StandPosition
				local dis = Vector3.DistanceSquare(nowPos, pos)

				if dis < SceneDefine.IconDistanceForStairKick * SceneDefine.IconDistanceForStairKick then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.StairKick, id, 0, pos.x, pos.y + SceneDefine.IconHeightForStairKick, pos.z)
				end

				if retId <= 0 and dis < SceneDefine.DistanceForStairKick * SceneDefine.DistanceForStairKick then
					local tmpDir = nowPos - pos

					tmpDir.y = 0

					if Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
						tmpDir = nil
						retId = id
						retStandPos = standPos
						retPos = pos
					end

					tmpDir = nil
				end
			end
		end
	end

	return retId, retStandPos, retPos
end

function SceneBase:CheckCoverKick(nowPos, nowForward)
	local coverKickDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.CoverKick)
	local retId = 0
	local retStandPos = Vector3.s_zero
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for id, locatorData in pairs(coverKickDataList) do
			local coverKick = self:GetCoverKick(id)

			if coverKick ~= nil and coverKick:IsOpening() == false then
				local pos = locatorData.Position
				local look = locatorData.Orientation
				local standPos = locatorData.StandPosition
				local dis = Vector3.DistanceSquare(nowPos, pos)

				if dis < SceneDefine.IconDistanceForCoverKick * SceneDefine.IconDistanceForCoverKick then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.CoverKick, id, 0, pos.x, pos.y + SceneDefine.IconHeightForCoverKick, pos.z)
				end

				if dis < SceneDefine.DistanceForCoverKick * SceneDefine.DistanceForCoverKick then
					local tmpDir = nowPos - pos

					tmpDir.y = 0

					if Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
						tmpDir = nil
						retId = id
						retStandPos = standPos
						retPos = pos
					end

					tmpDir = nil
				end
			end
		end
	end

	return retId, retStandPos, retPos
end

function SceneBase:CheckCoverKickHint(nowPos, nowForward)
	local coverKickDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.CoverKick)

	for id, locatorData in pairs(coverKickDataList) do
		local coverKick = self:GetCoverKick(id)

		if coverKick ~= nil and coverKick:IsOpening() == false then
			local pos = locatorData.HintPosition
			local look = locatorData.HintOrientation
			local dis = Vector3.DistanceSquare(nowPos, pos)

			if dis < SceneDefine.DistanceForCoverKick * SceneDefine.DistanceForCoverKick then
				local tmpDir = pos - nowPos

				tmpDir.y = 0

				if Vector3.Dot(nowForward, tmpDir) > 0 then
					tmpDir = nil

					return id, pos
				end

				tmpDir = nil
			end
		end
	end

	return 0, Vector3.s_zero
end

function SceneBase:AddEntrance(nowPos, nowForward, type)
	if self.entranceList ~= nil then
		return
	end

	self.entranceList = {}

	local entrance = Entrance:new(nowPos, type)

	if entrance ~= nil then
		table.insert(self.entranceList, entrance)
	end
end

function SceneBase:AppendEntrance(nowPos, nowForward, type)
	if self.entranceList == nil then
		return
	end

	local entrance = Entrance:new(nowPos, type)

	if entrance ~= nil then
		table.insert(self.entranceList, entrance)
	end
end

function SceneBase:ChangeEntrancePositionByType(type, pos)
	if self.entranceList ~= nil then
		for id, entrance in pairs(self.entranceList) do
			if entrance ~= nil and entrance:GetType() == type then
				entrance:SetPosition(pos)
			end
		end
	end
end

function SceneBase:GetEntranceType(id)
	if self.entranceList ~= nil and self.entranceList[id] ~= nil then
		return self.entranceList[id]:GetType()
	end

	return Entrance.Type.Common
end

function SceneBase:CheckEntrance(nowPos, nowForward)
	local retId = 0
	local retPos = Vector3.s_zero

	if self.entranceList ~= nil then
		for id, entrance in pairs(self.entranceList) do
			if entrance ~= nil then
				local pos = entrance:GetPosition()
				local disSqr = Vector3.DistanceSquare(nowPos, pos)

				if retId <= 0 and disSqr < SceneDefine.DistanceForEntrance * SceneDefine.DistanceForEntrance then
					retId = id
					retPos = pos
				end

				if disSqr < SceneDefine.IconDistanceForEntrance * SceneDefine.IconDistanceForEntrance then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.Entrance, id, 0, pos.x, pos.y + SceneDefine.IconHeightForEntrance, pos.z)
				end
			end
		end
	end

	return retId, retPos
end

function SceneBase:CheckCrate(nowPos, nowForward)
	local crateDataList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Crate)
	local retId = 0
	local retStandPos = Vector3.s_zero
	local retPos = Vector3.s_zero

	if self.crateList ~= nil then
		for id, crate in pairs(self.crateList) do
			if crate ~= nil and crate:IsShow() == true and crate:IsOpening() == false and crate:IsLocking() == false then
				local pos = crate:GetPosition()
				local look = crate:GetForward()
				local standPos = crate:GetStandPosition()
				local dis = Vector3.DistanceSquare(nowPos, pos)

				if dis < SceneDefine.IconDistanceForCrate * SceneDefine.IconDistanceForCrate then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.Crate, id, 0, pos.x, pos.y + SceneDefine.IconHeightForCrate, pos.z)
				end

				if retId <= 0 and dis < SceneDefine.DistanceForCrate * SceneDefine.DistanceForCrate then
					local tmpDir = nowPos - pos

					tmpDir.y = 0

					if Vector3.Dot(tmpDir, look) >= 0 and Vector3.Dot(nowForward, look) <= 0 then
						tmpDir = nil
						retId = id
						retStandPos = standPos
						retPos = pos
					end

					tmpDir = nil
				end
			end
		end
	end

	return retId, retStandPos, retPos
end

function SceneBase:CheckStatue(nowPos, nowForward)
	local retId = 0
	local retPos = Vector3.s_zero
	local retLook = Vector3.s_zero

	if self.statueList ~= nil then
		for id, statue in pairs(self.statueList) do
			if statue ~= nil and statue:IsShow() == true and statue:IsOpening() == true then
				local pos = statue:GetPosition()
				local look = statue:GetForward()
				local disSqr = Vector3.DistanceSquare(nowPos, pos)

				if retId <= 0 and disSqr < SceneDefine.DistanceForStatue * SceneDefine.DistanceForStatue then
					local tmpDir = nowPos - pos

					tmpDir.y = 0

					if Vector3.Dot(tmpDir, nowForward) <= 0 then
						tmpDir = nil
						retId = id
						retPos = pos
						retLook = look
					end

					tmpDir = nil
				end

				if disSqr < SceneDefine.IconDistanceForStatue * SceneDefine.IconDistanceForStatue then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.Statue, id, 0, pos.x, pos.y + SceneDefine.IconHeightForStatue, pos.z)
				end
			end
		end
	end

	return retId, retPos, retLook
end

function SceneBase:CheckFountain(nowPos, nowForward)
	local retId = 0
	local retPos = Vector3.s_zero

	if self.fountainList ~= nil then
		for id, fountain in pairs(self.fountainList) do
			if fountain ~= nil and fountain:IsShow() == true and fountain:IsOpening() == true then
				local pos = fountain:GetPosition()
				local disSqr = Vector3.DistanceSquare(nowPos, pos)

				if retId <= 0 and disSqr < SceneDefine.DistanceForFountain * SceneDefine.DistanceForFountain then
					local tmpDir = nowPos - pos

					tmpDir.y = 0

					if Vector3.Dot(tmpDir, nowForward) <= 0 then
						tmpDir = nil
						retId = id
						retPos = pos
					end

					tmpDir = nil
				end

				if disSqr < SceneDefine.IconDistanceForFountain * SceneDefine.IconDistanceForFountain then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.Fountain, id, 0, pos.x, pos.y + SceneDefine.IconHeightForFountain, pos.z)
				end
			end
		end
	end

	return retId, retPos
end

function SceneBase:CheckHoneypot(nowPos, nowForward)
	local retId = 0
	local retPos = Vector3.s_zero

	if self.honeypotList ~= nil then
		for id, honeypot in pairs(self.honeypotList) do
			if honeypot ~= nil and honeypot:IsShow() == true and honeypot:IsOpening() == true then
				local pos = honeypot:GetPosition()
				local disSqr = Vector3.DistanceSquare(nowPos, pos)

				if retId <= 0 and disSqr < SceneDefine.DistanceForHoneypot * SceneDefine.DistanceForHoneypot then
					local tmpDir = nowPos - pos

					tmpDir.y = 0

					if Vector3.Dot(tmpDir, nowForward) <= 0 then
						tmpDir = nil
						retId = id
						retPos = pos
					end

					tmpDir = nil
				end

				if disSqr < SceneDefine.IconDistanceForHoneypot * SceneDefine.IconDistanceForHoneypot then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.Honeypot, id, 0, pos.x, pos.y + SceneDefine.IconHeightForHoneypot, pos.z)
				end
			end
		end
	end

	return retId, retPos
end

function SceneBase:CheckBonefire(nowPos, nowForward)
	local bonefireList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Bonefire)

	if bonefireList == nil then
		return 0, Vector3.s_zero
	end

	local retId = 0
	local retPos = Vector3.s_zero

	if self.gameController ~= nil then
		for bonefireId, locatorData in pairs(bonefireList) do
			local bonefireData = MS_StoryMazeBonefire.GetStoryBonefire(self.storyId, bonefireId)

			if bonefireData ~= nil and self.gameController:CheckShowQuestComplete(bonefireData.ShowQuestId) == true and self.gameController:CheckHideQuestComplete(bonefireData.HideQuestId) == false then
				local pos = locatorData.Position
				local dis = Vector3.DistanceSquare(nowPos, pos)

				if dis < SceneDefine.IconDistanceForBonefire * SceneDefine.IconDistanceForBonefire then
					self.gameController:ShowIcon(MS_SceneData.LocatorType.Bonefire, bonefireId, 0, pos.x, pos.y + SceneDefine.IconHeightForBonefire, pos.z)
				end

				if retId <= 0 and dis < SceneDefine.DistanceForBonefire * SceneDefine.DistanceForBonefire then
					local tmpDir = nowPos - pos

					tmpDir.y = 0

					if Vector3.Dot(tmpDir, nowForward) <= 0 then
						tmpDir = nil
						retId = bonefireId
						retPos = pos
					end

					tmpDir = nil
				end
			end
		end
	end

	return retId, retPos
end

function SceneBase:CheckStairTouch(nowPos, nowForward)
	local stairList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.Stair)

	if stairList ~= nil then
		for id, locatorData in pairs(stairList) do
			local tmpDis = Vector3.DistanceSquare(locatorData.StairDownPos, nowPos)

			if tmpDis <= SceneDefine.TouchStairRange * SceneDefine.TouchStairRange and Mathf.Abs(locatorData.StairDownPos.y - nowPos.y) <= SceneDefine.TouchStairRangeY then
				return id, AnimalBase_Define.StairTouch.Down, locatorData.StairDownPos, locatorData.StairDownRot
			end

			tmpDis = Vector3.DistanceSquare(locatorData.StairUpPos, nowPos)

			if tmpDis <= SceneDefine.TouchStairRange * SceneDefine.TouchStairRange and Mathf.Abs(locatorData.StairUpPos.y - nowPos.y) <= SceneDefine.TouchStairRangeY then
				return id, AnimalBase_Define.StairTouch.Up, locatorData.StairUpPos, locatorData.StairUpRot
			end
		end
	end

	return 0, AnimalBase_Define.StairTouch.Empty, nil
end

function SceneBase:CheckStairArrive(id, type, pos)
	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Stair, id)

	if locatorData == nil then
		return false
	end

	local stairY = 0

	if type == AnimalBase_Define.StairTouch.Up then
		stairY = locatorData.StairMaxY

		if pos.y >= stairY - SceneDefine.TouchStairRangeY then
			return true
		end
	elseif type == AnimalBase_Define.StairTouch.Down then
		stairY = locatorData.StairMinY

		if pos.y <= stairY + SceneDefine.TouchStairRangeY then
			return true
		end
	end

	return false
end

function SceneBase:GetStairStartTargetPosition(id, pos, type)
	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Stair, id)

	if locatorData == nil then
		return
	end

	if type == AnimalBase_Define.StairTouch.Up then
		pos.x = locatorData.StairPosX
		pos.z = locatorData.StairPosZ
		pos.y = locatorData.StairMinY
	elseif type == AnimalBase_Define.StairTouch.Down then
		pos.x = locatorData.StairPosX
		pos.z = locatorData.StairPosZ
		pos.y = locatorData.StairMaxY
	end
end

function SceneBase:GetStairEndPosition(id, pos, type)
	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Stair, id)

	if locatorData == nil then
		return
	end

	if type == AnimalBase_Define.StairTouch.Up then
		pos:SetVector3(locatorData.StairDownPos)
	elseif type == AnimalBase_Define.StairTouch.Down then
		pos:SetVector3(locatorData.StairUpPos)
	end
end

function SceneBase:GetSceneSkillPointPos(id)
	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.SkillPoint, id)

	if locatorData ~= nil then
		return locatorData.Position
	end

	return Vector3.s_zero
end

function SceneBase:GetSceneSkillPointLook(id)
	local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.SkillPoint, id)

	if locatorData ~= nil then
		return locatorData.Orientation
	end

	return Vector3.s_forward
end

function SceneBase:GetInProtectSanAreaId(hostPos)
	local sanList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.ProtectSan)

	if sanList ~= nil then
		for id, locatorData in pairs(sanList) do
			local pos = locatorData.Position
			local radius = locatorData.Radius
			local dis = Vector3.DistanceSquare(hostPos, pos)

			if dis <= radius * radius then
				return id
			end
		end
	end

	return 0
end

function SceneBase:GetEnemySpaceList(pos)
	local retIdList
	local ret = false
	local posX = pos.x
	local posY = pos.y
	local posZ = pos.z
	local spaceList = MS_SceneData.GetGroupData(MS_SceneData.LocatorType.EnemySpace)

	for id, locatorData in pairs(spaceList) do
		local point1 = locatorData.Position1
		local point1_x = point1.x
		local point1_y = point1.y
		local point1_z = point1.z
		local point2 = locatorData.Position2

		ret = self:CheckParallelSpace(posX, posY, posZ, point1_x, point1_y, point1_z, point2.x, point2.y, point2.z)

		if ret == true then
			point2 = locatorData.Position3
			ret = self:CheckParallelSpace(posX, posY, posZ, point1_x, point1_y, point1_z, point2.x, point2.y, point2.z)

			if ret == true then
				point2 = locatorData.Position4
				ret = self:CheckParallelSpace(posX, posY, posZ, point1_x, point1_y, point1_z, point2.x, point2.y, point2.z)

				if ret == true then
					local locatorList = locatorData.EnemySpace

					if locatorList ~= nil and #locatorList > 0 then
						if retIdList == nil then
							retIdList = {}
						end

						for i = 1, #locatorList do
							retIdList[locatorList[i]] = 1
						end
					end
				end
			end
		end
	end

	return retIdList
end

function SceneBase:CheckParallelSpace(posX, posY, posZ, x1, y1, z1, x2, y2, z2)
	if DebugShowAllMonster == true then
		return true
	end

	local dot1 = (x1 - x2) * (posX - x1) + (y1 - y2) * (posY - y1) + (z1 - z2) * (posZ - z1)
	local dot2 = (x1 - x2) * (posX - x2) + (y1 - y2) * (posY - y2) + (z1 - z2) * (posZ - z2)

	if dot1 * dot2 >= 0 then
		return false
	end

	return true
end

function SceneBase:GetWall(wallName)
	local ret

	if ret == nil and self.tfVirtualWallTransparentRoot ~= nil then
		ret = self.tfVirtualWallTransparentRoot:Find(wallName)
	end

	if ret == nil and self.tfVirtualWallOpaqueRoot ~= nil then
		ret = self.tfVirtualWallOpaqueRoot:Find(wallName)
	end

	if ret == nil and self.tfVirtualWallInvisibleRoot ~= nil then
		ret = self.tfVirtualWallInvisibleRoot:Find(wallName)
	end

	if ret == nil and self.tfVirtualWallMonsterRoot ~= nil then
		ret = self.tfVirtualWallMonsterRoot:Find(wallName)
	end

	return ret
end

function SceneBase:GetGroundPosition(pos, offsetY, dis)
	local ret = XPhysics.Raycast(pos.x, offsetY, pos.z, 0, -1, 0, dis, self.groundLayerMask)

	if ret == true then
		local posX = 0
		local posY = 0
		local posZ = 0
		local normalX = 0
		local normalY = 0
		local normalZ = 0
		local hitDistance = 0
		local hitLayer = 0
		local hitInstanceID = 0
		local hitOwnerId = 0

		ret, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitInstanceID, hitOwnerId = XPhysics.GetHitInfo(posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitInstanceID, hitOwnerId)

		if ret == true and hitInstanceID > 0 then
			local nearestPos = Vector3.New(posX, posY, posZ)
			local nearestNormal = Vector3.New(normalX, normalY, normalZ)

			nearestNormal:SetNormalize()

			return ret, nearestPos, nearestNormal, hitInstanceID
		end
	end

	return false, SceneBase.DefaultGroundPosition, SceneBase.DefaultGroundNormal, ""
end

function SceneBase:GetGroundInfo(isOnGround, pos, radius, offsetY)
	if self.tfSelf == nil then
		return false, SceneBase.DefaultGroundPosition.y, SceneBase.DefaultGroundNormal, 0
	end

	local startPos = pos:Clone()

	startPos.y = startPos.y + offsetY

	local checkDis = SceneDefine.GroundCheckRayDistance

	if DebugFly == true then
		checkDis = checkDis * 10
	end

	local ret = XPhysics.SphereCast(startPos.x, startPos.y, startPos.z, radius, 0, -1, 0, checkDis, self.groundLayerMask)

	if ret == true then
		local posX = 0
		local posY = 0
		local posZ = 0
		local normalX = 0
		local normalY = 0
		local normalZ = 0
		local hitDistance = 0
		local hitLayer = 0
		local hitInstanceID = 0
		local hitOwnerId = 0

		ret, posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitInstanceID, hitOwnerId = XPhysics.GetHitInfo(posX, posY, posZ, normalX, normalY, normalZ, hitDistance, hitLayer, hitInstanceID, hitOwnerId)

		if ret == true then
			posY = startPos.y - radius - hitDistance

			local nearestNormal = Vector3.New(normalX, normalY, normalZ)

			nearestNormal:SetNormalize()

			startPos = nil

			return true, posY, nearestNormal, hitInstanceID
		end
	end

	startPos = nil

	return false, SceneBase.DefaultGroundPosition.y, SceneBase.DefaultGroundNormal, 0
end

function SceneBase:CheckGroundBlock(oldPos, newPos, radius, offsetY)
	if self.tfSelf == nil then
		return true
	end

	local relative = newPos - oldPos

	if MathHelper.IsZero(relative.sqrMagnitude) == true then
		return true
	end

	local startPos = oldPos:Clone()

	startPos.y = startPos.y + offsetY

	local checkDis = relative.magnitude

	relative:SetNormalize()

	local ret = XPhysics.SphereCast(startPos.x, startPos.y, startPos.z, radius, relative.x, relative.y, relative.z, checkDis, self.groundLayerMask)

	startPos = nil

	return ret
end

function SceneBase.GetGroundTypeByName(name)
	if SceneBase.SceneGroundType[name] ~= nil then
		return SceneBase.SceneGroundType[name]
	end

	return SceneBase.Unknown
end

function SceneBase.GetZoneTypeByName(name)
	if SceneBase.SceneZoneType[name] ~= nil then
		return SceneBase.SceneZoneType[name]
	end

	return SceneBase.ZoneType.Unknown
end

function SceneBase.GetGroundVfxName(groundType)
	if groundType == SceneBase.GroundType.Mud or groundType == SceneBase.GroundType.SlowMud or groundType == SceneBase.GroundType.PoisonMud then
		return AnimalBase_Define.VfxGroundMud
	elseif groundType == SceneBase.GroundType.Grass then
		return AnimalBase_Define.VfxGroundGrass
	elseif groundType == SceneBase.GroundType.Stone then
		return AnimalBase_Define.VfxGroundStone
	elseif groundType == SceneBase.GroundType.Water then
		return AnimalBase_Define.VfxGroundWater
	elseif groundType == SceneBase.GroundType.River then
		return AnimalBase_Define.VfxGroundRiver
	elseif groundType == SceneBase.GroundType.Lake then
		return AnimalBase_Define.VfxGroundLake
	elseif groundType == SceneBase.GroundType.Wood then
		return AnimalBase_Define.VfxGroundWood
	elseif groundType == SceneBase.GroundType.Carpet then
		return nil
	elseif groundType == SceneBase.GroundType.Slurry then
		return nil
	elseif groundType == SceneBase.GroundType.WetLand then
		return nil
	elseif groundType == SceneBase.GroundType.Gold then
		return AnimalBase_Define.VfxGroundGold
	end

	return nil
end

function SceneBase:GetLocatorZone(type, id)
	if type == ControllerOccupyMode.ZoneType.ZoneB then
		return self.locatorZoneBList[id]
	elseif type == ControllerOccupyMode.ZoneType.ZoneC then
		return self.locatorZoneCList[id]
	end

	return nil
end

function SceneBase:GetEffectRoot(name)
	if self.tfEffectRootList[name] ~= nil then
		return self.tfEffectRootList[name]
	end

	return nil
end

function SceneBase:GetConfig()
	return self.sceneConfig
end

function SceneBase:Exit()
	self.tfSelf = nil
	self.sceneController = nil
	self.cameraScene = nil
	self.tfPostProcessList = nil
	self.postProcessControllerList = nil
	self.tfVisibleRoot = nil
	self.tfObjectGroup = nil
	self.sceneConfig = nil
	self.tfWater = nil
	self.tfWaterPro = nil
	self.tfEffectRootList = nil

	if self.trapList ~= nil then
		for id, trap in pairs(self.trapList) do
			if trap ~= nil then
				trap:Exit()
			end
		end

		self.trapList = nil
	end

	if self.doorList ~= nil then
		for id, door in pairs(self.doorList) do
			if door ~= nil then
				door:Exit()
			end
		end

		self.doorList = nil
	end

	if self.elevatorList ~= nil then
		for id, elevator in pairs(self.elevatorList) do
			if elevator ~= nil then
				elevator:Exit()
			end
		end

		self.elevatorList = nil
	end

	if self.cageList ~= nil then
		for id, cage in pairs(self.cageList) do
			if cage ~= nil then
				cage:Exit()
			end
		end

		self.cageList = nil
	end

	if self.stairKickList ~= nil then
		for id, stairKick in pairs(self.stairKickList) do
			if stairKick ~= nil then
				stairKick:Exit()
			end
		end

		self.stairKickList = nil
	end

	if self.coverKickList ~= nil then
		for id, coverKick in pairs(self.coverKickList) do
			if coverKick ~= nil then
				coverKick:Exit()
			end
		end

		self.coverKickList = nil
	end

	if self.crateList ~= nil then
		for id, crate in pairs(self.crateList) do
			if crate ~= nil then
				crate:Exit()
			end
		end

		self.crateList = nil
	end

	if self.gateList ~= nil then
		for id, gate in pairs(self.gateList) do
			if gate ~= nil then
				gate:Exit()
			end
		end

		self.gateList = nil
	end

	if self.bridgeList ~= nil then
		for id, bridge in pairs(self.bridgeList) do
			if bridge ~= nil then
				bridge:Exit()
			end
		end

		self.bridgeList = nil
	end

	if self.altarList ~= nil then
		for id, altar in pairs(self.altarList) do
			if altar ~= nil then
				altar:Exit()
			end
		end

		self.altarList = nil
	end

	if self.trickList ~= nil then
		for id, trick in pairs(self.trickList) do
			if trick ~= nil then
				trick:Exit()
			end
		end

		self.trickList = nil
	end

	if self.timeLineList ~= nil then
		for id, timeLine in pairs(self.timeLineList) do
			if timeLine ~= nil then
				timeLine:Exit()
			end
		end

		self.timeLineList = nil
	end

	if self.entranceList ~= nil then
		for k, entrance in pairs(self.entranceList) do
			if entrance ~= nil then
				entrance:Exit()
			end
		end

		self.entranceList = nil
	end

	if self.statueList ~= nil then
		for k, statue in pairs(self.statueList) do
			if statue ~= nil then
				statue:Exit()
			end
		end

		self.statueList = nil
	end

	if self.fountainList ~= nil then
		for k, fountain in pairs(self.fountainList) do
			if fountain ~= nil then
				fountain:Exit()
			end
		end

		self.fountainList = nil
	end

	if self.honeypotList ~= nil then
		for k, honeypot in pairs(self.honeypotList) do
			if honeypot ~= nil then
				honeypot:Exit()
			end
		end

		self.honeypotList = nil
	end

	self.iconVisible = nil
	self.plantList = nil
	self.tfEffectGroupRoot = nil
	self.groundColliderList = nil
	self.elevatorColliderList = nil
	self.tfVirtualRoot = nil
	self.tfVirtualGroundRoot = nil
	self.tfVirtualWallRoot = nil
	self.tfVirtualWallOpaqueRoot = nil
	self.tfVirtualWallTransparentRoot = nil
	self.tfVirtualWallInvisibleRoot = nil
	self.tfVirtualWallMonsterRoot = nil
	self.tfVirtualPathRoot = nil
	self.tfAnimatorRoot = nil
	self.tfDoorRoot = nil
	self.tfElevatorRoot = nil
	self.tfCageRoot = nil
	self.tfStairKickRoot = nil
	self.tfCoverKickRoot = nil
	self.tfCrateRoot = nil
	self.tfGateRoot = nil
	self.tfBridgeRoot = nil
	self.tfAltarRoot = nil
	self.tfTrickRoot = nil
	self.tfTimeLineRoot = nil
	self.tfReflectionProbeGroup = nil
	self.tfSkyBox = nil
	self.tfStatueRoot = nil
	self.tfFountainRoot = nil
	self.tfHoneypotRoot = nil
	self.tfDirLight = nil
	self.tfPointLight = nil
	self.pointLight = nil
	self.pointLightPosition = nil
	self.dirlightDir = nil
	self.groundLayerMask = nil
	self.tfMixLight = nil
	self.mixLight = nil
	self.mixLightDir = nil
	self.sceneFogColor = nil
end

return SceneBase
