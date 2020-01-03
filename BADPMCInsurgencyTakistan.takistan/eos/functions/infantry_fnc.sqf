if (!isServer) exitWith {};
// SINGLE INFANTRY GROUP
private ["_grp","_unit","_pool","_pos","_faction"];

_pos=(_this select 0);
_grpSize=(_this select 1);
_faction=(_this select 2);
_side=(_this select 3);

_grpMin=_grpSize select 0;
_grpMax=_grpSize select 1;
_d=_grpMax-_grpMin;				
_r=floor(random _d);							
_grpSize=_r+_grpMin;
				
	if (surfaceiswater _pos) then {_pool=[_faction,1] call eos_fnc_getunitpool;}else{_pool=[_faction,0] call eos_fnc_getunitpool;};
	
	_grp=createGroup _side;
			
for "_x" from 1 to _grpSize do {					
		_unitType=_pool select (floor(random(count _pool)));
		_unit = _grp createUnit [_unitType, _pos, [], 6, "FORM"];  
		
		//swapping OP RHS vests with vanilla ones
		_vests = ["rhs_6b23_digi_6sh92_radio","rhs_6b23_digi_rifleman","rhs_6b23_digi_6sh92","rhs_6b23_digi_rifleman","rhs_6b23_digi_rifleman","rhs_6b23_digi","rhs_6b23_digi","rhs_6b23_digi_6sh92","rhs_6b23_digi_medic","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92_vog","rhs_6sh92_digi","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92","rhs_6b23_digi_sniper","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92_headset_mapcase","rhs_6b23_digi_6sh92_vog_headset"];
		If (vest _unit in _vests) then {_vestitems = vestitems _unit; _unit addvest "V_TacVest_oli"; {(vestContainer _unit) addItemCargo [_x,1];} foreach _vestitems;};
	};


_grp