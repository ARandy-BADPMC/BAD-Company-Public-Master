waitUntil {!isNull player && player == player};
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;


switch (typeOf player) do { 
	case "rhsusf_airforce_jetpilot" : {  player call CHAB_fnc_whitelist; }; 
	case "rhsusf_army_ocp_helipilot" : {  
		heli_jeff addAction ["<t color='#FF0000'>Aircraft Spawner</t>","[] spawn CHAB_fnc_spawn_heli;",nil, 1, false, true, "", "true", 10, false,""];   //HELISPAWNER
		heli_jeff addAction ["<t color='#FF0000'>I want my Aircraft removed!</t>","[] spawn CHAB_fnc_remover_heli;",nil, 1, false, true, "", "true", 10, false,""];   //HELISPAWNER
	}; 
	default {
	 	tank_spawner addAction ["<t color='#FF0000'>Armor Spawner</t>","[] spawn CHAB_fnc_spawn_tank;",nil, 1, false, true, "", "true", 10, false,""];   
		tank_spawner addAction ["<t color='#FF0000'>I want my vehicle removed!</t>","[] spawn CHAB_fnc_remover_tank;",nil, 1, false, true, "", "true", 10, false,""];   
	}; 
};
_admins = ["76561198117073327","76561198142692277","76561198017258138","76561198002110130","76561197998271838","76561197992821044","76561197988793826","76561198048254349","76561198088658039"]; //76561197998271838-GOMEZ 76561197992821044-GRAND 76561197988793826-WEEDO  76561198117073327-Randy  76561198142692277-Alex.K   76561198017258138 - A.Mitchell 76561198002110130 K.Hunter 76561198088658039 Ayoub
if(getPlayerUID player in _admins) 
	then 
	{
		player addAction ["<t color='#FF0000'>Admin Console</t>","[] spawn CHAB_fnc_adminconsole;",nil, 1, false, true, "", "true", 10, false,""];
	
	};

jeff addaction ["Lights on", {
	_lamp = [12068,12595.7,0] nearestObject "Land_LampAirport_F";
	_lamp sethit ["light_1_hitpoint",0];
	_lamp sethit ["light_2_hitpoint",0];
}];
jeff addaction ["Lights off", {
	_lamp = [12068,12595.7,0] nearestObject "Land_LampAirport_F";
	_lamp sethit ["light_1_hitpoint",1];
	_lamp sethit ["light_2_hitpoint",1];	
}];

base_flag addAction ["Teleport to Shootingrange", {
	[player,[8284.93,2118.66,0]] remoteExec ["setPos",2];

}];
base_flag addAction ["Teleport to Heli-Spawner", {
	[player,[8070.84,1942.73,0]] remoteExec ["setPos",2];
}];
base_flag addAction ["Teleport to FOB", {
	[player,[7992.85,11205.2,0]] remoteExec ["setPos",2];
}];
fob_flag addAction ["Teleport to Base", {
	[player,[8267.67,2109.82,0]] remoteExec ["setPos",2];
}];
/*
ShootingRange_flag addAction ["Teleport to Base", {
	[player,[8267.67,2109.82,0]] remoteExec ["setPos",2];
}];
*/
_boxes = [box1,box2,box3,box4];
{_x addaction ["Arsenal", 
	{[_this select 0, _this select 1] call ace_arsenal_fnc_openBox;},nil,0,true,false,"","",10];
} forEach _boxes;



Helicopter_loadouts = 
[
	"RHS_AN2_B",["Unarmed",[]],
	"RHS_MELB_AH6M",["Light",["rhs_mag_M151_7","rhs_mag_m134_pylon_3000","rhs_mag_m134_pylon_3000","rhs_mag_M151_7"],"Medium",["rhsusf_mag_gau19_melb_left","","","rhs_mag_DAGR_8"],"Heavy",["rhsusf_mag_gau19_melb_left","","","rhs_mag_AGM114K_2"]],
	"I_Heli_Transport_02_F",["Unarmed",[]],
	"I_Heli_light_03_dynamicLoadout_F",["Anti Tank",["PylonWeapon_300Rnd_20mm_shells","PylonRack_4Rnd_ACE_Hellfire_AGM114K"],"Anti Infantry",["PylonWeapon_300Rnd_20mm_shells","PylonRack_12Rnd_missiles"]],
	"I_Heli_light_03_unarmed_F",["Unarmed",[]],
	"RHS_C130J",["Unarmed",[]],
	"C_Plane_Civil_01_F",["Unarmed",[]],
	"C_Plane_Civil_01_racing_F",["Unarmed",[]],
 	"RHS_CH_47F_10",["Unarmed",[]],
	"B_Heli_Transport_03_F",["Unarmed",[]],
	"B_Heli_Transport_03_unarmed_F",["Unarmed",[]],
	"rhsusf_CH53E_USMC_D",["Unarmed",[]],
	"O_Heli_Light_02_dynamicLoadout_F",["Light",["PylonWeapon_2000Rnd_65x39_belt","PylonRack_12Rnd_missiles"],"Medium",["PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles"],"Heavy",["PylonRack_1Rnd_ACE_Hellfire_AGM114N","PylonRack_1Rnd_ACE_Hellfire_AGM114N"]],
	"O_Heli_Light_02_unarmed_F",["Unarmed",[]],
	"C_Heli_Light_01_civil_F",["Unarmed",[]],
	"B_Heli_Light_01_F",["Unarmed",[]],
	"RHS_MELB_MH6M",["Unarmed",[]],
	"O_Heli_Transport_04_F", ["Unarmed",[]],
	"RHS_MELB_H6M",["Unarmed",[]],
	"RHS_UH1Y_d",["Normal",["rhs_mag_M151_7_green","rhs_mag_M151_7_green"]],
	"RHS_UH1Y_UNARMED_d",["Unarmed",[]],
	"RHS_UH60M_d",["Unarmed",[]],
	"RHS_UH60M_ESSS_d",["Light",["rhs_mag_M229_19","rhs_mag_M229_19","rhs_mag_M229_19","rhs_mag_M229_19"]],
	"RHS_UH60M2_d",["Unarmed",[]],
	"RHS_UH60M_MEV_d",["Unarmed",[]],
	"B_Heli_Transport_01_F",["Unarmed",[]],
	"B_T_VTOL_01_armed_F",["Unarmed",[]],
	"B_T_VTOL_01_vehicle_F",["Unarmed",[]],
	"B_T_VTOL_01_infantry_F",["Unarmed",[]]
]; 
