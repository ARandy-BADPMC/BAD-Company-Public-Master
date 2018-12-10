EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";null=[] execVM "eos\core\spawn_fnc.sqf";onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};
/*

GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
 
 
 
	 null = [["m_1"],[1,2,house],[2,2,patrol],[1,1,cars],[1,armour],[1,static],[1,1,cargo],[faction,0,redzone,EAST,FALSE,FALSE]] call EOS_Spawn;
 
*/

//=============================================================================================================================
// Settings
//=============================================================================================================================

	EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
	Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
	null=[] execVM "eos\core\spawn_fnc.sqf";
	onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};
	
	VictoryColor="colorBlue";	// Colour of marker after completion
	hostileColor="colorRed";	// Default colour when enemies active
	bastionColor="colorOrange";	// Colour for bastion marker
	EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
	EOS_KILLCOUNTER=false;		// Counts killed units

//=============================================================================================================================
// Markers
//=============================================================================================================================

null = [["EOSinf_1","EOSinf_2"],[3,1],[2,3,75],[0,0],[0],[0],[0,0],[0,0,350,EAST,TRUE]] call EOS_Spawn;
null = [["EOSmot_1","EOSmot_2"],[0,0],[0,0],[3,1,90],[2,60],[0],[1,0,90],[0,0,350,EAST,FALSE]] call EOS_Spawn;
null = [["BAS_zone_1"],[0,1],[0,2],[0],[1,2],[0,0,EAST,TRUE],[0,2,120,TRUE,FALSE]] call Bastion_Spawn;

null = [["mkr"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr1"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr2"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr3"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr4"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr5"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr6"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr7"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr8"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr9"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr10"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr11"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr12"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr13"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr14"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr15"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr16"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr17"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr18"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr19"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr20"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr21"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr22"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr23"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr24"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr25"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr26"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr27"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr28"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr29"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr30"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr31"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr32"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr33"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr34"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr35"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr36"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr37"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr38"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr39"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr40"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr41"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr42"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr43"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr44"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr45"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr46"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr47"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr48"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr49"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr50"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr51"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr52"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr53"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr54"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr55"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr56"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr57"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr58"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr59"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr60"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr61"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr62"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr63"],[3,1,70],[1,1,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr64"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr65"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[2,5,10],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr66"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr67"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr68"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr69"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr70"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr71"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr72"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr73"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr74"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr75"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr76"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,70],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr77"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr78"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr79"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr80"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr81"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr82"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr83"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr84"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr85"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr86"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr87"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr88"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr89"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr90"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr91"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr92"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr93"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr94"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr95"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr96"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr97"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr98"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr99"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr100"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr101"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr102"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr103"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr104"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr105"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr106"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr107"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr108"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr109"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr110"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr111"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr112"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr113"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr114"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr115"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr116"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr117"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr118"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr119"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr120"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr121"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr122"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr123"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr124"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr125"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr126"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr127"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr128"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr129"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr130"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr131"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr132"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr133"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr134"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr135"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr136"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr137"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr138"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr139"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr140"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr141"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr142"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr143"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr144"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr145"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr146"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr147"],[3,1,70],[1,1,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr148"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr149"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr150"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr151"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr152"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[2,5,40],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr153"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr154"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr155"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr156"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr157"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr158"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr159"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr160"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr161"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr162"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr163"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr164"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr165"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr166"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr167"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr168"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr169"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr170"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr171"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[2,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr172"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr173"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr174"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr175"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr176"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr177"],[3,1,70],[1,3,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr178"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr179"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr180"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr181"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr182"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr183"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr184"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr185"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr186"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,50],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr187"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr188"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr189"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr190"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr191"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr192"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,80],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr193"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr194"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr195"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr196"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr197"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr198"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr199"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[0,0,0],[5,0,300,EAST,FALSE]] call EOS_Spawn;
null = [["mkr200"],[3,1,70],[1,2,50],[1,1,20],[1,5],[2,50],[1,5,20],[5,0,300,EAST,FALSE]] call EOS_Spawn;