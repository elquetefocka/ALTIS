#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the invite process?
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint "You need to select a person to invite!"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "You cannot kick yourself!"};

if(count(grpPlayer getVariable ["gang_members",8]) == (grpPlayer getVariable ["gang_maxMembers",8])) exitWith {hint "Your gang has reached its maximum allowed slots, please upgrade your gangs slot limit."};

_action = [
	format["Vas a invitar %1 a tu pandilla, si el acepta, tendra acceso a los fondos de la pandilla.",_unit getVariable ["realname",name _unit]],
	"Transferencia de Liderazgo de la Pandilla",
	"Si",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
	_members = _group getVariable "gang_members";
	_members set[count _members,getPlayerUID _unit];
	_group setVariable["gang_members",_members,true];
	hint format["You have sent a invite to your gang to %1",_unit getVariable["realname",name _unit]];
} else {
	hint "Invitation Cancelled";
};