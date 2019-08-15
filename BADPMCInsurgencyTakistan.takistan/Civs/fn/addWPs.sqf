/*Makes the AI drive around by adding fake "wayPoints" via doMove
Param0: Civilian/driver
Param1: Car*/
private["_civ","_car","_grp","_pos","_wp1","_wp2","_relDir","_blacklisted","_i","_o","_minDist"];
_civ=_this select 0;
_car=_this select 1;
_grp=group _civ;
_pos=getPos _civ;
_minDist=3000;
_blacklisted=true;
_i=1;
_o=1;
while{alive _civ}do{//Waypoint loop
	while{((_pos distance _civ)<_minDist) && _blacklisted && (alive _civ)}do{//Get a waypoint at least 3000m away
		sleep 0.0025;
		_pos=[_civ,5500]call CBA_fnc_randPos;
		if([_pos]call L_fn_civs_blCheck)exitWith{
		_pos=[_pos,200]call L_fn_civs_getRoadPos;
			if((str _pos) != "[0,0,0]")then{
				_blacklisted=false;
				if(L_civs_debug==3)then{hintSilent format["Final waypoint position: %1\n Waypoint Nr: %2.\n Final minDist: %3\nTries needed: %4",_pos,_i,_minDist,_o]};
			};
		};
		if(_minDist>=500)then{
		_minDist=_minDist-100;};
		_o=_o+1;
		_pos=getPos _civ;
		if(L_civs_debug==3)then{hintSilent format["MinDist: %1",_minDist]};
	};
_blacklisted=true;//Reset variables
_minDist=3000;
_o=1;
if(_i==1)then{//Sets the car's direction according to the waypoint, the check for "_i" only makes this appear once
_relDir=[_car,_pos]call BIS_fnc_relativeDirTo;
	if((_relDir<=280)&&(_relDir>=90))then{
	_car setDir((getDir _Car)+180);};
};
_i=_i+1;
while{((_civ distance _pos)>20)&&(alive _civ)}do{_civ doMove _pos;
sleep 15;};
};