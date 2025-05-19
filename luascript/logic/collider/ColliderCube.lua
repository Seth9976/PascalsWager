-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Collider/ColliderCube.lua

require("LuaScript/Logic/Collider/ColliderBase")

ColliderCube = class("ColliderCube", ColliderBase)

function ColliderCube:initialize(index, fromVPlayer, originVPlayer, skillData, itemData, pos, time, extendX, extendY, extendZ)
	ColliderBase.initialize(self, index, fromVPlayer, originVPlayer, skillData, itemData, pos, time)

	if self.colliderCube == nil then
		self.colliderCube = XCube:new(XCube.Type.Virtual, XCube.ColliderType.OtherBox, XCube.ShapeType.Cube, nil)

		if DebugShowAttackBox == true then
			self.colliderCube:CreateTestCube("collider_cube_" .. index)
		end

		if self.colliderCube ~= nil then
			self.colliderCube:SetHalfExtents(extendX, extendY, extendZ)
			self.colliderCube:SetPostionAndRotation(pos, Quaternion.identity)
		end
	end
end

return ColliderCube
