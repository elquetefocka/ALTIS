/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig","sidra","cerveza","madera","carbon"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge","spikeStrip"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana"]]};
	case "fishmarket": {["Altis Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "cop": {["Cop Item Shop",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit","barricade","barrier","mauer","cono","barrera"]]};
	case "copeast": {["Cop Item Shop",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit","barricade","barrier","mauer","cono","barrera"]]};
	case "lab": {["Laboratorio",["labkit"]]};
	case "tabaco": {["Estanco",["cigarrillos","tabaco"]]};
	case "hospital": {["Kavala Hospital",["water","peach"]]};
	case "tesoros": {["Comerciante de Tesoros",["pergamino","vasija","doblon","brazalete","catalejo","abrecartas","collar","cetro"]]};
	case "kiosk": {["Kiosco",["redgull","water"]]};
	case "tanke": {["Cepsa",["water","rabbit","fuelF","zipties"]]};
	case "organ": {["Organ Dealer",["kidney"]]}; 
};