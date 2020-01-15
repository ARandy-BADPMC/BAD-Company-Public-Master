_vehicle = _this select 0;
_pilot = driver _vehicle;
_tempArray = _pilot getVariable "vehiceRestrictions";


if ("Armor" in _tempArray) then
{
_vehicle engineOn false; 
};
