/**
*	addMoney(NUMBER value)
*
*/

private ["_money"];

if((call life_adminlevel) < 1) exitWith {};

_money = _this select 0;

if(_money <= 0) exitWith
{
	hint "Cantidad incorrecta de dinero fn_adminAddMoney";
};

//Give money
life_cash = life_cash + _money;

//Hint + Infos
hint format["Du hast $%1 ercheatet.", _money];
[[0,format["ADMIN: %1 ha ingresado en su cuenta $%2 Euros.",name player, _money]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

//Additional info
sleep 2;

hintSilent format["Cantidad actual de dinero: $%1", [life_cash] call life_fnc_numberText];

