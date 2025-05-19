-- chunkname: @F:/Unity/PascalsWager_steam1/Assets/LuaFramework/ToLua/Lua/System/Injection/InjectionBridgeInfo.lua

return {
	AccessingArray = {
		OnApplicationQuit = 34,
		ShowTips = 32,
		Start = 31,
		OnGUI = 33
	},
	AccessingEnum = {
		OnApplicationQuit = 90,
		ShowTips = 91,
		Start = 89,
		OnGUI = 92
	},
	AccessingLuaVariables = {
		OnApplicationQuit = 12,
		ShowTips = 13,
		Start = 11,
		OnGUI = 14
	},
	BaseTest = {
		TestRef = 249,
		set_PropertyTest = 408,
		get_PropertyTest = 407,
		[".ctor"] = 248
	},
	BaseTestWrap = {
		TestRef = 404,
		set_PropertyTest = 406,
		Register = 402,
		_CreateBaseTest = 403,
		get_PropertyTest = 405
	},
	CallLuaFunction = {
		ShowTips = 7,
		OnDestroy = 9,
		OnGUI = 8,
		CallFunc = 10,
		Start = 6
	},
	HelloWorld = {
		Awake = 1
	},
	["LuaInterface.LuaConstructor"] = {
		Destroy = 344,
		Call = 343,
		[".ctor"] = 342
	},
	["LuaInterface.LuaField"] = {
		Get = 346,
		Set = 347,
		[".ctor"] = 345
	},
	["LuaInterface.LuaMethod"] = {
		Destroy = 350,
		Call = 349,
		[".ctor"] = 348
	},
	["LuaInterface.LuaProperty"] = {
		Get = 352,
		Set = 353,
		[".ctor"] = 351
	},
	["LuaInterface.LuaReflection"] = {
		Get = 356,
		Dispose = 371,
		GetProperty = 366,
		[".ctor"] = 354,
		PushLuaField = 367,
		GetTypeMethod = 364,
		OpenLibs = 355,
		PushLuaProperty = 365,
		FindType = 358,
		GetField = 368,
		GetConstructor = 363,
		PushLuaMethod = 360,
		LoadAssembly_IntPtr = 359,
		GetMethod = 361,
		OpenReflectionLibs = 357,
		PushLuaConstructor = 362,
		CreateInstance = 369,
		LoadAssembly_string = 370
	},
	LuaInterface_InjectTypeWrap = {
		get_After = 377,
		IntToEnum = 383,
		Push = 374,
		[".ctor"] = 372,
		get_None = 376,
		Register = 373,
		get_Replace = 379,
		get_ReplaceWithPostInvokeBase = 381,
		LazyVarWrap = 382,
		CheckType = 375,
		get_ReplaceWithPreInvokeBase = 380,
		get_Before = 378
	},
	LuaInterface_LuaInjectionStationWrap = {
		GetInjectionFunction = 388,
		LazyWrap = 390,
		_CreateLuaInterface_LuaInjectionStation = 386,
		[".ctor"] = 384,
		LazyVarWrap = 391,
		CacheInjectFunction = 389,
		GetInjectFlag = 387,
		Register = 385
	},
	LuaProfilerWrap = {
		Clear = 394,
		LazyWrap = 400,
		set_list = 399,
		[".ctor"] = 392,
		EndSample = 397,
		Register = 393,
		BeginSample = 396,
		LazyVarWrap = 401,
		GetID = 395,
		get_list = 398
	},
	PassStruct = {
		CheckNullRectType = 204,
		OnLoadFinished = 209,
		CallMain = 212,
		PushRect = 200,
		ShowTips = 206,
		InitLoader = 210,
		ToRectTable = 205,
		CheckRectValue = 202,
		ToRectValue = 201,
		OnGUI = 211,
		OnApplicationQuit = 207,
		CheckRectType = 203,
		Awake = 208
	},
	ScriptsFromFile = {
		OnApplicationQuit = 5,
		OnGUI = 4,
		Start = 2,
		Log = 3
	},
	System_Collections_Generic_Dictionary_int_TestAccount_KeyCollectionWrap = {
		CopyTo = 59,
		GetEnumerator = 60,
		_CreateSystem_Collections_Generic_Dictionary_int_TestAccount_KeyCollection = 58,
		[".ctor"] = 56,
		Register = 57,
		get_Count = 61
	},
	System_Collections_Generic_Dictionary_int_TestAccount_ValueCollectionWrap = {
		GetEnumerator = 66,
		Register = 63,
		CopyTo = 65,
		[".ctor"] = 62,
		get_Count = 67,
		_CreateSystem_Collections_Generic_Dictionary_int_TestAccount_ValueCollection = 64
	},
	System_Collections_Generic_Dictionary_int_TestAccountWrap = {
		Clear = 44,
		get_Values = 55,
		_CreateSystem_Collections_Generic_Dictionary_int_TestAccount = 37,
		[".ctor"] = 35,
		ContainsKey = 45,
		Remove = 49,
		OnDeserialization = 48,
		_get_this = 38,
		ContainsValue = 46,
		get_Keys = 54,
		TryGetValue = 50,
		get_Item = 41,
		_set_this = 39,
		set_Item = 42,
		Add = 43,
		Register = 36,
		get_Comparer = 53,
		get_Count = 52,
		GetObjectData = 47,
		GetEnumerator = 51,
		_this = 40
	},
	System_Collections_Generic_KeyValuePair_int_TestAccountWrap = {
		get_Value = 73,
		ToString = 71,
		Register = 69,
		[".ctor"] = 68,
		get_Key = 72,
		_CreateSystem_Collections_Generic_KeyValuePair_int_TestAccount = 70
	},
	TestABLoader = {
		CoLoadBundle = 160,
		LoadBundles = 162,
		OnApplicationQuit = 166,
		OnGUI = 165,
		LoadFinished = 161,
		ShowTips = 164,
		Awake = 163,
		OnBundleLoad = 167
	},
	TestAccount = {
		[".ctor"] = 83
	},
	TestAccountWrap = {
		[".ctor"] = 74,
		get_id = 77,
		get_sex = 79,
		Register = 75,
		set_sex = 82,
		_CreateTestAccount = 76,
		get_name = 78,
		set_id = 80,
		set_name = 81
	},
	TestCJson = {
		OpenLibs = 169,
		OnLoadFinished = 170,
		CallMain = 171,
		OnGUI = 174,
		OnApplicationQuit = 173,
		InitLoader = 168,
		ShowTips = 172
	},
	TestCoroutine = {
		OnApplicationQuit = 16,
		ShowTips = 17,
		Awake = 15,
		OnGUI = 18
	},
	TestCoroutine2 = {
		OnLoadFinished = 20,
		ShowTips = 23,
		CallMain = 21,
		OnGUI = 25,
		OnApplicationQuit = 24,
		InitLoader = 19,
		Start = 22
	},
	TestCustomLoader = {
		OnApplicationQuit = 131,
		StartMain = 129,
		CallMain = 128,
		OnGUI = 133,
		Logger = 132,
		InitLoader = 127,
		Awake = 130
	},
	TestDelegate = {
		Bind = 98,
		Update = 103,
		TestEventListener_VoidDelegate = 101,
		ShowTips = 105,
		SafeRelease = 104,
		CallLuaFunction = 99,
		OnGUI = 102,
		OnApplicationQuit = 106,
		TestEventListener_OnClick = 100,
		Awake = 97
	},
	["TestDelegate.TestEventListener_OnClick_Event"] = {
		Call = 94,
		[".ctor"] = 93
	},
	["TestDelegate.TestEventListener_VoidDelegate_Event"] = {
		Call = 96,
		[".ctor"] = 95
	},
	TestEnum = {
		Test = 298,
		[".ctor"] = 297
	},
	TestEventListener = {
		SetOnFinished_OnClick = 107,
		OnClickEvent = 109,
		SetOnFinished_VoidDelegate = 108
	},
	TestEventListenerWrap = {
		get_TestFunc = 115,
		Register = 111,
		set_TestFunc = 118,
		[".ctor"] = 110,
		SetOnFinished = 112,
		op_Equality = 113,
		TestEventListener_VoidDelegate = 121,
		get_onClickEvent = 116,
		set_onClick = 117,
		set_onClickEvent = 119,
		get_onClick = 114,
		TestEventListener_OnClick = 120
	},
	TestExport = {
		Test_object_string = 314,
		get_Number = 303,
		["Test_int[,]"] = 319,
		[".ctor"] = 299,
		set_Item_char_int_int = 308,
		get_Item_int = 305,
		["Test_string[]_bool"] = 329,
		get_Item_double = 310,
		TestEnum = 333,
		get_Item_int_int_int = 311,
		Test = 317,
		["Test_object[]"] = 330,
		["Test_int[]"] = 327,
		["Test_int&"] = 322,
		TestCheckParamNumber = 334,
		TestCheckParamString = 335,
		Test33 = 332,
		[".ctor_Vector3[]"] = 300,
		Test_int = 320,
		TestReflection = 336,
		Test_string = 324,
		[".ctor_Vector3"] = 302,
		Test_object = 326,
		Test_string_string = 325,
		set_Item_double = 312,
		get_Item_char_int = 307,
		set_Item_int_int = 306,
		Test_object_string_int = 315,
		Test_double = 321,
		TestRefGameObject = 337,
		[".ctor_Vector3_string"] = 301,
		Test_int_int = 323,
		TestByteBuffer = 313,
		set_Number = 304,
		Test_bool = 318,
		["Test_string[]"] = 328,
		Test_Space = 331,
		Test_char = 316,
		TestNullable = 339,
		DoClick = 338,
		get_Item_string = 309
	},
	TestExport_SpaceWrap = {
		CheckType = 294,
		IntToEnum = 296,
		Push = 293,
		[".ctor"] = 291,
		Register = 292,
		get_World = 295
	},
	TestExportWrap = {
		_CreateTestExport = 261,
		get_Number = 283,
		Test = 268,
		[".ctor"] = 259,
		set_buffer = 287,
		set_OnClick = 285,
		TestRefGameObject = 276,
		set_field = 284,
		TestCheckParamNumber = 273,
		set_OnRefEvent = 286,
		TestChar = 269,
		TestExport_TestRefEvent = 290,
		get_Item = 265,
		set_Number = 288,
		get_OnClick = 280,
		_set_this = 263,
		set_Item = 266,
		Test33 = 270,
		TestGeneric = 271,
		Register = 260,
		get_buffer = 282,
		get_OnRefEvent = 281,
		TestEnum = 272,
		TestExport_TestBuffer = 289,
		TestNullable = 278,
		TestCheckParamString = 274,
		DoClick = 277,
		_get_this = 262,
		TestByteBuffer = 267,
		get_field = 279,
		TestReflection = 275,
		_this = 264
	},
	TestGameObject = {
		Update = 123,
		OnGUI = 126,
		OnApplicationQuit = 125,
		ShowTips = 124,
		Start = 122
	},
	TestInherit = {
		Start = 156,
		ShowTips = 157,
		OnDestroy = 158,
		OnGUI = 159
	},
	TestInjection = {
		OnApplicationQuit = 245,
		ShowTips = 247,
		Start = 244,
		OnGUI = 246
	},
	TestInstantiate = {
		Awake = 217,
		Start = 218
	},
	TestInstantiate2 = {
		Awake = 219
	},
	TestInt64 = {
		Start = 152,
		ShowTips = 153,
		OnDestroy = 154,
		OnGUI = 155
	},
	TestLuaStack = {
		TestMul0 = 233,
		ShowTips = 239,
		TestD1 = 240,
		Test4 = 223,
		OnSendMsg = 235,
		TestAddComponent = 231,
		TestMulStack = 234,
		TestArgError = 227,
		TestOutOfBound = 226,
		Test5 = 224,
		TestTableInCo = 228,
		TestNull = 230,
		Test3 = 222,
		PushLuaError = 221,
		Test1 = 220,
		Update = 237,
		TestCo = 243,
		TestCycle = 229,
		TestD2 = 241,
		TestMul1 = 232,
		OnGUI = 242,
		OnApplicationQuit = 238,
		Awake = 236,
		Test6 = 225
	},
	TestLuaThread = {
		Update = 29,
		OnGUI = 30,
		OnApplicationQuit = 27,
		ShowTips = 28,
		Start = 26
	},
	TestOutArg = {
		Update = 138,
		OnDestroy = 139,
		OnGUI = 137,
		OnApplicationQuit = 136,
		ShowTips = 135,
		Start = 134
	},
	TestOverload = {
		Awake = 340,
		Bind = 341
	},
	TestPerformance = {
		OnApplicationQuit = 215,
		ShowTips = 214,
		Start = 213,
		OnGUI = 216
	},
	TestProtoBuffer = {
		OnApplicationQuit = 147,
		OnLoadFinished = 144,
		CallMain = 143,
		OnGUI = 146,
		Bind = 142,
		InitLoader = 141,
		Awake = 140,
		ShowTips = 145
	},
	TestProtolWrap = {
		Register = 149,
		get_data = 150,
		set_data = 151,
		[".ctor"] = 148
	},
	TestReflection = {
		OnLoadFinished = 190,
		ShowTips = 191,
		CallMain = 188,
		OnGUI = 193,
		OnApplicationQuit = 192,
		InitLoader = 187,
		TestAction = 189
	},
	TestString = {
		OnLoadFinished = 183,
		ShowTips = 184,
		CallMain = 182,
		OnGUI = 186,
		OnApplicationQuit = 185,
		InitLoader = 181
	},
	TestUTF8 = {
		OnLoadFinished = 177,
		ShowTips = 178,
		CallMain = 176,
		OnGUI = 180,
		OnApplicationQuit = 179,
		InitLoader = 175
	},
	ToLuaInjectionTest = {
		["TestOverload_int_bool&"] = 256,
		[".ctor_bool"] = 251,
		[".ctor"] = 250,
		TestCoroutine = 258,
		TestOverload_int_bool = 255,
		Inject = 416,
		TestRef = 254,
		TestOverload_bool_int = 257,
		set_PropertyTest = 253,
		get_PropertyTest = 252
	},
	ToLuaInjectionTestWrap = {
		TestRef = 411,
		Register = 409,
		set_PropertyTest = 415,
		_CreateToLuaInjectionTest = 410,
		TestCoroutine = 413,
		TestOverload = 412,
		get_PropertyTest = 414
	},
	UseDictionary = {
		Awake = 84,
		OnGUI = 87,
		OnApplicationQuit = 85,
		ShowTips = 86,
		BindMap = 88
	},
	UseList = {
		OnLoadFinished = 196,
		ShowTips = 197,
		CallMain = 195,
		OnGUI = 199,
		OnApplicationQuit = 198,
		InitLoader = 194
	}
}
