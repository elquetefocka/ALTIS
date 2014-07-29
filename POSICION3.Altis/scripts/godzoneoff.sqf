_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_host removeAction _id;

_caller allowDamage true;
hintSilent "God Mode Desactivado";