﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/tolua.lua

if jit then
	if jit.opt then
		jit.opt.start(3)
	end

	print("ver" .. jit.version_num .. " jit: ", jit.status())
	print(string.format("os: %s, arch: %s", jit.os, jit.arch))
end

if DebugServerIp then
	require("mobdebug").start(DebugServerIp)
end

require("misc.functions")

Mathf = require("UnityEngine.Mathf")
Vector3 = require("UnityEngine.Vector3")
Quaternion = require("UnityEngine.Quaternion")
Vector2 = require("UnityEngine.Vector2")
Vector4 = require("UnityEngine.Vector4")
Color = require("UnityEngine.Color")
Ray = require("UnityEngine.Ray")
Bounds = require("UnityEngine.Bounds")
RaycastHit = require("UnityEngine.RaycastHit")
Touch = require("UnityEngine.Touch")
LayerMask = require("UnityEngine.LayerMask")
Plane = require("UnityEngine.Plane")
Time = reimport("UnityEngine.Time")
list = require("list")
utf8 = require("misc.utf8")

require("event")
require("typeof")
require("slot")
require("System.Timer")
require("System.coroutine")
require("System.ValueType")
require("System.Reflection.BindingFlags")
