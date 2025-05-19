-- chunkname: @f:/unity/pascalswager_steam1/assets/LuaScript/StructData/FS_Battle_CommonResponse.lua

FS_Battle_CommonResponse = class("FS_Battle_CommonResponse")
FS_Battle_CommonResponse.protocolIdTcp = -1
FS_Battle_CommonResponse.errorCodeTcp = 0
FS_Battle_CommonResponse.protocolIdUdp = -1
FS_Battle_CommonResponse.errorCodeUdp = 0
FS_Battle_CommonResponse.CodeType = {
	Success = 0,
	Fail = 1,
	Wait = -1
}

function FS_Battle_CommonResponse.Init()
	FS_Battle_CommonResponse.protocolIdTcp = -1
	FS_Battle_CommonResponse.errorCodeTcp = 0
	FS_Battle_CommonResponse.protocolIdUdp = -1
	FS_Battle_CommonResponse.errorCodeUdp = 0
end

function FS_Battle_CommonResponse.Clear(protocol_type)
	if protocol_type == XProtocol.Type.BattleTcp then
		FS_Battle_CommonResponse.protocolIdTcp = -1
		FS_Battle_CommonResponse.errorCodeTcp = 0
	elseif protocol_type == XProtocol.Type.BattleUdp then
		FS_Battle_CommonResponse.protocolIdUdp = -1
		FS_Battle_CommonResponse.errorCodeUdp = 0
	end
end

function FS_Battle_CommonResponse.Parse(protocol_type, info)
	if info ~= nil then
		if protocol_type == XProtocol.Type.BattleTcp then
			FS_Battle_CommonResponse.protocolIdTcp = FS_Parser.toInt(info.pCode, FS_Battle_CommonResponse.protocolIdTcp)
			FS_Battle_CommonResponse.errorCodeTcp = FS_Parser.toInt(info.value, FS_Battle_CommonResponse.errorCodeTcp)
		elseif protocol_type == XProtocol.Type.BattleUdp then
			FS_Battle_CommonResponse.protocolIdUdp = FS_Parser.toInt(info.pCode, FS_Battle_CommonResponse.protocolIdUdp)
			FS_Battle_CommonResponse.errorCodeUdp = FS_Parser.toInt(info.value, FS_Battle_CommonResponse.errorCodeUdp)
		end
	end
end

function FS_Battle_CommonResponse.GetResponse(protocol_type, protocol_id)
	local code = FS_Battle_CommonResponse.CodeType.Wait

	if protocol_type == XProtocol.Type.BattleTcp then
		if FS_Battle_CommonResponse.protocolIdTcp == protocol_id then
			code = FS_Battle_CommonResponse.errorCodeTcp
		end
	elseif protocol_type == XProtocol.Type.BattleUdp and FS_Battle_CommonResponse.protocolIdUdp == protocol_id then
		code = FS_Battle_CommonResponse.errorCodeUdp
	end

	if code >= 0 then
		if code == 0 then
			code = FS_Battle_CommonResponse.CodeType.Success
		else
			code = FS_Battle_CommonResponse.CodeType.Fail
		end

		FS_Battle_CommonResponse.Clear(protocol_type)
	else
		code = FS_Battle_CommonResponse.CodeType.Wait
	end

	return code
end
