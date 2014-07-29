/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "heroinu": {6};
	case "heroinp": {4};
	case "cannabis": {4};
	case "marijuana": {5};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {6};
	case "fishing": {2};
	case "coffee": {1};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "iron_r": {3};
	case "copper_r": {3};
	case "tbacon": {1};
	case "lockpick": {3};
	case "redgull": {3};
	case "peach": {1};
	case "diamond": {4};
	case "diamondc": {2};
	case "cocaine": {6};
	case "cocainep": {4};
	case "spikeStrip": {15};
	case "goldbar": {12};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "cono": {1};
	case "barrera": {5};
	case "barricade": {5};
	case "barrier": {5};
	case "pala": {2};
	case "pergamino": {4};
	case "vasija": {4};
	case "doblon": {4};
	case "brazalete": {4};
	case "catalejo": {4};
	case "abrecartas": {4};
	case "collar": {4};
	case "cetro": {4};
	case "tabaco": {4};
	case "cigarrillos": {2};
	case "caparazon": {6};
	case "figuradehueso": {4};
	case "cerveza": {2};
	case "sidra": {1};
	case "rana": {5};//15 is the weight
	case "patasderana": {5};//15 is the weight
	case "ranalsd": {5};
	case "lupulo": {3};
	case "malta": {3};
	case "mauer": {3};
	case "acero": {1};
	case "aceroinoxidable": {1};
	case "kidney": {15};//15 is the weight
	case "zipties": {5};//15 is the weight
	case "madera": {2};
	case "carbon": {2};
	default {1};
};
