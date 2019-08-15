private["_i","_bla"];
_i=28;//Start with a high value for initial check
for "_bla" from 0 to 1 step 0 do{//Infinite Loop
sleep 2;
_i=_i + 2;
if(_i >= 30)then{
L_civs_allInBL=true;
	{if([_x]call L_fn_civs_blCheckPlayers)exitWith{
	L_civs_allInBL=false;};}forEach allPlayers;_i=0;};};