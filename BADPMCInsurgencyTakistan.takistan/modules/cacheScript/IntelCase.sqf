private["_intelItems","_case","_intelPosition","_unit"];
_intelItems="Land_Suitcase_F";
_unit=(_this select 0)select 0;
_intelPosition=[(getPos _unit select 0)+1,(getPos _unit select 1),getPosATL _unit select 2];
_case=createVehicle[_intelItems,_intelPosition,[],0,"None"];
[[_case,"<t color='#FF0000'>Gather INTEL</t>"],"addactionMP",true,true]spawn BIS_fnc_MP;
_case setPos _intelPosition;