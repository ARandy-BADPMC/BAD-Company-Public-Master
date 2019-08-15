if(!isServer)exitWith{};
_position=(_this select 0);
_side=(_this select 1);
_faction=(_this select 2);
_type=(_this select 3);
_special=if(count _this>4)then{_this select 4}else{"CAN_COLLIDE"};
_vehicleType=[_faction,_type]call eos_fn_getUnitPool;
_grp=createGroup _side;
_vehPositions=[(_vehicleType select 0)]call BIS_fnc_vehicleRoles;
_vehicle=createVehicle[(_vehicleType select 0),_position,[],0,_special];
clearItemCargoGlobal _vehicle;clearBackpackCargoGlobal _vehicle;_vehicle disableTIEquipment true;_vehicle disableNVGEquipment true;_vehicle lock 3;_vehicle setCollisionLight false;_vehicle setPilotLight true;
if(_vehicle isKindOf "O_G_Offroad_01_armed_F")then{_vehicle setObjectTextureGlobal[0,"A3\soft_f\Offroad_01\Data\offroad_01_ext_base02_co.paa"];};
if(_vehicle isKindOf "O_G_Offroad_01_F")then{_vehicle setObjectTextureGlobal[0,"A3\soft_f\Offroad_01\Data\offroad_01_ext_base02_co.paa"];};
if(_vehicle isKindOf "O_G_Offroad_01_repair_F")then{_vehicle setObjectTextureGlobal[0,"A3\soft_f\Offroad_01\Data\offroad_01_ext_base02_co.paa"];};
_vehCrew=[];
{_currentPosition=_x;
if(_currentPosition select 0=="driver")then{
_unit=_grp createUnit[(_vehicleType select 1),_position,[],0,"CAN_COLLIDE"];					
_unit assignAsDriver _vehicle;
_unit moveInDriver _vehicle;
_vehCrew set[count _vehCrew,_unit];
_unit enableSimulationGlobal false;_unit hideObjectGlobal true;_unit disableAI "ALL";_unit setBehaviour "CARELESS";_unit enableMimics false;_unit setSpeaker "NoVoice";_unit disableConversation true;_unit enableMimics false;};
if(_currentPosition select 0=="turret")then{
_unit=_grp createUnit[(_vehicleType select 1),_position,[],0,"CAN_COLLIDE"];
_unit assignAsGunner _vehicle;
_unit MoveInTurret[_vehicle,_currentPosition select 1];
_vehCrew set[count _vehCrew,_unit];
_unit enableSimulationGlobal false;_unit hideObjectGlobal true;_unit disableAI "ALL";_unit setBehaviour "CARELESS";_unit enableMimics false;_unit setSpeaker "NoVoice";_unit disableConversation true;_unit enableMimics false;};
}forEach _vehPositions;
_return=[_vehicle,_vehCrew,_grp];
_return