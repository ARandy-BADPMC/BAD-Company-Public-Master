/*Script by Mphillips'Hazey' + Sacha Ligthert + Phronk
File Modified on: 12/1/2016

Special Thanks:
ArmA Tactical Combat Applications Group - Tactical Realism http://www.ATCAG.com
Tangodown - Tactical Gaming Community http://www.tangodown.nl/
Whiskey Company - Tactical Realism http://www.TheWhiskeyCo.com/
*/
iMkrs=[];
killedText={
_cachesNum=paramsArray select 1;
hint parseText format["<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>INSURGENCY</t></t>
<img color='#ffffff' image='core\modules\cacheScript\Images\img_line_ca.paa' align='left' size='0.79' />
<t color='#eaeaea'>%1/%2</t><t color='#80FF00'>Weapons Cache</t><t color='#eaeaea'> has been destroyed!</t>
<img color='#ffffff' image='core\modules\cacheScript\Images\img_line_ca.paa' align='left' size='0.79' />",INS_west_score,_cachesNum]};
pickedUpIntel={
hint parseText format["<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>INSURGENCY</t></t>
<img color='#ffffff' image='core\modules\cacheScript\Images\img_line_ca.paa' align='left' size='0.79' />
<t color='#eaeaea'>New intel acquired.  Check map for clue markers within the vicinity of a cache.</t>
<img color='#ffffff' image='core\modules\cacheScript\Images\img_line_ca.paa' align='left' size='0.79' />"]};
cacheKilled={
{deleteMarker _x}forEach iMkrs;
private["_pos","_x"];
_pos=getPos cache;
_x=0;
while{_x<=20}do{
"M_Mo_82mm_AT_LG" createVehicle _pos;
_x=_x+1+random 4;
sleep 1;};
[nil,"killedText",nil,false]spawn BIS_fnc_MP;};
cacheFake={
private["_pos","_x"];
_pos=getPos cache;
_x=0;
while{_x<=20}do{
"M_Mo_82mm_AT_LG" createVehicle _pos;
_x=_x+1+random 4;
sleep 1;};};
intelPickup={
private["_intelItems","_intel","_used","_ID","_cases","_case","_cache"];
_intelItems=["Land_Laptop_unfolded_F","SatPhone","Land_Suitcase_F","EvMoscow","EvMap","Land_PortableLongRangeRadio_F","Land_MobilePhone_old_F","Land_HandyCam_F"];
_intel=_this select 0;
_used=_this select 1;
_ID=_this select 2;
_intel removeAction _ID;
_cases=nearestObjects[getPos player,_intelItems,3];
if(count _cases==0)exitWith{};
_case=_cases select 0;
if isNull _case exitWith{};
deleteVehicle _case;player groupChat "I have obtained Taliban intel.";call createIntel;call pickedUpIntel;
_cache=cache;
if(isNil "_cache")exitWith{
hint "Intel suggests this place is clean.  Better check elsewhere.";};
[nil,"pickedUpIntel",true,false]spawn BIS_fnc_MP;
[_cache,"createIntel",false,false]spawn BIS_fnc_MP;};
createIntel={
private["_i","_sign","_randX","_sign2","_randY","_radius","_cache","_pos","_range","_intelRadius"];//"_imkr"
_cache=cache;
_intelRadius=1500;
_i=0;
while{(getMarkerPos format["%1intel%2",_cache,_i]select 0)!=0}do{_i=_i+1;};
_sign=1;
if(random 100>50)then{_sign=-1;};
_sign2=1;
if(random 100>50)then{_sign2=-1;};
_radius=_intelRadius-_i*(random 50);
if(_radius<50)then{_radius=50;};
_randX=(random _radius);
_randY=(random _radius);
_pos=[(getPosATL _cache select 0)+_sign*_randX,(getPosATL _cache select 1)+_sign2*_randY];
_imkr=createMarker[format["%1intel%2",_cache,_i],_pos];
_imkr setMarkerType "hd_unknown";
_range=round sqrt(_randX^2+_randY^2);
_range=_range-(_range%50);
_imkr setMarkerText format["%1 m",_range];
_imkr setMarkerColor "ColorRed";
_imkr setMarkerSize[0.5,0.5];
iMkrs set[(count iMkrs),_imkr];};
addactionMP={
private["_object","_screenMsg"];
_object=_this select 0;
_screenMsg=_this select 1;
if(isNull _object)exitWith{};
_object addAction[_screenMsg,"call intelPickup"];};