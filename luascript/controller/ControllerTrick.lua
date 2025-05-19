-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Controller/ControllerTrick.lua

ControllerTrick = class("ControllerTrick")

function ControllerTrick:initialize()
	self.trickList = {}
end

function ControllerTrick:AddTrick(trick)
	if trick ~= nil then
		table.insert(self.trickList, trick)
	end
end

function ControllerTrick:Update()
	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == true then
			local ret = trick:Update()

			if ret == false then
				trick:Stop()
			end
		end
	end
end

function ControllerTrick:CheckCollider()
	for i = 1, #self.trickList do
		local trick = self.trickList[i]

		if trick ~= nil and trick:IsPlaying() == true then
			trick:CheckCollider()
		end
	end
end

function ControllerTrick:Exit()
	self.trickList = {}
end

return ControllerTrick
