-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/PlayerValue/Hero20014_Value.lua

require("LuaScript/Logic/PlayerValue/AnimalBase_Value")

Hero20014_Value = class("Hero20014_Value", AnimalBase_Value)
Hero20014_Value.static.ChangeBGMHpRate1 = 0.5
Hero20014_Value.static.ChangeBGMHpRate2 = 0.3

function Hero20014_Value:initialize(animal)
	AnimalBase_Value.initialize(self, animal)
end

function Hero20014_Value:Update()
	AnimalBase_Value.Update(self)

	local nowHp = self:GetProperty(MS_HeroData.Property.Hp)
	local hpMax = self:GetPropertyMax(MS_HeroData.Property.Hp)
	local rate = nowHp / hpMax

	if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true and self.animal.gameController:IsBossMode() == true and self.animal.gameController:IsInMovie() == false then
		if self.animal:GetGrade() == 1 then
			FmodManager.SetParameterValue("BGM/story2/story_bossbattle_level_2", "BGMIndex", 0)
		elseif rate >= Hero20014_Value.ChangeBGMHpRate1 then
			FmodManager.SetParameterValue("BGM/story2/story_bossbattle_level_2", "BGMIndex", 1)
		elseif rate < Hero20014_Value.ChangeBGMHpRate2 and rate > 0 then
			FmodManager.SetParameterValue("BGM/story2/story_bossbattle_level_2", "BGMIndex", 2)
		end
	end
end

function Hero20014_Value:Exit()
	AnimalBase_Value.Exit(self)
end

return Hero20014_Value
