-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Common/XCube.lua

XCube = class("XCube")
XCube.static.ExtendType = {
	Z = 2,
	X = 0,
	Y = 1
}
XCube.static.Type = {
	Bind = 2,
	Virtual = 1
}
XCube.static.ShapeType = {
	Capsule = 4,
	Point = 1,
	Sphere = 3,
	Cube = 2,
	None = 0
}
XCube.static.InfoType = {
	Rotation = 2,
	Position = 1
}
XCube.static.ColliderType = {
	SkillBox = 1,
	OtherBox = 3,
	BulletBox = 2
}

function XCube:initialize(type, colliderType, shapeType, bindTransform)
	self.type = type
	self.shapeType = shapeType
	self.colliderType = colliderType
	self.bindTransform = bindTransform

	if type == XCube.Type.Bind and bindTransform == nil then
		SystemHelper.LogError("========XCube bindTransform = nil ! error !!")
	end

	self.halfExtents = Vector3.zero
	self.positionLast = Vector3.zero
	self.rotationLast = Quaternion.identity
	self.position = {}
	self.rotation = {}

	local max = 1

	if self.colliderType == XCube.ColliderType.SkillBox then
		max = GameCollider.XCubeColliderMax
	end

	for i = 1, max do
		self.position[i] = Vector3.zero
		self.rotation[i] = Quaternion.identity
	end

	self.interpolationNum = 1
	self.frameLast = 0

	if DebugShowAttackBox == true then
		self.rootDebug = GoFind("Debug")
		self.goCubeList = {}
		self.goCubeRenderList = {}
	end
end

function XCube:GetColliderType()
	return self.colliderType
end

function XCube:GetShapeType()
	return self.shapeType
end

function XCube:CreateTestCube(name)
	if DebugShowAttackBox == true then
		local num = 1

		if self.colliderType == XCube.ColliderType.SkillBox then
			num = GameCollider.XCubeColliderMax
		end

		for i = 1, num do
			local goCubeRender
			local goCube = GameObject.CreatePrimitive(UnityEngine.PrimitiveType.Cube)

			if goCube ~= nil then
				goCube.name = name .. "_" .. i
				goCube.transform.parent = self.rootDebug.transform
				goCubeRender = goCube:GetComponent(typeof("UnityEngine.MeshRenderer"))
				goCubeRender.sharedMaterial = loadMgr:LoadMaterial("Materials/TestCube")

				local collider = goCube:GetComponent(typeof("UnityEngine.BoxCollider"))

				if collider ~= nil then
					collider.enabled = false
				end
			end

			self.goCubeList[i] = goCube
			self.goCubeRenderList[i] = goCubeRender
		end
	end
end

function XCube:HideTestCube()
	if DebugShowAttackBox == true and self.goCubeRenderList ~= nil then
		for i = 1, #self.goCubeRenderList do
			local goCubeRender = self.goCubeRenderList[i]

			if goCubeRender ~= nil then
				goCubeRender.enabled = false
			end
		end
	end
end

function XCube:ShowTestCube()
	if DebugShowAttackBox == true and self.goCubeRenderList ~= nil then
		for i = 1, #self.goCubeRenderList do
			local goCubeRender = self.goCubeRenderList[i]

			if goCubeRender ~= nil then
				goCubeRender.enabled = true
			end
		end
	end
end

function XCube:Exit()
	self.positionLast = nil
	self.rotationLast = nil
	self.position = nil
	self.rotation = nil
	self.halfExtents = nil
	self.bindTransform = nil

	if DebugShowAttackBox == true then
		self.goCubeRenderList = nil

		if self.goCubeList ~= nil then
			for i = 1, #self.goCubeList do
				local goCube = self.goCubeList[i]

				if goCube ~= nil then
					GoDestroy(goCube)
				end
			end

			self.goCubeList = nil
		end
	end
end

function XCube:GetPosition()
	if self.type == XCube.Type.Virtual then
		return self.position[1]
	elseif self.type == XCube.Type.Bind then
		return self.bindTransform.position
	end

	return self.position[1]
end

function XCube:GetRotation()
	if self.type == XCube.Type.Virtual then
		return self.rotation[1]
	elseif self.type == XCube.Type.Bind then
		return self.bindTransform.rotation
	end

	return self.rotation[1]
end

function XCube:GetPositionInterpolation(index)
	if index == nil or index <= 0 or index > self.interpolationNum or index > #self.position then
		return self.position[1]
	end

	return self.position[index]
end

function XCube:GetRotationInterpolation(index)
	if index == nil or index <= 0 or index > self.interpolationNum or index > #self.rotation then
		return self.rotation[1]
	end

	return self.rotation[index]
end

function XCube:SetPostionAndRotation(pos, rot)
	if self.type == XCube.Type.Virtual then
		self.positionLast:SetVector3(self.position[1])
		self.rotationLast:SetQuaternion(self.rotation[1])
		self.position[1]:SetVector3(pos)
		self.rotation[1]:SetQuaternion(rot)

		if #self.position >= 2 then
			for i = 2, #self.position do
				self.position[i]:SetVector3(self.position[1])
				self.rotation[i]:SetQuaternion(self.rotation[1])
			end
		end

		if DebugShowAttackBox == true and self.goCubeList ~= nil then
			for i = 1, #self.goCubeList do
				local goCube = self.goCubeList[i]

				if goCube ~= nil then
					goCube.transform.position = self.position[i]
					goCube.transform.rotation = self.rotation[i]
				end
			end
		end
	end
end

function XCube:UpdateInfo(frame)
	if self.type == XCube.Type.Bind then
		self.positionLast:SetVector3(self.position[1])
		self.rotationLast:SetQuaternion(self.rotation[1])
		self.position[1]:SetVector3(self.bindTransform.position)
		self.rotation[1]:SetQuaternion(self.bindTransform.rotation)
	end

	self.interpolationNum = 1

	if self.colliderType == XCube.ColliderType.SkillBox and (frame == self.frameLast or frame == self.frameLast + 1) then
		local rate = 1
		local dis = Vector3.DistanceSquare(self.positionLast, self.position[1])

		if dis > GameCollider.XCubeColliderDistanceMax * GameCollider.XCubeColliderDistanceMax then
			rate = GameCollider.XCubeColliderDistanceMax * GameCollider.XCubeColliderDistanceMax / dis
		end

		local angle = Quaternion.Angle(self.rotationLast, self.rotation[1])

		if angle > GameCollider.XCubeColliderAngleMax then
			rate = Mathf.Min(rate, GameCollider.XCubeColliderAngleMax / angle)
		end

		if rate > 0 and rate < 1 then
			local rateBase = rate

			if #self.position >= 2 then
				for i = 2, #self.position do
					local tmpPos = Vector3.Lerp(self.position[1], self.positionLast, rate)

					self.position[i]:SetVector3(tmpPos)

					local tmpRot = Quaternion.Lerp(self.rotation[1], self.rotationLast, rate)

					self.rotation[i]:SetQuaternion(tmpRot)

					tmpPos = nil
					tmpRot = nil
					self.interpolationNum = self.interpolationNum + 1
					rate = rate + rateBase

					if rate >= 1 then
						break
					end
				end
			end
		end
	end

	if DebugShowAttackBox == true and self.goCubeList ~= nil then
		for i = 1, #self.goCubeList do
			local goCube = self.goCubeList[i]

			if goCube ~= nil then
				if i <= self.interpolationNum then
					goCube.transform.position = self.position[i]
					goCube.transform.rotation = self.rotation[i]
				else
					goCube.transform.position = self.position[1]
					goCube.transform.rotation = self.rotation[1]
				end
			end
		end
	end

	self.frameLast = frame
end

function XCube:SetHalfExtents(x, y, z)
	self.halfExtents.x = Mathf.Abs(x)
	self.halfExtents.y = Mathf.Abs(y)
	self.halfExtents.z = Mathf.Abs(z)

	if DebugShowAttackBox == true and self.goCubeList ~= nil then
		for i = 1, #self.goCubeList do
			local goCube = self.goCubeList[i]

			if goCube ~= nil then
				goCube.transform.localScale = Vector3.New(self.halfExtents.x * 2, self.halfExtents.y * 2, self.halfExtents.z * 2)
			end
		end
	end
end

function XCube:GetHalfExtents()
	return self.halfExtents
end

function XCube:GetInterpolationNum()
	return self.interpolationNum
end

function XCube.CreateXCube(name, tfBox, shape, colliderType)
	local attBox

	if shape ~= XCube.ShapeType.None and shape ~= XCube.ShapeType.Point then
		attBox = tfBox.gameObject:GetComponent(typeof("UnityEngine.BoxCollider"))

		if attBox == nil then
			attBox = tfBox.gameObject:AddComponent(typeof("UnityEngine.BoxCollider"))
		end
	end

	local retCube = XCube:new(XCube.Type.Bind, colliderType, shape, tfBox)

	if attBox ~= nil then
		local tmpScale = tfBox.lossyScale

		if DebugShowAttackBox == true then
			retCube:CreateTestCube(name .. "_" .. tfBox.name .. "_cube")
			retCube:HideTestCube()
		end

		retCube:SetHalfExtents(tmpScale.x * attBox.size.x / 2, tmpScale.y * attBox.size.y / 2, tmpScale.z * attBox.size.z / 2)

		attBox.enabled = false
	end

	return retCube
end

return XCube
