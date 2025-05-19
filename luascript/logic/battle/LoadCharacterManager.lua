-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/LoadCharacterManager.lua

LoadCharacterManager = class("LoadCharacterManager")
LoadCharacterManager.static.LoadType = {
	Game = 1,
	UI = 3,
	TimeLine = 4,
	Movie = 2
}

function LoadCharacterManager:initialize()
	self.tfCharacterTemplate = GoFind("CharacterTemplate").transform
	self.tfCharacterTemplateList = {}
	self.tfCharacterCache = GoFind("CharacterCache").transform
	self.tfCharacterTemp = GoFind("CharacterTemp").transform
	self.tfCharacterCacheList = {}
	self.tfCharacterAnimatorList = {}
	self.tfCharacterAnimatorUIList = {}
	self.tfCharacterModel = {}
	self.tfCharacterMaterial = {}
	self.characterNum = 0
	self.sanMaterial = loadMgr:LoadMaterial("Materials/NightmareSan")
	self.sanRedMaterial = nil
	self.sanBlueMaterial = nil
end

function LoadCharacterManager:LoadSpecialSanMaterial()
	self.sanRedMaterial = loadMgr:LoadMaterial("Materials/NightmareSanRed")
	self.sanBlueMaterial = loadMgr:LoadMaterial("Materials/NightmareSanBlue")
end

function LoadCharacterManager:GetSanMaterial()
	return self.sanMaterial
end

function LoadCharacterManager:GetSanRedMaterial()
	return self.sanRedMaterial
end

function LoadCharacterManager:GetSanBlueMaterial()
	return self.sanBlueMaterial
end

function LoadCharacterManager:InitAnimator(id, charaAnimator)
	if self.tfCharacterAnimatorList[id] == nil and charaAnimator ~= nil then
		self.tfCharacterAnimatorList[id] = charaAnimator
	end
end

function LoadCharacterManager:InitAnimatorUI(id, charaAnimatorUI)
	if self.tfCharacterAnimatorUIList[id] == nil and charaAnimatorUI ~= nil then
		self.tfCharacterAnimatorUIList[id] = charaAnimatorUI
	end
end

function LoadCharacterManager:InitModel(id, tfModel)
	id = tonumber(id)

	if self.tfCharacterTemplateList ~= nil and self.tfCharacterTemplateList[id] ~= nil then
		return
	end

	if self.tfCharacterModel[id] == nil and tfModel ~= nil then
		tfModel:SetParent(self.tfCharacterTemp)

		self.tfCharacterModel[id] = tfModel
		self.characterNum = self.characterNum + 1
	end
end

function LoadCharacterManager:InitCharacterAll()
	for id, tfModel in pairs(self.tfCharacterModel) do
		tfModel.name = "hero" .. id
		tfModel.localScale = Vector3.one
		tfModel.localPosition = Vector3.zero
		tfModel.localRotation = Quaternion.identity

		tfModel:SetParent(self.tfCharacterTemplate)
		tfModel.gameObject:SetActive(false)

		if self.tfCharacterAnimatorList[id] ~= nil then
			local animator = tfModel:GetComponent("Animator")

			animator.runtimeAnimatorController = self.tfCharacterAnimatorList[id]
		end

		if self.tfCharacterCacheList[id] == nil then
			self.tfCharacterCacheList[id] = {}
		end

		self.tfCharacterTemplateList[id] = tfModel

		local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(id)
		local modelName = BattleData.GetHeroName(tmpHeroId)

		FmodManager.LoadBank(modelName)
	end

	self.tfCharacterModel = {}
end

function LoadCharacterManager:IsHaveCharacterInTemplate(id)
	if self.tfCharacterTemplateList[id] ~= nil then
		return true
	end

	return false
end

function LoadCharacterManager:LoadCharacter(id, loadType)
	id = tonumber(id)

	if loadType == LoadCharacterManager.LoadType.Game and self.tfCharacterCacheList[id] ~= nil and #self.tfCharacterCacheList[id] > 0 then
		local index = #self.tfCharacterCacheList[id]
		local goChara = self.tfCharacterCacheList[id][index]

		goChara.name = "hero" .. id
		goChara.transform.localScale = Vector3.one
		goChara.transform.localPosition = Vector3.zero
		goChara.transform.localRotation = Quaternion.identity

		goChara.transform:SetParent(self.tfCharacterTemp)
		table.remove(self.tfCharacterCacheList[id], index)

		return goChara
	end

	if self.tfCharacterTemplateList[id] ~= nil then
		local goChara = GoInstantiate(self.tfCharacterTemplateList[id].gameObject)

		goChara.name = "hero" .. id
		goChara.transform.localScale = Vector3.one
		goChara.transform.localPosition = Vector3.zero
		goChara.transform.localRotation = Quaternion.identity

		if loadType == LoadCharacterManager.LoadType.UI and self.tfCharacterAnimatorUIList[id] ~= nil then
			local animator = goChara.transform:GetComponent("Animator")

			animator.runtimeAnimatorController = self.tfCharacterAnimatorUIList[id]
		end

		goChara.transform:SetParent(self.tfCharacterTemp)

		return goChara.transform
	end

	return nil
end

function LoadCharacterManager:BackupCharacter()
	for heroId, template in pairs(self.tfCharacterTemplateList) do
		if template ~= nil then
			local goChara = GoInstantiate(template.gameObject)

			self:UnloadCharacter(heroId, goChara.transform)
		end
	end
end

function LoadCharacterManager:UnloadCharacter(heroId, tfCharacter)
	local id = tonumber(heroId)

	if tfCharacter == nil then
		return
	end

	if self.tfCharacterCacheList[id] == nil then
		self.tfCharacterCacheList[id] = {}
	end

	local index = #self.tfCharacterCacheList[id] + 1

	tfCharacter.name = "hero" .. id .. "_" .. index
	tfCharacter.localScale = Vector3.one
	tfCharacter.localPosition = Vector3.zero
	tfCharacter.localRotation = Quaternion.identity

	tfCharacter:SetParent(self.tfCharacterCache)
	tfCharacter.gameObject:SetActive(false)
	table.insert(self.tfCharacterCacheList[id], tfCharacter)

	tfCharacter = nil
end

function LoadCharacterManager:DestroyCharacterCache()
	for id, cacheList in pairs(self.tfCharacterCacheList) do
		if cacheList ~= nil and #cacheList > 0 then
			for index = #cacheList, 1, -1 do
				if cacheList[index] ~= nil then
					GoDestroyImmediate(cacheList[index].gameObject)

					cacheList[index] = nil

					table.remove(cacheList, index)
				end
			end
		end
	end

	self.tfCharacterCacheList = {}
end

function LoadCharacterManager:UnloadAreaCharacter(heroIdList)
	self:DestroyCharacterCache()

	local newTemplateList = {}

	for heroId, v in pairs(heroIdList) do
		if self.tfCharacterTemplateList[heroId] ~= nil then
			newTemplateList[heroId] = self.tfCharacterTemplateList[heroId]
			self.tfCharacterTemplateList[heroId] = nil
		end
	end

	for heroId, v in pairs(self.tfCharacterTemplateList) do
		if v ~= nil then
			local animator = v:GetComponent("Animator")

			animator.runtimeAnimatorController = nil
			animator = nil

			if self.tfCharacterAnimatorUIList[heroId] ~= nil then
				GoDestroyImmediate(self.tfCharacterAnimatorUIList[heroId])

				self.tfCharacterAnimatorUIList[heroId] = nil
			end

			if self.tfCharacterAnimatorList[heroId] ~= nil then
				GoDestroyImmediate(self.tfCharacterAnimatorList[heroId])

				self.tfCharacterAnimatorList[heroId] = nil
			end

			GoDestroyImmediate(v.gameObject)

			self.tfCharacterModel[heroId] = nil
			self.tfCharacterMaterial[heroId] = nil

			local tmpHeroId = BattleData.ConvertHeroIdWithoutSkin(heroId)
			local modelName = BattleData.GetHeroName(tmpHeroId)

			FmodManager.UnloadBank(modelName)

			self.characterNum = self.characterNum - 1
		end
	end

	self.tfCharacterTemplateList = newTemplateList
end

function LoadCharacterManager:GetCharacterNum()
	return self.characterNum
end

function LoadCharacterManager:GetCharacterCacheNum()
	local ret = 0

	for k, v in pairs(self.tfCharacterCacheList) do
		ret = ret + #self.tfCharacterCacheList[k]
	end

	return ret
end

function LoadCharacterManager:IsHaveCharacterMaterial(heroId)
	if self.tfCharacterMaterial ~= nil and self.tfCharacterMaterial[heroId] ~= nil then
		return true
	end

	return false
end

function LoadCharacterManager:SetCharacterMaterial(heroId, key, mat)
	if self.tfCharacterMaterial ~= nil and mat ~= nil then
		if self.tfCharacterMaterial[heroId] == nil then
			self.tfCharacterMaterial[heroId] = {}
		end

		self.tfCharacterMaterial[heroId][key] = mat
	end
end

function LoadCharacterManager:SetCharacterMaterial2(heroId, key, subKey, mat)
	if self.tfCharacterMaterial ~= nil and mat ~= nil then
		if self.tfCharacterMaterial[heroId] == nil then
			self.tfCharacterMaterial[heroId] = {}
		end

		if self.tfCharacterMaterial[heroId][key] == nil then
			self.tfCharacterMaterial[heroId][key] = {}
		end

		self.tfCharacterMaterial[heroId][key][subKey] = mat
	end
end

function LoadCharacterManager:GetCharacterMaterial(heroId, key)
	if self.tfCharacterMaterial ~= nil and self.tfCharacterMaterial[heroId] ~= nil then
		return self.tfCharacterMaterial[heroId][key]
	end

	return nil
end

function LoadCharacterManager:GetCharacterMaterial2(heroId, key, subKey)
	if self.tfCharacterMaterial ~= nil and self.tfCharacterMaterial[heroId] ~= nil and self.tfCharacterMaterial[heroId][key] ~= nil then
		return self.tfCharacterMaterial[heroId][key][subKey]
	end

	return nil
end

function LoadCharacterManager:Exit()
	self.tfCharacterMaterial = nil
	self.tfCharacterTemplate = nil

	for k, v in pairs(self.tfCharacterTemplateList) do
		self.tfCharacterTemplateList[k] = nil
	end

	self.tfCharacterTemplateList = nil
	self.tfCharacterCache = nil

	for k, v in pairs(self.tfCharacterCacheList) do
		self.tfCharacterCacheList[k] = nil
	end

	self.tfCharacterCacheList = nil
	self.tfCharacterAnimatorList = nil
	self.tfCharacterAnimatorUIList = nil
	self.tfCharacterModel = nil

	if self.sanMaterial ~= nil then
		loadMgr:UnloadObject(self.sanMaterial)
	end

	self.sanMaterial = nil

	if self.sanRedMaterial ~= nil then
		loadMgr:UnloadObject(self.sanRedMaterial)
	end

	self.sanRedMaterial = nil

	if self.sanBlueMaterial ~= nil then
		loadMgr:UnloadObject(self.sanBlueMaterial)
	end

	self.sanBlueMaterial = nil
end
