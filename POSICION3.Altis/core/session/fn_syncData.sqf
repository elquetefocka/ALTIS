/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {hint "Ya has utilizado la opción de sincronización, sólo se puede utilizar esta función una vez cada 5 minutos.";};

switch (typeName life_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count life_fnc_MP_packet == 0) exitWith
		{
			_exit = true;
		};
	};
	
	default {_exit = true;};
};

if(!isNil "_exit") exitWith {hint "Debido a algún tramposo corrompiendo el Marco BIS MP que te han dejado de disfrutar de nuestra misión.\n\nPuedes intentarlo de nuevo en un minuto si usted siente que es un error.";};

[] call SOCK_fnc_updateRequest;
hint "Sincronizando la informacion del jugador a el server.\n\nPor favor espera 20 segundos antes de abandonar.";
[] spawn
{
	life_session_time = true;
	sleep (5 * 60);
	life_session_time = false;
};
	