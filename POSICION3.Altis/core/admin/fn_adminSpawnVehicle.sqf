/**
*	spawnVehicle()
*
*/

hint "Init Vehicle Spawn";

if((call life_adminlevel) < 1) exitWith {};

private["_unit", "_position", "_veh"];
disableSerialization;

_unit = lbData[1501,lbCurSel (1501)];

hint _unit;

if(isNil "_unit") exitWith {hint "a";};

//
_position = position player;

for "_i" from 5 to 1 step -1 do
{
	hint format ["En %1s permita hacer surgir el vehículo.", _i];
	sleep 1;
};

//Spawn
_veh = _unit createVehicle (_position);
[[0,format["ADMIN: %1 ha sacado un vehiculot: %2",name player, _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

sleep 2;

hint format["Vehiculo hara spawn¡\nID: %1", _unit];




