-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Trick/TrickGroup10050.lua

require("LuaScript/Logic/Trick/TrickGroupBase")
require("GameData/TrickDefine/TrickGroup10050_Define")

TrickGroup10050 = class("TrickGroup10050", TrickGroupBase)
TrickGroup10050.static.Status = {
	Trace = 1,
	Attack = 2,
	Clear = 3,
	Empty = 0
}

function TrickGroup10050:initialize(scene)
	TrickGroupBase.initialize(self, scene)

	self.damageType = AnimalBase_Define.DamageType.Period
	self.hitType = AnimalBase_Define.HitType.Dizzy
	self.playMode = TrickGroupBase.PlayMode.Sequence
	self.trickStatus = TrickGroup10050.Status.Empty
	self.isHitAudio = false
end

function TrickGroup10050:Open(pos, rot)
	TrickGroupBase.Open(self, pos, rot)

	if self:CheckOpen() == false then
		return false
	end

	self.trickActive = self:OpenTrickSingle(pos, rot)

	if self.trickActive == nil then
		return false
	end

	self.trickStatus = TrickGroup10050.Status.Trace
	self.isHitAudio = false

	self:Start()

	return true
end

function TrickGroup10050:Update()
	TrickGroupBase.Update(self)

	if self:IsOpening() == false then
		return
	end

	if self.trickActive == nil then
		return
	end

	local target = self.sceneController:GetHostPlayer()

	if target == nil or target:IsFreeSkillEnable() == false or target:IsOnStair() == true then
		return
	end

	local groundType = target:GetTouchGroundDataSimple()

	if groundType == SceneBase.GroundType.Water or groundType == SceneBase.GroundType.River or groundType == SceneBase.GroundType.Lake or groundType == SceneBase.GroundType.Slurry or groundType == SceneBase.GroundType.Wood then
		return
	end

	local targetPos = target:GetPosByWorldPos()
	local trickPos = self.trickActive:GetPosition()

	if self.trickStatus == TrickGroup10050.Status.Trace then
		local TracePos = Vector3.zero

		TracePos:SetVector3(targetPos)
		TracePos:Add(target:GetForward():SetNormalize():Mul(0.5))
		self.trickActive:SetPosition(TracePos)

		self.trickStatus = TrickGroup10050.Status.Attack
	elseif self.trickStatus == TrickGroup10050.Status.Attack and self.trickActive:IsHaveHitAnimal(target) == true then
		self.trickActive:SetParamTrigger(TrickGroup10050_Define.AnimParam)

		if self.isHitAudio == false then
			AudioCtrl.SetObjectAudio(TrickGroup10050_Define.HitAudioName, target:GetModel(), target:GetAnimalId())

			self.isHitAudio = true
		end

		target:SetPosByWorldPos(trickPos, true)
		target:KeepHitPeriod()

		self.trickStatus = TrickGroup10050.Status.Clear
	end
end

function TrickGroup10050:Exit()
	TrickGroupBase.Exit(self)
end

return TrickGroup10050
