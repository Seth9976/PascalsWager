-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Collider/ColliderSphere.lua

require("LuaScript/Logic/Collider/ColliderBase")

ColliderSphere = class("ColliderSphere", ColliderBase)

function ColliderSphere:initialize(index, fromVPlayer, originVPlayer, skillData, itemData, pos, time, extendX, extendY, extendZ)
	ColliderBase.initialize(self, index, fromVPlayer, originVPlayer, skillData, itemData, pos, time)

	if self.colliderCube == nil then
		self.colliderCube = XCube:new(XCube.Type.Virtual, XCube.ColliderType.OtherBox, XCube.ShapeType.Sphere, nil)

		if DebugShowAttackBox == true then
			self.colliderCube:CreateTestCube("collider_sphere_" .. index)
		end

		if self.colliderCube ~= nil then
			local radius = Mathf.Min(extendX, extendY)

			radius = Mathf.Min(radius, extendZ)

			self.colliderCube:SetHalfExtents(radius, radius, radius)
			self.colliderCube:SetPostionAndRotation(pos, Quaternion.identity)
		end
	end
end

return ColliderSphere
