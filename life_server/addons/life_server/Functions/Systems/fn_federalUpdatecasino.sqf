/*
	File: fn_federalUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Uhhh, adds to it?
*/
private["_funds"];
while {true} do
{
	sleep (30 * 60);
	_funds = casino_1 getVariable["safecasino",0];
	casino_1 setVariable["safecasino",round(_funds+((count playableUnits)/2)),true];
};