-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Core/XImage.lua

XImage = class("XImage")

function XImage:initialize(gameObject)
	self.gameObject = gameObject
	self.image = gameObject:GetComponent("Image")
	self.isGray = false

	if self.image == nil then
		SystemHelper.LogTest("节点" .. self.gameObject.name .. "没有image组件")
	end
end

function XImage:SetSprite(sprite)
	self.image.sprite = sprite
end

function XImage:SetTexture2d(texture2d)
	local sprite = self.image.sprite
	local rect = sprite.rect
	local pivot = sprite.pivot

	sprite = UnityEngine.Sprite.Create(texture2d, rect, pivot)
	self.image.sprite = sprite
end

function XImage:SetFillAmount(percent)
	percent = Mathf.Clamp01(percent)
	self.image.fillAmount = percent
end

function XImage:GetFillAmount()
	return self.image.fillAmount
end

function XImage:SetRaycastEnabled(flag)
	self.image.raycastTarget = flag
end

function XImage:SetGray(flag)
	if self.isGray ~= flag then
		self.isGray = flag

		if flag then
			self.image.material = loadMgr:LoadMaterial("Materials/GrayImageMat")
		else
			self.image.material = nil
		end
	end
end

function XImage:GetMaterial()
	return self.image.material
end

function XImage:SetMaterial(materialName)
	if materialName then
		local material = loadMgr:LoadMaterial(materialName)

		if material then
			self.image.material = material
		else
			Common.Log("No available material......")
		end
	else
		Common.Log("No available material......Error in name")
	end
end

function XImage:SetAlpha(alpha)
	self.image.color = Color.New(1, 1, 1, alpha)
end

function XImage:SetColor(r, g, b, a)
	self.image.color = Color.New(r, g, b, a)
end

return XImage
