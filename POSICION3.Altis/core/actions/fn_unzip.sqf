/*
	File: fn_unzip.sqf
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit || !(_unit getVariable "zipTie")) exitWith {};

//_unit setVariable["zipTie",false,true];

//_unit hint "Du wurdest freigelassen! Druecke V und lauf !!";

[[_unit],"life_fnc_unzipAction",_unit,false] spawn life_fnc_MP;