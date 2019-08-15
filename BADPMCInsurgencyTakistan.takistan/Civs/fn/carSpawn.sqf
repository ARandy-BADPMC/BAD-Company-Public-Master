private["_spawnPos","_roadList","_connects","_connected","_type","_dir"];
_spawnPos=_this select 0;
_type=L_civs_carList call BIS_fnc_selectRandom;
_car=_type createVehicle _spawnPos;
_roadList=_spawnPos nearRoads 10;
_dir=(getDir _car);
if(count _roadlist>=3)then{
_connects=roadsConnectedTo(_roadList select 0);
_connected=_connects select 0;
_dir=[(_roadList select 0),_connected]call BIS_fnc_DirTo;};
_car setDir _dir;_car allowCrewInImmobile true;clearItemCargoGlobal _car;_car lock 3;
if(L_civs_debug==2)then{hintSilent format["Spawned a car \n Class: %1 \n Position: %2",_type,_spawnPos]};
_car;