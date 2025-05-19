-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Item/ItemScene.lua

ItemScene = class("ItemScene")
ItemScene.static.EatDistance = 2
ItemScene.static.AutoGetDistance = 1.5
ItemScene.static.AutoGetMaxDistance = 3
ItemScene.static.YDistance = 1.5
ItemScene.static.SceneMarkStatusDistance = 2
ItemScene.static.Type = {
	Drop = 2,
	Scene = 1
}

function ItemScene:initialize(type, id, num, pos, autoPlayEffect)
	local effectId = 0

	if type == ItemScene.Type.Scene then
		local storyItemData = MS_StoryItem.GetItemData(FS_UserData.story:GetStoryId(), id)

		self.sceneItemId = id
		self.itemId = tonumber(storyItemData.ItemId)
		self.itemNum = tonumber(storyItemData.Num)
		self.elevatorId = tonumber(storyItemData.ElevatorId)

		if storyItemData.Effect ~= nil and storyItemData.Effect > 0 then
			effectId = tonumber(storyItemData.Effect)
		end
	else
		self.itemId = tonumber(id)
		self.itemNum = tonumber(num)
		self.elevatorId = 0
	end

	if FS_UserData.story:IsStoryMode(FS_SaveStory.StoryMode.Arcade) and table.contains(MS_ItemData.ItemID_TalentAddList, self.itemId) then
		local nowHeroId = FS_UserData.story:GetSelectHeroIdNow()

		if nowHeroId ~= 10007 or FS_UserData.story:IsArcadeMode(FS_SaveStory.ArcadeMode.StageSelect) or FS_UserData.heroList:GetHero(nowHeroId):IsTalentStoneEnough(self.itemId - 50000) then
			local TempData = MS_ItemData.GetItemData(self.itemId)

			if TempData.Param1 ~= 0 then
				self.itemId = TempData.Param1
			end
		end
	end

	self.sceneItemType = type
	self.itemData = MS_ItemData.GetItemData(self.itemId)
	self.itemMainType = self.itemData.MainType
	self.itemType = self.itemData.Type
	self.position = pos:Clone()

	if effectId <= 0 and self.itemData.Effect ~= nil and self.itemData.Effect > 0 then
		effectId = tonumber(self.itemData.Effect)
	end

	self.effectIndex = 0

	if effectId > 0 and autoPlayEffect == true then
		self.effectIndex = VfxManager.PlayStatic("vfx_item_" .. effectId, self.position)
	end

	self.time = TimeHelper.getNowTime()
	self.moving = false
	self.replaceItemId = 0
	self.replaceItemNum = 0
	self.replaceItemData = nil
end

function ItemScene:GetItemId()
	return self.itemId
end

function ItemScene:GetSceneItemId()
	return self.sceneItemId
end

function ItemScene:GetItemNum()
	return self.itemNum
end

function ItemScene:IsMoving()
	return self.moving
end

function ItemScene:SetMoving(bool)
	self.moving = bool
end

function ItemScene:GetItemData()
	return self.itemData
end

function ItemScene:GetTime()
	return self.time
end

function ItemScene:GetSceneItemType()
	return self.sceneItemType
end

function ItemScene:GetMainType()
	return self.itemMainType
end

function ItemScene:GetElevatorId()
	return self.elevatorId
end

function ItemScene:IsAttachItemType()
	if self.itemType == MS_ItemData.Type.Document or self.itemType == MS_ItemData.Type.SceneMark then
		return false
	end

	local ret = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.AutoGetItem)

	if ret > 0 then
		return true
	else
		return self.itemMainType == MS_ItemData.MainType.Exp
	end
end

function ItemScene:IsAttachItem(heroId)
	if self.itemType == MS_ItemData.Type.Document or self.itemType == MS_ItemData.Type.SceneMark then
		return false
	end

	if self.itemMainType == MS_ItemData.MainType.Exp then
		return true
	end

	local ret = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.AutoGetItem)

	if ret > 0 then
		if self.itemMainType == MS_ItemData.MainType.Trophy then
			if FS_UserData.GetTrophyCount() >= MS_ItemData.TrophyCapacity then
				return false
			else
				return true
			end
		end

		if self.itemId == MS_ItemData.ItemID_HpAdd then
			local tmpHeroData = FS_UserData.heroList:GetHero(heroId)

			return not tmpHeroData:IsHpNumMax()
		elseif self.itemId == MS_ItemData.ItemID_MpAdd then
			local tmpHeroData = FS_UserData.heroList:GetHero(heroId)

			return not tmpHeroData:IsMpNumMax()
		elseif self.itemId == MS_ItemData.ItemID_BulletAdd then
			local tmpHero = ST_Main.GetSceneController():GetHostPlayerById(10002)

			return not tmpHero:IsBulletMax()
		else
			local itemData = MS_ItemData.GetItemData(self.itemId)

			if FS_UserData.itemList:GetItemNum(self.itemId) >= itemData.NumMax then
				return false
			else
				return true
			end
		end
	end
end

function ItemScene:IsEquipAutoGetItemTrophy()
	local ret = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.AutoGetItem)

	return ret > 0
end

function ItemScene:GetPosition()
	return self.position
end

function ItemScene:SetPosition(pos)
	self.position:SetVector3(pos)

	if self.effectIndex > 0 then
		VfxManager.SetStaticPosition(self.effectIndex, pos)
	end
end

function ItemScene:SetReplaceItem(id, num)
	self.replaceItemData = MS_ItemData.GetItemData(id)

	if self.replaceItemData ~= nil then
		self.replaceItemId = id
		self.replaceItemNum = num
	end
end

function ItemScene:GetReplaceItemId()
	return self.replaceItemId
end

function ItemScene:GetReplaceItemNum()
	return self.replaceItemNum
end

function ItemScene:GetReplaceItemData()
	return self.replaceItemData
end

function ItemScene:CheckEatItem(pos)
	if self.itemId == MS_ItemData.SceneMarkItemMaze then
		return false
	end

	local dis = Vector3.Distance2DSquare(self.position, pos)

	if self:IsAttachItemType() then
		if self:IsEquipAutoGetItemTrophy() then
			if dis < ItemScene.AutoGetMaxDistance * ItemScene.AutoGetMaxDistance and Mathf.Abs(self.position.y - pos.y) < ItemScene.YDistance then
				return true
			end
		elseif dis < ItemScene.AutoGetDistance * ItemScene.AutoGetDistance and Mathf.Abs(self.position.y - pos.y) < ItemScene.YDistance then
			return true
		end
	elseif dis < ItemScene.EatDistance * ItemScene.EatDistance and Mathf.Abs(self.position.y - pos.y) < ItemScene.YDistance then
		return true
	end

	return false
end

function ItemScene:CheckShowActionButton(pos)
	local dis = Vector3.Distance2DSquare(self.position, pos)

	if dis < ItemScene.EatDistance * ItemScene.EatDistance and Mathf.Abs(self.position.y - pos.y) < ItemScene.YDistance then
		return true
	end

	return false
end

function ItemScene:CheckAroundStatus(pos)
	if self.itemId == MS_ItemData.SceneMarkItem or self.itemId == MS_ItemData.SceneMarkItemMaze then
		local dis = Vector3.DistanceSquare(self.position, pos)

		if dis < ItemScene.SceneMarkStatusDistance * ItemScene.SceneMarkStatusDistance then
			return true
		end
	end

	return false
end

function ItemScene:EatItem()
	if self.effectIndex > 0 then
		VfxManager.ClearStatic(self.effectIndex)
	end

	self.effectIndex = 0

	self:PlayDisappearEffect()
end

function ItemScene:PlayEffect()
	if self.itemData ~= nil and self.effectIndex <= 0 and self.itemData.Effect ~= nil and self.itemData.Effect > 0 then
		self.effectIndex = VfxManager.PlayStatic("vfx_item_" .. self.itemData.Effect, self.position)
	end
end

function ItemScene:PlayDisappearEffect()
	if self.itemData ~= nil and self.itemData.DisappearEffect ~= nil and self.itemData.DisappearEffect > 0 then
		VfxManager.PlayFreezeMulti("vfx_item_dissipate_" .. self.itemData.DisappearEffect, self.position, nil, nil)
	end
end

function ItemScene:Exit()
	self.itemData = nil
	self.position = nil
	self.replaceItemData = nil

	if self.effectIndex > 0 then
		VfxManager.ClearStatic(self.effectIndex)
	end

	self.effectIndex = 0
end

return ItemScene
