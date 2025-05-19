-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/PVPBattleDataCtrl.lua

require("LuaScript/StructData/FS_BattleData_OccupyMode")

PVPBattleDataCtrl = class("PVPBattleDataCtrl", UICtrlBase)

local this = PVPBattleDataCtrl
local battleDataBtn, deathDataBtn, backbtn, friendTotalKill, enemyTotalKill, friendLoader, enemyLoader, mainPanel
local friendList = {}
local enemyList = {}

PVPBattleDataCtrl.isActive = false

function PVPBattleDataCtrl.OnCreate()
	backbtn = this.mainComponent:GetButton("PVPBattleDataPanel_BackButton")

	backbtn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	backbtn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		PVPBattleDataCtrl.Hide()
	end)

	battleDataBtn = this.mainComponent:GetButton("PVPBattleDataPanel_BattleDataButton")
	deathDataBtn = this.mainComponent:GetButton("PVPBattleDataPanel_DeathDataButton")
	friendTotalKill = this.mainComponent:GetText("PVPBattleDataPanel_MiddlePanel_BattleDataPanel_topleft_TotalNum")
	enemyTotalKill = this.mainComponent:GetText("PVPBattleDataPanel_MiddlePanel_BattleDataPanel_topright_TotalNum")
	mainPanel = this.mainComponent:GetGameObject("PVPBattleDataPanel")
	friendLoader = this.mainComponent:GetLoader("PVPBattleDataPanel_MiddlePanel_BattleDataPanel_left")
	enemyLoader = this.mainComponent:GetLoader("PVPBattleDataPanel_MiddlePanel_BattleDataPanel_right")
	friendList = FS_BattleData_OccupyMode.GetFriendData()
	enemyList = FS_BattleData_OccupyMode.GetEnemyData()
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

function PVPBattleDataCtrl.UpdatePanel()
	friendList = FS_BattleData_OccupyMode.GetFriendData()
	enemyList = FS_BattleData_OccupyMode.GetEnemyData()

	PVPBattleDataCtrl.UpdateList(friendLoader, friendList)
	PVPBattleDataCtrl.UpdateList(enemyLoader, enemyList)
end

function PVPBattleDataCtrl.UpdateScore(team, score)
	if friendTotalKill == nil or enemyTotalKill == nil then
		return
	end

	if FS_BattleData_OccupyMode.hostTeamId == team then
		friendTotalKill:SetContent(score)
	else
		enemyTotalKill:SetContent(score)
	end
end

function PVPBattleDataCtrl.UpdateList(loader, list)
	if loader ~= nil and list ~= nil and table.nums(list) > 0 then
		for index = 1, #list do
			loader:GetChild(index):GetText("kill"):SetContent(list[index][FS_BattleData_OccupyMode.DataType.KillNum])
			loader:GetChild(index):GetText("death"):SetContent(list[index][FS_BattleData_OccupyMode.DataType.DeathNum])
		end
	end
end

function PVPBattleDataCtrl.Show()
	PVPBattleDataCtrl.UpdatePanel()
	mainPanel:SetActive(true)

	PVPBattleDataCtrl.isActive = true
end

function PVPBattleDataCtrl.Hide()
	mainPanel:SetActive(false)

	PVPBattleDataCtrl.isActive = false
end

return PVPBattleDataCtrl
