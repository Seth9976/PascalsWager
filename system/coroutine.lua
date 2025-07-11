﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/System/coroutine.lua

local create = coroutine.create
local running = coroutine.running
local resume = coroutine.resume
local yield = coroutine.yield
local error = error
local unpack = unpack
local debug = debug
local FrameTimer = FrameTimer
local CoTimer = CoTimer
local comap = {}
local pool = {}

setmetatable(comap, {
	__mode = "kv"
})

function coroutine.start(f, ...)
	local co = create(f)

	if running() == nil then
		local flag, msg = resume(co, ...)

		if not flag then
			error(debug.traceback(co, msg))
		end
	else
		local args = {
			...
		}
		local timer

		local function action()
			comap[co] = nil
			timer.func = nil

			local flag, msg = resume(co, unpack(args))

			table.insert(pool, timer)

			if not flag then
				timer:Stop()
				error(debug.traceback(co, msg))
			end
		end

		if #pool > 0 then
			timer = table.remove(pool)

			timer:Reset(action, 0, 1)
		else
			timer = FrameTimer.New(action, 0, 1)
		end

		comap[co] = timer

		timer:Start()
	end

	return co
end

function coroutine.wait(t, co, ...)
	local args = {
		...
	}

	co = co or running()

	local timer

	local function action()
		comap[co] = nil
		timer.func = nil

		local flag, msg = resume(co, unpack(args))

		if not flag then
			timer:Stop()
			error(debug.traceback(co, msg))

			return
		end
	end

	timer = CoTimer.New(action, t, 1)
	comap[co] = timer

	timer:Start()

	return yield()
end

function coroutine.step(t, co, ...)
	local args = {
		...
	}

	co = co or running()

	local timer

	local function action()
		comap[co] = nil
		timer.func = nil

		local flag, msg = resume(co, unpack(args))

		table.insert(pool, timer)

		if not flag then
			timer:Stop()
			error(debug.traceback(co, msg))

			return
		end
	end

	if #pool > 0 then
		timer = table.remove(pool)

		timer:Reset(action, t or 1, 1)
	else
		timer = FrameTimer.New(action, t or 1, 1)
	end

	comap[co] = timer

	timer:Start()

	return yield()
end

function coroutine.www(www, co)
	co = co or running()

	local timer

	local function action()
		if not www.isDone then
			return
		end

		comap[co] = nil

		timer:Stop()

		timer.func = nil

		local flag, msg = resume(co)

		table.insert(pool, timer)

		if not flag then
			error(debug.traceback(co, msg))

			return
		end
	end

	if #pool > 0 then
		timer = table.remove(pool)

		timer:Reset(action, 1, -1)
	else
		timer = FrameTimer.New(action, 1, -1)
	end

	comap[co] = timer

	timer:Start()

	return yield()
end

function coroutine.stop(co)
	local timer = comap[co]

	if timer ~= nil then
		comap[co] = nil

		timer:Stop()
	end
end
