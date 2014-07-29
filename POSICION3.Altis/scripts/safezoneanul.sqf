 Sleep 10;
			 //[[2,format["%1 AHORA DEBERAS ESPERAR 2 MINUTOS COMO CASTIGO", name player]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
			 hint format ["%1 AHORA DEBERAS ESPERAR 2 MINUTOS COMO CASTIGO", name player];
			 Sleep 50;
			 hint "Te queda 1 minuto";
			 Sleep 30;
			 hint "Te queda 30 segundo";
			 Sleep 30;
			 player setdamage 0.05;
			 player setfatigue 0.05;	
			 Sleep 110;
			 deleteMarker "Marker200"; // by ehno delete maker