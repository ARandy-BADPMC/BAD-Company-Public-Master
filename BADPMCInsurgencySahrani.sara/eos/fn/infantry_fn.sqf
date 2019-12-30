if(!isServer)exitWith{};
private["_grp","_unit","_pool","_pos","_faction"];
_pos=(_this select 0);
_grpSize=(_this select 1);
_faction=(_this select 2);
_side=(_this select 3);
_grpMin=_grpSize select 0;
_grpMax=_grpSize select 1;
_d=_grpMax-_grpMin;
_r=floor(random _d);
_grpSize=_r+_grpMin;

if(surfaceIsWater _pos)then{_pool=[_faction,1]call eos_fn_getUnitPool;}else{_pool=[_faction,0]call eos_fn_getUnitPool;};
_grp=createGroup _side;
for "_x" from 1 to _grpSize do{
_unitType=_pool select(floor(random(count _pool)));
_unit=_grp createUnit[_unitType,_pos,[],6,"FORM"];
_unit enableSimulationGlobal false;_unit hideObjectGlobal true;_unit disableAI "ALL";_unit setSpeaker "NoVoice";_unit disableConversation true;_unit enableMimics false;_unit enableStamina false;};
_grp