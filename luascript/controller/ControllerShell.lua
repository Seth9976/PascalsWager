-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerShell.lua

require("LuaScript/Logic/Player/Shell")

ControllerShell = class("ControllerShell")
ControllerShell.static.Type = {
	Bullet = 1,
	Trick = 2
}
ControllerShell.static.ShellShape = {
	Sphere = 2,
	Capsule = 1,
	Box = 3
}
ControllerShell.ShellStartIndex = 1

function ControllerShell:initialize()
	self.shellList = nil
	ControllerShell.ShellStartIndex = 1
	self.sceneController = ST_Main.GetSceneController()

	local go = GoFind("ShellRoot")
	local tfShell = go.transform

	self.tfShellCapsule = TfFindChild(tfShell, "ShellCapsule")
	self.tfShellSphere = TfFindChild(tfShell, "ShellSphere")
	self.tfShellBox = TfFindChild(tfShell, "ShellBox")
end

function ControllerShell:CreateShell(fromTransform, fromAnimalId, fromTeamId, id, shape)
	local ret = 0

	if self.shellList == nil then
		self.shellList = {}
	end

	if self.shellList[ControllerShell.ShellStartIndex] == nil and fromTransform ~= nil then
		local tfShell
		local createFlg = false

		if fromTransform.gameObject.layer == LayerShell then
			local collider = fromTransform:GetComponent(typeof("UnityEngine.Collider"))

			if collider == nil then
				SystemHelper.LogError("====CreateShell====error!!!==1111==")

				return ret
			end

			tfShell = fromTransform
		end

		if tfShell == nil then
			if shape == ControllerShell.ShellShape.Capsule then
				tfShell = GoInstantiate(self.tfShellCapsule)
				createFlg = true
			elseif shape == ControllerShell.ShellShape.Sphere then
				tfShell = GoInstantiate(self.tfShellSphere)
				createFlg = true
			elseif shape == ControllerShell.ShellShape.Box then
				tfShell = GoInstantiate(self.tfShellBox)
				createFlg = true
			end

			if createFlg == true then
				tfShell.name = "shell_" .. ControllerShell.ShellStartIndex
				tfShell.parent = fromTransform
				tfShell.localScale = Vector3.one
				tfShell.localPosition = Vector3.zero

				tfShell.gameObject:SetActive(true)
			end
		end

		if tfShell ~= nil then
			local collider

			if shape == ControllerShell.ShellShape.Capsule then
				collider = tfShell:GetComponent(typeof("UnityEngine.CapsuleCollider"))
			elseif shape == ControllerShell.ShellShape.Sphere then
				collider = tfShell:GetComponent(typeof("UnityEngine.SphereCollider"))
			elseif shape == ControllerShell.ShellShape.Box then
				collider = tfShell:GetComponent(typeof("UnityEngine.BoxCollider"))
			end

			if collider ~= nil then
				local retShell = Shell:new(tfShell, fromAnimalId, fromTeamId, ControllerShell.ShellStartIndex, id, shape, collider)

				if retShell ~= nil then
					self.shellList[ControllerShell.ShellStartIndex] = retShell

					XCollider.AddShellCollider(ControllerShell.ShellStartIndex, collider)

					ret = ControllerShell.ShellStartIndex
					ControllerShell.ShellStartIndex = ControllerShell.ShellStartIndex + 1
				elseif createFlg == true then
					GoDestroyImmediate(tfShell.gameObject)
				end
			end
		else
			SystemHelper.LogError("====CreateShell====error!!!===22222=")
		end

		tfShell = nil
	end

	return ret
end

function ControllerShell:GetShell(index)
	if self.shellList ~= nil and index > 0 then
		return self.shellList[index]
	end

	return nil
end

function ControllerShell:RemoveShell(index)
	if self.shellList ~= nil and index > 0 then
		self.shellList[index]:Exit()
		XCollider.RemoveShellCollider(index)

		self.shellList[index] = nil
	end
end

function ControllerShell:ClearShellAll()
	if self.shellList ~= nil then
		for index, shell in pairs(self.shellList) do
			if shell ~= nil then
				shell:Exit()
			end
		end
	end

	XCollider.ClearShellColliderAll()

	self.shellList = nil
end

function ControllerShell:Update()
	if self.shellList == nil then
		return
	end

	local deleteIdList

	for index, shell in pairs(self.shellList) do
		if shell ~= nil then
			local ret = shell:Update()

			if ret == false then
				if deleteIdList == nil then
					deleteIdList = {}
				end

				table.insert(deleteIdList, index)
			end
		end
	end

	if deleteIdList ~= nil and #deleteIdList > 0 then
		for i = 1, #deleteIdList do
			local index = deleteIdList[i]

			self:RemoveShell(index)
		end
	end

	deleteIdList = nil
end

function ControllerShell:CheckHit()
	if self.shellList ~= nil then
		for index, shell in pairs(self.shellList) do
			if shell ~= nil then
				shell:CheckHit()
			end
		end
	end
end

function ControllerShell:GetAutoLockTarget(nowPos)
	local minDis = 999999
	local targetShell

	if self.shellList ~= nil then
		for index, shell in pairs(self.shellList) do
			if shell:IsWillDead() == false and shell:IsShow() == true then
				local tmpPos = shell:GetPosByWorldPos()
				local tmpDis = Vector3.Distance(nowPos, tmpPos)

				if tmpDis < minDis and tmpDis < AnimalBase_Define.AutoLockDistance then
					minDis = tmpDis
					targetShell = shell
				end
			end
		end
	end

	return targetShell
end

function ControllerShell:Exit()
	self:ClearShellAll()
end

return ControllerShell
