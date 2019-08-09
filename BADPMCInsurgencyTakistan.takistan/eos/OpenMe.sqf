EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";null=[] execVM "eos\core\spawn_fnc.sqf";onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};
/* EOS 1.98 by BangaBob 
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
*/
VictoryColor="colorBlue";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=false;		// Counts killed units

//Infantry

private _markerArray = [];

for "_i" from 1 to 250 do {

_markerArray pushBack (format ["mkr%1",_i]);

};

[_markerArray,[1,1],[1,2,50],[1,0,50],[0],[0],[0,0],[5,2,250,EAST,TRUE,FALSE]] call EOS_Spawn;

//Vehicles

private _markerArray = [];

for "_i" from 251 to 284 do {

_markerArray pushBack (format ["mkr%1",_i]);

};

[_markerArray,[0,0],[1,1,35],[1,0,50],[1,25],[0],[0,0],[5,2,250,EAST,TRUE,FALSE]] call EOS_Spawn;

//Choppers

private _markerArray = [];

for "_i" from 285 to 307 do {

_markerArray pushBack (format ["mkr%1",_i]);

};

[_markerArray,[0,0],[1,1,45],[0,0,0],[2,50],[0],[1,0,65],[5,2,200,EAST,TRUE,FALSE]] call EOS_Spawn;

//Bastions

private _markerArray = [];

for "_i" from 308 to 310 do {

_markerArray pushBack (format ["mkr%1",_i]);

};

[_markerArray,[3,1],[1,0],[0],[1,5],[5,0,EAST,false,false],[10,2,60,TRUE,FALSE]] call Bastion_Spawn;
