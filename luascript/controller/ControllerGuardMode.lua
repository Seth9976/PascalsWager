-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerGuardMode.lua

require("LuaScript/Controller/ControllerModeBase")
require("LuaScript/StructData/FS_BattleData_GuardMode")

ControllerGuardMode = class("ControllerGuardMode", ControllerModeBase)

local tfCharacterRoot, tfSceneRoot
local npcList = {}
local currentWave = 0
local currentSubWave = 0
local enemyRecordList = {}
local enemybornIndex = 0
local NPCbornIndex = 0
local currentWaveEnemyList = {}
local enemyIdStart = 0
local currentWaveEnemyNum = 0
local homeBaseRewardList = {}
local enemyRewardList = {}
local itemEnemyVfxList = {}
local isHomeBaseReward = false
local isEnemyReward = false
local getBuffVfx, homeBase
local npcInfoList = {}
local destroyList = {}
local GetHomeBaseRewardId = 0
local GetEnemyRewardId = 0
local homeBaseLevel = 0
local cleanWaveTime = 0
local cleanWaveBaseScore = 0
local getRewardFrame = 0

ControllerGuardMode.static.BeginFrame = 300
ControllerGuardMode.static.PlayerBornFrame = 300
ControllerGuardMode.static.PlayerRestFrame = 900
ControllerGuardMode.static.NPCBornPosNum = 4
ControllerGuardMode.static.EnemyBornPosNum = 5
ControllerGuardMode.static.GetRewardFrame = 105
ControllerGuardMode.static.NPCCreateProAdd = 5
ControllerGuardMode.static.CountDownTime = 6
ControllerGuardMode.static.HomeBaseRewardDis = 2.2
ControllerGuardMode.static.EnemyRewardDis = 1
ControllerGuardMode.static.HomeBaseRewardLevel = 1
ControllerGuardMode.static.EnemyRewardLevel = 2
ControllerGuardMode.static.HomeBaseRewardMax = 3
ControllerGuardMode.static.BGMType = {
	RestTime2 = 4,
	RestTime1 = 2,
	Violent = 3,
	EndTime = 5,
	Normal = 1
}
ControllerGuardMode.static.Status = {
	Ready = 1,
	Rest = 3,
	Result = 4,
	Normal = 2
}
ControllerGuardMode.static.VfxList = {
	{
		vfx_common = "vfx_buff_1"
	},
	{
		vfx_common = "vfx_buff_2"
	},
	{
		vfx_common = "vfx_buff_3"
	},
	{
		vfx_common = "vfx_buff_4"
	},
	{
		vfx_common = "vfx_buff_5"
	},
	{
		vfx_common = "vfx_buff_6"
	},
	{
		vfx_common = "vfx_self_1"
	},
	{
		vfx_common = "vfx_self_2"
	},
	{
		vfx_common = "vfx_self_3"
	},
	{
		vfx_common = "vfx_self_4"
	},
	{
		vfx_common = "vfx_self_5"
	},
	{
		vfx_common = "vfx_self_6"
	},
	{
		vfx_common = "vfx_getbuff_10001"
	},
	{
		vfx_common = "vfx_getbuff_10002"
	},
	{
		vfx_common = "vfx_getbuff_10003"
	}
}

function ControllerGuardMode:initialize()
	ControllerModeBase.initialize(self)

	local go = GoFind("CharacterRoot")

	tfCharacterRoot = go.transform
	go = GoFind("SceneRoot")
	tfSceneRoot = go.transform
	npcList = {}
	currentWave = 0
	currentSubWave = 1
	enemybornIndex = 1
	NPCbornIndex = 1
	enemyIdStart = BattleData.AnimalId_Enemy
	currentWaveEnemyNum = 0
	cleanWaveTime = 0
	cleanWaveBaseScore = 0
	homeBaseLevel = 1
	enemyRecordList = {}
	isHomeBaseReward = false
	isEnemyReward = false
	getBuffVfx = nil
	homeBase = nil
	npcInfoList = {}
	currentWaveEnemyList = {}
	homeBaseRewardList = {}
	enemyRewardList = {}
	GetHomeBaseRewardId = 0
	GetEnemyRewardId = 0
	getRewardFrame = 0
	itemEnemyVfxList = {}
	destroyList = {}
	self.gameFrame = 0
	self.restTimeFrame = 0
	self.createEnemyFrame = 0
	self.bgmType = ControllerGuardMode.BGMType.Normal

	self:InitPlayer()
	self:InitUI()
	self:ChangeStatus(ControllerGuardMode.Status.Ready)
	self.sceneController:EnterNormal()
end

function ControllerGuardMode:InitPlayer()
	FS_BattleData_GuardMode.initialize()
	self.hostPlayer:GetValue():SetRebornFrame(ControllerGuardMode.PlayerBornFrame)
	self.hostPlayer:GetValue():SetRebornEnable(true)

	local friendList = self.sceneController:GetTeamList(self.hostPlayer:GetTeamId())

	npcList = {}

	for i, tmpPlayer in pairs(friendList) do
		local animalId = tmpPlayer:GetAnimalId()

		if tmpPlayer:IsHost() == false then
			npcInfoList[animalId] = {
				CreatePro = ControllerGuardMode.NPCCreateProAdd
			}

			table.insert(npcList, tmpPlayer)
		else
			FS_BattleData_GuardMode.AddPlayer(animalId)
			FS_BattleData_GuardMode.SetBattleData(animalId, FS_BattleData_GuardMode.DataType.HeroId, tmpPlayer:GetHeroId())
		end
	end

	homeBase = self.sceneController:GetHomeBase()
	enemybornIndex = MathHelper.getRandom(1, ControllerGuardMode.EnemyBornPosNum)
	NPCbornIndex = MathHelper.getRandom(1, ControllerGuardMode.NPCBornPosNum)

	UIManager.SendMessage("Mainmenu", "SetPlayer", self.hostPlayer:GetAnimalId(), self.hostPlayer:GetHeroId(), self.hostPlayer:GetTeamId())
end

function ControllerGuardMode:InitUI()
	UIManager.SendMessage("Mainmenu", "SetPveMsgStep", currentWave)
	UIManager.SendMessage("Mainmenu", "SetPveMsgEnemyRemaining", 0)
end

function ControllerGuardMode:GetCurrentWaveEnemyList()
	currentWaveEnemyList = {}
	currentWaveEnemyNum = 0

	local spawnList = MS_GuardModeSpawn.GetSpawnList(currentWave)

	if spawnList ~= nil then
		for _k, _v in pairs(spawnList) do
			local randNum = MathHelper.getRandom(1, 10, _v.SubWave)

			currentWaveEnemyList[_v.SubWave] = {}

			local enemy, num = nil, 0

			if randNum <= _v.probability1 and probability1 ~= 0 then
				enemy = _v.Enemy1
				num = _v.Num1
			elseif randNum <= _v.probability1 + _v.probability2 and probability2 ~= 0 then
				enemy = _v.Enemy2
				num = _v.Num2
			elseif probability3 ~= 0 then
				enemy = _v.Enemy3
				num = _v.Num3
			end

			self:GetSubWaveEnemyList(enemy, num, _v.SubWave)

			currentWaveEnemyNum = currentWaveEnemyNum + num
		end
	end
end

function ControllerGuardMode:GetBornInterval(currentSubWave, currentWave)
	local bornInterval = 0
	local spawnList = MS_GuardModeSpawn.GetSpawnList(currentWave)

	if spawnList ~= nil then
		local Interval = spawnList[currentSubWave].Interval

		bornInterval = ControllerMain.ConvertSecondToFrame(Interval)
	end

	return bornInterval
end

function ControllerGuardMode:GetCleanWaveBaseScore(currentWave)
	local score = 0
	local spawnList = MS_GuardModeSpawn.GetSpawnList(currentWave)

	if spawnList ~= nil then
		for _k, _v in pairs(spawnList) do
			score = score + _v.Interval
		end
	end

	return score
end

function ControllerGuardMode:GetSubWaveEnemyList(enemyGroup, num, subWave)
	local enemyIdGroup = StringHelper.Split(enemyGroup, ",")
	local idx = MathHelper.getRandom(1, #enemyIdGroup)
	local enemyId = enemyIdGroup[idx]

	for i = 1, num do
		table.insert(currentWaveEnemyList[subWave], enemyId)
	end
end

function ControllerGuardMode:CreateEnemy(heroExtId, level)
	local heroExtData = MS_HeroExtData.GetHeroData(heroExtId)
	local heroId = heroExtData.HeroId
	local heroName = BattleData.GetHeroName(heroId)
	local modelName = StringHelper.ToUpperFirst(heroName)
	local heroExtName = heroExtData.HeroExtName
	local goHost = GoCreate("Player" .. enemyIdStart)

	goHost.transform:SetParent(tfCharacterRoot)

	goHost.transform.localScale = Vector3.one
	goHost.transform.position = Vector3.zero
	goHost.transform.rotation = Quaternion.identity

	local tfCharaObj = self.loadCharacterManager:LoadCharacter(heroId, LoadCharacterManager.LoadType.Game)

	if tfCharaObj ~= nil then
		tfCharaObj:SetParent(goHost.transform)

		local Hero = require("LuaScript/Logic/Player/" .. modelName)
		local player = Hero:new(goHost.transform, goChara.transform, enemyIdStart, heroName, 2, false)

		if player ~= nil then
			player:SetMemberId(0)
			player:SetHeroExtData(heroExtData)
			player:SetLevel(level)
			player:SetNickName(nil)
			self.sceneController:AddPlayer(enemyIdStart, player)
			self.sceneController:InitPlayer(player)
			player:GetValue():SetRebornEnable(false)
			self:SetBornPos(player, true)
			player:Start()
		end

		enemyIdStart = enemyIdStart + 1

		return player
	end

	return nil
end

function ControllerGuardMode:DestroyEnemy(animal)
	if animal ~= nil then
		local removeId = animal:GetAnimalId()

		self.sceneController:RemovePlayerDelay(removeId)

		animal = nil
	end

	Common.ClearMemory()
end

function ControllerGuardMode:SetBornPos(animal, isEnemy)
	if isEnemy == true then
		if animal:GetHeroExtBornIndex() ~= 0 then
			enemybornIndex = animal:GetHeroExtBornIndex()
		end

		local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornEnemy, animal:GetTeamId() * ControllerMain.LocatorBornUnit + enemybornIndex)

		if DebugCloseGuardMode == true then
			locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornEnemy, animal:GetTeamId() * ControllerMain.LocatorBornUnit + 5)
		end

		enemybornIndex = enemybornIndex + 1

		if enemybornIndex > ControllerGuardMode.EnemyBornPosNum then
			enemybornIndex = MathHelper.getRandom(1, ControllerGuardMode.EnemyBornPosNum)
		end

		animal:SetPosByWorldPos(locatorData.Position, true)
		animal:LookAt(locatorData.Orientation, true)
	else
		local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornNpc, animal:GetTeamId() * ControllerMain.LocatorBornUnit + NPCbornIndex)

		if DebugCloseGuardMode == true then
			locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.BornNpc, animal:GetTeamId() * ControllerMain.LocatorBornUnit + 4)
		end

		NPCbornIndex = NPCbornIndex + 1

		if NPCbornIndex > ControllerGuardMode.NPCBornPosNum then
			NPCbornIndex = 1
		end

		animal:SetPosByWorldPos(locatorData.Position, true)
		animal:LookAt(locatorData.Orientation, true)
	end
end

function ControllerGuardMode:CreateNPC(level)
	for i, tmpPlayer in pairs(npcList) do
		if tmpPlayer:IsShow() == false then
			local extDataList = MS_HeroExtData.GetHeroDataById(tmpPlayer:GetHeroId())
			local heroExtData

			if extDataList ~= nil then
				local rnd = MathHelper.getRandom(1, #extDataList)

				heroExtData = extDataList[rnd]
			end

			local animalId = tmpPlayer:GetAnimalId()
			local pro = npcInfoList[animalId].CreatePro
			local rndNum = MathHelper.getRandom(1, 100, i)

			if DebugCloseGuardMode == true then
				rndNum = 0
			end

			if rndNum <= pro then
				tmpPlayer:SetHeroExtData(heroExtData)
				tmpPlayer:SetLevel(level)
				tmpPlayer:ResetData()
				tmpPlayer:GetValue():SetRebornEnable(false)
				tmpPlayer:Reborn(true, nil)
				self:SetBornPos(tmpPlayer, false)
				self:HideOrShowAnimal(tmpPlayer, true)
				UIManager.SendMessage("Mainmenu", "ShowMessageCallForHelpInLeftPanel", tmpPlayer:GetNickName())
				UIManager.SendMessage("Mainmenu", "AddScreenTag", animalId)

				npcInfoList[animalId].CreatePro = ControllerGuardMode.NPCCreateProAdd
			else
				npcInfoList[animalId].CreatePro = pro + ControllerGuardMode.NPCCreateProAdd
			end
		end
	end
end

function ControllerGuardMode.GetNpc(npcAnimal)
	local npcAnimalId = npcAnimal:GetAnimalId()

	UIManager.SendMessage("Mainmenu", "ShowScreenTag", npcAnimalId, false)
	UIManager.SendMessage("Mainmenu", "ShowMessageInLeftPanel", string.gsub(GameText.UI_PVE_PNL_L_MSG_GETHELP, "{0}", npcAnimal:GetNickName()))
	UIManager.SendMessage("Mainmenu", "AddNpc", npcAnimalId, npcAnimal:GetHeroId(), npcAnimal:GetTeamId())

	local animalValue = npcAnimal:GetValue()

	animalValue:ShowHpNPC()
end

function ControllerGuardMode:ClearEnemys()
	for i = #enemyRecordList, 1, -1 do
		local tmpEnemy = enemyRecordList[i]

		if tmpEnemy ~= nil and tmpEnemy:IsDead() == true then
			currentWaveEnemyNum = currentWaveEnemyNum - 1

			UIManager.SendMessage("Mainmenu", "SetPveMsgEnemyRemaining", currentWaveEnemyNum)

			if tmpEnemy:IsMonsterElite() == true then
				local deadPos = Vector3.zero

				deadPos:SetVector3(tmpEnemy:GetDeadPosition())
				self:CreateEnemyReward(deadPos)
				UIManager.SendMessage("Mainmenu", "ShowBossHpBar", false)
				FS_BattleData_GuardMode.AddBattleData(self.hostPlayer:GetAnimalId(), FS_BattleData_GuardMode.DataType.EliteMonsterKillNum, 1)
			end

			table.insert(destroyList, tmpEnemy)
			table.remove(enemyRecordList, i)
		end
	end

	for i = #destroyList, 1, -1 do
		local tmpPlayer = destroyList[i]

		if tmpPlayer ~= nil and tmpPlayer:IsDeadHide() == true then
			self:DestroyEnemy(tmpPlayer)
			table.remove(destroyList, i)
		end
	end
end

function ControllerGuardMode:ClearNPCs()
	for i = #npcList, 1, -1 do
		local tmpPlayer = npcList[i]

		if tmpPlayer:IsShow() == true then
			local pos = tmpPlayer:GetPosByWorldPos()
			local animalId = tmpPlayer:GetAnimalId()

			UIManager.SendMessage("Mainmenu", "SetCharacterPositionAndOrientation", animalId, pos)

			if tmpPlayer ~= nil and tmpPlayer:IsDead() == true and tmpPlayer:IsDeadHide() == true then
				self:HideOrShowAnimal(tmpPlayer, false)
				UIManager.SendMessage("Mainmenu", "RemoveScreenTag", animalId)
				UIManager.SendMessage("Mainmenu", "RemoveNpc", animalId)
			end
		end
	end
end

function ControllerGuardMode:ClearEnemyList()
	for i = #destroyList, 1, -1 do
		local tmpPlayer = destroyList[i]

		if tmpPlayer ~= nil and tmpPlayer:IsDeadHide() == true then
			self:DestroyEnemy(tmpPlayer)
			table.remove(destroyList, i)
		end
	end
end

function ControllerGuardMode:RestTime()
	UIManager.SendMessage("Mainmenu", "ShowMessageInLeftPanel", GameText.UI_PVE_PNL_L_MSG_GETREWARD)
	self:CreateHomeBaseReward()
	self:CountCleanWaveScore()
end

function ControllerGuardMode:CountCleanWaveScore()
	local animalId = self.hostPlayer:GetAnimalId()
	local score = cleanWaveBaseScore - ControllerMain.ConvertFrameToSec(cleanWaveTime / 2)

	if score <= 0 then
		score = 0
	end

	FS_BattleData_GuardMode.AddBattleData(animalId, FS_BattleData_GuardMode.DataType.CleanWaveTime, Mathf.Floor(score))
end

function ControllerGuardMode:TouchReward(rewardItem)
	local buffData = MS_BufferData.GetBuffer(rewardItem.BuffId)

	UIManager.SendMessage("Mainmenu", "ShowReward", buffData.BufferName, 1, buffData.Icon)

	if getBuffVfx ~= nil then
		getBuffVfx:Clear()
	end

	getBuffVfx = VfxManager.PlayBindMulti(self.hostPlayer:GetBodyHips(), "vfx_getbuff_10001")

	UIManager.SendMessage("Mainmenu", "CancelProgress")
end

function ControllerGuardMode:GetReward(rewardItem, onComplete)
	getRewardFrame = getRewardFrame + 1

	local percent = getRewardFrame / ControllerGuardMode.GetRewardFrame

	percent = Mathf.Clamp(percent, 0, 1)

	UIManager.SendMessage("Mainmenu", "UpdateProgress", percent, MainmenuCtrl.ProgressBarType.GatherReward)

	if percent >= 1 then
		getRewardFrame = 0

		getBuffVfx:Clear()
		rewardItem.BuffVfx:Clear()
		UIManager.SendMessage("Mainmenu", "CancelProgress")
		AudioCtrl.SetUIAudio("reward")
		self.hostPlayer:EatBuffer(rewardItem.BuffId, rewardItem.BuffPos)
		onComplete()
	end
end

function ControllerGuardMode:CreateHomeBaseReward()
	local itemNum = ControllerGuardMode.HomeBaseRewardMax
	local buffIndexList = MathHelper.getNoRepeatRandom(7, 12, itemNum)

	for i = 1, itemNum do
		local locatorData = MS_SceneData.GetData(MS_SceneData.LocatorType.Item, i)

		if locatorData ~= nil then
			local buffIndex = buffIndexList[i]
			local itemVfx = VfxManager.PlayFreezeMulti("vfx_buff_" .. buffIndex - 6, locatorData.Position, nil, nil)
			local buffId = 100 + buffIndex
			local buffType = MS_BufferData.GetBuffer(buffId).BufferType

			homeBaseRewardList[i] = {
				BuffId = buffId,
				BuffPos = locatorData.Position,
				BuffVfx = itemVfx,
				BuffType = buffType
			}
		end
	end
end

function ControllerGuardMode:GetHomeBaseReward()
	if isHomeBaseReward == false and isEnemyReward == false then
		for i, rewardItem in pairs(homeBaseRewardList) do
			if rewardItem ~= nil then
				local dis = Vector3.DistanceSquare(self.hostPlayer:GetPosByWorldPos(), rewardItem.BuffPos)

				if dis <= ControllerGuardMode.HomeBaseRewardDis * ControllerGuardMode.HomeBaseRewardDis then
					if GetHomeBaseRewardId == 0 then
						GetHomeBaseRewardId = rewardItem.BuffId

						self:TouchReward(rewardItem)
					end

					self:GetReward(rewardItem, function()
						isHomeBaseReward = true
						GetHomeBaseRewardId = 0

						local remainTime = ControllerMain.ConvertFrameToSec(ControllerGuardMode.PlayerRestFrame - self.restTimeFrame)
						local maxTime = ControllerGuardMode.CountDownTime

						if maxTime <= remainTime then
							self.restTimeFrame = ControllerGuardMode.PlayerRestFrame - ControllerMain.ConvertSecondToFrame(maxTime)
						end

						self:BuffDataRecord(self.hostPlayer:GetAnimalId(), rewardItem.BuffType, ControllerGuardMode.HomeBaseRewardLevel)
						table.remove(homeBaseRewardList, i)

						rewardItem = nil
					end)
				elseif GetHomeBaseRewardId == rewardItem.BuffId then
					getBuffVfx:Clear()
					UIManager.SendMessage("Mainmenu", "CancelProgress")

					GetHomeBaseRewardId = 0
					getRewardFrame = 0
				end
			end
		end
	end
end

function ControllerGuardMode:CreateEnemyReward(pos)
	local tmpPos = pos
	local buffIndex = MathHelper.getRandom(1, 6)
	local itemVfx = VfxManager.PlayFreezeMulti("vfx_buff_" .. buffIndex, tmpPos, nil, nil)
	local itemTipsVfx = VfxManager.PlayFreezeMulti("vfx_common_prompt", tmpPos, nil, nil)
	local buffId = 100 + buffIndex
	local buffType = MS_BufferData.GetBuffer(buffId).BufferType
	local buffIndex = #enemyRewardList + 1

	enemyRewardList[buffIndex] = {
		BuffIndex = buffIndex,
		BuffId = buffId,
		BuffPos = pos,
		BuffVfx = itemVfx,
		BuffTipsVfx = itemTipsVfx,
		BuffType = buffType
	}
end

function ControllerGuardMode:GetEnemyReward()
	for i, rewardItem in pairs(enemyRewardList) do
		if rewardItem ~= nil then
			local dis = Vector3.DistanceSquare(self.hostPlayer:GetPosByWorldPos(), rewardItem.BuffPos)

			if dis <= ControllerGuardMode.EnemyRewardDis * ControllerGuardMode.EnemyRewardDis then
				if GetEnemyRewardId == 0 then
					GetEnemyRewardId = rewardItem.BuffIndex
					isEnemyReward = true

					self:TouchReward(rewardItem)
				end

				self:GetReward(rewardItem, function()
					isEnemyReward = false
					GetEnemyRewardId = 0

					rewardItem.BuffTipsVfx:Clear()
					self:BuffDataRecord(self.hostPlayer:GetAnimalId(), rewardItem.BuffType, ControllerGuardMode.EnemyRewardLevel)
					table.remove(enemyRewardList, i)

					rewardItem = nil
				end)
			elseif GetEnemyRewardId == rewardItem.BuffIndex then
				getBuffVfx:Clear()
				UIManager.SendMessage("Mainmenu", "CancelProgress")

				GetEnemyRewardId = 0
				getRewardFrame = 0
				isEnemyReward = false
			end
		end
	end
end

function ControllerGuardMode:ClearReward()
	for i, rewardItem in pairs(homeBaseRewardList) do
		if rewardItem ~= nil then
			rewardItem.BuffVfx:Clear()
		end
	end

	homeBaseRewardList = {}

	for i, rewardItem in pairs(enemyRewardList) do
		if rewardItem ~= nil then
			rewardItem.BuffVfx:Clear()
			rewardItem.BuffTipsVfx:Clear()
		end
	end

	enemyRewardList = {}

	if getBuffVfx ~= nil then
		getBuffVfx:Clear()
	end

	UIManager.SendMessage("Mainmenu", "CancelProgress")
end

function ControllerGuardMode:BuffDataRecord(animalId, buffType, num)
	if buffType == FS_BattleData_GuardMode.BuffType.HpMax then
		FS_BattleData_GuardMode.AddBattleData(animalId, FS_BattleData_GuardMode.DataType.BuffHpMax, num)

		local ret = FS_BattleData_GuardMode.GetBattleData(animalId, FS_BattleData_GuardMode.DataType.BuffHpMax)
	elseif buffType == FS_BattleData_GuardMode.BuffType.Power then
		FS_BattleData_GuardMode.AddBattleData(animalId, FS_BattleData_GuardMode.DataType.BuffPower, num)

		local ret = FS_BattleData_GuardMode.GetBattleData(animalId, FS_BattleData_GuardMode.DataType.BuffPower)
	elseif buffType == FS_BattleData_GuardMode.BuffType.Defence then
		FS_BattleData_GuardMode.AddBattleData(animalId, FS_BattleData_GuardMode.DataType.BuffDefence, num)

		local ret = FS_BattleData_GuardMode.GetBattleData(animalId, FS_BattleData_GuardMode.DataType.BuffDefence)
	elseif buffType == FS_BattleData_GuardMode.BuffType.Toughness then
		FS_BattleData_GuardMode.AddBattleData(animalId, FS_BattleData_GuardMode.DataType.BuffToughness, num)

		local ret = FS_BattleData_GuardMode.GetBattleData(animalId, FS_BattleData_GuardMode.DataType.BuffToughness)
	elseif buffType == FS_BattleData_GuardMode.BuffType.Energy then
		FS_BattleData_GuardMode.AddBattleData(animalId, FS_BattleData_GuardMode.DataType.BuffEnergy, num)

		local ret = FS_BattleData_GuardMode.GetBattleData(animalId, FS_BattleData_GuardMode.DataType.BuffEnergy)
	elseif buffType == FS_BattleData_GuardMode.BuffType.Strain then
		homeBaseLevel = homeBaseLevel + num

		UIManager.SendMessage("Mainmenu", "SetBuildingLv", homeBaseLevel)
	end
end

function ControllerGuardMode:GameResultSubmit()
	local animalId = self.hostPlayer:GetAnimalId()

	FS_BattleData_GuardMode.SetBattleData(animalId, FS_BattleData_GuardMode.DataType.ClearWaveNum, currentWave - 1)

	local waveNum = FS_BattleData_GuardMode.GetBattleData(animalId, FS_BattleData_GuardMode.DataType.ClearWaveNum)
	local eliteMonsterKillNum = FS_BattleData_GuardMode.GetBattleData(animalId, FS_BattleData_GuardMode.DataType.EliteMonsterKillNum)
	local cleanWaveTimeScore = FS_BattleData_GuardMode.GetBattleData(animalId, FS_BattleData_GuardMode.DataType.CleanWaveTime)
	local finalScore = waveNum * 100 + eliteMonsterKillNum * 10 + cleanWaveTimeScore

	FS_BattleData_GuardMode.SetBattleData(animalId, FS_BattleData_GuardMode.DataType.FinalScore, finalScore)
	log("-----waveNum：" .. waveNum .. "-----EliteMonsterKillNum：" .. eliteMonsterKillNum .. "-----CleanWaveTime：" .. cleanWaveTimeScore .. "-----finalScore：" .. finalScore)
	UIManager.CreateCtrl("BattleResult")
end

function ControllerGuardMode:ChangeStatus(status)
	self.status = status

	if self:IsStatus(ControllerGuardMode.Status.Ready) then
		-- block empty
	elseif self:IsStatus(ControllerGuardMode.Status.Normal) then
		currentWave = currentWave + 1
		currentSubWave = 1
		cleanWaveTime = 0
		cleanWaveBaseScore = self:GetCleanWaveBaseScore(currentWave)
		isHomeBaseReward = false

		self:GetCurrentWaveEnemyList()
		self:ClearReward()
		UIManager.SendMessage("Mainmenu", "SetPveMsgTimeCountDownToNextWave", -1)
		UIManager.SendMessage("Mainmenu", "SetPveMsgEnemyRemaining", currentWaveEnemyNum)
		UIManager.SendMessage("Mainmenu", "SetPveMsgStep", currentWave)
		UIManager.SendMessage("Mainmenu", "ShowMessageInLeftPanel", string.gsub(GameText.UI_PVE_PNL_R_ENEMY_WAVE_TIPS, "{0}", currentWave))
	elseif self:IsStatus(ControllerGuardMode.Status.Rest) then
		self:CreateHomeBaseReward()
		self:CountCleanWaveScore()

		if self.bgmType == ControllerGuardMode.BGMType.Normal then
			self.bgmType = ControllerGuardMode.BGMType.RestTime1
		elseif self.bgmType == ControllerGuardMode.BGMType.Violent then
			self.bgmType = ControllerGuardMode.BGMType.RestTime2
		end

		UIManager.SendMessage("Mainmenu", "ShowMessageInLeftPanel", GameText.UI_PVE_PNL_L_MSG_GETREWARD)
	elseif self:IsStatus(ControllerGuardMode.Status.Result) then
		local playerList = self.sceneController:GetPlayerList()

		for i, tmpPlayer in pairs(playerList) do
			if tmpPlayer ~= nil then
				tmpPlayer:Stop()
			end
		end

		self.sceneController:ChangeSubState(ControllerMain.MoveStep.ShowResult, 0, 0)

		self.bgmType = ControllerGuardMode.BGMType.EndTime
	end

	self.gameFrame = 0
	self.restTimeFrame = 0
end

function ControllerGuardMode:IsStatus(status)
	if self.status == status then
		return true
	end

	return false
end

function ControllerGuardMode:UpdateStatus()
	if self:IsStatus(ControllerGuardMode.Status.Ready) then
		self.gameFrame = self.gameFrame + 1

		if self.gameFrame > ControllerGuardMode.BeginFrame then
			self:ChangeStatus(ControllerGuardMode.Status.Normal)
		else
			local remainTime = ControllerMain.ConvertFrameToSec(ControllerGuardMode.BeginFrame - self.gameFrame)

			UIManager.SendMessage("Mainmenu", "SetPveMsgTimeCountDownToNextWave", Mathf.Floor(remainTime))
		end
	elseif self:IsStatus(ControllerGuardMode.Status.Normal) then
		if homeBase ~= nil and homeBase:IsDead() == true then
			self:ChangeStatus(ControllerGuardMode.Status.Result)
		else
			if currentSubWave > #currentWaveEnemyList then
				if #enemyRecordList <= 0 then
					self:ChangeStatus(ControllerGuardMode.Status.Rest)
				else
					cleanWaveTime = cleanWaveTime + 1
				end
			else
				local currentEnemyListLen = #currentWaveEnemyList[currentSubWave]
				local BornInterval = self:GetBornInterval(currentSubWave, currentWave)

				if currentEnemyListLen > 0 then
					local enemy = self:CreateEnemy(currentWaveEnemyList[currentSubWave][currentEnemyListLen], currentWave)

					table.insert(enemyRecordList, enemy)
					table.remove(currentWaveEnemyList[currentSubWave], currentEnemyListLen)
				else
					self.createEnemyFrame = self.createEnemyFrame + 1

					if BornInterval < self.createEnemyFrame then
						self.createEnemyFrame = 0
						currentSubWave = currentSubWave + 1

						self:CreateNPC(currentWave)
					end
				end
			end

			local homeBaseHp = homeBase:GetValue():GetProperty(MS_HeroData.Property.Hp)
			local homeBaseHpMax = homeBase:GetValue():GetPropertyMax(MS_HeroData.Property.Hp)

			if homeBaseHp <= homeBaseHpMax * 0.3 then
				self.bgmType = ControllerGuardMode.BGMType.Violent
			else
				self.bgmType = ControllerGuardMode.BGMType.Normal
			end
		end
	elseif self:IsStatus(ControllerGuardMode.Status.Rest) then
		self:GetHomeBaseReward()

		self.restTimeFrame = self.restTimeFrame + 1

		if self.restTimeFrame > ControllerGuardMode.PlayerRestFrame then
			self:ChangeStatus(ControllerGuardMode.Status.Normal)
		else
			local remainTime = ControllerMain.ConvertFrameToSec(ControllerGuardMode.PlayerRestFrame - self.restTimeFrame)

			UIManager.SendMessage("Mainmenu", "SetPveMsgTimeCountDownToNextWave", Mathf.Floor(remainTime))
		end
	elseif self:IsStatus(ControllerGuardMode.Status.Result) then
		-- block empty
	end

	self:GetEnemyReward()
	self:ClearEnemys()
	self:ClearNPCs()
end

function ControllerGuardMode:Update()
	ControllerModeBase.Update(self)

	if DebugCloseGuardMode == false then
		self:UpdateStatus()
	elseif #enemyRecordList < 11 then
		if self.gameFrame > 30 then
			local enemyList = {
				1021,
				1030
			}
			local rnd = MathHelper.getRandom(1, 2, 9999)
			local enemy = self:CreateEnemy(enemyList[rnd], 1)

			table.insert(enemyRecordList, enemy)

			self.gameFrame = 1
		else
			self.gameFrame = self.gameFrame + 1
		end

		if #enemyRecordList == 11 then
			self:CreateNPC(1)
		end
	end
end

function ControllerGuardMode:Exit()
	npcList = {}
	enemyRecordList = {}
	currentWaveEnemyList = {}
	itemEnemyVfxList = {}
	npcInfoList = {}
	homeBaseRewardList = {}
	enemyRewardList = {}
	destroyList = {}
	homeBase = nil

	ControllerModeBase.Exit(self)
end

return ControllerGuardMode
