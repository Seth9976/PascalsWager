-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/SceneLobby.lua

require("LuaScript/Logic/Scene/SceneBase")

SceneLobby = class("SceneLobby", SceneBase)

local sceneObj = {}
local activeSceneIndex, openStep

function SceneLobby:initialize(transform, name)
	SceneBase.initialize(self, transform, name)

	self.animationName = ""
	self.sceneTbl = {}

	for i = 0, self.tfSelf.childCount - 1 do
		local _tf = self.tfSelf:GetChild(i)

		if StringHelper.StartsWith(_tf.name, "Scene") then
			local index = string.sub(_tf.name, 6)

			index = tonumber(index)
			self.sceneTbl[index] = _tf

			_tf.gameObject:SetActive(false)
		end
	end
end

function SceneLobby:ChangeSceneStatus(sceneIndex)
	local activeScene

	for _k, _v in pairs(self.sceneTbl) do
		if _k == sceneIndex then
			_v.gameObject:SetActive(true)

			activeScene = _v
		else
			_v.gameObject:SetActive(false)
		end
	end

	if activeScene == nil then
		return
	end

	self:InitSceneObj(activeScene)

	activeSceneIndex = sceneIndex
end

function SceneLobby:InitSceneObj(activeScene)
	sceneObj = {}
	sceneObj.Hero = {}

	for i = 0, activeScene.childCount - 1 do
		local _tf = activeScene:GetChild(i)

		if _tf.name == "Camera" then
			self.cameraAnimation = _tf.transform:GetComponent("Animation")
			sceneObj[_tf.name] = _tf
		elseif StringHelper.StartsWith(_tf.name, "hero") then
			if string.len(_tf.name) >= 5 then
				local heroId = string.sub(_tf.name, 5)

				heroId = tonumber(heroId)
				sceneObj.Hero[heroId] = _tf
			else
				sceneObj.ChooseHero = _tf
			end
		else
			sceneObj[_tf.name] = _tf
		end
	end
end

function SceneLobby:GetFollowingCamera()
	return sceneObj.Camera
end

function SceneLobby:GetHeroParent()
	return sceneObj.Hero
end

function SceneLobby:GetChooseHeroParent()
	return sceneObj.ChooseHero
end

function SceneLobby:Update()
	return
end

function SceneLobby:PlayMoveOut(immediately)
	local animationName = "scene" .. activeSceneIndex .. "_out"

	self.animationName = animationName

	self.cameraAnimation:Play(animationName)

	local v_as = self.cameraAnimation:get_Item(animationName)

	v_as.speed = 3

	if immediately then
		v_as.normalizedTime = 1
	end
end

function SceneLobby:PlayMoveIn(immediately)
	local animationName = "scene" .. activeSceneIndex .. "_in"

	self.animationName = animationName

	self.cameraAnimation:Play(animationName)

	local v_as = self.cameraAnimation:get_Item(animationName)

	v_as.speed = 3

	if immediately then
		v_as.normalizedTime = 1
	end
end

function SceneLobby:IsAnimationEnd()
	if self.cameraAnimation == nil then
		return true
	end

	local animationName = self.animationName

	if animationName == "" then
		return true
	end

	local v_as = self.cameraAnimation:get_Item(animationName)

	if not self.cameraAnimation.isPlaying or v_as.normalizedTime >= 1 then
		self.animationName = ""

		return true
	end

	return false
end

function SceneLobby:UpdateRender()
	SceneBase.UpdateRender(self)
end

function SceneLobby:LateUpdateRender()
	SceneBase.LateUpdateRender(self)
end

function SceneLobby:Exit()
	SceneBase.Exit(self)

	self.tfSelf = nil
	self.sceneTbl = nil
end
