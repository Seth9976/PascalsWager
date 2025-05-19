-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trap/TrapBase.lua

TrapBase = class("TrapBase")

function TrapBase:initialize(trapId, pos, fromVPlayer, fromTeamId)
	self.trapId = trapId
	self.trapData = MS_TrapData.GetTrapData(self.trapId)
	self.fromVPlayer = nil

	if fromVPlayer ~= nil then
		self.fromVPlayer = VirtualPlayer:new()

		self.fromVPlayer:Copy(fromVPlayer)
	end

	self.hostTeamId = fromTeamId
	self.targetType = self.trapData.TargetType
	self.trapPosition = Vector3.zero

	self.trapPosition:SetVector3(pos)

	self.trapType = self.trapData.Type

	local nowTime = TimeHelper.getNowTime()

	self.trapLastTime = nowTime

	if self.trapData.Time > 0 then
		self.trapEndTime = nowTime + self.trapData.Time
	else
		self.trapEndTime = -1
	end

	self.trapEffect = nil
	self.trapPlayerList = {}

	self:PlayTrapEffect()
end

function TrapBase:GetTrapId()
	return self.trapId
end

function TrapBase:GetTrapType()
	return self.trapType
end

function TrapBase:CheckPlayer(animal)
	if animal == nil or animal:IsWillDead() == true or animal:IsShow() == false then
		return
	end

	local tmpAnimalId = 0

	if self.fromVPlayer ~= nil then
		tmpAnimalId = self.fromVPlayer:GetAnimalId()
	end

	local retIn = GameAI.IsInSelectTarget(tmpAnimalId, self.hostTeamId, self.targetType, animal)

	if retIn == false then
		return
	end

	local tmpPos = animal:GetPosByWorldPos()
	local dis = Vector3.Distance2DSquare(tmpPos, self.trapPosition)
	local height = Mathf.Abs(tmpPos.y - self.trapPosition.y)
	local trapRadius = self.trapData.Radius
	local trapHeight = self.trapData.Height

	if dis < trapRadius * trapRadius and height < trapHeight then
		self:AddPlayer(animal)
	else
		self:RemovePlayer(animal)
	end
end

function TrapBase:AddPlayer(animal)
	local id = animal:GetAnimalId()

	if self.trapPlayerList[id] == nil then
		local nowTime = TimeHelper.getNowTime()
		local lastStatusTime = 0

		if self.trapData.StatusDelay <= 0 then
			if self.trapData.StatusId1 > 0 then
				animal:AddStatus(self.fromVPlayer, self.trapData.StatusId1, self.trapData.Damage, MS_StatusData.SourceType.Trap, 0, false)

				lastStatusTime = nowTime
			end

			if self.trapData.StatusId2 > 0 then
				animal:AddStatus(self.fromVPlayer, self.trapData.StatusId2, self.trapData.Damage, MS_StatusData.SourceType.Trap, 0, false)

				lastStatusTime = nowTime
			end
		end

		self.trapPlayerList[id] = {
			animal,
			nowTime,
			lastStatusTime
		}
	end
end

function TrapBase:RemovePlayer(animal)
	local id = animal:GetAnimalId()

	self.trapPlayerList[id] = nil
end

function TrapBase:PlayTrapEffect()
	if self.trapEffect == nil and self.trapData.Effect ~= "" then
		self.trapEffect = VfxManager.PlayFreezeMulti(self.trapData.Effect, self.trapPosition, nil, nil)

		if self.trapEffect ~= nil and self.trapData.EffectDelayClear > 0 then
			self.trapEffect:SetDelayClear(true, nil)
		end
	end
end

function TrapBase:AddTrapLogic(targetAnimal)
	return
end

function TrapBase:Update()
	local nowTime = TimeHelper.getNowTime()

	for id, data in pairs(self.trapPlayerList) do
		local animal = data[1]
		local trapTime = data[2]
		local lastStatusTime = data[3]

		if animal:IsWillDead() == true or animal:IsShow() == false then
			self:RemovePlayer(animal)
		else
			self:AddTrapLogic(animal)

			if self.trapData.StatusId1 > 0 or self.trapData.StatusId2 > 0 then
				if lastStatusTime > 0 then
					if nowTime > lastStatusTime + self.trapData.StatusInterval then
						if self.trapData.StatusId1 > 0 then
							animal:AddStatus(self.fromVPlayer, self.trapData.StatusId1, self.trapData.Damage, MS_StatusData.SourceType.Trap, 0, false)
						end

						if self.trapData.StatusId2 > 0 then
							animal:AddStatus(self.fromVPlayer, self.trapData.StatusId2, self.trapData.Damage, MS_StatusData.SourceType.Trap, 0, false)
						end

						data[3] = nowTime
					end
				elseif nowTime > trapTime + self.trapData.StatusDelay then
					if self.trapData.StatusId1 > 0 then
						animal:AddStatus(self.fromVPlayer, self.trapData.StatusId1, self.trapData.Damage, MS_StatusData.SourceType.Trap, 0, false)
					end

					if self.trapData.StatusId2 > 0 then
						animal:AddStatus(self.fromVPlayer, self.trapData.StatusId2, self.trapData.Damage, MS_StatusData.SourceType.Trap, 0, false)
					end

					data[3] = nowTime
				end
			end
		end
	end

	if self.trapEndTime > 0 and nowTime > self.trapEndTime then
		return false
	end

	return true
end

function TrapBase:Exit()
	if self.fromVPlayer ~= nil then
		self.fromVPlayer:Exit()
	end

	self.fromVPlayer = nil
	self.trapPosition = nil
	self.trapData = nil

	if self.trapEffect ~= nil then
		self.trapEffect:Clear()

		self.trapEffect = nil
	end

	for id, data in pairs(self.trapPlayerList) do
		local animal = data[1]

		self:RemovePlayer(animal)
	end

	self.trapPlayerList = nil
end
