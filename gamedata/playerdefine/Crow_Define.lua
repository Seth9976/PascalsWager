-- chunkname: @f:/unity/pascalswager_steam1/assets/GameData/PlayerDefine/Crow_Define.lua

Crow_Define = {}
Crow_Define.ArriveDistance = 1.2
Crow_Define.AppearDistance = 1.2
Crow_Define.ReachDistance = 0.6
Crow_Define.OriMoveSpeed = 0.002
Crow_Define.OriRotSpeed = 0.002
Crow_Define.IdleRotThresholdAngle = 5
Crow_Define.RotThresholdAngle = 30
Crow_Define.StopThresholdAngle = 130
Crow_Define.CameraFrontDistance = 2.2
Crow_Define.MoveStateType = {
	Fly = 1,
	StartFlyLoop = 5,
	Idle = 2,
	StartFly = 3,
	StopFly = 4,
	None = 0
}
Crow_Define.StateType = {
	Disappear = 0,
	InMeeting = 4,
	TimeLine = 6,
	Animator = 7,
	Out = 1,
	Fixed = 5,
	ComeIn = 3,
	Move = 2
}
Crow_Define.AnimationName = {
	Move = "Move",
	FixedIdle = "Movie.movie_1",
	Idle = "Idle",
	Dialogue = "Dialogue.Idle",
	Carriage = "Carriage",
	Empty = "Empty"
}
Crow_Define.MeetingAnimatorType = {
	Common = 0,
	Carriage = 1
}

return Crow_Define
