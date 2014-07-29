/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "gun": {10000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {45000}; //Heroin processing license cost
	case "marijuana": {29500}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {2000000}; //Rebel license cost
	case "truck": {20000}; //Truck license cost
	case "diamond": {35000};
	case "cocaine": {75000};
	case "iron": {9500};
	case "copper": {8000};
	case "tabaco" : {5000};
	case "taxi" : {1500000};
	case "turtle" :{10000};
	case "caparazon" :{25000};
	case "avion" :{1000000};
	case "kart" :{100000};
	case "home": {1000000};
	case "processmastery": {3000000};
	case "mair": {15000};
	case "donador": {300000000};
	case "donador2": {300000000};
	case "donador3": {300000000};
	case "telecirco": {250000};
	case "cerveza": {25000};
	case "sidra": {150000};
	case "aceroinoxidable": {150000};
	case "pmc": {6500000};
	case "caireast": {15000}; //Cop Pilot License costç
	case "pmc": {6500000};
	case "pasaporteesp": {20000};
	case "pasaportemaroc": {20000};
};