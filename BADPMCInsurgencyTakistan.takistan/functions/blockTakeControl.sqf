_vehicle = _this select 0;
_activeController = _this select 1;
_pastControler = _this select 2;
_SOAR = missionNamespace getVariable ["SOAR",[]];


if (_activeController !in _soar) then 
	{
		_activeController action ["SuspendVehicleControl", _vehicle];
	};