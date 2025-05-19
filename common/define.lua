-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/Lua/Common/define.lua

CtrlNames = {
	Prompt = "PromptCtrl",
	Message = "MessageCtrl"
}
PanelNames = {
	"PromptPanel",
	"MessagePanel"
}
ProtocalType = {
	SPROTO = 3,
	PB_LUA = 1,
	BINARY = 0,
	PBC = 2
}
TestProtoType = ProtocalType.BINARY
Util = LuaFramework.Util
AppConst = LuaFramework.AppConst
LuaHelper = LuaFramework.LuaHelper
ByteBuffer = LuaFramework.ByteBuffer
resMgr = LuaHelper.GetResManager()
panelMgr = LuaHelper.GetPanelManager()
soundMgr = LuaHelper.GetSoundManager()
networkMgr = LuaHelper.GetNetManager()
WWW = UnityEngine.WWW
GameObject = UnityEngine.GameObject
