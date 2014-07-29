#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"No eres policia!"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",7500],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,500],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"No eres policia!"};
			case (__GETC__(life_coplevel) < 2): {"No eres policia novato!"};
			default
			{
				["Novato Tienda",
					[
						["arifle_MX_F",nil,35000],
						["SMG_02_ACO_F",nil,30000],
						["MineDetector",nil,1000],
						["acc_flashlight",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["SmokeShell",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["30Rnd_65x39_caseless_mag",nil,130],
						["30Rnd_9x21_Mag",nil,250]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"No eres policia!"};
			case (__GETC__(life_coplevel) < 3): {"No eres sargento!"};
			default
			{
				["Sargento Tienda",
					[
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,100],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_MXC_Black_F",nil,32000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["srifle_DMR_01_F",nil,45000],
						["10Rnd_762x51_Mag",nil,200],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["optic_Aco",nil,1800],
						["optic_ACO_grn",nil,1800],
						["optic_SOS",nil,1800],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,1000],
						["SmokeShellOrange",nil,500],
						["SmokeShellPurple",nil,500],
						["SmokeShellRed",nil,500],
						["SmokeShellYellow",nil,500],
						["SmokeShell",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["ItemWatch",nil,450],
						["ItemMap",nil,250],
						["ItemGPS",nil,1000],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["Medikit",nil,1000],
						["Binocular",nil,450],
						["Rangefinder",nil,450],
						["NVGoggles",nil,2000]
					]
				];
			};
		};
	};

	case "cop_detective":
	{
		switch(true) do
		{
			case (playerSide != west): {"No eres policia!"};
			case (__GETC__(life_coplevel) < 4): {"No eres G.E.O.S!"};
			default
			{
				["GEOS Tienda",
					[
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,100],
						["hgun_PDW2000_F",nil,15000],
						["30Rnd_9x21_Mag",nil,100],
						["hgun_pistol_heavy_01_F",nil,5850],
						["11Rnd_45ACP_Mag",nil,85],
						["SMG_02_F",nil,20000],
						["30Rnd_9x21_Mag",nil,100],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_MXC_F",nil,32000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_TRG20_Holo_F",nil,33000],
						["30Rnd_556x45_Stanag",nil,200],
						["arifle_Katiba_F",nil,35000],
						["30Rnd_65x39_caseless_green",nil,200],
						["srifle_EBR_F",nil,35000],
						["20Rnd_762x51_Mag",nil,200],
						["srifle_DMR_01_F",nil,45000],
						["10Rnd_762x51_Mag",nil,200],
						["srifle_LRR_SOS_F",nil,75000],
						["7Rnd_408_Mag",nil,200],
						["muzzle_snds_B",nil,500],
						["optic_Nightstalker",nil,1200],
						["optic_NVS",nil,1200],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["optic_Aco",nil,1800],
						["optic_ACO_grn",nil,1800],
						["optic_SOS",nil,1800],
						["optic_DMS",nil,1800],
						["optic_LRPS",nil,1800],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,1000],
						["SmokeShell",nil,500],
						["SmokeShellGreen",nil,500],
						["SmokeShellOrange",nil,500],
						["SmokeShellPurple",nil,500],
						["SmokeShellRed",nil,500],
						["SmokeShellYellow",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["B_UavTerminal",nil,450],
						["ItemWatch",nil,450],
						["ItemMap",nil,250],
						["ItemGPS",nil,1000],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["Medikit",nil,1000],
						["Binocular",nil,450],
						["Rangefinder",nil,450],
						["NVGoggles",nil,2000],
						["launch_RPG32_F",nil,95000],
						["RPG32_F",nil,50000],
						["srifle_GM6_SOS_F",nil,90000],
						["5Rnd_127x108_Mag",nil,450],
						["LMG_Mk200_MRCO_F",nil,60000],
						["200Rnd_65x39_cased_Box",nil,500],
						["200Rnd_65x39_cased_Box_Tracer",nil,500],
						["muzzle_snds_H_MG",nil,500],
						["arifle_MX_GL_F",nil,55000],
						["3Rnd_HE_Grenade_shell",nil,500],
						["3Rnd_UGL_FlareCIR_F",nil,300],
						["arifle_MX_SW_F",nil,45000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,500],
						["100Rnd_65x39_caseless_mag",nil,500],
						["muzzle_snds_H",nil,500],
						["arifle_MXM_Hamr_pointer_F",nil,50000],
						["SMG_01_ACO_F",nil,15000],
						["30Rnd_45ACP_Mag_SMG_01",nil,200],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,200],
						["muzzle_snds_acp",nil,500],
						["LMG_Zafir_pointer_F",nil,65000],
                        ["150Rnd_762x51_Box_Tracer",nil,500],
						["150Rnd_762x51_Box",nil,500]					
						
					]
				];
			};
		};
	};

	case "cop_lieutenant":
	{
		switch(true) do
		{
			case (playerSide != west): {"No eres policia!"};
			case (__GETC__(life_coplevel) < 5): {"No eres Teniente!"};
			default
			{
				["Teniente Tienda",
					[
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,100],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_MXC_F",nil,32000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["srifle_GM6_F",nil,30000],
						["5Rnd_127x108_Mag",nil,200],
						["srifle_EBR_F",nil,35000],
						["20Rnd_762x51_Mag",nil,200],
						["srifle_DMR_01_F",nil,45000],
						["10Rnd_762x51_Mag",nil,200],
						["optic_Nightstalker",nil,1200],
						["optic_NVS",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["optic_Aco",nil,1800],
						["optic_ACO_grn",nil,1800],
						["optic_SOS",nil,1800],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,1000],
						["SmokeShell",nil,500],
						["SmokeShellGreen",nil,500],
						["SmokeShellOrange",nil,500],
						["SmokeShellPurple",nil,500],
						["SmokeShellRed",nil,500],
						["SmokeShellYellow",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["ItemWatch",nil,450],
						["ItemMap",nil,250],
						["ItemGPS",nil,1000],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["Medikit",nil,1000],
						["Binocular",nil,450],
						["Rangefinder",nil,450],
						["NVGoggles",nil,2000]
					]
				];
			};
		};
	};
	
	case "cop_captain":
	{
		switch(true) do
		{
			case (playerSide != west): {"No eres policia!"};
			case (__GETC__(life_coplevel) < 6): {"No eres Capitan!"};
			default
			{
				["Capitan Tienda",
					[
						["hgun_ACPC2_F",nil,0],
						["9Rnd_45ACP_Mag",nil,0],
						["hgun_PDW2000_F",nil,0],
						["30Rnd_9x21_Mag",nil,0],
						["hgun_pistol_heavy_01_F",nil,0],
						["11Rnd_45ACP_Mag",nil,0],
						["SMG_02_F",nil,0],
						["30Rnd_9x21_Mag",nil,0],
						["arifle_MX_F",nil,0],
						["30Rnd_65x39_caseless_mag",nil,0],
						["arifle_MXC_F",nil,0],
						["30Rnd_65x39_caseless_mag",nil,0],
						["arifle_TRG20_Holo_F",nil,0],
						["30Rnd_556x45_Stanag",nil,0],
						["arifle_Katiba_F",nil,0],
						["30Rnd_65x39_caseless_green",nil,0],
						["srifle_EBR_F",nil,0],
						["20Rnd_762x51_Mag",nil,0],
						["srifle_DMR_01_F",nil,0],
						["10Rnd_762x51_Mag",nil,0],
						["srifle_LRR_SOS_F",nil,0],
						["7Rnd_408_Mag",nil,0],
						["muzzle_snds_B",nil,0],
						["optic_Nightstalker",nil,0],
						["optic_NVS",nil,0],
						["optic_Holosight",nil,0],
						["optic_Arco",nil,0],
						["optic_MRCO",nil,0],
						["optic_Hamr",nil,0],
						["optic_Aco",nil,0],
						["optic_ACO_grn",nil,0],
						["optic_SOS",nil,0],
						["optic_DMS",nil,0],
						["optic_LRPS",nil,0],
						["acc_flashlight",nil,0],
						["acc_pointer_IR",nil,0],
						["launch_RPG32_F",nil,0],
						["RPG32_F",nil,0],
						["srifle_GM6_SOS_F",nil,0],
						["5Rnd_127x108_Mag",nil,0],
						["LMG_Mk200_MRCO_F",nil,0],
						["200Rnd_65x39_cased_Box",nil,0],
						["200Rnd_65x39_cased_Box_Tracer",nil,0],
						["muzzle_snds_H_MG",nil,0],
						["arifle_MX_GL_F",nil,0],
						["3Rnd_HE_Grenade_shell",nil,0],
						["3Rnd_UGL_FlareCIR_F",nil,0],
						["arifle_MX_SW_F",nil,0],
						["100Rnd_65x39_caseless_mag_Tracer",nil,0],
						["100Rnd_65x39_caseless_mag",nil,0],
						["muzzle_snds_H",nil,0],
						["arifle_MXM_Hamr_pointer_F",nil,0],
						["SMG_01_ACO_F",nil,0],
						["30Rnd_45ACP_Mag_SMG_01",nil,0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,0],
						["muzzle_snds_acp",nil,0],
						["LMG_Zafir_pointer_F",nil,0],
                        ["150Rnd_762x51_Box_Tracer",nil,0],
						["150Rnd_762x51_Box",nil,0],
						["MiniGrenade",nil,0],
						["SmokeShell",nil,0],
						["SmokeShellGreen",nil,0],
						["SmokeShellOrange",nil,0],
						["SmokeShellPurple",nil,0],
						["SmokeShellRed",nil,0],
						["SmokeShellYellow",nil,0],
						["SmokeShellBlue",nil,0],
						["Chemlight_red",nil,0],
						["Chemlight_yellow",nil,0],
						["Chemlight_green",nil,0],
						["Chemlight_blue",nil,0],
						["B_UavTerminal",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemGPS",nil,0],
						["ToolKit",nil,0],
						["FirstAidKit",nil,0],
						["Medikit",nil,0],
						["Binocular",nil,0],
						["Rangefinder",nil,0],
						["NVGoggles",nil,0]
					]	
				];
			};
		};
	};

	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"No eres policia!"};
			case (!license_civ_rebel): {"No tienes entrenamiento rebelde!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[       
                        ["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_Pistol_heavy_02_Yorris_F",nil,15000],
						["hgun_PDW2000_F",nil,20000],
						["SMG_02_ACO_F",nil,30000],
						["arifle_SDAR_F",nil,30000],
						["20Rnd_556x45_UW_mag",nil,100],
						["30Rnd_556x45_Stanag",nil,100],
						["16Rnd_9x21_Mag",nil,100],
						["9Rnd_45ACP_Mag",nil,100],
						["6Rnd_45ACP_Cylinder",nil,150],
						["30Rnd_9x21_Mag",nil,150],
						["30Rnd_9x21_Mag",nil,150],
						["arifle_TRG20_F",nil,25000],
						["arifle_Katiba_F",nil,30000],
						["srifle_EBR_ARCO_pointer_F",nil,70000],
						["srifle_EBR_SOS_F",nil,80000],
						["srifle_DMR_01_F",nil,65000],
						["arifle_TRG21_F",nil,25000],
						["LMG_Zafir_pointer_F",nil,200000],
						["arifle_Katiba_GL_ARCO_pointer_F",nil,125000],
						["1Rnd_HE_Grenade_shell",nil,5000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["optic_Arco",nil,2500],
						["optic_DMS",nil,7000],
						["optic_NVS",nil,8000],
						["optic_SOS",nil,6000],
						["optic_MRCO",nil,2500],
						["Rangefinder",nil,100],
						["ItemGPS",nil,100],
						["ItemCompass",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,550],
						["NVGoggles",nil,2000],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["30Rnd_65x39_caseless_green",nil,275],
						["10Rnd_762x51_Mag",nil,2500],
						["20Rnd_762x51_Mag",nil,4800],
						["150Rnd_762x51_Box_Tracer",nil,2400],
						["150Rnd_762x51_Box",nil,2200],
						["srifle_LRR_SOS_F",nil,475000],
						["7Rnd_408_Mag",nil,2500],
						["launch_RPG32_F",nil,450000],
						["RPG32_F",nil,150000],
						["DemoCharge_Remote_Mag","C4",450000]
						
					]
				];
			};
		};
	};
	
	case "pmc":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"No eres policia!"};
			case (!license_civ_pmc): {"No tienes entrenamiento PMC!"};
			default
			{
				["PMC Tienda",
					[
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,100],
						["hgun_PDW2000_F",nil,25000],
						["30Rnd_9x21_Mag",nil,100],
						["hgun_pistol_heavy_01_F",nil,8850],
						["11Rnd_45ACP_Mag",nil,100],
						["SMG_02_F",nil,20000],
						["30Rnd_9x21_Mag",nil,100],
						["arifle_MX_F",nil,45000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_MXC_F",nil,48000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_TRG20_Holo_F",nil,25000],
						["30Rnd_556x45_Stanag",nil,200],
						["arifle_Katiba_F",nil,30000],
						["30Rnd_65x39_caseless_green",nil,200],
						["srifle_EBR_F",nil,70000],
						["20Rnd_762x51_Mag",nil,200],
						["srifle_DMR_01_F",nil,65000],
						["10Rnd_762x51_Mag",nil,200],
						["srifle_LRR_SOS_F",nil,475000],
						["7Rnd_408_Mag",nil,2000],
						["muzzle_snds_B",nil,500],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["optic_Aco",nil,1800],
						["optic_ACO_grn",nil,1800],
						["optic_SOS",nil,1800],
						["optic_DMS",nil,1800],
						["optic_LRPS",nil,100000],
                        ["optic_Nightstalker",nil,95000],
						["optic_tws",nil,85000],
						["optic_tws_mg",nil,87000],
                        ["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,1000],
						["SmokeShell",nil,500],
						["SmokeShellGreen",nil,500],
						["SmokeShellOrange",nil,500],
						["SmokeShellPurple",nil,500],
						["SmokeShellRed",nil,500],
						["SmokeShellYellow",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["B_UavTerminal",nil,15000],
						["ItemWatch",nil,15000],
						["ItemMap",nil,250],
						["ItemGPS",nil,1000],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["Medikit",nil,1000],
						["Binocular",nil,450],
						["Rangefinder",nil,450],
						["NVGoggles",nil,2000],
						["launch_RPG32_F",nil,450000],
						["RPG32_F",nil,150000],
						["srifle_GM6_SOS_F",nil,600000],
						["5Rnd_127x108_Mag",nil,2500],
						["LMG_Mk200_MRCO_F",nil,180000],
						["200Rnd_65x39_cased_Box",nil,1500],
						["200Rnd_65x39_cased_Box_Tracer",nil,1500],
						["muzzle_snds_H_MG",nil,500],
						["arifle_MX_GL_F",nil,155000],
						["3Rnd_HE_Grenade_shell",nil,15000],
						["3Rnd_UGL_FlareCIR_F",nil,6500],
						["arifle_MX_SW_F",nil,175000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,1500],
						["100Rnd_65x39_caseless_mag",nil,1500],
						["muzzle_snds_H",nil,500],
						["arifle_MXM_Hamr_pointer_F",nil,76000],
						["SMG_01_ACO_F",nil,35000],
						["30Rnd_45ACP_Mag_SMG_01",nil,200],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,200],
						["muzzle_snds_acp",nil,500],
						["LMG_Zafir_pointer_F",nil,200000],
                        ["150Rnd_762x51_Box_Tracer",nil,2500],
						["150Rnd_762x51_Box",nil,2500],					
						["DemoCharge_Remote_Mag","C4",450000]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"No eres policia!"};
			case (!license_civ_gun): {"No tienes la licencia de armas!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_Pistol_heavy_02_Yorris_F",nil,15000],
						["hgun_PDW2000_F",nil,20000],
						["SMG_02_ACO_F",nil,30000],
						["arifle_SDAR_F",nil,30000],
						["optic_ACO_grn_smg",nil,2500],
						["20Rnd_556x45_UW_mag",nil,100],
						["30Rnd_556x45_Stanag",nil,100],
						["16Rnd_9x21_Mag",nil,100],
						["9Rnd_45ACP_Mag",nil,100],
						["6Rnd_45ACP_Cylinder",nil,150],
						["30Rnd_9x21_Mag",nil,150],
						["30Rnd_9x21_Mag",nil,150]
					]
				];
			};
		};
	};
	
	case "donador":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"No eres policia!"};
			case (!license_civ_donador): {"Donador nivel 1!"};
			default
			{
				["Donador LVL1",
					[
	                    ["hgun_Rook40_F",nil,3500],
						["hgun_ACPC2_F",nil,5500],
						["hgun_PDW2000_F",nil,10000],
						["hgun_Pistol_heavy_01_MRD_F",nil,10000],
						["11Rnd_45ACP_Mag",nil,25],
						["hgun_Pistol_heavy_02_Yorris_F",nil,10000],
						["arifle_TRG20_F",nil,12000],
						["30Rnd_556x45_Stanag",nil,25],
						["SMG_01_ACO_F",nil,15000],
						["30Rnd_45ACP_Mag_SMG_01",nil,25],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,25],
						["optic_ACO_grn_smg",nil,750],
						["optic_Holosight",nil,750],
						["optic_Arco",nil,1000],
						["optic_MRCO",nil,1000],
		                ["optic_Hamr",nil,1000],
						["FirstAidKit",nil,250],
						["ToolKit",nil,250],
						["itemgps",nil,50],
						["Rangefinder",nil,100],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
						]
				];
			};		
		};	
	};

	case "donador2":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"No eres policia!"};
			case (!license_civ_donador): {"Donador nivel 2!"};
			default
			{
				["Donador LVL2",
					[
						["hgun_Rook40_F",nil,3500],
						["hgun_ACPC2_F",nil,5500],
						["hgun_PDW2000_F",nil,10000],
						["hgun_Pistol_heavy_01_MRD_F",nil,10000],
						["11Rnd_45ACP_Mag",nil,25],
						["hgun_Pistol_heavy_02_Yorris_F",nil,10000],
						["arifle_TRG20_F",nil,12000],
						["30Rnd_556x45_Stanag",nil,250],
						["SMG_01_ACO_F",nil,15000],
						["30Rnd_45ACP_Mag_SMG_01",nil,250],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,250],
						["arifle_Katiba_F",nil,16000],
						["30Rnd_65x39_caseless_green",nil,250],
						["srifle_EBR_ARCO_pointer_F",nil,45000],
						["srifle_EBR_SOS_F",nil,50000],
						["srifle_DMR_01_F",nil,35000],
						["10Rnd_762x51_Mag",nil,1500],
						["20Rnd_762x51_Mag",nil,1600],
						["optic_ACO_grn_smg",nil,750],
						["optic_Holosight",nil,750],
						["optic_Arco",nil,1000],
						["optic_MRCO",nil,1000],
		                ["optic_Hamr",nil,1000],
                        ["optic_DMS",nil,2500],
						["optic_NVS",nil,2500],
						["optic_SOS",nil,2500],
						["FirstAidKit",nil,250],
						["ToolKit",nil,250],
						["itemgps",nil,50],
						["Rangefinder",nil,100],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
		
			};	
		};
	};
	
	case "donador3":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"No eres policia!"};
			case (!license_civ_donador): {"Donador nivel 3!"};
			default
			{
				["Donador LVL3",
					[
						["hgun_Rook40_F",nil,3500],
						["hgun_ACPC2_F",nil,5500],
						["hgun_PDW2000_F",nil,10000],
						["hgun_Pistol_heavy_01_MRD_F",nil,10000],
						["11Rnd_45ACP_Mag",nil,25],
						["hgun_Pistol_heavy_02_Yorris_F",nil,10000],
						["arifle_TRG20_F",nil,12000],
						["30Rnd_556x45_Stanag",nil,250],
						["SMG_01_ACO_F",nil,15000],
						["30Rnd_45ACP_Mag_SMG_01",nil,250],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,250],
						["arifle_Katiba_F",nil,16000],
						["30Rnd_65x39_caseless_green",nil,250],
						["srifle_EBR_ARCO_pointer_F",nil,45000],
						["srifle_EBR_SOS_F",nil,50000],
						["srifle_DMR_01_F",nil,35000],
						["10Rnd_762x51_Mag",nil,1500],
						["20Rnd_762x51_Mag",nil,1600],
						["LMG_Zafir_pointer_F",nil,100000],
						["150Rnd_762x51_Box_Tracer",nil,1600],
						["150Rnd_762x51_Box",nil,1600],
						["srifle_LRR_SOS_F",nil,40000],
						["7Rnd_408_Mag",nil,1800],
						["launch_RPG32_F",nil,350000],
						["RPG32_F",nil,50000],
						["optic_ACO_grn_smg",nil,750],
						["optic_Holosight",nil,750],
						["optic_Arco",nil,1000],
						["optic_MRCO",nil,1000],
		                ["optic_Hamr",nil,1000],
                        ["optic_DMS",nil,2500],
						["optic_NVS",nil,2500],
						["optic_SOS",nil,2500],
						["FirstAidKit",nil,250],
						["ToolKit",nil,250],
						["itemgps",nil,50],
						["Rangefinder",nil,100],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,4500],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300],
				["ItemWatch",nil,1],
				["ItemMap",nil,0]
			]
		];
	};
	
	
// **********************************************************COP EAST******************************
	
	
	case "copeast_basic":
	{
		switch(true) do
		{
			case (playerSide != east): {"No eres policia!"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",7500],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,500],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125]
					]
				];
			};
		};
	};
	
	
	case "copeast_patrol":
	{
		switch(true) do
		{
			case (playerSide != east): {"No eres policia!"};
			case (__GETC__(life_coplevel) < 1): {"No eres policia novato!"};
			default
			{
				["Novato Tienda",
					[
						["arifle_MX_F",nil,35000],
						["SMG_02_ACO_F",nil,30000],
						["MineDetector",nil,1000],
						["acc_flashlight",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["SmokeShell",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["30Rnd_65x39_caseless_mag",nil,130],
						["30Rnd_9x21_Mag",nil,250]
					]
				];
			};
		};
	};
	
	case "copeast_detective":
	{
		switch(true) do
		{
			case (playerSide != east): {"No eres policia!"};
			case (__GETC__(life_coplevel) < 4): {"No eres G.E.O.S!"};
			default
			{
				["GEOS Tienda",
					[
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,100],
						["hgun_PDW2000_F",nil,15000],
						["30Rnd_9x21_Mag",nil,100],
						["hgun_pistol_heavy_01_F",nil,5850],
						["11Rnd_45ACP_Mag",nil,85],
						["SMG_02_F",nil,20000],
						["30Rnd_9x21_Mag",nil,100],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_MXC_F",nil,32000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_TRG20_Holo_F",nil,33000],
						["30Rnd_556x45_Stanag",nil,200],
						["arifle_Katiba_F",nil,35000],
						["30Rnd_65x39_caseless_green",nil,200],
						["srifle_EBR_F",nil,35000],
						["20Rnd_762x51_Mag",nil,200],
						["srifle_DMR_01_F",nil,45000],
						["10Rnd_762x51_Mag",nil,200],
						["srifle_LRR_SOS_F",nil,75000],
						["7Rnd_408_Mag",nil,200],
						["muzzle_snds_B",nil,500],
						["optic_Nightstalker",nil,1200],
						["optic_NVS",nil,1200],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["optic_Aco",nil,1800],
						["optic_ACO_grn",nil,1800],
						["optic_SOS",nil,1800],
						["optic_DMS",nil,1800],
						["optic_LRPS",nil,1800],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,1000],
						["SmokeShell",nil,500],
						["SmokeShellGreen",nil,500],
						["SmokeShellOrange",nil,500],
						["SmokeShellPurple",nil,500],
						["SmokeShellRed",nil,500],
						["SmokeShellYellow",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["B_UavTerminal",nil,450],
						["ItemWatch",nil,450],
						["ItemMap",nil,250],
						["ItemGPS",nil,1000],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["Medikit",nil,1000],
						["Binocular",nil,450],
						["Rangefinder",nil,450],
						["NVGoggles",nil,2000],
						["launch_RPG32_F",nil,95000],
						["RPG32_F",nil,50000],
						["srifle_GM6_SOS_F",nil,90000],
						["5Rnd_127x108_Mag",nil,450],
						["LMG_Mk200_MRCO_F",nil,60000],
						["200Rnd_65x39_cased_Box",nil,500],
						["200Rnd_65x39_cased_Box_Tracer",nil,500],
						["muzzle_snds_H_MG",nil,500],
						["arifle_MX_GL_F",nil,55000],
						["3Rnd_HE_Grenade_shell",nil,500],
						["3Rnd_UGL_FlareCIR_F",nil,300],
						["arifle_MX_SW_F",nil,45000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,500],
						["100Rnd_65x39_caseless_mag",nil,500],
						["muzzle_snds_H",nil,500],
						["arifle_MXM_Hamr_pointer_F",nil,50000],
						["SMG_01_ACO_F",nil,15000],
						["30Rnd_45ACP_Mag_SMG_01",nil,200],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,200],
						["muzzle_snds_acp",nil,500],
						["LMG_Zafir_pointer_F",nil,65000],
                        ["150Rnd_762x51_Box_Tracer",nil,500],
						["150Rnd_762x51_Box",nil,500]					
						
					]
				];
			};
		};
	};
	
};