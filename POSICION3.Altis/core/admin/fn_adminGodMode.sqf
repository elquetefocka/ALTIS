/**
*	godMode(BOOLEAN ebale)
*
*/

private ["_enable"];
_enable = _this select 0;

//Give money
player allowDamage _enable;

//Hint + Infos
if( _enable ) then
{
	[[0,format["ADMIN: %1 ha activado God-Mode.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	hint "God-Mode ON";
}
else
{
	[[0,format["ADMIN: %1 ha desactivado God-Mode.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	hint "God-Mode OFF";
};


