﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/jit/dis_mips64.lua

local dis_mips = require((string.match(..., ".*%.") or "") .. "dis_mips")

return {
	create = dis_mips.create,
	disass = dis_mips.disass,
	regname = dis_mips.regname
}
