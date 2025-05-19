-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/UI/View/LoginPanel.lua

local transform, gameObject

LoginPanel = {}

local this = LoginPanel

function LoginPanel.Awake(obj)
	gameObject = obj
	transform = obj.transform

	this.InitPanel()
	logWarn("Awake lua---Panel>>" .. gameObject.name)
end

function LoginPanel.InitPanel()
	this.LoginPanel_Open = transform:Find("LoginPanel/Open").gameObject
end

function LoginPanel.OnDestroy()
	logWarn("OnDestroy---->>>")
end
