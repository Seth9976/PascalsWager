﻿-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/protobuf/encoder.lua

local string = string
local table = table
local ipairs = ipairs
local assert = assert
local pb = require("pb")
local wire_format = require("protobuf.wire_format")

module("protobuf.encoder")

function _VarintSize(value)
	if value <= 127 then
		return 1
	end

	if value <= 16383 then
		return 2
	end

	if value <= 2097151 then
		return 3
	end

	if value <= 268435455 then
		return 4
	end

	if value <= 34359738367 then
		return 5
	end

	if value <= 4398046511103 then
		return 6
	end

	if value <= 562949953421311 then
		return 7
	end

	if value <= 7.205759403792794e+16 then
		return 8
	end

	if value <= 9.223372036854776e+18 then
		return 9
	end

	return 10
end

function _SignedVarintSize(value)
	if value < 0 then
		return 10
	end

	if value <= 127 then
		return 1
	end

	if value <= 16383 then
		return 2
	end

	if value <= 2097151 then
		return 3
	end

	if value <= 268435455 then
		return 4
	end

	if value <= 34359738367 then
		return 5
	end

	if value <= 4398046511103 then
		return 6
	end

	if value <= 562949953421311 then
		return 7
	end

	if value <= 7.205759403792794e+16 then
		return 8
	end

	if value <= 9.223372036854776e+18 then
		return 9
	end

	return 10
end

function _TagSize(field_number)
	return _VarintSize(wire_format.PackTag(field_number, 0))
end

function _SimpleSizer(compute_value_size)
	return function(field_number, is_repeated, is_packed)
		local tag_size = _TagSize(field_number)

		if is_packed then
			local VarintSize = _VarintSize

			return function(value)
				local result = 0

				for _, element in ipairs(value) do
					result = result + compute_value_size(element)
				end

				return result + VarintSize(result) + tag_size
			end
		elseif is_repeated then
			return function(value)
				local result = tag_size * #value

				for _, element in ipairs(value) do
					result = result + compute_value_size(element)
				end

				return result
			end
		else
			return function(value)
				return tag_size + compute_value_size(value)
			end
		end
	end
end

function _ModifiedSizer(compute_value_size, modify_value)
	return function(field_number, is_repeated, is_packed)
		local tag_size = _TagSize(field_number)

		if is_packed then
			local VarintSize = _VarintSize

			return function(value)
				local result = 0

				for _, element in ipairs(value) do
					result = result + compute_value_size(modify_value(element))
				end

				return result + VarintSize(result) + tag_size
			end
		elseif is_repeated then
			return function(value)
				local result = tag_size * #value

				for _, element in ipairs(value) do
					result = result + compute_value_size(modify_value(element))
				end

				return result
			end
		else
			return function(value)
				return tag_size + compute_value_size(modify_value(value))
			end
		end
	end
end

function _FixedSizer(value_size)
	return function(field_number, is_repeated, is_packed)
		local tag_size = _TagSize(field_number)

		if is_packed then
			local VarintSize = _VarintSize

			return function(value)
				local result = #value * value_size

				return result + VarintSize(result) + tag_size
			end
		elseif is_repeated then
			local element_size = value_size + tag_size

			return function(value)
				return #value * element_size
			end
		else
			local field_size = value_size + tag_size

			return function(value)
				return field_size
			end
		end
	end
end

Int32Sizer = _SimpleSizer(_SignedVarintSize)
Int64Sizer = _SimpleSizer(pb.signed_varint_size)
EnumSizer = Int32Sizer
UInt32Sizer = _SimpleSizer(_VarintSize)
UInt64Sizer = _SimpleSizer(pb.varint_size)
SInt32Sizer = _ModifiedSizer(_SignedVarintSize, wire_format.ZigZagEncode32)
SInt64Sizer = SInt32Sizer
Fixed32Sizer = _FixedSizer(4)
SFixed32Sizer = Fixed32Sizer
FloatSizer = Fixed32Sizer
Fixed64Sizer = _FixedSizer(8)
SFixed64Sizer = Fixed64Sizer
DoubleSizer = Fixed64Sizer
BoolSizer = _FixedSizer(1)

function StringSizer(field_number, is_repeated, is_packed)
	local tag_size = _TagSize(field_number)
	local VarintSize = _VarintSize

	assert(not is_packed)

	if is_repeated then
		return function(value)
			local result = tag_size * #value

			for _, element in ipairs(value) do
				local l = #element

				result = result + VarintSize(l) + l
			end

			return result
		end
	else
		return function(value)
			local l = #value

			return tag_size + VarintSize(l) + l
		end
	end
end

function BytesSizer(field_number, is_repeated, is_packed)
	local tag_size = _TagSize(field_number)
	local VarintSize = _VarintSize

	assert(not is_packed)

	if is_repeated then
		return function(value)
			local result = tag_size * #value

			for _, element in ipairs(value) do
				local l = #element

				result = result + VarintSize(l) + l
			end

			return result
		end
	else
		return function(value)
			local l = #value

			return tag_size + VarintSize(l) + l
		end
	end
end

function MessageSizer(field_number, is_repeated, is_packed)
	local tag_size = _TagSize(field_number)
	local VarintSize = _VarintSize

	assert(not is_packed)

	if is_repeated then
		return function(value)
			local result = tag_size * #value

			for _, element in ipairs(value) do
				local l = element:ByteSize()

				result = result + VarintSize(l) + l
			end

			return result
		end
	else
		return function(value)
			local l = value:ByteSize()

			return tag_size + VarintSize(l) + l
		end
	end
end

local _EncodeVarint = pb.varint_encoder
local _EncodeSignedVarint = pb.signed_varint_encoder
local _EncodeVarint64 = pb.varint_encoder64
local _EncodeSignedVarint64 = pb.signed_varint_encoder64

function _VarintBytes(value)
	local out = {}

	local function write(value)
		out[#out + 1] = value
	end

	_EncodeSignedVarint(write, value)

	return table.concat(out)
end

function TagBytes(field_number, wire_type)
	return _VarintBytes(wire_format.PackTag(field_number, wire_type))
end

function _SimpleEncoder(wire_type, encode_value, compute_value_size)
	return function(field_number, is_repeated, is_packed)
		if is_packed then
			local tag_bytes = TagBytes(field_number, wire_format.WIRETYPE_LENGTH_DELIMITED)
			local EncodeVarint = _EncodeVarint

			return function(write, value)
				write(tag_bytes)

				local size = 0

				for _, element in ipairs(value) do
					size = size + compute_value_size(element)
				end

				EncodeVarint(write, size)

				for element in value do
					encode_value(write, element)
				end
			end
		elseif is_repeated then
			local tag_bytes = TagBytes(field_number, wire_type)

			return function(write, value)
				for _, element in ipairs(value) do
					write(tag_bytes)
					encode_value(write, element)
				end
			end
		else
			local tag_bytes = TagBytes(field_number, wire_type)

			return function(write, value)
				write(tag_bytes)
				encode_value(write, value)
			end
		end
	end
end

function _ModifiedEncoder(wire_type, encode_value, compute_value_size, modify_value)
	return function(field_number, is_repeated, is_packed)
		if is_packed then
			local tag_bytes = TagBytes(field_number, wire_format.WIRETYPE_LENGTH_DELIMITED)
			local EncodeVarint = _EncodeVarint

			return function(write, value)
				write(tag_bytes)

				local size = 0

				for _, element in ipairs(value) do
					size = size + compute_value_size(modify_value(element))
				end

				EncodeVarint(write, size)

				for _, element in ipairs(value) do
					encode_value(write, modify_value(element))
				end
			end
		elseif is_repeated then
			local tag_bytes = TagBytes(field_number, wire_type)

			return function(write, value)
				for _, element in ipairs(value) do
					write(tag_bytes)
					encode_value(write, modify_value(element))
				end
			end
		else
			local tag_bytes = TagBytes(field_number, wire_type)

			return function(write, value)
				write(tag_bytes)
				encode_value(write, modify_value(value))
			end
		end
	end
end

function _StructPackEncoder(wire_type, value_size, format)
	return function(field_number, is_repeated, is_packed)
		local struct_pack = pb.struct_pack

		if is_packed then
			local tag_bytes = TagBytes(field_number, wire_format.WIRETYPE_LENGTH_DELIMITED)
			local EncodeVarint = _EncodeVarint

			return function(write, value)
				write(tag_bytes)
				EncodeVarint(write, #value * value_size)

				for _, element in ipairs(value) do
					struct_pack(write, format, element)
				end
			end
		elseif is_repeated then
			local tag_bytes = TagBytes(field_number, wire_type)

			return function(write, value)
				for _, element in ipairs(value) do
					write(tag_bytes)
					struct_pack(write, format, element)
				end
			end
		else
			local tag_bytes = TagBytes(field_number, wire_type)

			return function(write, value)
				write(tag_bytes)
				struct_pack(write, format, value)
			end
		end
	end
end

Int32Encoder = _SimpleEncoder(wire_format.WIRETYPE_VARINT, _EncodeSignedVarint, _SignedVarintSize)
Int64Encoder = _SimpleEncoder(wire_format.WIRETYPE_VARINT, _EncodeSignedVarint64, _SignedVarintSize)
EnumEncoder = Int32Encoder
UInt32Encoder = _SimpleEncoder(wire_format.WIRETYPE_VARINT, _EncodeVarint, _VarintSize)
UInt64Encoder = _SimpleEncoder(wire_format.WIRETYPE_VARINT, _EncodeVarint64, _VarintSize)
SInt32Encoder = _ModifiedEncoder(wire_format.WIRETYPE_VARINT, _EncodeVarint, _VarintSize, wire_format.ZigZagEncode32)
SInt64Encoder = _ModifiedEncoder(wire_format.WIRETYPE_VARINT, _EncodeVarint64, _VarintSize, wire_format.ZigZagEncode64)
Fixed32Encoder = _StructPackEncoder(wire_format.WIRETYPE_FIXED32, 4, string.byte("I"))
Fixed64Encoder = _StructPackEncoder(wire_format.WIRETYPE_FIXED64, 8, string.byte("Q"))
SFixed32Encoder = _StructPackEncoder(wire_format.WIRETYPE_FIXED32, 4, string.byte("i"))
SFixed64Encoder = _StructPackEncoder(wire_format.WIRETYPE_FIXED64, 8, string.byte("q"))
FloatEncoder = _StructPackEncoder(wire_format.WIRETYPE_FIXED32, 4, string.byte("f"))
DoubleEncoder = _StructPackEncoder(wire_format.WIRETYPE_FIXED64, 8, string.byte("d"))

function BoolEncoder(field_number, is_repeated, is_packed)
	local false_byte = "\x00"
	local true_byte = "\x01"

	if is_packed then
		local tag_bytes = TagBytes(field_number, wire_format.WIRETYPE_LENGTH_DELIMITED)
		local EncodeVarint = _EncodeVarint

		return function(write, value)
			write(tag_bytes)
			EncodeVarint(write, #value)

			for _, element in ipairs(value) do
				if element then
					write(true_byte)
				else
					write(false_byte)
				end
			end
		end
	elseif is_repeated then
		local tag_bytes = TagBytes(field_number, wire_format.WIRETYPE_VARINT)

		return function(write, value)
			for _, element in ipairs(value) do
				write(tag_bytes)

				if element then
					write(true_byte)
				else
					write(false_byte)
				end
			end
		end
	else
		local tag_bytes = TagBytes(field_number, wire_format.WIRETYPE_VARINT)

		return function(write, value)
			write(tag_bytes)

			if value then
				return write(true_byte)
			end

			return write(false_byte)
		end
	end
end

function StringEncoder(field_number, is_repeated, is_packed)
	local tag = TagBytes(field_number, wire_format.WIRETYPE_LENGTH_DELIMITED)
	local EncodeVarint = _EncodeVarint

	assert(not is_packed)

	if is_repeated then
		return function(write, value)
			for _, element in ipairs(value) do
				write(tag)
				EncodeVarint(write, #element)
				write(element)
			end
		end
	else
		return function(write, value)
			write(tag)
			EncodeVarint(write, #value)

			return write(value)
		end
	end
end

function BytesEncoder(field_number, is_repeated, is_packed)
	local tag = TagBytes(field_number, wire_format.WIRETYPE_LENGTH_DELIMITED)
	local EncodeVarint = _EncodeVarint

	assert(not is_packed)

	if is_repeated then
		return function(write, value)
			for _, element in ipairs(value) do
				write(tag)
				EncodeVarint(write, #element)
				write(element)
			end
		end
	else
		return function(write, value)
			write(tag)
			EncodeVarint(write, #value)

			return write(value)
		end
	end
end

function MessageEncoder(field_number, is_repeated, is_packed)
	local tag = TagBytes(field_number, wire_format.WIRETYPE_LENGTH_DELIMITED)
	local EncodeVarint = _EncodeVarint

	assert(not is_packed)

	if is_repeated then
		return function(write, value)
			for _, element in ipairs(value) do
				write(tag)
				EncodeVarint(write, element:ByteSize())
				element:_InternalSerialize(write)
			end
		end
	else
		return function(write, value)
			write(tag)
			EncodeVarint(write, value:ByteSize())

			return value:_InternalSerialize(write)
		end
	end
end
