#include <macro.h>
/*
	No Author Needed; it's a few default lines of code
*/
if(playerSide == civilian) exitWith {};
if(playerSide == west) then 
{
	if (uniform player == "U_Rangemaster") then {
		player setObjectTextureGlobal[0,"textures\guardia_civil_uniforme_ver.paa"];
	};

	if (uniform player == "U_B_CombatUniform_mcam_worn") then {
		player setObjectTextureGlobal[0,"textures\uei.jpg"];
	};
	
};

if(playerSide == east) then 
{

	if (uniform player == "U_O_OfficerUniform_ocamo") then {
		player setObjectTextureGlobal[0,"textures\gendarmes.jpg"];
	};
	
	if (uniform player == "U_O_CombatUniform_oucamo") then {
		player setObjectTextureGlobal[0,"textures\geoeast.jpg"];
	};
	
};

/*
if(playerSide == independent) then
{
	if (uniform player == "U_Rangemaster") then {
		player setObjectTextureGlobal[0,"textures\medics\medic_uniform.jpg"];
	};
	
	if((backpack player) == "B_Bergen_blk") then {
		(unitbackpack player) setObjectTextureGlobal[0,"textures\medics\bergen_medic.jpg"];
	};
};
*/

///backpack
////////////////
