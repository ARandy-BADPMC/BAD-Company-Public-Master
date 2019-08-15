private "_men";
if isServer then{
private "_sortArray";
_sortArray={
private "_sort";
_sort={
private["_h","_i","_j","_a","_lo","_hi","_x","_id"];
_a=_this select 0;//array to be sorted
_id=_this select 1;//array item index to be compared
_lo=_this select 2;//lower index to sort from
_hi=_this select 3;//upper index to sort to
_h=nil;//used to make a do-while loop below
_i=_lo;
_j=_hi;
if(count _a==0)exitWith{};
_x=(_a select((_lo+_hi)/2))select _id;

while{isNil "_h"||_i<=_j}do{
while{(_a select _i)select _id<_x}do{_i=_i+1};
while{(_a select _j)select _id>_x}do{_j=_j-1};

if(_i<=_j)then{
_h=_a select _i;
_a set[_i,_a select _j];
_a set[_j,_h];

_i=_i+1;
_j=_j-1;};
};
if(_lo<_j)then{[_a,_id,_lo,_j]call _sort};
if(_i<_hi)then{[_a,_id,_i,_hi]call _sort};
};

[_this select 0,_this select 1,0,0 max((count(_this select 0))-1)]call _sort;
_this select 0};

private["_opos","_rad","_bpos"];
_opos=_this select 0;
if(typeName _opos==typeName objNull)then{_opos=getPos _opos};
_men=_this select 1;
_rad=if(count _this>2)then{_this select 2}else{20};

_bpos=[];
{private["_i","_p"];
for[{_i=0;_p=_x buildingPos _i},{str _p !="[0,0,0]"},{_i=_i+1;_p=_x buildingPos _i}]do{
_bpos set[count _bpos,_p];};
}forEach(nearestObjects[_opos,["Building"],_rad]);

//Priority
private "_prio";
if(count _this>3)then{
_prio=_this select 3;
_bpos=[_bpos,2]call _sortArray;}else{
_prio=0;};

//Height
if(count _this>4)then{
	if(count(_this select 4)>0)then{
	private["_tmp","_min","_max","_h"];
	_tmp=[];
	_min=(_this select 4)select 0;
	_max=(_this select 4)select 1;
	{_h=_x select 2;
	if(_h>=_min&&_h<=_max)then{_tmp set[count _tmp,_x]};
	}forEach _bpos;
_bpos=_tmp;};
};

private "_disableMove";
_disableMove=if(count _this>5)then{_this select 5}else{false};

private "_stance";
_stance=if(count _this>6)then{_this select 6}else{false};

private["_taken","_ind","_pos","_dir"];
_taken=[];
{while{count _taken<count _bpos}do{
	switch _prio do{
	case 0:{_ind=floor(random count _bpos)};//random
	case 1:{_ind=count _taken};//ground floor first
	case 2:{_ind=count _bpos - count _taken - 1};//roof first
};
if !(_ind in _taken)exitWith{
_taken set[count _taken,_ind];
_pos=_bpos select _ind;
_x setPos _pos;
_x setDir random 359;
if _disableMove then{doStop _x;};
if _stance then{_x setUnitPos "UP"};
	};
};}forEach _men;
};//isServer

//Hide
if(count _this>7)then{
if(isNil "SHK_BuildingPos_init")then{
SHK_BuildingPos_fn={
private["_act","_arr"];
_act=_this select 0;
_arr=_this select 1;
{_x hideObjectGlobal _act}forEach _arr;};
"SHK_BuildingPos_EH" addPublicVariableEventHandler{
private["_act","_arr"];
_arr=_this select 1;
_act=_arr select 0;
_arr=_arr select 1;
[_act,_arr]call SHK_BuildingPos_fn;};
SHK_BuildingPos_init=true;};

if isServer then{
private["_hide","_portition","_condition","_hidden","_u","_i"];
_hide=_this select 7;
_portition=_hide select 0;
_portition=round(_portition*(count _men));
_condition=_hide select 1;
_hidden=[];
for "_i" from 0 to(_portition-1)do{
_u=_men select _i;
_hidden set[count _hidden,_u];};

SHK_BuildingPos_EH=[true,_hidden];
publicVariable "SHK_BuildingPos_EH";
if !isDedicated then{[true,_hidden]call SHK_BuildingPos_fn};

waitUntil{(call compile _condition)};
SHK_BuildingPos_EH=[false,_hidden];
publicVariable "SHK_BuildingPos_EH";
if !isDedicated then{[false,_hidden]call SHK_BuildingPos_fn};};};