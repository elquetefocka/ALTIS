private["_uid", "_name"];

if(!([] call life_fnc_adminCheckAuth)) exitWith
{
  hint "Error: Tiene que autenticarse!";  
};

if((lbCurSel 1500) == -1) exitWith
{
    hint "Error: No hay jugadores seleccionados!";  
};

_uid = lbData[1500,lbCurSel (1500)];
_name = lbText[1500,lbCurSel (1500)];

serverCommand format [ "#ban %1", _uid];

[[0,format["ADMIN: %1 baneado.",_name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
hint format["%1 baneado.", _name];
