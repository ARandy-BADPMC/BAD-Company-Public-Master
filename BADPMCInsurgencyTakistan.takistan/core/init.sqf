/*By Mphillips'Hazey' + Sacha Ligthert + Phronk
File Modified on: 3/2/2016
You are free to edit this mission for your personal or group use. 
Please DO NOT redistribute the map without permission.

Special Thanks:
	ArmA Tactical Combat Applications Group - Tactical Realism http://www.ATCAG.com
	Tangodown - Tactical Gaming Community http://www.tangodown.nl/
	Whiskey Company - Tactical Realism http://www.TheWhiskeyCo.com/
***********************************************************************************/
#include <modules\modules.hpp>
#ifndef execNow
#define execNow call compile preProcessFileLineNumbers
#endif
#ifdef cacheScript
execNow "core\modules\cacheScript\cache.sqf";
#endif
#ifdef intelSpawn
if(isServer || isDedicated)then{
[]execVM "core\modules\cacheScript\spawnIntel.sqf";};
#endif