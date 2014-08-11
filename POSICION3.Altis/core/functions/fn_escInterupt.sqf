/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_timeStamp = time + 10;
		
		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		
		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	[] call SOCK_fnc_updateRequest; //call our silent sync.
	
	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_players = nearestObjects[player,["Man"],12];
		_players = _players - [player];
		if(count _players > 0) then { _abortButton ctrlEnable false; } else { _abortButton ctrlEnable true; };
	};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player getVariable["restrained",FALSE]) OR (player getVariable["Escorting",FALSE]) OR (player getVariable["transporting",FALSE]) OR (life_is_arrested) OR (life_istazed)) then {false} else {true};
};

_testCont = 0;
	
while {true} do
{
	_testCont = _testCont + 1;
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_abortButton buttonSetAction "[[player],""TON_fnc_cleanupRequest"",false,false] spawn life_fnc_MP";
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	
	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	if(_usebleCtrl) then {
		If ({isPlayer _x} count (player nearEntities ["AllVehicles", 5]) < 2) Then {
			hint format ["Puedes Salir sin problemas / %1",_testCont];
			_respawnButton ctrlEnable true; //Enable the button.
		} else {
			hint format ["Por salir cerca de otra persona has sido castigado / %1",_testCont];
			removeUniform player;
			removeVest player;
			removeBackpack player;
			removeGoggles player;
			removeHeadGear player;
			removeAllWeapons player;
			_abortButton ctrlEnable false;
			_respawnButton ctrlEnable false; //Enable the button.
		};
	};
	waitUntil{isNull (findDisplay 49)};
};
