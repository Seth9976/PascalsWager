-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Item/ItemSceneAttach.lua

ItemSceneAttach = class("ItemSceneAttach")
ItemSceneAttach.static.OriSpeed = 0.005
ItemSceneAttach.static.GetDistance = 0.1
ItemSceneAttach.static.SpeedDelta = 0.012
ItemSceneAttach.static.OriOutSpeed = 0.008
ItemSceneAttach.static.OutSpeedDelta = 0.008
ItemSceneAttach.static.State = {
	Second = 2,
	First = 1
}

function ItemSceneAttach:initialize(itemScene, targetHero, retItem, retItemNum, completeCB)
	self.targetHero = targetHero
	self.completeCallback = completeCB

	itemScene:SetMoving(true)

	self.itemId = itemScene:GetItemId()
	self.itemNum = itemScene:GetItemNum()
	self.sceneItemType = itemScene:GetSceneItemType()
	self.position = itemScene:GetPosition()

	if retItem == nil then
		self.UIItemId = 0
	else
		self.UIItemId = retItem:GetItemId()
	end

	self.UIItemNum = retItemNum
	self.effect = VfxManager.PlayFreezeMulti("vfx_item_attach_10001", self.position, nil, nil)
	self.tfSelf = self.effect.transform
	self.speed = ItemSceneAttach.OriSpeed
	self.outSpeed = ItemSceneAttach.OriOutSpeed

	local heroPos = self.targetHero:GetBodyChest().position

	self.firstTargetPos = self.tfSelf.position - heroPos

	self.firstTargetPos:Set(self.tfSelf.position.x + self.firstTargetPos.x * 0.05, self.tfSelf.position.y + 1.3, self.tfSelf.position.z + self.firstTargetPos.z * 0.05)

	self.state = ItemSceneAttach.State.First
	self.isComplete = false
end

function ItemSceneAttach:Update()
	if self.targetHero then
		if self.state == ItemSceneAttach.State.First then
			local tmpPos = Vector3.Lerp(self.tfSelf.position, self.firstTargetPos, self.outSpeed)

			self:SetPosition(tmpPos)

			self.outSpeed = self.outSpeed + ItemSceneAttach.OutSpeedDelta

			local dis = Vector3.Distance(self.tfSelf.position, self.firstTargetPos)

			if dis <= ItemSceneAttach.GetDistance then
				self.state = ItemSceneAttach.State.Second
			end
		elseif self.state == ItemSceneAttach.State.Second then
			local heroPos = self.targetHero:GetBodyChest().position
			local tmpPos = Vector3.Lerp(self.tfSelf.position, heroPos, self.speed)

			self:SetPosition(tmpPos)

			self.speed = self.speed + ItemSceneAttach.SpeedDelta

			local dis = Vector3.Distance(self.tfSelf.position, heroPos)

			if dis <= ItemSceneAttach.GetDistance then
				if self.completeCallback ~= nil then
					self.completeCallback(self)
				end

				self.completeCallback = nil
				self.isComplete = true
			end
		end
	end
end

function ItemSceneAttach:GetItemId()
	return self.itemId
end

function ItemSceneAttach:GetItemNum()
	return self.itemNum
end

function ItemSceneAttach:GetUIItemId()
	if self.UIItemId == 0 then
		return self.itemId
	else
		return self.UIItemId
	end
end

function ItemSceneAttach:GetUIItemNum()
	return self.UIItemNum
end

function ItemSceneAttach:GetSceneItemType()
	return self.sceneItemType
end

function ItemSceneAttach:SetPosition(pos)
	self.tfSelf.position = pos
end

function ItemSceneAttach:GetIsComplete()
	return self.isComplete
end

function ItemSceneAttach:ClearCallBack()
	self.completeCallback = nil
end

function ItemSceneAttach:Exit()
	self.originItem = nil
	self.targetHero = nil
	self.effectTF = nil
	self.completeCallback = nil
	self.position = nil
	self.firstTargetPos = nil

	if self.effect ~= nil then
		self.effect:Clear()

		self.effect = nil
	end
end

return ItemSceneAttach
