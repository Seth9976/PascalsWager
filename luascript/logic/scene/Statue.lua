-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Logic/Scene/Statue.lua

Statue = class("Statue")
Statue.static.VfxName = "vfx_maze_statue"
Statue.static.Status = {
	Open = 1,
	Close = 2,
	Empty = 0
}
Statue.static.Type = {
	Demon = 2,
	Holy = 1
}

function Statue:initialize(id, transform)
	self.id = id
	self.dataList = nil
	self.tfSelf = transform
	self.type = Statue.Type.Holy
	self.position = Vector3.zero
	self.rotation = Quaternion.identity
	self.forward = Vector3.forward
	self.vfxStatus = nil
	self.showFlg = false
	self.isOpening = false
end

function Statue:IsOpening()
	return self.isOpening
end

function Statue:IsShow()
	return self.showFlg
end

function Statue:GetType()
	return self.type
end

function Statue:SetDataList(rnd1, rnd2)
	self.dataList = nil

	local num = MS_StoryMazeStatue.GetMazeStatueNum(self.id)

	if num >= 2 then
		local tmpList = {}

		for i = 1, num do
			table.insert(tmpList, i)
		end

		local index1 = rnd1 % num + 1
		local tmp = tmpList[1]

		tmpList[1] = tmpList[index1]
		tmpList[index1] = tmp

		local index2 = rnd2 % num + 1

		tmp = tmpList[2]
		tmpList[2] = tmpList[index2]
		tmpList[index2] = tmp

		if DebugMazeStatue == true and DebugMazeStatueType > 0 and DebugMazeStatueIndex1 > 0 and DebugMazeStatueIndex2 > 0 then
			tmpList[1] = DebugMazeStatueIndex1
			tmpList[2] = DebugMazeStatueIndex2
		end

		local tmpData1 = MS_StoryMazeStatue.GetMazeStatueData(self.id, tmpList[1])
		local tmpData2 = MS_StoryMazeStatue.GetMazeStatueData(self.id, tmpList[2])

		if tmpData1 ~= nil and tmpData2 ~= nil then
			self.type = Mathf.Ceil(tmpData1.StatueId / 2)
			self.dataList = {}

			table.insert(self.dataList, tmpData1)
			table.insert(self.dataList, tmpData2)
		end

		tmpList = nil
	end
end

function Statue:GetDataList()
	return self.dataList
end

function Statue:TouchStatue()
	local status = FS_UserData.story:GetStatueStatus(self.id)

	if status == Statue.Status.Open then
		FS_UserData.story:SetStatueStatus(self.id, Statue.Status.Close)

		self.isOpening = false

		if self.vfxStatus ~= nil then
			self.vfxStatus:Clear()

			self.vfxStatus = nil
		end

		AudioCtrl.SetObjectAudio("Object/scene/statue", self.tfSelf, self.id, "isOpen", 1)
	end
end

function Statue:DebugRefresh(pos, look)
	if self.showFlg == true then
		FS_UserData.story:SetStatueStatus(self.id, Statue.Status.Open)

		if self.vfxStatus ~= nil then
			self.vfxStatus:Clear()

			self.vfxStatus = nil
		end

		self:Show(pos, look)
	end
end

function Statue:Show(pos, look)
	self.position:SetVector3(pos)
	self.forward:SetVector3(look)

	local rot = Quaternion.LookRotation(look)

	self.rotation:SetQuaternion(rot)

	if self.tfSelf ~= nil then
		self.tfSelf.position = pos
		self.tfSelf.rotation = rot

		self.tfSelf.gameObject:SetActive(true)

		self.showFlg = true
	end

	local status = FS_UserData.story:GetStatueStatus(self.id)

	if status == Statue.Status.Open then
		self.isOpening = true

		if self.vfxStatus == nil then
			self.vfxStatus = VfxManager.PlayBindMulti(self.tfSelf, Statue.VfxName)

			if self.vfxStatus ~= nil then
				self.vfxStatus:SetDelayClear(true, nil)
			end
		end

		AudioCtrl.SetObjectAudio("Object/scene/statue", self.tfSelf, self.id, "isOpen", 0)
	else
		self.isOpening = false

		if self.vfxStatus ~= nil then
			self.vfxStatus:Clear()

			self.vfxStatus = nil
		end

		AudioCtrl.StopObjectAudio("Object/scene/statue", self.id)
	end
end

function Statue:Hide()
	if self.tfSelf ~= nil then
		self.tfSelf.gameObject:SetActive(false)

		self.showFlg = false
	end

	if self.vfxStatus ~= nil then
		self.vfxStatus:Clear()

		self.vfxStatus = nil
	end

	AudioCtrl.StopObjectAudio("Object/scene/statue", self.id)
end

function Statue:GetPosition()
	return self.position
end

function Statue:GetForward()
	return self.forward
end

function Statue:Exit()
	if self.vfxStatus ~= nil then
		self.vfxStatus:Clear()

		self.vfxStatus = nil
	end

	self.position = nil
	self.rotation = nil
	self.forward = nil
	self.tfSelf = nil
	self.dataList = nil

	AudioCtrl.StopObjectAudio("Object/scene/statue", self.id)
end

return Statue
