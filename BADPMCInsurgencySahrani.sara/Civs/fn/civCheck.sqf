private ["_civ","_car","_tooFar","_unit","_pos","_spawnTime","_grp"];
_civ=_this select 0;
_car=_this select 1;
_pos=(getPosATL _car);
_tooFar=false;
_spawnTime=time;
_grp=(group _civ);
while{!(_tooFar)}do{_tooFar=true;sleep 7;
	{_unit=_x;if((_civ distance _unit) <= L_civs_maxDist)exitWith{_tooFar=false;};
sleep 0.002;}forEach allPlayers;
	if(((_car distance _pos) < 1.5) || !(alive _car))exitWith{_tooFar=true};//Delete if car is standing still at spawn position
	if((time - _spawnTime) <= 15)then{
		if((_pos distance _car) <= 2)exitWith{_tooFar=true};};
_pos=(getPosATL _car);};
// {if (alive _x) then {deleteVehicle _x}} forEach [_civ, _car];
if((_car distance _civ) <= 20)then{	// Delete the car if it's close to the civilian (and therefore far away from any player, too...)
deleteVehicle _car;}else{
[_car]spawn L_fn_civs_carCheck;};//... and run a separate routine on the car if it's not close to the civilian
if(alive _civ)then{deleteVehicle _civ};
L_civs_currentCivs=L_civs_currentCivs - 1;
deleteGroup _grp;