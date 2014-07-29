/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Angios HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};
	
	case east:
	{
		_return = [
			["copeast_spawn_1","Pirgos HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["copeast_spawn_2","Sofia HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	};
	
	case civilian:
	{
	
		_return = [
			["civ_spawn_5","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			
		];
	
		//if have reb license, only spawn here
		if(license_civ_pasaporteesp && playerSide == civilian) then {
		_return = [
					["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_5","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
					
				];
		};
		
		//if have reb license, only spawn here
		if(license_civ_pasaportemaroc && playerSide == civilian) then {
		_return = [
					["civ_spawn_2","Pirgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
					
				];
		};
		//if have reb license, only spawn here
		if(license_civ_rebel && playerSide == civilian) then {
		_return = [
					["reb_v_1","Zona Rebelde 1","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["reb_v_2","Zona Rebelde 2","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
					
					
				];
		};
		
		if(license_civ_pmc && playerSide == civilian) then {
		_return = [
					["pmc_1","Zona Pmc","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
				];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return set[count _return,[format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"]];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala 112","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Agios 112","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Athira 112","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;