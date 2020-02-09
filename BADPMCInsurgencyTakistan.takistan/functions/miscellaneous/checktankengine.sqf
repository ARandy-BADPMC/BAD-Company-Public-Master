_vehicle = _this select 0;
_pilot = driver _vehicle;

if ((typeOf _pilot != "rhsusf_socom_marsoc_cso_mechanic") || isNull _pilot)
then {
_vehicle engineOn false; 
};
