/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck","Air"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};
if(isNil "life_cshop_inUse") then {life_cshop_inUse = time-301;};
if(life_cshop_inUse +(300) >= time) exitWith {closeDialog 0; hint format["Sólo puede vender vehículos cada 5 minutos, se puede vender a otro vehículo en %1:%2",4 - floor ((time - life_cshop_inUse) / 60),59 - round (time - life_cshop_inUse - (floor ((time - life_cshop_inUse) / 60)) * 60)];};

hint localize "STR_Shop_ChopShopSelling";

_price2 = life_cash + _price;
[[player,_vehicle,_price,_price2],"TON_fnc_chopShopSell",false,false] spawn life_fnc_MP;
closeDialog 0;
life_cshop_inUse = time;