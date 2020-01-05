
_type = typeOf _this;

x_reload_time_factor = 1; 

_this setVehicleAmmo 1;
_this engineOn false;
_this setFuel 0;

_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

if (count _magazines > 0) then {
	_removed = [];
	{
		if (!(_x in _removed)) then {
			_this removeMagazines _x;
			_removed = _removed + [_x];
		};
	} forEach _magazines;
	{
		sleep x_reload_time_factor;
		_this addMagazine _x;
	} forEach _magazines;
};

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

if (_count > 0) then {
	for "_i" from 0 to (_count - 1) do {
		scopeName "xx_reload2_xx";
		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
		_magazines = getArray(_config >> "magazines");
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_this removeMagazines _x;
				_removed = _removed + [_x];
			};
		} forEach _magazines;
		{
			sleep x_reload_time_factor;
			_this addMagazine _x;
			sleep x_reload_time_factor;
		} forEach _magazines;
		_count_other = count (_config >> "Turrets");
		if (_count_other > 0) then {
			for "_i" from 0 to (_count_other - 1) do {
				_config2 = (_config >> "Turrets") select _i;
				_magazines = getArray(_config2 >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_this removeMagazines _x;
						_removed = _removed + [_x];
					};
				} forEach _magazines;
				{
					sleep x_reload_time_factor;
					_this addMagazine _x;
					sleep x_reload_time_factor;
				} forEach _magazines;
			};
		};
	};
};
_this setVehicleAmmo 1;	// Reload turrets / drivers magazine

sleep x_reload_time_factor;
_this setDamage 0;
sleep x_reload_time_factor;
_this setFuel 1;
sleep x_reload_time_factor;
if (true) exitWith {};
