_grp=(_this select 0);_skillArray=(_this select 1);_skillset=server getVariable _skillArray;
{_unit=_x;{_skillvalue=(_skillset select _forEachIndex)+(random 0.2)-(random 0.2);
_unit setSkill[_x,_skillvalue];} 
forEach['aimingAccuracy','aimingShake','aimingSpeed','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];if(EOS_DAMAGE_MULTIPLIER != 1)then{
_unit removeAllEventHandlers "HandleDamage";_unit addEventHandler["HandleDamage",{_damage=(_this select 2)*EOS_DAMAGE_MULTIPLIER;_damage}];
[_unit]execVM "eos\fn\randOP4.sqf";};
if(side _unit!=civilian)then{
if(random 1<0.03)then{
_unit addEventHandler["killed","null=[_this]execVM ""core\modules\cacheScript\IntelCase.sqf"""];};}else{
	if(random 1<0.07)then{
	removeAllActions _unit;null=[_unit,[WEST],"Bo_GBU12_LGB"]execVM "eos\fn\jihad.sqf";
	_unit addEventHandler["AnimChanged",{
	_aunit=_this select 0;
	_curanim=_this select 1;
	if(_curanim=="AmovPercMrunSnonWnonDf")then{_aunit playMove "AmovPercMevaSnonWnonDf"};
	if(_curanim=="AmovPercMrunSnonWnonDfl")then{_aunit playMove "AmovPercMevaSnonWnonDfl"};
	if(_curanim=="AmovPercMrunSnonWnonDfr")then{_aunit playMove "AmovPercMevaSnonWnonDfr"};}];}else{
if(random 1<0.17)then{//0.17
null=[_unit,"",100,25,west,1,0.3]execVM "eos\fn\civRogue.sqf";
removeAllActions _unit;};};
};}forEach(units _grp);