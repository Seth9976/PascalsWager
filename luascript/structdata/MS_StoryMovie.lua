-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/MS_StoryMovie.lua

require("GameData/StructData/ExportData/ES_StoryMovie")

MS_StoryMovie = class("MS_StoryMovie")
MS_StoryMovie.static.Type = {
	HostPlayerDead = 8,
	CarriageArrive = 7,
	Opening = 2,
	CarriageCall = 6,
	BossGradeUp = 4,
	Quest = 1,
	BossShow = 3,
	BossDead = 5
}
MS_StoryMovie.storyMovieList = nil

function MS_StoryMovie.Init()
	MS_StoryMovie.storyMovieList = {}

	for k, data in pairs(ES_StoryMovie) do
		local storyId = tonumber(data.StoryId)
		local movieId = tonumber(data.MovieId)

		if MS_StoryMovie.storyMovieList[storyId] == nil then
			MS_StoryMovie.storyMovieList[storyId] = {}
		end

		if AppVer == AppAppleLight and storyId == 1 then
			if movieId == 1001 then
				data.Position = 0
			elseif movieId == 1002 then
				data.Position = 1
			end
		end

		MS_StoryMovie.storyMovieList[storyId][movieId] = data
	end
end

function MS_StoryMovie.GetStoryMovie(storyId)
	storyId = tonumber(storyId)

	return MS_StoryMovie.storyMovieList[storyId]
end

function MS_StoryMovie.GetMovieData(storyId, movieId)
	storyId = tonumber(storyId)
	movieId = tonumber(movieId)

	if MS_StoryMovie.storyMovieList[storyId] ~= nil and MS_StoryMovie.storyMovieList[storyId][movieId] ~= nil then
		return MS_StoryMovie.storyMovieList[storyId][movieId]
	end

	return nil
end

function MS_StoryMovie.GetMovieByType(storyId, type)
	if MS_StoryMovie.storyMovieList[storyId] ~= nil then
		for id, data in pairs(MS_StoryMovie.storyMovieList[storyId]) do
			if data ~= nil and data.Type == type then
				return data
			end
		end
	end

	return nil
end

function MS_StoryMovie.GetMovieCarriageCall(storyId, carriageId)
	if MS_StoryMovie.storyMovieList[storyId] ~= nil then
		for id, data in pairs(MS_StoryMovie.storyMovieList[storyId]) do
			if data ~= nil and data.Type == MS_StoryMovie.Type.CarriageCall and data.CarriageId == carriageId then
				return data
			end
		end
	end

	return nil
end

function MS_StoryMovie.GetMovieCarriageArrive(storyId, carriageId)
	if MS_StoryMovie.storyMovieList[storyId] ~= nil then
		for id, data in pairs(MS_StoryMovie.storyMovieList[storyId]) do
			if data ~= nil and data.Type == MS_StoryMovie.Type.CarriageArrive and data.CarriageId == carriageId then
				return data
			end
		end
	end

	return nil
end
