_eosMarkers=server getVariable "EOSmarkers";
{_x setMarkerAlpha(MarkerAlpha _x);
_x setMarkercolor(getMarkerColor _x);
}forEach _eosMarkers;