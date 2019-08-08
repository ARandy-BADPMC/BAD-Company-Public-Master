/*The main routine for spawning the civilians
Param0: Max. civilians
Param1: Min. spawndistance
Param2: Max. distance to players*/
waitUntil{time>15};//Initial waiting
if(isNil "L_civs_debug")then{L_civs_debug=0};

L_civs_maxCivs=_this select 0;
L_civs_mindDist=_this select 1;
L_civs_maxDist=_this select 2;
L_civs_currentCivs=0;
L_civs_allInBL=false;
[]spawn L_fn_civs_trackPlayers;
private["_spawnPos","_type","_civ","_civ2","_car","_sleepTime"];
_sleepTime=1;

for "_i" from 0 to 1 step 0 do{//Infinite Loop
	waitUntil{sleep 2;L_civs_currentCivs < L_civs_maxCivs};
	while{L_civs_currentCivs < L_civs_maxCivs}do{
		_sleepTime=1;
		_spawnPos=[(getPosATL(allPlayers call BIS_fnc_selectRandom)),(L_civs_mindDist + (random(L_civs_maxDist - L_civs_mindDist)))]call L_fn_civs_randPos;
		_spawnPos=[_spawnPos,250]call L_fn_civs_getRoadPos;
		if([_spawnPos]call L_fn_civs_distCheck)then{
			if([_spawnPos]call L_fn_civs_blCheck)then{
				_civ=[_spawnPos]call L_fn_civs_civSpawn;
				_car=[_spawnPos]call L_fn_civs_carSpawn;
				_civ moveInDriver _car;
				_civ allowDamage true;
				[_civ]call InsH;[_civ]call InsG;
				[_civ,_car]spawn L_fn_civs_addWPs;
				[_civ,_car]spawn L_fn_civs_civCheck;};
		};
		if(L_civs_allInBL)then{_sleepTime=7;};
sleep _sleepTime;
		if(L_civs_debug >= 1 && L_civs_debug != 3)then{hintSilent format["All players in blacklist: %1 \n sleepTime: %2 \n Current Civs: %3",L_civs_allInBL,_sleepTime,L_civs_currentCivs]};
	};
};