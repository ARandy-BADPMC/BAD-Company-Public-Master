private["_pos","_dist","_dir"];
_pos=_this select 0;
_dist=_this select 1;
_dir=random 360;
_pos=[(_pos select 0)+(sin _dir)*_dist,(_pos select 1)+(cos _dir)*_dist,0];
_pos;