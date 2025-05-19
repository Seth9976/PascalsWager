-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerLaunch.lua

require("LuaScript/Controller/ControllerBase")

ControllerLaunch = class("ControllerLaunch", ControllerBase)
ControllerLaunch.LoadStep = {
	LoadIcon = 5,
	LoadFinish = 7,
	LoadWaitIcon = 6,
	LoadWaitShader = 4,
	UnloadLogo = 1,
	LoadShader = 3,
	UnloadLogoWait = 2,
	Empty = 0
}
ControllerLaunch.static.LoadProgressStep = {
	{
		ControllerLaunch.LoadStep.LoadShader,
		10
	},
	{
		ControllerLaunch.LoadStep.LoadIcon,
		10
	}
}

function ControllerLaunch:initialize()
	ControllerBase.initialize(self)

	self.loadStep = ControllerLaunch.LoadStep.UnloadLogo
	self.loadSubStep = 0
	self.isLoaded = false

	LoadProgress.Init(ControllerLaunch.LoadProgressStep)
end

function ControllerLaunch:Exit()
	ControllerBase.Exit(self)
end

function ControllerLaunch:Update()
	ControllerBase.Update(self)

	if self.loadStep == ControllerLaunch.LoadStep.UnloadLogo then
		Common.ReleaseLogo("GIANT_LOGO", "tips_logo", "")

		self.loadStep = ControllerLaunch.LoadStep.UnloadLogoWait
		self.loadSubStep = 0
	elseif self.loadStep == ControllerLaunch.LoadStep.UnloadLogoWait then
		self.loadSubStep = self.loadSubStep + 1

		if self.loadSubStep > 5 then
			self.loadStep = ControllerLaunch.LoadStep.LoadShader
		end
	elseif self.loadStep == ControllerLaunch.LoadStep.LoadShader then
		LoadProgress.CreateAndAddItem(ControllerLaunch.LoadStep.LoadShader, "LoadShader", nil)

		local packageName = "shader/shader.unity3d"

		XObjectPool.LoadShader(packageName, function()
			LoadProgress.SetItemProgress(ControllerLaunch.LoadStep.LoadShader, "LoadShader", 100)

			self.loadStep = ControllerLaunch.LoadStep.LoadIcon

			SystemHelper.LogTest("###################loadStep=LoadShader")
			Common.ClearMemory()
		end)

		self.loadStep = ControllerLaunch.LoadStep.LoadWaitShader
	elseif self.loadStep == ControllerLaunch.LoadStep.LoadWaitShader then
		-- block empty
	elseif self.loadStep == ControllerLaunch.LoadStep.LoadIcon then
		LoadProgress.CreateAndAddItem(ControllerLaunch.LoadStep.LoadIcon, "LoadIcon", nil)

		if XObjectPool.IsLoadedIcon() == false then
			XObjectPool.LoadIcon(function()
				LoadProgress.SetItemProgress(ControllerLaunch.LoadStep.LoadIcon, "LoadIcon", 100)
				UICtrlBase.Revalidate("Skip")

				self.loadStep = ControllerLaunch.LoadStep.LoadFinish

				SystemHelper.LogTest("###################loadStep=LoadIcon")
				Common.ClearMemory()
			end)

			self.loadStep = ControllerLaunch.LoadStep.LoadWaitIcon
		else
			LoadProgress.SetItemProgress(ControllerLaunch.LoadStep.LoadIcon, "LoadIcon", 100)

			self.loadStep = ControllerLaunch.LoadStep.LoadFinish

			SystemHelper.LogTest("###################loadStep=LoadIcon")
		end
	elseif self.loadStep == ControllerLaunch.LoadStep.LoadWaitIcon then
		-- block empty
	elseif self.loadStep == ControllerLaunch.LoadStep.LoadFinish then
		self.isLoaded = true
		self.loadStep = ControllerLaunch.LoadStep.Empty
	end
end
