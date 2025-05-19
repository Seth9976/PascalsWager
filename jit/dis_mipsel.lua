-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/jit/dis_mipsel.lua

local dis_mips = require((string.match(..., ".*%.") or "") .. "dis_mips")

return {
	create = dis_mips.create_el,
	disass = dis_mips.disass_el,
	regname = dis_mips.regname
}
