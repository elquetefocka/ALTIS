#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
publicVariable "life_server_isReady";

//__CONST__(LIFE_SCHEMA_NAME,"'arma3life'");//CHANGE THIS IF YOUR DATABASE IS NOT CALLED ARMA3LIFE KEEP THE ' '

[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";

//I am aiming to confuse people including myself, ignore the ui checks it's because I test locally.
if(isNil {uiNamespace getVariable "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	__CONST__(life_sql_id,life_sql_id);
	uiNamespace setVariable ["life_sql_id",life_sql_id];
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
	__CONST__(life_sql_id,life_sql_id);
};

_version = "extDB" callExtension "9:VERSION";
if(_version == "") exitWith {life_server_extDB_notLoaded = true; publicVariable "life_server_extDB_notLoaded";};

//Initialize the database
"extDB" callExtension "9:DATABASE:Database2";
"extDB" callExtension format["9:ADD:DB_RAW:%1",(call life_sql_id)];
"extDB" callExtension "9:LOCK";

//Run procedures for SQL cleanup on mission start.
["CALL resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["DELETE FROM houses WHERE owned='0'",1] spawn DB_fnc_asyncCall;

life_adminlevel = 0;
life_medicLevel = 0;
life_coplevel = 0;
life_copeastlevel = 0;

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");

//[] execVM "\life_server\fn_initHC.sqf";

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

serv_sv_use = [];

fed_bank setVariable["safe",(count playableUnits),true];
casino_1 setVariable["safecasino",(count playableUnits),true];

//General cleanup for clients disconnecting.
_onDisconnect = ["SERV_onClientDisconnect","onPlayerDisconnected",{[_uid,_id,_name] call TON_fnc_clientDisconnect}] call BIS_fnc_addStackedEventHandler;

[] spawn TON_fnc_cleanup;
life_gang_list = [];
publicVariable "life_gang_list";
life_wanted_list = [];
client_session_list = [];

[] execFSM "\life_server\cleanup.fsm";

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[] spawn TON_fnc_federalUpdate;


[] spawn
{
	while {true} do
	{
		sleep (30 * 60);
		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2,Dealer_3];
	};
};

//Strip NPC's of weapons
{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

[] spawn TON_fnc_initHouses;

//Lockup the dome
////////////////////////////////////////////////////////////////////////////////BANCO CENTRAL
private["_dome","_rsb"];
_dome = nearestObject [[15473.15,15705.463,-0.018241169],"Land_Dome_Big_F"];
_rsb = nearestObject [[15473.15,15705.463,-0.018241169],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;

/////////////////////////////////////////////////// CASINO

private["_domecasino","_rsbcasino"];
_domecasino = nearestObject [[5477.9092,15002.27,29.29999],"Land_Dome_Big_F"];
_rsbcasino = nearestObject [[5477.9092,15002.27,29.29999],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_domecasino setVariable[format["bis_disabled_Door_%1",_i],1,true]; _domecasino animate [format["Door_%1_rot",_i],0];};
_rsbcasino setVariable["bis_disabled_Door_1",1,true];
_rsbcasino allowDamage false;
_domecasino allowDamage false;

/////////////////////////////////////////////////// FRONTERA

private["_domefrontera","_rsbfrontera"];
_domefrontera = nearestObject [[16640.793,15695.068,5.5576954],"Land_Cargo_Tower_V1_No5_F"];
_rsbfrontera = nearestObject [[16677.453,15715.972,5.1460938],"Land_Cargo_Tower_V1_No5_F"];

_domefrontera setVariable["bis_disabled_Door_1",1,true];
_rsbfrontera setVariable["bis_disabled_Door_1",1,true];
_rsbfrontera allowDamage false;
_domefrontera allowDamage false;

///////////////////////////
life_server_isReady = true;
publicVariable "life_server_isReady";
