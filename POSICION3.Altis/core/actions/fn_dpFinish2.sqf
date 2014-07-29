/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(vehicle player != player) exitWith {hint "Steig aus um das Paket abzugeben!"};
life_delivery_in_progress = false;
life_dp_point = nil;
_dis = round((getPos life_dp_start) distance (getPos _dp));
_price = round(7.2 * _dis);
["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_2"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
life_cash = life_cash + _price;
([false,"bdp",1] call life_fnc_handleInv);