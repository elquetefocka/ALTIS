/*
	READ THE FILE NAME!
*/
private["_uiDisp","_time","_timer"];
disableSerialization;
6 cutRsc ["life_timercasino","PLAIN"];
_uiDisp = uiNamespace getVariable "life_timercasino";
_timer = _uiDisp displayCtrl 38301;
_time = time + (5 * 60);
while {true} do {
	if(isNull _uiDisp) then {
		6 cutRsc ["life_timercasino","PLAIN"];
		_uiDisp = uiNamespace getVariable "life_timercasino";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {};
	if(!(casino_1 getVariable["chargeplacedcasino",false])) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
6 cutText["","PLAIN"];