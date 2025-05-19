-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/BattleInfoCtrl.lua

BattleInfoCtrl = class("BattleInfoCtrl", UICtrlBase)

local this = BattleInfoCtrl
local loaderContents
local loadCount = 0
local loadMax = 0

function BattleInfoCtrl.OnCreate()
	this.loadFinish = false
	loaderContents = this.mainComponent:GetLoader("Content")

	local btn = this.mainComponent:GetButton("BattleInfo_Buttom_Back")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UIManager.Close("BattleInfo")
	end)

	local processed = this.CollectData(FS_BattleData_GuardMode.battleDataList)

	BattleInfoCtrl.ShowBattleInfoPVE(processed)
end

function BattleInfoCtrl.CollectData(dataTable)
	local count = table.nums(info)
	local data = {}

	for _k, _v in pairs(dataTable) do
		_v.idx = _k

		table.insert(data, _v)
	end

	return data
end

function BattleInfoCtrl.ShowBattleInfoPVE(info)
	SystemHelper.Log("ShowBattleInfoPVE.......")

	local count = table.nums(info)

	loadCount = 0
	loadMax = count
	loaderContents.loadCount = count

	function loaderContents.loadCallback(index, com, data)
		local dateInLine = info[index]
		local heroId = dateInLine[FS_BattleData_GuardMode.DataType.HeroId]

		SystemHelper.Log("########################" .. index .. " - " .. heroId)

		local imgHero = com:GetGameObject("HeroIcon")
		local heroIcon = XImage:new(imgHero)
		local sprite = XObjectPool.GetIcon("photo" .. heroId)

		if sprite ~= nil then
			heroIcon:SetSprite(sprite)
		else
			SystemHelper.Log("Could not find photo" .. heroId)
		end

		local text = com:GetText("Nickname")
		local value = "玩家" .. index

		text:SetContent(value)

		local heroData = MS_HeroData.GetHero(heroId)

		text = com:GetText("HeroName")

		if heroData ~= nil then
			value = LS_Account.userName
		else
			value = "我是谁"
		end

		text:SetContent(value)

		text = com:GetText("Stat_KillCount")
		value = dateInLine[FS_BattleData_GuardMode.DataType.KillNum]

		text:SetContent(value)

		text = com:GetText("Stat_DeathCount")
		value = dateInLine[FS_BattleData_GuardMode.DataType.DeathNum]

		text:SetContent(value)

		text = com:GetText("Stat_ItemLife")
		value = dateInLine[FS_BattleData_GuardMode.DataType.BuffHpMax]

		text:SetContent(value)

		text = com:GetText("Stat_ItemAttack")
		value = dateInLine[FS_BattleData_GuardMode.DataType.BuffPower]

		text:SetContent(value)

		text = com:GetText("Stat_ItemDefense")
		value = dateInLine[FS_BattleData_GuardMode.DataType.BuffDefence]

		text:SetContent(value)

		text = com:GetText("Stat_ItemTenacity")
		value = dateInLine[FS_BattleData_GuardMode.DataType.BuffToughness]

		text:SetContent(value)

		text = com:GetText("Stat_ItemEnergy")
		value = dateInLine[FS_BattleData_GuardMode.DataType.BuffEnergy]

		text:SetContent(value)

		local compAlpha = com.transform:GetComponent("CanvasGroup")

		compAlpha.alpha = 0

		local fadeinTest = Tween:new(compAlpha)

		fadeinTest:SetAutoKill(true)
		fadeinTest:MoveTo({
			alpha = 1
		}, 0.5)
		fadeinTest:Delay(index * 0.1)
		fadeinTest:Start()

		loadCount = loadCount + 1

		if loadCount == loadMax then
			this.loadFinish = true
		end
	end

	loaderContents:Load()
end

return BattleInfoCtrl
