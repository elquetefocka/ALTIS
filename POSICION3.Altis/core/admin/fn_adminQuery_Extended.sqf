/*
	File: fn_adminQuery.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the query on a player.
*/
private["_display","_text","_info","_prim","_sec","_vest","_uni","_bp","_attach","_tmp"];
disableSerialization;
_display = findDisplay 2900;
if(!isNil {admin_query_ip}) exitWith {hint "Du fragst bereits einen Spieler ab."};
_text = _display displayCtrl 1004;
_info = lbData[1500,lbCurSel (1500)];
_info = call compile format["%1", _info];
if(isNil "_info") exitWith {_text ctrlSetText "Los jugadores ya no exisietert?";};
if(isNull _info) exitWith {_text ctrlSetText "Los jugadores ya no exisietert?";};
[[player],"fnc_player_query_Extended",_info,false] spawn life_fnc_MP;
_text ctrlSetText "Preguntas de los jugadores...";