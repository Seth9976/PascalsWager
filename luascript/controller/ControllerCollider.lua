-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerCollider.lua

require("LuaScript/Logic/Collider/ColliderCube")
require("LuaScript/Logic/Collider/ColliderSphere")
require("LuaScript/Logic/Collider/ColliderCapsule")

ControllerCollider = class("ControllerCollider")
ControllerCollider.static.ColliderType = {
	Sphere = 2,
	Cube = 1,
	Capsule = 3
}
ControllerCollider.ColliderStartIndex = 1

function ControllerCollider:initialize()
	self.colliderList = {}
	ControllerCollider.ColliderStartIndex = 1
	self.sceneController = ST_Main.GetSceneController()
end

function ControllerCollider:CreateCollider(type, fromVPlayer, originVPlayer, skillData, itemData, pos, time, extendX, extendY, extendZ)
	local retCollider
	local ret = 0

	if type == ControllerCollider.ColliderType.Cube then
		retCollider = ColliderCube:new(ControllerCollider.ColliderStartIndex, fromVPlayer, originVPlayer, skillData, itemData, pos, time, extendX, extendY, extendZ)
		ret = self:AddCollider(retCollider)
	elseif type == ControllerCollider.ColliderType.Sphere then
		retCollider = ColliderSphere:new(ControllerCollider.ColliderStartIndex, fromVPlayer, originVPlayer, skillData, itemData, pos, time, extendX, extendY, extendZ)
		ret = self:AddCollider(retCollider)
	elseif type == ControllerCollider.ColliderType.Capsule then
		retCollider = ColliderCapsule:new(ControllerCollider.ColliderStartIndex, fromVPlayer, originVPlayer, skillData, itemData, pos, time, extendX, extendY, extendZ)
		ret = self:AddCollider(retCollider)
	else
		SystemHelper.LogError("============CreateCollider error type =" .. type)

		return ret
	end

	ControllerCollider.ColliderStartIndex = ControllerCollider.ColliderStartIndex + 1

	return ret
end

function ControllerCollider:AddCollider(collider)
	if collider ~= nil then
		if self.colliderList == nil then
			self.colliderList = {}
		end

		if self.colliderList[ControllerCollider.ColliderStartIndex] == nil then
			self.colliderList[ControllerCollider.ColliderStartIndex] = collider
		end

		return ControllerCollider.ColliderStartIndex
	end

	return 0
end

function ControllerCollider:GetCollider(index)
	if self.colliderList ~= nil and index > 0 then
		return self.colliderList[index]
	end

	return nil
end

function ControllerCollider:ClearCollider(index)
	if self.colliderList ~= nil and index > 0 then
		self.colliderList[index] = nil
	end
end

function ControllerCollider:ClearColliderAll()
	if self.colliderList ~= nil then
		for index, collider in pairs(self.colliderList) do
			if collider ~= nil then
				collider:Exit()
			end
		end
	end

	self.colliderList = nil
end

function ControllerCollider:Update()
	local deleteList

	if self.colliderList ~= nil then
		for index, collider in pairs(self.colliderList) do
			if collider ~= nil then
				local ret = collider:Update()

				if ret == false then
					if deleteList == nil then
						deleteList = {}
					end

					table.insert(deleteList, index)
				end
			end
		end
	end

	if deleteList ~= nil and #deleteList > 0 then
		for i = #deleteList, 1, -1 do
			local delIndex = deleteList[i]
			local collider = self.colliderList[delIndex]

			if collider ~= nil then
				collider:Exit()
			end

			self.colliderList[delIndex] = nil
		end
	end

	deleteList = nil
end

function ControllerCollider:CheckCollider()
	if self.colliderList ~= nil then
		for index, collider in pairs(self.colliderList) do
			local colliderCube = collider:GetColliderCube()
			local colliderFromVirtualPlayer = collider:GetFromVirtualPlayer()
			local colliderOriginVirtualPlayer = collider:GetOriginVirtualPlayer()
			local colliderSkillData = collider:GetSkillData()
			local colliderItemData = collider:GetItemData()
			local colliderPosition = collider:GetPosition()
			local colliderHitType = collider:GetHitType()
			local ignoreAnimalId = collider:GetIgnoreAnimalId()
			local hitAnimalIdList, hitShellIdList
			local colliderCubeList = {
				colliderCube
			}
			local retColliderNum, retOwnerIdList, retLayerList = GameCollider.CheckCubeCollider(nil, colliderCubeList, false)

			if retColliderNum > 0 and retOwnerIdList ~= nil and retLayerList ~= nil then
				for j = 0, retColliderNum - 1 do
					local ownerId = retOwnerIdList[j]
					local hitLayer = retLayerList[j]

					if ownerId ~= nil and hitLayer ~= nil then
						if hitLayer == LayerShell then
							if hitShellIdList == nil then
								hitShellIdList = {}
							end

							hitShellIdList[ownerId] = 1
						elseif hitLayer ~= LayerAnimalSkill then
							if hitAnimalIdList == nil then
								hitAnimalIdList = {}
							end

							hitAnimalIdList[ownerId] = 1
						end
					end
				end
			end

			colliderCubeList = nil

			if hitAnimalIdList ~= nil then
				for tmpAnimalId, _ in pairs(hitAnimalIdList) do
					if ignoreAnimalId <= 0 or tmpAnimalId ~= ignoreAnimalId then
						local animal = self.sceneController:FindPlayerById(tmpAnimalId)

						if animal ~= nil then
							local retIn = collider:IsInSelectTarget(animal)

							if retIn == true and animal:IsWillDead() == false and animal:IsShow() == true and animal:IsMuteki(nil) == false and collider:IsHaveHitAnimal(animal) == false then
								if animal.useHitBone > 0 then
									local colliderIndexList = {}
									local tmpColliderNum, tmpColliderlIdList, tmpLayerList = GameCollider.GetOverlapColliderBone(tmpAnimalId)

									if tmpColliderNum > 0 and tmpColliderlIdList ~= nil then
										for k = 0, tmpColliderNum - 1 do
											local colliderIndex = tmpColliderlIdList[k]

											if colliderIndex ~= nil and colliderIndex >= 0 then
												table.insert(colliderIndexList, colliderIndex)
											end
										end
									end

									if #colliderIndexList > 0 then
										colliderIndexList = table.unique(colliderIndexList, true)
									end

									if #colliderIndexList > 0 then
										GameCollider.SkillColliderExplode(colliderFromVirtualPlayer, colliderOriginVirtualPlayer, animal, colliderSkillData, colliderItemData, colliderPosition, colliderHitType, colliderIndexList)
										collider:AddHitAnimal(animal)
									end
								else
									GameCollider.SkillColliderExplode(colliderFromVirtualPlayer, colliderOriginVirtualPlayer, animal, colliderSkillData, colliderItemData, colliderPosition, colliderHitType, nil)
									collider:AddHitAnimal(animal)
								end
							end
						end
					end
				end
			end

			if hitShellIdList ~= nil then
				SystemHelper.LogTest("=======ControllerCollider=====CheckCollider=====hitShellIdList!!!==")

				for tmpShellId, _ in pairs(hitShellIdList) do
					local hitShell = self.sceneController:FindShellById(tmpShellId)

					if hitShell ~= nil then
						local retIn = collider:IsInSelectTargetForShell(hitShell)

						if retIn == true and hitShell:IsWillDead() == false and hitShell:IsShow() == true and collider:IsHaveHitShell(hitShell) == false then
							GameCollider.SkillColliderShellExplode(colliderFromVirtualPlayer, colliderOriginVirtualPlayer, hitShell, colliderSkillData, colliderItemData, colliderPosition)
							collider:AddHitShell(hitShell)
						end
					end
				end
			end

			hitAnimalIdList = nil
			hitShellIdList = nil
		end
	end
end

function ControllerCollider:Exit()
	self:ClearColliderAll()
end

return ControllerCollider
