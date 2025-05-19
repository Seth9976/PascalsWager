-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Feedback.lua

FS_Feedback = class("FS_Feedback")
FS_Feedback.static.OpenURLString = "别忘记填一下调查问卷"
FS_Feedback.static.OpenURLTotalString = "这套问卷包含了整体游戏体验调查，请深入体验了游戏后再填写"
FS_Feedback.static.TestDescription = "本次内部测试说明"
FS_Feedback.static.UpdateDescription = "更新说明"
FS_Feedback.static.UpdateURL = "http://www.tips-works.com/test/update.html"
FS_Feedback.static.TestURL = "http://www.tips-works.com/test/readme.html"
FS_Feedback.static.OpenURLC = "https://giantuedc.wjx.cn/jq/53088231.aspx"
FS_Feedback.static.OpenURLB = "https://giantuedc.wjx.cn/jq/53087833.aspx"
FS_Feedback.static.OpenURL1 = "https://giantuedc.wjx.cn/jq/52843462.aspx"
FS_Feedback.static.OpenURL2 = "https://giantuedc.wjx.cn/jq/52842106.aspx"
FS_Feedback.static.OpenURL3 = "https://giantuedc.wjx.cn/jq/52842042.aspx"
FS_Feedback.static.OpenURL4 = "https://giantuedc.wjx.cn/jq/52842476.aspx"
FS_Feedback.static.OpenURL5 = "https://giantuedc.wjx.cn/jq/52842446.aspx"
FS_Feedback.static.OpenURL6 = "https://giantuedc.wjx.cn/jq/52842420.aspx"
FS_Feedback.static.OpenURL7 = "https://giantuedc.wjx.cn/jq/52842326.aspx"
FS_Feedback.static.OpenURL8 = "https://giantuedc.wjx.cn/jq/52842243.aspx"

function FS_Feedback:initialize()
	self.feedbackList = {}
	self.feedbackServerList = {}
end

function FS_Feedback:Clear()
	self.feedbackList = nil
	self.feedbackServerList = nil
end

function FS_Feedback:Reset()
	self:Clear()
	self:initialize()
end

function FS_Feedback:Encode()
	local ret = {}

	ret.feedback = {}

	for k, v in pairs(self.feedbackList) do
		ret.feedback[tostring(k)] = v
	end

	return ret
end

function FS_Feedback:Decode(data)
	self.feedbackList = {}

	if data.feedback ~= nil then
		for k, v in pairs(data.feedback) do
			self.feedbackList[tostring(k)] = v
		end
	end
end

function FS_Feedback:Refresh(data)
	self.feedbackServerList = {}

	local val = json.decode(data)

	if val == nil then
		return
	end

	if val.result ~= nil then
		local tmpJsonSub = val.result

		if FS_ParserJson.isValidKey(tmpJsonSub, "vos") then
			local retArr = tmpJsonSub.vos

			for k, v in pairs(retArr) do
				local ids = v.id
				local tbl = {}

				tbl.time = v.time
				tbl.content = v.content
				tbl.reply = v.reply
				tbl.replyTime = v.replyTime

				if self.feedbackList[ids] == nil or self.feedbackList[ids].reply == nil and tbl.reply ~= nil then
					if tbl.reply ~= nil then
						tbl.isNew = 1
					else
						tbl.isNew = 0
					end

					self.feedbackList[ids] = tbl
				end

				self.feedbackServerList[ids] = tbl
			end
		end
	end

	LS_Feedback.Update()
end

function FS_Feedback:GetSendResult(data)
	if data ~= nil then
		local ids = data.id
		local tbl = {}

		tbl.time = data.time
		tbl.content = data.content
		tbl.reply = data.reply
		tbl.replyTime = data.replyTime

		if self.feedbackServerList[ids] == nil then
			self.feedbackServerList[ids] = tbl
		end
	end
end

function FS_Feedback:SetAllOld()
	for k, v in pairs(self.feedbackList) do
		v.isNew = 0
	end

	LS_Feedback.Update()
end

function FS_Feedback:HasNew()
	for k, v in pairs(self.feedbackList) do
		if v.isNew == 1 then
			return true
		end
	end

	return false
end

function FS_Feedback:GetFeedbackList()
	local showList = {}
	local sortList = {}

	for k, v in pairs(self.feedbackServerList) do
		table.insert(sortList, v)
	end

	table.sort(sortList, function(a, b)
		return tonumber(a.time) > tonumber(b.time)
	end)

	for k, v in pairs(sortList) do
		if v.content ~= nil then
			local showTbl = {}

			showTbl.time = v.time
			showTbl.content = v.content

			table.insert(showList, showTbl)
		end

		if v.reply ~= nil then
			if v.content == nil then
				local showTbl = {}

				showTbl.time = v.replyTime
				showTbl.reply = v.reply
				showTbl.isMessage = true

				table.insert(showList, showTbl)
			else
				local showTbl = {}

				showTbl.time = v.replyTime
				showTbl.reply = v.reply

				table.insert(showList, showTbl)
			end
		end
	end

	return showList
end

return FS_Feedback
