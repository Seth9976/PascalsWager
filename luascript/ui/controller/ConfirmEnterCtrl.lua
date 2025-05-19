-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/ConfirmEnterCtrl.lua

require("LuaScript/StructData/FS_Battle_MatchGame")

ConfirmEnterCtrl = class("ConfirmEnterCtrl", UICtrlBase)

local this = ConfirmEnterCtrl
local sceneController
local teamMemberConfirm = {}
local confirmEnteryText = {}
local confirmWaitTimeText

function ConfirmEnterCtrl.OnCreate()
	teamMemberConfirm = {}
	sceneController = ST_Lobby.GetSceneController()

	local playerNum = sceneController:GetMatchPlayerNum()
	local maxTeamMember = playerNum / 2

	for i = 1, 2 do
		teamMemberConfirm[i] = this.mainComponent:GetLoader("ConfirmEntry_Team" .. i)
		teamMemberConfirm[i].loadCount = maxTeamMember
		teamMemberConfirm[i].loadCallback = function(index, com, data)
			local fs_player = FS_Battle_MatchGame.GetMatchPlayer((i - 1) * maxTeamMember + index)
			local icon = com:GetGameObject("Icon")
			local img = XImage:new(icon)

			XObjectPool.SetPortraitIcon(fs_player.icon, fs_player.iconUrl, img)
		end

		teamMemberConfirm[i]:Load()
	end

	confirmWaitTimeText = this.mainComponent:GetText("Text_WaitTime")

	local btn = this.mainComponent:GetButton("ConfirmEntry_Button_Confirm")

	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		btn:SetDisabled()
		btn:SetText(GameText.UI_CONFIRM_SELECTED)
		sceneController.MatchGameConfirm()
	end, 0)
end

function ConfirmEnterCtrl.UpdateConfirmStatus(index)
	if not this.loadFinish then
		return
	end

	local playerNum = sceneController:GetMatchPlayerNum()
	local maxTeamMember = playerNum / 2
	local teamIndex = 1
	local memberIndex = 1

	if maxTeamMember < index then
		index = index - maxTeamMember
		teamIndex = 2
		memberIndex = index
	else
		memberIndex = index
	end

	local childCom = teamMemberConfirm[teamIndex]:GetChild(memberIndex)

	if childCom == nil or IsNil(childCom.gameObject) then
		return
	end

	local heroIcon = childCom:GetGameObject("Icon")
	local cgHeroIcon = heroIcon:GetComponent("CanvasGroup")

	cgHeroIcon.alpha = 1
end

function ConfirmEnterCtrl.SetConfirmWaitText(timeVal)
	if not this.loadFinish then
		return
	end

	if confirmWaitTimeText == nil or IsNil(confirmWaitTimeText.gameObject) then
		return
	end

	confirmWaitTimeText:SetContent(math.floor(timeVal))
end

return ConfirmEnterCtrl
