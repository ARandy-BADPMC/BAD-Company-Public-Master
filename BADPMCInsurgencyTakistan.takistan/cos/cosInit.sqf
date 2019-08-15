//By BangaBob v0.5 ~ Modified by Phronk
if(isNil "SERVER")then{Hint "You must ADD a object named SERVER";player sideChat "You must ADD a object named SERVER";}else{
if(isServer)then{
IF(!isNil("COScomplete"))then{Hint "Check your call. COS was called twice!";}else{
COS_distance=400;//Set spawn distance
_aerielActivation=false;//Set if flying units can activate civilian Zones

blackListTowns=["base_marker"];
whiteListMkrs=[];//Add Custom Markers for COS to populate
DefaultSide=Civilian;//Set side of units spawned
_showMarker=false;
showTownLabel=false;//Show town information when entering COS zones
debugCOS=false;

_civs=paramsArray select 3;
if(_civs==1)then{COSpedestrians=true;}else{COSpedestrians=false;};
COScars=false;
COSparked=true;

if(!isClass(configFile>>"cfgPatches">>"CUP_WheeledVehicles_Core"))then{
COScivPool=["C_man_1"];
COSmotPool=["C_Offroad_01_F","C_Offroad_01_repair_F","C_Offroad_02_unarmed_F","C_Hatchback_01_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Truck_02_fuel_F","C_Truck_02_covered_F","C_Truck_02_box_F","C_Truck_02_transport_F"];}else{
COScivPool=["C_man_1"];
COSmotPool=["CUP_C_Datsun_Tubeframe","CUP_C_Datsun","CUP_C_Datsun_Plain","CUP_C_Datsun_Covered","CUP_C_Datsun_4seat","CUP_C_Skoda_White_CIV","CUP_C_Skoda_Blue_CIV","CUP_C_Skoda_Red_CIV","CUP_C_Skoda_Green_CIV","CUP_C_UAZ_Unarmed_TK_CIV","CUP_C_LR_Transport_CTK","CUP_C_Ural_Civ_01","CUP_C_Ural_Open_Civ_01"];};
COSmaxGrps=13;//Set Maximum group limit for COS at any one time (If limit is hit then civilians will be placed into a single group for each town)

private["_sizeX","_sizeY","_name","_pos","_mSize","_rad","_civilians","_vehicles","_parked","_actCond"];
breakPatrol_FN=compile preProcessFileLineNumbers "cos\patrolFn.sqf";
COScomplete=false;publicVariable "COScomplete";publicVariable "COS_distance";populating_COS=false;
cosMkrArray=[];
server setVariable["cosGrpCount",0];//Set global group count
_rad=50;//Radius increase increment for finding minimum spawn points
_slack=2;//Additional spawn points
{
// Organise towns and markers
	if(_x in whiteListMkrs)then{
		_sizeX=getMarkerSize _x select 0;
		_sizeY=getMarkerSize _x select 1;
		_pos=markerPos _x;
		_name=markerText _x;//Get the markers description
		if(_name=="")then{_name=_x;};//If description is empty then use marker name
		deleteMarker _x;//Delete user placed marker
	}else{
	 _name=text _x;//Get name
	 _sizeX=getNumber(configFile>>"CfgWorlds">>worldName>>"Names">>(text _x)>>"radiusA");
	 _sizeY=getNumber(configFile>>"CfgWorlds">>worldName>>"Names">>(text _x)>>"radiusB");
	_pos=getPos _x;};
if(({_name==_x}count blackListTowns)>0 OR (_name==""))then{}else{
//Scan for houses around the town area
	if(_sizeX < 50)then{_sizeX=300;};
	if(_sizeY < 50)then{_sizeY=300;};
	if(_sizeY>_sizeX)then{_mSize=_sizeY}else{_mSize=_sizeX};//Get the largest size
	_houses=count(nearestObjects[_pos,["house"],_mSize]);//Count number of houses in town

// Customise population by number of houses
_randomisation=5;
	if(_houses <= 10)then{
	_civilians=2+ round(random _randomisation);
	_vehicles=0;
	_parked=0;};
 	if(_houses <= 30 and _houses > _randomisation)then{
	_civilians=3+ round(random _randomisation);
	_vehicles=0;
	_parked=2;};
	if(_houses <= 70 and _houses > 30)then{
	_civilians=5+ round(random _randomisation);
	_vehicles=1;
	_parked=2;};
	if(_houses <= 140 and _houses > 70)then{
	_civilians=6+ round(random _randomisation);
	_vehicles=1;
	_parked=2;};
	if(_houses > 140)then{
	_civilians=6+ round(random _randomisation);
	_vehicles=1;
	_parked=2;};
if(!COSpedestrians)then{_civilians=0;};
if(!COScars)then{_vehicles=0;};
if(!COSparked)then{_parked=0;};

//Create marker over town
	_markerID=format["COSmkrID%1",_name];
	_foo=createMarker[_markerID, _pos];
	_foo setMarkerSize[_sizeX, _sizeY];
	_foo setMarkerShape "ELLIPSE";
	_foo setMarkerBrush "SOLID";
	_foo setMarkerColor "ColorGreen";
	_foo setMarkerText _name;
	cosMkrArray set[count cosMkrArray,_foo];
if(!_showMarker)then{_foo setMarkerAlpha 0;}else{_foo setmarkerAlpha 0.5;};//Show or hide marker

//Get positions until we have enough for the population
 _roadlist=_pos nearRoads _mSize;
 _minPositions=(_civilians+_vehicles+_parked+_slack);
if(count _roadlist < _minPositions)then{
	while{count _roadlist < _minPositions}do{
	_rad=_rad+_rad;
	_roadlist=_pos nearRoads(_mSize+_rad);
sleep 0.1;};
};

//Sort a position for each civilian
_roadPosArray=[];
_roadPosArray resize _minPositions;
_roadlist=_roadlist call BIS_fnc_arrayShuffle;

for "_n" from 0 to _minPositions do{
_roadPosArray set[_n,_roadlist select _n];};

//Save all information
_information=[_civilians,_vehicles,_parked,_roadPosArray];
_popVar=format["population%1",_foo];
server setVariable[_popVar,_information];

//Create a trigger over town	
_trigger=createTrigger["EmptyDetector",_pos]; 
_trigger setTriggerArea[(COS_distance+_sizeX),(COS_distance+_sizeY),0,FALSE]; 
_trigger setTriggerActivation["ANY","PRESENT",true];
_trigger setTriggerTimeout[1,1,1,true];
if _aerielActivation then{//Set whether units above 50m high will trigger
_actCond="{vehicle _x in thisList && isPlayer _x}count allUnits > 0";
}else{
_actCond="{vehicle _x in thisList && isPlayer _x && ((getPosATL _x)select 2) < 50}count allUnits > 0";};
		_var=format["trig%1",_markerID];
		_trigAct=format["null=[%1]execVM ""cos\cosCore.sqf"";server setVariable[%2,true];",str _foo,str _var];
		_trigDe=format["server setVariable[%1,false];",str _var];
		_trigger setTriggerStatements[_actCond,_trigAct,_trigDe];};
}forEach(nearestLocations[getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition"),["NameCityCapital","NameCity","NameVillage","CityCenter"],25000]) +whiteListMkrs;

//All towns have been saved into cos Marker Array.
SERVER setVariable["COSmarkers",cosMkrArray,true];
COScomplete=true;publicVariable "COScomplete";
};

//LOCAL SCRIPTS
waitUntil{COScomplete};
_mkrs=SERVER getVariable "COSmarkers";//Use this to get all town markers
null=[]execVM "COS\localScript.sqf";};//This shows messages for players during multiplayer
};