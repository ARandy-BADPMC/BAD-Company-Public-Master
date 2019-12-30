SL_fn_urbanAreas={
private["_locations","_cityTypes","_randomLoc","_x","_i","_cities"];
_i=0;
_cities=[];
_locations=configFile>>"CfgWorlds">>worldName>>"Names";
//"FlatArea","FlatAreaCity","FlatAreaCitySmall","NameMarine","VegetationFir","Hill","StrongpointArea"
_cityTypes=["FlatArea","FlatAreaCity","FlatAreaCitySmall","Hill","NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage","StrongpointArea","VegetationFir"];
for "_x" from 0 to(count _locations-1)do{
_randomLoc=_locations select _x;

//Get city info
private["_cityName","_cityPos","_cityRadA","_cityRadB","_cityType","_cityAngle"];
_cityName=getText(_randomLoc>>"name");
_cityPos=getArray(_randomLoc>>"position");
_cityRadA=getNumber(_randomLoc>>"radiusA");
_cityRadB=getNumber(_randomLoc>>"radiusB");
_cityType=getText(_randomLoc>>"type");
_cityAngle=getNumber(_randomLoc>>"angle");

if(_cityType in _cityTypes)then{
_cities set[_i,[_cityName,_cityPos,_cityRadA,_cityRadB,_cityType,_cityAngle]];
_i=_i+1;};
};
_cities;};
SL_fn_markersAreas={
private["_markersTotal","_markers","_mkr"];
_markers=[];
_markersTotal=[];
_markersTotal=AllMapMarkers;
{_mkr=[_x,3]call KRON_StrLeft;
if(_mkr=="mkr")then{
_markers=_markers+[_x];};}forEach _markersTotal;
_markers;};
SL_fn_findBuildings={
private["_center","_radius","_buildings"];
_center=_this select 0;
_radius=_this select 1;
_cacheHouses=["Land_Tovarna1","Land_Tovarna2","Land_Ind_Workshop01_04","Land_Ind_Workshop01_03","Land_Ind_Workshop01_02","Land_Ind_Workshop01_01","Land_A_Office01","Land_Dum_istan3_hromada2","Land_Dum_istan3","Land_Dum_istan2","Land_A_BuildingWIP","Land_Panelak2_Grey","Land_Panelak2","Land_Panelak3","Land_Dum_olez_istan1_open2","Land_Dum_olez_istan1","Land_Dum_mesto2","Land_Hotel"];
_buildings=nearestObjects[_center,_cacheHouses,_radius];
_buildings;};
SL_fn_buildingPositions={
private["_cbpos"];
_house=_this select 0;
_cbpos=0;
for "_x" from 1 to 100 do{
if(format["%1",(_house buildingPos _x)] != "[0,0,0]")then{
_cbpos=_cbpos+1;};
};
_cbpos;};
SL_fn_RandomBuildingPosition={		
private["_building","_count","_position"];
_building=_this select 0;
_count=[_building]call SL_fn_buildingPositions;	
if(_count==0)then{
_position=getPos _building;}else{
_position=random _count;
_position=_building buildingPos _position;};
if((_position select 0)==0)then{
_position=getPos _building;};
_position};