_player = _this select 0;
_playerUid = _this select 1;
_admin = _this select 2;
_whitelist = _this select 3;
_tempArray = ["Attack","Transport","Armor"];

if (_admin) then 
	{
	_tempArray = [];
	}
	else
	{
		if (_playerUid in _whitelist) then 
			{ 
				_tempArray = _tempArray - "Attack";
			};

		switch (typeOf player) do { 
			case "rhsusf_socom_marsoc_cso_mechanic": 
				{
					_tempArray = _tempArray - "Armor";
				};
			case "rhsusf_army_ocp_helipilot" : 
				{ 
					_temparray = _tempArray - "Transport";
				}; 
		};
	};
_player setVariable ["vehiceRestrictions",_temparray,true];
if (typeOf _player == "rhsusf_airforce_jetpilot") then 
	{
		[_player] call CHAB_fnc_whitelist;
	}; 