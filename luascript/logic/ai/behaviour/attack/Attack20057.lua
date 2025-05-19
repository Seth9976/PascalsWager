-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/AI/Behaviour/Attack/Attack20057.lua

require("LuaScript/Lib/func")

local BT = require("LuaScript/Lib/behaviourtree")

Attack20057 = class("Attack20057")
Attack20057.static.SkillCd = {
	{
		Hero20057_Define.SkillType.SkillL,
		2,
		true
	}
}
Attack20057.static.SkillRange = {
	SkillL = 40
}

function Attack20057:initialize(instance)
	self.instance = instance
	self.skillCDList = Attack20057.SkillCd
	self.followType = Follow.Type.Stay
	self.followSpeed = AnimalBase_Define.SpeedMode.Normal
	self.bulletCnt = 0
	self.targetCooperation = nil
	self.attackNode = self:create()
end

function Attack20057:create()
	local btnode = BT.SelectorNode:create({
		BT.SequenceNode:create({
			BT.SkillingChangeDirection:create(self.instance),
			BT.SetSkillCdNode:create(self.instance),
			BT.SequenceNode:create({
				BT.IsBehaviourStateNode:create(self.instance, GameAI.BehaviourState.Attack),
				BT.SequenceNode:create({
					BT.ConditionNode:create(function()
						if BattleData.IsBattleMode(BattleData.Type.PVE_Story) == true then
							local targetCooperationId = self.instance.gameController:GetBossId()
							local targetCooperation = self.instance.sceneController:FindPlayerByStoryMonsterId(targetCooperationId)

							if targetCooperation ~= nil and targetCooperation:IsDead() == false and targetCooperation:IsShow() == true then
								self.targetCooperation = targetCooperation

								if targetCooperation:IsSkillingById(Hero20055_Define.SkillType.SkillOP2, 2) == true then
									local signCnt = targetCooperation:GetSignalCnt()

									if signCnt > self.bulletCnt then
										self.bulletCnt = signCnt

										if Hero20057.BulletCnt < Hero20057.BulletCntMax then
											return true
										end
									else
										Hero20057.BulletCnt = 0
									end
								else
									self.bulletCnt = 0
								end
							end
						end

						return false
					end),
					BT.IsTargetWithinSkillRangeNode:create(self.instance, 0, Attack20057.SkillRange.SkillL),
					BT.SetSkillTargetNode:create(self.instance),
					BT.CommonNode:create(function()
						Hero20057.BulletCnt = Hero20057.BulletCnt + 1
					end),
					BT.WaitNode:create(0.5),
					BT.CommonNode:create(function()
						if self.targetCooperation ~= nil then
							local targetPos = self.targetCooperation:GetSignalPos(self.bulletCnt)

							self.instance:SetBulletTargetPos(targetPos)
						end
					end),
					BT.ClickSkillButtonNode:create(self.instance, ControllerMain.SkillButton.Light)
				})
			})
		})
	})

	return btnode
end

function Attack20057:GetTarget()
	local target = GameAI.GetTargetOffense(self.instance)

	return target
end

return Attack20057
