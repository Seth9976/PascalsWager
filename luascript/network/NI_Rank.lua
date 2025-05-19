-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/Network/NI_Rank.lua

NI_Rank = class("NI_Rank")

function NI_Rank.GetRank(callbackFun)
	local pageStr = "testRanking"
	local paramList = {
		{
			"id",
			tostring(FS_UserData.playerList:GetUserId())
		}
	}
	local paramStr = SystemHelper.ConvertHttpParam(paramList)

	networkMgrHttp:SendMessage(pageStr, paramStr, callbackFun)
end

function NI_Rank.ParseRankResponse(jsonData)
	local v_data = json.decode(jsonData)

	if v_data == nil then
		return false
	else
		local success = v_data.success

		if success == true then
			if v_data.self ~= nil then
				FS_UserData.playerList:ParseSelfRank(v_data.self)
			end

			FS_UserData.rank:Parse(v_data.ranking)

			return true
		end

		return false
	end
end
