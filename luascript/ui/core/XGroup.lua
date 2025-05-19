-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Core/XGroup.lua

XGroup = class("XGroup")

function XGroup:initialize()
	self.children = {}
	self.childrenRT = {}
	self.name = ""
	self.groupId = 0
	self.mode = XGroup.GroupMode.Common
end

XGroup.GroupMode = {
	Common = 1,
	Button = 2
}

function XGroup:SetMode(mode)
	self.mode = mode
end

function XGroup:SetName(name)
	self.name = name
end

function XGroup:Add(child)
	table.insert(self.children, child)

	if self.mode == XGroup.GroupMode.Button then
		child.group = self
	end
end

function XGroup:Remove(child)
	for _k, _v in pairs(self.children) do
		if _v == child then
			_v.group = nil

			table.remove(self.children, _k)

			break
		end
	end
end

function XGroup:NotifyOn(child)
	if self.mode ~= XGroup.GroupMode.Button then
		return
	end

	for _k, _v in pairs(self.children) do
		if _v ~= child and _v.mode == XButton.ButtonMode.Radio and _v.selected then
			_v:SetNormal()
		end
	end
end

function XGroup:GetChildAt(index)
	if index <= 0 or index > #self.children then
		return nil
	end

	return self.children[index]
end

function XGroup:GetSelectChildren()
	local sList = {}

	for _k, _v in pairs(self.children) do
		if _v.selected then
			table.insert(sList, _v)
		end
	end

	return sList
end

function XGroup:SetActive(flag)
	for _k, _v in pairs(self.children) do
		if not IsNil(_v.gameObject) then
			_v.gameObject:SetActive(flag)
		end
	end
end

function XGroup:SetRectTransform()
	for _k, _v in pairs(self.children) do
		if not IsNil(_v.gameObject) then
			table.insert(self.childrenRT, _v.gameObject:GetComponent("RectTransform"))
		end
	end
end

function XGroup:ForceRebuildLayout(flag)
	if flag then
		for _k, _v in pairs(self.childrenRT) do
			if not IsNil(_v) then
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(_v)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(_v)
			end
		end
	end
end

function XGroup:SetAlpha(alpha)
	for _k, _v in pairs(self.children) do
		if not IsNil(_v.gameObject) then
			local _cg = _v:GetComponent("CanvasGroup")

			if _cg and alpha >= 0 and alpha <= 1 then
				_cg.alpha = alpha
			end
		end
	end
end

function XGroup:SetShown(flag)
	local layerName = flag and "UINotRender" or "UI"

	Common.Log("Layer Name: " .. layerName)

	for _k, _v in pairs(self.children) do
		if not IsNil(_v.gameObject) then
			local cr = _v:GetComponent("CanvasRenderer")

			cr.gameObject:SetActive(flag)
		end
	end
end

function XGroup:GetComponentsInChildren(comType, includeInactive)
	local list = {}

	for _k, _v in pairs(self.children) do
		local tfs = _v.transform:GetComponentsInChildren(comType, includeInactive)

		if tfs.Length > 0 then
			for i = 0, tfs.Length - 1 do
				table.insert(list, tfs[i])
			end
		end
	end

	return list
end

return XGroup
