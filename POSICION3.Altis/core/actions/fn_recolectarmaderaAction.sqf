/*
	File: fn_gatherPeaches.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers apples?
*/
private["_sum"];
_sum = ["madera",5,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_gather = true;
	titleText[format[localize "STR_NOTF_Gathering",localize "STR_Item_madera"],"PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	if(([true,"madera",_sum] call life_fnc_handleInv)) then
	{
		titleText[format[localize "STR_NOTF_Picked",_sum,localize "STR_Item_madera"],"PLAIN"];
	};
}
	else
{
	hint localize "STR_NOTF_InvFull";
};

life_action_gather = false;