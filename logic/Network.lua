-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/Lua/Logic/Network.lua

require("Common/define")
require("Common/protocal")
require("Common/functions")

Event = require("events")

local print_r = require("3rd/sproto/print_r")

Network = {}

local this = Network
local transform, gameObject
local islogging = false

function Network.Start()
	logWarn("Network.Start!!")
	Event.AddListener(Protocal.Connect, this.OnConnect)
	Event.AddListener(Protocal.Message, this.OnMessage)
	Event.AddListener(Protocal.Exception, this.OnException)
	Event.AddListener(Protocal.Disconnect, this.OnDisconnect)
end

function Network.OnSocket(key, data)
	Event.Brocast(tostring(key), data)
end

function Network.OnConnect()
	logWarn("Game Server connected!!")
end

function Network.OnException()
	islogging = false

	NetManager:SendConnect()
	logError("OnException------->>>>")
end

function Network.OnDisconnect()
	islogging = false

	logError("OnDisconnect------->>>>")
end

function Network.OnMessage(buffer)
	if TestProtoType == ProtocalType.BINARY then
		this.TestLoginBinary(buffer)
	end

	if TestProtoType == ProtocalType.PB_LUA then
		this.TestLoginPblua(buffer)
	end

	if TestProtoType == ProtocalType.PBC then
		this.TestLoginPbc(buffer)
	end

	if TestProtoType == ProtocalType.SPROTO then
		this.TestLoginSproto(buffer)
	end

	local ctrl = CtrlManager.GetCtrl(CtrlNames.Message)

	if ctrl ~= nil then
		ctrl:Awake()
	end

	logWarn("OnMessage-------->>>")
end

function Network.TestLoginBinary(buffer)
	local protocal = buffer:ReadByte()
	local str = buffer:ReadString()

	log("TestLoginBinary: protocal:>" .. protocal .. " str:>" .. str)
end

function Network.TestLoginPblua(buffer)
	local protocal = buffer:ReadByte()
	local data = buffer:ReadBuffer()
	local msg = login_pb.LoginResponse()

	msg:ParseFromString(data)
	log("TestLoginPblua: protocal:>" .. protocal .. " msg:>" .. msg.id)
end

function Network.TestLoginPbc(buffer)
	local protocal = buffer:ReadByte()
	local data = buffer:ReadBuffer()
	local path = Util.DataPath .. "lua/3rd/pbc/addressbook.pb"
	local addr = io.open(path, "rb")
	local buffer = addr:read("*a")

	addr:close()
	protobuf.register(buffer)

	local decode = protobuf.decode("tutorial.Person", data)

	print(decode.name)
	print(decode.id)

	for _, v in ipairs(decode.phone) do
		print("\t" .. v.number, v.type)
	end

	log("TestLoginPbc: protocal:>" .. protocal)
end

function Network.TestLoginSproto(buffer)
	local protocal = buffer:ReadByte()
	local code = buffer:ReadBuffer()
	local sp = sproto.parse("    .Person {\n        name 0 : string\n        id 1 : integer\n        email 2 : string\n\n        .PhoneNumber {\n            number 0 : string\n            type 1 : integer\n        }\n\n        phone 3 : *PhoneNumber\n    }\n\n    .AddressBook {\n        person 0 : *Person(id)\n        others 1 : *Person\n    }\n    ")
	local addr = sp:decode("AddressBook", code)

	print_r(addr)
	log("TestLoginSproto: protocal:>" .. protocal)
end

function Network.Unload()
	Event.RemoveListener(Protocal.Connect)
	Event.RemoveListener(Protocal.Message)
	Event.RemoveListener(Protocal.Exception)
	Event.RemoveListener(Protocal.Disconnect)
	logWarn("Unload Network...")
end
