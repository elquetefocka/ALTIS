enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
//[] execVM "fusionsmenu\admin\loop.sqf";
//[] execVM "admintool\exec.sqf"; 
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf"; 
//[] execVM "scripts\anticheat.sqf";
[] execVM "scripts\safezone.sqf";
[] execVM "fusionsmenu\admin\loop.sqf";

StartProgress = true;
_igiload = execVM "IgiLoad\IgiLoadInit.sqf";
call compile preprocessFile "UI\HUD.sqf";
[] spawn ICE_HUD; 
