-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Player/AnimalLobby.lua

AnimalLobby = class("AnimalLobby")
AnimalLobby.static.UpdateDelay = 2

function AnimalLobby:initialize(heroId, transform, layer, scale)
	self.tfSelf = transform
	self.heroId = tonumber(heroId)
	self.heroIdWithSkin = BattleData.ConvertHeroIdWithSkin(self.heroId)

	local boxList = {
		"aimBox",
		"aimPinBox",
		"attackBoxSkill",
		"cameraBox",
		"weaponBox",
		"aimTransform",
		"lipsyncs"
	}
	local tfs = self.tfSelf:GetComponentsInChildren(typeof("UnityEngine.Transform"))
	local len = tfs.Length

	for i = 0, len - 1 do
		local _tf = tfs[i]
		local childName = _tf.name

		for j = 1, #boxList do
			local boxName = boxList[j]

			if StringHelper.StartsWith(childName, boxName) == true then
				_tf.gameObject:SetActive(false)
			end
		end

		if StringHelper.EndsWith(childName, "_PuppetMaster") == true then
			_tf.gameObject:SetActive(false)
		end

		if self.heroId == 10004 and childName == "equipment4" then
			_tf.gameObject:SetActive(false)
		end

		if childName == "m_" .. self.heroIdWithSkin then
			local tfBodyRender = _tf.gameObject:GetComponent(typeof("UnityEngine.SkinnedMeshRenderer"))

			if tfBodyRender ~= nil then
				tfBodyRender.updateWhenOffscreen = true
			end
		end

		_tf.gameObject.layer = layer
	end

	local finalIkAimIK = self.tfSelf:GetComponent("RootMotion.FinalIK.AimIK")

	if finalIkAimIK ~= nil then
		GoDestroy(finalIkAimIK)
	end

	local finalIkBipedIK = self.tfSelf:GetComponent("RootMotion.FinalIK.FullBodyBipedIK")

	if finalIkBipedIK ~= nil then
		GoDestroy(finalIkBipedIK)
	end

	local finalIkBodyTilt = self.tfSelf:GetComponent("RootMotion.FinalIK.BodyTilt")

	if finalIkBodyTilt ~= nil then
		GoDestroy(finalIkBodyTilt)
	end

	local finalIkLookAtIK = self.tfSelf:GetComponent("RootMotion.FinalIK.LookAtIK")

	if finalIkLookAtIK ~= nil then
		GoDestroy(finalIkLookAtIK)
	end

	local weaponTrail = self.tfSelf:GetComponent("XftWeapon.XWeaponTrail")

	if weaponTrail ~= nil then
		GoDestroy(weaponTrail)
	end

	local characterMove = self.tfSelf:GetComponent("CharacterMove")

	if characterMove ~= nil then
		GoDestroy(characterMove)
	end

	local animalAim = self.tfSelf:GetComponent("AnimalAim")

	if animalAim ~= nil then
		GoDestroy(animalAim)
	end

	self.dynamicBone = self.tfSelf:GetComponent("DynamicBoneGroup")

	if self.dynamicBone then
		self.dynamicBone.enabled = false
	end

	self.animator = self.tfSelf:GetComponent("Animator")
	self.animator.applyRootMotion = true
	self.position = Vector3.New(0, -100, 0)
	self.rotation = Quaternion.identity
	self.localScale = Vector3.one * scale
	self.tfSelf.position = self.position
	self.tfSelf.rotation = self.rotation
	self.tfSelf.localScale = self.localScale
	self.updateDelay = 0

	self:CloseScript()
end

function AnimalLobby:GetTransform()
	return self.tfSelf
end

function AnimalLobby:GetHeroId()
	return self.heroId
end

function AnimalLobby:CloseScript()
	local mo = self.tfSelf:GetComponents(typeof("UnityEngine.MonoBehaviour"))

	for i = 0, mo.Length - 1 do
		mo[i].enabled = false
	end
end

function AnimalLobby:OpenScript()
	local mo = self.tfSelf:GetComponents(typeof("UnityEngine.MonoBehaviour"))

	for i = 0, mo.Length - 1 do
		if mo[i] ~= self.dynamicBone then
			if self.dynamicBone then
				if self.dynamicBone:IsInclude(mo[i]) == false then
					mo[i].enabled = true
				end
			else
				mo[i].enabled = true
			end
		end
	end
end

function AnimalLobby:SetEnableDynamicBoneGroup(isEnabled)
	if self.dynamicBone then
		self.dynamicBone.enabled = isEnabled
	end
end

function AnimalLobby:SetTarget(followingTarget, update, notChangeScale)
	self:CloseScript()

	if followingTarget then
		self:SetPosition(followingTarget.transform.position)
		self:SetRotation(followingTarget.transform.rotation)

		if not notChangeScale then
			self:SetScale(followingTarget.transform.localScale)
		end

		if update == true then
			self.updateDelay = 1

			self:RefreshTransform()
		end
	end

	self:OpenScript()
end

function AnimalLobby:SetSpeed(speed)
	if self.animator == nil then
		return
	end

	self.animator.speed = speed
end

function AnimalLobby:LookAt(look)
	local targetRot = Quaternion.LookRotation(look)

	self:SetRotation(targetRot)

	targetRot = nil
end

function AnimalLobby:SetRotation(rot)
	self.rotation:SetFixed(false)
	self.rotation:SetQuaternion(rot)
	self.rotation:SetFixed(true)

	self.updateDelay = AnimalLobby.UpdateDelay
end

function AnimalLobby:RotateY(angle)
	if MathHelper.IsZero(angle) == false then
		local rot = Quaternion.Euler(0, angle, 0)

		self.rotation:SetFixed(false)
		self.rotation:MulQuat(rot)
		self.rotation:SetFixed(true)

		rot = nil
		self.updateDelay = 1
	end
end

function AnimalLobby:GetPosition()
	return self.position
end

function AnimalLobby:SetPosition(pos)
	self.position:SetFixed(false)
	self.position:SetVector3(pos)
	self.position:SetFixed(true)

	self.updateDelay = AnimalLobby.UpdateDelay
end

function AnimalLobby:SetScale(scale)
	self.localScale:SetFixed(false)

	self.localScale.x = scale.x
	self.localScale.y = scale.y
	self.localScale.z = scale.z

	self.localScale:SetFixed(true)

	self.updateDelay = AnimalLobby.UpdateDelay
end

function AnimalLobby:SetScaleP(sx, sy, sz)
	self.localScale:SetFixed(false)

	self.localScale.x = sx
	self.localScale.y = sy
	self.localScale.z = sz

	self.localScale:SetFixed(true)

	self.updateDelay = AnimalLobby.UpdateDelay
end

function AnimalLobby:SetScalePNoDelay(sx, sy, sz)
	self.localScale:SetFixed(false)

	self.localScale.x = sx
	self.localScale.y = sy
	self.localScale.z = sz

	self.localScale:SetFixed(true)

	self.updateDelay = 1
end

function AnimalLobby:SetPositionY(offsetY)
	self.position:SetFixed(false)
	self.position:Set(self.position.x, self.position.y + offsetY, self.position.z)
	self.position:SetFixed(true)

	self.updateDelay = AnimalLobby.UpdateDelay
end

function AnimalLobby:GetScale(scale)
	return self.scale
end

function AnimalLobby:RefreshTransform()
	if self.updateDelay > 0 then
		self.updateDelay = self.updateDelay - 1

		if self.updateDelay <= 0 then
			self.tfSelf.position = self.position
			self.tfSelf.rotation = self.rotation
			self.tfSelf.localScale = self.localScale
		end
	end
end

function AnimalLobby:Exit()
	if self.tfSelf == nil then
		return
	end

	self.position = nil
	self.rotation = nil
	self.localScale = nil
	self.dynamicBone = nil

	if self.animator ~= nil then
		self.animator.runtimeAnimatorController = nil
	end

	self.animator = nil

	GoDestroyImmediate(self.tfSelf.gameObject)

	self.tfSelf = nil
end

function AnimalLobby:Update()
	if self.tfSelf == nil then
		return
	end

	self:RefreshTransform()
end

function AnimalLobby:SetTrigger(triggerName)
	self.animator:SetTrigger(triggerName)
end

function AnimalLobby:Stand()
	self:SetTrigger("click")
end

function AnimalLobby:SitDown()
	self:SetTrigger("sitdown")
end

function AnimalLobby:SetAnimatorSpeed(value)
	self.animator.speed = value
end

return AnimalLobby
