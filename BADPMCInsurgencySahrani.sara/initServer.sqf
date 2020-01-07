["Initialize"] call BIS_fnc_dynamicGroups;
call compileFinal preprocessfilelinenumbers "functions\heliskinapply.sqf";
call compileFinal preprocessfilelinenumbers "scripts\ArsenalWhitelist.sqf";

missionNamespace setVariable ["enemy_groups",[]];

missionNamespace setVariable ["MaxTanks",0,true];
missionNamespace setVariable ["MaxAttackHelis",0,true];
missionNamespace setVariable ["MaxTransHelis",0,true];
missionNamespace setVariable ["MaxAPC",0,true];
missionNamespace setVariable ["MaxStatic",0,true];
defence = [defence1,defence2,defence3];

_zeus_group = createGroup sideLogic;

missionNamespace setVariable ["Zeus_group",_zeus_group];

{
	_x allowDamage false;
	[_x, "LISTEN_BRIEFING", "Light"] call BIS_fnc_ambientAnim;
} forEach [officer_jeff,tank_spawner,heli_jeff]; 

globalWaterPos = [0,0,0]; //universal for all maps, has to be changed manually 