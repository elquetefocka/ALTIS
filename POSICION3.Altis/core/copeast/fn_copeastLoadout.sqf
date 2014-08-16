/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "U_O_OfficerUniform_ocamo";
player addHeadgear "B_Kitbag_cbr";
player addHeadGear "H_Beret_brn_SF";
player addVest "V_Rangemaster_belt";




//WEAPON MAGAZINES
player addMagazine "30Rnd_556x45_Stanag";
player addMagazine "30Rnd_556x45_Stanag";
player addMagazine "30Rnd_556x45_Stanag";

//PISTOL MAGAZINES
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

mybackpack = unitBackpack player;
mybackpack addItemCargoGlobal ["FirstAidKit",1];
mybackpack = unitBackpack player;
mybackpack addItemCargoGlobal ["Medikit",1];
mybackpack = unitBackpack player;
mybackpack addItemCargoGlobal ["ToolKit",1];





[] call life_fnc_saveGear;