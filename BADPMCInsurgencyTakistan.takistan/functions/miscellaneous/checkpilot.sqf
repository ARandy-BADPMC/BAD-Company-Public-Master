_vehicle = _this select 0;
_seat = _this select 1;
_player = _this select 2;
_tempArray = _player getVariable "vehiceRestrictions";


if(_seat == "driver") then 
  {
	if ("Transport" in _tempArray) then
	  {
		moveOut _player;
	  };
  };