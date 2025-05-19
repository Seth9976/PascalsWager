-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/State/ST_Base.lua

ST_Base = class("ST_Base")

local this = ST_Base
local goUiBase, goUiScene
local tfUiBasePool = {}
local tfUiScenePool = {}
local gameTcpHeartBeatTime = 0
local gameTcpHeartBeatInterval = 30
local gameTcpHeartBeatWork = false
local battleTcpHeartBeatTime = 0
local battleTcpHeartBeatInterval = 30
local battleTcpHeartBeatWork = false
local battleUdpPingTime = 0
local battleUdpPingInterval = 0.2
local battleUdpPingWork = false
local gameGCTime = 0
local gameGCInterval = 33

function ST_Base.GetUi(nodeName, subName)
	local go

	if goUiBase or goUiScene then
		local tf = TfFindChild(goUiBase.transform, nodeName)

		if tf == nil then
			tf = TfFindChild(goUiScene.transform, nodeName)
		end

		if tf then
			go = TfFindChild(tf, subName).gameObject
		else
			SystemHelper.Log("!!!!!NULL................." .. nodeName .. " - " .. subName)
		end
	else
		SystemHelper.Log("?????NULL................." .. nodeName .. " - " .. subName)
	end

	return go
end

function ST_Base.InitUiBase()
	goUiBase = GoFind("UIBase")

	local tfUiBase = goUiBase.transform

	if goUiBase then
		tfUiBasePool = {}

		local tf = tfUiBase.transform
		local count = tf.childCount - 1

		for i = count, 0, -1 do
			local _tf = tf:GetChild(i)

			tfUiBasePool[_tf.name] = _tf
		end
	end
end

function ST_Base.Enter()
	goUiScene = GoFind("UIScene")

	local tfUiScene = goUiScene.transform
	local goUiTemp = GoFind("UITemp")

	if goUiScene and goUiTemp then
		local tf = goUiTemp.transform
		local count = tf.childCount - 1

		for i = count, 0, -1 do
			local _tf = tf:GetChild(i)

			_tf:SetParent(tfUiScene)

			tfUiScenePool[_tf.name] = _tf
		end
	end
end

function ST_Base.OnChangeScreen(width, height)
	return
end

function ST_Base.FindNodeTf(name)
	if tfUiScenePool then
		local tf = tfUiScenePool[name]

		return tf
	end

	return nil
end

function ST_Base.RemoveNodeTf(name)
	local tf = tfUiScenePool[name]

	if tf ~= nil then
		GoDestroy(tf.gameObject)

		tfUiScenePool[name] = nil
	end
end

function ST_Base.StartGameTcpHeartBeat()
	gameTcpHeartBeatWork = true
end

function ST_Base.StopGameTcpHeartBeat()
	gameTcpHeartBeatWork = false
end

function ST_Base.StartBattleTcpHeartBeat()
	battleTcpHeartBeatWork = true
end

function ST_Base.StopBattleTcpHeartBeat()
	battleTcpHeartBeatWork = false
end

function ST_Base.StartBattleUdpPing()
	battleUdpPingWork = true
end

function ST_Base.StopBattleUdpPing()
	battleUdpPingWork = false
end

function ST_Base.Update()
	local nowTime = TimeHelper.getNowTimeNoScale()

	if gameTcpHeartBeatWork == true and nowTime - gameTcpHeartBeatTime > gameTcpHeartBeatInterval then
		if FS_UserData.playerList:GetUserId() > 0 then
			NI_Game.HeartBeat()
		end

		gameTcpHeartBeatTime = nowTime
	end

	if battleUdpPingWork == true and nowTime - battleUdpPingTime > battleUdpPingInterval then
		if FS_UserData.playerList:GetUserId() > 0 then
			NI_BattleCommon.Ping()
		end

		battleUdpPingTime = nowTime
	end
end

function ST_Base.FixedUpdate()
	return
end

function ST_Base.LateUpdate()
	return
end

function ST_Base.LateLateUpdate()
	return
end

function ST_Base.Exit()
	UILayerCtrl.Clear()
	UIManager.Clear()
end

function ST_Base.ClearUiScene()
	if tfUiScenePool then
		for name, goUi in pairs(tfUiScenePool) do
			GoDestroy(goUi.gameObject)
		end
	end

	tfUiScenePool = {}
end

return ST_Base
