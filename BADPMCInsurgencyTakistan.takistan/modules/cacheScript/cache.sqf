/*Script by Mphillips'Hazey' + Sacha Ligthert + Phronk
Modified on: 12/1/2016

Special Thanks:
ArmA Tactical Combat Applications Group - Tactical Realism http://www.ATCAG.com
Tangodown - Tactical Gaming Community http://www.tangodown.nl/
Whiskey Company - Tactical Realism http://www.TheWhiskeyCo.com/
*/
if(isServer || isDedicated)then{
private["_markers","_x","_randomMarker","_dist","_pos","_m","_decrease","_wait","_cacheBuildings","_targetBuilding","_cachePosition","_string"];

INS_marker_array=[];
publicVariable "INS_marker_array";
INS_west_score=0;
publicVariable "INS_west_score";

INS_fncache={
if(typeName _this=="ARRAY")then{
cache=_this select 0;
cache spawn{sleep 2;deleteVehicle _this;};//[cache]spawn cacheDie;
_killer=_this select 1;
switch(side _killer)do{
case WEST:{
INS_west_score=INS_west_score+1;
publicVariable "INS_west_score";
_this call cacheKilled;};
case EAST:{
INS_west_score=INS_west_score+1;
publicVariable "INS_west_score";
_this call cacheKilled;};
case RESISTANCE:{
INS_west_score=INS_west_score+1;
publicVariable "INS_west_score";
_this call cacheKilled;};
case CIVILIAN:{
INS_west_score=INS_west_score+1;
publicVariable "INS_west_score";
_this call cacheKilled;};
default{
_this call cacheFake;};
};};
if(count INS_marker_array>0)then{
{deleteMarker _x}forEach INS_marker_array};
publicVariable "INS_marker_array";

_cities=call SL_fn_markersAreas;
_cacheTown=_cities call BIS_fnc_selectRandom;

copyToClipboard str _cities;

_cityPos=markerPos _cacheTown;
diag_log format["Placeholder: %1",_cityPos];
_cityRadA=markerSize _cacheTown select 0;
diag_log format["Size mkr A: %1",_cityRadA];
_cityRadB=markerSize _cacheTown select 1;
diag_log format["Size mkr B: %1",_cityRadB];
if(_cityRadB>_cityRadA)then{_cityRadA=_cityRadB;};
_cacheBuildings=[_cityPos,_cityRadA]call SL_fn_findBuildings;
while{count _cacheBuildings==0}do{
sleep 2;
diag_log format["Error mkr: %1",count _cacheBuildings];
_cities=call SL_fn_markersAreas;
_cacheTown=_cities call BIS_fnc_selectRandom;
_cityPos=markerPos _cacheTown;
_cityRadA=markerSize _cacheTown select 0;
_cityRadB=markerSize _cacheTown select 1;

if(_cityRadB>_cityRadA)then{_cityRadA=_cityRadB;};
_cacheBuildings=[_cityPos,_cityRadA]call SL_fn_findBuildings;};

//Pull the array and select a random building from it.
_targetBuilding=_cacheBuildings select(random((count _cacheBuildings)-1));
	
//Take the random building from the above result and pass it through gRBP function to get a single cache position
_cachePosition=[_targetBuilding]call SL_fn_RandomBuildingPosition;
sleep 1;
cache=createVehicle["rhs_weapon_crate",_cachePosition,[],0,"NONE"];cache setDamage 0;clearItemCargoGlobal cache;
cache addEventHandler["handleDamage",{if((_this select 4)=="SatchelCharge_Remote_Ammo")then{(_this select 0)setDamage 1;}else{(_this select 0)setDamage 0;};}];
cache addMPEventHandler["MPKilled",{_this spawn INS_fncache}];
cache setPos _cachePosition;cache setDamage 0;publicVariable "cache";
/*rw2=["Box_NATO_Ammo_F","Box_NATO_Equip_F","B_Slingload_01_Fuel_F","B_Slingload_01_Repair_F","B_Slingload_01_Medevac_F","B_Slingload_01_Cargo_F","B_Slingload_01_Ammo_F","B_LSV_01_armed_F"];
cacheTask={waitUntil{player distance cache<2.5};
[west,["ct"],["Cache has been discovered!  Destroy it with an EXPLOSIVE SATCHEL!","Destroy Cache"],objNull,true,0,true,"Destroy",true]call BIS_fnc_taskCreate;};
cacheDie={
["ct","SUCCEEDED",true]spawn BIS_fnc_taskSetState;
_rw=rw2 call BIS_fnc_selectRandom;_newRW=createVehicle[_rw,getMarkerPos "rwMkr",[],8,"CAN_COLLIDE"];_newRW setDir 331;};
[cache]spawn cacheTask;*/

if(INS_west_score==(paramsArray select 1))then{
end_title={titleText["!All caches have been destroyed!","PLAIN"];};
[nil,"end_title",nil,true]spawn BIS_fnc_MP;
sleep 20;
endMission "END1";};
if(!isMultiplayer)then{
sleep 2;
_m=createMarker[format["box%1",random 1000],getPosATL cache];
_m setMarkerShape "ICON"; 
_m setMarkerType "mil_dot";
_m setMarkerColor "ColorRed";
_m setMarkerAlpha 1;};};
true spawn INS_fncache;};