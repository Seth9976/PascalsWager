-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Collider/ColliderCapsule.lua

require("LuaScript/Logic/Collider/ColliderBase")

ColliderCapsule = class("ColliderCapsule", ColliderBase)

function ColliderCapsule:initialize(index, fromVPlayer, originVPlayer, skillData, itemData, pos, time, extendX, extendY, extendZ)
	ColliderBase.initialize(self, index, fromVPlayer, originVPlayer, skillData, itemData, pos, time)

	if self.colliderCube == nil then
		self.colliderCube = XCube:new(XCube.Type.Virtual, XCube.ColliderType.OtherBox, XCube.ShapeType.Capsule, nil)

		if DebugShowAttackBox == true then
			self.colliderCube:CreateTestCube("collider_capsule_" .. index)
		end

		if self.colliderCube ~= nil then
			local radius = Mathf.Min(extendX, extendZ)

			self.colliderCube:SetHalfExtents(radius, radius, extendY)
			self.colliderCube:SetPostionAndRotation(pos, Quaternion.identity)
		end
	end
end

return ColliderCapsule
