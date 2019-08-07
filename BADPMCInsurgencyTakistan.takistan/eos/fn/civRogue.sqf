//By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
//Modified by: Phronk
// Script is only run serverSide
if !(isServer)exitWith{};
private ["_count","_done","_check","_listclose","_listclosealive","_sleep","_ran","_flee","_skillSet","_superclasses",
"_unit","_units","_unitloc","_weaponarr","_weapon","_weaponmag","_target1","_target2","_trg","_trgsize","_debug","_chance",
"_grp","_target","_target_type","_victim","_perfomancesleep","_game","_handle"];

// LOCAL VARIABLES - MODIFYABLE
_weaponarr=["hgun_Pistol_01_F","hgun_PDW2000_F"];
if(isClass(configFile>>"cfgPatches">>"CUP_BaseConfigs"))then{
_weaponarr=["CUP_hgun_SA61","CUP_8Rnd_9x18_Makarov_M","CUP_hgun_MicroUzi","CUP_8Rnd_9x18_Makarov_M"];};

_flee=0.5;

//How long the civilian waits in seconds between being triggered and pulling a gun (default: 1 - 8 seconds)
_sleep=1+(round random 7);

_skillSet=[
0.25,// aimingAccuracy
1,// aimingShake
0.7,// aimingSpeed
1,// endurance
0.4,// spotDistance
0.4,// spotTime
1,// courage
1,// reloadSpeed
1,// commanding
1// general
];

_debug=false;

//How often the loop checking for nearby target is performed in seconds. Only increase this in mission with tons of civilians or when you notice serverlag.
_perfomancesleep=5;

//The superClasses the civilians check for in their vicinity. Has to be an array! By default Infantry and unarmored vehicles
_superclasses=["CAManBase","Car"];

//Declaring default variables
_chance=25+round random 25;
_trgsize=10;
_target2=1;
_skill=0.2+random 0.2;

//LOCAL VARIABLES - scriptSide
//parsed variables
_unit=_this select 0;
_weapon=_this select 1;
_chance=_this select 2;
_trgsize=_this select 3;
_target1=_this select 4;//the legit target class (can be a side or a unit name)
if(count _this>5)then{_target2=_this select 5;};//the number of valid targets that have to be in the area
if(count _this>6)then{_skill=_this select 6};

//DEBUG
if(_debug)then{
player globalChat format["civRogue.sqf DEBUG: _unit:%1,_target1:%2,target2:%3,_weapon:%4,chance:%5,_radius:%6,_skill: %7",_unit,_target1,_target2,_weapon,_chance,_trgsize, _skill];
};

//LOCAL VARIABLES - helpers
//declaring variables we need later
if(isNil "civRogue_firstrun")then{civRogue_firstrun=true;};
if(isNil "civRogue_array")then{civRogue_array=[];};
_unitloc=[];
_listclose=[];
_listclosealive=[];
_weaponmag="";
_target="";
_target_side=civilian;
_target_type=false;
_done=false;
_grp=grpNull;
_victim=objNull;
_check=false;
if(typeName _unit=="BOOL")then{_check=_unit};

//INITIAL CHECKS
//If _check is set to (true) the script will launch itself again with the given variables.
//It will run on all civilians that haven't yet been turned into sleepers
_civarray=[];
if(_check)exitWith{
	{if(((side _x)==civilian) && !(isPlayer _x))then{_civarray=_civarray+[_x]}}forEach allUnits;
	{[_x,_weapon,_chance,_trgsize,_target1,_target2,_skill]execVM "eos\fn\civRogue.sqf";}forEach _civarray;

	//DEBUG
	if(_debug)then{player globalChat format["civRogue.sqf DEBUG: _check is %1, script will be run on _civarray:%2",_check,_civarray];};
};

//If the unit has already been touched by the script there's no need to execute the script again
_handle=_unit getVariable["civRogue",false];
if(_handle)exitWith{
	if(_debug)then{player globalChat format["civRogue.sqf DEBUG: _unit:%1 has civRogue handle:%2, exiting",_unit,_handle];};
};
//If the civ fails the chance check there's no need to run anything else; We set the flag to make sure he's not affected again
if(!(_check) && (((round(random 100))>_chance)||(_unit isKindOf "Woman")||(_unit isKindOf "Woman_EP1")))exitWith{
_unit setSkill 0;_unit allowFleeing 1;{_unit disableAI _x}forEach["AUTOTARGET","TARGET","FSM"];
_unit setVariable["civRogue",true];
if(_debug)then{player globalChat format["civRogue.sqf DEBUG: exiting because random is under %1 or is woman",_chance];};
};

//If unit is dead, just exit
if(!alive _unit)exitWith{};

//After passing all checks we flag the unit to make sure the script doesn't run on it again.
_unit setVariable["civRogue",true];

//DEBUG
if(_debug)then{player globalChat format["civRogue.sqf DEBUG: civRogue_array:%1",civRogue_array];};

//Set up sleeper
_unit allowFleeing _flee;
{
_skillvalue=(_skillset select _forEachIndex)+(random _skill)-(random _skill);
_unit setSkill[_x,_skillvalue];
}forEach['aimingAccuracy','aimingShake','aimingSpeed','endurance','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];
//[_unit]joinSilent grpNull;
//{_unit disableAI _x}forEach["Target","AUTOTARGET","FSM"];

//Weapon selection, Random if set to "ran"
if(_weapon=="")then{
_ran=(floor(random(count _weaponarr)));
_weapon=_weaponarr select _ran;};
_weaponmag=(getArray(configFile>>"CfgWeapons">>_weapon>>"magazines"))select 0;

//On the first run we create centers for each possible group, just to be safe
if(civRogue_firstrun)then{
_HQWest=createCenter west;
_HQEast=createCenter east;
_HQResistance=createCenter east;
civRogue_firstrun=false;};

//GROUP CREATION
//Checking whether a side or an objectName was parsed
switch(typeName _target1)do{
	case "SIDE":{_target_side=_target1;};
	case "OBJECT":{_target_side=side _target1;};
	default{player globalChat "civRogue DBG: ERROR:  wrong type of _target1 (must be side or name of unit).";};
};

//creating a group hostile to the target.
switch(_target_side)do{
	case west:{_grp=createGroup east;};
	case east:{_grp=createGroup west;};
	case resistance:{if((west getFriend resistance)>0.5)then{_grp=createGroup east;}else{_grp=createGroup west;}; };
	case civilian:{if((west getFriend civilian)>0.5)then{_grp=createGroup east;}else{_grp=createGroup west;};};
	default{"civRogue DBG: ERROR: _target1 is side but not a valid one"};};

//DEBUG
if(_debug)then{
player globalChat format["civRogue.sqf DEBUG: _unit:%1,_target1:%2,_target2:%3,_targettype:%4,_weapon:%5,_weaponmag:%6,_target_side:%7",_unit,_target1,_target2,_target_type,_weapon,_weaponmag,_target_side];

	_string=format["civ_%1",_unit];
	player sideChat _string;
	_mkr=createMarker[_string,(getPos _unit)];
    _mkr setMarkerType "mil_dot";
    _mkr setMarkerColor "ColorBlue";
    _mkr setMarkerText _string;

	[_unit,_mkr]spawn{
	while{alive(_this select 0)}do{
sleep 5;
	(_this select 1)setMarkerPos(getPos(_this select 0));};
	};
};
//Wait until 5 seconds in the mission before beginning the loop
waitUntil{time>10};

//LOOPING
//The magical (and ugly) double loop where it all happens
//Outer loop just waits for the unit to die
//Inner loop waits for the unit to acquire and engage a target(_done=true)
//_unit removeEventHandler(player getVariable "civDie");
//_unit addMPEventHandler["Killed",{(_this select 1)addRating 2000;(_this select 0)removeAllEventHandlers "Killed";}];
while{alive _unit}do{
	while{!(_done)&&(alive _unit)}do{
	//Every _perfomancesleep we update the position of the sleeper (_unitloc)
	//to create an array of all nearby infantry units (_listclose) and all alive infantry units of the target side (_listclosealive)
	_unitloc=getPos _unit;
	_listclose=(nearestObjects[_unitloc,_superclasses,_trgsize])-[_unit];
	_listclosealive=[];
	{if(((side _x==_target_side)&&alive _x))then{_listclosealive set[(count _listclosealive),_x];};}forEach _listclose;
		//DEBUG
		if(_debug)then{
		_string=format["civRogue.sqf DEBUG: Outer Loop. _listclos: %1",_listclose];
		player globalChat _string;};
		//This checks a) if there are enough targets in _listclosealive and b) whether _target1 is close (if _target1 is a side it just checks out)
		if(((count _listclosealive)>=_target2)&&((_target1 in _listclosealive)||(typeName _target1=="SIDE")))then{

			//DEBUG
			if(_debug)then{
			_string=format["civRogue.sqf DEBUG: Civ targeting _listclosealive: %2,sleeping %3",_target1,_listclosealive,_sleep];
			player globalChat _string;};
			doStop _unit;
			[_unit]joinSilent grpNull;
			_unit remoteExec["removeAllActions",0,true];_unit allowFleeing 0;
			sleep _sleep;
			[_unit]joinSilent _grp;
			_unit setCombatMode "RED";_unit setBehaviour "AWARE";
			if(_unit knowsAbout _victim<2)then{_unit reveal[_victim,2.5]};
			_unit lookAt _victim;
			sleep 1;
			{_unit addMagazine _weaponmag;}forEach[1,2,3,4];
			_unit addWeapon _weapon;_unit selectWeapon _weapon;_unit setSkill _skill;
				if(typeName _target1=="OBJECT")then{_victim=_target1;}else{
				_victim=(_listclosealive select(floor(random(count _listclosealive))));};

			while{alive _victim && alive _unit}do{
			doStop _unit;_unit doTarget _victim;_unit doFire _victim;sleep 0.5;};
			_done=true;
			//DEBUG
			if(_debug)then{
			_string=format["civRogue.sqf DEBUG: Civ engaging _target1:%1 or %2 in _listclosealive: %3,sleeping %4 seconds",_target1,(_listclosealive select(floor(random(count _listclosealive)))),_listclosealive,_sleep];
			player globalChat _string;};
		};
	sleep _perfomancesleep;
	};
sleep(_perfomancesleep*3);
};
//Clean up. After the sleeper has been killed we delete his group
deleteGroup _grp;