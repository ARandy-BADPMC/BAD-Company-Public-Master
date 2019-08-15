if(isNil "server")then{hint "YOU MUST PLACE A GAME LOGIC NAMED SERVER!";};
eos_fn_spawnvehicle=compile preprocessFileLineNumbers "eos\fn\eos_SpawnVehicle.sqf";
eos_fn_grouphandlers=compile preprocessFileLineNumbers "eos\fn\setSkill.sqf";
eos_fn_findsafepos=compile preprocessFileLineNumbers "eos\fn\findSafePos.sqf";
eos_fn_spawngroup=compile preprocessFile "eos\fn\infantry_fn.sqf";
eos_fn_setcargo=compile preprocessFile "eos\fn\cargo_fn.sqf";
eos_fn_taskpatrol=compile preprocessFile "eos\fn\shk_patrol.sqf";
SHK_pos=compile preprocessFile "eos\fn\shk_pos.sqf";
shk_fn_fillhouse=compile preprocessFileLineNumbers "eos\fn\SHK_buildingpos.sqf";
eos_fn_getunitpool=compile preprocessFileLineNumbers "eos\UnitPools.sqf";
call compile preprocessFileLineNumbers "eos\AI_Skill.sqf";
EOS_Deactivate={
private["_mkr"];
_mkr=(_this select 0);
{_x setMarkerColor "colorBlack";_x setMarkerAlpha 0;}forEach _mkr;};
EOS_debug={
private["_note"];
_mkr=(_this select 0);
_n=(_this select 1);
_note=(_this select 2);
_pos=(_this select 3);
_mkrID=format["%3:%1,%2",_mkr,_n,_note];
deleteMarker _mkrID;
_debugMkr=createMarker[_mkrID,_pos];
_mkrID setMarkerType "Mil_dot";_mkrID setMarkerColor "colorBlue";_mkrID setMarkerText _mkrID;_mkrID setMarkerAlpha 0.5;};