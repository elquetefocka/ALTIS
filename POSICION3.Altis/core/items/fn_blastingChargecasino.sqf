/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint "Esto solo se puede utilizar en una cajafuerte."};
if(_vault getVariable["chargeplacedcasino",false]) exitWith {hint "Ya existe una carga colocada en esta cajafuerte."};
if(_vault getVariable["safe_opencasino",false]) exitWith {hint "La cajafuerte ya está abierta."};
if(!([false,"blastingchargecasino",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable["chargeplacedcasino",true,true];
[[1,"Un carga explosiva se ha colocado en la caja fuerte del casino, tiene hasta que la cuenta atras termine para desactivarla!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
hint "El tiempo esta corriendo¡ Mantenga a los policias lejos de esta caja fuerte¡";
_handle = [] spawn life_fnc_demoChargeTimercasino;
[[],"life_fnc_demoChargeTimercasino",west,false] spawn life_fnc_MP;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(casino_1 getVariable["chargeplacedcasino",false])) exitWith {hint "La carga ha sido desactivada!"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL casino_1 select 0, getPosATL casino_1 select 1, (getPosATL casino_1 select 2)+0.5];
casino_1 setVariable["chargeplacedcasino",false,true];
casino_1 setVariable["safe_opencasino",true,true];

hint "La caja fuerte ha sido abierta";