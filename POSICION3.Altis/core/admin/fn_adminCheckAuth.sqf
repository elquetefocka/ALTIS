/*

    Check if player can use admin commands and calls dialog if not
    
    Returns boolean

*/
disableSerialization;

private[];


if(serverCommandAvailable "#kick") exitWith
{
    systemChat "Usted está autenticado.";
    true;
};

//No auth here; check
if(!(createDialog "admin_pw")) exitWith {};


false;


