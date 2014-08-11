
_x = player;

if (alive player) then
{	
	[] call SOCK_fnc_updateRequest; //call our silent sync.
	Sleep 2;
	_x switchMove "AmovPercMstpSsurWnonDnon";//Making a player owner surrender
	_x allowdamage false;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadGear player;
	removeAllWeapons player;
	call BIS_fnc_endMission;
	//deleteVehicle _x;
	Sleep 10;
	"[[player],""TON_fnc_cleanupRequest"",false,false] spawn life_fnc_MP";
};
