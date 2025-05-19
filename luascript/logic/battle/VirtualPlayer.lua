-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Battle/VirtualPlayer.lua

VirtualPlayer = class("VirtualPlayer")

function VirtualPlayer:initialize(animal)
	self.animalId = 0
	self.name = ""
	self.nickName = ""
	self.heroId = 0
	self.storyMonsterId = 0
	self.teamId = 0
	self.isHost = false
	self.position = Vector3.zero
	self.combo = 1
	self.property = {}

	self:Init(animal)
end

function VirtualPlayer:Init(animal)
	if animal == nil then
		return
	end

	self.animalId = animal:GetAnimalId()
	self.name = animal:GetName()
	self.nickName = animal:GetNickName()
	self.heroId = animal:GetHeroId()
	self.storyMonsterId = animal:GetStoryMonsterId()
	self.teamId = animal:GetTeamId()
	self.isHost = animal:IsHost()

	self:UpdateInfo(animal)
end

function VirtualPlayer:UpdateInfo(animal)
	if animal == nil then
		return
	end

	self.position:SetVector3(animal:GetPosByWorldPos())

	local tmpValue = animal:GetValue()

	if tmpValue ~= nil then
		self.property[MS_HeroData.Property.PhysicDamage] = tmpValue:GetPropertyMax(MS_HeroData.Property.PhysicDamage)
		self.property[MS_HeroData.Property.FireDamage] = tmpValue:GetPropertyMax(MS_HeroData.Property.FireDamage)
		self.property[MS_HeroData.Property.PoisonDamage] = tmpValue:GetPropertyMax(MS_HeroData.Property.PoisonDamage)
		self.property[MS_HeroData.Property.ArcaneDamage] = tmpValue:GetPropertyMax(MS_HeroData.Property.ArcaneDamage)
		self.property[MS_HeroData.Property.DarkDamage] = tmpValue:GetPropertyMax(MS_HeroData.Property.DarkDamage)
		self.property[MS_HeroData.Property.PierceDamage] = tmpValue:GetPropertyMax(MS_HeroData.Property.PierceDamage)
		self.property[MS_HeroData.Property.CritRate] = tmpValue:GetPropertyMax(MS_HeroData.Property.CritRate)
		self.property[MS_HeroData.Property.CritDamage] = tmpValue:GetPropertyMax(MS_HeroData.Property.CritDamage)
		self.property[MS_HeroData.Property.HumanAdd] = tmpValue:GetPropertyMax(MS_HeroData.Property.HumanAdd)
		self.property[MS_HeroData.Property.BeastAdd] = tmpValue:GetPropertyMax(MS_HeroData.Property.BeastAdd)
		self.property[MS_HeroData.Property.SendrilAdd] = tmpValue:GetPropertyMax(MS_HeroData.Property.SendrilAdd)
	end
end

function VirtualPlayer:Copy(vPlayer)
	self.animalId = vPlayer.animalId
	self.heroId = vPlayer.heroId
	self.storyMonsterId = vPlayer.storyMonsterId
	self.name = vPlayer.name
	self.nickName = vPlayer.nickName
	self.teamId = vPlayer.teamId
	self.isHost = vPlayer.isHost
	self.combo = vPlayer.combo

	self.position:SetVector3(vPlayer.position)

	self.property = {}

	for i, value in pairs(vPlayer.property) do
		self.property[i] = value
	end
end

function VirtualPlayer:GetAnimalId()
	return self.animalId
end

function VirtualPlayer:GetTeamId()
	return self.teamId
end

function VirtualPlayer:GetHeroId()
	return self.heroId
end

function VirtualPlayer:GetName()
	return self.name
end

function VirtualPlayer:GetNickName()
	return self.nickName
end

function VirtualPlayer:GetStoryMonsterId()
	return self.storyMonsterId
end

function VirtualPlayer:GetPosition()
	return self.position
end

function VirtualPlayer:IsHost()
	return self.isHost
end

function VirtualPlayer:GetProperty(propertyId)
	if self.property[propertyId] ~= nil then
		return self.property[propertyId]
	end

	return 0
end

function VirtualPlayer:GetDamage(attackType)
	attackType = tonumber(attackType)

	if attackType == MS_SkillData.AttackType.PhysicDamage then
		return self:GetProperty(MS_HeroData.Property.PhysicDamage)
	elseif attackType == MS_SkillData.AttackType.FireDamage then
		return self:GetProperty(MS_HeroData.Property.FireDamage)
	elseif attackType == MS_SkillData.AttackType.PoisonDamage then
		return self:GetProperty(MS_HeroData.Property.PoisonDamage)
	elseif attackType == MS_SkillData.AttackType.ArcaneDamage then
		return self:GetProperty(MS_HeroData.Property.ArcaneDamage)
	elseif attackType == MS_SkillData.AttackType.DarkDamage then
		return self:GetProperty(MS_HeroData.Property.DarkDamage)
	elseif attackType == MS_SkillData.AttackType.PierceDamage then
		return self:GetProperty(MS_HeroData.Property.PierceDamage)
	end

	return 0
end

function VirtualPlayer:Exit()
	self.position = nil
	self.property = nil
end
