-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerBullet.lua

require("LuaScript/Logic/Bullet/BulletRay")
require("LuaScript/Logic/Bullet/BulletStraightLine")
require("LuaScript/Logic/Bullet/BulletParabola")
require("LuaScript/Logic/Bullet/BulletChain")
require("LuaScript/Logic/Bullet/BulletFalcula")
require("LuaScript/Logic/Bullet/BulletBeam")
require("LuaScript/Logic/Bullet/BulletStraightLineMultiply")
require("LuaScript/Logic/Bullet/BulletStraightLineWeapon")
require("LuaScript/Logic/Bullet/BulletTrace")
require("LuaScript/Logic/Bullet/BulletDelayExplode")

ControllerBullet = class("ControllerBullet")
ControllerBullet.static.BulletType = {
	Beam = 6,
	Ray = 1,
	Chain = 4,
	StraightLineWeapon = 5,
	Trace = 7,
	DelayExplode = 10,
	Falcula = 9,
	StraightLine = 2,
	Parabola = 3,
	StraightLineMultiply = 8
}
ControllerBullet.static.BulletTargetType = {
	Chest = 1,
	Foot = 2
}
ControllerBullet.BulletIndex = 1

function ControllerBullet:initialize()
	self.bulletList = nil

	local root = GoFind("BulletRoot")

	self.tfBulletRoot = root.transform
	ControllerBullet.BulletIndex = 1
	self.debugList = {}
end

function ControllerBullet:CreateBullet(type, animal, skillData, itemData, startPos, endPos, speedVec3, accVec3)
	local goTmp = GoCreate("bullet_" .. ControllerBullet.BulletIndex)

	goTmp.transform.parent = self.tfBulletRoot

	if goTmp == nil then
		return 0
	end

	local retBullet
	local ret = 0

	if type == ControllerBullet.BulletType.Ray then
		retBullet = BulletRay:new(goTmp.transform, animal, skillData, itemData)
		ret = self:AddBullet(retBullet)
	elseif type == ControllerBullet.BulletType.StraightLine then
		retBullet = BulletStraightLine:new(goTmp.transform, animal, skillData, itemData)
		ret = self:AddBullet(retBullet)
	elseif type == ControllerBullet.BulletType.Parabola then
		retBullet = BulletParabola:new(goTmp.transform, animal, skillData, itemData)
		ret = self:AddBullet(retBullet)
	elseif type == ControllerBullet.BulletType.Chain then
		retBullet = BulletChain:new(goTmp.transform, animal, skillData, itemData)
		ret = self:AddBullet(retBullet)
	elseif type == ControllerBullet.BulletType.StraightLineWeapon then
		retBullet = BulletStraightLineWeapon:new(goTmp.transform, animal, skillData, itemData)
		ret = self:AddBullet(retBullet)
	elseif type == ControllerBullet.BulletType.Beam then
		retBullet = BulletBeam:new(goTmp.transform, animal, skillData, itemData)
		ret = self:AddBullet(retBullet)
	elseif type == ControllerBullet.BulletType.Trace then
		retBullet = BulletTrace:new(goTmp.transform, animal, skillData, itemData)
		ret = self:AddBullet(retBullet)
	elseif type == ControllerBullet.BulletType.StraightLineMultiply then
		retBullet = BulletStraightLineMultiply:new(goTmp.transform, animal, skillData, itemData)
		ret = self:AddBullet(retBullet)
	elseif type == ControllerBullet.BulletType.Falcula then
		retBullet = BulletFalcula:new(goTmp.transform, animal, skillData, itemData)
		ret = self:AddBullet(retBullet)
	elseif type == ControllerBullet.BulletType.DelayExplode then
		retBullet = BulletDelayExplode:new(goTmp.transform, animal, skillData, itemData)
		ret = self:AddBullet(retBullet)
	else
		SystemHelper.LogError("============CreateBullet error type =" .. type)

		return ret
	end

	if ret > 0 and retBullet ~= nil then
		retBullet:SetStartPosition(startPos)
		retBullet:SetEndPosition(endPos)
		retBullet:SetSpeed(speedVec3, accVec3)

		ControllerBullet.BulletIndex = ControllerBullet.BulletIndex + 1
	else
		SystemHelper.LogError("============CreateBullet error bullet nil !!!")
	end

	return ret
end

function ControllerBullet:AddBullet(bullet)
	if bullet ~= nil then
		if self.bulletList == nil then
			self.bulletList = {}
		end

		if self.bulletList[ControllerBullet.BulletIndex] == nil then
			self.bulletList[ControllerBullet.BulletIndex] = bullet
		end

		return ControllerBullet.BulletIndex
	end

	return 0
end

function ControllerBullet:GetBullet(index)
	if self.bulletList ~= nil and index > 0 then
		return self.bulletList[index]
	end

	return nil
end

function ControllerBullet:ClearBullet(index)
	if self.bulletList ~= nil and index > 0 then
		local bullet = self.bulletList[index]

		if bullet ~= nil then
			bullet:Exit()
		end

		self.bulletList[index] = nil
	end
end

function ControllerBullet:ClearBulletAll()
	if self.bulletList ~= nil then
		for id, tmpBullet in pairs(self.bulletList) do
			if tmpBullet ~= nil then
				tmpBullet:Exit()
			end
		end
	end

	self.bulletList = nil
end

function ControllerBullet:HandleTargetExit(animal)
	if self.bulletList ~= nil then
		for id, tmpBullet in pairs(self.bulletList) do
			if tmpBullet ~= nil then
				tmpBullet:HandleTargetExit(animal)
			end
		end
	end
end

function ControllerBullet:Update()
	local deleteList

	if self.bulletList ~= nil then
		for id, tmpBullet in pairs(self.bulletList) do
			if tmpBullet ~= nil then
				if tmpBullet:IsDead() == true or tmpBullet:IsExit() == true then
					if deleteList == nil then
						deleteList = {}
					end

					table.insert(deleteList, id)
				else
					tmpBullet:Update()
					tmpBullet:UpdateCollider()
				end
			end
		end
	end

	if deleteList ~= nil and #deleteList > 0 then
		for i = #deleteList, 1, -1 do
			local delIndex = deleteList[i]
			local bullet = self.bulletList[delIndex]

			if bullet ~= nil then
				bullet:Exit()
			end

			self.bulletList[delIndex] = nil
		end
	end

	deleteList = nil

	if DebugShowBulletRoute == true then
		self:DebugDrawLine()
	end
end

function ControllerBullet:LateUpdate()
	if self.bulletList ~= nil then
		for id, tmpBullet in pairs(self.bulletList) do
			if tmpBullet ~= nil and tmpBullet:IsDead() == false then
				tmpBullet:LateUpdate()
			end
		end
	end
end

function ControllerBullet:CheckCollider()
	if self.bulletList ~= nil then
		for id, tmpBullet in pairs(self.bulletList) do
			if tmpBullet ~= nil and tmpBullet:IsRunning() == true and tmpBullet:IsColliderMoveEnable() == true then
				local bulletFromVirtualPlayer = tmpBullet:GetFromVirtualPlayer()
				local bulletOriginVirtualPlayer = tmpBullet:GetOriginVirtualPlayer()
				local bulletSkillData = tmpBullet:GetSkillData()
				local rayHitAnimalList = tmpBullet:GetRayHitAnimalList()
				local rayHitShellList = tmpBullet:GetRayHitShellList()
				local itemData = tmpBullet:GetItemData()
				local closestAnimal, closestShell, colliderIndexList
				local intercepted = false
				local closestDis = 9999
				local closestPosition
				local interceptedForce = false

				if tmpBullet:IsIntercepted() == true then
					intercepted = true
					closestDis = tmpBullet:GetInterceptDistance()

					if closestDis <= 0 then
						interceptedForce = true
					end
				end

				if rayHitAnimalList ~= nil then
					for k, hitData in pairs(rayHitAnimalList) do
						if hitData ~= nil and hitData:IsEnable() == true then
							local animal = hitData:GetHitAnimal()

							if animal ~= nil and animal:IsWillDead() == false and animal:IsShow() == true and animal:IsMuteki(nil) == false and tmpBullet:IsHaveHitAnimal(animal) == false then
								if tmpBullet:IsThroughBody() == true then
									local retBlock = GameCollider.SkillColliderFar(bulletFromVirtualPlayer, bulletOriginVirtualPlayer, animal, bulletSkillData, itemData, tmpBullet:GetFlyDirection(), hitData:GetHitDistance(), hitData:GetColliderIndexList())

									tmpBullet:Explode(false, retBlock, animal, nil, hitData:GetHitPosition(), hitData:GetColliderIndexList())
								else
									local tmpDis = hitData:GetHitDistance()

									if tmpDis < closestDis then
										closestAnimal = animal
										colliderIndexList = hitData:GetColliderIndexList()
										intercepted = false
										closestDis = tmpDis
										closestPosition = hitData:GetHitPosition()
									end
								end
							end
						end
					end
				end

				if rayHitShellList ~= nil then
					for k, hitData in pairs(rayHitShellList) do
						if hitData ~= nil and hitData:IsEnable() == true then
							local shell = hitData:GetHitShell()

							if shell ~= nil and shell:IsWillDead() == false and shell:IsShow() == true and tmpBullet:IsHaveHitShell(shell) == false then
								if tmpBullet:IsThroughBody() == true then
									local retBlock = GameCollider.SkillColliderShellFar(bulletFromVirtualPlayer, bulletOriginVirtualPlayer, shell, bulletSkillData, itemData, tmpBullet:GetFlyDirection(), hitData:GetHitDistance())

									tmpBullet:Explode(false, retBlock, nil, shell, hitData:GetHitPosition(), nil)
								else
									local tmpDis = hitData:GetHitDistance()

									if tmpDis < closestDis then
										closestShell = shell
										colliderIndexList = nil
										intercepted = false
										closestDis = tmpDis
										closestPosition = hitData:GetHitPosition()
									end
								end
							end
						end
					end
				end

				if closestPosition ~= nil then
					if closestShell ~= nil then
						local retBlock = GameCollider.SkillColliderShellFar(bulletFromVirtualPlayer, bulletOriginVirtualPlayer, closestShell, bulletSkillData, itemData, tmpBullet:GetFlyDirection(), closestDis)

						tmpBullet:Explode(false, retBlock, nil, closestShell, closestPosition, nil)
					elseif closestAnimal ~= nil then
						local retBlock = GameCollider.SkillColliderFar(bulletFromVirtualPlayer, bulletOriginVirtualPlayer, closestAnimal, bulletSkillData, itemData, tmpBullet:GetFlyDirection(), closestDis, colliderIndexList)

						tmpBullet:Explode(false, retBlock, closestAnimal, nil, closestPosition, colliderIndexList)
					end
				end

				if intercepted == true or interceptedForce == true then
					tmpBullet:Explode(true, true, nil, nil, nil, nil)
				end
			end
		end
	end
end

function ControllerBullet:AddDebugLine(startPos, endPos)
	table.insert(self.debugList, {
		startPos,
		endPos,
		100
	})

	if #self.debugList > 10 then
		table.remove(self.debugList, 1)
	end
end

function ControllerBullet:DebugDrawLine()
	if #self.debugList > 0 then
		for i = 1, #self.debugList do
			local tmp = self.debugList[i]

			UnityEngine.Debug.DrawLine(tmp[1], tmp[2], Color.blue)
		end
	end
end

function ControllerBullet:Exit()
	self:ClearBulletAll()
end

return ControllerBullet
