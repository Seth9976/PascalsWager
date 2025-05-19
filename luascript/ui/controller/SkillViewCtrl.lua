-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/UI/Controller/SkillViewCtrl.lua

SkillViewCtrl = class("SkillViewCtrl", UICtrlBase)

local this = SkillViewCtrl
local skillNameTextList = {}
local skillDetailTextList = {}
local skillIconList = {}
local skillJoystickIconList = {}
local skillComboIconList, CurrentHeroID
local isInGameScene = false
local isFinish, SkillScroll
local SkillViewIcon = {}

function SkillViewCtrl.OnCreate()
	local btn = this.mainComponent:GetButton("Button_Back_L")

	isFinish = false

	btn:SetAudioType(AudioCtrl.ButtonClickType.Back)
	btn:SetEventCallBack(EventTriggerType.PointerClick, function(obj, data)
		if not isFinish then
			return
		end

		UIManager.Close("SkillView")
		UILayerCtrl.Pop()

		if isInGameScene then
			isInGameScene = false
		end
	end)
	UILayerCtrl.Add("Skill")
	UILayerCtrl.AddButton("Skill", "Button_Back_L", btn)
	UILayerCtrl.AddIndividual("Skill", "Button_Back_L", btn)
	UILayerCtrl.Push("Skill", "Button_Back_L")

	SkillViewIcon = {}
	SkillViewIcon[1] = 10001
	SkillViewIcon[2] = 10002
	SkillViewIcon[3] = 10003
	SkillViewIcon[4] = 10004
	SkillViewIcon[100] = 10005
	SkillViewIcon[102] = 10017
	SkillViewIcon[101] = 10006
	SkillViewIcon[1002] = 10007
	SkillViewIcon[1003] = 10008

	for i = 1, 4 do
		skillNameTextList[i] = this.mainComponent:GetText("Skill_Group_Skill_Text_Skill_Text_1" .. i .. "_Text")
		skillDetailTextList[i] = this.mainComponent:GetText("SkillPanel_Skill_Group_Skill_Text_Skill_Text_1" .. i .. "_Text1")
		skillIconList[i] = this.mainComponent:GetGameObject("Skill_Group_Skill_Icon_Skill_" .. i)
		skillJoystickIconList[i] = this.mainComponent:GetGameObject("SkillJoystickIcon" .. i)
	end

	local heroInfoList = MS_HeroData.GetHero(CurrentHeroID)
	local skillList = MS_UIHeroInfo.GetSkillInfoList(CurrentHeroID)
	local comboList = MS_UISkillInfo.GetSkillComboList(CurrentHeroID)

	if skillList == nil or comboList == nil or heroInfoList == nil then
		isFinish = true

		return
	end

	for i = 1, 4 do
		skillNameTextList[i]:SetContent("")

		if skillList[i] == nil then
			break
		end

		skillDetailTextList[i]:SetContent(skillList[i].Description)

		if skillList[i].ButtonIcon ~= "" and skillList[i].ButtonIcon ~= 0 then
			local img = XImage:new(skillIconList[i])
			local sprite = XObjectPool.GetIcon("skill" .. skillList[i].ButtonIcon)

			if sprite ~= nil then
				img:SetSprite(sprite)
			end
		end

		if skillList[i].JoystickIcon ~= "" and skillList[i].JoystickIcon ~= 0 then
			local img = XImage:new(skillJoystickIconList[i])
			local sprite = XObjectPool.GetIcon("skillView" .. SkillViewIcon[skillList[i].JoystickIcon])

			if sprite ~= nil then
				img:SetSprite(sprite)
			end
		end
	end

	local longPressFlag = false

	skillComboIconList = this.mainComponent:GetLoader("Skill_Group_2_ScrollView_Viewport_Content")
	skillComboIconList.loadCount = #comboList

	function skillComboIconList.loadCallback(index, com, data)
		local comboSkills = comboList[index]

		com:GetText("ComboName"):SetContent(comboSkills.SkillName)

		for i = 1, 6 do
			if comboSkills["SkillIcon" .. i] ~= 0 then
				local skillIcon = com:GetGameObject("Skill_" .. i)

				skillIcon:SetActive(true)

				if comboSkills["SkillIcon" .. i] < 100 then
					local img = XImage:new(skillIcon)
					local skill_Icon

					skill_Icon = comboSkills["SkillIcon" .. i] == 4 and "00000" or MS_SkillIconData.GetSkillIcon(CurrentHeroID, comboSkills["SkillIcon" .. i], "1")

					local sprite = XObjectPool.GetIcon("skill" .. skill_Icon)

					if sprite then
						img:SetSprite(sprite)
					end
				else
					local img = XImage:new(skillIcon)
					local IconIndex

					IconIndex = comboSkills["SkillIcon" .. i] == 100 and 102 or comboSkills["SkillIcon" .. i]

					local sprite = XObjectPool.GetIcon("skillView" .. SkillViewIcon[IconIndex])

					if sprite then
						img:SetSprite(sprite)
					end
				end

				local joyIcon = com:GetGameObject("Joystick" .. i)

				joyIcon:SetActive(true)

				local sprite = XObjectPool.GetIcon("skillView" .. SkillViewIcon[comboSkills["SkillIcon" .. i]])

				if longPressFlag then
					sprite = XObjectPool.GetIcon("skillView" .. SkillViewIcon[comboSkills["SkillIcon" .. i] + 1000])
					longPressFlag = false
				end

				local img = XImage:new(joyIcon)

				if sprite then
					img:SetSprite(sprite)
				end

				if comboSkills["SkillIcon" .. i] == 101 then
					joyIcon:SetActive(false)

					longPressFlag = true
				end
			else
				local skillIcon = com:GetGameObject("Skill_" .. i)

				skillIcon:SetActive(false)

				local joyIcon = com:GetGameObject("Joystick" .. i)

				joyIcon:SetActive(false)
			end
		end

		if index == skillComboIconList.loadCount then
			isFinish = true
		end
	end

	skillComboIconList:Load()

	SkillScroll = this.mainComponent:GetGameObject("SkillPanel_Skill_Group_2_ScrollView")
	SkillScroll = XScrollRect:new(SkillScroll)
end

function SkillViewCtrl.OpenInGame(heroID)
	CurrentHeroID = tonumber(heroID)
	isInGameScene = true
end

function SkillViewCtrl.UpdateSkillView(heroID)
	CurrentHeroID = tonumber(heroID)
	isInGameScene = false
end

function SkillViewCtrl.SkillScroll(pos)
	if SkillScroll and not IsNil(SkillScroll.gameObject) then
		if pos == 2 then
			SkillScroll.scrollRectCom.normalizedPosition = Vector2.New(SkillScroll.scrollRectCom.normalizedPosition.x, SkillScroll.scrollRectCom.normalizedPosition.y - 1 / (skillComboIconList.loadCount - 4))
		elseif pos == 1 then
			SkillScroll.scrollRectCom.normalizedPosition = Vector2.New(SkillScroll.scrollRectCom.normalizedPosition.x, SkillScroll.scrollRectCom.normalizedPosition.y + 1 / (skillComboIconList.loadCount - 4))
		end
	end
end

function SkillViewCtrl.Update()
	if not this.loadFinish then
		return
	end

	this.GamePadControl()
end

function SkillViewCtrl.GamePadControl()
	if UILayerCtrl.IsProcessed() then
		return
	end

	local layerName = UILayerCtrl.GetCurrentLayerName()

	if layerName ~= nil and layerName == "Skill" and inputMgr:GetButtonUp(GBKey.B) then
		UILayerCtrl.OnButtonClick("Button_Back_L")
		UILayerCtrl.ForceUpdate()
	end
end

function SkillViewCtrl.Close()
	if isFinish then
		if skillComboIconList then
			skillComboIconList:ClearTemplate()
		end

		UICtrlBase.Close("SkillView")
	end
end

return SkillViewCtrl
