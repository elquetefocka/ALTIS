/*
	Author: Bryan "Tonic" Boardwine

	Description:
	When a player disconnect it goes through the all the dead bodies
	and removes bodies owned by the server. This is built for the new
	medical / EMS system.
*/
private["_uid","_name"];
_uid = _this select 0;
_name = _this select 2;
{
	_pid = _x getVariable["steam64ID",""];
	if(_uid == _pid OR _pid == "" OR owner _x < 3) then {
		_containers = nearestObjects[_x,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
		_x setPos [3697.5376,13153.527,1.438793];
		{deleteVehicle _x;} foreach _containers; //Delete the containers.
		removeAllWeapons _x;
		removeUniform _x;
		removeVest _x;
		removeBackpack _x;
		removeGoggles _x;
		removeHeadGear _x;
		deleteVehicle _x; //Get rid of the corpse.
		
	};
} foreach allDeadMen;

_uid spawn TON_fnc_houseCleanup;