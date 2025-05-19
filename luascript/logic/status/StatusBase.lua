-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Status/StatusBase.lua

StatusBase = class("StatusBase")

function StatusBase:initialize(fromAnimalId, hitPlayer, statusId, damage, srcType, srcId)
	self.fromAnimalId = fromAnimalId
	self.hitPlayer = hitPlayer
	self.statusId = statusId
	self.statusData = MS_StatusData.GetStatusData(self.statusId)
	self.sourceType = srcType
	self.sourceId = srcId
	self.statusType = self.statusData.StatusType
	self.statusLogicType = self.statusData.LogicType
	self.isDebuffer = self.statusData.IsDebuffer
	self.isRefresh = self.statusData.IsRefresh
	self.isRefreshMax = self.statusData.IsRefreshMax
	self.isOverlayNoRefresh = false
	self.drugFast = self.statusData.DrugFast
	self.statusStack = 0
	self.statusAttackType = self.statusData.AttackType
	self.statusDefenceType = self.statusData.DefenceType
	self.priority = self.statusData.Priority
	self.statusShow = self.statusData.IsShow
	self.share = self.statusData.Share
	self.noDeath = self.statusData.NotDeath
	self.overlayMax = self.statusData.Overlay
	self.overlay = 0
	self.saveEnable = self.statusData.SaveEnable
	self.saveData = nil
	self.statusActive = false

	local nowTime = TimeHelper.getNowTime()

	self.statusLastTime = nowTime
	self.statusStackDelayEndTime = nowTime + self.statusData.StackSubDelay
	self.statusActiveTime = 0
	self.statusLifeTime = 0
	self.statusPauseTime = 0
	self.statusPauseFlg = false
	self.getValueNextTime = 0
	self.statusEffect = nil
	self.sceneController = ST_Main.GetSceneController()
	self.scene = self.sceneController:GetScene()
	self.damage = damage

	if self.share > 0 and self.hitPlayer ~= nil then
		self.fromAnimalId = self.hitPlayer:GetAnimalId()
	end

	self.clearFlg = false
end

function StatusBase:GetFromAnimalId()
	return self.fromAnimalId
end

function StatusBase:GetStatusId()
	return self.statusId
end

function StatusBase:GetStatusType()
	return self.statusType
end

function StatusBase:GetStatusLogicType()
	return self.statusLogicType
end

function StatusBase:SetScene(tmpScene)
	self.scene = tmpScene
end

function StatusBase:IsDebuffer()
	if self.isDebuffer > 0 then
		return true
	end

	return false
end

function StatusBase:IsRefresh()
	if self.isRefresh > 0 then
		if self:IsOverlayMax() == true then
			if self.isOverlayNoRefresh == true then
				return false
			end

			if self.isRefreshMax < 1 then
				self.isOverlayNoRefresh = true
			end
		else
			self.isOverlayNoRefresh = false
		end

		return true
	end

	return false
end

function StatusBase:IsShare()
	if self.share > 0 then
		return true
	end

	return false
end

function StatusBase:IsOverlay()
	if self.overlayMax > 0 then
		return true
	end

	return false
end

function StatusBase:IsOverlayMax()
	if self.overlay >= self.overlayMax - 1 then
		return true
	end

	return false
end

function StatusBase:AddOverlay()
	SystemHelper.LogTest("=========AddOverlay======self.overlay=" .. self.overlay)

	if self.overlay < self.overlayMax - 1 then
		self.overlay = self.overlay + 1

		return true
	end

	return false
end

function StatusBase:SubOverlay()
	SystemHelper.LogTest("=========SubOverlay=======self.overlay=" .. self.overlay)

	if self.overlay > 0 then
		self.overlay = self.overlay - 1

		return true
	end

	return false
end

function StatusBase:GetOverlay()
	if self.overlayMax > 0 then
		return self.overlay + 1
	end

	return 0
end

function StatusBase:GetOverlaymultiplier()
	if self.overlayMax > 0 then
		return self.overlay + 1
	end

	return 1
end

function StatusBase:IsNoDeath()
	if self.noDeath > 0 then
		return true
	end

	return false
end

function StatusBase:GetPriority()
	return self.priority
end

function StatusBase:IsActive()
	return self.statusActive
end

function StatusBase:SetActive(flg)
	local oldActive = self.statusActive

	self.statusActive = flg

	if oldActive == false and self.statusActive == true then
		self:RefreshTime()
		self:PlayStatusEffect()
	end
end

function StatusBase:GetValueByPropertyId(logicType, propertyId)
	return 0
end

function StatusBase:GetPropertyValue(logicType)
	return 0, 0
end

function StatusBase:AddTime(time)
	if self.statusLifeTime > 0 then
		local endTime = TimeHelper.getNowTime() + time

		endTime = Mathf.Max(self.statusActiveTime + self.statusLifeTime, endTime)
		self.statusLifeTime = endTime - self.statusActiveTime
	end
end

function StatusBase:RefreshTime()
	self.statusActiveTime = TimeHelper.getNowTime() + 0.1

	local statusTime = self.statusData.Time

	if statusTime > 0 and self.sourceType == MS_StatusData.SourceType.Item and self.sourceId > 0 then
		local tmpTimeAdd = self.sceneController:GetTalentValue(self.fromAnimalId, MS_HeroTalent.Type.ItemStatusTimeAdd, self.sourceId, 0)

		if tmpTimeAdd > 0 then
			statusTime = MathHelper.addValuePermil(statusTime, tmpTimeAdd)
		end
	end

	self.statusLifeTime = statusTime
	self.statusStack = 0
end

function StatusBase:AddStack(stack)
	self.statusStack = self.statusStack + stack

	if self.statusStack >= 100 then
		self:SetActive(true)
	end
end

function StatusBase:GetStack()
	return self.statusStack
end

function StatusBase:GetStatusParam(index)
	if self.statusData ~= nil then
		local param = self.statusData["Param" .. index]

		if param ~= nil then
			return tonumber(param)
		end
	end

	return 0
end

function StatusBase:PlayStatusEffect()
	if self:IsActive() == true and self.hitPlayer ~= nil and self.statusData.Effect ~= "" and self.statusEffect == nil then
		local showEffect = true

		if self.hitPlayer:IsHost() == true and self.statusAttackType == MS_SkillData.AttackType.PierceDamage then
			local muteki = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.PierceMuteki)

			if muteki > 0 then
				showEffect = false
			end
		end

		if showEffect == true then
			local effectRot = self.hitPlayer:GetEffectRoot(self.statusData.EffectRoot)

			self.statusEffect = VfxManager.PlayBindMulti(effectRot, self.statusData.Effect)
		end
	end
end

function StatusBase:CheckTimeForPeriodValue()
	if self.statusPauseFlg == false and self:IsActive() == true then
		local nowTime = TimeHelper.getNowTime()

		if nowTime >= self.getValueNextTime then
			self.getValueNextTime = nowTime + 1

			return true
		end
	end

	return false
end

function StatusBase:GetCommonPropertyChange()
	if self.hitPlayer ~= nil and self.hitPlayer:GetValue() ~= nil then
		if self.hitPlayer:IsHost() == true and self.statusAttackType == MS_SkillData.AttackType.PierceDamage then
			local muteki = FS_UserData.trophy:GetLogicParam(MS_ItemData.TrophyLogicType.PierceMuteki)

			if muteki > 0 then
				return 0
			end
		end

		local attBase = self.damage

		attBase = attBase * self:GetStatusParam(2) / 1000

		local param4 = self:GetStatusParam(4)

		if self.sourceType == MS_StatusData.SourceType.Item and self.sourceId > 0 then
			local tmpParamAdd = self.sceneController:GetTalentValue(self.fromAnimalId, MS_HeroTalent.Type.ItemStatusValueAdd, self.sourceId, 0)

			if tmpParamAdd > 0 then
				param4 = MathHelper.addValuePermil(param4, tmpParamAdd)
			end
		end

		attBase = attBase + param4

		local defBase = self:GetCommonPropertyDefence(self.statusDefenceType)

		if self.statusDefenceType ~= MS_SkillData.DefenceType.PhysicResist and self.hitPlayer:IsHeroSanNotNormal(10004) == true then
			local tmpSubRate = Hero10004_Define.SanResistSubRate
			local tmpPropertyId = AnimalBase_Value.GetDefenceProperty(self.statusDefenceType)
			local tmpTalentRate = self.sceneController:GetTalentValue(self.hitPlayer:GetAnimalId(), MS_HeroTalent.Type.SanPropertyChangeRate, tmpPropertyId, 0)

			if tmpTalentRate > 0 then
				tmpSubRate = MathHelper.subValuePermil(tmpSubRate, tmpTalentRate)
			end

			defBase = MathHelper.subValuePermil(defBase, tmpSubRate)
		end

		defBase = defBase * self:GetStatusParam(3) / 1000

		local reduce = 1 - defBase / (defBase + 100)
		local ret = attBase * reduce
		local param5 = self:GetStatusParam(5)

		if self.sourceType == MS_StatusData.SourceType.Item and self.sourceId > 0 then
			local tmpParamAdd = self.sceneController:GetTalentValue(self.fromAnimalId, MS_HeroTalent.Type.ItemStatusValueAdd, self.sourceId, 0)

			if tmpParamAdd > 0 then
				param5 = MathHelper.addValuePermil(param5, tmpParamAdd)
			end
		end

		ret = ret + self.hitPlayer:GetValue():GetPropertyBase(self:GetStatusParam(1)) * (param5 / 1000)

		if self.hitPlayer:IsHeroSanNotNormal(10003) == true and self.drugFast > 0 and (self.hitPlayer:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId1) == true or self.hitPlayer:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId2) == true or self.hitPlayer:IsHaveStatusById(Hero10003_Define.SanItemValueSubStatusId3) == true) then
			ret = MathHelper.subValuePermil(ret, Hero10003_Define.SanItemValueSubRate)
		end

		ret = Mathf.Ceil(ret)

		return ret
	end

	return 0
end

function StatusBase:GetSimpleValue()
	return self:GetStatusParam(5)
end

function StatusBase:GetCommonPropertyDefence(type)
	local propertyId = AnimalBase_Value.GetDefenceProperty(type)

	if propertyId > 0 then
		return self.hitPlayer:GetValue():GetPropertyBase(propertyId)
	end

	return 0
end

function StatusBase:Pause()
	if self.statusPauseFlg == false then
		self.statusPauseFlg = true
		self.statusPauseTime = TimeHelper.getNowTime()

		if self.statusEffect ~= nil then
			self.statusEffect:Clear()

			self.statusEffect = nil
		end
	end
end

function StatusBase:Resume()
	if self.statusPauseFlg == true then
		self.statusPauseFlg = false

		local nowTime = TimeHelper.getNowTime()
		local diffTime = nowTime - self.statusPauseTime

		if self:IsActive() == true then
			self.statusActiveTime = self.statusActiveTime + diffTime
			self.getValueNextTime = self.getValueNextTime + diffTime

			self:PlayStatusEffect()
		else
			self.statusStackDelayEndTime = self.statusStackDelayEndTime + diffTime
		end

		self.statusLastTime = self.statusLastTime + diffTime
	end
end

function StatusBase:GetStatusNormalizeTime()
	if self:IsActive() == true then
		local percent = 0

		if self.statusLifeTime > 0 then
			local nowTime = TimeHelper.getNowTime()

			percent = 1 - Mathf.Clamp((nowTime - self.statusActiveTime) / self.statusLifeTime, 0, 1)
		else
			percent = 1
		end

		return percent
	end

	return 0
end

function StatusBase:LoadSaveData(data)
	if data == nil then
		return
	end

	self:AddStack(10000)

	if data.time ~= nil then
		local time = 1 - Mathf.Clamp(tonumber(data.time), 0, 1)

		self.statusActiveTime = self.statusActiveTime - self.statusLifeTime * time
	end

	if data.src_type ~= nil then
		self.sourceType = tonumber(data.src_type)
	end

	if data.src_id ~= nil then
		self.sourceId = tonumber(data.src_id)
	end

	if data.damage ~= nil then
		self.damage = tonumber(data.damage)
	end

	if data.overlay ~= nil then
		self.overlay = tonumber(data.overlay)
	end
end

function StatusBase:GetSaveData()
	if self.saveData == nil then
		self.saveData = {}
	end

	self.saveData.time = self:GetStatusNormalizeTime()
	self.saveData.src_type = self.sourceType
	self.saveData.src_id = self.sourceId
	self.saveData.damage = self.damage
	self.saveData.overlay = self.overlay

	return self.saveData
end

function StatusBase:Update()
	if self.hitPlayer == nil or self.hitPlayer:IsDead() == true then
		return false
	end

	if self.hitPlayer:IsShow() == false then
		return false
	end

	if self.statusPauseFlg == true then
		return true
	end

	local nowTime = TimeHelper.getNowTime()

	if self:IsActive() == true then
		if self.statusLifeTime > 0 and nowTime > self.statusActiveTime + self.statusLifeTime then
			return false
		end
	elseif nowTime >= self.statusStackDelayEndTime then
		local diffTime = nowTime - self.statusLastTime
		local sub = self.statusData.StackSubPer * diffTime

		self.statusStack = self.statusStack - sub

		if self.statusStack <= 0 then
			return false
		end
	end

	self.statusLastTime = nowTime

	self:ShowUI()

	return true
end

function StatusBase:ShowUI()
	if self.statusShow <= 0 then
		return
	end

	local percent = 0

	if self:IsActive() == true then
		percent = self:GetStatusNormalizeTime()
	else
		percent = Mathf.Clamp(self.statusStack / 100, 0, 1)
	end

	if self.hitPlayer:IsHost() == false then
		UIManager.SendMessage("HeadInfo", "SetStatusEnabled", self.hitPlayer:GetAnimalId(), self.statusId, percent, self:IsActive(), self.overlay)
	else
		UIManager.SendMessage("Mainmenu", "SetStatusEnabled", self.hitPlayer:GetAnimalId(), self.statusId, percent, self:IsActive(), self.overlay)
	end
end

function StatusBase:Clear()
	if self.clearFlg == true then
		return
	end

	self.clearFlg = true

	if self.statusShow > 0 then
		if self.hitPlayer:IsHost() == false then
			UIManager.SendMessage("HeadInfo", "SetStatusDisabled", self.hitPlayer:GetAnimalId(), self.statusId)
		else
			UIManager.SendMessage("Mainmenu", "SetStatusDisabled", self.hitPlayer:GetAnimalId(), self.statusId)
		end
	end

	self.hitPlayer = nil
	self.statusData = nil

	if self.statusEffect ~= nil then
		self.statusEffect:Clear()

		self.statusEffect = nil
	end

	self.saveData = nil
	self.scene = nil
	self.sceneController = nil
end
