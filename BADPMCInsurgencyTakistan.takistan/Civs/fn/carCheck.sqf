private["_car","_tooFar","_unit"];
_car=_this select 0;
_tooFar=false;
while{!(_tooFar)}do{
	_tooFar=true;
sleep 10;
	{_unit=_x;
	if((_car distance _unit) <= L_civs_maxDist)exitWith{_tooFar=false;};
sleep 0.002;}forEach allPlayers;};
deleteVehicle _car;