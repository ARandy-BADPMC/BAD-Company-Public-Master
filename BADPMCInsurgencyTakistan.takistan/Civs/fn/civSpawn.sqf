private["_spawnPos","_type","_grp","_civ"];
_spawnPos=_this select 0;
_type=L_civs_civList call BIS_fnc_selectRandom;
_grp=createGroup civilian;
_civ=_grp createUnit[_type,_spawnPos,[],0,""];
_civ allowDamage false;_civ setBehaviour "safe";_civ setVariable["NOAI",1,false];_civ forceSpeed 8;_civ setSkill 0;clearItemCargoGlobal _civ;removeAllAssignedItems _civ;_civ disableAI "AIMINGERROR";_civ enableMimics false;_civ setSpeaker "NoVoice";[_civ]call InsU;[_civ]call InsF;

L_civs_currentCivs=L_civs_currentCivs+1;
[_civ]joinSilent grpNull;
deleteGroup _grp;
if(L_civs_debug==2)then{hintSilent format["Spawned a civilian \n Class: %1 \n Position: %2",_type,_spawnPos]};
_civ;