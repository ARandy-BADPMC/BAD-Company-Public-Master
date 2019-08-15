private["_pos","_notBlacklisted","_checkPos"];
_pos=_this select 0;
_checkPos=[]+_pos;
_notBlacklisted=true;
if(L_civs_debug==2)then{hintSilent format["Checking position %1 if blacklisted...",_pos]};
{if([_x, _checkPos]call BIS_fnc_inTrigger)exitWith{
	if(L_civs_debug==2)then{hintSilent format["Position %1 is blacklisted.",_pos]};
	_notBlackListed=false;};
}forEach L_civs_BL;
_notBlackListed;