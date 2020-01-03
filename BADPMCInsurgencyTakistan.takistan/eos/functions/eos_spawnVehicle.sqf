_position=(_this select 0);
_side=(_this select 1);
_faction=(_this select 2);
_type=(_this select 3);
_special = if (count _this > 4) then {_this select 4} else {"CAN_COLLIDE"};

_vehicleType=[_faction,_type] call eos_fnc_getunitpool;
_pool=[_faction,0] call eos_fnc_getunitpool;
_vests = ["rhs_6b23_digi_6sh92_radio","rhs_6b23_digi_rifleman","rhs_6b23_digi_6sh92","rhs_6b23_digi_rifleman","rhs_6b23_digi_rifleman","rhs_6b23_digi","rhs_6b23_digi","rhs_6b23_digi_6sh92","rhs_6b23_digi_medic","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92_vog","rhs_6sh92_digi","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92","rhs_6b23_digi_sniper","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92_headset_mapcase","rhs_6b23_digi_6sh92_vog_headset"];
	_grp = createGroup _side;

	_vehPositions=[(_vehicleType select 0)] call BIS_fnc_vehicleRoles;
	_vehicle = createVehicle [(_vehicleType select 0), _position, [], 0, _special];

_vehCrew=[];

		{
	_currentPosition=_x;
	
			_unitType=_pool select (floor(random(count _pool)));
			_unit = _grp createUnit [_unitType, _position, [], 0, "CAN_COLLIDE"];  
			If (vest _unit in _vests) then {_vestitems = vestitems _unit; _unit addvest "V_TacVest_oli"; {(vestContainer _unit) addItemCargo [_x,1];} foreach _vestitems;};					

			_unit moveInAny _vehicle;
			_vehCrew set [count _vehCrew,_unit];

	}foreach _vehPositions;
	
_return=[_vehicle,_vehCrew,_grp];

_return