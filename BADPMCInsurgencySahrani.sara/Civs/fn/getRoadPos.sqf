private["_searchPos","_radius","_roadList","_pos"];
_searchPos=_this select 0;
_radius=_this select 1;
_roadList=[];
_pos=[0,0,0];
_checkPos=[];
while{((count _roadList)==0)}do{
_roadList=_searchPos nearRoads _radius;
if((count _roadlist)>0)exitWith{
_pos=(getPosATL(_roadList select 0));
	if(L_civs_debug==2)then{hintSilent format["Found road position %1",_pos]};};
		if(_radius>3000)exitWith{
		_pos=[0,0,0];
		if(L_civs_debug==2)then{hintSilent format["No road position found, %1 is used...",_pos]};};
_checkPos=[];
_radius=_radius+100;
sleep 0.001;};
_pos;