-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Lib/behaviourtree.lua

require("LuaScript/Lib/func")

local SUCCESS = "SUCCESS"
local FAILED = "FAILED"
local READY = "READY"
local RUNNING = "RUNNING"
local BT = {}

BT.SUCCESS = SUCCESS
BT.FAILED = FAILED
BT.READY = READY
BT.RUNNING = RUNNING
BT.randomSeed = 0

function BT.GetTime()
	return os.clock()
end

function BT.iskindof(cls, name)
	if cls.__cname == name then
		return true
	end

	if not cls.__supers then
		return false
	end

	for _, v in ipairs(cls.__supers) do
		local bvalue = BT.iskindof(v, name)

		if bvalue == true then
			return true
		end
	end

	return false
end

local BehaviourTree = _class("BehaviourTree", function(root)
	local instance = {}

	instance.root = root

	return instance
end)

function BehaviourTree:SetOwner(owner)
	self.owner = owner

	if self.root and self.root.SetOwner and type(self.root.SetOwner) then
		self.root:SetOwner(owner)
	end
end

function BehaviourTree:GetOwner()
	return self.owner
end

function BehaviourTree:ForceUpdate()
	self.forceupdate = true
end

function BehaviourTree:Update()
	local sleeptime = self.root:GetTreeSleepTime()

	if not sleeptime or sleeptime == 0 then
		self.root:Visit()
		self.root:Step()
	end

	self.forceupdate = false
end

function BehaviourTree:Reset()
	self.root:Reset()
end

function BehaviourTree:Stop()
	self.root:Stop()
end

function BehaviourTree:Suspend()
	self.root:Suspend()
end

function BehaviourTree:Restart()
	self.root:Restart()
end

function BehaviourTree:GetSleepTime()
	if self.forceupdate then
		return 0
	end

	return self.root:GetTreeSleepTime()
end

function BehaviourTree:OnEnter()
	self.root:OnEnter()
end

function BehaviourTree:__tostring()
	return self.root:GetTreeString()
end

BT.BehaviourTree = BehaviourTree

local BehaviourNode = _class("BehaviourNode", function(children)
	local instance = {}

	instance.name = name or ""
	instance.children = children
	instance.status = READY
	instance.lastresult = READY
	instance.owner = nil

	if children then
		for i, k in pairs(children) do
			k.parent = instance
		end
	end

	return instance
end)

function BehaviourNode:SetOwner(owner)
	self.owner = owner

	if self.children then
		for k, v in pairs(self.children) do
			if v and v.SetOwner and type(v.SetOwner) == "function" then
				v:SetOwner(owner)
			end
		end
	end
end

function BehaviourNode:GetOwner()
	return self.owner
end

function BehaviourNode:DoToParents(fn)
	if self.parent then
		fn(self.parent)

		return self.parent:DoToParents(fn)
	end
end

function BehaviourNode:GetTreeString(indent)
	indent = indent or ""

	local str = string.format("%s%s>%2.2f\n", indent, self:GetString(), self:GetTreeSleepTime() or 0)

	if self.children then
		for k, v in ipairs(self.children) do
			str = str .. v:GetTreeString(indent .. "   >")
		end
	end

	return str
end

function BehaviourNode:DBString()
	return ""
end

function BehaviourNode:Sleep(t)
	self.nextupdatetime = BT.GetTime() + t
end

function BehaviourNode:GetSleepTime()
	if self.status == RUNNING and not self.children and not BT.iskindof(self, "ConditionNode") then
		if self.nextupdatetime then
			local time_to = self.nextupdatetime - BT.GetTime()

			if time_to < 0 then
				time_to = 0
			end

			return time_to
		end

		return 0
	end

	return nil
end

function BehaviourNode:GetTreeSleepTime()
	local sleeptime

	if self.children then
		for k, v in ipairs(self.children) do
			if v.status == RUNNING then
				local t = v:GetTreeSleepTime()

				if t and (not sleeptime or t < sleeptime) then
					sleeptime = t
				end
			end
		end
	end

	local my_t = self:GetSleepTime()

	if my_t and (not sleeptime or my_t < sleeptime) then
		sleeptime = my_t
	end

	return sleeptime
end

function BehaviourNode:GetString()
	local str = ""

	if self.status == RUNNING then
		str = self:DBString()
	end

	return string.format("%s - %s <%s> (%s)", self.name, self.status or "UNKNOWN", self.lastresult or "?", str)
end

function BehaviourNode:Visit()
	self.status = FAILED
end

function BehaviourNode:SaveStatus()
	self.lastresult = self.status

	if self.children then
		for k, v in pairs(self.children) do
			v:SaveStatus()
		end
	end
end

function BehaviourNode:Step()
	if self.status ~= RUNNING then
		self:Reset()
	elseif self.children then
		for k, v in ipairs(self.children) do
			v:Step()
		end
	end
end

function BehaviourNode:Reset()
	if self.status ~= READY then
		self.status = READY

		if self.children then
			for idx, child in ipairs(self.children) do
				child:Reset()
			end
		end
	end
end

function BehaviourNode:Stop()
	if self.OnStop then
		self:OnStop()
	end

	if self.children then
		for idx, child in ipairs(self.children) do
			child:Stop()
		end
	end
end

function BehaviourNode:Suspend()
	if self.children then
		for k, v in pairs(self.children) do
			v:Suspend()
		end
	end
end

function BehaviourNode:Restart()
	if self.children then
		for k, v in pairs(self.children) do
			v:Restart()
		end
	end
end

function BehaviourNode:OnEnter()
	if self.children then
		for k, v in pairs(self.children) do
			v:OnEnter()
		end
	end
end

BT.BehaviourNode = BehaviourNode

local DecoratorNode = _class("DecoratorNode", BehaviourNode, function(child)
	return BehaviourNode.__create({
		child
	})
end)

BT.DecoratorNode = DecoratorNode

local ConditionNode = _class("ConditionNode", BehaviourNode, function(func)
	local instance = BehaviourNode.__create()

	instance.fn = func

	return instance
end)

function ConditionNode:Visit()
	if self.fn() == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.ConditionNode = ConditionNode

local ConditionWaitNode = _class("ConditionWaitNode", BehaviourNode, function(func, waitTime)
	local instance = BehaviourNode.__create()

	instance.fn = func
	instance.time = 0
	instance.waitTime = waitTime

	return instance
end)

function ConditionWaitNode:Stop()
	self.status = SUCCESS
end

function ConditionWaitNode:Visit()
	if self.fn() == true or self.waitTime ~= nil and self.time > self.waitTime then
		self.time = 0
		self.status = SUCCESS
	else
		if self.waitTime ~= nil then
			self.time = self.time + Time.deltaTime
		end

		self.status = RUNNING
	end
end

BT.ConditionWaitNode = ConditionWaitNode

local ActionNode = _class("ActionNode", BehaviourNode, function(action)
	local instance = BehaviourNode.__create()

	instance.action = action

	return instance
end)

function ActionNode:Visit()
	self.action(self)

	self.status = SUCCESS
end

BT.ActionNode = ActionNode

local WaitNode = _class("WaitNode", BehaviourNode, function(time)
	local instance = BehaviourNode.__create()

	instance.wait_time = time

	return instance
end)

function WaitNode:DBString()
	local w = self.wake_time - BT.GetTime()

	return string.format("%2.2f", w)
end

function WaitNode:Visit()
	local current_time = BT.GetTime()

	if self.status ~= RUNNING then
		self.wake_time = current_time + (type(self.wait_time) == "function" and self.wait_time() or self.wait_time)
		self.status = RUNNING
	end

	if self.status == RUNNING then
		if current_time >= self.wake_time then
			self.status = SUCCESS
		else
			self:Sleep(self.wake_time - current_time)
		end
	end
end

BT.WaitNode = WaitNode

local SequenceNode = _class("SequenceNode", BehaviourNode, function(children)
	local instance = BehaviourNode.__create(children)

	instance.idx = 1

	return instance
end)

function SequenceNode:DBString()
	return tostring(self.idx)
end

function SequenceNode:Reset()
	if self.status ~= READY then
		self.status = READY

		if self.children then
			for idx, child in ipairs(self.children) do
				child:Reset()
			end
		end
	end

	self.idx = 1
end

function SequenceNode:Visit()
	if self.status ~= RUNNING then
		self.idx = 1
	end

	local done = false

	while self.idx <= #self.children do
		local child = self.children[self.idx]

		child:Visit()

		if child.status == RUNNING or child.status == FAILED then
			self.status = child.status

			return
		end

		self.idx = self.idx + 1
	end

	self.status = SUCCESS
end

BT.SequenceNode = SequenceNode

local SelectorNode = _class("SelectorNode", BehaviourNode, function(children)
	local instance = BehaviourNode.__create(children)

	instance.idx = 1

	return instance
end)

function SelectorNode:DBString()
	return tostring(self.idx)
end

function SelectorNode:Reset()
	if self.status ~= READY then
		self.status = READY

		if self.children then
			for idx, child in ipairs(self.children) do
				child:Reset()
			end
		end
	end

	self.idx = 1
end

function SelectorNode:Visit()
	if self.status ~= RUNNING then
		self.idx = 1
	end

	local done = false

	while self.idx <= #self.children do
		local child = self.children[self.idx]

		child:Visit()

		if child.status == RUNNING or child.status == SUCCESS then
			self.status = child.status

			return
		end

		self.idx = self.idx + 1
	end

	self.status = FAILED
end

BT.SelectorNode = SelectorNode

local NotDecorator = _class("NotDecorator", DecoratorNode, function(child)
	return DecoratorNode.__create(child)
end)

function NotDecorator:Visit()
	local child = self.children[1]

	child:Visit()

	if child.status == SUCCESS then
		self.status = FAILED
	elseif child.status == FAILED then
		self.status = SUCCESS
	else
		self.status = child.status
	end
end

BT.NotDecorator = NotDecorator

local FailIfRunningDecorator = _class("FailIfRunningDecorator", DecoratorNode, function(child)
	return DecoratorNode.__create(child)
end)

function FailIfRunningDecorator:Visit()
	local child = self.children[1]

	child:Visit()

	if child.status == RUNNING then
		self.status = FAILED
	else
		self.status = child.status
	end
end

BT.FailIfRunningDecorator = FailIfRunningDecorator

local RunningIfFailDecorator = _class("RunningIfFailDecorator", DecoratorNode, function(child)
	return DecoratorNode.__create(child)
end)

function RunningIfFailDecorator:Visit()
	local child = self.children[1]

	child:Visit()

	if child.status == FAILED then
		self.status = RUNNING
	else
		self.status = child.status
	end
end

BT.RunningIfFailDecorator = RunningIfFailDecorator

local LoopNode = _class("LoopNode", BehaviourNode, function(children, maxreps)
	local instance = BehaviourNode.__create(children)

	instance.idx = 1
	instance.maxrepsOrFunc = maxreps
	instance.maxreps = nil
	instance.rep = 0

	return instance
end)

function LoopNode:DBString()
	return tostring(self.idx)
end

function LoopNode:Reset()
	BehaviourNode.Reset(self)

	self.idx = 1
	self.rep = 0
end

function LoopNode:Visit()
	if self.status ~= RUNNING then
		self.idx = 1
		self.rep = 0
		self.status = RUNNING
		self.maxreps = type(self.maxrepsOrFunc) == "function" and self.maxrepsOrFunc() or self.maxrepsOrFunc
	end

	local done = false

	while self.idx <= #self.children do
		local child = self.children[self.idx]

		child:Visit()

		if child.status == RUNNING or child.status == FAILED then
			self.status = child.status

			return
		end

		self.idx = self.idx + 1
	end

	self.idx = 1
	self.rep = self.rep + 1

	if self.maxreps and self.rep >= self.maxreps then
		self.status = SUCCESS
	else
		for k, v in ipairs(self.children) do
			v:Reset()
		end
	end
end

BT.LoopNode = LoopNode

local function GetWeight(item)
	local item_type = type(item)
	local v = 0

	repeat
		if item_type == "number" then
			v = item

			break
		end

		if item_type == "function" then
			v = item() or 0
		end

		break
	until true

	return v
end

local RandomNode = _class("RandomNode", BehaviourNode, function(children, animalId, weights)
	local instance = BehaviourNode.__create(children)

	if weights then
		instance._weights = {}

		for i = 1, #children do
			table.insert(instance._weights, weights[i] or 0)
		end
	end

	instance.animalId = animalId
	instance.randomSeed = BT.randomSeed + 1
	BT.randomSeed = BT.randomSeed + 1

	return instance
end)

function RandomNode:Reset()
	BehaviourNode.Reset(self)

	self.idx = nil
end

function RandomNode:Visit()
	if not self.idx and self.children then
		if not self._weights then
			self.idx = MathHelper.getRandom(1, #self.children, self.animalId .. self.randomSeed)
		else
			local weight_sum = 0
			local weights = {}

			for _, item in ipairs(self._weights) do
				local w = GetWeight(item)

				table.insert(weights, w)

				weight_sum = weight_sum + w
			end

			local index = MathHelper.getRandom(1, weight_sum, self.animalId .. self.randomSeed)

			for i, v in ipairs(weights) do
				if index <= v then
					self.idx = i

					break
				end

				index = index - v
			end
		end
	end

	if self.idx then
		local child = self.children[self.idx]

		child:Visit()

		self.status = child.status

		if self.status ~= RUNNING then
			self.idx = nil
		end
	end
end

BT.RandomNode = RandomNode

local RandomSequenceNode = _class("RandomSequenceNode", BehaviourNode, function(children, animalId, weights)
	local instance = BehaviourNode.__create(children)

	if weights then
		instance._weights = {}

		for i = 1, #children do
			table.insert(instance._weights, weights[i] or 0)
		end
	end

	instance.animalId = animalId
	instance.randomSeed = BT.randomSeed + 1
	BT.randomSeed = BT.randomSeed + 1

	return instance
end)

function RandomSequenceNode:Reset()
	BehaviourNode.Reset(self)

	self.idx = nil
end

function RandomSequenceNode:Visit()
	if not self.idx and self.children then
		if not self._weights then
			self.idx = MathHelper.getRandom(1, #self.children, self.animalId .. self.randomSeed)
		else
			local weight_sum = 0
			local weights = {}

			for _, item in ipairs(self._weights) do
				local w = GetWeight(item)

				table.insert(weights, w)

				weight_sum = weight_sum + w
			end

			local index = MathHelper.getRandom(1, weight_sum, self.animalId .. self.randomSeed)

			for i, v in ipairs(weights) do
				if index <= v then
					self.idx = i

					break
				end

				index = index - v
			end
		end
	end

	local start = self.idx
	local index = 1

	while index <= #self.children do
		local child = self.children[self.idx]

		child:Visit()

		if child.status ~= FAILED then
			self.status = child.status

			if self.status ~= RUNNING then
				self.idx = nil
			end

			return
		end

		self.idx = self.idx + 1

		if self.idx > #self.children then
			self.idx = 1
		end

		if self.idx == start then
			self.idx = nil
			self.status = FAILED

			return
		end

		index = index + 1
	end
end

BT.RandomSequenceNode = RandomSequenceNode

local ParallelNode = _class("ParallelNode", BehaviourNode, function(children)
	return BehaviourNode.__create(children)
end)

function ParallelNode:Step()
	if self.status ~= RUNNING then
		self:Reset()
	elseif self.children then
		for k, v in ipairs(self.children) do
			if v.status == SUCCESS and BT.iskindof(v, "ConditionNode") then
				v:Reset()
			end
		end
	end
end

function ParallelNode:Visit()
	local done = true
	local any_done = false

	for idx, child in ipairs(self.children) do
		if BT.iskindof(child, "ConditionNode") or BT.iskindof(child, "NotDecorator") then
			child:Reset()
		end

		if child.status ~= SUCCESS then
			child:Visit()

			if child.status == FAILED then
				self.status = FAILED

				return
			end
		end

		if child.status == RUNNING then
			done = false
		else
			any_done = true
		end
	end

	if done or self.stoponanycomplete and any_done then
		self.status = SUCCESS
	else
		self.status = RUNNING
	end
end

function ParallelNode:GetSleepTime()
	return 0
end

function ParallelNode:GetTreeSleepTime()
	return 0
end

BT.ParallelNode = ParallelNode

local ParallelNodeAny = _class("ParallelNodeAny", ParallelNode, function(children)
	local instance = ParallelNode.__create(children)

	instance.stoponanycomplete = true

	return instance
end)

BT.ParallelNodeAny = ParallelNodeAny

local WhileNode = _class("WhileNode", ParallelNode, function(cond, node)
	return ParallelNode.__create({
		ConditionNode:create(cond),
		node
	})
end)

BT.WhileNode = WhileNode

local IfNode = _class("IfNode", SequenceNode, function(cond, node)
	return SequenceNode.__create({
		ConditionNode:create(cond),
		node
	})
end)

BT.IfNode = IfNode

local WeightSelectNode = _class("WeightSelectNode", BehaviourNode, function(children, weights)
	weights = weights or {}

	local instance = BehaviourNode.__create(children)

	instance.idx = 1

	for i = 1, #children do
		children[i].__weight = (type(weights[i]) == "function" or type(weights[i]) == "number") and weights[i] or 0
	end

	return instance
end)

function WeightSelectNode:DBString()
	return tostring(self.idx)
end

function WeightSelectNode:Reset()
	if self.status ~= READY then
		self.status = READY

		if self.children then
			for idx, child in ipairs(self.children) do
				child:Reset()
			end
		end
	end

	self.idx = 1
end

function WeightSelectNode:Visit()
	if self.status ~= RUNNING then
		self.idx = 1

		for i, v in ipairs(self.children) do
			v.__weight_num = type(v.__weight) == "function" and v.__weight() or v.__weight or 0
		end

		table.sort(self.children, function(a, b)
			return a.__weight_num > b.__weight_num
		end)
	end

	local done = false

	while self.idx <= #self.children do
		local child = self.children[self.idx]

		child:Visit()

		if child.status == RUNNING or child.status == SUCCESS then
			self.status = child.status

			return
		end

		self.idx = self.idx + 1
	end

	self.status = FAILED
end

BT.WeightSelectNode = WeightSelectNode

local SwitchNode = _class("SwitchNode", BehaviourNode, function(children)
	local instance = BehaviourNode.__create(children)

	instance.idx = 1

	return instance
end)

function SwitchNode:DBString()
	return tostring(self.idx)
end

function SwitchNode:Reset()
	if self.status ~= READY then
		self.status = READY

		if self.children then
			for idx, child in ipairs(self.children) do
				child:Reset()
			end
		end
	end

	self.idx = 1
end

function SwitchNode:Visit()
	if self.status ~= RUNNING then
		self.idx = 1
	end

	local done = false

	while self.idx <= #self.children do
		local child = self.children[self.idx]

		child:Visit()

		if child.status == RUNNING or child.status == SUCCESS then
			self.status = child.status

			return
		end

		self.idx = self.idx + 1
	end

	self.status = SUCCESS
end

BT.SwitchNode = SwitchNode

local CommonNode = _class("CommonNode", BehaviourNode, function(fuc)
	local instance = BehaviourNode.__create()

	instance.fuc = fuc

	return instance
end)

function CommonNode:Visit()
	self.fuc(self)

	self.status = SUCCESS
end

BT.CommonNode = CommonNode

local GetTargetNode = _class("GetTargetNode", BehaviourNode, function(attackNode, animal)
	local instance = BehaviourNode.__create()

	instance.attackNode = attackNode
	instance.animal = animal

	return instance
end)

function GetTargetNode:Visit()
	local target

	target = self.attackNode:GetTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		self.animal:GetBrain():SetAnimalTarget(target)

		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.GetTargetNode = GetTargetNode

local IsDeadNode = _class("IsDeadNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsDeadNode:Visit()
	if self.animal:IsDead() == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsDeadNode = IsDeadNode

local StopMovementNode = _class("StopMovementNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function StopMovementNode:Visit()
	self.animal:StopMovement()

	self.status = SUCCESS
end

BT.StopMovementNode = StopMovementNode

local IsLackOfBulletNode = _class("IsLackOfBulletNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsLackOfBulletNode:Visit()
	if self.animal.bulletNum <= 0 then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsLackOfBulletNode = IsLackOfBulletNode

local GetWanderPointNode = _class("GetWanderPointNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function GetWanderPointNode:Visit()
	self.animal:GetBrain().wanderPos = self.animal:GetWanderPoint()
	self.status = SUCCESS
end

BT.GetWanderPointNode = GetWanderPointNode

local WaitFrameNode = _class("WaitFrameNode", BehaviourNode, function(frame)
	local instance = BehaviourNode.__create()

	instance.frame = frame
	instance.frameTemp = frame

	return instance
end)

function WaitFrameNode:Visit()
	if self.status ~= RUNNING then
		self.status = RUNNING
	end

	if self.status == RUNNING then
		self.frameTemp = self.frameTemp - 1

		if self.frameTemp <= 0 then
			self.frameTemp = self.frame
			self.status = SUCCESS
		end
	end
end

BT.WaitFrameNode = WaitFrameNode

local GetRandomNode = _class("GetRandomNode", BehaviourNode, function(rndValue, animalId)
	local instance = BehaviourNode.__create()

	instance.rndValue = rndValue
	instance.animalId = animalId
	instance.randomSeed = BT.randomSeed + 1
	BT.randomSeed = BT.randomSeed + 1

	return instance
end)

function GetRandomNode:Visit()
	local rnd = MathHelper.getRandom(1, 100, self.animalId .. self.randomSeed)

	if rnd <= self.rndValue * 100 then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.GetRandomNode = GetRandomNode

local IsTargetTypeNode = _class("IsTargetTypeNode", BehaviourNode, function(animal, targetType)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.targetType = targetType

	return instance
end)

function IsTargetTypeNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsType(self.targetType) == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsTargetTypeNode = IsTargetTypeNode

local IsSkillingNode = _class("IsSkillingNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsSkillingNode:Visit()
	if self.animal:IsSkilling() == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsSkillingNode = IsSkillingNode

local IsSkillingSkillNode = _class("IsSkillingSkillNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsSkillingSkillNode:Visit()
	if self.animal:IsSkillingSkill() == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsSkillingSkillNode = IsSkillingSkillNode

local IsSkillingByIdNode = _class("IsSkillingByIdNode", BehaviourNode, function(animal, skillIndex, skillCombo)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.skillIndex = skillIndex
	instance.skillCombo = skillCombo

	return instance
end)

function IsSkillingByIdNode:Visit()
	if self.animal:IsSkillingById(self.skillIndex, self.skillCombo) == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsSkillingByIdNode = IsSkillingByIdNode

local IsSkillIndexChangeNode = _class("IsSkillIndexChangeNode", BehaviourNode, function(animal, skillIndex, skillCombo)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.skillIndex = skillIndex
	instance.skillCombo = skillCombo
	instance.skillIndexOld = 0
	instance.skillComboOld = 0

	return instance
end)

function IsSkillIndexChangeNode:Visit()
	local skillIndex, skillCombo = self.animal:GetSkillingData()

	if skillIndex == self.skillIndex and skillCombo == self.skillCombo and (self.skillIndexOld ~= self.skillIndex or self.skillComboOld ~= self.skillCombo) then
		self.status = SUCCESS
	else
		self.status = FAILED
	end

	self.skillIndexOld = skillIndex
	self.skillComboOld = skillCombo
end

BT.IsSkillIndexChangeNode = IsSkillIndexChangeNode

local IsTargetWithinSkillRangeNode = _class("IsTargetWithinSkillRangeNode", BehaviourNode, function(animal, skillRangeMin, skillRangeMax, skillAngle)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.skillRangeMin = skillRangeMin
	instance.skillRangeMax = skillRangeMax
	instance.skillAngle = skillAngle or nil

	return instance
end)

function IsTargetWithinSkillRangeNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		local isWithinRange = GameAI.IsAnimalWithinSkillRange(self.animal, target, self.skillRangeMin, self.skillRangeMax, self.skillAngle)

		if isWithinRange == true then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	else
		self.status = FAILED
	end
end

BT.IsTargetWithinSkillRangeNode = IsTargetWithinSkillRangeNode

local IsTargetWithinRangeNode = _class("IsTargetWithinRangeNode", BehaviourNode, function(animal, range)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.range = range

	return instance
end)

function IsTargetWithinRangeNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		local isWithinRange = GameAI.IsAnimalWithinDistance(self.animal, target:GetPosByWorldPos(), self.range)

		if isWithinRange == true then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	else
		self.status = FAILED
	end
end

BT.IsTargetWithinRangeNode = IsTargetWithinRangeNode

local IsTargetWithinAngleNode = _class("IsTargetWithinAngleNode", BehaviourNode, function(animal, angle)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.angle = angle

	return instance
end)

function IsTargetWithinAngleNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		local isWithinAngle = GameAI.IsAnimalWithinAngle(self.animal, target:GetPosByWorldPos(), self.angle)

		if isWithinAngle == true then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	else
		self.status = FAILED
	end
end

BT.IsTargetWithinAngleNode = IsTargetWithinAngleNode

local IsTargetWithinHeightNode = _class("IsTargetWithinHeightNode", BehaviourNode, function(animal, height)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.height = height

	return instance
end)

function IsTargetWithinHeightNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		local isWithinHeight = GameAI.IsAnimalWithinHeight(self.animal, target:GetPosByWorldPos(), self.height)

		if isWithinHeight == true then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	else
		self.status = FAILED
	end
end

BT.IsTargetWithinHeightNode = IsTargetWithinHeightNode

local IsCanAttackNode = _class("IsCanAttackNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsCanAttackNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		local isCanAttack = GameAI.IsAnimalCanAttack(self.animal, target)

		if isCanAttack == true then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	else
		self.status = FAILED
	end
end

BT.IsCanAttackNode = IsCanAttackNode

local ClickSkillButtonNode = _class("ClickSkillButtonNode", BehaviourNode, function(animal, button)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.button = button
	instance.longPressTime = 0

	return instance
end)

function ClickSkillButtonNode:Visit()
	if self.longPressTime >= 3 then
		self.longPressTime = 0
		self.status = SUCCESS
	else
		self.status = RUNNING
	end

	if self.status == RUNNING then
		local target = self.animal:GetBrain():GetAnimalTarget()

		if target ~= nil and target:IsDead() == false and target:IsShow() == true then
			GameAI.SetSkillingDirection(self.animal, target)
		end

		if self.longPressTime > 0 and self.longPressTime <= 1 then
			self.animal:PressUpSkillButton(self.button)
			self.animal:LongPressSkillButton(0)
		elseif self.longPressTime <= 0 then
			self.animal:LongPressSkillButton(self.button)
		end

		self.longPressTime = self.longPressTime + 1
	end
end

BT.ClickSkillButtonNode = ClickSkillButtonNode

local PressUpSkillButtonNode = _class("PressUpSkillButtonNode", BehaviourNode, function(animal, button)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.button = button
	instance.pressUpTime = 0

	return instance
end)

function PressUpSkillButtonNode:Visit()
	if self.pressUpTime > 3 then
		self.pressUpTime = 0
		self.status = SUCCESS
	else
		self.status = RUNNING
	end

	if self.status == RUNNING then
		local target = self.animal:GetBrain():GetAnimalTarget()

		if target ~= nil and target:IsDead() == false and target:IsShow() == true then
			GameAI.SetSkillingDirection(self.animal, target)
		end

		if self.pressUpTime <= 0 then
			self.animal:PressUpSkillButton(self.button)
			self.animal:LongPressSkillButton(0)
		end

		self.pressUpTime = self.pressUpTime + 1
	end
end

BT.PressUpSkillButtonNode = PressUpSkillButtonNode

local LongPressSkillButtonNode = _class("LongPressSkillButtonNode", BehaviourNode, function(animal, button, skillIndex, skillCombo, isCombo)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.button = button
	instance.skillIndex = skillIndex
	instance.skillCombo = skillCombo
	instance.isCombo = isCombo
	instance.isInit = true

	return instance
end)

function LongPressSkillButtonNode:Visit()
	if self.isInit == true then
		self.animal:LongPressSkillButton(self.button)

		self.isInit = false
	end

	local cond = true

	if self.skillIndex == 0 and self.skillCombo == 0 then
		cond = self.animal:GetLongPressButtonTime(self.button) > 0.5 or self.animal:IsDead() or self.animal:IsResetSkillButtonLongPressTime() == true
	else
		local tmpSkillData = MS_SkillData.GetSkillData(self.animal:GetHeroId(), self.skillIndex, self.skillCombo)
		local time = 0

		if tmpSkillData == nil then
			SystemHelper.LogError("====id=" .. self.animal:GetHeroId() .. ",skillIndex=" .. self.skillIndex .. ",self.skillCombo=" .. self.skillCombo)
		elseif self.isCombo == true then
			time = tmpSkillData.BtnComboPressTime
		else
			time = tmpSkillData.BtnPressTime
		end

		cond = time < self.animal:GetLongPressButtonTime(self.button) or self.animal:IsDead() or self.animal:IsResetSkillButtonLongPressTime() == true
	end

	if cond == true then
		self.status = SUCCESS
		self.isInit = true
	else
		self.status = RUNNING
	end

	if self.status == RUNNING then
		local target = self.animal:GetBrain():GetAnimalTarget()

		if target ~= nil and target:IsDead() == false and target:IsShow() == true then
			GameAI.SetSkillingDirection(self.animal, target)
		end

		self.animal:LongPressSkillButton(self.button)
	end
end

BT.LongPressSkillButtonNode = LongPressSkillButtonNode

local IsTargetAttackingNode = _class("IsTargetAttackingNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsTargetAttackingNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true or self.animal:IsHit() == true then
		local IsTargetAttacking = GameAI.IsTargetAttacking(self.animal, target)

		if IsTargetAttacking == true and target:IsSkillingById(AnimalBase_Define.SkillType.Drop, 0) == false then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	else
		self.status = FAILED
	end
end

BT.IsTargetAttackingNode = IsTargetAttackingNode

local IsTargetMyTeamNode = _class("IsTargetMyTeamNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsTargetMyTeamNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true and self.animal:IsMyTeam(target:GetTeamId()) == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsTargetMyTeamNode = IsTargetMyTeamNode

local IsRunningNode = _class("IsRunningNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsRunningNode:Visit()
	local speed = self.animal:GetMoveSpeed()
	local speedMode = self.animal:GetMoveSpeedMode()

	if speed > AnimalBase_Define.MotionRunSpeed or speedMode > AnimalBase_Define.SpeedMode.Normal then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsRunningNode = IsRunningNode

local GoToWanderPointNode = _class("GoToWanderPointNode", BehaviourNode, function(animal, speedMode)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.speedMode = speedMode

	return instance
end)

function GoToWanderPointNode:Visit()
	self.animal:SetMoveSpeedMode(self.speedMode)
	self.animal:SetTargetByWorldPos(self.animal:GetBrain().wanderPos, true)

	self.status = SUCCESS
end

BT.GoToWanderPointNode = GoToWanderPointNode

local GoToBornPointNode = _class("GoToBornPointNode", BehaviourNode, function(animal, speedMode)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.speedMode = speedMode

	return instance
end)

function GoToBornPointNode:Visit()
	self.animal:SetMoveSpeedMode(self.speedMode)
	self.animal:SetTargetByWorldPos(self.animal:GetRebornPosition(), true)

	self.status = SUCCESS
end

BT.GoToBornPointNode = GoToBornPointNode

local FollowTargetNode = _class("FollowTargetNode", BehaviourNode, function(animal, speedMode)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.speedMode = speedMode

	return instance
end)

function FollowTargetNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		local targetPos = target:GetFindPathPosForAI()

		if self.animal:IsAnimatorInTransition() == true then
			self.animal:SetMoveSpeedMode(AnimalBase_Define.SpeedMode.Slow)
		else
			self.animal:SetMoveSpeedMode(self.speedMode)
		end

		self.animal:SetTargetByWorldPos(targetPos, true)

		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.FollowTargetNode = FollowTargetNode

local IsComboMoreThenNode = _class("IsComboMoreThenNode", BehaviourNode, function(animal, combo)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.combo = combo

	return instance
end)

function IsComboMoreThenNode:Visit()
	local combo = self.animal.skillCombo

	if combo > self.combo then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsComboMoreThenNode = IsComboMoreThenNode

local IsEndNode = _class("IsEndNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsEndNode:Visit()
	local isEnd = self.animal:GetBrain().isEnd

	if isEnd == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsEndNode = IsEndNode

local LockTargetNode = _class("LockTargetNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function LockTargetNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true and self.animal:IsLockingPlayer() == false and self.animal:IsAnimatorInTransition() == false then
		self.animal:SetLockId(target:GetAnimalId())
	end

	self.status = SUCCESS
end

BT.LockTargetNode = LockTargetNode

local UnLockTargetNode = _class("UnLockTargetNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function UnLockTargetNode:Visit()
	if self.animal:IsLockingPlayer() == true then
		self.animal:SetLockId(-1)
	end

	self.status = SUCCESS
end

BT.UnLockTargetNode = UnLockTargetNode

local ChangeBehaviourStateNode = _class("ChangeBehaviourStateNode", BehaviourNode, function(animal, behaviourState)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.behaviourState = behaviourState

	return instance
end)

function ChangeBehaviourStateNode:Visit()
	if self.animal:GetBrain().behaviourState ~= nil then
		self.animal:GetBrain().behaviourState = self.behaviourState
	end

	self.status = SUCCESS
end

BT.ChangeBehaviourStateNode = ChangeBehaviourStateNode

local IsBehaviourStateNode = _class("IsBehaviourStateNode", BehaviourNode, function(animal, behaviourState)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.behaviourState = behaviourState

	return instance
end)

function IsBehaviourStateNode:Visit()
	if self.animal:GetBrain().behaviourState ~= nil and self.animal:GetBrain().behaviourState == self.behaviourState then
		self.status = SUCCESS

		return
	end

	self.status = FAILED
end

BT.IsBehaviourStateNode = IsBehaviourStateNode

local IsHitNode = _class("IsHitNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsHitNode:Visit()
	if self.animal:IsHit() == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsHitNode = IsHitNode

local IsTargetHitNode = _class("IsTargetHitNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsTargetHitNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true and target:IsHit() == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsTargetHitNode = IsTargetHitNode

local IsHitBySkillNode = _class("IsHitBySkillNode", BehaviourNode, function(animal, skillIndex, skillCombo)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.skillIndex = skillIndex
	instance.skillCombo = skillCombo

	return instance
end)

function IsHitBySkillNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		if target:IsHitBySkill(self.animal, self.skillIndex, self.skillCombo) == true then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	else
		self.status = FAILED
	end
end

BT.IsHitBySkillNode = IsHitBySkillNode

local IsGradeNode = _class("IsGradeNode", BehaviourNode, function(animal, gradeValue)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.gradeValue = gradeValue

	return instance
end)

function IsGradeNode:Visit()
	if self.animal:GetGrade() == self.gradeValue then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsGradeNode = IsGradeNode

local IsVarietyNode = _class("IsVarietyNode", BehaviourNode, function(animal, variety)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.variety = variety

	return instance
end)

function IsVarietyNode:Visit()
	if self.animal:GetHeroVariety() == self.variety then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsVarietyNode = IsVarietyNode

local IsBehindNode = _class("IsBehindNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsBehindNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		local isBehind = GameAI.IsAnimalBehind(self.animal, target)

		if isBehind == true then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	else
		self.status = FAILED
	end
end

BT.IsBehindNode = IsBehindNode

local IsLeftNode = _class("IsLeftNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsLeftNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()
	local isLeft = GameAI.IsAnimalLeft(self.animal, target)

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		if isLeft == true then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	else
		self.status = FAILED
	end
end

BT.IsLeftNode = IsLeftNode

local IsStartSkillingNode = _class("IsStartSkillingNode", BehaviourNode, function(animal, hitMaxTime)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.hitMaxTime = hitMaxTime
	instance.hitTime = 0

	return instance
end)

function IsStartSkillingNode:Visit()
	if self.hitMaxTime ~= nil and self.animal:IsHit() == true then
		if self.hitTime > self.hitMaxTime and self.animal:GetAnimatorParam(AnimalBase_Define.ParamType.SkillExit) > 0 then
			self.hitTime = 0
			self.status = SUCCESS
		else
			self.hitTime = self.hitTime + Time.deltaTime
			self.status = FAILED
		end
	else
		self.hitTime = 0

		if self.animal:CheckSkillCommandEnable() == true and self.animal:IsSkilling() == false and (self.animal:IsHit() == false or self.animal:IsHit() == true and self.animal:GetAnimatorParam(AnimalBase_Define.ParamType.SkillExit) > 0) then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	end
end

BT.IsStartSkillingNode = IsStartSkillingNode

local IsPropertyMoreOrLessNode = _class("IsPropertyMoreOrLessNode", BehaviourNode, function(animal, type, isMoreThan, percent)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.type = type
	instance.isMoreThan = isMoreThan
	instance.percent = percent

	return instance
end)

function IsPropertyMoreOrLessNode:Visit()
	local propertyValueMax = self.animal:GetValue():GetPropertyMax(self.type)
	local propertyValue = self.animal:GetValue():GetProperty(self.type)

	if self.isMoreThan == true then
		if propertyValue > propertyValueMax * self.percent then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	elseif propertyValue <= propertyValueMax * self.percent then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsPropertyMoreOrLessNode = IsPropertyMoreOrLessNode

local IsSkillDataConditionPermitNode = _class("IsSkillDataConditionPermitNode", BehaviourNode, function(animal, skillIndex, skillCombo)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.skillIndex = skillIndex
	instance.skillCombo = skillCombo

	return instance
end)

function IsSkillDataConditionPermitNode:Visit()
	local skillData = MS_SkillData.GetSkillData(self.animal:GetHeroId(), self.skillIndex, self.skillCombo)
	local rageValue = self.animal:GetValue():GetProperty(MS_HeroData.Property.Rage)
	local powerValue = self.animal:GetValue():GetProperty(MS_HeroData.Property.Power)

	if skillData ~= nil and rageValue >= skillData.RequiredRage and powerValue >= skillData.RequiredPower then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsSkillDataConditionPermitNode = IsSkillDataConditionPermitNode

local DebugAISkillingNode = _class("DebugAISkillingNode", BehaviourNode, function(animal, skillList)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	if skillList then
		instance.skillList = {}

		for i = 1, #skillList do
			table.insert(instance.skillList, skillList[i] or 0)
		end
	end

	return instance
end)

function DebugAISkillingNode:Visit()
	if not DebugMonsterAISkill then
		self.status = SUCCESS
	else
		for i = 1, #self.skillList do
			if DebugMonsterAISkillId == self.skillList[i] then
				self.status = SUCCESS

				return
			end
		end

		self.status = FAILED
	end
end

BT.DebugAISkillingNode = DebugAISkillingNode

local SetSkillCdNode = _class("SetSkillCdNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.isInit = false

	return instance
end)

function SetSkillCdNode:Visit()
	local skillCDList = self.animal:GetBrain().attack.skillCDList
	local nowTime = TimeHelper.getNowTime()

	if skillCDList ~= nil then
		if self.isInit == false then
			for i = 1, #skillCDList do
				skillCDList[i].SkillCD = nowTime
			end

			self.isInit = true
		end

		for i = 1, #skillCDList do
			local skillIndex = skillCDList[i][1]

			if self.animal:IsSkillingById(skillIndex, 0) == true then
				skillCDList[i].SkillCD = nowTime

				if skillCDList[i][3] == true then
					skillCDList[i][3] = false
				end
			end
		end
	end

	self.status = SUCCESS
end

BT.SetSkillCdNode = SetSkillCdNode

local IsSkillCdNode = _class("IsSkillCdNode", BehaviourNode, function(animal, skillIndex)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.skillIndex = skillIndex

	return instance
end)

function IsSkillCdNode:Visit()
	local skillCDList = self.animal:GetBrain().attack.skillCDList
	local nowTime = TimeHelper.getNowTime()

	if skillCDList ~= nil then
		for i = 1, #skillCDList do
			local skillIndex = skillCDList[i][1]

			if skillIndex == self.skillIndex then
				local cdTime = skillCDList[i].SkillCD

				if skillCDList[i][3] == true or skillCDList[i][2] <= 0 or cdTime ~= nil and nowTime > cdTime + skillCDList[i][2] then
					self.status = SUCCESS

					return
				end
			end
		end
	end

	self.status = FAILED
end

BT.IsSkillCdNode = IsSkillCdNode

local SetSkillTargetNode = _class("SetSkillTargetNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function SetSkillTargetNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		self.animal:SetSkillTargetForAI(target)
	end

	self.status = SUCCESS
end

BT.SetSkillTargetNode = SetSkillTargetNode

local IsSkillComboMoreThan = _class("IsSkillComboMoreThan", BehaviourNode, function(animal, skillCombo)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.skillCombo = skillCombo

	return instance
end)

function IsSkillComboMoreThan:Visit()
	local skillIndex, skillCombo = self.animal:GetSkillingData()

	if skillCombo > self.skillCombo then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsSkillComboMoreThan = IsSkillComboMoreThan

local SkillingChangeDirection = _class("SkillingChangeDirection", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function SkillingChangeDirection:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		GameAI.SetSkillingDirection(self.animal, target)
	end

	self.status = SUCCESS
end

BT.SkillingChangeDirection = SkillingChangeDirection

local IsSkillComboNode = _class("IsSkillComboNode", BehaviourNode, function(animal, param)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.param = param or 1

	return instance
end)

function IsSkillComboNode:Visit()
	if self.animal:GetAnimatorParam(AnimalBase_Define.ParamType.SkillComboStart) >= self.param and self.animal:GetAnimatorParam(AnimalBase_Define.ParamType.SkillComboEnd) < self.param then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsSkillComboNode = IsSkillComboNode

local IsSkillComboSkillNode = _class("IsSkillComboSkillNode", BehaviourNode, function(animal, nextSkillIndex, nextSkillCombo)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.nextSkillIndex = nextSkillIndex
	instance.nextSkillCombo = nextSkillCombo

	return instance
end)

function IsSkillComboSkillNode:Visit()
	local skillIndex, skillCombo = self.animal:GetSkillingData()
	local isCombo = self.animal:IsSkillComboSkill(skillIndex, self.nextSkillIndex)

	if isCombo == true then
		local skillChainData = MS_SkillChainData.GetSkillChainData(self.animal:GetHeroId(), skillIndex, skillCombo, self.nextSkillIndex, self.nextSkillCombo)

		if skillChainData ~= nil then
			local comboStartIndex = skillChainData.SkillComboStart1
			local comboEndIndex = skillChainData.SkillComboEnd1
			local isInRange = self.animal:IsAnimatorInParamTime(AnimalBase_Define.ParamType.SkillComboStart, comboStartIndex, AnimalBase_Define.ParamType.SkillComboEnd, comboEndIndex)

			if isInRange == true then
				self.status = SUCCESS
			else
				comboStartIndex = skillChainData.SkillComboStart2
				comboEndIndex = skillChainData.SkillComboEnd2

				if comboStartIndex >= 0 then
					isInRange = self.animal:IsAnimatorInParamTime(AnimalBase_Define.ParamType.SkillComboStart, comboStartIndex, AnimalBase_Define.ParamType.SkillComboEnd, comboEndIndex)
				end

				if isInRange == true then
					self.status = SUCCESS
				else
					self.status = FAILED
				end
			end
		else
			self.status = SUCCESS
		end
	else
		self.status = FAILED
	end
end

BT.IsSkillComboSkillNode = IsSkillComboSkillNode

local IsSkillConditionNode = _class("IsSkillConditionNode", BehaviourNode, function(animal, skillIndex, param)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.skillIndex = skillIndex
	instance.param = param

	return instance
end)

function IsSkillConditionNode:Visit()
	if self.animal:IsSkillCondition(self.skillIndex, self.param) == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsSkillConditionNode = IsSkillConditionNode

local IsMoveFlyNode = _class("IsMoveFlyNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsMoveFlyNode:Visit()
	if self.animal:IsMoveFly() == true then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsMoveFlyNode = IsMoveFlyNode

local StopSkillNode = _class("StopSkillNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function StopSkillNode:Visit()
	self.animal:ClearSkillButtonAll()

	self.status = SUCCESS
end

BT.StopSkillNode = StopSkillNode

local IsMoveEnableNode = _class("IsMoveEnableNode", BehaviourNode, function(animal)
	local instance = BehaviourNode.__create()

	instance.animal = animal

	return instance
end)

function IsMoveEnableNode:Visit()
	if self.animal:IsFreeMoveEnable() == true and self.animal:IsSkilling() == false and self.animal:IsMoveFly() == false then
		self.status = SUCCESS
	else
		self.status = FAILED
	end
end

BT.IsMoveEnableNode = IsMoveEnableNode

local IsTargetHeightEnableNode = _class("IsTargetHeightEnableNode", BehaviourNode, function(animal, height)
	local instance = BehaviourNode.__create()

	instance.animal = animal
	instance.height = height

	return instance
end)

function IsTargetHeightEnableNode:Visit()
	local target = self.animal:GetBrain():GetAnimalTarget()

	if target ~= nil and target:IsDead() == false and target:IsShow() == true then
		if GameAI.IsAnimalWithinHeight(self.animal, target:GetPosByWorldPos(), self.height) == true then
			self.status = SUCCESS
		else
			self.status = FAILED
		end
	else
		self.status = FAILED
	end
end

BT.IsTargetHeightEnableNode = IsTargetHeightEnableNode

return BT
