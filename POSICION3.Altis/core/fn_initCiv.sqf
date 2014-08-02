/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
waitUntil {!(isNull (findDisplay 46))};
_playerPosition = civ_position;
diag_log format ["%1",_playerPosition]; //For debugging

if (!life_is_alive) then
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
}	
else 
{
	if(life_is_arrested) then
				{
				life_is_arrested = false;
				[player,true] spawn life_fnc_jail;
				} 
					else 
						{
						player setPos civ_position;
						hint format["Your character is still alive. You have been placed at your last saved position."];
						};	
	life_is_alive = true;
}; 

player addRating 9999999;
[] call life_fnc_zoneCreator;
[] execVM "welcome.sqf";
 
 
 if ((uniform player) == "U_NikosBody")  then {
player setObjectTextureGlobal [0, "textures\U_NikosBody.jpg"];
};
