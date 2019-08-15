private["_pos","_canSpawn","_unit"];
_pos=_this select 0;
_canSpawn=true;
if((str _pos)=="[0,0,0]")then{_canSpawn=false;}else{
	{_unit=_x;
	if(L_civs_debug==2)then{hintSilent format["Checks the distance from %1 to %2",_unit,_pos]};
	if((_pos distance _unit)<=L_civs_mindDist)exitWith{_canSpawn=false;};
sleep 0.002;}forEach allPlayers;};
_canSpawn;