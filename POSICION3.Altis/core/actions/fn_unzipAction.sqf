private["_unit"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

_unit playMoveNow "AmovPercMstpSnonWnonDnon";
_unit setVariable["restrained",false,true];
_unit setVariable["zipTie",false,true];


if(alive player) then
{
	titleText["Has sido soltado eres libree! corre!","PLAIN"];};