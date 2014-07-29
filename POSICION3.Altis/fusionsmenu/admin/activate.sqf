waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["76561198073018581","76561198058129631","76561198115600821","76561198056350684"]) then {
;
act = player addaction [("<t color=""#0074E8"">" + ("Tools Menu") +"</t>"),"fusionsmenu\admin\tools.sqf","",5,false,true,"",""];

};
