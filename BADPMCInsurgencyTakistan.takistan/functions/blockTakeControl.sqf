_vehicle = _this select 0;
_activeController = _this select 1;
_pastControler = _this select 2;
_SOAR = missionNamespace getVariable ["SOAR",[]];
_playerType = typeOf _activeControler;

if ((_activeController !in _soar) && (_playerType != "rhsusf_army_ocp_helipilot" ) then 
	{
		_activeController action ["SuspendVehicleControl", _vehicle];
	};