﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/jit/bc.lua

local jit = require("jit")

assert(jit.version_num == 20100, "LuaJIT core/library version mismatch")

local jutil = require("jit.util")
local vmdef = require("jit.vmdef")
local bit = require("bit")
local sub, gsub, format = string.sub, string.gsub, string.format
local byte, band, shr = string.byte, bit.band, bit.rshift
local funcinfo, funcbc, funck = jutil.funcinfo, jutil.funcbc, jutil.funck
local funcuvname = jutil.funcuvname
local bcnames = vmdef.bcnames
local stdout, stderr = io.stdout, io.stderr

local function ctlsub(c)
	if c == "\n" then
		return "\\n"
	elseif c == "\r" then
		return "\\r"
	elseif c == "\t" then
		return "\\t"
	else
		return format("\\%03d", byte(c))
	end
end

local function bcline(func, pc, prefix)
	local ins, m = funcbc(func, pc)

	if not ins then
		return
	end

	local ma, mb, mc = band(m, 7), band(m, 120), band(m, 1920)
	local a = band(shr(ins, 8), 255)
	local oidx = 6 * band(ins, 255)
	local op = sub(bcnames, oidx + 1, oidx + 6)
	local s = format("%04d %s %-6s %3s ", pc, prefix or "  ", op, ma == 0 and "" or a)
	local d = shr(ins, 16)

	if mc == 1664 then
		return format("%s=> %04d\n", s, pc + d - 32767)
	end

	if mb ~= 0 then
		d = band(d, 255)
	elseif mc == 0 then
		return s .. "\n"
	end

	local kc

	if mc == 1280 then
		kc = funck(func, -d - 1)
		kc = format(#kc > 40 and "\"%.40s\"~" or "\"%s\"", gsub(kc, "%c", ctlsub))
	elseif mc == 1152 then
		kc = funck(func, d)

		if op == "TSETM " then
			kc = kc - 4503599627370496
		end
	elseif mc == 1536 then
		local fi = funcinfo(funck(func, -d - 1))

		if fi.ffid then
			kc = vmdef.ffnames[fi.ffid]
		else
			kc = fi.loc
		end
	elseif mc == 640 then
		kc = funcuvname(func, d)
	end

	if ma == 5 then
		local ka = funcuvname(func, a)

		if kc then
			kc = ka .. " ; " .. kc
		else
			kc = ka
		end
	end

	if mb ~= 0 then
		local b = shr(ins, 24)

		if kc then
			return format("%s%3d %3d  ; %s\n", s, b, d, kc)
		end

		return format("%s%3d %3d\n", s, b, d)
	end

	if kc then
		return format("%s%3d      ; %s\n", s, d, kc)
	end

	if mc == 896 and d > 32767 then
		d = d - 65536
	end

	return format("%s%3d\n", s, d)
end

local function bctargets(func)
	local target = {}

	for pc = 1, 1000000000 do
		local ins, m = funcbc(func, pc)

		if not ins then
			break
		end

		if band(m, 1920) == 1664 then
			target[pc + shr(ins, 16) - 32767] = true
		end
	end

	return target
end

local function bcdump(func, out, all)
	out = out or stdout

	local fi = funcinfo(func)

	if all and fi.children then
		for n = -1, -1000000000, -1 do
			local k = funck(func, n)

			if not k then
				break
			end

			if type(k) == "proto" then
				bcdump(k, out, true)
			end
		end
	end

	out:write(format("-- BYTECODE -- %s-%d\n", fi.loc, fi.lastlinedefined))

	local target = bctargets(func)

	for pc = 1, 1000000000 do
		local s = bcline(func, pc, target[pc] and "=>")

		if not s then
			break
		end

		out:write(s)
	end

	out:write("\n")
	out:flush()
end

local active, out

local function h_list(func)
	return bcdump(func, out)
end

local function bclistoff()
	if active then
		active = false

		jit.attach(h_list)

		if out and out ~= stdout and out ~= stderr then
			out:close()
		end

		out = nil
	end
end

local function bcliston(outfile)
	if active then
		bclistoff()
	end

	outfile = outfile or os.getenv("LUAJIT_LISTFILE")

	if outfile then
		out = outfile == "-" and stdout or assert(io.open(outfile, "w"))
	else
		out = stderr
	end

	jit.attach(h_list, "bc")

	active = true
end

return {
	line = bcline,
	dump = bcdump,
	targets = bctargets,
	on = bcliston,
	off = bclistoff,
	start = bcliston
}
