#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in ["cop_1","cop_2","cop_3","cop_4"])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};
player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn
{
while {(uniform player) == "U_Rangemaster"} do
    {
	[[player,0,"textures\guardia_civil_uniforme_ver.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;  
	if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	sleep 60;
    };
};
/*

[] spawn
{
while {(uniform player) == "U_B_CombatUniform_mcam"} do
    {
	switch (__GETC__(life_coplevel)) do 
		{
			case 2: {
			[[player,0,"textures\guardia_civil_uniforme_ver.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;  
			};
			
		};
    if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
    sleep 30;
    };
};
*/


[] execVM "welcome.sqf";