-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/PVPBattleResultCtrl.lua

require("LuaScript/StructData/FS_BattleData_OccupyMode")

PVPBattleResultCtrl = class("PVPBattleResultCtrl", UICtrlBase)

local this = PVPBattleResultCtrl
local groupAll, groupSelf, groupCombat, mainPanel, BG, nextBtn, backBtn, combatTabBtn, SelfTabBtn, midSelf, midCombat, friendTotalKill, enemyTotalKill, selfUserName, selfHeroName, totalTime, winGo, loseGo, drawGo
local resultGoList = {}
local combatText, selfText, friendLoader, enemyLoader, selfLoader
local friendList = {}
local enemyList = {}
local resultFlag = false

PVPBattleResultCtrl.ActiveTabType = {
	SelfData = 2,
	Close = 0,
	CombatData = 1
}
PVPBattleResultCtrl.isActive = false
PVPBattleResultCtrl.ActiveTab = PVPBattleResultCtrl.ActiveTabType.CombatData

local selfLoaded = false

function PVPBattleResultCtrl.OnCreate()
	resultFlag = false

	UILayerCtrl.Add("BattleResult")

	totalTime = this.mainComponent:GetText("PVPBattleResultPanel_Top_time")
	friendTotalKill = this.mainComponent:GetText("PVPBattleResultPanel_MiddlePanel_BattleDataPanel_topleft_TotalNum")
	enemyTotalKill = this.mainComponent:GetText("PVPBattleResultPanel_MiddlePanel_BattleDataPanel_topright_TotalNum")
	selfUserName = this.mainComponent:GetText("PVPBattleResultPanel_TopSelf_UserName")
	selfHeroName = this.mainComponent:GetText("PVPBattleResultPanel_TopSelf_UserName_HeroName")
	friendLoader = this.mainComponent:GetLoader("PVPBattleResultPanel_MiddlePanel_BattleDataPanel_left")
	enemyLoader = this.mainComponent:GetLoader("PVPBattleResultPanel_MiddlePanel_BattleDataPanel_right")
	selfLoader = this.mainComponent:GetLoader("PVPBattleResultPanel_MiddleSelf_SelfDetailPanel_GridLayout")
	groupAll = this.mainComponent:GetGroupByName("all")
	groupSelf = this.mainComponent:GetGroupByName("self")
	groupCombat = this.mainComponent:GetGroupByName("combatgroup")
	mainPanel = this.mainComponent:GetGameObject("PVPBattleResultPanel")
	BG = this.mainComponent:GetGameObject("PVPBattleResultPanel_BG")
	midSelf = this.mainComponent:GetGameObject("PVPBattleResultPanel_MiddleSelf")
	midCombat = this.mainComponent:GetGameObject("PVPBattleResultPanel_MiddlePanel")
	combatText = this.mainComponent:GetGameObject("PVPBattleResultPanel_TopCombat_CombatData")
	selfText = this.mainComponent:GetGameObject("PVPBattleResultPanel_TopCombat_SelfData")
	selfLoaded = false
	nextBtn = this.mainComponent:GetButton("PVPBattleResultPanel_Bottom")

	nextBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		groupAll:SetActive(false)
		groupSelf:SetActive(true)
		nextBtn:SetEventCallBack(EventTriggerType.PointerClick, function()
			return
		end)

		local co = coroutine.start(function()
			coroutine.wait(1)
			nextBtn:SetEventCallBack(EventTriggerType.PointerClick, PVPBattleResultCtrl.NextStep)
		end)
		local SelfDataList = PVPBattleResultCtrl.ProcessSelfData()

		if selfLoaded then
			if selfLoader ~= nil and SelfDataList ~= nil and table.nums(SelfDataList) > 0 then
				for index = 1, #SelfDataList do
					selfLoader:GetChild(index):GetText("Number"):SetContent(SelfDataList[index].num)
				end
			end
		else
			selfLoader.loadCount = #SelfDataList

			function selfLoader.loadCallback(index, com, data)
				com:GetText("Number"):SetContent(SelfDataList[index].num)
				com:GetText("Type"):SetContent(SelfDataList[index].type)
			end

			selfLoader:Load()

			selfLoaded = true
		end
	end)
	UILayerCtrl.AddIndividual("BattleResult", "PVPBattleResultPanel_Bottom", nextBtn)

	resultGoList = {}
	winGo = this.mainComponent:GetGameObject("PVPBattleResultPanel_Top_ResultImage_Win")
	loseGo = this.mainComponent:GetGameObject("PVPBattleResultPanel_Top_ResultImage_Lose")
	drawGo = this.mainComponent:GetGameObject("PVPBattleResultPanel_Top_ResultImage_Draw")

	table.insert(resultGoList, winGo)
	table.insert(resultGoList, loseGo)
	table.insert(resultGoList, drawGo)

	backBtn = this.mainComponent:GetButton("PVPBattleResultPanel_TopCombat_BackBtn")

	backBtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	backBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PVPBattleResultCtrl.Hide()
	end)
	UILayerCtrl.AddIndividual("BattleResult", "PVPBattleResultPanel_TopCombat_BackBtn", backBtn)

	combatTabBtn = this.mainComponent:GetButton("PVPBattleResultPanel_TabBtn_CombatDataBtn")

	combatTabBtn:SelectOnStart(true)
	combatTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		combatText:SetActive(true)
		selfText:SetActive(false)
		midSelf:SetActive(false)
		midCombat:SetActive(true)

		PVPBattleResultCtrl.ActiveTab = PVPBattleResultCtrl.ActiveTabType.CombatData
	end)

	SelfTabBtn = this.mainComponent:GetButton("PVPBattleResultPanel_TabBtn_CombatSelfBtn")

	SelfTabBtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		midSelf:SetActive(true)
		midCombat:SetActive(false)
		combatText:SetActive(false)
		selfText:SetActive(true)

		PVPBattleResultCtrl.ActiveTab = PVPBattleResultCtrl.ActiveTabType.SelfData
	end)

	friendList = FS_BattleData_OccupyMode.GetFriendData()
	enemyList = FS_BattleData_OccupyMode.GetEnemyData()

	local myData = FS_BattleData_OccupyMode.GetOnePlayerDetailData(FS_UserData.playerList:GetUserId())

	selfUserName:SetContent(myData[FS_BattleData_OccupyMode.DataType.UserName])
	selfHeroName:SetContent(MS_HeroData.GetHero(myData[FS_BattleData_OccupyMode.DataType.HeroId]).Name)

	friendLoader.loadCount = table.nums(friendList)

	function friendLoader.loadCallback(index, com, data)
		if friendList[index] ~= nil then
			com:GetText("Portrait_PlayerName"):SetContent(friendList[index][FS_BattleData_OccupyMode.DataType.UserName])

			local heroname = MS_HeroData.GetHero(friendList[index][FS_BattleData_OccupyMode.DataType.HeroId]).Name

			com:GetText("Portrait_PlayerName_HeroName"):SetContent(heroname)

			local img = XImage:new(com:GetGameObject("Portrait"))
			local sprite = XObjectPool.GetIcon("photo" .. friendList[index][FS_BattleData_OccupyMode.DataType.HeroId])

			if sprite ~= nil then
				img:SetSprite(sprite)
			end

			com:GetText("kill"):SetContent(friendList[index][FS_BattleData_OccupyMode.DataType.KillNum])
			com:GetText("death"):SetContent(friendList[index][FS_BattleData_OccupyMode.DataType.DeathNum])

			if friendList[index][FS_BattleData_OccupyMode.DataType.UserId] == FS_UserData.playerList:GetUserId() then
				com:GetGameObject("SelfBG"):SetActive(true)
			end
		end
	end

	friendLoader:Load()

	enemyLoader.loadCount = table.nums(enemyList)

	function enemyLoader.loadCallback(index, com, data)
		if enemyList[index] ~= nil then
			com:GetText("Portrait_PlayerName"):SetContent(enemyList[index][FS_BattleData_OccupyMode.DataType.UserName])

			local heroname = MS_HeroData.GetHero(enemyList[index][FS_BattleData_OccupyMode.DataType.HeroId]).Name

			com:GetText("Portrait_PlayerName_HeroName"):SetContent(heroname)

			local img = XImage:new(com:GetGameObject("Portrait"))
			local sprite = XObjectPool.GetIcon("photo" .. enemyList[index][FS_BattleData_OccupyMode.DataType.HeroId])

			if sprite ~= nil then
				img:SetSprite(sprite)
			end

			com:GetText("kill"):SetContent(enemyList[index][FS_BattleData_OccupyMode.DataType.KillNum])
			com:GetText("death"):SetContent(enemyList[index][FS_BattleData_OccupyMode.DataType.DeathNum])

			if enemyList[index][FS_BattleData_OccupyMode.DataType.UserId] == FS_UserData.playerList:GetUserId() then
				com:GetGameObject("SelfBG"):SetActive(true)
			end
		end
	end

	enemyLoader:Load()

	local friendtotalnum = FS_BattleData_OccupyMode.GetFriendScore()

	friendTotalKill:SetContent(friendtotalnum)

	local enemytotalnum = FS_BattleData_OccupyMode.GetEnemyScore()

	enemyTotalKill:SetContent(enemytotalnum)
end

function PVPBattleResultCtrl.NextStep()
	ST_Scene.ChangeScene(ST_Scene.SceneType.LobbyReload)
end

function PVPBattleResultCtrl.ProcessSelfData()
	local outlist = {}
	local templist = FS_BattleData_OccupyMode.GetOnePlayerDetailData(FS_UserData.playerList:GetUserId())

	table.insert(outlist, {
		num = math.ceil(templist[FS_BattleData_OccupyMode.DataType.AttackDamage]),
		type = GameText.UI_PVPBATTLERESULT_DAMAGE
	})
	table.insert(outlist, {
		num = math.ceil(templist[FS_BattleData_OccupyMode.DataType.Heal]),
		type = GameText.UI_PVPBATTLERESULT_HEAL
	})
	table.insert(outlist, {
		num = math.ceil(templist[FS_BattleData_OccupyMode.DataType.SingleKillNum]),
		type = GameText.UI_PVPBATTLERESULT_SINGLEKILL
	})
	table.insert(outlist, {
		num = math.ceil(templist[FS_BattleData_OccupyMode.DataType.LastKillNum]),
		type = GameText.UI_PVPBATTLERESULT_LASTKILL
	})
	table.insert(outlist, {
		num = math.ceil(templist[FS_BattleData_OccupyMode.DataType.AssistNum]),
		type = GameText.UI_PVPBATTLERESULT_ASSISTS
	})
	table.insert(outlist, {
		num = math.ceil(templist[FS_BattleData_OccupyMode.DataType.DeathNum]),
		type = GameText.UI_PVPBATTLERESULT_DEATH
	})

	local timeformat = string.format("%02d", math.floor(math.ceil(templist[FS_BattleData_OccupyMode.DataType.LiveTime]) / 60)) .. ":" .. string.format("%02d", math.ceil(templist[FS_BattleData_OccupyMode.DataType.LiveTime]) % 60)

	table.insert(outlist, {
		num = timeformat,
		type = GameText.UI_PVPBATTLERESULT_LIVETIME
	})
	table.insert(outlist, {
		num = math.ceil(templist[FS_BattleData_OccupyMode.DataType.AcceptDamage]),
		type = GameText.UI_PVPBATTLERESULT_RECEIVEDAMAGE
	})

	return outlist
end

function PVPBattleResultCtrl.SetResult(type)
	for k, v in pairs(resultGoList) do
		if k == type then
			v:SetActive(true)
		else
			v:SetActive(false)
		end
	end
end

function PVPBattleResultCtrl.SetTotaltime(time)
	local min = string.format("%02d", math.floor(time / 60))
	local sec = string.format("%02d", time % 60)

	totalTime:SetContent("游戏时间:" .. min .. ":" .. sec)
end

function PVPBattleResultCtrl.UpdatePanel()
	friendList = FS_BattleData_OccupyMode.GetFriendData()
	enemyList = FS_BattleData_OccupyMode.GetEnemyData()

	PVPBattleResultCtrl.UpdateList(friendLoader, friendList)
	PVPBattleResultCtrl.UpdateList(enemyLoader, enemyList)
end

function PVPBattleResultCtrl.UpdateSelf()
	local SelfDataList = PVPBattleResultCtrl.ProcessSelfData()

	if selfLoaded then
		if selfLoader ~= nil and SelfDataList ~= nil and table.nums(SelfDataList) > 0 then
			for index = 1, #SelfDataList do
				selfLoader:GetChild(index):GetText("Number"):SetContent(SelfDataList[index].num)
			end
		end
	else
		selfLoader.loadCount = #SelfDataList

		function selfLoader.loadCallback(index, com, data)
			com:GetText("Number"):SetContent(SelfDataList[index].num)
			com:GetText("Type"):SetContent(SelfDataList[index].type)
		end

		selfLoader:Load()

		selfLoaded = true
	end
end

function PVPBattleResultCtrl.UpdateScore(team, score)
	if friendTotalKill == nil or enemyTotalKill == nil then
		return
	end

	if FS_BattleData_OccupyMode.hostTeamId == team then
		friendTotalKill:SetContent(score)
	else
		enemyTotalKill:SetContent(score)
	end
end

function PVPBattleResultCtrl.UpdateList(loader, list)
	if loader ~= nil and list ~= nil and table.nums(list) > 0 then
		for index = 1, #list do
			loader:GetChild(index):GetText("kill"):SetContent(list[index][FS_BattleData_OccupyMode.DataType.KillNum])
			loader:GetChild(index):GetText("death"):SetContent(list[index][FS_BattleData_OccupyMode.DataType.DeathNum])
		end
	end
end

function PVPBattleResultCtrl.ShowData()
	resultFlag = false

	UILayerCtrl.Push("BattleResult")
	PVPBattleResultCtrl.UpdatePanel()
	PVPBattleResultCtrl.UpdateSelf()

	mainPanel:GetComponent("CanvasGroup").alpha = 1
	mainPanel:GetComponent("CanvasGroup").blocksRaycasts = true
	PVPBattleResultCtrl.isActive = true
end

function PVPBattleResultCtrl.ShowResult()
	resultFlag = true

	UILayerCtrl.Push("BattleResult")
	PVPBattleResultCtrl.UpdatePanel()

	local result = FS_BattleData_OccupyMode.GetBattleResult()

	PVPBattleResultCtrl.SetResult(result)

	local time = FS_BattleData_OccupyMode.GetBattleTime()

	PVPBattleResultCtrl.SetTotaltime(time)

	mainPanel:GetComponent("CanvasGroup").alpha = 1
	mainPanel:GetComponent("CanvasGroup").blocksRaycasts = true

	BG:SetActive(true)

	mainPanel:GetComponent("Image").enabled = false

	groupCombat:SetActive(false)
	groupAll:SetActive(true)
	groupSelf:SetActive(false)
	nextBtn.gameObject:SetActive(true)
end

function PVPBattleResultCtrl.Hide()
	mainPanel:GetComponent("CanvasGroup").alpha = 0
	mainPanel:GetComponent("CanvasGroup").blocksRaycasts = false
	PVPBattleResultCtrl.isActive = false

	UILayerCtrl.Pop()
end

function PVPBattleResultCtrl.GetResultFlag()
	return resultFlag
end

return PVPBattleResultCtrl
