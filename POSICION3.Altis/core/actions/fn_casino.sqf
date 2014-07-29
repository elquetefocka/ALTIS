/*
file: fn_casino.sqf
Author: metalcry1 basado en script robar gasolinera

*/
private["_robber","_shop","_timer","_funds","_dist","_success","_uiDisp","_time"]; //Kraken Clean-up: added _dist and _success
disableSerialization;
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_action = [_this,2] call BIS_fnc_param;//Action name
_funds = 650000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_dist = _robber distance _shop;//Distance beetwen the robber and the shop owner
_success = false; //Kraken Clean-up: set _success to false at the start of the script!
6 cutRsc ["life_timer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (2 * 60);
//_markerpos = getMarkerPos _robber;

_cops = { (isPlayer _x) && (side (group _x) == west) } count playableUnits;
if (_cops < 1) exitWith {
hint format ["El casino no puede ser robado por que hay %1 policia(s) online.", _cops];};
if(vehicle player != _robber) exitWith { hint "Necesitas salir de tu vehiculo!"; }; //If the player is in a vehicle, kill the script execution with a message to the player | Kraken CLeanup - Moved to above the other conditions 
if (alive _robber && {currentWeapon _robber != ""} && {_funds > 0}) then {//Conditions met, open if | Kraken Cleanup - as Kris added the vehicle condition, it doesn't need to be in here!
//hintSilent format["Necesitas esta a 10m!\n\nTiempo Restante:\n %1\n\nDistancia: %2m",_countDown,round(player distance _markerpos)];
hint format ["Robando el Casino!Por favor espere %1 seg.",_timer];
_shop switchMove "AmovPercMstpSsurWnonDnon";//Making a shop owner surrender
_shop removeAction _action;//Deleting the action,so it won't be spammed
//[[2,"El Casino esta siendo atracado!!"],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
[[2,format["$$$ %1 ESTA ROBANDO EL CASINO $$$", name _robber]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[getPlayerUID _robber,name _robber,"489"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;//Add the robber to the wanted list,thanks to DimitryYuri
while {true} do {
	if(isNull _uiDisp) then {
		6 cutRsc ["life_timer","PLAIN"];
		_uiDisp = uiNamespace getVariable "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
6 cutText["","PLAIN"];
if(_timer < 1) exitWith { _success = true;}; //Kraken Cleanup - If the count-down has hit 0 (or -1..just in case) the robbery is a success!
};
if(!_success) exitWith {}; //Kraken Cleanup -If success is false, kill it! They've already got their message
life_cash = life_cash + _funds; //Self explanatory
hint format["Has robado $%1",_funds]; //Give them a nice message



_shop switchMove "";//Reseting the shop owner
_funds = 0;
sleep 18000;//Cooldown between the robberies
_action = _shop addAction["Robar el casino",life_fnc_casino];//Adding action for the robbery
};//Close the if statement