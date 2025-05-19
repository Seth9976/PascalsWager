-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_ServerList.lua

require("LuaScript/StructData/FS_ServerListData")

FS_ServerList = class("FS_ServerList")

function FS_ServerList:initialize()
	self.serverList = {}
	self.recentServer = {}
	self.defaultServer = FS_ServerListData:new()
end

function FS_ServerList:Clear()
	if self.serverList ~= nil then
		for k, v in pairs(self.serverList) do
			if v ~= nil then
				v:Clear()
			end
		end
	end

	self.serverList = nil
	self.recentServer = nil

	if self.defaultServer ~= nil then
		self.defaultServer:Clear()

		self.defaultServer = nil
	end
end

function FS_ServerList:ParseServerList(serverInfo)
	if serverInfo ~= nil then
		for k, v in pairs(serverInfo.all) do
			if serverInfo.hasData and table.contains(serverInfo.hasData, v.id) then
				v.hasData = true
			else
				v.hasData = false
			end

			if self.serverList[tonumber(v.no)] ~= nil then
				self.serverList[tonumber(v.no)]:Parse(v)
			else
				local v_ServerData = FS_ServerListData:new()

				v_ServerData:Parse(v)

				self.serverList[tonumber(v.no)] = v_ServerData
			end

			if serverInfo.recent and tostring(serverInfo.recent[1]) == v.id then
				self.recentServer = self.serverList[tonumber(v.no)]
			end
		end
	end
end

function FS_ServerList:ParseDefaultServer(serverInfo)
	if serverInfo then
		if self.defaultServer ~= nil then
			self.defaultServer:Parse(serverInfo)
		else
			self.defaultServer = FS_ServerListData:new()

			self.defaultServer:Parse(serverInfo)
		end
	end
end

function FS_ServerList:GetDefaultServer()
	if next(self.defaultServer) then
		return self.defaultServer
	end

	return nil
end

function FS_ServerList:GetRecentServer()
	if next(self.recentServer) then
		return self.recentServer
	end

	return nil
end

function FS_ServerList:GetServerList()
	if next(self.serverList) then
		return self.serverList
	end

	return nil
end

return FS_ServerList
