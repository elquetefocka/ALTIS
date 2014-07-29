#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_O_OfficerUniform_ocamo","Cop Uniform",0]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["U_IG_Guerilla2_3",nil,0]];
			_ret set[count _ret,["U_B_Wetsuit",nil,0]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["U_B_CombatUniform_mcam","Geo Uniform",0]];
			_ret set[count _ret,["U_I_GhillieSuit","Ghillie",0]];
			
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["U_I_OfficerUniform",nil,0]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["U_I_G_Story_Protagonist_F",nil,0]];
			_ret set[count _ret,["U_B_CTRG_1",nil,0]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_ret set[count _ret,["U_B_SpecopsUniform_sgg",nil,0]];
			_ret set[count _ret,["U_B_GhillieSuit","GhillieComisario",0]];
		};
		[] call life_fnc_setUniformTexture;
	};
	
	
	//Hats
	case 1:
	{
		_ret set[count _ret,["H_Beret_brn_SF","Boina",0]];		
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["H_Booniehat_mcamo",nil,0]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["H_HelmetB_light_black","Casco Geo",0]];
			_ret set[count _ret,["H_HelmetB",nil,0]];			 
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["H_MilCap_mcamo",nil,0]];
			_ret set[count _ret,["H_MilCap_oucamo",nil,0]];
			
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			
			
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55],
			["G_Diving",nil,100]
		];
	};
	
	//Vest
	case 3:
	{
		_ret set[count _ret,["V_Rangemaster_belt",nil,0]];
		//agente
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret set[count _ret,["V_PlateCarrier1_blk",nil,0]];
			_ret set[count _ret,["V_RebreatherIR",nil,0]];
		};	
		
		//oficial hasta teniente
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["V_PlateCarrier3_rgr",nil,0]];
			_ret set[count _ret,["V_Chestrig_blk",nil,0]];
			_ret set[count _ret,["V_TacVest_blk",nil,0]];	
			_ret set[count _ret,["V_TacVestIR_blk",nil,0]];	
			_ret set[count _ret,["V_Press_F",nil,0]];				
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,0],
			["B_FieldPack_cbr",nil,0],
			["B_AssaultPack_cbr",nil,0],
			["B_Bergen_sgg",nil,0],
			["B_Parachute",nil,0],
			["B_Carryall_cbr",nil,0],
			["B_UAV_01_backpack_F","UAV MUST BE IN SWAT",50000]
		];
	};
};

_ret;
