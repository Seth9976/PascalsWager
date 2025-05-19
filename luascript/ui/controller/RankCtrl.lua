-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/RankCtrl.lua

require("LuaScript/Network/NI_Rank")

RankCtrl = class("RankCtrl", UICtrlBase)

local this = RankCtrl
local playerRankList, myRankText, myScoreText

function RankCtrl.OnCreate()
	UILayerCtrl.Add("Ranking")

	local btn = this.mainComponent:GetButton("Rank_Am_Button_Back")

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		UILayerCtrl.Pop()
		UIManager.Close("Rank")
		UIManager.SendMessage("LobbyMain", "CloseDialog")
	end)
	UILayerCtrl.AddIndividual("Ranking", "Rank_Am_Button_Back", btn)

	playerRankList = this.mainComponent:GetLoader("Rank_Am_ScrollView_Viewport_Content")
	myRankText = this.mainComponent:GetText("Rank_Am_Image_MyRank")
	myScoreText = this.mainComponent:GetText("Rank_Am_Image_Score")

	NI_Rank.GetRank(RankCtrl.Callback_Rank)
	UILayerCtrl.Push("Ranking")
end

function RankCtrl.Callback_Rank(jsonData)
	local ret = NI_Rank.ParseRankResponse(jsonData)

	if ret == true and next(FS_UserData.rank:GetRankList()) ~= nil then
		playerRankList.loadCount = FS_UserData.rank:GetRankListNum()

		function playerRankList.loadCallback(index, com, data)
			local rankData = FS_UserData.rank:GetPlayerByRank(index)

			com:GetText("Rank"):SetContent(index)

			if rankData ~= nil then
				com:GetText("Player_Name"):SetContent(rankData.name)
				com:GetText("Turn"):SetContent(rankData.wave)
				com:GetText("Number"):SetContent(rankData.score)
			end

			if FS_UserData.playerList.rank ~= nil and index == FS_UserData.playerList.rank.ranking then
				com:GetGameObject("Bg"):SetActive(true)
			end

			local img = XImage:new(com:GetGameObject("Hero"))
			local sprite = XObjectPool.GetIcon("photo" .. "10001")

			if sprite ~= nil then
				img:SetSprite(sprite)
			end
		end

		playerRankList:Load()

		if FS_UserData.playerList.rank ~= nil then
			myRankText:SetContent(FS_UserData.playerList.rank.ranking)
			myScoreText:SetContent(FS_UserData.playerList.rank.score)
		end
	else
		UIManager.SendMessage("MsgBoxSimple", "OpenSimple", "获取排名列表失败!")
		UIManager.Close("Rank")
		LobbyMainCtrl.CloseDialog()
	end
end

function RankCtrl.Update()
	return
end

return RankCtrl
