-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Protocol/Protobuf/BattleBag_pb.lua

local protobuf = require("protobuf/protobuf")

module("LuaScript/Protocol/Protobuf/BattleBag_pb")

BAGITEM = protobuf.Descriptor()

local BAGITEM_ID_FIELD = protobuf.FieldDescriptor()
local BAGITEM_ITEMNO_FIELD = protobuf.FieldDescriptor()
local BAGITEM_QTY_FIELD = protobuf.FieldDescriptor()
local BAGITEM_BAGTYPE_FIELD = protobuf.FieldDescriptor()

BAGITEMLIST = protobuf.Descriptor()

local BAGITEMLIST_BAGITEMS_FIELD = protobuf.FieldDescriptor()

ADDBAGITEM = protobuf.Descriptor()

local ADDBAGITEM_ID_FIELD = protobuf.FieldDescriptor()
local ADDBAGITEM_ITEMNO_FIELD = protobuf.FieldDescriptor()
local ADDBAGITEM_QTY_FIELD = protobuf.FieldDescriptor()
local ADDBAGITEM_SRC_FIELD = protobuf.FieldDescriptor()
local ADDBAGITEM_BAGTYPE_FIELD = protobuf.FieldDescriptor()

UPDATEBAGITEM = protobuf.Descriptor()

local UPDATEBAGITEM_ID_FIELD = protobuf.FieldDescriptor()
local UPDATEBAGITEM_QTY_FIELD = protobuf.FieldDescriptor()
local UPDATEBAGITEM_DIFF_FIELD = protobuf.FieldDescriptor()
local UPDATEBAGITEM_SRC_FIELD = protobuf.FieldDescriptor()
local UPDATEBAGITEM_BAGTYPE_FIELD = protobuf.FieldDescriptor()

REMOVEBAGITEM = protobuf.Descriptor()

local REMOVEBAGITEM_ID_FIELD = protobuf.FieldDescriptor()
local REMOVEBAGITEM_SRC_FIELD = protobuf.FieldDescriptor()

BAGITEMWARN = protobuf.Descriptor()

local BAGITEMWARN_ID_FIELD = protobuf.FieldDescriptor()
local BAGITEMWARN_ITEMNO_FIELD = protobuf.FieldDescriptor()

REQSELLBAGITEM = protobuf.Descriptor()

local REQSELLBAGITEM_ID_FIELD = protobuf.FieldDescriptor()
local REQSELLBAGITEM_QTY_FIELD = protobuf.FieldDescriptor()

CLIENTBAGITEM = protobuf.Descriptor()

local CLIENTBAGITEM_ID_FIELD = protobuf.FieldDescriptor()
local CLIENTBAGITEM_QTY_FIELD = protobuf.FieldDescriptor()

REQUPDATECLIENTBAG = protobuf.Descriptor()

local REQUPDATECLIENTBAG_ITEMS_FIELD = protobuf.FieldDescriptor()
local REQUPDATECLIENTBAG_UPDATETIME_FIELD = protobuf.FieldDescriptor()
local REQUPDATECLIENTBAG_SIGN_FIELD = protobuf.FieldDescriptor()

BATTLEBAGUPDATEDONE = protobuf.Descriptor()
BAGITEM_ID_FIELD.name = "id"
BAGITEM_ID_FIELD.full_name = ".BagItem.id"
BAGITEM_ID_FIELD.number = 1
BAGITEM_ID_FIELD.index = 0
BAGITEM_ID_FIELD.label = 2
BAGITEM_ID_FIELD.has_default_value = false
BAGITEM_ID_FIELD.default_value = 0
BAGITEM_ID_FIELD.type = 13
BAGITEM_ID_FIELD.cpp_type = 3
BAGITEM_ITEMNO_FIELD.name = "itemNo"
BAGITEM_ITEMNO_FIELD.full_name = ".BagItem.itemNo"
BAGITEM_ITEMNO_FIELD.number = 2
BAGITEM_ITEMNO_FIELD.index = 1
BAGITEM_ITEMNO_FIELD.label = 2
BAGITEM_ITEMNO_FIELD.has_default_value = false
BAGITEM_ITEMNO_FIELD.default_value = 0
BAGITEM_ITEMNO_FIELD.type = 13
BAGITEM_ITEMNO_FIELD.cpp_type = 3
BAGITEM_QTY_FIELD.name = "qty"
BAGITEM_QTY_FIELD.full_name = ".BagItem.qty"
BAGITEM_QTY_FIELD.number = 3
BAGITEM_QTY_FIELD.index = 2
BAGITEM_QTY_FIELD.label = 2
BAGITEM_QTY_FIELD.has_default_value = false
BAGITEM_QTY_FIELD.default_value = 0
BAGITEM_QTY_FIELD.type = 13
BAGITEM_QTY_FIELD.cpp_type = 3
BAGITEM_BAGTYPE_FIELD.name = "bagType"
BAGITEM_BAGTYPE_FIELD.full_name = ".BagItem.bagType"
BAGITEM_BAGTYPE_FIELD.number = 4
BAGITEM_BAGTYPE_FIELD.index = 3
BAGITEM_BAGTYPE_FIELD.label = 2
BAGITEM_BAGTYPE_FIELD.has_default_value = false
BAGITEM_BAGTYPE_FIELD.default_value = 0
BAGITEM_BAGTYPE_FIELD.type = 13
BAGITEM_BAGTYPE_FIELD.cpp_type = 3
BAGITEM.name = "BagItem"
BAGITEM.full_name = ".BagItem"
BAGITEM.nested_types = {}
BAGITEM.enum_types = {}
BAGITEM.fields = {
	BAGITEM_ID_FIELD,
	BAGITEM_ITEMNO_FIELD,
	BAGITEM_QTY_FIELD,
	BAGITEM_BAGTYPE_FIELD
}
BAGITEM.is_extendable = false
BAGITEM.extensions = {}
BAGITEMLIST_BAGITEMS_FIELD.name = "bagItems"
BAGITEMLIST_BAGITEMS_FIELD.full_name = ".BagItemList.bagItems"
BAGITEMLIST_BAGITEMS_FIELD.number = 1
BAGITEMLIST_BAGITEMS_FIELD.index = 0
BAGITEMLIST_BAGITEMS_FIELD.label = 3
BAGITEMLIST_BAGITEMS_FIELD.has_default_value = false
BAGITEMLIST_BAGITEMS_FIELD.default_value = {}
BAGITEMLIST_BAGITEMS_FIELD.message_type = BAGITEM
BAGITEMLIST_BAGITEMS_FIELD.type = 11
BAGITEMLIST_BAGITEMS_FIELD.cpp_type = 10
BAGITEMLIST.name = "BagItemList"
BAGITEMLIST.full_name = ".BagItemList"
BAGITEMLIST.nested_types = {}
BAGITEMLIST.enum_types = {}
BAGITEMLIST.fields = {
	BAGITEMLIST_BAGITEMS_FIELD
}
BAGITEMLIST.is_extendable = false
BAGITEMLIST.extensions = {}
ADDBAGITEM_ID_FIELD.name = "id"
ADDBAGITEM_ID_FIELD.full_name = ".AddBagItem.id"
ADDBAGITEM_ID_FIELD.number = 1
ADDBAGITEM_ID_FIELD.index = 0
ADDBAGITEM_ID_FIELD.label = 2
ADDBAGITEM_ID_FIELD.has_default_value = false
ADDBAGITEM_ID_FIELD.default_value = 0
ADDBAGITEM_ID_FIELD.type = 13
ADDBAGITEM_ID_FIELD.cpp_type = 3
ADDBAGITEM_ITEMNO_FIELD.name = "itemNo"
ADDBAGITEM_ITEMNO_FIELD.full_name = ".AddBagItem.itemNo"
ADDBAGITEM_ITEMNO_FIELD.number = 2
ADDBAGITEM_ITEMNO_FIELD.index = 1
ADDBAGITEM_ITEMNO_FIELD.label = 2
ADDBAGITEM_ITEMNO_FIELD.has_default_value = false
ADDBAGITEM_ITEMNO_FIELD.default_value = 0
ADDBAGITEM_ITEMNO_FIELD.type = 13
ADDBAGITEM_ITEMNO_FIELD.cpp_type = 3
ADDBAGITEM_QTY_FIELD.name = "qty"
ADDBAGITEM_QTY_FIELD.full_name = ".AddBagItem.qty"
ADDBAGITEM_QTY_FIELD.number = 3
ADDBAGITEM_QTY_FIELD.index = 2
ADDBAGITEM_QTY_FIELD.label = 2
ADDBAGITEM_QTY_FIELD.has_default_value = false
ADDBAGITEM_QTY_FIELD.default_value = 0
ADDBAGITEM_QTY_FIELD.type = 13
ADDBAGITEM_QTY_FIELD.cpp_type = 3
ADDBAGITEM_SRC_FIELD.name = "src"
ADDBAGITEM_SRC_FIELD.full_name = ".AddBagItem.src"
ADDBAGITEM_SRC_FIELD.number = 4
ADDBAGITEM_SRC_FIELD.index = 3
ADDBAGITEM_SRC_FIELD.label = 2
ADDBAGITEM_SRC_FIELD.has_default_value = false
ADDBAGITEM_SRC_FIELD.default_value = 0
ADDBAGITEM_SRC_FIELD.type = 13
ADDBAGITEM_SRC_FIELD.cpp_type = 3
ADDBAGITEM_BAGTYPE_FIELD.name = "bagType"
ADDBAGITEM_BAGTYPE_FIELD.full_name = ".AddBagItem.bagType"
ADDBAGITEM_BAGTYPE_FIELD.number = 5
ADDBAGITEM_BAGTYPE_FIELD.index = 4
ADDBAGITEM_BAGTYPE_FIELD.label = 2
ADDBAGITEM_BAGTYPE_FIELD.has_default_value = false
ADDBAGITEM_BAGTYPE_FIELD.default_value = 0
ADDBAGITEM_BAGTYPE_FIELD.type = 13
ADDBAGITEM_BAGTYPE_FIELD.cpp_type = 3
ADDBAGITEM.name = "AddBagItem"
ADDBAGITEM.full_name = ".AddBagItem"
ADDBAGITEM.nested_types = {}
ADDBAGITEM.enum_types = {}
ADDBAGITEM.fields = {
	ADDBAGITEM_ID_FIELD,
	ADDBAGITEM_ITEMNO_FIELD,
	ADDBAGITEM_QTY_FIELD,
	ADDBAGITEM_SRC_FIELD,
	ADDBAGITEM_BAGTYPE_FIELD
}
ADDBAGITEM.is_extendable = false
ADDBAGITEM.extensions = {}
UPDATEBAGITEM_ID_FIELD.name = "id"
UPDATEBAGITEM_ID_FIELD.full_name = ".UpdateBagItem.id"
UPDATEBAGITEM_ID_FIELD.number = 1
UPDATEBAGITEM_ID_FIELD.index = 0
UPDATEBAGITEM_ID_FIELD.label = 2
UPDATEBAGITEM_ID_FIELD.has_default_value = false
UPDATEBAGITEM_ID_FIELD.default_value = 0
UPDATEBAGITEM_ID_FIELD.type = 13
UPDATEBAGITEM_ID_FIELD.cpp_type = 3
UPDATEBAGITEM_QTY_FIELD.name = "qty"
UPDATEBAGITEM_QTY_FIELD.full_name = ".UpdateBagItem.qty"
UPDATEBAGITEM_QTY_FIELD.number = 2
UPDATEBAGITEM_QTY_FIELD.index = 1
UPDATEBAGITEM_QTY_FIELD.label = 2
UPDATEBAGITEM_QTY_FIELD.has_default_value = false
UPDATEBAGITEM_QTY_FIELD.default_value = 0
UPDATEBAGITEM_QTY_FIELD.type = 13
UPDATEBAGITEM_QTY_FIELD.cpp_type = 3
UPDATEBAGITEM_DIFF_FIELD.name = "diff"
UPDATEBAGITEM_DIFF_FIELD.full_name = ".UpdateBagItem.diff"
UPDATEBAGITEM_DIFF_FIELD.number = 3
UPDATEBAGITEM_DIFF_FIELD.index = 2
UPDATEBAGITEM_DIFF_FIELD.label = 2
UPDATEBAGITEM_DIFF_FIELD.has_default_value = false
UPDATEBAGITEM_DIFF_FIELD.default_value = 0
UPDATEBAGITEM_DIFF_FIELD.type = 5
UPDATEBAGITEM_DIFF_FIELD.cpp_type = 1
UPDATEBAGITEM_SRC_FIELD.name = "src"
UPDATEBAGITEM_SRC_FIELD.full_name = ".UpdateBagItem.src"
UPDATEBAGITEM_SRC_FIELD.number = 4
UPDATEBAGITEM_SRC_FIELD.index = 3
UPDATEBAGITEM_SRC_FIELD.label = 2
UPDATEBAGITEM_SRC_FIELD.has_default_value = false
UPDATEBAGITEM_SRC_FIELD.default_value = 0
UPDATEBAGITEM_SRC_FIELD.type = 13
UPDATEBAGITEM_SRC_FIELD.cpp_type = 3
UPDATEBAGITEM_BAGTYPE_FIELD.name = "bagType"
UPDATEBAGITEM_BAGTYPE_FIELD.full_name = ".UpdateBagItem.bagType"
UPDATEBAGITEM_BAGTYPE_FIELD.number = 5
UPDATEBAGITEM_BAGTYPE_FIELD.index = 4
UPDATEBAGITEM_BAGTYPE_FIELD.label = 2
UPDATEBAGITEM_BAGTYPE_FIELD.has_default_value = false
UPDATEBAGITEM_BAGTYPE_FIELD.default_value = 0
UPDATEBAGITEM_BAGTYPE_FIELD.type = 13
UPDATEBAGITEM_BAGTYPE_FIELD.cpp_type = 3
UPDATEBAGITEM.name = "UpdateBagItem"
UPDATEBAGITEM.full_name = ".UpdateBagItem"
UPDATEBAGITEM.nested_types = {}
UPDATEBAGITEM.enum_types = {}
UPDATEBAGITEM.fields = {
	UPDATEBAGITEM_ID_FIELD,
	UPDATEBAGITEM_QTY_FIELD,
	UPDATEBAGITEM_DIFF_FIELD,
	UPDATEBAGITEM_SRC_FIELD,
	UPDATEBAGITEM_BAGTYPE_FIELD
}
UPDATEBAGITEM.is_extendable = false
UPDATEBAGITEM.extensions = {}
REMOVEBAGITEM_ID_FIELD.name = "id"
REMOVEBAGITEM_ID_FIELD.full_name = ".RemoveBagItem.id"
REMOVEBAGITEM_ID_FIELD.number = 1
REMOVEBAGITEM_ID_FIELD.index = 0
REMOVEBAGITEM_ID_FIELD.label = 2
REMOVEBAGITEM_ID_FIELD.has_default_value = false
REMOVEBAGITEM_ID_FIELD.default_value = 0
REMOVEBAGITEM_ID_FIELD.type = 13
REMOVEBAGITEM_ID_FIELD.cpp_type = 3
REMOVEBAGITEM_SRC_FIELD.name = "src"
REMOVEBAGITEM_SRC_FIELD.full_name = ".RemoveBagItem.src"
REMOVEBAGITEM_SRC_FIELD.number = 4
REMOVEBAGITEM_SRC_FIELD.index = 1
REMOVEBAGITEM_SRC_FIELD.label = 2
REMOVEBAGITEM_SRC_FIELD.has_default_value = false
REMOVEBAGITEM_SRC_FIELD.default_value = 0
REMOVEBAGITEM_SRC_FIELD.type = 13
REMOVEBAGITEM_SRC_FIELD.cpp_type = 3
REMOVEBAGITEM.name = "RemoveBagItem"
REMOVEBAGITEM.full_name = ".RemoveBagItem"
REMOVEBAGITEM.nested_types = {}
REMOVEBAGITEM.enum_types = {}
REMOVEBAGITEM.fields = {
	REMOVEBAGITEM_ID_FIELD,
	REMOVEBAGITEM_SRC_FIELD
}
REMOVEBAGITEM.is_extendable = false
REMOVEBAGITEM.extensions = {}
BAGITEMWARN_ID_FIELD.name = "id"
BAGITEMWARN_ID_FIELD.full_name = ".BagItemWarn.id"
BAGITEMWARN_ID_FIELD.number = 1
BAGITEMWARN_ID_FIELD.index = 0
BAGITEMWARN_ID_FIELD.label = 1
BAGITEMWARN_ID_FIELD.has_default_value = false
BAGITEMWARN_ID_FIELD.default_value = 0
BAGITEMWARN_ID_FIELD.type = 13
BAGITEMWARN_ID_FIELD.cpp_type = 3
BAGITEMWARN_ITEMNO_FIELD.name = "itemNo"
BAGITEMWARN_ITEMNO_FIELD.full_name = ".BagItemWarn.itemNo"
BAGITEMWARN_ITEMNO_FIELD.number = 2
BAGITEMWARN_ITEMNO_FIELD.index = 1
BAGITEMWARN_ITEMNO_FIELD.label = 1
BAGITEMWARN_ITEMNO_FIELD.has_default_value = false
BAGITEMWARN_ITEMNO_FIELD.default_value = 0
BAGITEMWARN_ITEMNO_FIELD.type = 13
BAGITEMWARN_ITEMNO_FIELD.cpp_type = 3
BAGITEMWARN.name = "BagItemWarn"
BAGITEMWARN.full_name = ".BagItemWarn"
BAGITEMWARN.nested_types = {}
BAGITEMWARN.enum_types = {}
BAGITEMWARN.fields = {
	BAGITEMWARN_ID_FIELD,
	BAGITEMWARN_ITEMNO_FIELD
}
BAGITEMWARN.is_extendable = false
BAGITEMWARN.extensions = {}
REQSELLBAGITEM_ID_FIELD.name = "id"
REQSELLBAGITEM_ID_FIELD.full_name = ".ReqSellBagItem.id"
REQSELLBAGITEM_ID_FIELD.number = 1
REQSELLBAGITEM_ID_FIELD.index = 0
REQSELLBAGITEM_ID_FIELD.label = 1
REQSELLBAGITEM_ID_FIELD.has_default_value = false
REQSELLBAGITEM_ID_FIELD.default_value = 0
REQSELLBAGITEM_ID_FIELD.type = 13
REQSELLBAGITEM_ID_FIELD.cpp_type = 3
REQSELLBAGITEM_QTY_FIELD.name = "qty"
REQSELLBAGITEM_QTY_FIELD.full_name = ".ReqSellBagItem.qty"
REQSELLBAGITEM_QTY_FIELD.number = 2
REQSELLBAGITEM_QTY_FIELD.index = 1
REQSELLBAGITEM_QTY_FIELD.label = 1
REQSELLBAGITEM_QTY_FIELD.has_default_value = false
REQSELLBAGITEM_QTY_FIELD.default_value = 0
REQSELLBAGITEM_QTY_FIELD.type = 13
REQSELLBAGITEM_QTY_FIELD.cpp_type = 3
REQSELLBAGITEM.name = "ReqSellBagItem"
REQSELLBAGITEM.full_name = ".ReqSellBagItem"
REQSELLBAGITEM.nested_types = {}
REQSELLBAGITEM.enum_types = {}
REQSELLBAGITEM.fields = {
	REQSELLBAGITEM_ID_FIELD,
	REQSELLBAGITEM_QTY_FIELD
}
REQSELLBAGITEM.is_extendable = false
REQSELLBAGITEM.extensions = {}
CLIENTBAGITEM_ID_FIELD.name = "id"
CLIENTBAGITEM_ID_FIELD.full_name = ".ClientBagItem.id"
CLIENTBAGITEM_ID_FIELD.number = 1
CLIENTBAGITEM_ID_FIELD.index = 0
CLIENTBAGITEM_ID_FIELD.label = 2
CLIENTBAGITEM_ID_FIELD.has_default_value = false
CLIENTBAGITEM_ID_FIELD.default_value = 0
CLIENTBAGITEM_ID_FIELD.type = 13
CLIENTBAGITEM_ID_FIELD.cpp_type = 3
CLIENTBAGITEM_QTY_FIELD.name = "qty"
CLIENTBAGITEM_QTY_FIELD.full_name = ".ClientBagItem.qty"
CLIENTBAGITEM_QTY_FIELD.number = 2
CLIENTBAGITEM_QTY_FIELD.index = 1
CLIENTBAGITEM_QTY_FIELD.label = 2
CLIENTBAGITEM_QTY_FIELD.has_default_value = false
CLIENTBAGITEM_QTY_FIELD.default_value = 0
CLIENTBAGITEM_QTY_FIELD.type = 13
CLIENTBAGITEM_QTY_FIELD.cpp_type = 3
CLIENTBAGITEM.name = "ClientBagItem"
CLIENTBAGITEM.full_name = ".ClientBagItem"
CLIENTBAGITEM.nested_types = {}
CLIENTBAGITEM.enum_types = {}
CLIENTBAGITEM.fields = {
	CLIENTBAGITEM_ID_FIELD,
	CLIENTBAGITEM_QTY_FIELD
}
CLIENTBAGITEM.is_extendable = false
CLIENTBAGITEM.extensions = {}
REQUPDATECLIENTBAG_ITEMS_FIELD.name = "items"
REQUPDATECLIENTBAG_ITEMS_FIELD.full_name = ".ReqUpdateClientBag.items"
REQUPDATECLIENTBAG_ITEMS_FIELD.number = 1
REQUPDATECLIENTBAG_ITEMS_FIELD.index = 0
REQUPDATECLIENTBAG_ITEMS_FIELD.label = 3
REQUPDATECLIENTBAG_ITEMS_FIELD.has_default_value = false
REQUPDATECLIENTBAG_ITEMS_FIELD.default_value = {}
REQUPDATECLIENTBAG_ITEMS_FIELD.message_type = CLIENTBAGITEM
REQUPDATECLIENTBAG_ITEMS_FIELD.type = 11
REQUPDATECLIENTBAG_ITEMS_FIELD.cpp_type = 10
REQUPDATECLIENTBAG_UPDATETIME_FIELD.name = "updateTime"
REQUPDATECLIENTBAG_UPDATETIME_FIELD.full_name = ".ReqUpdateClientBag.updateTime"
REQUPDATECLIENTBAG_UPDATETIME_FIELD.number = 2
REQUPDATECLIENTBAG_UPDATETIME_FIELD.index = 1
REQUPDATECLIENTBAG_UPDATETIME_FIELD.label = 2
REQUPDATECLIENTBAG_UPDATETIME_FIELD.has_default_value = false
REQUPDATECLIENTBAG_UPDATETIME_FIELD.default_value = 0
REQUPDATECLIENTBAG_UPDATETIME_FIELD.type = 13
REQUPDATECLIENTBAG_UPDATETIME_FIELD.cpp_type = 3
REQUPDATECLIENTBAG_SIGN_FIELD.name = "sign"
REQUPDATECLIENTBAG_SIGN_FIELD.full_name = ".ReqUpdateClientBag.sign"
REQUPDATECLIENTBAG_SIGN_FIELD.number = 3
REQUPDATECLIENTBAG_SIGN_FIELD.index = 2
REQUPDATECLIENTBAG_SIGN_FIELD.label = 2
REQUPDATECLIENTBAG_SIGN_FIELD.has_default_value = false
REQUPDATECLIENTBAG_SIGN_FIELD.default_value = ""
REQUPDATECLIENTBAG_SIGN_FIELD.type = 9
REQUPDATECLIENTBAG_SIGN_FIELD.cpp_type = 9
REQUPDATECLIENTBAG.name = "ReqUpdateClientBag"
REQUPDATECLIENTBAG.full_name = ".ReqUpdateClientBag"
REQUPDATECLIENTBAG.nested_types = {}
REQUPDATECLIENTBAG.enum_types = {}
REQUPDATECLIENTBAG.fields = {
	REQUPDATECLIENTBAG_ITEMS_FIELD,
	REQUPDATECLIENTBAG_UPDATETIME_FIELD,
	REQUPDATECLIENTBAG_SIGN_FIELD
}
REQUPDATECLIENTBAG.is_extendable = false
REQUPDATECLIENTBAG.extensions = {}
BATTLEBAGUPDATEDONE.name = "BattleBagUpdateDone"
BATTLEBAGUPDATEDONE.full_name = ".BattleBagUpdateDone"
BATTLEBAGUPDATEDONE.nested_types = {}
BATTLEBAGUPDATEDONE.enum_types = {}
BATTLEBAGUPDATEDONE.fields = {}
BATTLEBAGUPDATEDONE.is_extendable = false
BATTLEBAGUPDATEDONE.extensions = {}
AddBagItem = protobuf.Message(ADDBAGITEM)
BagItem = protobuf.Message(BAGITEM)
BagItemList = protobuf.Message(BAGITEMLIST)
BagItemWarn = protobuf.Message(BAGITEMWARN)
BattleBagUpdateDone = protobuf.Message(BATTLEBAGUPDATEDONE)
ClientBagItem = protobuf.Message(CLIENTBAGITEM)
RemoveBagItem = protobuf.Message(REMOVEBAGITEM)
ReqSellBagItem = protobuf.Message(REQSELLBAGITEM)
ReqUpdateClientBag = protobuf.Message(REQUPDATECLIENTBAG)
UpdateBagItem = protobuf.Message(UPDATEBAGITEM)
