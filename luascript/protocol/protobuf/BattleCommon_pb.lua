-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Protocol/Protobuf/BattleCommon_pb.lua

local protobuf = require("protobuf/protobuf")

module("LuaScript/Protocol/Protobuf/BattleCommon_pb")

RESPCOMMONMESSAGE = protobuf.Descriptor()

local RESPCOMMONMESSAGE_PCODE_FIELD = protobuf.FieldDescriptor()
local RESPCOMMONMESSAGE_VALUE_FIELD = protobuf.FieldDescriptor()

RESPCOMMONCD = protobuf.Descriptor()

local RESPCOMMONCD_PCODE_FIELD = protobuf.FieldDescriptor()
local RESPCOMMONCD_TIME_FIELD = protobuf.FieldDescriptor()
local RESPCOMMONCD_REASON_FIELD = protobuf.FieldDescriptor()

RESPCOMMONMESSAGE_PCODE_FIELD.name = "pCode"
RESPCOMMONMESSAGE_PCODE_FIELD.full_name = ".RespCommonMessage.pCode"
RESPCOMMONMESSAGE_PCODE_FIELD.number = 1
RESPCOMMONMESSAGE_PCODE_FIELD.index = 0
RESPCOMMONMESSAGE_PCODE_FIELD.label = 2
RESPCOMMONMESSAGE_PCODE_FIELD.has_default_value = false
RESPCOMMONMESSAGE_PCODE_FIELD.default_value = 0
RESPCOMMONMESSAGE_PCODE_FIELD.type = 13
RESPCOMMONMESSAGE_PCODE_FIELD.cpp_type = 3
RESPCOMMONMESSAGE_VALUE_FIELD.name = "value"
RESPCOMMONMESSAGE_VALUE_FIELD.full_name = ".RespCommonMessage.value"
RESPCOMMONMESSAGE_VALUE_FIELD.number = 2
RESPCOMMONMESSAGE_VALUE_FIELD.index = 1
RESPCOMMONMESSAGE_VALUE_FIELD.label = 2
RESPCOMMONMESSAGE_VALUE_FIELD.has_default_value = false
RESPCOMMONMESSAGE_VALUE_FIELD.default_value = 0
RESPCOMMONMESSAGE_VALUE_FIELD.type = 13
RESPCOMMONMESSAGE_VALUE_FIELD.cpp_type = 3
RESPCOMMONMESSAGE.name = "RespCommonMessage"
RESPCOMMONMESSAGE.full_name = ".RespCommonMessage"
RESPCOMMONMESSAGE.nested_types = {}
RESPCOMMONMESSAGE.enum_types = {}
RESPCOMMONMESSAGE.fields = {
	RESPCOMMONMESSAGE_PCODE_FIELD,
	RESPCOMMONMESSAGE_VALUE_FIELD
}
RESPCOMMONMESSAGE.is_extendable = false
RESPCOMMONMESSAGE.extensions = {}
RESPCOMMONCD_PCODE_FIELD.name = "pCode"
RESPCOMMONCD_PCODE_FIELD.full_name = ".RespCommonCD.pCode"
RESPCOMMONCD_PCODE_FIELD.number = 1
RESPCOMMONCD_PCODE_FIELD.index = 0
RESPCOMMONCD_PCODE_FIELD.label = 2
RESPCOMMONCD_PCODE_FIELD.has_default_value = false
RESPCOMMONCD_PCODE_FIELD.default_value = 0
RESPCOMMONCD_PCODE_FIELD.type = 13
RESPCOMMONCD_PCODE_FIELD.cpp_type = 3
RESPCOMMONCD_TIME_FIELD.name = "time"
RESPCOMMONCD_TIME_FIELD.full_name = ".RespCommonCD.time"
RESPCOMMONCD_TIME_FIELD.number = 2
RESPCOMMONCD_TIME_FIELD.index = 1
RESPCOMMONCD_TIME_FIELD.label = 2
RESPCOMMONCD_TIME_FIELD.has_default_value = false
RESPCOMMONCD_TIME_FIELD.default_value = 0
RESPCOMMONCD_TIME_FIELD.type = 4
RESPCOMMONCD_TIME_FIELD.cpp_type = 4
RESPCOMMONCD_REASON_FIELD.name = "reason"
RESPCOMMONCD_REASON_FIELD.full_name = ".RespCommonCD.reason"
RESPCOMMONCD_REASON_FIELD.number = 3
RESPCOMMONCD_REASON_FIELD.index = 2
RESPCOMMONCD_REASON_FIELD.label = 1
RESPCOMMONCD_REASON_FIELD.has_default_value = false
RESPCOMMONCD_REASON_FIELD.default_value = 0
RESPCOMMONCD_REASON_FIELD.type = 13
RESPCOMMONCD_REASON_FIELD.cpp_type = 3
RESPCOMMONCD.name = "RespCommonCD"
RESPCOMMONCD.full_name = ".RespCommonCD"
RESPCOMMONCD.nested_types = {}
RESPCOMMONCD.enum_types = {}
RESPCOMMONCD.fields = {
	RESPCOMMONCD_PCODE_FIELD,
	RESPCOMMONCD_TIME_FIELD,
	RESPCOMMONCD_REASON_FIELD
}
RESPCOMMONCD.is_extendable = false
RESPCOMMONCD.extensions = {}
RespCommonCD = protobuf.Message(RESPCOMMONCD)
RespCommonMessage = protobuf.Message(RESPCOMMONMESSAGE)
