-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerConfig/Hero90005_Config.lua

Hero90005_Config = SystemHelper.DeepCopy(require("GameData/PlayerConfig/AnimalBase_Config"))
Hero90005_Config.animatorLayerConfig.BaseLayer = 0
Hero90005_Config.animatorLayerConfig.UpperBody = -1
Hero90005_Config.hitTypeConvert[AnimalBase_Define.HitType.Up] = AnimalBase_Define.HitType.Heavy
Hero90005_Config.hitTypeConvert[AnimalBase_Define.HitType.Down] = AnimalBase_Define.HitType.Heavy
Hero90005_Config.hitTypeConvert[AnimalBase_Define.HitType.FrontFly] = AnimalBase_Define.HitType.Heavy
Hero90005_Config.hitTypeConvert[AnimalBase_Define.HitType.BackFly] = AnimalBase_Define.HitType.Heavy

return Hero90005_Config
