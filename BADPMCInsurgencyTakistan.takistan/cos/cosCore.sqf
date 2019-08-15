if(!isServer)exitWith{};
private["_groupCount","_localGrpCount","_grp","_rdCount","_n","_r","_tempUnit","_tempVeh"];
_mkr=(_this select 0);

//Get trigger status
_trigID=format["trig%1",_mkr];
_isActive=server getVariable _trigID;

// Get stored town variables
_popVar=format["population%1",_mkr];
_information=server getVariable _popVar;
_civilians=(_information select 0);
_vehicles=(_information select 1);
_parked=(_information select 2);
_roadPosArray=(_information select 3);

if(debugCOS)then{
COSGlobalSideChat=[_civilians,_vehicles,_parked, _mkr];publicVariable "COSGlobalSideChat";
player groupChat(format["Town:%4 .Civilians:%1 .Vehicles:%2 .Parked:%3",_civilians,_vehicles,_parked, _mkr]);//for singlePlayer
};

_showRoads=false;				
if(_showRoads)then{
	{_txt=format["roadMkr%1",_x];
	_debugMkr=createMarker[_txt,getPos _x];
	_debugMkr setMarkerShape "ICON";
	_debugMkr setMarkerType "hd_dot";
	}forEach _roadPosArray;
};

_glbGrps=server getVariable "cosGrpCount";
_townGrp=createGroup DefaultSide;
_localGrps=1;

waitUntil{!populating_COS};
populating_COS=true;
_glbGrps=server getVariable "cosGrpCount";


//SPAWN CIVILIANS NOW
_civilianArray=[];
_vehicleArray=[];
_PatrolVehArray=[];
_ParkedArray=[];

_roadPosArray=_roadPosArray call BIS_fnc_arrayShuffle;
_UnitList=COScivPool call BIS_fnc_arrayShuffle;
_vehList=COSmotPool call BIS_fnc_arrayShuffle;
_countVehPool=count _vehList;
_countPool=count _UnitList;
_v=0;
_n=0;
_rdCount=0;

//SPAWN PEDESTRIANS
for "_i" from 1 to _civilians do{
if(!(server getVariable _trigID))exitWith{_isActive=false;};
	if(_i >= _countPool)then{
		if(_n >= _countPool)then{_n=0;};
		_tempUnit=_UnitList select _n;
		_n=_n+1;};
		if(_i < _countPool)then{
		_tempUnit=_UnitList select _i;};

		_tempPos=_roadPosArray select _rdCount;
		_rdCount=_rdCount+1;

		if(COSmaxGrps < (_glbGrps+_localGrps+1))then{
		_grp=_townGrp;}else{
		_grp=createGroup DefaultSide;
		_localGrps=_localGrps+1;};

_unit=_grp createUnit[_tempUnit,_tempPos,[],0,"NONE"];	
_civilianArray set[count _civilianArray,_grp];
_unit hideObjectGlobal true;_unit disableAI "ANIM";_unit disableAI "FSM";_unit disableAI "MOVE";_unit disableAI "CHECKVISIBLE";_unit disableAI "SUPPRESSION";_unit disableAI "AIMINGERROR";_unit disableAI "TARGET";_unit disableAI "AUTOTARGET";_unit disableAI "AUTOCOMBAT";_unit setSpeaker "NoVoice";_unit disableConversation true;_unit enableMimics false;
null=[_unit]execVM "eos\fn\randOP4.sqf";if(random 1 < 0.15)then{null=[_unit,"",100,25,west,1,0.3]execVM "eos\fn\civRogue.sqf";};
if(debugCOS)then{
	_txt=format["INF%1,MKR%2",_i,_mkr];
	_debugMkr=createMarker[_txt,getPos _unit];
	_debugMkr setMarkerShape "ICON";
	_debugMkr setMarkerType "hd_dot";
	_debugMkr setMarkerText "Civ Spawn";};
};

//SPAWN VEHICLES
for "_i" from 1 to _vehicles do{
if(!(server getVariable _trigID))exitWith{_isActive=false;};
	if(_i >= _countVehPool)then{
		if(_v >= _countVehPool)then{_v=0;};
	_tempVeh=_vehList select _v;
	_v=_v+1;};
	if(_i < _countVehPool)then{
	_tempVeh=_vehList select _i;};
	if(_i >= _countPool)then{
		if(_n >= _countPool)then{_n=0;};
	_tempUnit=_UnitList select _n;
	_n=_n+1;};
	if(_i < _countPool)then{
	_tempUnit=_UnitList select _i;};

_tempPos=_roadPosArray select _rdCount;
_rdCount=_rdCount+1;
_roadConnectedTo=roadsConnectedTo _tempPos;
_connectedRoad=_roadConnectedTo select 0;
_direction=[_tempPos,_connectedRoad]call BIS_fnc_DirTo;

	if(COSmaxGrps < (_glbGrps+_localGrps+1))then{
	_grp=_townGrp;}else{
	_grp=createGroup DefaultSide;
	_localGrps=_localGrps+1;};

	_veh=createVehicle[_tempVeh,_tempPos,[],0,"NONE"];
	_unit=_grp createUnit[_tempUnit,getPos _veh,[],0,"CAN_COLLIDE"];clearItemCargoGlobal _veh;_veh setDir _direction;
	_unit assignAsDriver _veh;_unit moveInDriver _veh;
	_vehPack=[_veh,_unit,_grp];
	_PatrolVehArray set[count _PatrolVehArray,_grp];
	_vehicleArray set[count _vehicleArray,_vehPack];
IF(debugCOS)then{
_txt=format["veh%1,mkr%2",_i,_mkr];
_debugMkr=createMarker[_txt,getPos _unit];
_debugMkr setMarkerShape "ICON";
_debugMkr setMarkerType "hd_dot";
_debugMkr setMarkerText "VEH Spawn";};
};

//SPAWN PARKED VEHICLES
for "_i" from 1 to _parked do{
if(!(server getVariable _trigID))exitWith{_isActive=false;};
	if(_i >= _countVehPool)then{
		if(_v >= _countVehPool)then{_v=0;};
	_tempVeh=_vehList select _v;_v=_v+1;};
if(_i < _countVehPool)then{
_tempVeh=_vehList select _i;};
_tempPos=_roadPosArray select _rdCount;
_rdCount=_rdCount+1;
_roadConnectedTo=roadsConnectedTo _tempPos;
_connectedRoad=_roadConnectedTo select 0;
_direction=[_tempPos,_connectedRoad]call BIS_fnc_DirTo;
_veh=createVehicle[_tempVeh,_tempPos,[],0,"NONE"];_veh setDir _direction;clearItemCargoGlobal _veh;
_veh setPos[(getPos _veh select 0)-6,getPos _veh select 1,getPos _veh select 2];
_ParkedArray set[count _ParkedArray,_veh];

IF(debugCOS)then{
_txt=format["Park%1,mkr%2",_i,_mkr];
_debugMkr=createMarker[_txt,getPos _veh];
_debugMkr setMarkerShape "ICON";
_debugMkr setMarkerType "hd_dot";
_debugMkr setMarkerText "Park Spawn";};
};

//Apply Patrol script to all units
null=[_civilianArray,_PatrolVehArray,_roadPosArray]execVM "cos\CosPatrol.sqf";

if(debugCOS)then{player sideChat(format["Roads used:%1. Roads Stored %2",_rdCount,count _roadPosArray])};

//Count groups
_glbGrps=server getVariable "cosGrpCount";
_glbGrps=_glbGrps+_localGrps;
server setVariable["cosGrpCount",_glbGrps];
populating_COS=false;

//Show town label if town still active
if(showTownLabel and(server getVariable _trigID))then{
COSTownLabel=[(_civilians+_vehicles),_mkr];publicVariable "COSTownLabel";
_population=format["Population: %1",_civilians+_vehicles];
0=[markerText _mkr,_population]spawn BIS_fnc_infoText;//FOR USE IN SINGLEPLAYER
};

//Check every second until trigger is deactivated
while{_isActive}do{
_isActive=server getVariable _trigID;
if(!_isActive)exitWith{};
sleep 1;};

//If another town is populating wait until it has finished before deleting population
waitUntil{!populating_COS};

//Delete all pedestrians
_counter=0;
{_grp=_x;
_counter=_counter+1;
if(debugCOS)then{deleteMarker(format["INF%1,MKR%2",_counter,_mkr]);};
{deleteVehicle _x}forEach units _grp;
deleteGroup _grp;}forEach _civilianArray;

//Delete all vehicles and crew
_counter=0;
{_veh=_x select 0;
_unit=_x select 1;
_grp=_x select 2;
_counter=_counter+1;
if(debugCOS)then{deleteMarker(format["veh%1,mkr%2",_counter,_mkr]);};

// CHECK VEHICLE IS NOT TAKEN BY PLAYER
	if({isPlayer _veh}count(crew _veh)==0)then{
	{deleteVehicle _x}forEach(crew _veh);deleteVehicle _veh;};
	deleteVehicle _unit;deleteGroup _grp;}forEach _vehicleArray;

//Delete all parked vehicles
_counter=0;
{_counter=_counter+1;
if(debugCOS)then{deleteMarker(format["Park%1,mkr%2",_counter,_mkr]);};
// CHECK VEHICLE IS NOT TAKEN BY PLAYER
if({isPlayer _x}count(crew _x)==0)then{
deleteVehicle _x;};}forEach _ParkedArray;
deleteGroup _townGrp;

//Update global groups
_glbGrps=server getVariable "cosGrpCount";
_glbGrps=_glbGrps-_localGrps;
server setVariable["cosGrpCount",_glbGrps];