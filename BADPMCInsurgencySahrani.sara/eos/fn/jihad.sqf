_bomber=_this select 0;
_targetSide=_this select 1;
_explosiveClass=_this select 2;
private["_target","_runCode","_info"];
_info=[_bomber,_targetSide,_explosiveClass];
_runCode=1;
_bomber remoteExec["removeAllActions",0,true];_bomber setVariable["NOAI",1,false];
while{alive _bomber&&_runCode==1}do{
_nearUnits=nearestObjects[_bomber,["CAManBase"],150];
_nearUnits=_nearUnits-[_bomber];
{if(!(side _x in _targetSide))then{_nearUnits=_nearUnits-[_x];};}forEach _nearUnits;
if(count _nearUnits !=0)then{
_target=_nearUnits select(floor random count _nearUnits);
_pos=position _target;
_bomber doMove _pos;
while{_bomber distance _pos>75}do{
_pos=position _target;
_bomber doMove _pos;
sleep 3;};
if(_bomber distance _pos<75)then{
_pos=position _target;
_bomber enableFatigue false;_bomber enableStamina false;_bomber doMove _pos;_bomber setDamage 0;
_bomber SetUnitPos "UP";_bomber SetBehaviour "AWARE";_bomber SetSpeedMode "FULL";_bomber SetCombatMode "RED";
_bomber disableAI "SUPPRESSION";_bomber disableAI "FSM";_bomber disableAI "autoCombat";_bomber setAnimSpeedCoef 1;
removeVest _bomber;_bomber addVest "V_RebreatherB";
};

while{_bomber distance _pos>4}do{
_pos=position _target;
_bomber doMove _pos;
sleep 3;};
if(_bomber distance _pos<4)then{
_runCode=0;
[[_bomber,"shout"],"ia_say"]call BIS_fnc_MP;
sleep(1+random 2);
if(alive _bomber)then{
_explosive=_explosiveClass createVehicle(position _bomber);
_bomber removeAllEventHandlers "AnimChanged";_bomber setDamage 1;};};};
sleep 5;};