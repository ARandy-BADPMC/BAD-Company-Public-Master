InsU={
private["_unit","_unif"];
_unit=_this select 0;
_unif=		["U_OG_Guerilla2_1",
			"U_BG_Guerilla2_2",
			"U_BG_Guerilla2_3",
			"U_BG_Guerilla3_1",
			"U_C_HunterBody_grn",
			"U_C_WorkerCoveralls",
			"U_OrestesBody",
			"U_I_C_Soldier_Bandit_1_F",
			"U_I_C_Soldier_Bandit_2_F",
			"U_I_C_Soldier_Bandit_3_F",
			"U_I_C_Soldier_Bandit_4_F",
			"U_I_C_Soldier_Bandit_5_F",
			"U_I_C_Soldier_Para_5_F"];
if(isClass(configFile>>"cfgPatches">>"Taliban_fighters"))then{
_unif=		["U_Afghan01",
			"U_Afghan02",
			"U_Afghan03",
			"U_Afghan04",
			"U_Afghan05",
			"U_Afghan06"];};
if(isClass(configFile>>"cfgPatches">>"CUP_Creatures_Military_TakiInsurgents"))then{
_unif=		["CUP_O_TKI_Khet_Jeans_01",
			"CUP_O_TKI_Khet_Jeans_02",
			"CUP_O_TKI_Khet_Jeans_03",
			"CUP_O_TKI_Khet_Jeans_04",
			"CUP_O_TKI_Khet_Partug_01",
			"CUP_O_TKI_Khet_Partug_02",
			"CUP_O_TKI_Khet_Partug_03",
			"CUP_O_TKI_Khet_Partug_04",
			"CUP_O_TKI_Khet_Partug_05",
			"CUP_O_TKI_Khet_Partug_06",
			"CUP_O_TKI_Khet_Partug_07",
			"CUP_O_TKI_Khet_Partug_08"];};
removeUniform _unit;
_unit forceAddUniform(_unif call BIS_fnc_selectRandom)};
InsV={
private["_unit","_vests"];
_unit=_this select 0;
_vests=		["V_TacChestrig_cbr_F",
			"V_TacChestrig_grn_F",
            "V_TacChestrig_oli_F",
            "V_BandollierB_khk",
            "V_BandollierB_cbr",
            "V_Chestrig_khk",
            "V_Chestrig_oli",
            "V_HarnessO_brn"];
if(isClass(configFile>>"cfgPatches">>"CUP_Creatures_Military_TakiInsurgents"))then{
_vests=		["CUP_V_OI_TKI_Jacket1_01",
			"CUP_V_OI_TKI_Jacket1_02",
			"CUP_V_OI_TKI_Jacket1_03",
			"CUP_V_OI_TKI_Jacket1_04",
			"CUP_V_OI_TKI_Jacket1_05",
			"CUP_V_OI_TKI_Jacket1_06",
			"CUP_V_OI_TKI_Jacket2_01",
			"CUP_V_OI_TKI_Jacket2_02",
			"CUP_V_OI_TKI_Jacket2_03",
			"CUP_V_OI_TKI_Jacket2_04",
			"CUP_V_OI_TKI_Jacket2_05",
			"CUP_V_OI_TKI_Jacket2_06",
			"CUP_V_OI_TKI_Jacket3_01",
			"CUP_V_OI_TKI_Jacket3_02",
			"CUP_V_OI_TKI_Jacket3_03",
			"CUP_V_OI_TKI_Jacket3_04",
			"CUP_V_OI_TKI_Jacket3_05",
			"CUP_V_OI_TKI_Jacket3_06",
			"CUP_V_OI_TKI_Jacket4_01",
			"CUP_V_OI_TKI_Jacket4_02",
			"CUP_V_OI_TKI_Jacket4_03",
			"CUP_V_OI_TKI_Jacket4_04",
			"CUP_V_OI_TKI_Jacket4_05",
			"CUP_V_OI_TKI_Jacket4_06"];};
_unit addVest(_vests call BIS_fnc_selectRandom);};
CivV={
private["_unit","_cVest"];
_unit=_this select 0;
_cVest=		[""];
if(isClass(configFile>>"cfgPatches">>"CUP_Creatures_Military_TakiInsurgents"))then{
_cVest=		["CUP_V_OI_TKI_Jacket1_01",
			"CUP_V_OI_TKI_Jacket1_02",
			"CUP_V_OI_TKI_Jacket1_03",
			"CUP_V_OI_TKI_Jacket1_04",
			"CUP_V_OI_TKI_Jacket1_05",
			"CUP_V_OI_TKI_Jacket1_06",
			"CUP_V_OI_TKI_Jacket2_04",
			"CUP_V_OI_TKI_Jacket2_05",
			"CUP_V_OI_TKI_Jacket2_06",
			"CUP_V_OI_TKI_Jacket3_04",
			"CUP_V_OI_TKI_Jacket3_05",
			"CUP_V_OI_TKI_Jacket3_06",
			"CUP_V_OI_TKI_Jacket4_04",
			"CUP_V_OI_TKI_Jacket4_05",
			"CUP_V_OI_TKI_Jacket4_06"];};
_unit addVest(_cVest call BIS_fnc_selectRandom);};
InsH={
private["_unit","_hat"];
_unit=_this select 0;
_hat=	["H_Shemag_olive",
		"H_Shemag_khk",
		"H_Shemag_tan",
		"H_ShemagOpen_khk",
		"H_ShemagOpen_tan",
		"H_Bandanna_gry"];
if(isClass(configFile>>"cfgPatches">>"CUP_Creatures_Military_TakiInsurgents"))then{
_hat=	["CUP_H_TKI_Pakol_1_01",
		"CUP_H_TKI_Pakol_1_02",
		"CUP_H_TKI_Pakol_1_03",
		"CUP_H_TKI_Pakol_1_04",
		"CUP_H_TKI_Pakol_1_05",
		"CUP_H_TKI_Pakol_1_06",
		"CUP_H_TKI_Pakol_2_01",
		"CUP_H_TKI_Pakol_2_02",
		"CUP_H_TKI_Pakol_2_03",
		"CUP_H_TKI_Pakol_2_04",
		"CUP_H_TKI_Pakol_2_05",
		"CUP_H_TKI_Pakol_2_06",
		"CUP_H_TKI_Lungee_01",
		"CUP_H_TKI_Lungee_02",
		"CUP_H_TKI_Lungee_03",
		"CUP_H_TKI_Lungee_04",
		"CUP_H_TKI_Lungee_05",
		"CUP_H_TKI_Lungee_06",
		"CUP_H_TKI_Lungee_Open_01",
		"CUP_H_TKI_Lungee_Open_02",
		"CUP_H_TKI_Lungee_Open_03",
		"CUP_H_TKI_Lungee_Open_04",
		"CUP_H_TKI_Lungee_Open_05",
		"CUP_H_TKI_Lungee_Open_06"];};
if(isClass(configFile>>"cfgPatches">>"Taliban_fighters"))then{_hat=[""];};
removeHeadgear _unit;_unit addHeadgear(_hat call BIS_fnc_selectRandom)};
InsG={
private["_unit","_gogg"];
_unit=_this select 0;
_gogg=		["G_Bandanna_blk",
			"G_Bandanna_khk",
			"G_Bandanna_oli",
			"G_Bandanna_tan"];
if(isClass(configFile>>"cfgPatches">>"SFG_Tac_Beard"))then{
_gogg=		["SFG_Tac_BeardD",
			"SFG_Tac_BeardO",
			"SFG_Tac_smallBeardD",
			"SFG_Tac_smallBeardO"];};
_unit addGoggles(_gogg call BIS_fnc_selectRandom)};
InsF={
private["_unit"];
_unit=_this select 0;
FList=["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call BIS_fnc_selectRandom;
[_unit,FList]remoteExec["setFace",0,true];};
InsW={
private["_unit"];
_unit=_this select 0;
if(isClass(configFile>>"cfgPatches">>"CUP_Weapons_WeaponsCore"))then{
if(round(random 4)==1)then{
_unit addBackpackGlobal "CUP_B_RPGPack_Khaki";
sleep 1;
_unit addMagazine "RPG7_F";_unit addMagazine "RPG7_F";_unit addWeaponGlobal "launch_RPG7_F";};
	switch(round(random 6))do{
	case 0:{_unit addMagazines["CUP_30Rnd_762x39_AK47_M",5];_unit addWeaponGlobal "CUP_arifle_AK47";_unit addMagazines["CUP_20Rnd_B_765x17_Ball_M",3];_unit addWeaponGlobal "CUP_hgun_SA61";};
	case 1:{_unit addMagazines["CUP_30Rnd_545x39_AK_M",5];_unit addMagazines["CUP_1Rnd_HE_GP25_M",2];_unit addWeaponGlobal "CUP_arifle_AK74_GL";};
	case 2:{_unit addMagazines["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",3];_unit addWeaponGlobal "CUP_lmg_PKM";};
	case 3:{_unit addMagazines["CUP_30Rnd_545x39_AK_M",5];_unit addWeaponGlobal "CUP_arifle_AKS74";};
	case 4:{_unit addMagazines["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",4];_unit addWeaponGlobal "CUP_RPK_74";};
	case 5:{_unit addMagazines["CUP_10x_303_M",5];_unit addWeaponGlobal "CUP_LeeEnfield";};
	case 6:{_unit addMagazines["CUP_30Rnd_762x39_AK47_M",5];_unit addWeaponGlobal "CUP_arifle_AKM";};};
	_unit addMagazine "CUP_HandGrenade_RGO";_unit addItem "FirstAidKit";_unit addMagazine "SmokeShell";_unit linkItem "ItemRadio";}else{
if(round(random 4)==1)then{
_unit addBackpackGlobal "B_Carryall_khk";
sleep 1;
_unit addMagazine "RPG7_F";_unit addMagazine "RPG7_F";_unit addWeaponGlobal "launch_RPG7_F";};
	switch(round(random 5))do{
	case 0:{_unit addMagazines["30Rnd_762x39_Mag_Green_F",5];_unit addWeaponGlobal "arifle_AK12_F";_unit addMagazines["10Rnd_9x21_Mag",3];_unit addWeaponGlobal "hgun_Pistol_01_F";};
	case 1:{_unit addMagazines["30Rnd_762x39_Mag_Green_F",5];_unit addMagazines["1Rnd_HE_Grenade_shell",2];_unit addWeaponGlobal "arifle_AK12_GL_F";};
	case 2:{_unit addMagazines["150Rnd_762x54_Box_Tracer",3];_unit addWeaponGlobal "LMG_Zafir_F";};
	case 3:{_unit addMagazines["30Rnd_762x39_Mag_Green_F",6];_unit addWeaponGlobal "arifle_AKM_F";};
	case 4:{_unit addMagazines["30Rnd_545x39_Mag_Green_F",6];_unit addWeaponGlobal "arifle_AKS_F";};
	case 5:{_unit addMagazines["10Rnd_762x54_Mag",5];_unit addWeaponGlobal "srifle_DMR_01_F";};};
_unit addMagazine "HandGrenade";_unit addItem "FirstAidKit";_unit addMagazine "SmokeShell";_unit linkItem "ItemRadio";
sleep 1;};};
InsAI={
private["_unit"];
_unit=_this select 0;
sleep 8.5;
_unit enableSimulationGlobal true;
sleep 1;
_unit enableAI "TeamSwitch";
sleep 3;
_unit enableAI "ANIM";
sleep 5;
_unit enableAI "FSM"; 
sleep 5;
_unit enableAI "PATH";
sleep 1;
_unit enableAI "MOVE";
sleep 1.5;
_unit enableAI "CHECKVISIBLE";
sleep 1.5;
_unit enableAI "SUPPRESSION";
sleep 1.5;
_unit enableAI "AIMINGERROR";
sleep 1.5;
_unit enableAI "TARGET";_unit enableAI "AUTOTARGET";
sleep 1;
_unit enableAI "AUTOCOMBAT";};
ask={
private["_unit","_pDir"];
_unit=_this select 0;
_pDir=getDir player;
if(isNull _unit)exitWith{};
if(!alive _unit)then{removeAllActions _unit;}else{
if(player distance _unit<=5)then{
if(random 10<0.5)then{
_unit remoteExec["removeAllActions",0,true];player playAction "gestureHi";_unit playAction "gestureHi";_unit doWatch player;sleep 2;_unit playAction "Stop";_unit disableAI "MOVE";_unit disableAI "PATH";_unit setDir(_pDir-180);_unit setRandomLip true;player setRandomLip true;player switchMove "HubStanding_idle1";[_unit,"Acts_PointingLeftUnarmed"]remoteExec["switchMove",0];sleep 14.074;[_unit,""]remoteExec["switchMove",0];player switchMove "";_unit enableAI "MOVE";_unit enableAI "PATH";_unit setRandomLip false;player setRandomLip false;_unit doWatch objNull;player groupChat "A local has given us intel.";call createIntel;call pickedUpIntel;
}else{
_unit remoteExec["removeAllActions",0,true];player playAction "gestureHi";_unit playAction "gestureHi";_unit doWatch player;sleep 2;_unit playAction "Stop";_unit disableAI "MOVE";_unit disableAI "PATH";_unit setDir(_pDir-180);_unit setRandomLip true;player setRandomLip true;player switchMove "HubStanding_idle1";[_unit,"Acts_StandingSpeakingUnarmed"]remoteExec["switchMove",0];sleep 11.942;[_unit,""]remoteExec["switchMove",0];player switchMove "";_unit enableAI "MOVE";_unit enableAI "PATH";_unit setRandomLip false;player setRandomLip false;_unit doWatch objNull;titleText["He doesn't know anything.","PLAIN DOWN"];};};};};
Loc_addAction={
private["_screenMsg","_scriptToCall"];
_unit=_this select 0;
_screenMsg=_this select 1;
_scriptToCall=_this select 2;	
if(isNull _unit)exitWith{};
_unit addAction[_screenMsg,_scriptToCall];};