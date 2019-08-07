/*Script by Mphillips'Hazey' + Sacha Ligthert + Phronk
File Modified On: 12/1/2016

Special Thanks:
ArmA Tactical Combat Applications Group - Tactical Realism http://www.ATCAG.com
Tangodown - Tactical Gaming Community http://www.tangodown.nl/
Whiskey Company - Tactical Realism http://www.TheWhiskeyCo.com/
*/
private["_markers","_intelItems","_unit","_nearestPosition","_pos","_selectedItem","_laptop","_cacheBuildings","_cities","_multi","_intelcount","_targetBuilding","_intelPosition","_i","_m","_j"];
laptop=[];
publicVariable "laptop";
_intelItems=["CargoPlaftorm_01_brown_F"];
_cities=call SL_fn_urbanAreas;

_j=0;
{_j=_j+1;
_cityName=_x select 0;
_cityPos=_x select 1;
_cityRadA=_x select 2;
_cityRadB=_x select 3;
_cityType=_x select 4;
_cityAngle=_x select 5;
if(_cityRadB>_cityRadA)then{
_cityRadA=_cityRadB;};
_cacheBuildings=[_cityPos,_cityRadA]call SL_fn_findBuildings;
diag_log format["%4 Ciudad: %1,%2,%3",_cityName,_cityRadA,count _cacheBuildings,_j];

for "_i" from 1 to(paramsArray select 2)step 1 do{
//for "_i" from 0 to(random 1)step 1 do{
if(count _cacheBuildings > 0)then{
if(round(random 1)==1)then{
_selectedItem=_intelItems call BIS_fnc_selectRandom;
_targetBuilding=_cacheBuildings select(random((count _cacheBuildings)-1));
_intelPosition=[_targetBuilding]call SL_fn_RandomBuildingPosition;
_laptop=createVehicle[_selectedItem,_intelPosition,[],0,"None"];
[[_laptop,"<t color='#FF0000'>Gather INTEL</t>"],"addactionMP",true,true]spawn BIS_fnc_MP;
_laptop setPos _intelPosition;
laptop set[count laptop,_laptop];
publicVariable "laptop";

if(!isMultiplayer)then{
_m=createMarker[format["box%1",random 1000],getPosATL _laptop];
_m setMarkerShape "ICON"; 
_m setMarkerType "mil_dot";
_m setMarkerColor "ColorGreen";};
};};};}forEach _cities;