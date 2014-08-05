/*
    @Version: 0.2
    @Author: =IFD= Cryptonat
    @Edited: 4/4/14
    
    Description:
    Saves the player's gear every 10 minutes.
*/

while {true} do {
    sleep 600;
    if (alive player) then {
        if (playerside == west) then {
        [] call SOCK_fnc_updateRequest; //call our silent sync.
        [] call life_fnc_saveGear;  
		//this is what allows the cop gear to save
        hint "Juego AutoSalvado."
    } else {
    [] call SOCK_fnc_updateRequest; //call our silent sync.
	[] call life_fnc_saveGearcopeast;
    hint "Juego AutoSalvado."
    };
    };
}; 




// < ----  OLD CODE BELOW ---- >
/*
	@Author: =IFD= Cryptonat
	@Created: 2/22/14
	
	Description:
	Saves the player's gear every 10 minutes.

while {true} do {    //Tells the function to continually loop.
	sleep 600;   //Sleep for 600 seconds/10 minutes
	if (alive player) then   //If the player is alive, then do this
        {
		[false] call life_fnc_sessionUpdate;  //Same function used by the "Sync" button
		hint "Game Autosaved."   //Just to tell you that the game is saving
	};
};
*/ 