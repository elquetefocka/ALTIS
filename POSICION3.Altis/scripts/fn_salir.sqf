


if (alive player) then
{	
	[] call SOCK_fnc_updateRequest; //call our silent sync.
	closeDialog 0;
	player switchMove "AmovPercMstpSsurWnonDnon";//Making a player owner surrender
	player allowdamage false;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadGear player;
	removeAllWeapons player;
	for "_i" from 0 to 30 do 
	{
		hintsilent format ["Abandonar en %1 segundos",30 - _i];
		sleep 1;
	};
	
	
	"end1" call BIS_fnc_endMission;
	sleep 20;
	[[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;
	hideBody life_corpse;
};
