/*
	File: fn_getDPMission2.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: synced-gaming.de
	Description:
	Selects a random Target for Mr. Black Delivery Mission.
	Needs to be revised.
*/
private["_dp2","_target","_amount","_diff","_type"];
//space check
//_type = lbData[2401,(lbCurSel 2401)];
_type = "bdp";
//_amount = ctrlText 2404;
_amount = "1";
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "Not enough space in your inventory!"};
_amount = _diff;
if(_target getVariable["dpblock",false]) exitWith {hint "I have nothing for you, please come back later!";};
if(str(_target) in life_dp_points2) then
{
	private["_point"];
	_point = life_dp_points2 - [(str(_target))];
	_dp2 = _point call BIS_fnc_selectRandom;
}
	else
{
	_dp2 = life_dp_points2 call BIS_fnc_selectRandom;
};

life_dp_start = _target;

life_delivery_in_progress = true;
life_dp_point = call compile format["%1",_dp2];

_dp2 = [_dp2,"_"," "] call KRON_Replace;
life_cur_task = player createSimpleTask [format["Delivery_%1",life_dp_point]];
life_cur_task setSimpleTaskDescription [format["Bring Mr. Black's package to %1",toUpper _dp2],"Mr. Blacks's Delivery Job",""];
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;

["DeliveryAssigned",[format["Bring the package to %1. quickly!",toUpper _dp2]]] call bis_fnc_showNotification;
//put Package in inv
([true,"bdp",1] call life_fnc_handleInv);

_target setVariable["dpblock",true,true];
sleep 60;
_target setVariable["dpblock",false,true];

[] spawn
{
	waitUntil {!life_delivery_in_progress OR !alive player};
	if(!alive player) then
	{
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		["DeliveryFailed",["You failed, you died."]] call BIS_fnc_showNotification;
		life_delivery_in_progress = false;
		life_dp_point = nil;
	};
};

[] spawn
{
	waitUntil {!life_delivery_in_progress OR !alive player};
	if (life_inv_bdp <= 0) then
	{
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		["DeliveryFailed",["Du hast das Paket verloren! Versager!"]] call BIS_fnc_showNotification;
		life_delivery_in_progress = false;
		life_dp_point = nil;
	};
};